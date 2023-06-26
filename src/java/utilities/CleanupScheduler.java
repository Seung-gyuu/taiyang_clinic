package utilities;

import java.util.Timer;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

@WebListener
public class CleanupScheduler implements ServletContextListener {

    private Timer timer;

    @Override
    public void contextInitialized(ServletContextEvent event) {
         System.out.println("Application startup: StartupListener initialized");
  
        timer = new Timer();
        // Run the task every hour (adjust the interval as needed)
        long interval = 24 * 60 * 1000;
        timer.schedule(new DeleteExpired(), 0, interval);
        try {
            timer.schedule(new UpdateTimes(), 0,interval);
            timer.schedule(new UpdateOldAppointments(),0, interval);
            timer.schedule(new SendReminderEmail(event.getServletContext()),interval * 2);

        } catch (Exception ex) {
            Logger.getLogger(CleanupScheduler.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public void contextDestroyed(ServletContextEvent event) {
        if (timer != null) {
            timer.cancel();
        }
    }
}
