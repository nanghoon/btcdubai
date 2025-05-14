package egovframework.example.sample.model;

import egovframework.example.sample.utils.Log;
import egovframework.rte.psl.dataaccess.util.EgovMap;

public class User {
	public int idx; 
	
	public User(EgovMap l){ 
		try {
			idx = Integer.parseInt(""+l.get("idx"));
		} catch (Exception e) {
			Log.print("User Error :: " + e.getMessage(), "err");
		}
	}
}
