package kr.smhrd.model;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor

public class RestaurantsVO {	// user table -> 3명 저장

	private String r_num;	// 맛집 번호
	private String r_foodtype;	// 분류 번호
	private int mood_num;	// 무드 순번
	private String r_name;	// 맛집 상호
	private String r_addr_gu;	// 맛집 주소 구
	private String r_addr_dong; // 맛집 주소 동
	private String r_addr_bunji;	// 맛집 주소 번지
	private String r_road_addr;	// 맛집 도로명 주소
	private String r_phone;	// 맛집 전화번호
	private Date r_start_date;	// 맛집 개시일자
	private String r_running_time;	// 맛집 영업시간
	private Double r_latitude;	// 맛집 위도
	private Double r_longitude;	// 맛집 경도
	private int r_cnt;	// 조회수
	private String r_pic1;	// 맛집 사진경로1
	private String r_pic2;	// 맛집 사진경로2
	private String r_pic3;	// 맛집 사진경로3
	private String r_pic4;	// 맛집 사진경로4
	private String r_mobum_yn;	// 모범 음식점 여부
	private Double total_score;	// 최종 점수
	
	

	
}
