package review.model;

import java.util.Date;

public class Review {
	
	private int reno;
	private String name;
	private String repw;
	private Date redate;
	private String recontent;
	private int resatis;
	
	public int getReno() {
		return reno;
	}

	public void setReno(int reno) {
		this.reno = reno;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getRepw() {
		return repw;
	}

	public void setRepw(String repw) {
		this.repw = repw;
	}

	public Date getRedate() {
		return redate;
	}

	public void setRedate(Date redate) {
		this.redate = redate;
	}

	public String getRecontent() {
		return recontent;
	}

	public void setRecontent(String recontent) {
		this.recontent = recontent;
	}

	public int getResatis() {
		return resatis;
	}

	public void setResatis(int resatis) {
		this.resatis = resatis;
	}

	
	public boolean hasPassword() {
		return repw != null && !repw.isEmpty();
	}
	
	public boolean hasName() {
		return name != null && !name.isEmpty();
	}
	
	public boolean matchPassword() {
		return repw != null && repw.equals(repw);
	}
	
	public boolean matchName() {
		return name != null && name.equals(name);
	}
	
}
