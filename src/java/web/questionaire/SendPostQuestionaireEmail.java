package web.questionaire;

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

public class SendPostQuestionaireEmail {

    public boolean sendEmail(Participant participant,
            String pe1,
            String pe2,
            String pe3,
            String pe4,
            String ee1,
            String ee2,
            String ee3,
            String ee4,
            String si1,
            String si2,
            String si3,
            String fc1,
            String fc2,
            String fc3,
            String fc4,
            String hm1,
            String hm2,
            String hm3,
            String pv1,
            String pv2,
            String pv3,
            String ht1,
            String ht2,
            String ht3,
            String ht4,
            String bi1,
            String bi2,
            String bi3,
            String use,
            String sq1,
            String sq2,
            String sq3,
            String sq4,
            String sq5,
            String hq1,
            String hq2,
            String hq3,
            String hq4,
            String hq5,
            String lob,
            String kritik,
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
            if (!participant.getEmail().equals("")) {
                msg.addRecipient(Message.RecipientType.BCC, new InternetAddress(participant.getEmail()));
            }
            msg.setSubject(MimeUtility.encodeText("Neue Nach-Befragungsergebnisse von " + participant.getNickName(), "utf-8", "B"));
            msg.setContent("Neue Nach-Befragungsergebnisse:<br><br>"
                    
                    + "<h3>Testperson</h3><br>"
                    + "<b>Name</b>:<br>" + participant.getNickName() + "<br><br>"
                    + "<b>Alter</b>:<br>" + participant.getAge() + " Jahre<br><br>"
                    + "<b>Geschlecht</b>:<br>" + participant.getGender() + "<br><br>"
                    + "<b>Höchster Bildungsabschluss</b>:<br>" + participant.getEducation()+ "<br><br>"
                    + "<b>Beruf</b>:<br>" + participant.getProfession() + "<br><br>"
                            
                    + "<h3>Performance Expectancy / Leistungserwartung</h3><br>"
                    + "<b>PE1: Ich empfinde Gardenly in meinem Alltag als nützlich</b>:<br>" + pe1 + "<br><br>"
                    + "<b>PE2: Die Nutzung von Gardenly erhöht meine Chancen, Dinge zu erreichen, die mir wichtig sind</b>:<br>" + pe2 + "<br><br>"
                    + "<b>PE3: Die Nutzung von Gardenly hilft mir dabei, Dinge schneller zu erreichen</b>:<br>" + pe3 + "<br><br>"
                    + "<b>PE4: Die Nutzung von Gardenly erhöht meine Produktivität</b>:<br>" + pe4 + "<br><br>"
                    
                    + "<h3>Effort Expectancy / Aufwandserwartung</h3><br>"        
                    + "<b>EE1: Gardenly anwenden zu lernen ist einfach für mich</b>:<br>" + ee1 + "<br><br>"
                    + "<b>EE2: Meine Interaktion mit Gardenly ist klar und verständlich</b>:<br>" + ee2 + "<br><br>"
                    + "<b>EE3: Ich finde, Gardenly ist einfach anzuwenden</b>:<br>" + ee3 + "<br><br>"
                    + "<b>EE4: Es ist einfach für mich, geübt im Verwenden von Gardenly zu werden</b>:<br>" + ee4 + "<br><br>"
                    
                    + "<h3>Social Influence / Sozialer Einfluss</h3><br>"                
                    + "<b>SI1: Personen, die mir wichtig sind, denken, ich sollte Gardenly verwenden</b>:<br>" + si1 + "<br><br>"
                    + "<b>SI2: Personen, die mein Verhalten beeinflussen, denken, ich sollte Gardenly verwenden</b>:<br>" + si2 + "<br><br>"
                    + "<b>SI3: Personen, deren Meinung ich schätze, ziehen vor, dass ich Gardenly verwende</b>:<br>" + si3 + "<br><br>"
                    
                    + "<h3>Facilitating Conditions / Erleichternde Bedingungen</h3><br>"
                    + "<b>FC1: Ich habe die notwendigen Ressourcen zum Verwenden von Gardenly</b>:<br>" + fc1 + "<br><br>"
                    + "<b>FC2: Ich habe das notwendige Wissen zum Verwenden von Gardenly</b>:<br>" + fc2 + "<br><br>"
                    + "<b>FC3: Gardenly ist kompatibel mit anderen von mir benutzten Technologien und Anwendungen</b>:<br>" + fc3 + "<br><br>"
                    + "<b>FC4: Ich kann Hilfe von anderen bekommen, wenn ich Schwierigkeiten beim Verwenden von Gardenly habe</b>:<br>" + fc4 + "<br><br>"
                    
                    + "<h3>Hedonic Motivation / Hedonische Motivation</h3><br>"
                    + "<b>HM1: Gardenly zu verwenden macht Spaß</b>:<br>" + hm1 + "<br><br>"
                    + "<b>HM2: Gardenly zu verwenden ist vergnüglich</b>:<br>" + hm2 + "<br><br>"
                    + "<b>HM3: Gardenly zu verwenden ist sehr unterhaltsam</b>:<br>" + hm3 + "<br><br>"
                    
                    + "<h3>Price Value / Preis-Leistungs-Verhältnis</h3><br>"
                    + "<b>PV1: Gardenly ist preisgünstig (Kaufpreis 70,- €)</b>:<br>" + pv1 + "<br><br>"
                    + "<b>PV2: Gardenly bietet einen guten Nutzen für das Geld (Kaufpreis 70,- €)</b>:<br>" + pv2 + "<br><br>"
                    + "<b>PV3: Zum derzeitigen Preis bietet Gardenly einen guten Nutzen (Kaufpreis 70,- €)</b>:<br>" + pv3 + "<br><br>"
                    
                    + "<h3>Habit / Gewohnheit</h3><br>"        
                    + "<b>HT1: Gardenly zu verwenden ist bei mir zur Angewohnheit geworden</b>:<br>" + ht1 + "<br><br>"
                    + "<b>HT2: Ich bin süchtig danach Gardenly zu verwenden</b>:<br>" + ht2 + "<br><br>"
                    + "<b>HT3: Ich muss Gardenly verwenden</b>:<br>" + ht3 + "<br><br>"
                    + "<b>HT4: Gardenly zu verwenden ist bei mir zu etwas Natürlichem geworden</b>:<br>" + ht4 + "<br><br>"

                    + "<h3>Behavioral Intention / Verhaltensabsicht</h3><br>"
                    + "<b>BI1: Ich beabsichtige, in der Zukunft auch weiterhin Gardenly zu verwenden</b>:<br>" + bi1 + "<br><br>"
                    + "<b>BI2: Ich werde im Alltag immer versuchen, Gardenly zu verwenden</b>:<br>" + bi2 + "<br><br>"
                    + "<b>BI3: Ich habe vor, weiterhin regelmäßig Gardenly zu verwenden</b>:<br>" + bi3 + "<br><br>"

                    + "<h3>Use Behavior / Verwendung</h3><br>"
                    + "<b>USE: Bitte wähle deine Nutzungshäufigkeit von Gardenly aus:</b>:<br>" + use + "<br><br>"

                    + "<h3>App (Software) Qualität</h3><br>"
                    + "<b>SQ1: Die App sieht attraktiv aus und nutzt passende Schriftarten und Farben</b>:<br>" + sq1 + "<br><br>"
                    + "<b>SQ2: Die App sieht gut organisiert aus</b>:<br>" + sq2 + "<br><br>"
                    + "<b>SQ3: Die App ist jederzeit erreichbar und zuverlässig</b>:<br>" + sq3 + "<br><br>"
                    + "<b>SQ4: Die App ist vertrauenswürdig</b>:<br>" + sq4 + "<br><br>"
                    + "<b>SQ5: Der Inhalt der App ist nützlich und stets aktuell</b>:<br>" + sq5 + "<br><br>"
                    
                    + "<h3>Geräte (Hardware) Qualität</h3><br>"
                    + "<b>HQ1: Das Gerät sieht attraktiv aus und nutzt passende Bauteile</b>:<br>" + hq1 + "<br><br>"
                    + "<b>HQ2: Das Gerät sieht gut organisiert aus</b>:<br>" + hq2 + "<br><br>"
                    + "<b>HQ3: Das Gerät ist jederzeit betriebsbereit und zuverlässig</b>:<br>" + hq3 + "<br><br>"
                    + "<b>HQ4: Das Gerät ist vertrauenswürdig</b>:<br>" + hq4 + "<br><br>"
                    + "<b>HQ5: Die Informationen die das Gerät liefern sind nützlich und stets aktuell</b>:<br>" + hq5 + "<br><br>"
                    
                    + "<h3>Offene Fragen</h3><br>"
                    + "<b>Lob: Folgendes lobe ich besonders an Gardenly</b>:<br>" + lob + "<br><br>"
                    + "<b>Kritik: Folgendes kritisiere ich besonders an Gardenly</b>:<br>" + kritik + "<br><br>"
                    + "<b>Weiterentwicklung: Folgendes würde ich mir für eine nächste Version von Gardenly wünschen</b>:<br>" + weiterentwicklung + "<br><br>"
                    
                    + "<hr>", "text/html; charset=utf-8");

            Transport.send(msg);

            test = true;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return test;
    }
}
