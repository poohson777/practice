package org.candy.controller;

import org.candy.domain.Criteria;
import org.candy.domain.PageMaker;
import org.candy.domain.UserVO;
import org.candy.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/member/*")
@Log4j
public class MemberController {
	
	@Setter(onMethod_= {@Autowired})
	private MemberService service;
	
	@GetMapping("/memberlist")
	public void memberlist(@ModelAttribute("cri")Criteria cri,Model model) throws Exception{
		
		log.info("memberlist.......");
		model.addAttribute("list",service.list(cri));
		
		int totalCount = service.getTotal(cri);
		
		PageMaker pm =
				new PageMaker(cri, totalCount);
		model.addAttribute("pm",pm);		
	
		
	}

	@GetMapping("/memberread")
	public void memberread(@ModelAttribute("cri")Criteria cri, @ModelAttribute("uid") String uid,Model model) throws Exception{
		log.info("Read.....");
		model.addAttribute("vo", service.read(uid));
		log.info("Crireadread post"+cri.getPage());

		
	}	
	
	@PostMapping("/suspension")
	public ResponseEntity<String> susension(@RequestBody UserVO vo) {
			
		log.info("활동중지 controller");	
		
		if(vo.getCtrrange() > 0) {
			log.info("활동중지 ddddddddddd");	
			vo.setCtrrange(vo.getCtrrange() * 7);
		}	
		
		service.suspension(vo);

		
		return new ResponseEntity<String>("success",HttpStatus.OK);
		
		
	
	}		
		
	
	
	
}
