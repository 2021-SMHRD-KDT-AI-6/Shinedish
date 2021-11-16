package kr.smhrd.model;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor

public class ReviewsVO {	

	private int review_num;	// ���� ��ȣ
	private String r_num;	// ���� ��ȣ
	private String r_name;	// ���� ��ȣ
	private String review_content;	// ���� ����
	private Date reg_date;	// �ۼ� ����
	private String m_id;	// �ۼ��� ���̵�
	private String review_pic1;	// ���� ����1
	private String review_pic2;	// ���� ����2
	private Double r_rating;	// ����
	private int r_cnt;	// ���� ī��Ʈ
	
	
	
}
