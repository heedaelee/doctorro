package com.doctorro.common;

import javax.validation.constraints.NotNull;


import lombok.Data;

@Data
public class AuthDTO {
	    private int au_seq;
	    @NotNull
	    private String au_email;
	    @NotNull
	    private String au_pwd;
	    private String roll_code;
	    private String au_enabled;
}
