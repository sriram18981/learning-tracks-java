package home.sriram.learningtracks.model;

import java.io.Serializable;
import javax.persistence.*;
import java.sql.Timestamp;
import java.util.List;


/**
 * The persistent class for the answer_groups database table.
 * 
 */
@Entity
@Table(name="answer_groups")
@NamedQuery(name="AnswerGroup.findAll", query="SELECT a FROM AnswerGroup a")
public class AnswerGroup implements Serializable {
	private static final long serialVersionUID = 1L;

	@EmbeddedId
	private AnswerGroupPK id;

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

	@Column(length=255)
	private String status;

	@Column(name="updated_on", nullable=false)
	private Timestamp updatedOn;

	//bi-directional many-to-many association to Answer
	@ManyToMany(fetch=FetchType.EAGER)
	@JoinTable(
		name="answer_group_answers"
		, joinColumns={
			@JoinColumn(name="answer_group_id", referencedColumnName="id", nullable=false)
			}
		, inverseJoinColumns={
			@JoinColumn(name="answer_id", referencedColumnName="id", nullable=false)
			}
		)
	private List<Answer> answers;

	//bi-directional many-to-many association to Question
	@ManyToMany(mappedBy="answerGroups", fetch=FetchType.EAGER)
	private List<Question> questions;

	public AnswerGroup() {
	}

	public AnswerGroupPK getId() {
		return this.id;
	}

	public void setId(AnswerGroupPK id) {
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

	public List<Answer> getAnswers() {
		return this.answers;
	}

	public void setAnswers(List<Answer> answers) {
		this.answers = answers;
	}

	public List<Question> getQuestions() {
		return this.questions;
	}

	public void setQuestions(List<Question> questions) {
		this.questions = questions;
	}

}