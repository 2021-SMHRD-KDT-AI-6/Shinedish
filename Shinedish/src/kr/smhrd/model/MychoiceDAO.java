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
	//		Session=connection, Factory=���� :Connection�� �̸� ���� �������� ������ �ִ� ��ü
	private static SqlSessionFactory sqlSessionFactory;
	// �ʱ�ȭ �� => DB���� �۾��ϱ�!
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
		SqlSession session = sqlSessionFactory.openSession(); // Connection�� ����
		// insert SQL ����
		session.insert("mychoiceInsert", vo);	// insert SQL ����
		session.commit();//�Ϸ�
		session.close();	// �ݳ�
		System.out.println("mychoiceInsert() Success!!");
	}



	//mychoice list
	public List<MychoiceVO> mychoiceList(String m_id) {
		SqlSession session = sqlSessionFactory.openSession(); // Connection�� ����
		// insert SQL ����
		List<MychoiceVO> list= session.selectList("mychoicelist", m_id);	// insert SQL ����
		session.close();	// �ݳ�
		System.out.println("mychoiceList() Success!!");
		return list;
	}

	public List<MychoiceVO> mychoiceSearch(String m_id) {
		SqlSession session = sqlSessionFactory.openSession(); // Connection�� ����
		// insert SQL ����
		List<MychoiceVO> list= session.selectList("mychoiceSearch", m_id);	// insert SQL ����
		session.close();	// �ݳ�
		System.out.println("mychoiceSearch() Success!!");
		return list;
	}
	
}
