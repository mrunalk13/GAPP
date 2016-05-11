package gapp.model;

import java.io.Serializable;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "departments")
public class Departments implements Serializable{
   
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue
	private Integer dept_id;	
	private String name;
	
	@OneToMany(mappedBy="dept", cascade={CascadeType.PERSIST, CascadeType.MERGE})
	private List<Programs> programs;
	
	@OneToMany(mappedBy="dept", cascade={CascadeType.PERSIST, CascadeType.MERGE})
	private List<AdditionalField> additionalfield;
	
	@OneToMany(mappedBy="dept", cascade={CascadeType.PERSIST, CascadeType.MERGE})
	private List<Applications> applications;
	
	public Departments()
	{
		
	}

	public Integer getDept_id() {
		return dept_id;
	}

	public void setDept_id(Integer dept_id) {
		this.dept_id = dept_id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public List<Programs> getPrograms() {
		return programs;
	}

	public void setPrograms(List<Programs> programs) {
		this.programs = programs;
	}

	public List<AdditionalField> getAdditionalfield() {
		return additionalfield;
	}

	public void setAdditionalfield(List<AdditionalField> additionalfield) {
		this.additionalfield = additionalfield;
	}

	public List<Applications> getApplications() {
		return applications;
	}

	public void setApplications(List<Applications> applications) {
		this.applications = applications;
	}
			
}

 