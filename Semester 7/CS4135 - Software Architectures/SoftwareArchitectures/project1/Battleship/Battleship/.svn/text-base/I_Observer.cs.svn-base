using System;
using Battleship.GameEngine.Boundary;
using Battleship.GameEngine.Gamepiece;
using Battleship.GameEngine.Maze;
using Battleship.GameEngine.Participant;
using Battleship.GameEngine.Group;
using Battleship.GameEngine.User_Interface;

namespace Battleship.GameEngine
{
    public interface I_Observer
    {
        void Notify( string message );
        void Update( I_Observer subject , String message );
        void Attach( I_Observer I_Observer );
        void Detach( I_Observer I_Observer );

    }

}
