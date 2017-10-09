/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
public class mail {
    private final Properties properties = new Properties();
    private Session session;
    private Boolean exito=false;
    private void init() {
        properties.put("mail.smtp.host", "smtp.gmail.com");
        properties.put("mail.smtp.starttls.enable", "true");
         /*properties.put("mail.smtp.port", 587);*/
        properties.put("mail.smtp.port",587);
        properties.put("mail.smtp.mail.sender", "seduviqroo@gmail.com");
        properties.put("mail.smtp.password", "seduviqroo01");
        /* properties.put("mail.smtp.password", "veronica1972");*/
        properties.put("mail.smtp.user", "seduviqroo@gmail.com");
        properties.put("mail.smtp.auth", "true");
        session = Session.getDefaultInstance(properties);
    }
    public boolean send(String destino,String asunto, String mensaje) {
        init();
        try {
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress((String) properties.get("mail.smtp.mail.sender")));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(destino));
            message.setSubject(asunto);
            message.setContent(mensaje,"text/html");
            //message.setText("Texto");
            Transport t = session.getTransport("smtp");
            t.connect((String) properties.get("mail.smtp.user"), (String) properties.get("mail.smtp.password"));
            
            t.sendMessage(message, message.getAllRecipients());
            t.close();
            exito=true;
        } catch (MessagingException e) {
            
            return false;
        }
        return exito;
    }
}