package org.candy.domain;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class UserVO {

	private String uid, upw, uname, email, phone_number, role, useYN;
	private int ctrrange;
	private Date regdate, updatedate, ctrdate;
	private List<UserAuthVO> authList;
	
	public UserVO() {
		this.authList = new ArrayList<UserAuthVO>();		
	}	
}
