package com.springex.springex.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collection;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import com.springex.springex.dto.Member;

@Repository
public class MemberDao {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;


	public List<Member> selectAll() {
		List<Member> results = jdbcTemplate.query(
				"select * from MEMBER",
				new RowMapper<Member>() {
					@Override
					public Member mapRow(ResultSet rs, int rowNum) throws SQLException {
						Member member = new Member(
								rs.getInt("ID"),
								rs.getString("NAME"),
								rs.getInt("AGE"),
								rs.getString("EMAIL"),
								rs.getString("TEXT")
						);
						return member;
					}
				});

		return results;

	}
	public int count() {
		return jdbcTemplate.queryForObject
				("select count(*) from member", Integer.class);
	}
	
	public void insert2(Member member) {
		jdbcTemplate.update(
				"insert into MEMBER (NAME, AGE, EMAIL, TEXT) values (?, ?, ?, ?)",
				member.getName(), member.getAge() ,member.getEmail(),member.getText());
	}
	
	public void update(Member member) {
		jdbcTemplate.update(
				"update MEMBER set NAME = ?,AGE = ?, TEXT = ? where ID = ?",
				member.getName(), member.getAge(), member.getText(),member.getId());
	}
	
	public void delete(Member member) {
		
		jdbcTemplate.update("delete from member where ID = ?", member.getId());
		
	}

}