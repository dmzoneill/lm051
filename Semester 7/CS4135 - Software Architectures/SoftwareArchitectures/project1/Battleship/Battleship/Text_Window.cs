using System;
using Battleship.GameEngine.Boundary;
using Battleship.GameEngine.Gamepiece;
using Battleship.GameEngine.Maze;
using Battleship.GameEngine.Participant;
using Battleship.GameEngine.Group;
using Battleship.GameEngine.User_Interface;
using System.Windows.Media;

namespace Battleship.GameEngine.User_Interface
{
    public class Text_Window : I_User_Interface
    {
        public Text_Window()
        {
            BattleshipTest.acceptMessage(this.ToString(), "Constructed", Colors.Purple);
        }

        public void drawWindow(int dimensions)
        {
            BattleshipTest.acceptMessage(this.ToString(), 
                "Drawing text window", Colors.Purple);
        }

        public void drawShips(I_Ship[] ships)
        {
            BattleshipTest.acceptMessage(this.ToString(), 
                "Delegating to draw_the_Ships()", Colors.Purple);
            this.draw_the_Ships(ships);
        }

        public void drawObstacles(I_Map_Component[] obstacles)
        {
            BattleshipTest.acceptMessage(this.ToString(), 
                "Delegating to draw_the_Obsticles()", Colors.Purple);
            this.draw_the_Obstacles(obstacles);
        }

        public void draw_the_Ships(I_Ship[] ships)
        {
            BattleshipTest.acceptMessage(this.ToString(), 
                "drawing ship text", Colors.Purple);
        }

        public void draw_the_Obstacles(I_Map_Component[] obstacles)
        {
            BattleshipTest.acceptMessage(this.ToString(), 
                "drawing obsticle text", Colors.Purple);
        }

    }

}
