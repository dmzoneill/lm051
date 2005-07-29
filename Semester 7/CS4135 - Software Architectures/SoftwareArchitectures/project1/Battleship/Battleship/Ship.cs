using System;
using Battleship.GameEngine.Boundary;
using Battleship.GameEngine.Gamepiece;
using Battleship.GameEngine.Maze;
using Battleship.GameEngine.Participant;
using Battleship.GameEngine.Group;
using Battleship.GameEngine.User_Interface;

namespace Battleship.GameEngine.Gamepiece
{
    public class Ship : I_Ship
    {
        private int startX;
        private int startY;
        private int endX;
        private int endY;
        private bool destroyed;
        private String owner;
        private I_Player i_Player;

        public Ship( object i_Player_owner )
        {

        }
        public int GetStartX()
        {
            return this.startX;

        }
        public void SetStartX( int startX )
        {

        }
        public int GetStartY()
        {
            return this.startY;

        }
        public void SetStartY( int startY )
        {

        }
        public int GetEndX()
        {
            return this.endX;

        }
        public void SetEndX( int endX )
        {

        }
        public int GetEndY()
        {
            return this.endY;

        }
        public void SetEndY( int endY )
        {

        }
        public void GetOwner()
        {

        }


    }

}
