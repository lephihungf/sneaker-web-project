/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.product;

import DAO.CategoryDao;
import DAO.ProductDao;
import DAO.SizeDao;
import Model.Category;
import Model.Product;
import Model.Size;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class ListServlet extends HttpServlet {

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
            out.println("<title>Servlet ListProductServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ListProductServlet at " + request.getContextPath() + "</h1>");
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
        CategoryDao CDao = new CategoryDao();
        List<Category> list = CDao.getAll();
        request.setAttribute("categories", list);

        SizeDao SDao = new SizeDao();
        List<Size> sizes = SDao.getSizes();
        List<Size> sum = SDao.getSumQuantity();
        request.setAttribute("sizes", sizes);
        request.setAttribute("sum", sum);

        ProductDao PDao = new ProductDao();
        
        
        String cid_raw = request.getParameter("cid");
            String key = request.getParameter("search");
            int cid = 0;
            try {
                if (cid_raw == null) {
                    cid = 0;
                } else {
                    cid = Integer.parseInt(cid_raw);
                }

                
            } catch (Exception e) {
                System.out.println(e);
            }

        
        int count;
        if((key != null && !key.equals("")) || (cid != 0 )){
            count = PDao.getTotalProductS(key, cid);
        }else{
            count= PDao.getTotalProduct();
        }
        int endPage = count / 6;
        if (count % 6 != 0 && count/6 !=0) {
            endPage++;
        }
        request.setAttribute("endP", endPage);
        request.setAttribute("keys", key);
        request.setAttribute("cids", cid);
        String index_raw = request.getParameter("index");
        int index = 1;

        try {
            if (index_raw != null && !index_raw.equals("")) {
                index = Integer.parseInt(index_raw);
            }
        } catch (Exception e) {
        }
        
        String arrange = request.getParameter("arrange");
        request.setAttribute("arranges", arrange);
        if (arrange != null && !arrange.equals("")) {
            List<Product> products = PDao.searchArrange(key, cid, arrange, index);
            request.setAttribute("products", products);
            request.setAttribute("arrange", arrange);
        } else {
            List<Product> products = PDao.search(key, cid, index);
                request.setAttribute("products", products);
        }

        request.getRequestDispatcher("Home.jsp").forward(request, response);
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
        processRequest(request, response);
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
