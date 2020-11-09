package kr.green.weather.service;

public interface EmailService {
	boolean sendMail(String cemail, String subject, String content);
	boolean sendMail(String cemail, String subject, String content,String[] fileName,boolean isFile);
}
