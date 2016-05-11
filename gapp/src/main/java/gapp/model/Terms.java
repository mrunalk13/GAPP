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
@Table(name = "terms")
public class Terms implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue
	private Integer term_id;
	private String term;
	
	@OneToMany(mappedBy="term", cascade={CascadeType.PERSIST, CascadeType.MERGE})
	private List<Applications> application;
	
	public Terms()
	{
		
	}

	public Integer getTerm_id() {
		return term_id;
	}

	public void setTerm_id(Integer term_id) {
		this.term_id = term_id;
	}

	public String getTerm() {
		return term;
	}

	public void setTerm(String term) {
		this.term = term;
	}

	public List<Applications> getApplication() {
		return application;
	}

	public void setApplication(List<Applications> application) {
		this.application = application;
	}
	
}