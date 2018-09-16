package org.candy.security;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.candy.domain.UserVO;
import org.candy.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
public class LoginSuccessHandler implements AuthenticationSuccessHandler {	
	
	@Setter(onMethod_= {@Autowired})
	private MemberService service;
	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest req, HttpServletResponse res, Authentication auth)
			throws IOException, ServletException {
				log.info("zz");
				log.warn("Login Success");
				
				List<String> roleNames = new ArrayList<>();
				
				auth.getAuthorities().forEach(authority -> {
					
					roleNames.add(authority.getAuthority());					
				});
				
				log.warn("ROLE NAMES: " + roleNames);
				
				Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
				
				UserVO vo = service.read(authentication.getName());
//				if(vo.getCtrdate() !=null) {
//					req.getRequestDispatcher("/myLogin?error=true2&ctrdate"+vo.getCtrdate()).forward(req, res);
//					res.sendRedirect("/myLogin?error=true2&ctrdate"+vo.getCtrdate());
//					req.getRequestDispatcher("/myLogin?error=true").forward(req, res);
//					return;
//				}
				
				if(roleNames.contains("ROLE_ADMIN")) {
				
					log.info("adminzzzzzz");
					res.sendRedirect("/home");
					return;
				}
				
				if(roleNames.contains("ROLE_USER")) {
					log.info("userzzzzzzz~~~~~~~~~~~");
					
					res.sendRedirect("/home");
					return;
				}
				
				res.sendRedirect("/");
			}
}