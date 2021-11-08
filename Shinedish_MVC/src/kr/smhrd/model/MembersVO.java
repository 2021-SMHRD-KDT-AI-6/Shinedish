package kr.smhrd.model;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor

public class MembersVO {	// user table -> 3명 저장

	private String m_id;	// 회원 아이디
	private String m_pwd;	// 회원 비밀번호
	private String m_name;	// 회원 이름
	private String m_email;	// 회원 이메일
	private String m_gender;	// 회원 성별
	private Date m_birthdate; // 회원 생년월일
	private String m_phone;	// 회원 전화번호
	private String m_joindate;	// 회원 가입일자
	private String m_prifile_pic;	// 회원 프로필 사진
	private String m_status;	// 회원 가입상태 정보
	private String admin_yn;	// 관리자 여부
	private Date m_retire_date;	// 탈퇴 일자

	
}
