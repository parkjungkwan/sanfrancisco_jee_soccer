package com.soccer.web.domains;

import java.io.Serializable;

public class StadiumBean implements Serializable {
	private static final long serialVersionUID = 1L;
	private String stadiumId,
			stadiumName,
			hometeamId,
			seatCount,
			address,
			ddd,
			tel;

	public String getStadiumId() {
		return stadiumId;
	}

	public void setStadiumId(String stadiumId) {
		this.stadiumId = stadiumId;
	}

	public String getStadiumName() {
		return stadiumName;
	}

	public void setStadiumName(String stadiumName) {
		this.stadiumName = stadiumName;
	}

	public String getHometeamId() {
		return hometeamId;
	}

	public void setHometeamId(String hometeamId) {
		this.hometeamId = hometeamId;
	}

	public String getSeatCount() {
		return seatCount;
	}

	public void setSeatCount(String seatCount) {
		this.seatCount = seatCount;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getDdd() {
		return ddd;
	}

	public void setDdd(String ddd) {
		this.ddd = ddd;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	@Override
	public String toString() {
		return "StadiumBean [stadiumId=" + stadiumId + ", stadiumName=" + stadiumName + ", hometeamId=" + hometeamId
				+ ", seatCount=" + seatCount + ", address=" + address + ", ddd=" + ddd + ", tel=" + tel + "]";
	}

	
}
