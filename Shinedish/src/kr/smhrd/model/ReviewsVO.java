package kr.smhrd.model;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor

public class ReviewsVO {	

	private int review_num;	// 리뷰 번호
	private String r_num;	// 맛집 번호
	private String r_name;	// 맛집 상호
	private String review_content;	// 리뷰 내용
	private Date reg_date;	// 작성 일자
	private String m_id;	// 작성자 아이디
	private String review_pic1;	// 리뷰 사진1
	private String review_pic2;	// 리뷰 사진2
	private Double r_rating;	// 별점
	private int r_cnt;	// 리뷰 카운트
	
	
	
}
