package gapp.model;

import java.io.Serializable;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;


@Entity
@Table(name = "programs")
public class Programs implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue
	private Integer program_id;	
	private String name;
	
	@ManyToOne(cascade={CascadeType.PERSIST, CascadeType.MERGE})
	private Departments dept;

	@OneToMany(mappedBy="program", cascade={CascadeType.PERSIST, CascadeType.MERGE})
	private List<Applications> application;
	
	public Programs()
	{
		
	}

	public Integer getProgram_id() {
		return program_id;
	}

	public void setProgram_id(Integer program_id) {
		this.program_id = program_id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Departments getDept() {
		return dept;
	}

	public void setDept(Departments dept) {
		this.dept = dept;
	}

	public List<Applications> getApplication() {
		return application;
	}

	public void setApplication(List<Applications> application) {
		this.application = application;
	}	
	
}