package kr.smhrd.model;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

// JDBC -> MyBatis Framework(DB Framework) -> API
public class MembersDAO {	// DAO(Data Access Object)
	//		Session=connection, Factory=공장 :Connection을 미리 만들어서 여러개를 가지고 있는 객체
	private static SqlSessionFactory sqlSessionFactory;
	// 초기화 블럭 => DB연결 작업하기!
	static {
	
		try {
			String resource = "kr/smhrd/mybatis/config.xml";
			InputStream inputStream = Resources.getResourceAsStream(resource);
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void membersInsert(MembersVO vo) {
		SqlSession session = sqlSessionFactory.openSession(); // Connection을 꺼내
		// insert SQL 전송
		session.insert("membersInsert", vo);	// insert SQL 실행
		session.commit();//완료
		session.close();	// 반납
	}
	

	public void membersDelete(String m_id) {
		SqlSession session = sqlSessionFactory.openSession(); // Connection을 꺼내
		session.delete("membersDelete", m_id);	
		session.commit();//완료
		session.close();	// 반납		
	}

		
	public void membersUpdate(MembersVO vo) {
		SqlSession session = sqlSessionFactory.openSession(); // Connection을 꺼내
		session.update("memebersUpdate", vo);	
		session.commit();//완료
		session.close();	// 반납		
	}
	
	public MembersVO isLogin(MembersVO vo) {
		SqlSession session = sqlSessionFactory.openSession(); // Connection을 꺼내
		vo = session.selectOne("isLogin", vo);	// insert SQL 실행
		session.close();	// 반납
		return vo;
	}
	
	
}
