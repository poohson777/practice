package org.candy.domain;

import java.util.List;

import lombok.Data;

@Data
public class AttachDTO {
	
	//Ǫ��Ʈ���� ���Ͼ��ε� ���� Ȯ��.... ÷������ �ִ���������? Ŭ�������� ������ Ȯ���Ϸ���??(?)

	private int uploadCnt;
	private List<AttachVO> list;
}
