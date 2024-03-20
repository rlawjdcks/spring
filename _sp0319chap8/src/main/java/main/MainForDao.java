package main;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import config.AppCtx;
import dbquery.DbQuery;
import spring.ChangePasswordService;
import spring.Member;
import spring.MemberDao;
import spring.MemberNotFoundException;
import spring.WrongIdPasswordException;

public class MainForDao {

	private static Logger LOGGER = LoggerFactory.getLogger(MainForDao.class);
	
	public static void main(String[] args) {
		AnnotationConfigApplicationContext ctx = 
				new AnnotationConfigApplicationContext(AppCtx.class);

		MemberDao dao = ctx.getBean(MemberDao.class);
		
		
		Member member2 = new Member("cba@a.com","512345","b하나b", null);
		dao.insert2(member2);
		LOGGER.info("새로 입력된 회원 ID : {}",member2.getId());
//		Member member3 = new Member("a@a.com","2345","둘", null);
//		dao.update(member3);
		LOGGER.info("한행 입력됨");
		
		int cnt = dao.count();
		LOGGER.info("총 인원수 : {}", cnt );
		
		
		
		List<Member> list = dao.selectAll2();
		LOGGER.info("---Member테이블 내영--");
		for (Member member : list) {
			LOGGER.info(member.toString());
		}
		LOGGER.info("---Member테이블 내영끝--");
		
		
		
		
		Member member = dao.selectByEmail3("madvirus@madvirus");
		LOGGER.info("아이디:{}, 이메일:{}, 패스워드:{}, 이름:{}, 등록일:{}",
				                      member.getId(), 
				                      member.getEmail(),
				                      member.getPassword(),
				                      member.getName(),
				                      member.getRegisterDateTime());

		ctx.close();

	}
}