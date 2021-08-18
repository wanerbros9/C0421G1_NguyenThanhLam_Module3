package controller;

import model.bean.Category;
import model.bean.Product;
import model.repository.CategoryRepository;
import model.repository.ICategoryRepository;
import model.service.IProductService;
import model.service.impl.ProductService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "ProductServlet", urlPatterns = "/product")
public class ProductServlet extends HttpServlet {

    IProductService iProductService = new ProductService();
    ICategoryRepository categoryRepository = new CategoryRepository();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action == null) {
            action = "";
        }
        switch (action) {
            case "edit":
                showEditProduct(request, response);
                break;
            case "create":
                showCreateProduct(request, response);
                break;
            default:
                showProductList(request, response);
                break;
        }
    }

    private void showProductList(HttpServletRequest request, HttpServletResponse response) {
        request.setAttribute("productListServlet", this.iProductService.findAll());
        try {
            request.getRequestDispatcher("view/view-product.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showCreateProduct(HttpServletRequest request, HttpServletResponse response) {
        List<Category> categoryList = new ArrayList<>();
        categoryList = this.categoryRepository.showAll();
        request.setAttribute("categoryList", categoryList);
        try {
            request.getRequestDispatcher("view/create-product.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showEditProduct(HttpServletRequest request, HttpServletResponse response) {
        int productId = Integer.parseInt(request.getParameter("id"));
        Product product = this.iProductService.findByID(productId);
        request.setAttribute("productObj", product);
        try {
            request.getRequestDispatcher("view/edit-product.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "edit":
                editProduct(request, response);
                break;
            case "create":
                createProduct(request, response);
                break;
            case "delete":
                deleteProduct(request, response);
                break;
        }
    }

    private void deleteProduct(HttpServletRequest request, HttpServletResponse response) {
        int productId = Integer.parseInt(request.getParameter("id"));
        Product product = this.iProductService.findByID(productId);
        if (product == null) {
            request.getRequestDispatcher("error-404.jsp");
        } else {
            this.iProductService.remove(productId);
            showProductList(request, response);
        }
    }

    private void createProduct(HttpServletRequest request, HttpServletResponse response) {
        String msg = "Success";
        String productName = request.getParameter("productName");
        int productPrice = Integer.parseInt(request.getParameter("productPrice"));
        int productQuantity = Integer.parseInt(request.getParameter("productQuantity"));
        String productColor = request.getParameter("productColor");
        int categoryId = Integer.parseInt(request.getParameter("categoryId"));

        Product product = new Product(productName, productPrice, productQuantity, productColor, categoryId);
        boolean result = this.iProductService.create(product);
        try {
            if (result) {
                request.setAttribute("msg", msg);
            } else {
                request.getRequestDispatcher("error-404.jsp").forward(request, response);
            }
            request.getRequestDispatcher("view/create-product.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void editProduct(HttpServletRequest request, HttpServletResponse response) {
        String msg = "Success";
        int productId = Integer.parseInt(request.getParameter("productId"));
        String productName = request.getParameter("productName");
        int productPrice = Integer.parseInt(request.getParameter("productPrice"));
        int productQuantity = Integer.parseInt(request.getParameter("productQuantity"));
        String productColor = request.getParameter("productColor");
        int categoryId = Integer.parseInt(request.getParameter("categoryId"));

        Product product = new Product(productId, productName, productPrice, productQuantity, productColor, categoryId);

        this.iProductService.edit(product);
        request.setAttribute("product", product);
        try {
            request.getRequestDispatcher("view/edit-product.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
