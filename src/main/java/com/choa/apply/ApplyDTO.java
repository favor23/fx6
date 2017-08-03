package com.choa.apply;

public class ApplyDTO {
	
	private String id;
	private String name;
	private String towriter;
	private int matching_num;
	private String apply_roll;
	private int apply_num;
	
	
	
	
	
	public int getApply_num() {
		return apply_num;
	}
	public void setApply_num(int apply_num) {
		this.apply_num = apply_num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public String getTowriter() {
		return towriter;
	}
	public void setTowriter(String towriter) {
		this.towriter = towriter;
	}
	public int getMatching_num() {
		return matching_num;
	}
	public void setMatching_num(int matching_num) {
		this.matching_num = matching_num;
	}
	public String getApply_roll() {
		return apply_roll;
	}
	public void setApply_roll(String apply_roll) {
		this.apply_roll = apply_roll;
	}
	
	
	

}
