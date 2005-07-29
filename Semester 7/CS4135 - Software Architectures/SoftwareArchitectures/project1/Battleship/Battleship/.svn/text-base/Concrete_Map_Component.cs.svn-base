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
    public class Concrete_Map_Component : I_Map_Component
    {
        protected I_Ship[] allShips;
        protected int mapBoundary;
        protected I_Map_Component[] obstacleCoordinates;

        public Concrete_Map_Component()
        {
            BattleshipTest.acceptMessage(this.ToString(), "Constructed", Colors.Brown);
        }

        public void Populate_Map()
        {
            BattleshipTest.acceptMessage(this.ToString(), "Populated", Colors.Brown);
        }

        public I_Ship[] getAllShips()
        {
            return this.allShips;

        }

        public int getMapBoundary()
        {
            return this.mapBoundary;
        }

        public I_Map_Component[] getObstacleCoordinates()
        {
            return this.obstacleCoordinates;
        }

    }

}
