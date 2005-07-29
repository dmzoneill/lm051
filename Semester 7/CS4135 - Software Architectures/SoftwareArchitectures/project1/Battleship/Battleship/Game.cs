using System;
using System.Collections.Generic;
using Battleship.GameEngine.Boundary;
using Battleship.GameEngine.Gamepiece;
using Battleship.GameEngine.Maze;
using Battleship.GameEngine.Participant;
using Battleship.GameEngine.Group;
using Battleship.GameEngine.User_Interface;
using System.Collections;
using System.Windows.Media;
using System.Windows;

namespace Battleship.GameEngine.Boundary
{
    public class Game
    {
        private I_Team[] teams;
        private ArrayList mementos;
        private I_Window window;
        private I_Map_Component map;
        private Boolean gameOver;
        private int currentTeam = 0;
        private int currentPlayer = 0;
        private int counter = 4;
        private Player Player;
        private int undoMove = 0;

        public Game()
        {
            BattleshipTest.acceptMessage( this.ToString() , "Constructed" , Colors.Blue );

            this.mementos = new ArrayList();
            this.gameOver = false;
            this.teams = new Team[2];
            this.map = new Mine_Obstacle_Decorator(
                new Land_Obstacle_Decorator(new Concrete_Map_Component()));
            this.window = new Game_Window(true);
            this.window.drawMap(this.map);
            
        }

        public void CreateTeams(List<string> teamTypes, List<string> computerAlgorithmTypes)
        {
            // ** Hard-Coded Team Types **
            List<string> teamTypesDEBUG = new List<string>();
            teamTypesDEBUG.Add(teamTypes[0]);
            teamTypesDEBUG.Add(teamTypes[1]);
            

            I_Team stdTeam1 = new Standard_Team();
            this.teams[0] = stdTeam1.CreateTeams(teamTypesDEBUG[0], computerAlgorithmTypes);

            // ** Hard-Coded Passing of Game ** 
            I_Team stdTeam2 = new Standard_Team(this);
            this.teams[1] = stdTeam2.CreateTeams(teamTypesDEBUG[1], computerAlgorithmTypes);

            I_Player[] team1 = this.teams[0].GetPlayers();
            I_Player[] team2 = this.teams[1].GetPlayers();

            I_Player temp1 = team1[0];
            I_Player temp2 = team1[1];
            I_Player temp3 = team2[0];
            I_Player temp4 = team2[1];

            temp1.Attach(temp2);
            temp1.Attach(temp3);
            temp1.Attach(temp4);

            temp2.Attach(temp1);
            temp2.Attach(temp3);
            temp2.Attach(temp4);

            temp3.Attach(temp1);
            temp3.Attach(temp2);
            temp3.Attach(temp4);

            temp4.Attach(temp1);
            temp4.Attach(temp2);
            temp4.Attach(temp3);
        }

        public void StartGame()
        {
            this.teams[0].Attach( this.teams[1] );
            this.teams[1].Attach( this.teams[0] );

            while (!this.gameOver)
            {
                if( this.undoMove == 1 )
                {
                    this.Player.SetMemento( 
                            ( Memento ) this.mementos[ this.mementos.Count - 1 ] );
                    this.mementos.Remove( this.mementos.Count - 1 );
                    this.undoMove = 0;
                }

                if( this.counter % 4 == 0 )
                {
                    this.currentTeam = 0;
                    this.currentPlayer = 0;
                }
                else if( this.counter % 4 == 1 )
                {
                    this.currentTeam = 1;
                    this.currentPlayer = 0;
                }
                else if( this.counter % 4 == 2 )
                {
                    this.currentTeam = 0;
                    this.currentPlayer = 1;
                }
                else if( this.counter % 4 == 3 )
                {
                    this.currentTeam = 1;
                    this.currentPlayer = 1;
                }

                I_Player[] players = this.teams[ this.currentTeam ].GetPlayers();
                this.Player = ( Player ) players[ this.currentPlayer % 2 ];

                this.mementos.Add( this.Player.CreateMemento() );

                BattleshipTest.acceptMessage( this.Player.ToString() ,
                                                "make move" , Colors.Blue );
                this.Player.Notify( "Fired" );

                this.Player.makeMove();

                this.counter++;

                System.Threading.Thread.Sleep(5000);
            }
        }

        public I_Team[] GetTeams()
        {
            return this.teams;
        }

        public void SetTeams(Team[] teams)
        {
            this.teams = teams;
        }

        public void UndoMove()
        {
            if( this.mementos.Count > 0 )
            {
                this.undoMove = 1;
                this.counter--;
            }
        }
    }

}
