package kr.or.ddit.smartware.view;

import java.io.File;
import java.io.FileInputStream;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.view.AbstractView;
import kr.or.ddit.smartware.post.model.PostFile;
import kr.or.ddit.smartware.util.file.FileUtil;
import kr.or.ddit.smartware.util.file.model.FileInfo;

public class FileDownloadView2 extends AbstractView{
	private static final Logger logger = LoggerFactory.getLogger(FileDownloadView2.class);

	@Override
	protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		//info 객체를 받야아함
		String name = (String) model.get("filename");
		
//		FileInfo info =  FileUtil.getFileInfo((String) model.get("filename"));
		
		response.setHeader("content-disposition", "attachment;filename="+ URLEncoder.encode(name,"UTF-8"));
		response.setContentType("application/octet-stream");	//바이너리로 요청이 전송됨
		
		String path = getPath();
		
		File file = new File(path + "\\" + name);
		
		FileInputStream fis = new FileInputStream(file);
		ServletOutputStream sos = response.getOutputStream();
		
		byte[] buffer = new byte[512];
		int len = 0;
		while((len = fis.read(buffer, 0, 512)) != -1)
			sos.write(buffer, 0, len);
		
		sos.close();
		fis.close();
	}
	
	private static String getPath() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMM");
		String yyyyMM = sdf.format(new Date());
		String yyyy = yyyyMM.substring(0,4);
		String mm = yyyyMM.substring(4,6);
		
		String path = "c:\\springUpload\\" + yyyy + "\\" + mm;
		File pathFile = new File(path);
		
		if(!pathFile.exists()) pathFile.mkdirs();
		return path;
	}
	
	
}
