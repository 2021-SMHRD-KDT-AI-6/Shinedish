package kr.smhrd.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor

public class Near_restaurantsVO {	

	private String n_num;	// �ֺ� ��ȣ
	private String n_foodtype;	// �з� ��ȣ
	private String n_name;	// �ֺ� ��ȣ��
	private String n_addr_gu;	// �ֺ� �ּ� ��
	private String n_addr_dong; // �ֺ� �ּ� ��
	private String n_addr_bunji;	// �ֺ� �ּ� ����
	private String n_road_addr;	// �ֺ� ���θ� �ּ�
	private String n_phone;	// �ֺ� ��ȭ��ȣ
	private Double n_latitude;	// �ֺ� ����
	private Double n_longitude;	// �ֺ� �浵
	private String m_id;	// �ۼ��� ���̵�
	
	
	
}
