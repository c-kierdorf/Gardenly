package web.questionaire;

import java.util.Properties;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;
import model.user.SendEmailCredentials;

public class SendPreQuestionaireEmail {

    public boolean sendEmail(String nickName,
            String email,
            String technik,
            String erwartungen) {
        boolean test = false;

        String toEmail = "533236@fom-net.de";
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
            msg.addRecipient(Message.RecipientType.TO, new InternetAddress(toEmail));
            if (!email.equals("")) {
                msg.addRecipient(Message.RecipientType.BCC, new InternetAddress(email));
            }
            msg.setSubject(MimeUtility.encodeText("Gardenly Vor-Befragung", "utf-8", "B"));
            msg.setContent("Neue Vor-Befragungsergebnisse:<br><br>"
                    + "<b>Nickname</b>:<br>" + nickName + "<br><br>"
                    + "<b>Einstellung zu Technik allgemein</b>:<br>" + technik + "<br><br>"
                    + "<b>Erwartungen an das vorgestellte System</b>:<br>" + erwartungen + "<br><br>"
                    + "<br>Danke für deine Teilnahme!"
                    + "<br><br>", "text/html; charset=utf-8");

            Transport.send(msg);

            test = true;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return test;
    }
}
