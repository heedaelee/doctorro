package com.doctorro.user.join.dto;

import lombok.Data;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;


@Data
public class MemberDTO {
	
	private int au_seq;
	@NotNull
	private String au_email;
	@NotNull
	private String au_pwd;
	private String roll_code;
	private String au_enabled;
    
    private int so_code;
    @NotNull @Size(max=10)
    private String m_nick;
    private String m_img;
    private String m_regdate;
    private String m_gender;
    private String m_blood;
    private String m_birth;
    private String m_marry;
    private String m_height;
    private String m_weight;
    private String m_isChild;
    private String m_mPush;
    private String m_mMail;
    private String m_point;
}
