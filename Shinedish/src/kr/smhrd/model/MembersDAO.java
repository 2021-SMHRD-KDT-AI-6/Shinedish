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
	
	public void membersInsert(MembersVO vo) {
		SqlSession session = sqlSessionFactory.openSession();
		session.insert("memberInsert", vo);
		session.commit();
		session.close();
	}
	

	public void membersDelete(String m_id) {
		SqlSession session = sqlSessionFactory.openSession(); // Connection�� ����
		session.delete("membersDelete", m_id);	
		session.commit();//�Ϸ�
		session.close();	// �ݳ�		
	}

		
	public void membersUpdate(MembersVO vo) {
		SqlSession session = sqlSessionFactory.openSession(); // Connection�� ����
		session.update("memebersUpdate", vo);	
		session.commit();//�Ϸ�
		session.close();	// �ݳ�		
	}
	
	public MembersVO isLogin(MembersVO vo) {
		SqlSession session = sqlSessionFactory.openSession(); // Connection�� ����
		vo = session.selectOne("isLogin", vo);	// insert SQL ����
		session.close();
		return vo;
	}
	
}
