/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controller.servlets;

import com.google.gson.Gson;
import com.model.MysqlDaoSingleton;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author AlexeiArtemov
 */
@WebServlet(name = "ShowValidTimes", urlPatterns = {"/ShowValidTimes"})
public class ShowValidTimes extends HttpServlet {

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
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            request.setCharacterEncoding("UTF-8");
            
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            Date date =  dateFormat.parse(request.getParameter("date"));

            Calendar calendar = new GregorianCalendar();
            calendar.setTime(date);
            int dayOfWeek = calendar.get(Calendar.DAY_OF_WEEK);
            
            Map<String, String> validTimesMap = new TreeMap<>();
            
            switch (dayOfWeek) {
                case Calendar.SUNDAY:
                    break;
                case Calendar.SATURDAY:
                    validTimesMap.put("10:00:00", "10:00");
                    validTimesMap.put("10:30:00", "10:30");
                    validTimesMap.put("11:00:00", "11:00");
                    validTimesMap.put("11:30:00", "11:30");
                    validTimesMap.put("12:00:00", "12:00");
                    validTimesMap.put("12:30:00", "12:30");
                    break;
                default:
                    validTimesMap.put("17:00:00", "17:00");
                    validTimesMap.put("17:30:00", "17:30");
                    validTimesMap.put("18:00:00", "18:00");
                    validTimesMap.put("18:30:00", "18:30");
                    validTimesMap.put("19:00:00", "19:00");
                    validTimesMap.put("19:30:00", "19:30");
                    break;
            }
            
            List<String> timesList = MysqlDaoSingleton.getInstance().readTimesByDate(date);
            
            for(String key : timesList) {
                if(validTimesMap.containsKey(key))
                    validTimesMap.remove(key);
            }
            
            String json= new Gson().toJson(validTimesMap); 
            
            out.write(json);

        } catch (ParseException | NumberFormatException ex) {
            Logger.getLogger(ShowValidTimes.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(ShowValidTimes.class.getName()).log(Level.SEVERE, null, ex);
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
