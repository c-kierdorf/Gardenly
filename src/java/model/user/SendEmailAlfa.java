package model.user;

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
import javax.mail.internet.MimeUtility;

public class SendEmailAlfa {

    public String getRandom() {
        Random rnd = new Random();
        int number = rnd.nextInt(99999);
        return String.format("%06d", number);
    }

    public boolean sendEmail(User user) {
        boolean test = false;

        String toEmail = user.getEmail();
        String fromEmailAlfahosting = SendEmailCredentials.getFromEmailAlfahosting();
        String usernameAlfahosting = SendEmailCredentials.getUsernameAlfahosting();
        String passwordAlfahosting = SendEmailCredentials.getPasswordAlfahosting();


        try {
            Properties pr = new Properties();
            pr.put("mail.smtp.host", SendEmailCredentials.getHostAlfahosting());
            pr.put("mail.smtp.port", SendEmailCredentials.getPortAlfahosting());
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
            msg.setSubject(MimeUtility.encodeText("Gardenly Registrierungsbestätigung", "utf-8", "B"));
            msg.setContent("Hallo " + user.getFirstName() + "!<br />"
                    + "Du hast dich kürzlich bei Gardenly registriert. "
                    + "Bitte bestätige die Registrierung, in dem du folgenden "
                    + "Code benutzt:<br /><br /><b>"
                    + user.getEmailVerificationCode() + "</b>", "text/html; charset=utf-8");

            Transport.send(msg);

            test = true;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return test;
    }

}
