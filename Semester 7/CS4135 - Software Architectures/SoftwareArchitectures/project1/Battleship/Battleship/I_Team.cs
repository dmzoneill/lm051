using System;
using System.Windows.Media;
using Battleship.GameEngine.Boundary;
using Battleship.GameEngine.Gamepiece;
using Battleship.GameEngine.Maze;
using Battleship.GameEngine.Participant;
using Battleship.GameEngine.Group;
using Battleship.GameEngine.User_Interface;

namespace Battleship.GameEngine.Group
{
    public interface I_Team : I_Observer
    {
        I_Player[] GetPlayers();
        void SetPlayers( I_Player[] players );
        int GetNumPlayers();
        Color GetColor();
        void SetColor( Color color );
        I_Team CreateTeams(string typeOfTeam, 
            System.Collections.Generic.List<string> computerAlgorithmTypes);
    }

}
