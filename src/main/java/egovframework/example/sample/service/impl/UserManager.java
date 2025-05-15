package egovframework.example.sample.service.impl;

import java.util.ArrayList;
import java.util.List;

import egovframework.example.sample.model.User;
import egovframework.example.sample.utils.SocketHandler;
import egovframework.rte.psl.dataaccess.util.EgovMap;

public class UserManager {
	public ArrayList<User> userList = new ArrayList<User>();
	int userCnt = 0; // 서버 시작 후 유저 100명씩 끊어서 가져오기 위한 변수
	
	// 서버 시작 후 100명씩 끊어서 로딩 ( 사람 많을경우 대비 )
	public void userLoading() {
		List<EgovMap> list = (List<EgovMap>)SocketHandler.sk.getSampleDAO().list("selectMemberListLimit100" , userCnt );
		for(EgovMap l : list) {
			if(!userAlreadyLoading(Integer.parseInt(""+l.get("idx")))) {
				User u = new User(l);
				userList.add(u);
			}
		}
		userCnt += 100;
		if(list.size() < 100) SocketHandler.sk.userLoad = false;
		
	}
	
	// 유저리스트에 해당 유저가 존재하는지 여부 
	public boolean userAlreadyLoading(int uidx) {
		return userList.stream().anyMatch(u -> u.idx == uidx);
	}
	
	// idx로 유저 찾기
	public User findByIdx(int idx) {
		User user = userList.stream().filter(u -> u.idx == idx).findFirst().orElse(null);
		if(user == null) {
			user = addUserByIdx(idx);
		}
		return user;
	}

	public User addUserByIdx(int idx) {
		EgovMap l= (EgovMap)SocketHandler.sk.getSampleDAO().select("selectMemberByIdx" , idx);
		if(l == null) return null;
		User u = new User(l);
		userList.add(u);
		return u;
	}
	
}
