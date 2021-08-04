import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CustomerServlet", urlPatterns = "")
public class CustomerServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Customer> customers = new ArrayList<>();
        customers.add(new Customer("Mai Văn Hoàn","1983-08-20","Hà Nội","https://www.motortrend.com/uploads/sites/5/2019/10/2019-Lamborghini-Urus-front-three-quarter-in-motion-3.jpg?fit=around%7C480:270"));
        customers.add(new Customer("Nguyễn Văn Nam","1983-08-21","Bắc Giang","https://www.motortrend.com/uploads/sites/5/2019/10/2019-Lamborghini-Urus-front-three-quarter-in-motion-3.jpg?fit=around%7C480:270"));
        customers.add(new Customer("Nguyễn Thái Hoà","1983-08-22","Nam Định","https://www.motortrend.com/uploads/sites/5/2019/10/2019-Lamborghini-Urus-front-three-quarter-in-motion-3.jpg?fit=around%7C480:270"));
        customers.add(new Customer("Trần Đăng Khoa","1983-08-17","Hà Tây","https://www.motortrend.com/uploads/sites/5/2019/10/2019-Lamborghini-Urus-front-three-quarter-in-motion-3.jpg?fit=around%7C480:270"));
        customers.add(new Customer("Nguyễn Đình Thi","1983-08-19","Hà Nội","https://www.motortrend.com/uploads/sites/5/2019/10/2019-Lamborghini-Urus-front-three-quarter-in-motion-3.jpg?fit=around%7C480:270"));

        request.setAttribute("customerListServlet", customers);
        request.getRequestDispatcher("index.jsp").forward(request,response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
