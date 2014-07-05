package com.dlnu.action.office;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.List;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import com.dlnu.base.action.BaseAction;
import com.dlnu.dao.FileDao;
import com.dlnu.pojo.Users;

public class FileAction extends BaseAction {
	@Autowired
	private FileDao fileDao;
	private static final String path = "j:\\OA\\";
	private List<String> files;
	private String filename;
	private InputStream inputStream;
	private File file;
	private String fileFileName;
	private String fileContentType;

	public File getFile() {
		return file;
	}

	public void setFile(File file) {
		this.file = file;
	}

	public String getFileFileName() {
		return fileFileName;
	}

	public void setFileFileName(String fileFileName) {
		this.fileFileName = fileFileName;
	}

	public String getFileContentType() {
		return fileContentType;
	}

	public void setFileContentType(String fileContentType) {
		this.fileContentType = fileContentType;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public InputStream getInputStream() {
		return inputStream;
	}

	public void setInputStream(InputStream inputStream) {
		this.inputStream = inputStream;
	}

	public static String getPath() {
		return path;
	}

	public List<String> getFiles() {
		return files;
	}

	public void setFiles(List<String> files) {
		this.files = files;
	}

	public FileDao getFileDao() {
		return fileDao;
	}

	public void setFileDao(FileDao fileDao) {
		this.fileDao = fileDao;
	}

	public String showfile() {
		Users user = (Users) ServletActionContext.getRequest().getSession()
				.getAttribute("users");
		files = fileDao.showfiles(path, user.getUserid());
		for (String s : files) {
			System.out.println("filename ============ " + s);
		}
		return SUCCESS;
	}

	public String download() {
		System.out.println("filename----------"+filename);
		try {
			System.out.println("filename=========="+ URLDecoder.decode(filename, "UTF-8"));
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}

		Users user = (Users) ServletActionContext.getRequest().getSession()
				.getAttribute("users");
		String flodername = fileDao.getFloderName(user.getUserid());
		String filepath = path + flodername + "\\" + filename;
		try {
			inputStream = new FileInputStream(new File(filepath));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}

	public String deletefile() {
		Users user = (Users) ServletActionContext.getRequest().getSession()
				.getAttribute("users");
		String flodername = fileDao.getFloderName(user.getUserid());
		String filepath = path + flodername + "\\" + filename;
		File file = new File(filepath);
		if (file.exists()) {
			file.delete();
		} else {
			System.out.println("文件不存在");
		}
		return SUCCESS;
	}

	public String uploadfile() {
		Users user = (Users) ServletActionContext.getRequest().getSession()
				.getAttribute("users");
		String flodername = fileDao.getFloderName(user.getUserid());
		System.out.println("upload==========="+fileFileName);
		String filepath = path + flodername + "\\" + fileFileName;
		File saveFile = new File(filepath);
		try {
			FileUtils.copyFile(file, saveFile);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}
}
