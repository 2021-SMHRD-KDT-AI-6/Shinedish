package kr.smhrd.model;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor

public class MychoiceVO {	

	private int c_num;	// 초이스 번호
	private String r_num;	// 맛집 번호
	private String r_name;	// 맛집 상호
	private String m_id;	// 작성자 아이디
		
	
}
