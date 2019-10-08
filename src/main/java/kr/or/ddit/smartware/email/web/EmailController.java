package kr.or.ddit.smartware.email.web;

import java.io.IOException;
import java.util.Date;
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
import javax.mail.internet.MimeUtility;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.smartware.util.file.FileUtil;
import kr.or.ddit.smartware.util.file.model.FileInfo;

@Controller
public class EmailController {
	
	@GetMapping(path = "writeMail")
	public String writeMail() {
		
		return "tiles.writeMail";
	}
	//답글 @PostMapping 으로 return "tiles.writeMail"
	
	
	@PostMapping(path = "sendEmail")
    public String sendEmail(String email, String emailPass, String reci, String subject, String cont, @RequestPart("attatch") List<MultipartFile> attatch) {
	
		String[] arr = reci.split(" ");
		String rEmail = "";
		for(int i = 0; i < arr.length; i++) {
			if(i == 0) {
				rEmail += arr[i];	
			}else {
				rEmail += ", " + arr[i];
			}
		}
		
		
		
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
            message.setSentDate(new Date());
            message.setRecipients(
                    Message.RecipientType.TO,
                    InternetAddress.parse(rEmail)
            );
            message.setSubject(subject);
            message.setText(cont);
            
            
            
            MimeMultipart multipart = new MimeMultipart("related");
            // first part  (the html)
            BodyPart messageBodyPart = new MimeBodyPart();
            messageBodyPart.setContent(cont, "text/html;charset=UTF-8");
            
            // add it
            multipart.addBodyPart(messageBodyPart);
            
            if(attatch.size() > 0) {
            	
            	for(MultipartFile attachedFile : attatch) {
            		
            		FileInfo fileInfo = FileUtil.getFileInfo(attachedFile.getOriginalFilename());
            		//첨부된 파일이 있을 경우만 업로드 처리
            		attachedFile.transferTo(fileInfo.getFile());

    			    if(attachedFile.getSize() > 0) {
	            		
	            		messageBodyPart = new MimeBodyPart();
	            		DataSource fds = new FileDataSource(fileInfo.getFile());
	            		messageBodyPart.setDataHandler(new DataHandler(fds));
	            		
	            		String fileName = fds.getName(); // 한글파일명은 영문으로 인코딩해야 첨부가 된다.
	            		fileName = new String(fileName.getBytes("KSC5601"), "8859_1");
//	            		messageBodyPart.setFileName(MimeUtility.encodeText(fds.getName(), "EUC-KR","B"));
	            		messageBodyPart.setFileName(fileName);
	            		System.out.println(messageBodyPart.getFileName());
	            		multipart.addBodyPart(messageBodyPart);
    			    }
            	}
            }
            
            message.setContent(multipart);
            
            Transport.send(message);


        } catch (MessagingException e) {
            e.printStackTrace();
        } catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
        
        return "redirect:/login";
    }
	
	
	
	
}
