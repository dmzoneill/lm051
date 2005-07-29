using System;
using System.Windows.Media;
using Battleship.GameEngine.Boundary;
using Battleship.GameEngine.Gamepiece;
using Battleship.GameEngine.Maze;
using Battleship.GameEngine.Participant;
using Battleship.GameEngine.Group;
using Battleship.GameEngine.User_Interface;
using Battleship.GameEngine;
using System.Collections.Generic;
using System.Collections;


namespace Battleship.GameEngine.Group
{
    public abstract class Team : I_Team
    {
        protected I_Player[] Players;
        protected int TeamScore;
        protected Game Game;
        protected Color color;
        protected ArrayList observers;

        public Team()
        {
            this.observers = new ArrayList();
            BattleshipTest.acceptMessage(this.ToString(), "Constructed", Colors.Magenta);
        }

        public Team( String type )
        {
            this.observers = new ArrayList();
            BattleshipTest.acceptMessage(this.ToString(), "Constructed", Colors.Magenta);
        }

        public Team( Game game )
        {
            this.observers = new ArrayList();
            BattleshipTest.acceptMessage(this.ToString(), "Constructed", Colors.Magenta);
        }

        public abstract I_Player[] GetPlayers();
        public abstract void SetPlayers(I_Player[] players);
        public abstract int GetNumPlayers();
        public abstract Color GetColor();
        public abstract void SetColor( Color color );
        public abstract I_Team CreateTeams(
            string typeOfTeam, List<string> computerAlgorithmTypes);

        public void Notify( string message )
        {
            foreach( I_Observer obj in this.observers )
            {
                obj.Update( this , message );
                BattleshipTest.acceptMessage(this.ToString(), 
                    "Sending messsage to observer", Colors.Orange);
            }
        }

        public void Update( I_Observer subject , String message )
        {
            BattleshipTest.acceptMessage( this.ToString() , 
                "Recevied : \"" + message + "\" from : " + subject.ToString() , Colors.Orange);
        }

        public void Attach( I_Observer observer )
        {
            this.observers.Add( observer );
            BattleshipTest.acceptMessage(this.ToString(), 
                "Observer was attached to me", Colors.Orange);
        }

        public void Detach( I_Observer observer )
        {
            this.observers.Remove( observer );
        }
    }
}
