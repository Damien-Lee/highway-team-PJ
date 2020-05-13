package husik;

import java.util.Date;

public class member {
	private String id;
	private String name;
	private String password;
	private Date birthday;
	private String Gender;
	
	
	public void Member (String id, String name, String password, Date birthday, String Gender) {
		this.id=id;
		this.name=name;
		this.password=password;
		this.birthday= birthday;
		this.Gender=Gender;
	}


	public String getId() {
		return id;
	}


	public String getName() {
		return name;
	}


	public String getPassword() {
		return password;
	}


	public Date getBirthday() {
		return birthday;
	}


	public String getGender() {
		return Gender;
	}
	public boolean matchPassword(String pwd) {
		return password.equals(password);
	}
	
	
}
