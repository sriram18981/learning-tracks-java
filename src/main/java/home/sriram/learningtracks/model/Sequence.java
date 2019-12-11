package home.sriram.learningtracks.model;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the sequences database table.
 * 
 */
@Entity
@Table(name="sequences")
@NamedQuery(name="Sequence.findAll", query="SELECT s FROM Sequence s")
public class Sequence implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="seq_name", unique=true, nullable=false, length=255)
	private String seqName;

	@Column(nullable=false)
	private int id;

	public Sequence() {
	}

	public String getSeqName() {
		return this.seqName;
	}

	public void setSeqName(String seqName) {
		this.seqName = seqName;
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

}