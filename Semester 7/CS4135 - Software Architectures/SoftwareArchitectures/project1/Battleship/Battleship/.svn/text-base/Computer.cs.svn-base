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
    public class Computer : Player
    {
        private string moveStrategyName;
        private Move_Strategy moveStrategy;

        public Computer()
        {
            BattleshipTest.acceptMessage(this.ToString(), "Constructed", Colors.Magenta);
        }

        public Computer(string moveStrategyName)
        {
            this.moveStrategyName = moveStrategyName;
            setMoveStrategy();
        }

        private void setMoveStrategy()
        {
            switch (moveStrategyName)
            {
                default:
                    moveStrategy = new Evolutionary_Move_Strategy();
                    break;

                case ("Evolutionary Algorithm"):
                    moveStrategy = new Evolutionary_Move_Strategy();
                    break;

                case ("Reinforcement Algorithm"):
                    moveStrategy = new RL_Move_Strategy();
                    break;
            }
        }

        public override void makeMove()
        {
            this.moveStrategy.AlgorithmInterface();
        }

    }

}
