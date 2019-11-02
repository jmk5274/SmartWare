package kr.or.ddit.smartware.email.web;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.annotation.Resource;
import javax.mail.Address;
import javax.mail.BodyPart;
import javax.mail.Flags;
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
import javax.mail.UIDFolder;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.mail.internet.MimeUtility;
import javax.mail.search.FlagTerm;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
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
public class EmailController{

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
		List<Map> employeeList = employeeService.getDetailEmpList();
		List<Position> positionList = positionService.getAllPosition();
		
		logger.debug("departList - {}", departList);
		model.addAttribute("departList", departList);
		model.addAttribute("employeeList", employeeList);
		model.addAttribute("positionList", positionList);
		
		return "tiles/email/writeMail";
	}
	
	@PostMapping(path = "sendEmail")
    public String sendEmail(HttpServletRequest request, Model model, String email, String emailPass, String reci, String subject, String cont, @RequestPart("attatch") List<MultipartFile> attatch) throws IOException {
		
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
            		
//            		FileInfo fileInfo = FileUtil.getFileInfo(attachedFile.getOriginalFilename());
//            		//첨부된 파일이 있을 경우만 업로드 처리
//            		attachedFile.transferTo(fileInfo.getFile());
            		String realPath = "C:\\picture\\email";
            		
            		File file = new File(realPath);
            		if(!file.exists()) file.mkdirs();
            		
            		logger.debug("original - {}", attachedFile.getOriginalFilename());

    			    if(attachedFile.getSize() > 0) {
    			    	File ff = new File("C:/picture/email/"+attachedFile.getOriginalFilename());
    			    	
    			    	if(ff.exists()) {
    			    		ff.delete();
    			    	}
	            		
	            		messageBodyPart = new MimeBodyPart();
//	            		DataSource fds = new FileDataSource(fileInfo.getFile());
	            		DataSource fds = new FileDataSource(ff);
	            		messageBodyPart.setDataHandler(new DataHandler(fds));
	            		
//	            		String fileName = fds.getNCame(); // 한글파일명은 영문으로 인코딩해야 첨부가 된다.
//	            		fileName = new String(fileName.getBytes("KSC5601"), "8859_1");
//	            		MimeUtility.encodeText("파일명", "EUC-KR", "B")
	            		messageBodyPart.setFileName(MimeUtility.encodeText(fds.getName(), "EUC-KR","B"));
//	            		messageBodyPart.setFileName(fileName);
	            		multipart.addBodyPart(messageBodyPart);
	            		
	            		ff = new File(realPath + "/" + attachedFile.getOriginalFilename());
	            		attachedFile.transferTo(ff);
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
		List<Map> employeeList = employeeService.getDetailEmpList();
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
	
	
	@RequestMapping(path = "mailbox", method = RequestMethod.GET)
	public String receiveMail(HttpSession Hsession, Model model, String emailLabel, @RequestParam (name = "page", defaultValue = "1") Integer page, @RequestParam(name = "pagesize", defaultValue = "10") Integer pagesize) throws MessagingException, IOException {
		logger.debug("emailLabel - {}", emailLabel);
		logger.debug("page - {}", page);
		logger.debug("pagesize - {}", pagesize);
		
		 IMAPFolder folder = null;
	        String subject = null;
	        Flag flag = null;
	        
	        //나중에 로그인 창에서 session 연결할거임
	        Store store = (Store) Hsession.getAttribute("store");
	        logger.debug("store - {}", store);
			  
		
//	          IMAPFolder imapFolder = null;
//	          Folder[] folders1 = store.getDefaultFolder().list("*");
//	          for (Folder folder1 : folders1) {
//	            imapFolder = (IMAPFolder) folder1;
//	          }
	          
	          if(emailLabel.equals("INBOX")) {
	        	  folder = (IMAPFolder)store.getFolder(emailLabel);
	        	  Hsession.setAttribute("cnt", folder.getMessageCount());
	          }
	          
	          
	          
	          folder = (IMAPFolder) store.getFolder(emailLabel); // This doesn't work for other email account
	          model.addAttribute("emailLabel", emailLabel);
	          model.addAttribute("folder", folder);
	          logger.debug("folder - {}", folder);
	          
	          
	          if(!folder.isOpen())
	          folder.open(Folder.READ_WRITE);
	          
//	          boolean ff= folder.hasNewMessages();
//	          logger.debug("ff- {}", ff);
//	          int nn = folder.getNewMessageCount();
//	          logger.debug("nn - {}", nn);
	          
	          
	          IMAPFolder starfolder = (IMAPFolder) store.getFolder("[Gmail]/별표편지함");
	          if(!starfolder.isOpen())
	        	  starfolder.open(Folder.READ_ONLY);
	          
	          Message[] smm = starfolder.getMessages();
	          
	          model.addAttribute("starMail", smm);
	          
		      Map<String, Integer> map = new HashMap<String, Integer>();
		      map.put("page", page);
			  map.put("pagesize", pagesize);
			  
			  logger.debug("map - {}", map);
			  logger.debug("map P - {}", map.get("page"));
	          
			  int paginationSize = ((int)Math.ceil((double)(folder.getMessageCount()) / pagesize));
			  
			  logger.debug("folder.getMessagesCount - {}", folder.getMessageCount());
			  if(folder.getMessageCount() < pagesize) {
				  paginationSize = 1;
			  }
			  int cnt = folder.getMessageCount()-page*pagesize;
			  int tempCnt = cnt + pagesize ;
			  if(cnt < 1) 
				  cnt = 1;
 
	          Message[] messages;
	          if(folder.getMessageCount() < pagesize) {
	        	  messages = folder.getMessages(1, folder.getMessageCount());
	          }else if(page == paginationSize){
	        	  messages = folder.getMessages(cnt, tempCnt);
	          }else{
	        	  messages = folder.getMessages(cnt+1, cnt+pagesize);
	          }
	          
	          model.addAttribute("map", map);
	          model.addAttribute("paginationSize", paginationSize);
	          model.addAttribute("messages", messages);
	          model.addAttribute("messagesCount", folder.getMessageCount());
	          
	          List<String> personal = new ArrayList<String>();
	          List<String> address = new ArrayList<String>();
	          
	          
	          for (int i=0; i < messages.length; i++) 
	          {
	        	
	            Message msg =  messages[i];
	            
	            subject = msg.getSubject();
	            
	            Address[] froms = msg.getFrom();
	            logger.debug("froms - {}", froms);
	            logger.debug("((InternetAddress) froms[0]).getAddress() - {}", ((InternetAddress) froms[0]).getAddress());
	            String reFrom2 = froms == null ? null : ((InternetAddress) froms[0]).getAddress();
	            String reFrom3 = froms == null ? null : ((InternetAddress) froms[0]).getPersonal();
	            logger.debug("reFrom2 - {}", reFrom2);
	            
	            personal.add(reFrom2);
	            address.add(reFrom3);
	            
	            Object content = msg.getContent();
	            MimeMultipart multiPart = null;
	            if (content instanceof Multipart) {
	                multiPart = (MimeMultipart)content;
	                int bodyCount = multiPart.getCount();
	                for (int j = 0; j < bodyCount; j++) {
	                    BodyPart bp = multiPart.getBodyPart(j);
	                }
	            } else {
	            }
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
	public String detailMail(HttpServletRequest request,HttpSession Hsession, Model model, String emailLabel, String msgNumber) throws MessagingException, IOException {
		logger.debug("msgNumber - {}", msgNumber);
		logger.debug("Integer.parseInt(msgNumber) - {}", Integer.parseInt(msgNumber));
		
		//이쪽은 나중에 로그인부분으로 연결할때 고침
		 IMAPFolder folder = null;
//		    Store store = null;
	        String subject = null;
	        Flag flag = null;
	        
	        Store store = (Store) Hsession.getAttribute("store");
	          
	          folder = (IMAPFolder) store.getFolder(emailLabel);
	          
	          
	          if(!folder.isOpen())
		          folder.open(Folder.READ_WRITE);
	          
	          Message mes = folder.getMessage(Integer.parseInt(msgNumber));
	          
	          Address[] froms = mes.getFrom();
	          String personal = froms == null ? null : ((InternetAddress) froms[0]).getPersonal();
	          String personal2 = froms == null ? null : ((InternetAddress) froms[0]).getAddress();
	          logger.debug("address - {}", personal2);
	          Address[] recis = mes.getAllRecipients();
	          logger.debug("recis - {}", recis);
	        
	          List<String> addreList = new ArrayList<String>();
	          String ad = "";
	          
	          
	          for(int i = 0; i < recis.length; i++) {
	        	  String addre = ((InternetAddress)recis[i]).getAddress();
	        	  addreList.add(addre);
	        	  if(i == recis.length-1) {
	        		  ad += addre;
	        	  }else {
	        		  ad += addre + " ";
	        	  }
	        	  logger.debug("addre - {}", addre);
	          }
	          
	          String reci = recis == null ? null :  ((InternetAddress) recis[0]).getPersonal();
	          String reci2 = recis == null ? null :  ((InternetAddress) recis[0]).getAddress();
	          logger.debug("reci - {}", reci);
	          logger.debug("reci2 - {}", reci2);
	          
	          model.addAttribute("ad", ad);
	          model.addAttribute("addreList", addreList);
	          model.addAttribute("personal", personal);
	          model.addAttribute("address", personal2);
	          model.addAttribute("reci2", reci2);
	          
	          Object content = mes.getContent();
	          List<File> attachments = new ArrayList<File>();
	          List<FileInfo> infos = new ArrayList<FileInfo>();
	          List<String> fName = new ArrayList<String>();
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
	                			DataHandler handler = bodyPart.getDataHandler();
	                			
	                			
	                			String rr = MimeUtility.decodeText(bodyPart.getFileName());
	                			logger.debug("rr - {}", rr);
	                			
	                			
	                			String realPath = "C:\\picture\\email";
	                			
	                			File ff = new File(realPath+ "\\" +rr);
	                			
//	                			FileInfo info = FileUtil.getFileInfo(bodyPart.getFileName());
	                			InputStream is = bodyPart.getInputStream();
//	                	        File f = info.getFile();
//	                	        File f = ff;
	                	        FileOutputStream fos = new FileOutputStream(ff);
	                	        byte[] buf = new byte[4096];
	                	        int bytesRead;
	                	        while((bytesRead = is.read(buf))!=-1) {
	                	            fos.write(buf, 0, bytesRead);
	                	        }
	                	        fos.close();
	                	        is.close();
	                	        
//	                	        infos.add(info);
	                	        attachments.add(ff);
	                			
	                		} else {
	                			model.addAttribute("textCont", bodyPart.getContent());
	                		}
	                	}
	            }
	                	
	            if(emailLabel.equals("INBOX")) {
	    			Hsession.setAttribute("cnt", folder.getMessageCount());
	    		}
	            
	            model.addAttribute("fName", fName);
	            model.addAttribute("emailLabel", emailLabel);
	            model.addAttribute("msgNumber", msgNumber);
	            model.addAttribute("infos", infos);
	            model.addAttribute("attachments", attachments);
	            model.addAttribute("attachmentCount", attachmentCount);
	            model.addAttribute("message", mes);
	            model.addAttribute("content", content);
		
		return "tiles/email/readMail";
	}
	
	
	@RequestMapping(path = "moveStarbox", method = RequestMethod.POST)
	public String moveMail(HttpSession Hsession, Model model, String emailLabel, Integer msgNumber) throws MessagingException, IOException {
		logger.debug("emailLabelMove- {}",emailLabel);
		logger.debug("msgNumberMove- {}", msgNumber);
		
		
		//이쪽은 나중에 로그인부분으로 연결할때 고침
		IMAPFolder folder = null;
		
	    Store store = (Store) Hsession.getAttribute("store");
		
		folder = (IMAPFolder) store.getFolder(emailLabel); 
		
		if(!folder.isOpen())
			folder.open(Folder.READ_WRITE);
		
		
		
		List<Message> tempList = new ArrayList<>();
		Message mes = folder.getMessage(msgNumber);
		
		tempList.add(mes);
		
		 IMAPFolder desFolder = (IMAPFolder) store.getFolder("[Gmail]/별표편지함");
		 
    	 Message[] tempMessageArray = tempList.toArray(new Message[tempList.size()]);
    	 folder.copyMessages(tempMessageArray, desFolder);
    	 int descount = desFolder.getMessageCount();
    	 
    	 
    	 
    	 logger.debug("descount - {}", descount);
		
    	 if(emailLabel.equals("INBOX")) {
 			Hsession.setAttribute("cnt", folder.getMessageCount());
 		}
		 
    	 
    	 model.addAttribute("descount", descount);
		 model.addAttribute("emailLabel", emailLabel);
		
	     return  "jsonView";
	}
	
	
	@RequestMapping(path = "removeStarbox", method = RequestMethod.POST)
	public String removeMail(HttpSession Hsession, Model model, String emailLabel, int descount) throws MessagingException, IOException {
		logger.debug("emailLabelMove- {}",emailLabel);
		logger.debug("descount- {}",descount);
		
		//이쪽은 나중에 로그인부분으로 연결할때 고침
		IMAPFolder folder = null;
		Flag flag = null;
		
//		나중에 세션으로 연결시킨걸 받아올거임
	    Store store = (Store) Hsession.getAttribute("store");
		
		folder = (IMAPFolder) store.getFolder(emailLabel); 
		
		
		IMAPFolder desFolder = (IMAPFolder) store.getFolder("[Gmail]/별표편지함");
		if(!desFolder.isOpen())
			desFolder.open(Folder.READ_WRITE);
		
		List<Message> tempList = new ArrayList<>();
		Message[] message = desFolder.getMessages();
		
		int count = desFolder.getMessageCount();
		
		
		for(int i = 0; i < count; i++) {
			Message msg = message[i];
			if((descount-1) == i) {
				logger.debug("des, i - {}, {}", descount, i);
				msg.setFlags(new Flags(Flags.Flag.DELETED), true);
				break;
			}
		}
		
		if(emailLabel.equals("INBOX")) {
			Hsession.setAttribute("cnt", folder.getMessageCount());
		}
		
		model.addAttribute("emailLabel", emailLabel);
		
		return  "jsonView";
	}
	
	@RequestMapping(path = "trashbox", method = RequestMethod.POST)
	public String trashbox(HttpSession Hsession, Model model, String emailLabel, int[] msgNumber) throws MessagingException, IOException {
		logger.debug("emailLabelMove- {}",emailLabel);
		logger.debug("msgNumberMove- {}", msgNumber);
		
		//이쪽은 나중에 로그인부분으로 연결할때 고침
		IMAPFolder folder = null;
		Flag flag = null;
		
	    Store store = (Store) Hsession.getAttribute("store");
		
		folder = (IMAPFolder) store.getFolder(emailLabel);
		
		if(!folder.isOpen())
			folder.open(Folder.READ_WRITE);
		
		UIDFolder uf = (UIDFolder)folder;
		
		List<Message> tempList = new ArrayList<>();
		Long[] mesUID = new Long[msgNumber.length];
		
		for(int i = 0; i < msgNumber.length; i++) {
			Message mes = folder.getMessage(msgNumber[i]);
			mesUID[i] = uf.getUID(mes);
			
			mes.setFlags(new Flags(Flags.Flag.DELETED), true);
			tempList.add(mes);
		}
		
		 IMAPFolder desFolder = (IMAPFolder) store.getFolder("[Gmail]/휴지통");
		 
    	 Message[] tempMessageArray = tempList.toArray(new Message[tempList.size()]);
    	 folder.copyMessages(tempMessageArray, desFolder);
		
    	 if(emailLabel.equals("INBOX")) {
 			Hsession.setAttribute("cnt", folder.getMessageCount());
 		 }
    	 
    	 model.addAttribute("mesUID", mesUID);
		 model.addAttribute("emailLabel", emailLabel);
		
        return  "jsonView";
	}
	
	
	@RequestMapping(path = "spambox", method = RequestMethod.POST)
	public String spambox(HttpSession Hsession, Model model, String emailLabel, int msgNumber) throws MessagingException, IOException {
		logger.debug("emailLabelMove- {}",emailLabel);
		logger.debug("msgNumberMove- {}", msgNumber);
		
		//이쪽은 나중에 로그인부분으로 연결할때 고침
		IMAPFolder folder = null;
		Flag flag = null;
		
	    Store store = (Store) Hsession.getAttribute("store");
		
		folder = (IMAPFolder) store.getFolder(emailLabel); 
		
		if(!folder.isOpen())
			folder.open(Folder.READ_WRITE);
		
		UIDFolder uf = (UIDFolder)folder;
		
		List<Message> tempList = new ArrayList<>();
		
		Message mes = folder.getMessage(msgNumber);
		
		tempList.add(mes);
		mes.setFlags(new Flags(Flags.Flag.DELETED), true);
		
		IMAPFolder desFolder = (IMAPFolder) store.getFolder("[Gmail]/스팸함");
		
		Message[] tempMessageArray = tempList.toArray(new Message[tempList.size()]);
		folder.copyMessages(tempMessageArray, desFolder);
		
		if(emailLabel.equals("INBOX")) {
			Hsession.setAttribute("cnt", folder.getMessageCount());
		}
		model.addAttribute("emailLabel", emailLabel);
		
		return  "jsonView";
	}
	
	@RequestMapping(path = "deleteMail", method = RequestMethod.POST)
	public String deleteMail(HttpSession Hsession, Model model, String emailLabel, int[] msgNumber) throws MessagingException, IOException {
		logger.debug("emailLabelMove- {}",emailLabel);
		logger.debug("msgNumberMove- {}", msgNumber);
		
		//이쪽은 나중에 로그인부분으로 연결할때 고침
		IMAPFolder folder = null;
		Flag flag = null;
		
	    Store store = (Store) Hsession.getAttribute("store");
		
		folder = (IMAPFolder) store.getFolder(emailLabel); 
		
		if(!folder.isOpen())
			folder.open(Folder.READ_WRITE);
		
		Message[] msg = folder.getMessages();
		for(Message m : msg) {
			logger.debug("m Number - {}", m.getMessageNumber());
			logger.debug("m Number - {}", m.getSubject());
		}
		
		UIDFolder uf = (UIDFolder)folder;
		
		List<Message> tempList = new ArrayList<>();
		Long[] mesUID = new Long[msgNumber.length];
		
		for(int i = 0; i < msgNumber.length; i++) {
			Message mes = folder.getMessage(msgNumber[i]);
			logger.debug("mes - {}", mes.getSubject());
			logger.debug("mes - {}", mes.getMessageNumber());
			mesUID[i] = uf.getUID(mes);
			
			tempList.add(mes);
			mes.setFlags(new Flags(Flags.Flag.DELETED), true);
		}
		
		folder.close(true);
		
		if(!folder.isOpen())
			folder.open(Folder.READ_WRITE);
		
		model.addAttribute("mesUID", mesUID);
		model.addAttribute("emailLabel", emailLabel);
		
		return  "jsonView";
	}
		
	
	@RequestMapping(path = "MailStatus", method = RequestMethod.GET)
	public String MailStatus(HttpSession Hsession, String check, Model model, String emailLabel, @RequestParam (name = "page", defaultValue = "1") Integer page, @RequestParam(name = "pagesize", defaultValue = "20") Integer pagesize) throws MessagingException, IOException {
		logger.debug("emailLabel - {}", emailLabel);
		logger.debug("check - {}", check);
		logger.debug("page - {}", page);
		logger.debug("pagesize - {}", pagesize);
		
		 IMAPFolder folder = null;
	        String subject = null;
	        Flag flag = null;
	        
	         
	        //나중에 로그인 창에서 session 연결할거임
	        Store store = (Store) Hsession.getAttribute("store");
	        logger.debug("store - {}", store);
			  
	          folder = (IMAPFolder) store.getFolder(emailLabel); // This doesn't work for other email account
	          model.addAttribute("emailLabel", emailLabel);
	          model.addAttribute("folder", folder);
	          logger.debug("folder - {}", folder);
	          
	          if(!folder.isOpen())
	          folder.open(Folder.READ_WRITE);
	          
		      Map<String, Integer> map = new HashMap<String, Integer>();
		      map.put("page", page);
			  map.put("pagesize", pagesize);
			  
			  FlagTerm ft;
			  if(check.equals("T")) {
				  ft = new FlagTerm(new Flags(Flags.Flag.SEEN), true);
			  }else {
				  ft = new FlagTerm(new Flags(Flags.Flag.SEEN), false);
			  }
			  
			  Message[] msg = folder.search(ft);
			  
			  logger.debug("map - {}", map);
			  logger.debug("map P - {}", map.get("page"));
	          
			  int paginationSize = ((int)Math.ceil((double)(msg.length) / pagesize));
			  
			  logger.debug("folder.getMessagesCount - {}", msg.length);
			  if(msg.length < pagesize) {
				  paginationSize = 1;
			  }
			  
			  for(Message mm : msg) {
				  logger.debug("UnreadMail - {}", mm.getMessageNumber());
				  logger.debug("UnreadMail - {}", mm.getSubject());
			  }
			  
			  //pagisize 를 늘려놓음.. 페이지네이션불가 읽은메일 페이지네이션불가..
	          model.addAttribute("map", map);
	          model.addAttribute("paginationSize", paginationSize);
	          model.addAttribute("messages", msg);
	          model.addAttribute("messagesCount", folder.getMessageCount());
	          
	          List<String> personal = new ArrayList<String>();
	          List<String> address = new ArrayList<String>();
	          
	          for (int i=0; i < msg.length; i++) 
	          {
	            Message ms =  msg[i];
	            
	            Address[] froms = ms.getFrom();
	            String reFrom2 = froms == null ? null : ((InternetAddress) froms[0]).getPersonal();
	            String address2 = froms == null ? null : ((InternetAddress) froms[0]).getAddress();
	            personal.add(reFrom2);
	            address.add(address2);
	            
	            Object content = ms.getContent();
	            MimeMultipart multiPart = null;
	            if (content instanceof Multipart) {
	                multiPart = (MimeMultipart)content;
	                int bodyCount = multiPart.getCount();
	                for (int j = 0; j < bodyCount; j++) {
	                    BodyPart bp = multiPart.getBodyPart(j);
	                }
	            } else {
	            }
	        }
	        
            if(emailLabel.equals("INBOX")) {
	  			Hsession.setAttribute("cnt", folder.getMessageCount());
	  		}
            
            IMAPFolder starfolder = (IMAPFolder) store.getFolder("[Gmail]/별표편지함");
	          if(!starfolder.isOpen())
	        	  starfolder.open(Folder.READ_ONLY);
	          
	          Message[] smm = starfolder.getMessages();
	          
	        model.addAttribute("starMail", smm);
	        model.addAttribute("check", check);
	        model.addAttribute("personalList", address);
//	        model.addAttribute("addressList", address);
	        
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
	
	@GetMapping("fileDownloadView2")
	public String fileDownloadView2(Model model, String filename) {
		
		model.addAttribute("filename", filename);
		
		return "fileDownloadView2";
	}
	
	@PostMapping("starIdSave")
	public String starIdSave(Integer msgNumber, Integer descount, HttpSession Hsession) {
		
		logger.debug("SavemsgNumber - {}", msgNumber);
		logger.debug("Savedescount - {}", descount);
		
		 List<Map<Object, Integer>> starId = new ArrayList<Map<Object,Integer>>();
    	 Map<Object, Integer> map = new HashMap<Object, Integer>();
    	 if(Hsession.getAttribute("starId") == null) {
    		 map.put((Object)msgNumber, descount);
    		 starId.add(map);
    		 Hsession.setAttribute("starId", starId);
    	 }else {
    		 starId = (List<Map<Object, Integer>>) Hsession.getAttribute("starId");
    		 map.put((Object)msgNumber, descount);
    		 starId.add(map);
    		 Hsession.setAttribute("starId", starId);
    	 }
		
		
		return "jsonView";
	}
	
	@PostMapping("starIdCall")
	public String starIdCall(Model model, HttpSession Hsession, Integer msgNumber) {
		logger.debug("CallmsgNumber - {}", msgNumber);
		
		List<Map<Object, Integer>> list = (List<Map<Object, Integer>>)Hsession.getAttribute("starId");
		Integer descount = 0;
		
		if(list != null) {
			for(int i = 0; i < list.size(); i++) {
				if(list.get(i).get(msgNumber) != null) {
					descount = list.get(i).get(msgNumber);
				}
			}
			model.addAttribute("descount", descount);
		}
		
		return "jsonView";
	}
	
	
	
}
