package com.soccer.web.command;

import javax.servlet.http.HttpServletRequest;

import com.soccer.web.pool.Constants;

import lombok.Data;

@Data
public class Command implements Order{
	protected String action, domain, page, view;
	protected HttpServletRequest request;
	@Override
	public void execute() {
		this.view = String.format(Constants.DOUBLE_PATH,"facade", "main");
		
	}

}
