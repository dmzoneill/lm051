using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;

using Battleship.GameEngine.Boundary;
using Battleship.GameEngine.Gamepiece;
using Battleship.GameEngine.Maze;
using Battleship.GameEngine.Participant;
using Battleship.GameEngine.Group;
using Battleship.GameEngine.User_Interface;
using System.Threading;
using System.Windows.Threading;

namespace Battleship
{
    /// <summary>
    /// Interaction logic for BattleshipTest.xaml
    /// </summary>
    public partial class BattleshipTest : Window
    {
        private static BattleshipTest instance;
        private ThreadStart threadstart;
        private Thread gameThread;
        private Game game;
        private int threadStatus = 0;

        private delegate void messageDelegate(string cname, string msg, Color color);
        private messageDelegate callBack;

        private List<string> selectedTeams = new List<string>();
        private List<string> computerAlgorithmTypes = new List<string>();

        #region Construction and destruction
        public BattleshipTest()
        {
            InitializeComponent();
            BattleshipTest.instance = this;
            this.callBack = this.addMessageToRichtextBox;
            this.richTextBox1.Document = new FlowDocument();

            string evolutionary = "Evolutionary Algorithm";
            string reinforcementAlg = "Reinforcement Algorithm";

            // Default Algorithms
            this.computerAlgorithmTypes.Add( evolutionary );
            this.computerAlgorithmTypes.Add( reinforcementAlg );

            // Check Box Filling & Default
            this.Computer_1_AI_cb.Items.Add( evolutionary );
            this.Computer_1_AI_cb.Items.Add( reinforcementAlg );

            this.Computer_1_AI_cb.SelectedIndex = 0;

            // Check Box Filling & Default
            this.Computer_2_AI_cb.Items.Add( evolutionary );
            this.Computer_2_AI_cb.Items.Add( reinforcementAlg );

            this.Computer_2_AI_cb.SelectedIndex = 0;

            this.game = new Game();

        }

        private void Window_Closing(object sender, System.ComponentModel.CancelEventArgs e)
        {
            try
            {
                this.gameThread.Abort();

                // While gameThread is terminating, main thread will wait for half a second
                System.Threading.Thread.Sleep( 500 );
            }
            catch( Exception )
            {

            }
        }
        #endregion

        #region Game control memento start game ui elements
        private void gameControlButton_Click(object sender, RoutedEventArgs e)
        {
            Console.WriteLine("called");
            try
            {
                if (threadStatus == 0)
                {
                    this.gameControlButton.Content = "Pause";
                    threadStatus = 1;
                    this.threadstart = new ThreadStart(game.StartGame);
                    this.gameThread = new Thread(threadstart);
                    this.gameThread.Start();
                }
                else if (threadStatus == 1)
                {
                    this.gameControlButton.Content = "Resume";
                    threadStatus = 2;
                    this.gameThread.Suspend();
                }
                else
                {
                    this.gameControlButton.Content = "Pause";
                    this.gameThread.Resume();
                }

            }
            catch (Exception)
            {
                MessageBox.Show("Unable to start the game thread");
            }
        }

        private void restoreMememtoButton_Click( object sender , RoutedEventArgs e )
        {
            this.game.UndoMove();
        }
        #endregion

        #region Team control ui elements
        private void createTeamsButton_Click( object sender , RoutedEventArgs e )
        {
            // Fowler would be upset, remove temps! bad code smell
            bool teamEasy = (bool) easyTeam_TB.IsChecked;
            bool teamHard = ( bool ) hardTeam_TB.IsChecked;
            bool teamComputer = ( bool ) computerTeam_TB.IsChecked;

            // Defensive code block, bad!
            if( teamEasy && teamHard && teamComputer )
            {
                MessageBox.Show( "Please select only two teams." );
                this.easyTeam_TB.IsChecked = false;
                this.hardTeam_TB.IsChecked = false;
                this.computerTeam_TB.IsChecked = false;
                this.selectedTeams.Clear();
            }
            else if( ( teamEasy && teamHard && !teamComputer ) 
                  || ( teamEasy && !teamHard && teamComputer ) 
                  || ( !teamEasy && teamHard && teamComputer ) )
            {
                if (teamEasy == true)
                {
                    this.selectedTeams.Add( "Easy" );
                }

                if ( teamHard == true)
                {
                    this.selectedTeams.Add( "Hard" );
                }

                if ( teamComputer == true)
                {
                    this.selectedTeams.Add( "Computer" );
                }

                this.computerAlgorithmTypes[ 0 ] = 
                                           ( string ) this.Computer_1_AI_cb.SelectedValue;
                this.computerAlgorithmTypes[ 1 ] = 
                                           ( string ) this.Computer_2_AI_cb.SelectedValue;
         
                this.game.CreateTeams( selectedTeams , computerAlgorithmTypes );
                this.gameControlButton.IsEnabled = true;
                this.restoreMememtoButton.IsEnabled = true;
            }
            else
            {
                MessageBox.Show("Please select 2 teams!");
            }
        }       
        #endregion

        #region Message handling area for delgated messages to the UI
        public void addMessageToRichtextBox( string classname , string message , Color color )
        {
            string package;
            string objname;

            Paragraph p = new Paragraph();
            p.LineHeight = 5;

            int x = classname.LastIndexOf( '.' );

            if( x == -1 )
            {
                package = "";
                objname = classname;
            }
            else
            {
                package = classname.Substring( 0 , x );
                objname = classname.Substring( x + 1 , classname.Length - x - 1 );
            }

            Run r1 = new Run( "Package : " );
            r1.Foreground = new SolidColorBrush( Colors.Green );
            p.Inlines.Add( r1 );

            Run r2 = new Run( package );
            r2.Foreground = new SolidColorBrush( Colors.Red );
            p.Inlines.Add( r2 );

            Run r3 = new Run( "  Object : " );
            r3.Foreground = new SolidColorBrush( Colors.Green );
            p.Inlines.Add( r3 );

            Run r4 = new Run( objname );
            r4.Foreground = new SolidColorBrush( Colors.Red );
            p.Inlines.Add( r4 );

            Run r5 = new Run( "  Said : " );
            r5.Foreground = new SolidColorBrush( Colors.Green );
            p.Inlines.Add( r5 );

            Run r6 = new Run( message );
            r6.Foreground = new SolidColorBrush( color );
            p.Inlines.Add( r6 );

            this.richTextBox1.Document.Blocks.Add( p );
            this.richTextBox1.ScrollToEnd();
        }

        public static void acceptMessage( string classname , string message , Color color )
        {
            BattleshipTest.instance.addMessage( classname , message , color );
        }

        public void addMessage( string classname , string message , Color color )
        {
            this.Dispatcher.Invoke( System.Windows.Threading.DispatcherPriority.Background , 
                new System.Windows.Threading.DispatcherOperationCallback(
            delegate
            {
                this.callBack( classname , message , color );
                return null;
            } ) , null );
        }

        #endregion
    }
}
