package com.doctorro.user.join.dto;

import lombok.Data;

@Data
public class MemberDTO {
    private int m_seq;
    private int so_code;
    private String m_email;
    private String m_pwd;
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
