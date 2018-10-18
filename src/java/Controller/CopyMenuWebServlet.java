/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Dao.MenuDao;
import Entity.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.http.HttpEntity;
import org.apache.http.HttpHost;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.message.BasicNameValuePair;

/**
 *
 * @author moses
 */
public class CopyMenuWebServlet extends HttpServlet {

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
            HttpSession session = request.getSession();
            User u = (User)session.getAttribute("user");
            String companyName = u.getCompanyName();
            String sourceOutletName = request.getParameter("sourceOutletName");
            String outletName = u.getOutletName();
            String[] overwriteArr = request.getParameterValues("overwrite");
            boolean overwrite = (overwriteArr != null);
            
            HttpHost target = new HttpHost((String)session.getAttribute("url"), (Integer)session.getAttribute("port"), "http");

            HttpPost postRequest = new HttpPost("/API/CopyMenuServlet");            
            DefaultHttpClient httpclient = new DefaultHttpClient();
            ArrayList<NameValuePair> postParams = new ArrayList<>();
            postParams.add(new BasicNameValuePair("companyName", companyName));
            postParams.add(new BasicNameValuePair("sourceOutletName", sourceOutletName));
            postParams.add(new BasicNameValuePair("outletName", outletName));
            if(!overwrite){
                postParams.add(new BasicNameValuePair("append", "true"));
            }
            
            
            postRequest.setEntity(new UrlEncodedFormEntity(postParams, "UTF-8"));
            HttpResponse httpResponse = httpclient.execute(target, postRequest);
            HttpEntity entity = httpResponse.getEntity();

            int statusCode = httpResponse.getStatusLine().getStatusCode();
            
            if(statusCode == 202){
              MenuDao.updateCategory(u,(String)session.getAttribute("url"), (Integer)session.getAttribute("port"));
              System.out.println("Successfully copied menu");
              if(!overwrite){
                request.setAttribute("successMsg", "Successfully appended menu from " + sourceOutletName + " to " + outletName);
              }else{
                request.setAttribute("successMsg", "Successfully copied menu from " + sourceOutletName + " to " + outletName);
              }
              request.getRequestDispatcher("CopyMenu.jsp").forward(request, response);
            }else{
                System.out.println("Error, redirect to create user page");
                request.setAttribute("errorMsg", "Failed to copy menu from " + sourceOutletName + " to " + outletName);
                request.getRequestDispatcher("CopyMenu.jsp").forward(request, response);
            }

        }catch(Exception e){
            e.printStackTrace();
            System.out.println("Error, redirect to create user page");
            request.setAttribute("errorMsg", "Failed to copy menu");
            request.getRequestDispatcher("CopyMenu.jsp").forward(request, response);
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
        processRequest(request, response);
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
