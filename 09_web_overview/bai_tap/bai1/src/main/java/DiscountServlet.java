import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "DiscountServlet", urlPatterns = "/displayDiscount")
public class DiscountServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int listPrice = Integer.parseInt(request.getParameter("price"));
        int discountProduct = Integer.parseInt(request.getParameter("discount"));
        double discountAmount = listPrice * discountProduct * 0.01;

        request.setAttribute("amount", discountAmount);
        request.getRequestDispatcher("result.jsp").forward(request,response);
        response.sendRedirect("result.jsp");
    }
}
