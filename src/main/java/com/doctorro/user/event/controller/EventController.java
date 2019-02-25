package com.doctorro.user.event.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.View;

import com.doctorro.common.PagingDTO;
import com.doctorro.user.event.dto.EventDto;
import com.doctorro.user.event.service.EventService;

@Controller
@RequestMapping(value="/user/")
public class EventController {
	
	@Autowired
	private View jsonview;

	@Autowired
	private EventService eventService;

	@RequestMapping(value = "event", method= {RequestMethod.GET,RequestMethod.POST})
	public String Event_list(Model model, PagingDTO paging ) {
		System.out.println("user Event 컨트롤러 탐");
		//page list 8개
		paging.setListCnt(8);
		
		//paging시 index랑  listCnt만 DB에 던짐
		int total = eventService.getTotal();
		paging.setTotal(total);
		
		List<EventDto> eventList = eventService.getEventList(paging);
		
		model.addAttribute("pageName", "event_list");
		model.addAttribute("eventList", eventList);
    	model.addAttribute("p", paging);
    	
    	System.out.println("EventList 컨트롤러 최종 값"+ eventList.toString());
    	System.out.println("EventList 페이징 : " + paging.toString());
		System.out.println("EventList 게시글 총갯수 : " + paging.getTotal());
		
		return "event_list.user";
	}
	
	@RequestMapping("/event_view")
	public String getView(int ev_seq, Model model) {
		
		model.addAttribute("event_view","event_view");
		
		EventDto eventDto=eventService.getView(ev_seq);
		model.addAttribute("eventDto",eventDto);
		
		// 조회증가&상세조회
		System.out.println("images : " + eventDto.getEi_names().toString());
		System.out.println("디테일 " + eventDto.toString());

		return "event_view.user";
	}

}
