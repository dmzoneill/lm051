using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;

namespace CalculatorService
{
    [ServiceContract]
    public interface ICalculator
    {
        [OperationContract]
        EvaluatedExpression opAddition( int lvalue , int rvalue );

        [OperationContract]
        EvaluatedExpression opSubtraction( int lvalue , int rvalue );

        [OperationContract]
        EvaluatedExpression opMultiplication( int lvalue , int rvalue );

        [OperationContract]
        EvaluatedExpression opDivision( int lvalue , int rvalue );

        [OperationContract]
        EvaluatedExpression undo();
    }

    [DataContract]
    public class EvaluatedExpression
    {
        string expression;
        int result = 0;

        [DataMember]
        public string Expression
        {
            get { return expression; }
            set { expression = value; }
        }

        [DataMember]
        public int Result
        {
            get { return result; }
            set { result = value; }
        }
    }
}
