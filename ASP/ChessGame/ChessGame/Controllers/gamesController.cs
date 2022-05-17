using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using ChessGame.Data;
using ChessGame.Models;
using System.Data.Common;

namespace ChessGame.Controllers
{
    public class gamesController : Controller
    {
        private readonly ApplicationDbContext _context;

        public gamesController(ApplicationDbContext context)
        {
            _context = context;
        }

        // GET: games
        public async Task<IActionResult> Index()
        {
            if (User.Identity.IsAuthenticated)
            {
                return View(await _context.game.ToListAsync());
            }
            else
            {
                return RedirectToAction("Index", "Home", new { area = "" });
            }


        }


        [HttpGet]
        public async Task<IActionResult> UserHis(string player)
        {
            if (User.Identity.IsAuthenticated)
            {
                if (player != null)
                {
                    ViewData["GetUserDetails"] = player;
                    var userquery = from x in _context.game select x;
                    if (!String.IsNullOrEmpty(player))
                    {
                        userquery = userquery.Where(x => x.player1.Contains(player) || x.player2.Contains(player));
                    }
                    return View(await userquery.AsNoTracking().ToListAsync());
                }
                else
                {
                    player = User.Identity.Name;
                    var userquery = from x in _context.game select x;
                    if (!String.IsNullOrEmpty(player))
                    {
                        userquery = userquery.Where(x => x.player1.Contains(player) || x.player2.Contains(player));
                    }
                    return View(await userquery.AsNoTracking().ToListAsync());
                }
            }
            else
            {
                return RedirectToAction("Index", "Home", new { area = "" });
            }
        }

        public async Task<IActionResult> Ranking()
        {
            
            if (User.Identity.IsAuthenticated)
            {
            List<game> a = new List<game>();
            var conn = _context.Database.GetDbConnection();
            try
            {
                await conn.OpenAsync();
                using (var command = conn.CreateCommand())
                {
                    string query = "select winner, count(*) as NºWins FROM game GROUP BY winner";
                    command.CommandText = query;
                    DbDataReader reader = await command.ExecuteReaderAsync();

                    if (reader.HasRows)
                    {
                        while (await reader.ReadAsync())
                        {
                            var row = new game { winner = reader.GetString(0), count = reader.GetInt32(1) };
                            a.Add(row);
                        }
                    }
                    reader.Dispose();
                }
            }
            finally
            {
                conn.Close();
            }
            return View(a);

        }
            else
            {
                return RedirectToAction("Index", "Home", new { area = "" });
            }
        }



        // GET: games/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null || _context.game == null)
            {
                return NotFound();
            }

            var game = await _context.game
                .FirstOrDefaultAsync(m => m.id == id);
            if (game == null)
            {
                return NotFound();
            }

            return View(game);
        }

        // GET: games/Create
        public IActionResult Create()
        {
            return View();
        }

        // POST: games/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("id,num,time,player1,player2,winner")] game game)
        {
            if (ModelState.IsValid)
            {
                _context.Add(game);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            return View(game);
        }

        // GET: games/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null || _context.game == null)
            {
                return NotFound();
            }

            var game = await _context.game.FindAsync(id);
            if (game == null)
            {
                return NotFound();
            }
            return View(game);
        }

        // POST: games/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("id,num,time,player1,player2,winner")] game game)
        {
            if (id != game.id)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(game);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!gameExists(game.id))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }
                return RedirectToAction(nameof(Index));
            }
            return View(game);
        }

        // GET: games/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null || _context.game == null)
            {
                return NotFound();
            }

            var game = await _context.game
                .FirstOrDefaultAsync(m => m.id == id);
            if (game == null)
            {
                return NotFound();
            }

            return View(game);
        }

        // POST: games/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            if (_context.game == null)
            {
                return Problem("Entity set 'ApplicationDbContext.game'  is null.");
            }
            var game = await _context.game.FindAsync(id);
            if (game != null)
            {
                _context.game.Remove(game);
            }

            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool gameExists(int id)
        {
            return (_context.game?.Any(e => e.id == id)).GetValueOrDefault();
        }
    }
}
