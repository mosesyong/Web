/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Entity.Properties;
import Entity.User;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.file.Paths;
import java.util.ArrayList;
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
import org.apache.http.NameValuePair;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.mime.HttpMultipartMode;
import org.apache.http.entity.mime.MultipartEntityBuilder;
import org.apache.http.entity.mime.content.FileBody;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.message.BasicNameValuePair;
import org.apache.tomcat.util.http.fileupload.IOUtils;

/**
 *
 * @author moses
 */
@MultipartConfig
public class CreateCategoryWebServlet extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            String category = request.getParameter("category");
            FileBody fileBody;
            MultipartEntityBuilder builder = null;
            try {
                
                DefaultHttpClient httpclient = new DefaultHttpClient();
                Properties prop = new Properties();
                String url = prop.url;
                int port = prop.port;
                HttpSession session = request.getSession();
                User u = (User)session.getAttribute("user");
                
                
                Part filePart = request.getPart("image"); // Retrieves <input type="file" name="image">
                String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString(); // MSIE fix.
                InputStream fileContent = filePart.getInputStream();
            
            
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
                                         .addTextBody("category", category)
                                         .addTextBody("companyName", u.getCompanyName())
                                         .addTextBody("outletName", u.getOutletName());
                }
                
                HttpEntity multiPartEntity = builder.build();
                System.out.println(multiPartEntity);

                HttpHost target = new HttpHost((String)session.getAttribute("url"), (Integer)session.getAttribute("port"), "http");

                HttpPost postRequest = new HttpPost("/API/CreateCategoryServlet");

                postRequest.setEntity(multiPartEntity);
                
                HttpResponse httpResponse = httpclient.execute(target, postRequest);
                HttpEntity entity = httpResponse.getEntity();

                int statusCode = httpResponse.getStatusLine().getStatusCode();
                
                if(statusCode == 202){
                    u.addCategory(category);
                    System.out.println("Successfully added category" + category);
                    request.setAttribute("successMsg", category + " successfully created");
                    request.getRequestDispatcher("CreateCategory.jsp").forward(request, response);
                }else{
                    System.out.println("Error, redirect to create create category page");
                    request.setAttribute("errorMsg", "Unable to create " + category);
                    request.getRequestDispatcher("CreateCategory.jsp").forward(request, response);
                }
            }catch(Exception e){
                e.printStackTrace();
                request.setAttribute("errorMsg", "Error: " + e.getMessage());
                request.getRequestDispatcher("CreateCategory.jsp").forward(request, response);
            }
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
