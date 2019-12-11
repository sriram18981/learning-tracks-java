package home.sriram.learningtracks.model;

import java.io.Serializable;
import javax.persistence.*;
import java.sql.Timestamp;
import java.util.List;


/**
 * The persistent class for the assignments database table.
 * 
 */
@Entity
@Table(name="assignments")
@NamedQuery(name="Assignment.findAll", query="SELECT a FROM Assignment a")
public class Assignment implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(unique=true, nullable=false)
	private int id;

	@Column(name="assessment_id", nullable=false)
	private int assessmentId;

	@Column(name="created_on", nullable=false)
	private Timestamp createdOn;

	@Column(name="journey_id", length=255)
	private String journeyId;

	@Column(name="updated_on", nullable=false)
	private Timestamp updatedOn;

	//bi-directional many-to-one association to AssignmentAnswer
	@OneToMany(mappedBy="assignment", fetch=FetchType.EAGER)
	private List<AssignmentAnswer> assignmentAnswers;

	//bi-directional many-to-one association to Member
	@ManyToOne
	@JoinColumn(name="member_id", nullable=false)
	private Member member;

	public Assignment() {
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getAssessmentId() {
		return this.assessmentId;
	}

	public void setAssessmentId(int assessmentId) {
		this.assessmentId = assessmentId;
	}

	public Timestamp getCreatedOn() {
		return this.createdOn;
	}

	public void setCreatedOn(Timestamp createdOn) {
		this.createdOn = createdOn;
	}

	public String getJourneyId() {
		return this.journeyId;
	}

	public void setJourneyId(String journeyId) {
		this.journeyId = journeyId;
	}

	public Timestamp getUpdatedOn() {
		return this.updatedOn;
	}

	public void setUpdatedOn(Timestamp updatedOn) {
		this.updatedOn = updatedOn;
	}

	public List<AssignmentAnswer> getAssignmentAnswers() {
		return this.assignmentAnswers;
	}

	public void setAssignmentAnswers(List<AssignmentAnswer> assignmentAnswers) {
		this.assignmentAnswers = assignmentAnswers;
	}

	public AssignmentAnswer addAssignmentAnswer(AssignmentAnswer assignmentAnswer) {
		getAssignmentAnswers().add(assignmentAnswer);
		assignmentAnswer.setAssignment(this);

		return assignmentAnswer;
	}

	public AssignmentAnswer removeAssignmentAnswer(AssignmentAnswer assignmentAnswer) {
		getAssignmentAnswers().remove(assignmentAnswer);
		assignmentAnswer.setAssignment(null);

		return assignmentAnswer;
	}

	public Member getMember() {
		return this.member;
	}

	public void setMember(Member member) {
		this.member = member;
	}

}