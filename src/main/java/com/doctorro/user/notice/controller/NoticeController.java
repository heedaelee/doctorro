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

	@RequestMapping(value = "notice", method= {RequestMethod.GET,RequestMethod.POST})
	public String notice_list(Model model, PagingDTO paging ) {
		System.out.println("user notice 컨트롤러 탐");
		//paging시 index랑  listCnt만 DB에 던짐
		
		int total = noticeService.getTotal();
		paging.setTotal(total);
		
		List<NoticeDto> firstList = noticeService.getFirstList();
		List<NoticeDto> noticeList = noticeService.getNoticeList(paging);
		
		model.addAttribute("pageName", "notice_list");
		model.addAttribute("noticeList", noticeList);
		model.addAttribute("firstList", firstList);
    	model.addAttribute("p", paging);
    	
    	System.out.println("noticeList 컨트롤러 최종 값"+ noticeList.toString());
    	System.out.println("noticeList 페이징 : " + paging.toString());
		System.out.println("noticeList 게시글 총갯수 : " + paging.getTotal());
		
		return "notice_list.user";
	}
	
	@RequestMapping("/notice_view")
	public String getView(int no_seq, Model model) {
		
		model.addAttribute("notice_view","notice_view");
		
		NoticeDto noticeDto=noticeService.getView(no_seq);
		model.addAttribute("noticeDto",noticeDto);
		
		// 조회증가&상세조회
		System.out.println("images : " + noticeDto.getNi_names().toString());
		System.out.println("디테일 " + noticeDto.toString());

		return "notice_view.user";
	}

}
