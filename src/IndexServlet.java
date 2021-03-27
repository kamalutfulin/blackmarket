import mysql.business.Product;
import mysql.business.ProductDB;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



@WebServlet(urlPatterns = {"/index"})
public class IndexServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ArrayList<Product> products = ProductDB.select();
        System.out.println(products.size());
        request.setAttribute("products", products);
        getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
    }
}