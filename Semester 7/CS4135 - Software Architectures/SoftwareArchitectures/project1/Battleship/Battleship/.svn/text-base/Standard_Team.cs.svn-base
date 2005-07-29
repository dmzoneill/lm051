using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using Battleship.GameEngine.Boundary;
using Battleship.GameEngine.Gamepiece;
using Battleship.GameEngine.Maze;
using Battleship.GameEngine.Participant;
using Battleship.GameEngine.Group;
using Battleship.GameEngine.User_Interface;
using System.Windows.Media;
using System.Windows;

namespace Battleship.GameEngine.Group
{
    public class Standard_Team : Team
    {
        protected Game game;

        public Standard_Team()
        {
            BattleshipTest.acceptMessage(this.ToString(), "Constructed", Colors.Magenta);
        }

        public Standard_Team( String type )
        {
            BattleshipTest.acceptMessage(this.ToString(), "Constructed", Colors.Magenta);
        }

        public Standard_Team( Game game )
        {
            BattleshipTest.acceptMessage(this.ToString(), "Constructed", Colors.Magenta);
            this.game = game;
        }

        public override I_Team CreateTeams(
            string typeOfTeam, List<string> computerAlgorithmTypes)
        {

            switch( typeOfTeam )
            {
                default:
                    return this;

                case "Easy":
                    return new Easy_Team();

                case "Hard":
                    return new Hard_Team();

                case "Computer":
                    // ** Hard Coded Passing of Game
                    return new Computer_Team(computerAlgorithmTypes);
            }
        }

        public override I_Player[] GetPlayers()
        {
            Console.WriteLine( "Called" );
            Console.WriteLine( this.Players.Length );
            return this.Players;
        }

        public override void SetPlayers( I_Player[] players )
        {
            this.Players = players;
        }

        public override int GetNumPlayers()
        {
            return this.Players.Length;
        }

        public override Color GetColor()
        {
            return this.color;
        }

        public override void SetColor( Color color )
        {
            this.color = color;
        }
    }
}
