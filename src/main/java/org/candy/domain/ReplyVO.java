package org.candy.domain;



import java.util.Date;

import lombok.Data;

@Data
public class ReplyVO {
	//��������� ���VO
	private Integer rno, bno, gno, ord;//gno=�׷�ѹ�, ord=�������� ����(0 or 1)
	private String rcontent, replyer;
	private Date regdate, updatedate;
	
}
