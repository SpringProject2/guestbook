package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.GuestBookVO;


public class GuestBookDAO {
	
	SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	

	//���� ��ü ��� ��ȸ
	public List<GuestBookVO> selectList(){
		List<GuestBookVO> list = sqlSession.selectList("cw.guestbook_list");
		return list;
	}
	
	//�� �� �߰�
	public int insert(GuestBookVO vo) {
		int res = sqlSession.insert("cw.guestbook_insert", vo);
		return res;
	}

	//�� ����
	public int delete(int guestbookContentNum) {
		int res = sqlSession.delete("cw.guestbook_delete", guestbookContentNum);
		return res;
	}

	//������ ���� �Խñ� �� �� ��ȸ
	public GuestBookVO selectOne(int guestbookContentNum) {
		GuestBookVO vo = sqlSession.selectOne("cw.guestbook_one", guestbookContentNum);
		return vo;
	}

	//�Խñ� ����
	public int update(GuestBookVO vo) {
		int res = sqlSession.update("cw.guestbook_update", vo);
		return res;
	}

	
}

