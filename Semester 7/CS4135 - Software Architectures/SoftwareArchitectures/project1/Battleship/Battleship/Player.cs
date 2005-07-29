using System;
using Battleship.GameEngine;
using Battleship.GameEngine.Boundary;
using Battleship.GameEngine.Gamepiece;
using Battleship.GameEngine.Maze;
using Battleship.GameEngine.Participant;
using Battleship.GameEngine.Group;
using Battleship.GameEngine.User_Interface;
using System.Collections;
using System.Windows.Media;

namespace Battleship.GameEngine.Participant
{
    public class Player : Originator , I_Player
    {
        private I_Ship[] myShips;
        private int myShipsRemaining;
        private string name;
        private int power;
        private int playerScore;
        private I_Ship i_Ship;
        private Team team;
        private ArrayList observers;

        public Player()
        {
            this.observers = new ArrayList();
            this.myShips = new Ship[ 5 ];
        }

        public Memento CreateMemento()
        {
            BattleshipTest.acceptMessage( this.ToString() , 
                "Created memento of my ships" , Colors.Lime );
            return new Memento( this.myShips );
        }

        public void SetMemento( Memento memento )
        {
            BattleshipTest.acceptMessage(this.ToString(), 
                "restoring memento of my ships", Colors.Lime);
            this.myShips = memento.GetState();
        }

        public void Notify( string message )
        {
            BattleshipTest.acceptMessage(this.ToString(), 
                "Sending messsage to observers", Colors.Orange);
            foreach( I_Observer obj in this.observers )
            {
                obj.Update( this , message );
            }
        }

        public void Update( I_Observer subject , String message )
        {
            BattleshipTest.acceptMessage(this.ToString(), 
                "Recevied : \"" + message + "\" from : " + subject.ToString(), Colors.Orange);
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

        public I_Ship[] GetMyShips()
        {
            return this.myShips;
        }

        public void SetMyShips( I_Ship[] myShips )
        {
            this.myShips = myShips;
        }

        public int GetNumShips()
        {
            return this.myShips.Length;
        }

        public void SetNumShips( int myShipsRemaining )
        {
            this.myShipsRemaining = myShipsRemaining;
        }

        public string GetName()
        {
            return this.name;
        }

        public void SetName( string name )
        {
            this.name = name;
        }

        public int GetPower()
        {
            return this.power;
        }

        public void SetPower( int power )
        {
            this.power = power;
        }

        public int GetPlayerScore()
        {
            return this.playerScore;
        }

        public void SetPlayerScore( int playerScore )
        {
            this.playerScore = playerScore;
        }

        public virtual void makeMove()
        {
            BattleshipTest.acceptMessage(this.ToString(), 
                "human player made move", Colors.Blue);
        }
       
    }
}
