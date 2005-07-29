using System;
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
    public class Computer_Team : Standard_Team
    {
        public Computer_Team()
        {
            BattleshipTest.acceptMessage(this.ToString(), "Constructed", Colors.Magenta);
            this.Players = new Player[2];
            this.Players[0] = new Computer();
            this.Players[1] = new Computer();
            Console.WriteLine("Created players");
        }

        public Computer_Team(string x)
        {
            BattleshipTest.acceptMessage(this.ToString(), "Constructed", Colors.Magenta);
            this.Players = new Player[2];


            Console.WriteLine("Created players");
        }

        public Computer_Team(System.Collections.Generic.List<string> computerAlgorithmTypes)
        {
            BattleshipTest.acceptMessage(this.ToString(), "Constructed", Colors.Magenta);
            this.Players = new Player[2];
            this.Players[0] = new Computer(computerAlgorithmTypes[0]);
            this.Players[1] = new Computer(computerAlgorithmTypes[1]);


            Console.WriteLine("Created players");
        }

        public override I_Player[] GetPlayers()
        {
            Console.WriteLine(this.Players.Length);
            return this.Players;
        }
    }

}
