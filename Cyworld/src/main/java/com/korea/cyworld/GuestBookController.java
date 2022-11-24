package com.korea.cyworld;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import dao.GuestBookDAO;
import util.Comm;
import vo.GuestBookVO;

@Controller

public class GuestBookController {
	
	
	GuestBookDAO guestbook_dao;
	public void setGuestbook_dao(GuestBookDAO guestbook_dao) {
		this.guestbook_dao = guestbook_dao;
	}
	
	//방명록 조회
	@RequestMapping(value = { "/", "/list.do" })
	public String list (Model model) {
		
		List<GuestBookVO> list = guestbook_dao.selectList();
		model.addAttribute("list", list); //바인딩
		return Comm.g_VIEW_PATH + "guestbook_list.jsp"; //포워딩
	}
	
	
	@RequestMapping("/insert_form.do")
	public String insert_form() {
		return Comm.g_VIEW_PATH + "guestbook_insert_form.jsp";
	}
	
	//새 글 작성
	@RequestMapping("/insert.do")
	public String insert(GuestBookVO vo) {
		
		int res = guestbook_dao.insert(vo);
		return "redirect:list.do";
	}
	
	
	//방명록 삭제
	@RequestMapping("/delete.do")
	@ResponseBody // Ajax로 요청된 메서드는 결과를 콜백 메서드로 돌아가기 위해 반드시 필요한 어노테이션
	public String delete(int guestbookContentNum) {
        // delete.do?idx=1
        int res = guestbook_dao.delete(guestbookContentNum);

        String result = "no";
        if (res == 1) {
            result = "yes";
        }

        // yes, no값을 가지고 콜백메서드(resultFn)로 돌아간다
        // 콜백으로 리턴되는 값은 영문으로 보내준다
        return result;
    }
	
	// 글 수정 폼으로 전환
    @RequestMapping("/modify_form.do")
    public String modify_form(Model model, int guestbookContentNum) {
        // modify_form.do?idx=2&pwd=1111&c_pwd=1111
        GuestBookVO vo = guestbook_dao.selectOne(guestbookContentNum);

        if (vo != null) {
            model.addAttribute("vo", vo);
        }

        return Comm.VIEW_PATH + "guestbook_modify_form.jsp";

    }

    // 게시글 수정하기
    @RequestMapping("/modify.do")
    @ResponseBody
    public String modify(GuestBookVO vo) {

        int res = guestbook_dao.update(vo);

        String result = "{'result':'no'}";
        if (res != 0) {
            result = "{'result':'yes'}";
        }

        return result;
    }

}







