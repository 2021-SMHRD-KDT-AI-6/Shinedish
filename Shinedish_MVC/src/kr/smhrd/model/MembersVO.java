package kr.smhrd.model;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor

public class MembersVO {	// user table -> 3�� ����

	private String m_id;	// ȸ�� ���̵�
	private String m_pwd;	// ȸ�� ��й�ȣ
	private String m_name;	// ȸ�� �̸�
	private String m_email;	// ȸ�� �̸���
	private String m_gender;	// ȸ�� ����
	private Date m_birthdate; // ȸ�� �������
	private String m_phone;	// ȸ�� ��ȭ��ȣ
	private String m_joindate;	// ȸ�� ��������
	private String m_prifile_pic;	// ȸ�� ������ ����
	private String m_status;	// ȸ�� ���Ի��� ����
	private String admin_yn;	// ������ ����
	private Date m_retire_date;	// Ż�� ����

	
}
