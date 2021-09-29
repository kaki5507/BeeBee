package com.sh.domain;

import java.util.ArrayList;
import java.util.List;

import lombok.Data;

@Data
public class MemberDTOList {

	private List<MemberDTO> MemberList;
	
	public MemberDTOList() {
		MemberList = new ArrayList<MemberDTO>();
	}
}
