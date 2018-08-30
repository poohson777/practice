package org.candy.mapper;

import java.util.List;

import org.candy.domain.Criteria;
import org.candy.domain.UserVO;

public interface MemberMapper {
	
	   public List<UserVO> list(Criteria cri);

	   public int getTotal(Criteria cri);
	   
	   public UserVO read(String uid);
}
