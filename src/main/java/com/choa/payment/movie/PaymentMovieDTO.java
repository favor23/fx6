package com.choa.payment.movie;

import com.choa.payment.PaymentDTO;

public class PaymentMovieDTO extends PaymentDTO{
	private int num_p;
	private String movie_num;
	
	public int getNum_p() {
		return num_p;
	}
	public void setNum_p(int num_p) {
		this.num_p = num_p;
	}
	public String getMovie_num() {
		return movie_num;
	}
	public void setMovie_num(String movie_num) {
		this.movie_num = movie_num;
	}
	
}