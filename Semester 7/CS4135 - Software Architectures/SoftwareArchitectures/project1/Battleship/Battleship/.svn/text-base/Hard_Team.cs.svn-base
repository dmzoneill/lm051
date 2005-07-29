using System;
using Battleship.GameEngine.Boundary;
using Battleship.GameEngine.Gamepiece;
using Battleship.GameEngine.Maze;
using Battleship.GameEngine.Participant;
using Battleship.GameEngine.Group;
using Battleship.GameEngine.User_Interface;
using System.Windows.Media;

namespace Battleship.GameEngine.Group
{
    public class Hard_Team : Standard_Team
    {
        public Hard_Team()
        {
            BattleshipTest.acceptMessage(this.ToString(), "Constructed", Colors.Magenta);
            this.Players = new Player[ 2 ];
            this.Players[ 0 ] = new Hard_Player();
            this.Players[ 1 ] = new Hard_Player();
            Console.WriteLine( "Created players" );
        }
    }

}
