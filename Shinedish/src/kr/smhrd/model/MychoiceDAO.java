package kr.smhrd.model;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

// JDBC -> MyBatis Framework(DB Framework) -> API
public class MychoiceDAO {	// DAO(Data Access Object)
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
	
	public void choiceInsert(MychoiceVO vo) {
		SqlSession session = sqlSessionFactory.openSession(); // Connection을 꺼내
		// insert SQL 전송
		session.insert("mychoiceInsert", vo);	// insert SQL 실행
		session.commit();//완료
		session.close();	// 반납
		System.out.println("mychoiceInsert() Success!!");
	}



	//mychoice list
	public List<MychoiceVO> mychoiceList(String m_id) {
		SqlSession session = sqlSessionFactory.openSession(); // Connection을 꺼내
		// insert SQL 전송
		List<MychoiceVO> list= session.selectList("mychoicelist", m_id);	// insert SQL 실행
		session.close();	// 반납
		System.out.println("mychoiceList() Success!!");
		return list;
	}

	public List<MychoiceVO> mychoiceSearch(String m_id) {
		SqlSession session = sqlSessionFactory.openSession(); // Connection을 꺼내
		// insert SQL 전송
		List<MychoiceVO> list= session.selectList("mychoiceSearch", m_id);	// insert SQL 실행
		session.close();	// 반납
		System.out.println("mychoiceSearch() Success!!");
		return list;
	}
	
}
