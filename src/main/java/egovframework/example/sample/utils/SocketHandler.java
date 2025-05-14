package egovframework.example.sample.utils;

import java.util.HashSet;
import java.util.LinkedList;
import java.util.Properties;
import java.util.Set;

import javax.annotation.Resource;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.context.MessageSource;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import egovframework.example.sample.model.UserMsg;
import egovframework.example.sample.service.impl.SampleDAO;
import egovframework.example.sample.service.impl.UserManager;

public class SocketHandler extends TextWebSocketHandler implements InitializingBean{
    @Resource(name = "sampleDAO")
    private SampleDAO sampleDAO;
    
    @Resource(name="messageSource")
    MessageSource messageSource;
    
	@Resource(name = "fileProperties")
	private Properties fileProperties;
	
	public Set<WebSocketSession> sessionSet = new HashSet<WebSocketSession>(); 
	public static SocketHandler sk=null;        
	public static LinkedList<UserMsg> msgList = new LinkedList<>();
	
	public boolean userLoad = true;
	public UserManager userManager = new UserManager();
	
    public SocketHandler() {  
    	super();
    	sk = this; 
    }
    
    public Properties getProperties(){
    	return fileProperties;
    }
    
    public SampleDAO getSampleDAO(){
    	return sampleDAO;
    }
    
	/*
	 * 소켓 메시지 처리 
	 */
	private void cmdProcess() {
    	UserMsg um = null;
        synchronized(msgList){
        	if( msgList.size()>0) um = msgList.pop();
        }
        if( um == null) return;
        WebSocketSession session = um.session;
        try{
	        String msg = um.msg;
	        JSONParser p = new JSONParser();
	        JSONObject obj = (JSONObject)p.parse(msg);
	        String protocol = obj.get("protocol").toString();
	        switch (protocol) {
			case "connect":
				break;
			default:
				Log.print(protocol+" 프로토콜 처리 없음", "err");
				break;
			}
        }catch(Exception e){
        	Log.print("cmdProcess Err :" + e.getMessage(), "err");
        }
	}
	
	/*
	 * 접속해있는 모든 클라이언트에게 보냄 
	 */
	public void sendMessageAll(String msg){
		synchronized (sessionSet) {
			for(WebSocketSession s : sessionSet){
				if(s.isOpen()){
					try {
						s.sendMessage(new TextMessage(msg));
					} catch (Exception e) {
						Log.print("sendMessageAll Error :" + e.getMessage(), "err");
					}
				}
			}
		}
	}
	
	/*
	 * 개인 클라이언트에게 보냄
	 */
	public void sendMessageTo(WebSocketSession session , String msg){
		if(session == null) return;
		synchronized (session) {
			if(session.isOpen()){
				try {
					session.sendMessage(new TextMessage(msg));
				} catch (Exception e) {
					Log.print("sendMessageTo Error :" + e.getMessage(), "err");
				}
			}
		}
	}
	public void init(){
		try {
			
		} catch (Exception e) {
			Log.print("SocketHandler init Err : " + e.getMessage(), "err");
		}
	}
	@Override
	public void afterPropertiesSet() throws Exception {
		Log.print("call afterPropertiesSet", "call");
		try {
			init();			
		} catch (Exception e) {
			Log.print("afterPropertiesSet init err! " + e, "err");
		}
		Thread mainThread = new Thread() {	  
            @Override	 
            public void run() {	 
                while (true) {	 
                    try {
                        Thread.sleep(50);
						for(int i=0;i<1000;i++)
							cmdProcess(); // 패킷 확인
                    } catch (Exception e){
                    	Log.print("afterPropertiesSet run mainThread Error : "+e.getMessage(), "err");
					}
                }
            }
        };	 
        mainThread.start();		
        
		// 유저 로딩
        Thread userLoadThread = new Thread() {	  
        	@Override	 
        	public void run() {	 
        		while (true) {	 
        			try {
        				Thread.sleep(50);
        				if(userLoad) userManager.userLoading();
        			} catch (Exception e){
        				Log.print("afterPropertiesSet run userLoadThread Error : "+e.getMessage(), "err");
        			}
        		}
        	}
        };	 
        userLoadThread.start();
		
        // 배치 쿼리 
//        Thread queryRunThread = new Thread() {	  
//        	@Override	 
//        	public void run() {	 
//        		while (true) {	 
//        			try {
//        				Thread.sleep(1500);
//        				queryRun();
//        			} catch (Exception e){
//        				Log.print("afterPropertiesSet run queryRunThread Error : "+e.getMessage(), "err");
//        			}
//        		}
//        	}
//        };	 
//        queryRunThread.start();
        
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		super.afterConnectionClosed(session, status);
	    synchronized (sessionSet) {
	    	sessionSet.remove(session);	
		}
	    Log.print("client disconnected ID closed : "+sessionSet.size()+":" + session.getId() , "call");
	}
	
	/*
	 * 웹소켓이 연결되면 호출되는 함수
	 */
	@Override	 
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {	 
	    super.afterConnectionEstablished(session);
	    synchronized (sessionSet) {
	    	sessionSet.add(session);
	    }
	    Log.print("afterConnectionEstablished addSession "+sessionSet.size()+":" + session.getId() , "call");
	}
	
	/*
	 * 클라이언트로부터 메시지가 도착했을때
	 */
	@Override
	public void handleMessage(WebSocketSession session,	WebSocketMessage<?> message) throws Exception {
		super.handleMessage(session, message);	 
		String msg = ""+message.getPayload();
	    synchronized(msgList) {
	    	msgList.add(new UserMsg(session,msg));
	    }	                
	}
	
	/*
	 * 전송 에러시
	 */
	@Override	 
	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
		Log.print("handleTransportError client disconnected ID: : "+session.getId() + " exception : "+exception , "call");
	}
	
	/*
	 * WebSocketHandler가 부분 메시지를 처리할 때 호출
	 */
	@Override	 
	public boolean supportsPartialMessages() {	 
	    return super.supportsPartialMessages();
	}

}
