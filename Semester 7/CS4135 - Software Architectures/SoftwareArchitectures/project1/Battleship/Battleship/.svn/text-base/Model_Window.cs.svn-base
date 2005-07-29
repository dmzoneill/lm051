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
    public class Model_Window : I_User_Interface
    {
        public Model_Window()
        {
            BattleshipTest.acceptMessage(this.ToString(), "Constructed", Colors.Purple);
        }

        public void drawWindow(int dimensions)
        {
            BattleshipTest.acceptMessage(this.ToString(), 
                "Drawing Model window", Colors.Purple);
        }

        public void drawShips(I_Ship[] ships)
        {
            BattleshipTest.acceptMessage(this.ToString(), 
                "Delegating to draw_Ships()", Colors.Purple);
            this.draw_Ships(ships);
        }

        public void drawObstacles(I_Map_Component[] obstacles)
        {
            BattleshipTest.acceptMessage(this.ToString(), 
                "Delegating to draw_Obsticles()", Colors.Purple);
            this.draw_Obstacles(obstacles);
        }

        public void draw_Ships(I_Ship[] ships)
        {
            BattleshipTest.acceptMessage(this.ToString(), 
                "drawing ship models", Colors.Purple);
        }

        public void draw_Obstacles(I_Map_Component[] obstacles)
        {
            BattleshipTest.acceptMessage(this.ToString(), 
                "drawing obsticle models", Colors.Purple);
        }

    }

}
