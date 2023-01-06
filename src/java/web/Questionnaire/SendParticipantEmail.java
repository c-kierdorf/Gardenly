

package web.Questionnaire;

import db.Participant;
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

public class SendParticipantEmail {
    
    public boolean sendEmail(Participant participant) {
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
            if (!participant.getEmail().equals("")) {
                msg.addRecipient(Message.RecipientType.BCC, new InternetAddress(participant.getEmail()));
            }
            msg.setSubject(MimeUtility.encodeText("Neue Probanden-Registrierung von " + participant.getNickName(), "utf-8", "B"));
            msg.setContent("Neue Registrierung eines Probanden:<br><br>"
                    
                    + "<h3>Testperson</h3><br>"
                    + "<b>Name</b>:<br>" + participant.getNickName() + "<br><br>"
                    + "<b>Alter</b>:<br>" + participant.getAge() + " Jahre<br><br>"
                    + "<b>Geschlecht</b>:<br>" + participant.getGender() + "<br><br>"
                    + "<b>Höchster Bildungsabschluss</b>:<br>" + participant.getEducation()+ "<br><br>"
                    + "<b>Beruf</b>:<br>" + participant.getProfession() + "<br><br>"
                    + "<b>Einwilligung</b>:<br>Hiermit erkläre ich mich damit einverstanden, dass die hier eingegebenen Daten und zukünftigen Antworten bei den Fragebögen im Rahmen der Studie zur Akzeptanz automatisierter Pflanzenpflege anonym gespeichert werden. Über die Datenschutzbedingungen wurde ich von der Studienleitung persönlich aufgeklärt.<br><br>"
                    
                    + "<br><hr>", "text/html; charset=utf-8");

            Transport.send(msg);

            test = true;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return test;
    }
}
