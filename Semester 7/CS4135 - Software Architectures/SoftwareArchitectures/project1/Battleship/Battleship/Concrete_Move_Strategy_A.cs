using System;
using System.Windows.Media;

using Battleship.GameEngine.Boundary;
using Battleship.GameEngine.Gamepiece;
using Battleship.GameEngine.Maze;
using Battleship.GameEngine.Participant;
using Battleship.GameEngine.Group;
using Battleship.GameEngine.User_Interface;


namespace Battleship.GameEngine.Participant
{
    public class Concrete_Move_Strategy_A : Move_Strategy
    {
        public Concrete_Move_Strategy_A()
        {
            BattleshipTest.acceptMessage(this.ToString(), 
                "Constructing Evolutionary Alg", Colors.Blue);
        }

        public override void AlgorithmInterface()
        {
        }
    }

}
