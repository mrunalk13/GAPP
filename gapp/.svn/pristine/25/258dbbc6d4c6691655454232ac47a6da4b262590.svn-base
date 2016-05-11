package gapp.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "statusLog")
public class StatusLog implements Serializable {

	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue	
	private Integer id;		
	private Date date;
	private String comment;
	
	@ManyToOne(cascade={CascadeType.PERSIST, CascadeType.MERGE})
	private Applications application;
	
	@ManyToOne(cascade={CascadeType.PERSIST, CascadeType.MERGE})
	private Status sts;
	
	@ManyToOne(cascade={CascadeType.PERSIST, CascadeType.MERGE})
	private Gappusers user;
	
	
	public StatusLog()
	{
		
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Applications getApplication() {
		return application;
	}

	public void setApplication(Applications application) {
		this.application = application;
	}

    

	public Status getSts() {
		return sts;
	}

	public void setSts(Status sts) {
		this.sts = sts;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public Gappusers getUser() {
		return user;
	}

	public void setUser(Gappusers user) {
		this.user = user;
	}

	
}
