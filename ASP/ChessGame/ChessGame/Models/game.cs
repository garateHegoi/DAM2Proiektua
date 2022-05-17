using System.ComponentModel.DataAnnotations;

namespace ChessGame.Models
{
    public class game
    {
        internal int count;

        [Key] public int id { get; set; }
        public int num { get; set; }
        public int time { get; set; }
        public string player1 { get; set; }
        public string player2 { get; set; }
        public string winner { get; set; }
    }
}
