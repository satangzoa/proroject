package com.Exhibition.home.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ProductDto {//상품테이블 product //시퀀스 product_seq

	private int pnum;//상품 번호(시퀀스로 자동생성되게한다)
	private String pname;//상품 이름
	private String pprice;//상품 가격
	private String pcount;//상품 갯수
	//private String mid;//산 사람 아이디

}
