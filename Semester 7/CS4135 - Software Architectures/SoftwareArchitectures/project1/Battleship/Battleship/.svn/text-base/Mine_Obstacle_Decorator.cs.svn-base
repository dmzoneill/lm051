using System;
using Battleship.GameEngine.Boundary;
using Battleship.GameEngine.Gamepiece;
using Battleship.GameEngine.Maze;
using Battleship.GameEngine.Participant;
using Battleship.GameEngine.Group;
using Battleship.GameEngine.User_Interface;
using System.Windows.Media;

namespace Battleship.GameEngine.Maze
{
    public class Mine_Obstacle_Decorator : Map_Decorator
    {
        public Mine_Obstacle_Decorator(I_Map_Component comp) : base(comp)
        {
        }

        public override void Populate_Map()
        {
            base.Populate_Map();

            BattleshipTest.acceptMessage(this.ToString(), 
                "Populated with mines.", Colors.Brown);
        }

    }

}
