using System;
using Battleship.GameEngine.Boundary;
using Battleship.GameEngine.Gamepiece;
using Battleship.GameEngine.Maze;
using Battleship.GameEngine.Participant;
using Battleship.GameEngine.Group;
using Battleship.GameEngine.User_Interface;

namespace Battleship.GameEngine.Maze
{
    public interface I_Map_Component
    {
        I_Ship[] getAllShips();

        int getMapBoundary();

        I_Map_Component[] getObstacleCoordinates();

        void Populate_Map();
    }

}
