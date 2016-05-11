package gapp.model;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "applications")
public class Applications implements Serializable {

	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue	
	private Integer application_id;   	
	private Integer cin;		
	private String gender;	
	private Date dob;	
	private String citizenship;
    private Integer toefl;	
	private String first_name;
	private String last_name;
	private String email;
	private Date submitted_date;
	
	
	@ManyToOne(cascade={CascadeType.PERSIST, CascadeType.MERGE})
	private Gappusers user;	
	
	@ManyToOne(cascade={CascadeType.PERSIST, CascadeType.MERGE})
	private Departments dept;	
	
	@ManyToOne(cascade={CascadeType.PERSIST, CascadeType.MERGE})
	private Terms term;
	
	@OneToMany(mappedBy="application", cascade={CascadeType.PERSIST, CascadeType.MERGE})
	private List<Degrees> degree;
		
	@OneToMany(mappedBy="application", cascade={CascadeType.PERSIST, CascadeType.MERGE})
	private List<StatusLog> statusLog;
	
	@OneToMany(mappedBy="application", cascade={CascadeType.PERSIST, CascadeType.MERGE})
	private List<AdditionalFieldValue> af_value;
	
	@ManyToOne(cascade={CascadeType.PERSIST, CascadeType.MERGE})
	private Programs program;
	
	@ManyToOne(cascade={CascadeType.PERSIST, CascadeType.MERGE})
	private Status status;
	
	
	public Applications()
	{
		
	}

	public Integer getApplication_id() {
		return application_id;
	}

	public void setApplication_id(Integer application_id) {
		this.application_id = application_id;
	}

	public Integer getCin() {
		return cin;
	}

	public void setCin(Integer cin) {
		this.cin = cin;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public Date getDob() {
		return dob;
	}

	public void setDob(Date dob) {
		this.dob = dob;
	}

	public String getCitizenship() {
		return citizenship;
	}

	public void setCitizenship(String citizenship) {
		this.citizenship = citizenship;
	}
	
	public Integer getToefl() {
		return toefl;
	}

	public void setToefl(Integer toefl) {
		this.toefl = toefl;
	}


	public Gappusers getUser() {
		return user;
	}

	public void setUser(Gappusers user) {
		this.user = user;
	}

	public Departments getDept() {
		return dept;
	}

	public void setDept(Departments dept) {
		this.dept = dept;
	}

	public Terms getTerm() {
		return term;
	}

	public void setTerm(Terms term) {
		this.term = term;
	}

	public List<Degrees> getDegree() {
		return degree;
	}

	public void setDegree(List<Degrees> degree) {
		this.degree = degree;
	}
	

	public List<StatusLog> getApplicationStatus() {
		return statusLog;
	}

	public void setApplicationStatus(List<StatusLog> applicationStatus) {
		this.statusLog = applicationStatus;
	}

	public List<AdditionalFieldValue> getAf_value() {
		return af_value;
	}

	public void setAf_value(List<AdditionalFieldValue> af_value) {
		this.af_value = af_value;
	}

	public Programs getProgram() {
		return program;
	}

	public void setProgram(Programs program) {
		this.program = program;
	}

	public List<StatusLog> getStatusLog() {
		return statusLog;
	}

	public void setStatusLog(List<StatusLog> statusLog) {
		this.statusLog = statusLog;
	}

	public Status getStatus() {
		return status;
	}

	public void setStatus(Status status) {
		this.status = status;
	}

	public String getFirst_name() {
		return first_name;
	}

	public void setFirst_name(String first_name) {
		this.first_name = first_name;
	}

	public String getLast_name() {
		return last_name;
	}

	public void setLast_name(String last_name) {
		this.last_name = last_name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Date getSubmitted_date() {
		return submitted_date;
	}

	public void setSubmitted_date(Date submitted_date) {
		this.submitted_date = submitted_date;
	}

		
	
	
	
}