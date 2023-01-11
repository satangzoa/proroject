package com.Exhibition.home.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CartDTO {// cart 장바구니//시퀀스 cart_seq
	
	private int cnum;//시퀀스자동생성
	private String cname;	//상품명
	private int cprice;		//상품가격
	private int count;		//상품수량
	private String mid;		//산 사람 아이디
	
}
