package com.springex.springex.dto;

import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;


@Getter
@Setter
@ToString
@AllArgsConstructor
public class Member {

	private int id;
	private String name;
	private int age;
	private String email;
	private String text;


	public Member(String name, int age, String email, String text) {
		this.name = name;
	    this.age = age;
	    this.email = email;
	    this.text = text;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getId() {
		return id;
	}

	public Member(int id) {
		super();
		this.id = id;
	}



}