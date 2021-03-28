import entity.Product;
import entity.ProductDB;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


@WebServlet("/edit")
public class EditServletTest extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {


        Integer id = Integer.parseInt(request.getParameter("id"));
        Product product = ProductDB.selectOne(id);

        request.setAttribute("product", product);
        getServletContext().getRequestDispatcher("/edit.jsp").forward(request, response);


    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            int id = Integer.parseInt(request.getParameter("id"));
            String name = request.getParameter("name");
            int price = Integer.parseInt(request.getParameter("price"));
            System.out.println(name);
            System.out.println(price);
            System.out.println(id);
            Product product = new Product(id, name, price);
            ProductDB.update(product);
            response.sendRedirect(request.getContextPath() + "/index");
        } catch (Exception ex) {

            getServletContext().getRequestDispatcher("/notfound.jsp").forward(request, response);
        }
    }
}