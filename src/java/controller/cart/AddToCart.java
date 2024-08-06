/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.cart;

import DAO.CartDao;
import DAO.ProductDao;
import DAO.SizeDao;
import Model.Account;
import Model.Cart;
import Model.Product;
import Model.Size;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author Admin
 */
public class AddToCart extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
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
            out.println("<title>Servlet AddToCart</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddToCart at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
       HttpSession session = request.getSession();
        ProductDao dao = new ProductDao();
        CartDao cartdao = new CartDao();
        SizeDao SDao = new SizeDao();
        String quanity_raw = request.getParameter("product-quanity");
        String size_raw = request.getParameter("product-size");
        

        String productId_raw = request.getParameter("productId");
        if(size_raw.equals("S")){
            request.setAttribute("mess", "Please choose size");
            request.getRequestDispatcher("single?pid="+ productId_raw).forward(request, response);
        }
        Account user = (Account) session.getAttribute("account");
        if( user == null) {
       
           request.getRequestDispatcher("login").forward(request, response);
        }else{
        try {
            int productId = Integer.parseInt(productId_raw);
            int quantity = Integer.parseInt(quanity_raw);
            int size = Integer.parseInt(size_raw);
            Product pc = dao.getProductsById(productId);
            Size qs = SDao.getSize(pc.getProductId(), size);
            
            Cart cartCheck = cartdao.checkItemCart(user.getAccountId(), pc.getProductId(), size);
            int checkQuantiy=0;
             if (cartCheck != null) {
                 checkQuantiy= cartCheck.getQuantity();
             }
             System.out.println(checkQuantiy);
             System.out.println(qs);
             System.out.println(cartCheck);
             if(qs.getQuantity() < (quantity + checkQuantiy)){
                 request.setAttribute("mess", "Too much quantity");
                 request.getRequestDispatcher("single?pid=" +productId).forward(request, response);
             }else{
            if (cartCheck == null) {
                cartdao.insert(user.getAccountId(), pc.getProductId(), quantity,size);
            } else {
                cartdao.updateCartQuantity(user.getAccountId(), pc.getProductId(), (quantity + cartCheck.getQuantity()), size);
            }
            request.getRequestDispatcher("list").forward(request, response);
             }
            
        } catch (Exception e) {
        }
        }
        
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
        request.getRequestDispatcher("list").forward(request, response);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
