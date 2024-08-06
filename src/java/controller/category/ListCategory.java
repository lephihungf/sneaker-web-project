/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.category;

import DAO.CategoryDao;
import DAO.ProductDao;
import Model.Account;
import Model.Category;
import Model.Product;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class ListCategory extends HttpServlet {
   
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
            out.println("<title>Servlet ListCategory</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ListCategory at " + request.getContextPath () + "</h1>");
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
        Account account1 = (Account) session.getAttribute("account");
        if( account1 == null) {
       
           request.getRequestDispatcher("login").forward(request, response);
        }
         if(account1.getRole() != 0 ){
            request.getRequestDispatcher("NotFoundPage.jsp").forward(request, response);
        }
        CategoryDao dao = new CategoryDao();
        int totalPage = dao.getTotalCategory();
        int endPage = totalPage / 7;
        if (totalPage % 7 != 0) {
            endPage++;
        }
        String indexPage = request.getParameter("page");
        if (indexPage == null) {
            indexPage = "1";
        }
        int page = Integer.parseInt(indexPage);
        List<Category> list = dao.paging(page);
        
        ProductDao Pdao = new ProductDao();
        
        List<Category> cnull =new ArrayList<>();
        List<Category> listall = dao.getAll();
        for (Category category : listall) {
            if(Pdao.getProductsByCId(category.getCategoryId())==null){
            cnull.add(category);
        }
        }
        request.setAttribute("cnull", cnull);
        request.setAttribute("page", indexPage);
        request.setAttribute("endPage", endPage);
        request.setAttribute("list", list);
        request.getRequestDispatcher("ListCategory.jsp").forward(request, response);
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
