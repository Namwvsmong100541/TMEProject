/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tme.project.demo.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import tme.project.demo.model.Ticket;

/**
 *
 * @author LENOVO
 */
public class History extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String target = "/History.jsp";
        String code = null;
        String alert = null;
        String message = null;
        HttpSession session = request.getSession(false);
        String position = (String) session.getAttribute("member_position");
        int userId = Integer.parseInt((String) session.getAttribute("member_id"));
        List<Ticket> tickets = null;

        if (session != null) {
            if (session.getAttribute("member_id") != null && session.getAttribute("isLoged").equals("yes")) {
                if (position.equals("2")) {
                    target = "/History.jsp";
                }
                int member_id = Integer.valueOf((String) session.getAttribute("member_id"));
                tickets = Ticket.getTicketsByNotifyMemberId(member_id);

            } else {
                code = "Error";
                alert = "Error!";
                message = "Re-Login Pleased.";
                target = "/Login.jsp";
            }
        } else {
            code = "Error";
            alert = "Error!";
            message = "Re-Login Pleased.";
        }
        request.setAttribute("code", code);
        request.setAttribute("alert", alert);
        request.setAttribute("message", message);
        request.setAttribute("tickets", tickets);
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
