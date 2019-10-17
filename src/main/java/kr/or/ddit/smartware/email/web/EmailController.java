package kr.or.ddit.smartware.email.web;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.annotation.Resource;
import javax.mail.Address;
import javax.mail.BodyPart;
import javax.mail.Flags.Flag;
import javax.mail.Folder;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.Part;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Store;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.mail.internet.MimeUtility;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;

import com.sun.mail.imap.IMAPFolder;

import kr.or.ddit.smartware.email.model.Email;
import kr.or.ddit.smartware.employee.model.Department;
import kr.or.ddit.smartware.employee.model.Employee;
import kr.or.ddit.smartware.employee.model.Position;
import kr.or.ddit.smartware.employee.service.IDepartmentService;
import kr.or.ddit.smartware.employee.service.IEmployeeService;
import kr.or.ddit.smartware.employee.service.IPositionService;
import kr.or.ddit.smartware.util.file.FileUtil;
import kr.or.ddit.smartware.util.file.model.FileInfo;

@Controller
public class EmailController {
	private static final Logger logger = LoggerFactory.getLogger(EmailController.class);
	
	@Resource(name = "departmentService")
	private IDepartmentService departmentService;
	
	@Resource(name = "positionService")
	private IPositionService positionService;
	
	@Resource(name = "employeeService")
	private IEmployeeService employeeService;
	
	
	@GetMapping(path = "writeMail")
	public String writeMail(Model model) {
		List<Department> departList = departmentService.getAllDepartment();
		
//		String[] value = null;
////		for(Map depart : departList) {
//		for(int i = 0; i < departList.size(); i++) {
//			logger.debug("depart.get(\"DEPART_ID\") - {}", departList.get(i).get("DEPART_ID"));
//			value[i] = (String) departList.get(i).get("DEPART_ID");
//			
//		}
		
		List<Employee> employeeList = employeeService.allEmployeeList();
		List<Position> positionList = positionService.getAllPosition();
		
		logger.debug("departList - {}", departList);
		model.addAttribute("departList", departList);
		model.addAttribute("employeeList", employeeList);
		model.addAttribute("positionList", positionList);
		
		return "tiles/email/writeMail";
	}
	//답글 @PostMapping 으로 return "tiles.writeMail"
	
	
	@PostMapping(path = "sendEmail")
    public String sendEmail(Model model, String email, String emailPass, String reci, String subject, String cont, @RequestPart("attatch") List<MultipartFile> attatch) throws IOException {
	
		
		logger.debug("email - {}", email);
		logger.debug("emailpass - {}", emailPass);
		logger.debug("reci - {}", reci);
		logger.debug("subject - {}", subject);
		logger.debug("cont - {}", cont);
		logger.debug("attatch - {}", attatch);
		
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
        int error = 0;

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
            error = 0;


        } catch (MessagingException e) {
        	error = 1;
        	e.printStackTrace();
        } catch (IllegalStateException e) {
        	error = 1;
			e.printStackTrace();
		} catch (IOException e) {
			error = 1;
			e.printStackTrace();
		}
        
//        request.setAttribute("error", error);
//        model.addAttribute("error", error);
        
//        try {
//			response.sendRedirect(request.getHeader("referer")+"?error=1");
//		} catch (IOException e) {
//			
//			e.printStackTrace();
//		}	
        
        if(error == 0) {
        	return "jsonView";
        	
        }else {
        	return "redirect:/writeMail";
        }
        
    }
	

	
	@RequestMapping(path = "validator")
	public String validator(Model model, Email email, BindingResult result) {
		// form객체(command, vo)의 검증 결과를 담는 BindingResult객체는
		// 반드시 메소드 인자 순서에서 form객체 바로 뒤에 위치해야 된다.
		List<Department> departList = departmentService.getAllDepartment();
		List<Employee> employeeList = employeeService.allEmployeeList();
		List<Position> positionList = positionService.getAllPosition();
		
		model.addAttribute("departList", departList);
		model.addAttribute("employeeList", employeeList);
		model.addAttribute("positionList", positionList);
		
		// validator 실행
		new EmailValidator().validate(email, result);

		if(result.hasErrors()) logger.debug("has Error");
		else logger.debug("no Error");

		return "tiles/email/writeMail";
	}
	
