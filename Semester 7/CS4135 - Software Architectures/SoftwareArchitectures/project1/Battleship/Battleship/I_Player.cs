using System;
using Battleship.GameEngine;
using Battleship.GameEngine.Boundary;
using Battleship.GameEngine.Gamepiece;
using Battleship.GameEngine.Maze;
using Battleship.GameEngine.Participant;
using Battleship.GameEngine.Group;
using Battleship.GameEngine.User_Interface;

namespace Battleship.GameEngine.Participant
{
    public interface I_Player : I_Observer
    {
        I_Ship[] GetMyShips();
        int GetNumShips();
        void SetMyShips( I_Ship[] ships );

        void SetNumShips( int numShips );
        String GetName();

        void SetName( String name );
        int GetPower();
        void SetPower( int power );

        int GetPlayerScore();
        void SetPlayerScore( int score );

        void makeMove();


		// method detach is inherited from base class
		// method attach is inherited from base class
		// method update is inherited from base class
		// method notify is inherited from base class
    }

}
