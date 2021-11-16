package kr.smhrd.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor

public class Near_restaurantsVO {	

	private String n_num;	// 주변 번호
	private String n_foodtype;	// 분류 번호
	private String n_name;	// 주변 상호명
	private String n_addr_gu;	// 주변 주소 구
	private String n_addr_dong; // 주변 주소 동
	private String n_addr_bunji;	// 주변 주소 번지
	private String n_road_addr;	// 주변 도로명 주소
	private String n_phone;	// 주변 전화번호
	private Double n_latitude;	// 주변 위도
	private Double n_longitude;	// 주변 경도
	private String m_id;	// 작성자 아이디
	
	
	
}
