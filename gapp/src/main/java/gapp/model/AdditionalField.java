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
@Table(name = "additionalField")
public class AdditionalField implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue
	private Integer field_id;
	private String name;
	private String type;
	private Boolean required;

	
	@ManyToOne(cascade = { CascadeType.PERSIST, CascadeType.MERGE })
	private Departments dept;

	@OneToMany(mappedBy = "field", cascade = { CascadeType.PERSIST, CascadeType.MERGE })
	private List<AdditionalFieldValue> af_value;
	
	public AdditionalField()
	{
		
	}

	public Integer getField_id() {
		return field_id;
	}

	public void setField_id(Integer field_id) {
		this.field_id = field_id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public Boolean getRequired() {
		return required;
	}

	public void setRequired(Boolean required) {
		this.required = required;
	}

	public Departments getDept() {
		return dept;
	}

	public void setDept(Departments dept) {
		this.dept = dept;
	}

	public List<AdditionalFieldValue> getAf_value() {
		return af_value;
	}

	public void setAf_value(List<AdditionalFieldValue> af_value) {
		this.af_value = af_value;
	}

}
