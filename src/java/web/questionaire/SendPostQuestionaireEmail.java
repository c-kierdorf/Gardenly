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

public class SendPostQuestionaireEmail {

    public boolean sendEmail(String nickName,
            String email,
            String q1,
            String q2,
            String q3,
            String q4,
            String q5,
            String q6,
            String q7,
            String q8,
            String q9,
            String q10,
            String q11,
            String q12,
            String q13,
            String q14,
            String q15,
            String q16,
            String q17,
            String q18,
            String q19,
            String kritik,
            String lob,
            String weiterentwicklung) {
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
            msg.setSubject(MimeUtility.encodeText("Gardenly Nach-Befragung", "utf-8", "B"));
            msg.setContent("Neue Nach-Befragungsergebnisse:<br><br>"
                    + "<b>Nickname</b>:<br>" + nickName + "<br><br>"
                    + "<b>Q1: Insgesamt bin ich zufrieden damit, wie einfach das System zu bedienen ist</b>:<br>" + q1 + "<br><br>"
                    + "<b>Q2: Es ist nicht einfach, das System zu bedienen</b>:<br>" + q2 + "<br><br>"
                    + "<b>Q3: Mit dem System kann ich das Ziel Pflanzenbewässerung effektiv erreichen</b>:<br>" + q3 + "<br><br>"
                    + "<b>Q4: Ich bin nicht in der Lage, mit dem System die Pflanzenbewässerung schnell zu erledigen</b>:<br>" + q4 + "<br><br>"
                    + "<b>Q5: Das System erlaubt mir, Pflanzenbewässerung effizient zu machen</b>:<br>" + q5 + "<br><br>"
                    + "<b>Q6: Ich fühle mich nicht wohl dabei, das System zu benutzen</b>:<br>" + q6 + "<br><br>"
                    + "<b>Q7: Es war einfach zu lernen, wie das System funktioniert</b>:<br>" + q7 + "<br><br>"
                    + "<b>Q8: Ich glaube, ich konnte das System schnell zweckmäßig bedienen</b>:<br>" + q8 + "<br><br>"
                    + "<b>Q9: Bei Fehlern zeigt das System klare Hinweise, wie ich den Fehler beheben kann</b>:<br>" + q9 + "<br><br>"
                    + "<b>Q10: Wenn ich einen Fehler gemacht habe, konnte ich diesen schnell wieder beheben</b>:<br>" + q10 + "<br><br>"
                    + "<b>Q11: Die Informationen, die das System bereitstellt (Anleitungen oder Hinweise) sind unverständlich</b>:<br>" + q11 + "<br><br>"
                    + "<b>Q12: Es ist einfach, die Informationen zu finden, die ich brauche</b>:<br>" + q12 + "<br><br>"
                    + "<b>Q13: Die Informationen, die das System bereitstellt, sind nicht einfach zu verstehen</b>:<br>" + q13 + "<br><br>"
                    + "<b>Q14: Die Informationen sind effizient und helfen mir, das System zweckmäßig zu bedienen</b>:<br>" + q14 + "<br><br>"
                    + "<b>Q15: Die Informationen auf dem Display sind klar verständlich</b>:<br>" + q15 + "<br><br>"
                    + "<b>Q16: Das Interface des Systems ist angenehm</b>:<br>" + q16 + "<br><br>"
                    + "<b>Q17: Mag es, das Interface des Systems zu bedienen</b>:<br>" + q17 + "<br><br>"
                    + "<b>Q18: Das System hat alle Funktionen und Möglichkeiten, die ich erwarte</b>:<br>" + q18 + "<br><br>"
                    + "<b>Q19: Insgesamt bin ich unzufrieden mit dem System</b>:<br>" + q19 + "<br><br>"
                    + "<b>Q20: Folgendes kritisiere ich besonders an dem System</b>:<br>" + lob + "<br><br>"
                    + "<b>Q21: Folgendes lobe ich besonders an dem System</b>:<br>" + kritik + "<br><br>"
                    + "<b>Q22: Folgendes würde ich mir für eine nächste Version des Systems wünschen</b>:<br>" + weiterentwicklung + "<br><br>"
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
