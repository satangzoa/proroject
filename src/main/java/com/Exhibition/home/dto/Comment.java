package com.Exhibition.home.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Comment {//ment

	private int rnum; //리뷰글번호(자동생성되게)
	private String rid;//리뷰쓴사람
	private String rcontent; //리뷰내용
	private String star;//별점
	private int score; //점수	
	
}