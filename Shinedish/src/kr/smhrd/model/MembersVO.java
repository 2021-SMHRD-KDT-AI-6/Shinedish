package kr.smhrd.model;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor

public class MembersVO {	// user table -> 3�� ����

	private String m_id;	
	private String m_pwd;	
	private String m_email;	
	private String m_birthdate; 
	
	private String m_joindate;	
	private String m_status;	
	private String admin_yn;	
	private Date m_retire_date;	

	
}
