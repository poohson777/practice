package org.candy.domain;

import java.util.List;

import lombok.Data;

@Data
public class ReviewDTO {//������ Ʈ������ ������Ʈ (���������۰�ü.. �����ͺ�����)

	//Ǫ��Ʈ���� ���(����) DTO.... ���� 
	private int reviewCnt;
	private List<ReviewVO> list;
	
}
