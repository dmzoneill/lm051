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
    public abstract class Map_Decorator : I_Map_Component
    {
        protected I_Map_Component map;
        protected I_Ship[] allShips;
        protected int mapBoundary;
        protected I_Map_Component[] obstacleCoordinates;

        public Map_Decorator()
        {
            BattleshipTest.acceptMessage(this.ToString(), "Constructed", Colors.Brown);
        }

        public Map_Decorator( I_Map_Component component )
        {
            BattleshipTest.acceptMessage(this.ToString(), "Constructed", Colors.Brown);
            this.map = component;
        }

        public virtual void Populate_Map()
        {
            if (map != null)
            {
                map.Populate_Map();
            }
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
