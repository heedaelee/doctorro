package com.doctorro.user.join.dto;

import lombok.Data;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;


@Data
public class MemberDTO {
    private int m_seq;
    private int so_code;
    @NotNull 
    private String m_email;
    @NotNull
    private String m_pwd;
    @NotNull @Size(max=10)
    private String m_nick;
    private String m_enable;
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
