package home.sriram.learningtracks.model;

import java.io.Serializable;
import javax.persistence.*;
import java.sql.Timestamp;
import java.util.List;


/**
 * The persistent class for the assessments database table.
 * 
 */
@Entity
@Table(name="assessments")
@NamedQuery(name="Assessment.findAll", query="SELECT a FROM Assessment a")
public class Assessment implements Serializable {
	private static final long serialVersionUID = 1L;

	@EmbeddedId
	private AssessmentPK id;

	@Column(name="client_id", length=255)
	private String clientId;

	@Column(name="created_on", nullable=false)
	private Timestamp createdOn;

	@Column(name="effective_till")
	private Timestamp effectiveTill;

	@Column(length=255)
	private String keywords;

	@Column(nullable=false, length=255)
	private String name;

	private byte skipTitleCard;

	@Column(length=255)
	private String status;

	@Column(name="updated_on", nullable=false)
	private Timestamp updatedOn;

	//bi-directional many-to-many association to Member
	@ManyToMany(fetch=FetchType.EAGER)
	@JoinTable(
		name="assignments"
		, joinColumns={
			@JoinColumn(name="assessment_id", referencedColumnName="id", nullable=false)
			}
		, inverseJoinColumns={
			@JoinColumn(name="member_id", nullable=false)
			}
		)
	private List<Member> members;

	//bi-directional many-to-many association to Question
	@ManyToMany(fetch=FetchType.EAGER)
	@JoinTable(
		name="assessment_questions"
		, joinColumns={
			@JoinColumn(name="assessment_id", referencedColumnName="id", nullable=false)
			}
		, inverseJoinColumns={
			@JoinColumn(name="question_id", referencedColumnName="id", nullable=false)
			}
		)
	private List<Question> questions;

	public Assessment() {
	}

	public AssessmentPK getId() {
		return this.id;
	}

	public void setId(AssessmentPK id) {
		this.id = id;
	}

	public String getClientId() {
		return this.clientId;
	}

	public void setClientId(String clientId) {
		this.clientId = clientId;
	}

	public Timestamp getCreatedOn() {
		return this.createdOn;
	}

	public void setCreatedOn(Timestamp createdOn) {
		this.createdOn = createdOn;
	}

	public Timestamp getEffectiveTill() {
		return this.effectiveTill;
	}

	public void setEffectiveTill(Timestamp effectiveTill) {
		this.effectiveTill = effectiveTill;
	}

	public String getKeywords() {
		return this.keywords;
	}

	public void setKeywords(String keywords) {
		this.keywords = keywords;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public byte getSkipTitleCard() {
		return this.skipTitleCard;
	}

	public void setSkipTitleCard(byte skipTitleCard) {
		this.skipTitleCard = skipTitleCard;
	}

	public String getStatus() {
		return this.status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Timestamp getUpdatedOn() {
		return this.updatedOn;
	}

	public void setUpdatedOn(Timestamp updatedOn) {
		this.updatedOn = updatedOn;
	}

	public List<Member> getMembers() {
		return this.members;
	}

	public void setMembers(List<Member> members) {
		this.members = members;
	}

	public List<Question> getQuestions() {
		return this.questions;
	}

	public void setQuestions(List<Question> questions) {
		this.questions = questions;
	}

}