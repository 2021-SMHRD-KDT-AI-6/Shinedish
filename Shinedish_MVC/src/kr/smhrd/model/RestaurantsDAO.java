package kr.smhrd.model;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

// JDBC -> MyBatis Framework(DB Framework) -> API
public class RestaurantsDAO {	// DAO(Data Access Object)
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
	
	public List<RestaurantsVO> boardList() {
		SqlSession session = sqlSessionFactory.openSession(); // Connection�� ����
		List<RestaurantsVO> list = session.selectList("res_List");
		System.out.println("Connection Success!!");
		session.close();	// �ݳ�
		System.out.println("DisConnection Success!!");
		return list;
	}
	
	public RestaurantsVO detailList(String r_num) {
		SqlSession session = sqlSessionFactory.openSession(); // Connection�� ����
		RestaurantsVO list = session.selectOne("detail", r_num);
		System.out.println("Connection Success!!");
		session.close();	// �ݳ�
		System.out.println("DisConnection Success!!");
		return list;
	}
}
