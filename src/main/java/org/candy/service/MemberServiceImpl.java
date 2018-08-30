package org.candy.service;

import java.util.List;

import org.candy.domain.Criteria;
import org.candy.domain.UserVO;
import org.candy.mapper.MemberMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
@Log4j
@Service
public class MemberServiceImpl implements MemberService {

	@Setter(onMethod_= {@Autowired})
	private MemberMapper mapper;
	
	@Override
	public List<UserVO> list(Criteria cri) {
		
		return mapper.list(cri);
	}

	@Override
	public int getTotal(Criteria cri) {
		
		return mapper.getTotal(cri);
	}

	@Override
	public UserVO read(String uid) {
		
		log.info("MemberServiceImpl.......read.....");
		return mapper.read(uid);
	}

}
