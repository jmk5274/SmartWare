package kr.or.ddit.smartware.email.web;

import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import kr.or.ddit.smartware.email.model.Email;

public class EmailValidator implements Validator {
	private static final Logger logger = LoggerFactory.getLogger(EmailValidator.class);
	

	@Override
	public boolean supports(Class<?> clazz) {
		return Email.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		 //ValidationUtils.rejectIfEmpty(errors, "email", "empty");
		 
		 Email email = (Email) target;
		  try {
			  logger.debug("email - {}", email.getEmail());
			  
			  String[] arr = email.getEmail().split(" ");
			  
			  for(int i = 0; i < arr.length; i++) {
				  InternetAddress emailAddr = new InternetAddress(arr[i]);
				  emailAddr.validate();
			  }
		   } catch (AddressException ex) {
			  logger.debug("catch");
		      errors.rejectValue("email", "required");//필드명, 에러코드(개발자 정의)
		   }
	}

}
