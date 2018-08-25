package org.candy.domain;

import java.util.Date;

import lombok.Data;

@Data
public class FreeboardVO {

	private int bno, replycnt, viewcnt;
	private String title, content, writer;
	private Date regdate, updatedate;

	private String[] files; //��񿡴� ������ ÷�����Ͽ� �ʿ��Ѱ�... ������ �����Ҷ��� ����

	
	//new�������۾�
	private static final Long ADAY = 1000 * 60 * 60 * 24L; 

	public boolean checkNew() { 
		long gap = new Date().getTime() - regdate.getTime();
		return gap < ADAY;
	}
	
}
