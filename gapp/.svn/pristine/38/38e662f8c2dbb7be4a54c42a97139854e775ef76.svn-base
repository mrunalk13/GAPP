package gapp.model;

import java.io.Serializable;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="status")
public class Status implements Serializable {

		private static final long serialVersionUID = 1L;

		@Id
		@GeneratedValue
		private Integer status_id;
		private String status;
		
		@OneToMany(mappedBy="sts", cascade={CascadeType.PERSIST, CascadeType.MERGE})
		private List<StatusLog> sts;
		
		@OneToMany(mappedBy="status", cascade={CascadeType.PERSIST, CascadeType.MERGE})
		private List<Applications> application;
		
		public Status()
		{
			
		}

		public Integer getStatus_id() {
			return status_id;
		}

		public void setStatus_id(Integer status_id) {
			this.status_id = status_id;
		}

		public String getStatus() {
			return status;
		}

		public void setStatus(String status) {
			this.status = status;
		}

		public List<StatusLog> getSts() {
			return sts;
		}

		public void setSts(List<StatusLog> sts) {
			this.sts = sts;
		}

		

				
		
		
}
