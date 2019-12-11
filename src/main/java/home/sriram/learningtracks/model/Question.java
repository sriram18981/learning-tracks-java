package home.sriram.learningtracks.model;

import java.io.Serializable;
import javax.persistence.*;
import java.sql.Timestamp;
import java.util.List;


/**
 * The persistent class for the questions database table.
 * 
 */
@Entity
@Table(name="questions")
@NamedQuery(name="Question.findAll", query="SELECT q FROM Question q")
public class Question implements Serializable {
	private static final long serialVersionUID = 1L;

	@EmbeddedId
	private QuestionPK id;

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

	@Column(nullable=false, length=255)
	private String question;

	@Column(name="reporting_key", length=255)
	private String reportingKey;

	@Column(length=255)
	private String status;

	@Column(name="updated_on", nullable=false)
	private Timestamp updatedOn;

	//bi-directional many-to-many association to Assessment
	@ManyToMany(mappedBy="questions", fetch=FetchType.EAGER)
	private List<Assessment> assessments;

	//bi-directional many-to-one association to QuestionTypesLookup
	@ManyToOne
	@JoinColumn(name="question_type", nullable=false)
	private QuestionTypesLookup questionTypesLookup;

	//bi-directional many-to-many association to AnswerGroup
	@ManyToMany(fetch=FetchType.EAGER)
	@JoinTable(
		name="questions_answers"
		, joinColumns={
			@JoinColumn(name="effective_from", referencedColumnName="effective_from", nullable=false),
			@JoinColumn(name="question_id", referencedColumnName="id", nullable=false)
			}
		, inverseJoinColumns={
			@JoinColumn(name="answer_group_id", referencedColumnName="id")
			}
		)
	private List<AnswerGroup> answerGroups;

	public Question() {
	}

	public QuestionPK getId() {
		return this.id;
	}

	public void setId(QuestionPK id) {
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

	public String getQuestion() {
		return this.question;
	}

	public void setQuestion(String question) {
		this.question = question;
	}

	public String getReportingKey() {
		return this.reportingKey;
	}

	public void setReportingKey(String reportingKey) {
		this.reportingKey = reportingKey;
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

	public List<Assessment> getAssessments() {
		return this.assessments;
	}

	public void setAssessments(List<Assessment> assessments) {
		this.assessments = assessments;
	}

	public QuestionTypesLookup getQuestionTypesLookup() {
		return this.questionTypesLookup;
	}

	public void setQuestionTypesLookup(QuestionTypesLookup questionTypesLookup) {
		this.questionTypesLookup = questionTypesLookup;
	}

	public List<AnswerGroup> getAnswerGroups() {
		return this.answerGroups;
	}

	public void setAnswerGroups(List<AnswerGroup> answerGroups) {
		this.answerGroups = answerGroups;
	}

}