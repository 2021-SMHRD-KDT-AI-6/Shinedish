package kr.smhrd.model;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor

public class RestaurantsVO {	// user table -> 3�� ����

	private String r_num;	// ���� ��ȣ
	private String r_foodtype;	// �з� ��ȣ
	private int mood_num;	// ���� ����
	private String r_name;	// ���� ��ȣ
	private String r_addr_gu;	// ���� �ּ� ��
	private String r_addr_dong; // ���� �ּ� ��
	private String r_addr_bunji;	// ���� �ּ� ����
	private String r_road_addr;	// ���� ���θ� �ּ�
	private String r_phone;	// ���� ��ȭ��ȣ
	private Date r_start_date;	// ���� ��������
	private String r_running_time;	// ���� �����ð�
	private Double r_latitude;	// ���� ����
	private Double r_longitude;	// ���� �浵
	private int r_cnt;	// ��ȸ��
	private String r_pic1;	// ���� �������1
	private String r_pic2;	// ���� �������2
	private String r_pic3;	// ���� �������3
	private String r_pic4;	// ���� �������4
	private String r_mobum_yn;	// ��� ������ ����
	private Double total_score;	// ���� ����
	
	

	
}
