// jscpd:ignore-start
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
    public class Game_Window : I_Window
    {
        private I_User_Interface implementor; // codespell:ignore implementor
        private Boolean typeOfWindow;

        public Game_Window(Boolean textWindow)
        {
            this.typeOfWindow = textWindow;

            BattleshipTest.acceptMessage(this.ToString(),
                "Constructed concrete window ", Colors.Purple);

            if (this.typeOfWindow == true)
            {
                this.implementor = new Text_Window(); // codespell:ignore implementor
            }
            else
            {
                this.implementor = new Model_Window(); // codespell:ignore implementor
            }
        }

        public void drawMap(I_Map_Component theMap)
        {
            this.implementor.drawWindow(theMap.getMapBoundary()); // codespell:ignore implementor
            this.implementor.drawShips(theMap.getAllShips()); // codespell:ignore implementor
            this.implementor.drawObstacles(theMap.getObstacleCoordinates()); // codespell:ignore implementor
        }

    }

}
// jscpd:ignore-end
