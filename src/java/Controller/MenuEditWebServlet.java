/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Dao.MenuDao;
import Entity.Menu;
import Entity.Properties;
import Entity.User;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Arrays;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import org.apache.http.HttpEntity;
import org.apache.http.HttpHost;
import org.apache.http.HttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.mime.HttpMultipartMode;
import org.apache.http.entity.mime.MultipartEntityBuilder;
import org.apache.http.entity.mime.content.FileBody;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.tomcat.util.http.fileupload.IOUtils;

/**
 *
 * @author moses
 */
@MultipartConfig
public class MenuEditWebServlet extends HttpServlet {

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
            String name = request.getParameter("name");
            String price = request.getParameter("price");
            String cost = request.getParameter("cost");
            String desc = request.getParameter("description");
            String categoryStr = Arrays.toString(request.getParameterValues("category"));
            HttpSession session = request.getSession();
//            out.println(foodName);
//            out.println(price);
//            out.println(cost);
//            out.println(description);
//            for(String str: categoryList){
//                out.println(str);
//            }
            Part filePart = request.getPart("image"); // Retrieves <input type="file" name="file">
            String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString(); // MSIE fix.
            InputStream fileContent = filePart.getInputStream();
            
            
            FileBody fileBody;
            MultipartEntityBuilder builder;
            if(!fileName.isEmpty()){            
                File tempFile = new File(fileName);
                tempFile.deleteOnExit();
                try (FileOutputStream streamOut = new FileOutputStream(tempFile)) {
                    IOUtils.copy(fileContent, streamOut);
                }

                fileBody = new FileBody(tempFile);
                
                builder = MultipartEntityBuilder.create()
                                         .setMode(HttpMultipartMode.BROWSER_COMPATIBLE)
                                         .addPart("randomkey", fileBody)
                                         .addTextBody("name", name)
                                         .addTextBody("cost", cost)
                                         .addTextBody("price", price)
                                         .addTextBody("desc", desc)
                                         .addTextBody("category", categoryStr)                        
                                         .addTextBody("outletName", ((User)session.getAttribute("user")).getOutletName())
                                         .addTextBody("companyName", ((User)session.getAttribute("user")).getCompanyName());
            }else{
                builder = MultipartEntityBuilder.create()
                                         .setMode(HttpMultipartMode.BROWSER_COMPATIBLE)
                                         .addTextBody("name", name)
                                         .addTextBody("cost", cost)
                                         .addTextBody("price", price)
                                         .addTextBody("desc", desc)
                                         .addTextBody("category", categoryStr)     
                                         .addTextBody("outletName", ((User)session.getAttribute("user")).getOutletName())
                                         .addTextBody("companyName", ((User)session.getAttribute("user")).getCompanyName());
            }
            
            DefaultHttpClient httpclient = new DefaultHttpClient();
            HttpEntity multiPartEntity = builder.build();

            HttpHost target = new HttpHost((String)session.getAttribute("url"), (Integer)session.getAttribute("port"), "http");

            HttpPost postRequest = new HttpPost("/API/EditMenuItemServlet");
            
            postRequest.setEntity(multiPartEntity);
            
            
            HttpResponse httpResponse = httpclient.execute(target, postRequest);
            HttpEntity entity = httpResponse.getEntity();

            int statusCode = httpResponse.getStatusLine().getStatusCode();
            
            if(statusCode == 202){
                request.setAttribute("successMsg", "Successfully Edited Menu Item: " + name );
                request.getRequestDispatcher("MenuManagement.jsp").forward(request, response);
                return;
            }else{
                request.setAttribute("errorMsg", "Failed to Edit Menu Item: " + name);
                request.getRequestDispatcher("MenuManagement.jsp").forward(request, response);
                return;
            }
        }catch(Exception e){
            e.printStackTrace();
            request.setAttribute("errorMsg", "Failed to Edit Menu Item");
            request.getRequestDispatcher("MenuManagement.jsp").forward(request, response);
            return;
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
