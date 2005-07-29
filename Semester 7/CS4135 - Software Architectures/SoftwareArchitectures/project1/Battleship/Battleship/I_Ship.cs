using System;
using Battleship.GameEngine.Boundary;
using Battleship.GameEngine.Gamepiece;
using Battleship.GameEngine.Maze;
using Battleship.GameEngine.Participant;
using Battleship.GameEngine.Group;
using Battleship.GameEngine.User_Interface;

namespace Battleship.GameEngine.Gamepiece
{
    public interface I_Ship
    {
        int GetEndX();
        int GetEndY();
        void GetOwner();

        int GetStartX();
        int GetStartY();
        void SetEndX( int endX );

        void SetEndY( int endY );
        void SetStartX( int startX );
        void SetStartY( int startY );
    }

}
