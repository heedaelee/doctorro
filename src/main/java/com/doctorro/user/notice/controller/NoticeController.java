package com.doctorro.user.notice.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.View;

import com.doctorro.common.PagingDTO;
import com.doctorro.user.notice.dto.NoticeDto;
import com.doctorro.user.notice.service.NoticeService;

@Controller
@RequestMapping(value="/user/")
public class NoticeController {
	
	@Autowired
	private View jsonview;

	@Autowired
	private NoticeService noticeService;

	@RequestMapping(value = "notice", method=RequestMethod.GET)
	public String notice_list(Model model, PagingDTO paging ) {
		System.out.println("user notice 컨트롤러 탐");
		//paging시 index랑  listCnt만 DB에 던짐
		
		List<NoticeDto> noticeList = noticeService.getNoticeList(paging);
		List<NoticeDto> firstList = noticeService.getFirstList();
		
		model.addAttribute("pageName", "notice_list");
		model.addAttribute("noticeList", noticeList);
		model.addAttribute("firstList", firstList);
    	/*model.addAttribute("p", paging);*/
    	/*model.addAttribute("totalCount", totalCount);*/
    	
    	/*System.out.println("컨트롤러 최종 값"+ list.toString());
    	System.out.println("페이징 : " + paging.toString());
		System.out.println("게시글 총갯수 : " + totalCount);*/
		
		return "notice_list.user";
	}
	
	/*@RequestMapping("/notice_view")
	public String gowith_detail(int g_Num,Principal principal, Model model) {
		
		model.addAttribute("tile","tile");
		String m_Email = principal.getName();
		MemberDTO dto = new MemberDTO();
		dto = tservice.mypageMember(m_Email);
		model.addAttribute("dto",dto);
		
		// 조회증가&상세조회
		GowithDTO gowithDTO = gowithService.selectGowith(g_Num);
		List<go_ReplyDTO> reply = gowithService.replylist(g_Num);
		System.out.println("images : " + gowithDTO.getGi_Images().toString());
		System.out.println("디테일 " + gowithDTO.toString());
		model.addAttribute("dto1", gowithDTO);
		model.addAttribute("reply", reply);

		return "gowith.gowith_detail";
	}*/

}
