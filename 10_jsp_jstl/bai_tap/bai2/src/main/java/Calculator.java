public class Calculator {
    public static double calculate(double fOperand, double sOperand, String oS) {
        switch (oS) {
            case "+":
                return fOperand + sOperand;
            case "-":
                return fOperand - sOperand;
            case "x":
                return fOperand * sOperand;
            case "/":
                if(sOperand != 0)
                    return fOperand / sOperand;
                else
                    throw new RuntimeException("Can't divide by zero");
            default:
                throw new RuntimeException("Invalid Operation");
        }
    }
}