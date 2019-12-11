package home.sriram.learningtracks.model;

import java.io.Serializable;
import javax.persistence.*;
import java.sql.Timestamp;
import java.util.List;


/**
 * The persistent class for the channels database table.
 * 
 */
@Entity
@Table(name="channels")
@NamedQuery(name="Channel.findAll", query="SELECT c FROM Channel c")
public class Channel implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(unique=true, nullable=false)
	private int id;

	@Column(name="created_on", nullable=false)
	private Timestamp createdOn;

	@Column(nullable=false, length=255)
	private String name;

	@Column(name="updated_on", nullable=false)
	private Timestamp updatedOn;

	@Column(name="version_number")
	private int versionNumber;

	//bi-directional many-to-one association to AssignmentAnswer
	@OneToMany(mappedBy="channel", fetch=FetchType.EAGER)
	private List<AssignmentAnswer> assignmentAnswers;

	public Channel() {
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Timestamp getCreatedOn() {
		return this.createdOn;
	}

	public void setCreatedOn(Timestamp createdOn) {
		this.createdOn = createdOn;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Timestamp getUpdatedOn() {
		return this.updatedOn;
	}

	public void setUpdatedOn(Timestamp updatedOn) {
		this.updatedOn = updatedOn;
	}

	public int getVersionNumber() {
		return this.versionNumber;
	}

	public void setVersionNumber(int versionNumber) {
		this.versionNumber = versionNumber;
	}

	public List<AssignmentAnswer> getAssignmentAnswers() {
		return this.assignmentAnswers;
	}

	public void setAssignmentAnswers(List<AssignmentAnswer> assignmentAnswers) {
		this.assignmentAnswers = assignmentAnswers;
	}

	public AssignmentAnswer addAssignmentAnswer(AssignmentAnswer assignmentAnswer) {
		getAssignmentAnswers().add(assignmentAnswer);
		assignmentAnswer.setChannel(this);

		return assignmentAnswer;
	}

	public AssignmentAnswer removeAssignmentAnswer(AssignmentAnswer assignmentAnswer) {
		getAssignmentAnswers().remove(assignmentAnswer);
		assignmentAnswer.setChannel(null);

		return assignmentAnswer;
	}

}