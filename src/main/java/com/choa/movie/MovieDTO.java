package com.choa.movie;

import java.sql.Date;

public class MovieDTO {
	private int movie_num;
	private String movie_title;
	private String synopsis;
	private String director;
	private String actor;
	private Date release_date;
	private String restricted;
	private int running_time;
	private String genre;
	private String poster_img;
	private Date release_end;
	private int movie_price;
	
	public int getMovie_price() {
		return movie_price;
	}
	public void setMovie_price(int movie_price) {
		this.movie_price = movie_price;
	}
	public Date getRelease_end() {
		return release_end;
	}
	public void setRelease_end(Date release_end) {
		this.release_end = release_end;
	}
	public int getMovie_num() {
		return movie_num;
	}
	public void setMovie_num(int movie_num) {
		this.movie_num = movie_num;
	}
	public String getMovie_title() {
		return movie_title;
	}
	public void setMovie_title(String movie_title) {
		this.movie_title = movie_title;
	}
	public String getSynopsis() {
		return synopsis;
	}
	public void setSynopsis(String synopsis) {
		this.synopsis = synopsis;
	}
	public String getDirector() {
		return director;
	}
	public void setDirector(String director) {
		this.director = director;
	}
	public String getActor() {
		return actor;
	}
	public void setActor(String actor) {
		this.actor = actor;
	}
	public Date getRelease_date() {
		return release_date;
	}
	public void setRelease_date(Date release_date) {
		this.release_date = release_date;
	}
	public String getRestricted() {
		return restricted;
	}
	public void setRestricted(String restricted) {
		this.restricted = restricted;
	}
	public int getRunning_time() {
		return running_time;
	}
	public void setRunning_time(int running_time) {
		this.running_time = running_time;
	}
	public String getGenre() {
		return genre;
	}
	public void setGenre(String genre) {
		this.genre = genre;
	}
	public String getPoster_img() {
		return poster_img;
	}
	public void setPoster_img(String poster_img) {
		this.poster_img = poster_img;
	}
}
