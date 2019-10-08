package kr.or.ddit.smartware.email.web;

import java.io.File;
import java.util.List;
import java.util.Properties;

import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class EmailController {
	
	@GetMapping(path = "writeMail")
	public String writeMail() {
		
		return "tiles.writeMail";
	}
	//답글 @PostMapping 으로 return "tiles.writeMail"
	
	
	@PostMapping(path = "sendEmail")
    public String sendEmail(String email, String emailPass, String reci, String subject, String cont, @RequestPart("attatch") List<MultipartFile> attatch) {
		System.out.println(reci);
	
		String[] arr = reci.split(" ");
		String rEmail = "";
		for(int i = 0; i < arr.length; i++) {
			if(i == 0) {
				rEmail += arr[i];	
			}else {
				rEmail += ", " + arr[i];
			}
		}
		
		
		System.out.println(cont);
		
        final String username = email;
        final String password = emailPass;

        Properties prop = new Properties();
		prop.put("mail.smtp.host", "smtp.gmail.com");
        prop.put("mail.smtp.port", "587");
        prop.put("mail.smtp.auth", "true");
        prop.put("mail.smtp.starttls.enable", "true"); //TLS
        
        Session session = Session.getInstance(prop,
                new javax.mail.Authenticator() {
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(username, password);
                    }
                });

        try {

            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(username));
            message.setRecipients(
                    Message.RecipientType.TO,
                    InternetAddress.parse(rEmail)
            );
            message.setSubject(subject);
            
            
            MimeMultipart multipart = new MimeMultipart("related");
            
            // first part  (the html)
            BodyPart messageBodyPart = new MimeBodyPart();
            String htmlText = cont;
            if(!cont.contains("<")) {
            	message.setText(cont);
            	 Transport.send(message);
            	return "redirect:/login";
            }
           messageBodyPart.setContent(htmlText, "text/html;charset=UTF-8");
     
            // add it
            multipart.addBodyPart(messageBodyPart);
            
            // second part (the image)
            messageBodyPart = new MimeBodyPart();
            DataSource fds = new FileDataSource("D:\\A_TeachingMaterial\\8.LastProject\\workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\SmartWare\\images\\james.png");
            messageBodyPart.setDataHandler(new DataHandler(fds));
            messageBodyPart.setHeader("Content-ID","<image>");
     
            // add it
            multipart.addBodyPart(messageBodyPart);


            message.setContent(cont, "text/html;charset=UTF-8");
            //setFile, upload 한 파일 읽기 
            
//            for(MultipartFile attachedFile : attatch) {
//            }
            
            
            Transport.send(message);

            System.out.println("Done");

        } catch (MessagingException e) {
            e.printStackTrace();
        }
        
        return "redirect:/login";
    }
	
	
	
	
}
