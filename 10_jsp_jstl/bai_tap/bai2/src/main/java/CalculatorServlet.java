import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "CalculatorServlet", urlPatterns = "/calculator")
public class CalculatorServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        double firstOperand = Double.parseDouble(request.getParameter("first_operand"));
        double secondOperand = Double.parseDouble(request.getParameter("second_operand"));
        String operatorS = request.getParameter("operator");
        double result = 0;
        String error = "";
        request.setAttribute("firstOperandServlet", firstOperand);
        request.setAttribute("operatorServlet", operatorS );
        request.setAttribute("secondOperandServlet", secondOperand);

        try {
            result = Calculator.calculate(firstOperand,secondOperand, operatorS);
            request.setAttribute("resultServlet", result);
            request.getRequestDispatcher("result.jsp").forward(request, response);
        } catch (Exception ex) {
            error = ex.getMessage();
            request.setAttribute("errorServlet", error);
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}