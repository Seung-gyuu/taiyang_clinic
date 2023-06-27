package servlets;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import models.*;
import org.apache.tomcat.util.http.fileupload.FileItem;
import org.apache.tomcat.util.http.fileupload.RequestContext;
import org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;
import org.apache.tomcat.util.http.fileupload.servlet.ServletRequestContext;
import services.*;

/**
 *
 * @author rladm
 */
public class Aform extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String logout = request.getParameter("logout");
        if (logout != null) {
            session.invalidate(); // just by going to the login page the user is logged out :-) 
            getServletContext().getRequestDispatcher("/WEB-INF/home.jsp").forward(request, response);
        }
        UserService us = new UserService();
        try {
            List<User> userList = us.getAll();
            request.setAttribute("userList", userList);
        } catch (Exception e) {
            request.setAttribute("message", "Unable to retrieve users");
            getServletContext().getRequestDispatcher("/WEB-INF/aform.jsp").forward(request, response);
            return;
        }

        getServletContext().getRequestDispatcher("/WEB-INF/aform.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int userId=0;
        String formType = null;
        InputStream fileContent = null;

        DiskFileItemFactory factory = new DiskFileItemFactory();

        // Create a ServletFileUpload
        ServletFileUpload upload = new ServletFileUpload(factory);
        try {
            // Parse the request
                        RequestContext requestContext = new ServletRequestContext(request);

            List<FileItem> items = upload.parseRequest(requestContext);

            // Iterate over the form items
            for (FileItem item : items) {
                if (item.isFormField()) {
                    // Process regular form fields
                    if (item.getFieldName().equals("userId")) {
                        userId = Integer.parseInt(item.getString());
                    } else if (item.getFieldName().equals("formType")) {
                        formType = item.getString();
                    }
                } else {
                    // Process file upload
                    fileContent = item.getInputStream();
                    // You can access file metadata like item.getName(), item.getSize(), etc.
                }
            }

            // Process the form data and uploaded file as needed
        } catch (Exception e) {
            // Handle any exceptions that occur during the file upload process
            e.printStackTrace();
        }

//        String action = request.getParameter("action");
//        if (action != null && action.equals("addForm")) {
//            InputStream fileContent = (request.getPart("pdfFile")).getInputStream();

            ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
            byte[] buffer = new byte[4096];
            int bytesRead;
            while ((bytesRead = fileContent.read(buffer)) != -1) {
                outputStream.write(buffer, 0, bytesRead);
            }
            byte[] fileBytes = outputStream.toByteArray();
            UserService us = new UserService();
            String message = "Error";
            try {
                    User u = us.get(userId);
                if (formType.equals("medical")) {
                    Medicalform mf = new Medicalform();
                    mf.setUserid(u);
                    mf.setTimeAdded(new Date());
                    mf.setPdfFile(fileBytes);
                    MedicalFormService mfs = new MedicalFormService();
                    message = mfs.insert(mf);
                } else if (formType.equals("consent")) {
                    Consentform cf = new Consentform();
                    cf.setUserid(u);
                    cf.setTimeAdded(new Date());
                    cf.setPdfFile(fileBytes);
                    ConsentFormService cfs = new ConsentFormService();
                    message = cfs.insert(cf);
                }
                request.setAttribute("message", message);
                fileContent.close();
                List<User> userList = us.getAll();
                request.setAttribute("userList", userList);
                getServletContext().getRequestDispatcher("/WEB-INF/aform.jsp").forward(request, response);
            } catch (Exception ex) {
                Logger.getLogger(Aform.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

