package egovframework.example.sample.web.user;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import egovframework.example.sample.model.Message;
import egovframework.example.sample.service.impl.SampleDAO;
import egovframework.example.sample.utils.Log;
import egovframework.example.sample.utils.Send;
import egovframework.example.sample.utils.SocketHandler;
import egovframework.example.sample.utils.Utils;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Controller
public class MainController {
	
	
	@Resource(name = "sampleDAO")
	private SampleDAO sampleDAO;
	
	@Resource(name="messageSource")
    MessageSource messageSource;
	
	@RequestMapping(value="/join.do")
	public String join(){
		return "user/join";
	}
	
	@ResponseBody
	@RequestMapping(value="/sendAuth.do" , produces = "application/json; charset=utf8")
	public String sendAuth(HttpServletRequest request){
		HttpSession session = request.getSession();
		String type = request.getParameter("type");
		String value = request.getParameter("value");
		JSONObject obj = new JSONObject();
		obj.put("result", "fail");
		String code = Utils.getTempNumber(6);
		if(type.equals("phone")){
			if(Utils.isNull(value)){
				obj.put("msg", Message.get().msg(messageSource, "join.phoneInput", request));
				return obj.toJSONString();
			}
			if(!Utils.isValidPhone(value)){
				obj.put("msg", Message.get().msg(messageSource, "msg.phoneErr", request));
				return obj.toJSONString();
			}
			String country = "82";
			EgovMap info = (EgovMap)sampleDAO.select("selectMemberByPhone" , value);
			if(info != null){
				obj.put("msg", Message.get().msg(messageSource, "msg.alreadyPhone", request));
				return obj.toJSONString();
			}
			if(!Send.sendMexVerificationCode(country , value , code)){
				obj.put("msg", Message.get().msg(messageSource, "msg.sendPhoneErr", request));
				return obj.toJSONString();
			}
		}else if(type.equals("email")){
			if(Utils.isNull(value)){
				obj.put("msg", Message.get().msg(messageSource, "join.emailInput", request));
				return obj.toJSONString();
			}
			if(!Utils.isValidEmail(value)){
				obj.put("msg", Message.get().msg(messageSource, "msg.emailErr", request));
				return obj.toJSONString();
			}
			EgovMap info = (EgovMap)sampleDAO.select("selectMemberByEmail" , value);
			if(info != null){
				obj.put("msg", Message.get().msg(messageSource, "msg.alreadyEmail", request));
				return obj.toJSONString();
			}
			String message = Message.get().msg(messageSource, "msg.codeMail_1", request)
					+ Message.get().msg(messageSource, "msg.codeMail_2", request) + code +
					"\n"+ Message.get().msg(messageSource, "msg.codeMail_3", request);
			if (!Send.sendMailVerificationCode(request, value, message)) {
				obj.put("msg", Message.get().msg(messageSource, "pop.mailSendFail", request));
				return obj.toJSONString();
			}
		}else{
			obj.put("msg", Message.get().msg(messageSource, "msg.fail", request));
			return obj.toJSONString();
		}
		session.setAttribute("authType", type);
		session.setAttribute(type, value);
		session.setAttribute("authCode", code);
		obj.put("result", "success");
		obj.put("msg", Message.get().msg(messageSource, "msg.sendCode", request));
		return obj.toJSONString();
		
	}
	@ResponseBody
	@RequestMapping(value="/checkAuth.do" , produces = "application/json; charset=utf8")
	public String checkAuth(HttpServletRequest request){
		HttpSession session = request.getSession();
		String code = request.getParameter("code");
		String authCode = session.getAttribute("authCode").toString();
		JSONObject obj = new JSONObject();
		obj.put("result", "fail");
		if(Utils.isNull(code)){
			obj.put("msg", Message.get().msg(messageSource, "join.authInput", request));
			return obj.toJSONString();
		}
		if(authCode.equals(code)){
			obj.put("result", "success");
			obj.put("msg", Message.get().msg(messageSource, "msg.success", request));
			return obj.toJSONString();
		}else{
			obj.put("msg", Message.get().msg(messageSource, "msg.codeErr", request));
			return obj.toJSONString();
		}
	}
	@ResponseBody
	@RequestMapping(value="/joinProcess.do" , produces = "application/json; charset=utf8")
	public String joinProcess(HttpServletRequest request){
		HttpSession session = request.getSession();
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		String code = request.getParameter("code");
		String name = request.getParameter("name");
		String pw = request.getParameter("pw");
		String pwChk = request.getParameter("pwChk");
		String invite = request.getParameter("invite");
		String authType = session.getAttribute("authType").toString();
		String authValue = session.getAttribute(authType).toString();
		String authCode = session.getAttribute("authCode").toString();
		JSONObject obj = new JSONObject();
		obj.put("result", "fail");
		if(authType.equals("phone")){
			if(Utils.isNull(phone)){
				obj.put("msg", Message.get().msg(messageSource, "join.phoneInput", request));
				return obj.toJSONString();
			}
			if(!authValue.equals(phone)){
				obj.put("msg", Message.get().msg(messageSource, "msg.phoneCodeDiff", request));
				return obj.toJSONString();
			}
			EgovMap info = (EgovMap)sampleDAO.select("selectMemberByPhone" , phone);
			if(info != null){
				obj.put("msg", Message.get().msg(messageSource, "msg.alreadyPhone", request));
				return obj.toJSONString();
			}

		}else if(authType.equals("email")){
			if(Utils.isNull(email)){
				obj.put("msg", Message.get().msg(messageSource, "join.emailInput", request));
				return obj.toJSONString();
			}
			if(!authValue.equals(email)){
				obj.put("msg", Message.get().msg(messageSource, "msg.emailCodeDiff", request));
				return obj.toJSONString();
			}
			EgovMap info = (EgovMap)sampleDAO.select("selectMemberByEmail" , email);
			if(info != null){
				obj.put("msg", Message.get().msg(messageSource, "msg.alreadyEmail", request));
				return obj.toJSONString();
			}
		}
		if(Utils.isNull(code)){
			obj.put("msg", Message.get().msg(messageSource, "join.authInput", request));
			return obj.toJSONString();
		}
		if(!authCode.equals(code)){
			obj.put("msg", Message.get().msg(messageSource, "msg.codeErr", request));
			return obj.toJSONString();
		}
		if(Utils.isNull(name)){
			obj.put("msg", Message.get().msg(messageSource, "join.nameInput", request));
			return obj.toJSONString();
		}
		if(Utils.isNull(pw)){
			obj.put("msg", Message.get().msg(messageSource, "join.pwInput", request));
			return obj.toJSONString();
		}
		if(Utils.isNull(pwChk)){
			obj.put("msg", Message.get().msg(messageSource, "join.pwChkInput", request));
			return obj.toJSONString();
		}
		if(!pw.equals(pwChk)){
			obj.put("msg", Message.get().msg(messageSource, "msg.pwDiff", request));
			return obj.toJSONString();
		}
		EgovMap in = new EgovMap();
		if(!Utils.isNull(invite)){
			EgovMap info = (EgovMap)sampleDAO.select("selectMemberChongByInvite",invite);
			if(info == null){
				obj.put("msg", Message.get().msg(messageSource, "msg.inviteErr", request));
				return obj.toJSONString();
			}else{
				in.put("pidx", info.get("idx"));
			}
		}
		String inviteCode = Utils.getTempPassword(6);
		in.put(authType, authValue);
		in.put("name", name);
		in.put("pw", pw);
		in.put("invite", inviteCode);		
		Log.print("in : " + in, "call");
		int idx = (int)sampleDAO.insert("insertMember" ,in);
		SocketHandler.sk.userManager.findByIdx(idx);
		obj.put("result", "success");
		obj.put("msg", Message.get().msg(messageSource, "msg.success", request));
		return obj.toJSONString();

	}

}
