package com.kh.portfolio;

import java.sql.Connection;
import java.sql.SQLException;

import javax.inject.Inject;
import javax.sql.DataSource;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

@ExtendWith(SpringExtension.class) //스크링컨텍스트와 junit통합
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class DBconnection {
	private static final Logger logger = LoggerFactory.getLogger(DBconnection.class);
	
	@Inject
	DataSource dataSource;
	
	@Inject
	JdbcTemplate jdbcTemplate;
	
	@Test
	void testdb() {
		logger.info("데이터소스:"+dataSource);
		logger.info("JdbcTemplate:"+jdbcTemplate);
		
		try {
			Connection conn = dataSource.getConnection();
			logger.info("DB연결 성공!!");
		} catch (SQLException e) {
			logger.error("db연결 실패!!");
			e.printStackTrace();
		}
	}
}









