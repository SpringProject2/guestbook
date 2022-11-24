package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.GuestBookVO;


public class GuestBookDAO {
	
	SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	

	//방명록 전체 목록 조회
	public List<GuestBookVO> selectList(){
		List<GuestBookVO> list = sqlSession.selectList("cw.guestbook_list");
		return list;
	}
	
	//새 글 추가
	public int insert(GuestBookVO vo) {
		int res = sqlSession.insert("cw.guestbook_insert", vo);
		return res;
	}

	//글 삭제
	public int delete(int guestbookContentNum) {
		int res = sqlSession.delete("cw.guestbook_delete", guestbookContentNum);
		return res;
	}

	//수정을 위한 게시글 한 건 조회
	public GuestBookVO selectOne(int guestbookContentNum) {
		GuestBookVO vo = sqlSession.selectOne("cw.guestbook_one", guestbookContentNum);
		return vo;
	}

	//게시글 수정
	public int update(GuestBookVO vo) {
		int res = sqlSession.update("cw.guestbook_update", vo);
		return res;
	}

	
}

