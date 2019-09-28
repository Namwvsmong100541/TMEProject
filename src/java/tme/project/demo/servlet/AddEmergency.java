/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tme.project.demo.servlet;

import com.amazonaws.services.s3.model.ObjectMetadata;
import com.amazonaws.util.IOUtils;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.time.Instant;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import tme.project.demo.model.Ticket;
import tme.project.demo.service.S3client;

/**
 *
 *
 */
@MultipartConfig
public class AddEmergency extends HttpServlet {

    private ObjectMetadata getMetadata(Part filePart) throws IOException {
        InputStream is = filePart.getInputStream();
        OutputStream ops = null;
        byte[] contentByte = IOUtils.toByteArray(is);
        Long contentLength = Long.valueOf(contentByte.length);

        ObjectMetadata metadata = new ObjectMetadata();
        metadata.setContentLength(contentLength);
        return metadata;
    }
    
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
        request.setCharacterEncoding("UTF-8");
        String target = "/AddEmergency.jsp";
        String code = null;
        String alert = null;
        String message = null;
        HttpSession session = request.getSession(false);
        if (session != null) {
            if (session.getAttribute("member_id") != null && session.getAttribute("isLoged").equals("yes")) {
                try{
                String name = request.getParameter("name");
                String desc = request.getParameter("desc");
                String place = request.getParameter("place");
                int id = Integer.parseInt((String)session.getAttribute("member_id"));
                String lat = request.getParameter("lat_value");
                String lon = request.getParameter("lon_value");

                Part filePart = request.getPart("image");
                String fileName = System.currentTimeMillis() + "-" + filePart.getSubmittedFileName();
                ObjectMetadata metadata = this.getMetadata(filePart);
                InputStream fileContent = filePart.getInputStream();

                S3client s3client = new S3client();
                String url = s3client.upload(fileName, fileContent, metadata);

                Ticket t = new Ticket(name, desc, place, id, lat, lon, url);
                
                if (t.addTicket()) {
                    code = "success";
                    alert = "Success!";
                    message = "แจ้งเหตุเรียบร้อย";
                  
                } else {
                    code = "warning";
                    alert = "Warning!";
                    message = "เกิดข้อผิดพลาด";
                }
                } catch (Exception ex) {
                    System.out.println("AddTicket.ex: "+ex.getMessage());
                    ex.printStackTrace();
                }
            } else {
                code = "Error";
                alert = "Error!";
                message = "Re-Login Pleased.";
                target = "/Login.jsp";
            }
        } else {
            code = "Error";
            alert = "Error!";
            message = "Re-Login1 Pleased.";
        }
        
        request.setAttribute("code", code);
        request.setAttribute("alert", alert);
        request.setAttribute("message", message);
        getServletContext().getRequestDispatcher(target).forward(request, response);
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
