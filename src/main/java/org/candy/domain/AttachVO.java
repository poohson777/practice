package org.candy.domain;

import java.util.Date;

import lombok.Data;
@Data
public class AttachVO {
	
	//Ǫ��Ʈ���� ���Ͼ��ε�
	
	private String uuid, fullname, represent; //��񿡴� uuid+fullname , represent �� ��ǥ���� T or F 
	private int fno;
	private Date regdate;

}
