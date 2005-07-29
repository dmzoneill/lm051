using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;

namespace CalculatorService
{
    [ServiceBehavior(InstanceContextMode = InstanceContextMode.Single)]
    public class CalculatorService : ICalculator
    {
        private static List<EvaluatedExpression> history;

        static CalculatorService()
        {
            CalculatorService.history = new List<EvaluatedExpression>();
        }

        public EvaluatedExpression opAddition( int lvalue , int rvalue )
        {
            EvaluatedExpression exp = new EvaluatedExpression();
            exp.Result = lvalue + rvalue;
            exp.Expression = lvalue + "+" + rvalue;
            CalculatorService.history.Add(exp);
            return exp;
        }

        public EvaluatedExpression opSubtraction( int lvalue , int rvalue )
        {
            EvaluatedExpression exp = new EvaluatedExpression();
            exp.Result = lvalue - rvalue;
            exp.Expression = lvalue + "-" + rvalue;
            CalculatorService.history.Add(exp);
            return exp;
        }

        public EvaluatedExpression opMultiplication( int lvalue , int rvalue )
        {
            EvaluatedExpression exp = new EvaluatedExpression();
            exp.Result = lvalue * rvalue;
            exp.Expression = lvalue + "x" + rvalue;
            CalculatorService.history.Add(exp);
            return exp;
        }

        public EvaluatedExpression opDivision( int lvalue , int rvalue )
        {
            EvaluatedExpression exp = new EvaluatedExpression();
            exp.Expression = lvalue + "/" + rvalue;

            if( lvalue == 0 || rvalue == 0 )
            {
                return exp;
            }

            exp.Result = lvalue / rvalue;
            CalculatorService.history.Add(exp);
            return exp;
        }

        public EvaluatedExpression undo()
        {
            if( history.Count == 0 )
            {
                return null;
            }

            EvaluatedExpression temp = history.ElementAt(history.Count - 1);
            history.RemoveAt(history.Count - 1);
            return temp;
        }
    }
}
