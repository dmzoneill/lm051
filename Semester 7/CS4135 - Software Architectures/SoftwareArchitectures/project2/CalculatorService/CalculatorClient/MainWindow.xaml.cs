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
using System.Windows.Navigation;
using System.Windows.Shapes;
using Client.ServiceReference1;
using System.Text.RegularExpressions;

namespace Client
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent(); 
        }

        private void Window_Loaded( object sender , RoutedEventArgs e )
        {
            for( int i = 1 ; i < 21 ; i++ )
            {
                Object ctrl = this.FindName("button" + i);

                if( ctrl != null )
                {
                    Button b = ( Button ) ctrl;
                    b.Click += new RoutedEventHandler(b_Click);
                }
            }
        }


        private void b_Click( object sender , RoutedEventArgs e )
        {
            Button b = ( Button ) sender;
            string buttonAction = b.Content.ToString();

            switch( buttonAction )
            {
                case "0":
                case "1":
                case "2":
                case "3":
                case "4":
                case "5":
                case "6":
                case "7":
                case "8":
                case "9":
                case "+":
                case "-":
                case "x":
                case "/":
                    this.textBox1.Text += buttonAction;
                break;

                case "=":
                    this.compute();
                break;

                case "C":
                    this.textBox1.Text = "";
                break;

                case "<-":
                    this.undo();
                break;
            }

        }


        private void undo()
        {
            CalculatorClient client = new CalculatorClient();
            client.Open();
            EvaluatedExpression expr = client.undo();

            if( expr != null )
            {
                this.textBox1.Text = expr.Expression;
            }

            client.Close();
        }


        private void compute()
        {
            string expression = this.textBox1.Text;

            Regex pattern = new Regex( @"([\+-]?[0-9]+).*?(\+|-|x|/).*?([\+-]?[0-9]+)");

            MatchCollection mCollection = pattern.Matches(expression);

            if( mCollection.Count == 0 )
            {
                this.textBox1.Text = "Err";
                return;
            }

            CalculatorClient client = new CalculatorClient();
            client.Open();

            foreach( Match m in mCollection )
            {

                int lvalue = int.Parse( m.Groups[ 1 ].Value );
                string opt = m.Groups[ 2 ].Value;
                int rvalue = int.Parse( m.Groups[ 3 ].Value );

                EvaluatedExpression expr;

                switch( opt )
                {
                    case "+":
                        expr = client.opAddition( lvalue , rvalue );
                    break;
                        
                    case "x":
                        expr = client.opMultiplication(lvalue , rvalue);
                    break;

                    case "-":
                        expr = client.opSubtraction(lvalue , rvalue);
                    break;

                    case "/":
                        expr = client.opDivision(lvalue , rvalue);
                    break;

                    default:
                        expr = null;
                    break;
                }

                if( expr != null )
                {
                    this.textBox1.Text = expr.Result.ToString();
                }
            }

            client.Close(); 
        }
    }
}