//	@RequestMapping(path = "test")
//	public String test() {
//		return "tiles.test";
//	}
	
	@RequestMapping(path = "mailbox", method = RequestMethod.GET)
	public String receiveMail(HttpSession Hsession, Model model, String emailLabel) throws MessagingException, IOException {
		logger.debug("emailLabel - {}", emailLabel);
		
		 IMAPFolder folder = null;
		    Store store = null;
	        String subject = null;
	        Flag flag = null;
	        
	          Properties props = System.getProperties();
	          props.setProperty("mail.store.protocol", "imaps");

	          Session session = Session.getDefaultInstance(props, null);

	          store = session.getStore("imaps");
//	          store.connect("imap.googlemail.com", email, emailpass);
	          store.connect("imap.googlemail.com", "testhoon1217@gmail.com", "ewqdsa556");
	         
	        //나중에 로그인 창에서 session 연결할거임
//	        Store store = (Store) Hsession.getAttribute("store");
//	        logger.debug("store - {}", store);
			  
		
	          IMAPFolder imapFolder = null;
	          Folder[] folders1 = store.getDefaultFolder().list("*");
	          for (Folder folder1 : folders1) {
	            imapFolder = (IMAPFolder) folder1;
	            System.out.println("[" + imapFolder.getFullName() + "]");
	          }
	          
	          
	          
	          folder = (IMAPFolder) store.getFolder(emailLabel); // This doesn't work for other email account
	          model.addAttribute("emailLabel", emailLabel);
	          
	          //folder = (IMAPFolder) store.getFolder("[Gmail]/스팸함"); This works for both email account

	          
	          if(!folder.isOpen())
	          folder.open(Folder.READ_WRITE);
	          Message[] messages = folder.getMessages();
	          logger.debug("messages - {}", messages);
	          
	          
	          model.addAttribute("messages", messages);
	          model.addAttribute("messagesCount", folder.getMessageCount());
	          
	          System.out.println("No of Messages : " + folder.getMessageCount());
	          System.out.println("No of Unread Messages : " + folder.getUnreadMessageCount());
	          System.out.println(messages.length);
	          
	          List<String> personal = new ArrayList<String>();
	          
	          
	          for (int i=0; i < messages.length-1; i++) 
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
	            
	            Address[] froms = msg.getFrom();
	            String reFrom2 = froms == null ? null : ((InternetAddress) froms[0]).getPersonal();
	            String reFrom = froms == null ? null : ((InternetAddress) froms[0]).getAddress();
	            
	            personal.add(reFrom2);
	            
	            logger.debug("re getFrom() - {}", reFrom);
	            logger.debug("re2 getFrom() - {}", reFrom2);
	            logger.debug("msg.getFrom()[0] - {}", msg.getFrom()[0]);
	            
	            
	           System.out.println("ToAll: "+msg.getAllRecipients().toString());
	           System.out.println("To: "+msg.getAllRecipients()[0]);
	           
	            System.out.println("Date: "+msg.getReceivedDate());
	            System.out.println("Size: "+msg.getSize());
	            System.out.println(msg.getFlags());
//	            Multipart mp = (Multipart)msg.getContent();
//	            Object p = mp.getBodyPart(i).getContent();  
//                String q = p.toString();//object has the body content  
//                System.out.println(q);//prints the body
	            
	            Object content = msg.getContent();
	            MimeMultipart multiPart = null;
	            if (content instanceof Multipart) {
	                multiPart = (MimeMultipart)content;
//		            Multipart mp = (Multipart)msg.getContent();
//		            Object p = mp.getBodyPart(i).getContent();  
//	                String q = p.toString();//object has the body content  
//	                System.out.println(q);//prints the body
	                int bodyCount = multiPart.getCount();
//	                System.out.println("Multipart Count : " + multiPart.getCount());
	                for (int j = 0; j < bodyCount; j++) {
	                    BodyPart bp = multiPart.getBodyPart(j);
	                    System.out.println(bp.toString());
	                }
	            } else {
	            	System.out.println(content);
	            }
	            System.out.println(msg.getContentType());
	            System.out.println("NUMBER : " +msg.getMessageNumber());
	        }
	          
	        model.addAttribute("personalList", personal);
	        
	        String jspName = "";
	        if(emailLabel.equals("[Gmail]/스팸함")) {
	        	jspName="spambox";
	        }else if(emailLabel.equals("[Gmail]/휴지통")) {
	        	jspName="trashbox";
	        }else if(emailLabel.equals("[Gmail]/별표편지함")) {
	        	jspName="starbox";
	        }else if(emailLabel.equals("[Gmail]/보낸편지함")) {
	        	jspName="sendbox";
	        }else if(emailLabel.equals("INBOX")) {
	        	jspName="inbox";
	        }
	        
	        return  "tiles/email/" + jspName;
	}
	          
	          
	@GetMapping(path = "addressbook")
	public String addressbook(Model model) {
		return "tiles/email/writeMail";
	}
	
	
	@PostMapping(path = "detailMail")
	public String detailMail(Model model, String emailLabel, String msgNumber) throws MessagingException, IOException {
		logger.debug("msgNumber - {}", msgNumber);
		logger.debug("Integer.parseInt(msgNumber) - {}", Integer.parseInt(msgNumber));
		
		
		 IMAPFolder folder = null;
		    Store store = null;
	        String subject = null;
	        Flag flag = null;
	        
	          Properties props = System.getProperties();
	          props.setProperty("mail.store.protocol", "imaps");

	          Session session = Session.getDefaultInstance(props, null);
	          

	          store = session.getStore("imaps");
//	          store.connect("imap.googlemail.com", email, emailpass);
	          store.connect("imap.googlemail.com", "testhoon1217@gmail.com", "ewqdsa556");
	          
//	        Store store = (Store) Hsession.getAttribute("store");
	          
	          folder = (IMAPFolder) store.getFolder(emailLabel); 
	          if(!folder.isOpen())
		          folder.open(Folder.READ_WRITE);
	          
	          Message mes = folder.getMessage(Integer.parseInt(msgNumber));
	          
	          Address[] froms = mes.getFrom();
	          String personal = froms == null ? null : ((InternetAddress) froms[0]).getPersonal();
	          
	          model.addAttribute("personal", personal);
	          
	          Object content = mes.getContent();
	          List<File> attachments = new ArrayList<File>();
	          List<FileInfo> infos = new ArrayList<FileInfo>();
	          int bodyCount = 0;
	          int attachmentCount = 0;
	            MimeMultipart multiPart = null;
	            if (content instanceof Multipart) {
	                multiPart = (MimeMultipart)content;
	                bodyCount = multiPart.getCount();
	                
	                	for (int j = 0; j < bodyCount; j++) {
	                		//body들의 헤더를 비교해서 그냥 text 내용과 multipart 부분을 나눠야한다
	                		BodyPart bodyPart = multiPart.getBodyPart(j);
	                		
	                		String disposition = bodyPart.getDisposition();
	                		if (disposition != null && (disposition.equals("ATTACHMENT"))) {
	                			attachmentCount++;
	                			System.out.println("Mail have some attachment : ");
	                			DataHandler handler = bodyPart.getDataHandler();
	                			System.out.println("file name : " + handler.getName());
	                			System.out.println("bodyPart.getFileName() : " + bodyPart.getFileName());
	                			
	                			
//	                			fileNames.add(handler.getName());
	                			
	                			
	                			FileInfo info = FileUtil.getFileInfo(bodyPart.getFileName());
	                			InputStream is = bodyPart.getInputStream();
	                	        File f = info.getFile();
	                	        FileOutputStream fos = new FileOutputStream(f);
	                	        byte[] buf = new byte[4096];
	                	        int bytesRead;
	                	        while((bytesRead = is.read(buf))!=-1) {
	                	            fos.write(buf, 0, bytesRead);
	                	        }
	                	        fos.close();
	                	        
	                	        infos.add(info);
	                	        attachments.add(f);
	                			
	                			
	                		} else {
	                			System.out.println(bodyPart.getContent());
	                			model.addAttribute("textCont", bodyPart.getContent());
	                		}
	                	}
	            }
	                	
	                	
	            
	            model.addAttribute("infos", infos);
	            model.addAttribute("attachments", attachments);
	            model.addAttribute("attachmentCount", attachmentCount);
	            model.addAttribute("message", mes);
	            model.addAttribute("content", content);
		
		return "tiles/email/readMail";
	}
	
	
	
	@GetMapping("fileDownloadView2")
	public String fileDownloadView2(Model model, String filename) {
		
		model.addAttribute("filename", filename);
		
		return "fileDownloadView2";
	}
	
	
	
}
