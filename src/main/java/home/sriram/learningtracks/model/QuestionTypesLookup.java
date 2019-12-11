package home.sriram.learningtracks.model;

import java.io.Serializable;
import javax.persistence.*;
import java.sql.Timestamp;
import java.util.List;


/**
 * The persistent class for the question_types_lookup database table.
 * 
 */
@Entity
@Table(name="question_types_lookup")
@NamedQuery(name="QuestionTypesLookup.findAll", query="SELECT q FROM QuestionTypesLookup q")
public class QuestionTypesLookup implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(unique=true, nullable=false)
	private int id;

	@Column(name="created_on", nullable=false)
	private Timestamp createdOn;

	@Column(length=255)
	private String description;

	@Column(nullable=false, length=255)
	private String type;

	@Column(name="updated_on", nullable=false)
	private Timestamp updatedOn;

	//bi-directional many-to-one association to Question
	@OneToMany(mappedBy="questionTypesLookup", fetch=FetchType.EAGER)
	private List<Question> questions;

	public QuestionTypesLookup() {
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

	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getType() {
		return this.type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public Timestamp getUpdatedOn() {
		return this.updatedOn;
	}

	public void setUpdatedOn(Timestamp updatedOn) {
		this.updatedOn = updatedOn;
	}

	public List<Question> getQuestions() {
		return this.questions;
	}

	public void setQuestions(List<Question> questions) {
		this.questions = questions;
	}

	public Question addQuestion(Question question) {
		getQuestions().add(question);
		question.setQuestionTypesLookup(this);

		return question;
	}

	public Question removeQuestion(Question question) {
		getQuestions().remove(question);
		question.setQuestionTypesLookup(null);

		return question;
	}

}