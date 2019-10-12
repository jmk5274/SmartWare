package kr.or.ddit.smartware.email.web;

import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.annotation.Resource;
import javax.mail.BodyPart;
import javax.mail.Flags;
import javax.mail.Flags.Flag;
import javax.mail.Folder;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.NoSuchProviderException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Store;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.mail.internet.MimeUtility;
import javax.mail.search.FlagTerm;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;

import com.sun.mail.imap.IMAPFolder;

import kr.or.ddit.smartware.email.model.Email;
import kr.or.ddit.smartware.email.service.IEmailService;
import kr.or.ddit.smartware.employee.model.Employee;
import kr.or.ddit.smartware.employee.service.IEmployeeService;
import kr.or.ddit.smartware.util.file.FileUtil;
import kr.or.ddit.smartware.util.file.model.FileInfo;

@Controller
public class EmailController {
   private static final Logger logger = LoggerFactory.getLogger(EmailController.class);
   
   @Resource(name = "emailService")
   private IEmailService emailService;
   
   @Resource(name = "employeeService")
   private IEmployeeService employeeService;
   
   
   @GetMapping(path = "writeMail")
   public String writeMail(Model model) {
      List<Map> departList = emailService.getDepartMentList();
      
//      String[] value = null;
////      for(Map depart : departList) {
//      for(int i = 0; i < departList.size(); i++) {
//         logger.debug("depart.get(\"DEPART_ID\") - {}", departList.get(i).get("DEPART_ID"));
//         value[i] = (String) departList.get(i).get("DEPART_ID");
//         
//      }
      
      List<Employee> employeeList = employeeService.allEmployeeList();
      List<Map> positionList = emailService.getPositionList();
      
      logger.debug("departList - {}", departList);
      model.addAttribute("departList", departList);
      model.addAttribute("employeeList", employeeList);
      model.addAttribute("positionList", positionList);
      
      return "tiles.writeMail";
   }
   //답글 @PostMapping 으로 return "tiles.writeMail"
   
   
   @PostMapping(path = "sendEmail")
    public String sendEmail(Model model, String email, String emailPass, String reci, String subject, String cont, @RequestPart("attatch") List<MultipartFile> attatch) {
   
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
        boolean flag = false;

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
//                     messageBodyPart.setFileName(MimeUtility.encodeText(fds.getName(), "EUC-KR","B"));
                     messageBodyPart.setFileName(fileName);
                     System.out.println(messageBodyPart.getFileName());
                     multipart.addBodyPart(messageBodyPart);
                 }
               }
            }
            
            message.setContent(multipart);
            
            Transport.send(message);
            flag = true;


        } catch (MessagingException e) {
           flag = false;
           e.printStackTrace();
        } catch (IllegalStateException e) {
         e.printStackTrace();
      } catch (IOException e) {
         e.printStackTrace();
      }
        
        model.addAttribute("flag", flag);
        
        return "redirect:/writeMail";
    }
   

   
   @RequestMapping(path = "validator")
   public String validator(Model model, Email email, BindingResult result) {
      // form객체(command, vo)의 검증 결과를 담는 BindingResult객체는
      // 반드시 메소드 인자 순서에서 form객체 바로 뒤에 위치해야 된다.
      List<Map> departList = emailService.getDepartMentList();
      List<Employee> employeeList = employeeService.allEmployeeList();
      List<Map> positionList = emailService.getPositionList();
      
      model.addAttribute("departList", departList);
      model.addAttribute("employeeList", employeeList);
      model.addAttribute("positionList", positionList);
      
      // validator 실행
      new EmailValidator().validate(email, result);

      if(result.hasErrors()) logger.debug("has Error");
      else logger.debug("no Error");

      return "tiles.writeMail";
   }
   
//   @RequestMapping(path = "test")
//   public String test() {
//      return "tiles.test";
//   }
   
   @RequestMapping(path = "test")
   public String receiveMail() throws MessagingException, IOException {
       IMAPFolder folder = null;
           Store store = null;
           String subject = null;
           Flag flag = null;
           try 
           {
             Properties props = System.getProperties();
             props.setProperty("mail.store.protocol", "imaps");

             Session session = Session.getDefaultInstance(props, null);

             store = session.getStore("imaps");
             store.connect("imap.googlemail.com","testhoon1217@gmail.com", "ewqdsa556");

             folder = (IMAPFolder) store.getFolder("inbox"); // This doesn't work for other email account
             //folder = (IMAPFolder) store.getFolder("inbox"); This works for both email account


             if(!folder.isOpen())
             folder.open(Folder.READ_WRITE);
             Message[] messages = folder.getMessages();
             System.out.println("No of Messages : " + folder.getMessageCount());
             System.out.println("No of Unread Messages : " + folder.getUnreadMessageCount());
             System.out.println(messages.length);
             for (int i=0; i < messages.length;i++) 
             {

               System.out.println("*****************************************************************************");
               System.out.println("MESSAGE " + (i + 1) + ":");
               Message msg =  messages[i];
               //System.out.println(msg.getMessageNumber());
               //Object String;
               //System.out.println(folder.getUID(msg)

               subject = msg.getSubject();

               System.out.println("Subject: " + subject);
               System.out.println("From: " + msg.getFrom()[0]);
              System.out.println("To: "+msg.getAllRecipients()[0]);
               System.out.println("Date: "+msg.getReceivedDate());
               System.out.println("Size: "+msg.getSize());
               System.out.println(msg.getFlags());
               System.out.println("Body: \n"+ msg.getContent());
               System.out.println(msg.getContentType());
               System.out.println("NUMBER : " +msg.getMessageNumber());

             }
           }
           finally 
           {
             if (folder != null && folder.isOpen()) { folder.close(true); }
             if (store != null) { store.close(); }
           }
           return "tiles.test";

       }
   
   @GetMapping(path = "addressbook")
   public String addressbook(Model model) {
      return "tiles.writeMail";
   }
   
   
   
   
   
   
   
   
   
}