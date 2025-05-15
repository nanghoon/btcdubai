package egovframework.example.sample.utils;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.util.Properties;

import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

public class Send {	
	public static boolean sendMexVerificationCode(String country , String phone , String code) {
		try {
			Log.print("sendMexVerificationCode "+country+" "+phone+" "+ code, "call");
			phone = phone.substring(1);
			// Construct data
			String data = URLEncoder.encode("gw-username", "UTF-8") + "=" + URLEncoder.encode("heelc2003", "UTF-8");
			data += "&" + URLEncoder.encode("gw-password", "UTF-8") + "=" + URLEncoder.encode("Gudcjs1313!#", "UTF-8");
			data += "&" + URLEncoder.encode("gw-to", "UTF-8") + "=" + URLEncoder.encode(country+phone, "UTF-8");
			data += "&" + URLEncoder.encode("gw-from", "UTF-8") + "=" + URLEncoder.encode("9948503840", "UTF-8"); // 10자리
			data += "&" + URLEncoder.encode("gw-text", "UTF-8") + "=" + URLEncoder.encode("[ BTC ] - Verification Code: " +code, "UTF-8");
			// Send data
			URL url = new URL("http://mexkr.sms-service.com.my:29143/cgi-bin/sendsms");// api 주소 
			URLConnection conn = url.openConnection();
			conn.setDoOutput(true);
			OutputStreamWriter wr = new OutputStreamWriter(conn.getOutputStream());
			wr.write(data);
			wr.flush();
			// Get the response
			BufferedReader resp = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			// Display the string.
			resp.close();
			return true;
		} catch (Exception e) {
			Log.print("sendMexVerificationCode Err " + e.getMessage(), "err");
			return false;
		}
	}
	
	public static boolean sendMailVerificationCode(HttpServletRequest request , String email, String context) {
		Properties properties = getProperties();
		try
		{
			Log.print("sendMailVerificationCode "+email+" "+context,  "call");
			Authenticator auth = new senderAccount();
			Session session = Session.getInstance(properties, auth);
			session.setDebug(true); // 메일을 전송할 때 상세한 상황을 콘솔에 출력한다.
			MimeMessage msg = new MimeMessage(session);
			msg.setSubject("BTC - Email verification code");
			Address fromAddr = new InternetAddress("support@feexbtc.com"); // 보내는사람
			msg.setFrom(fromAddr);
			Address toAddr = new InternetAddress(email); // 받는사람 EMAIL
			msg.addRecipient(Message.RecipientType.TO, toAddr);
			String mailcontent = context;
			msg.setContent("<pre>"+mailcontent+"</pre>", "text/html;charset=utf-8"); // 메일 전송될
			if(Utils.isValidEmail(email)==true){
				Transport.send(msg);
			}
			return true;
		}
		catch (Exception e) {
			e.printStackTrace();
			Log.print("sendMailVerificationCode Err " + e.getMessage(), "err");
			return false;
		}
	}
	
	static Properties getProperties(){
		Properties properties = new Properties();
		properties.put("mail.smtp.user", "support@feexbtc.com"); // 구글 계정
		properties.put("mail.smtp.host", "smtp.gmail.com");
		properties.put("mail.smtp.port", "465");
		properties.put("mail.smtp.starttls.enable", "true");
		properties.put("mail.smtp.auth", "true");
		properties.put("mail.smtp.debug", "true");
		properties.put("mail.smtp.socketFactory.port", "465");
		properties.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		properties.put("mail.smtp.socketFactory.fallback", "false");
		
		properties.put("mail.smtp.starttls.required", "true");
		properties.put("mail.smtp.ssl.protocols", "TLSv1.2");
		return properties;
	}
	public static class senderAccount extends javax.mail.Authenticator {
		public PasswordAuthentication getPasswordAuthentication() {
			return new PasswordAuthentication("support@btc-dubai.io", "dqzqptvbpkermgst"); // @gmail.com. 제외																// PASS
		}
	}
	
}
