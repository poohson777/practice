package org.candy.security;

import org.springframework.security.crypto.password.PasswordEncoder;
import lombok.extern.log4j.Log4j;

@Log4j
public class CustomPasswordEncoder implements PasswordEncoder {

	@Override
	public String encode(CharSequence rawPassword) {
		
		log.info("rawPassword~~~~~" + rawPassword);		
		return rawPassword.toString();
	}

	@Override
	public boolean matches(CharSequence rawPassword, String encodedPassword) {
		
		log.info("match~~~");
		log.info(rawPassword + ":" + encodedPassword);
		
		return rawPassword.toString().equals(encodedPassword);
	}

}
