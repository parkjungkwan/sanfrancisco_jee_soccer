package com.soccer.web.domains;

import java.io.Serializable;

public class TeamBean implements Serializable {
	private static final long serialVersionUID = 1L;
	private String teamId,
				regionName,
				teamName,
				eTeamName,
				origYyyy,
				stadiumId,
				zipCode1,
				zipCode2,
				adress,
				ddd,
				tel,
				fax,
				homepate,
				owner;

	public String getTeamId() {
		return teamId;
	}

	public void setTeamId(String teamId) {
		this.teamId = teamId;
	}

	public String getRegionName() {
		return regionName;
	}

	public void setRegionName(String regionName) {
		this.regionName = regionName;
	}

	public String getTeamName() {
		return teamName;
	}

	public void setTeamName(String teamName) {
		this.teamName = teamName;
	}

	public String geteTeamName() {
		return eTeamName;
	}

	public void seteTeamName(String eTeamName) {
		this.eTeamName = eTeamName;
	}

	public String getOrigYyyy() {
		return origYyyy;
	}

	public void setOrigYyyy(String origYyyy) {
		this.origYyyy = origYyyy;
	}

	public String getStadiumId() {
		return stadiumId;
	}

	public void setStadiumId(String stadiumId) {
		this.stadiumId = stadiumId;
	}

	public String getZipCode1() {
		return zipCode1;
	}

	public void setZipCode1(String zipCode1) {
		this.zipCode1 = zipCode1;
	}

	public String getZipCode2() {
		return zipCode2;
	}

	public void setZipCode2(String zipCode2) {
		this.zipCode2 = zipCode2;
	}

	public String getAdress() {
		return adress;
	}

	public void setAdress(String adress) {
		this.adress = adress;
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

	public String getFax() {
		return fax;
	}

	public void setFax(String fax) {
		this.fax = fax;
	}

	public String getHomepate() {
		return homepate;
	}

	public void setHomepate(String homepate) {
		this.homepate = homepate;
	}

	public String getOwner() {
		return owner;
	}

	public void setOwner(String owner) {
		this.owner = owner;
	}

	@Override
	public String toString() {
		return "TeamBean [teamId=" + teamId + ", regionName=" + regionName + ", teamName=" + teamName + ", eTeamName="
				+ eTeamName + ", origYyyy=" + origYyyy + ", stadiumId=" + stadiumId + ", zipCode1=" + zipCode1
				+ ", zipCode2=" + zipCode2 + ", adress=" + adress + ", ddd=" + ddd + ", tel=" + tel + ", fax=" + fax
				+ ", homepate=" + homepate + ", owner=" + owner + "]";
	}
	                                                                                            

}
