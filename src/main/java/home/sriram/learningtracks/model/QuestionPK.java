package home.sriram.learningtracks.model;

import java.io.Serializable;
import javax.persistence.*;

/**
 * The primary key class for the questions database table.
 * 
 */
@Embeddable
public class QuestionPK implements Serializable {
	//default serial version id, required for serializable classes.
	private static final long serialVersionUID = 1L;

	@Column(unique=true, nullable=false)
	private int id;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="effective_from", unique=true, nullable=false)
	private java.util.Date effectiveFrom;

	public QuestionPK() {
	}
	public int getId() {
		return this.id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public java.util.Date getEffectiveFrom() {
		return this.effectiveFrom;
	}
	public void setEffectiveFrom(java.util.Date effectiveFrom) {
		this.effectiveFrom = effectiveFrom;
	}

	public boolean equals(Object other) {
		if (this == other) {
			return true;
		}
		if (!(other instanceof QuestionPK)) {
			return false;
		}
		QuestionPK castOther = (QuestionPK)other;
		return 
			(this.id == castOther.id)
			&& this.effectiveFrom.equals(castOther.effectiveFrom);
	}

	public int hashCode() {
		final int prime = 31;
		int hash = 17;
		hash = hash * prime + this.id;
		hash = hash * prime + this.effectiveFrom.hashCode();
		
		return hash;
	}
}