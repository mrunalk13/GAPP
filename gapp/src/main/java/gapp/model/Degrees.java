package gapp.model;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "degrees")
public class Degrees implements Serializable {

	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue
	private Integer degree_id;
	private String degree;
	private String college;
	private String time_period;
	private String major;
	private Float GPA;	
	private byte[] transcript;
	private String transcript_name;

	@ManyToOne(cascade = { CascadeType.PERSIST, CascadeType.MERGE })
	private Applications application;
	
	public Degrees()
	{
		
	}

	public Integer getDegree_id() {
		return degree_id;
	}

	public void setDegree_id(Integer degree_id) {
		this.degree_id = degree_id;
	}

	public String getDegree() {
		return degree;
	}

	public void setDegree(String degree) {
		this.degree = degree;
	}

	public String getCollege() {
		return college;
	}

	public void setCollege(String college) {
		this.college = college;
	}

	public String getTime_period() {
		return time_period;
	}

	public void setTime_period(String time_period) {
		this.time_period = time_period;
	}

	public String getMajor() {
		return major;
	}

	public void setMajor(String major) {
		this.major = major;
	}

	public Float getGPA() {
		return GPA;
	}

	public void setGPA(Float gPA) {
		GPA = gPA;
	}

	public Applications getApplication() {
		return application;
	}

	public void setApplication(Applications application) {
		this.application = application;
	}

	public byte[] getTranscript() {
		return transcript;
	}

	public void setTranscript(byte[] transcript) {
		this.transcript = transcript;
	}

	public String getTranscript_name() {
		return transcript_name;
	}

	public void setTranscript_name(String transcript_name) {
		this.transcript_name = transcript_name;
	}

	
}
