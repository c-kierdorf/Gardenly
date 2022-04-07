package web.passwordrecovery;

import db.User;
import java.util.Properties;
import java.util.Random;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import model.user.SendEmailCredentials;

public class SendNewPwdEmail {
    
    public String getRandom() {
        Random rnd = new Random();
        int number = rnd.nextInt(99999);
        return String.format("%06d", number);
    }
    
    public boolean sendEmail(User user) {
        boolean test = false;

        String toEmail = user.getEmail();
        SendEmailCredentials sendEmailCredentials = new SendEmailCredentials();
        String fromEmailAlfahosting = sendEmailCredentials.getFromEmailAlfahosting();
        String usernameAlfahosting = sendEmailCredentials.getUsernameAlfahosting();
        String passwordAlfahosting = sendEmailCredentials.getPasswordAlfahosting();

        try {
            Properties pr = new Properties();
            pr.put("mail.smtp.host", sendEmailCredentials.getHostAlfahosting());
            pr.put("mail.smtp.port", sendEmailCredentials.getPortAlfahosting());
            pr.put("mail.smtp.ssl.enable", "true");
            pr.put("mail.smtp.auth", "true");

            Session session = Session.getInstance(pr, new Authenticator() {
                @Override
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(usernameAlfahosting, passwordAlfahosting);
                }
            });

            Message msg = new MimeMessage(session);
            msg.setFrom(new InternetAddress(fromEmailAlfahosting));
            msg.setRecipient(Message.RecipientType.TO, new InternetAddress(toEmail));
            msg.setSubject("Gardenly Passwort zurücksetzen");
            msg.setContent("Hallo " + user.getFirstName() + "!<br />"
                    + "Du hast das zurücksetzen deines Passworts angefordert. "
                    + "Bitte klicke auf den unten stehenden Link, um dein "
                    + "Passwort zurückzusetzen:<br /><br />"
                    + "<a href='http://gardenly.garden/passwordrecovery/RequestNewPassword.jsp?email="+user.getEmail()+"&authcode="+user.getEmailVerificationCode()
                    + "'>http://gardenly.garden/passwordrecovery/RequestNewPassword.jsp?email="+user.getEmail()+"&authcode="+user.getEmailVerificationCode()
                    + "</a>", "text/html; charset=utf-8");

            Transport.send(msg);

            test = true;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return test;
    }
}
