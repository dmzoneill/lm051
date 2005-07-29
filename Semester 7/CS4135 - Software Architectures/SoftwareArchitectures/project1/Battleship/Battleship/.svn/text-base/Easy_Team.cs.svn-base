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
    public class Easy_Team : Standard_Team
    {
        public Easy_Team()
        {
            BattleshipTest.acceptMessage(this.ToString(), "Constructed", Colors.Magenta);
            this.Players = new Player[ 2 ];
            this.Players[ 0 ] = new Easy_Player();
            this.Players[ 1 ] = new Easy_Player();
            Console.WriteLine( "Created players" );
        }

    }

}
