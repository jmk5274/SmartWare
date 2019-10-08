package kr.or.ddit.smartware.util.file;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import kr.or.ddit.smartware.util.file.model.FileInfo;

public class FileUtil {

	public static FileInfo getFileInfo(String originalFileName) {
		
		String path = getPath();
		
		String uuidFileName = UUID.randomUUID().toString();
		String extName = getExtension(originalFileName);
		File file = new File(path + "\\" + uuidFileName + extName);
		
		FileInfo fileInfo = new FileInfo(file, originalFileName, extName);
		
		return fileInfo;
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

	public static String getExtension(String originalFileName) {
		
		String extName = "";
		if(originalFileName.contains(".")) 
			extName = originalFileName.substring(originalFileName.lastIndexOf("."));
		
		return extName;
	}

}
