package utilities;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;

public class SendValidationEmail {
    private static final String SMTP_HOST = "smtp.gmail.com";
    private static final int SMTP_PORT = 587;
    private static final String SMTP_USERNAME = "taiyangclinicnoreply@gmail.com";
//    private static final String SMTP_PASSWORD = "taiyangclinic123"; 
    //private static final String SMTP_PASSWORD = "xyttzmfoqsvhdzen";  //on the desktop
    private static final String SMTP_PASSWORD = "jiqaygcaviivmpbm";  // on laptop    -- not a password issue, sait secure doesnt allow email send?? maybe too slow
    //otherwise when using a vpn it goes a lot faster so only test when on sait secure using vpn !!!!
    private static final String EMAIL_FROM = "taiyangclinicnoreply@gmail.com";
    private static final String EMAIL_SUBJECT = "Tai Yang Clinic Account Validation";
    private static final String EMAIL_CONTENT = "Please click on the link to validate your account :)! \n ";
    
    public static void sendValidationEmail(String recipientEmail, String validationLink) throws MessagingException {
        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", SMTP_HOST);
        props.put("mail.smtp.port", SMTP_PORT);
        props.put("mail.debug", "true");

        Session session = Session.getInstance(props, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(SMTP_USERNAME, SMTP_PASSWORD);
            }
        });

        Message message = new MimeMessage(session);
        message.setFrom(new InternetAddress(EMAIL_FROM));
        message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(recipientEmail));
        message.setSubject(EMAIL_SUBJECT);
        message.setText(EMAIL_CONTENT + validationLink);

        Transport.send(message);
    }
}