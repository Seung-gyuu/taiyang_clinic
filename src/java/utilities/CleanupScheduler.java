package utilities;

import java.util.Timer;
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
    }

    @Override
    public void contextDestroyed(ServletContextEvent event) {
        if (timer != null) {
            timer.cancel();
        }
    }
}
