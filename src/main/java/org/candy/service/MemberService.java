package org.candy.service;

import java.util.List;

import org.candy.domain.Criteria;
import org.candy.domain.UserVO;

public interface MemberService {

	   public List<UserVO> list(Criteria cri);
	   
	   public int getTotal(Criteria cri);
	   
	   public UserVO read(String uid);
}
