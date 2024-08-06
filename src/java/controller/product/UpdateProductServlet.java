/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.product;

import DAO.CategoryDao;
import DAO.ProductDao;
import DAO.SizeDao;
import Model.Account;
import Model.Category;
import Model.Product;
import Model.Size;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class UpdateProductServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet UpdateProductServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateProductServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Account account1 = (Account) session.getAttribute("account");
        if (account1 == null) {

            request.getRequestDispatcher("login").forward(request, response);
        }
        if (account1.getRole() != 0) {
            request.getRequestDispatcher("NotFoundPage.jsp").forward(request, response);
        }
        String id_raw = request.getParameter("id");
        ProductDao dao = new ProductDao();

        try {
            int id = Integer.parseInt(id_raw);
            Product c = dao.getProductsById(id);
            request.setAttribute("data", c);
            request.getRequestDispatcher("UpdateProduct.jsp").forward(request, response);
        } catch (Exception e) {
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String id_raw = request.getParameter("id");
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        String categoryName = request.getParameter("category");
        String price_raw = request.getParameter("price");
        String quantity_raw = request.getParameter("quantity");
        String soldquantity_raw = request.getParameter("soldquantity");
        String size_raw = request.getParameter("size");
        String date_raw = request.getParameter("date");
        String image = request.getParameter("image");
        
        System.out.println(id_raw);
        System.out.println(name);
        System.out.println(description);
        
        System.out.println(categoryName);
        System.out.println(price_raw);
        System.out.println(quantity_raw);
        System.out.println(soldquantity_raw);
        System.out.println(size_raw);
        System.out.println(date_raw);
        System.out.println(image);
        
        
        ProductDao dao = new ProductDao();
        try {
            int id = Integer.parseInt(id_raw);           
            double price = Double.parseDouble(price_raw);
            int quantity = Integer.parseInt(quantity_raw);
            int soldquantity = Integer.parseInt(soldquantity_raw);
            int size = Integer.parseInt(size_raw);
            
            Date date;
            date = ((date_raw == null) || (date_raw.equals("")))
                    ? null : Date.valueOf(date_raw);        
            Product f = dao.getProductsById(id);
            if (image.equals("")) {
                image = f.getImage();
            }
            CategoryDao CDao = new CategoryDao();
            int cateId = CDao.getCategoryByName(categoryName).getCategoryId();
            dao.updateProduct(name, cateId, price, image, description, soldquantity, date, id);
            SizeDao SDao = new SizeDao();
            List<Size> listS = SDao.getSizeByPid(id);
            int check =0;
            for (Size s : listS) {
                if(s.getSize() == size){
                    check = 1;
                    break;
                }
            }
            if (check == 1) {
                SDao.updateSize(id, quantity, size);
            }else{
                SDao.insertSize(id, quantity, size);
            }
            
            response.sendRedirect("list-product");
        } catch (NumberFormatException e) {
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
    

}
