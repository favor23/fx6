package com.choa.payment.movie;

import com.choa.payment.PaymentDTO;

public class PaymentMovieDTO extends PaymentDTO{
	private int num_p;
	private int movie_num;
	
	public int getNum_p() {
		return num_p;
	}
	public void setNum_p(int num_p) {
		this.num_p = num_p;
	}
	public int getMovie_num() {
		return movie_num;
	}
	public void setMovie_num(int movie_num) {
		this.movie_num = movie_num;
	}	
}