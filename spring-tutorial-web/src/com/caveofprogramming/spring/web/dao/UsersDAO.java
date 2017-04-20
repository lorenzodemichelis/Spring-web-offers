package com.caveofprogramming.spring.web.dao;

import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

@Component("usersDao")
public class UsersDAO {

	private NamedParameterJdbcTemplate jdbc;
	
	@Autowired
	private PasswordEncoder passwordEncoder;

	@Autowired
	public void setDataSource(DataSource jdbc) {
		this.jdbc = new NamedParameterJdbcTemplate(jdbc);
	}

	@Transactional
	public boolean create(User user) {

		MapSqlParameterSource params = new MapSqlParameterSource();
		
		params.addValue("username", user.getUsername());
		params.addValue("password", this.passwordEncoder.encode(user.getPassword()));
		params.addValue("email", user.getEmail());
		params.addValue("enabled", user.isEnabled());
		params.addValue("authority", user.getAuthority());
		
		String sql_insert_user = "insert into users (username, password, email, enabled) values (:username, :password, :email, :enabled)";
		String sql_insert_authority = "insert into authorities (username, authority) values (:username, :authority)";
		this.jdbc.update(sql_insert_user, params);
		return jdbc.update(sql_insert_authority, params) == 1;

	}

	public boolean exists(String username) {
		String sql = "select count(*) from users where username=:username";
		return this.jdbc.queryForObject(sql, new MapSqlParameterSource("username", username), Integer.class) > 0;

	}

	public List<User> getAllUsers() {
		String sql = "select * from users, authorities where users.username = authorities.username";
		return this.jdbc.query(sql, BeanPropertyRowMapper.newInstance(User.class));
	}

}
