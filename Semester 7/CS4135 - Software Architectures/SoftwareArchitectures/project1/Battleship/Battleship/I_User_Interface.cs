using System;
using Battleship.GameEngine.Boundary;
using Battleship.GameEngine.Gamepiece;
using Battleship.GameEngine.Maze;
using Battleship.GameEngine.Participant;
using Battleship.GameEngine.Group;
using Battleship.GameEngine.User_Interface;

namespace Battleship.GameEngine.User_Interface
{
    public interface I_User_Interface
    {
        void drawWindow( int dimensions );
        void drawShips( I_Ship[] ships );
        void drawObstacles(I_Map_Component[] obstacles);

    }

}
