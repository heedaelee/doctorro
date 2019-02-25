package com.doctorro.user.event.dto;

import java.util.List;

import lombok.Data;

@Data
public class EventDto {

	private int ev_seq;
	private int au_seq;
	private int t_seq;
	private int ei_seq;
	private String ev_title;
	private String ev_subTitle;
	private String ev_content;
	private String ev_regdate;
	private int ev_hit;
	private String ev_from;
	private String ev_to;
	private String ev_isIng_YN;
	
	//사진
	private String ei_name;
	private List<String> ei_names;
	
	//태그
	private String tage_name;
	private List<String> tage_names;
	
}
