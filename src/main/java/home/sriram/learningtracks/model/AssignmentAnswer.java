package home.sriram.learningtracks.model;

import java.io.Serializable;
import javax.persistence.*;
import java.sql.Timestamp;


/**
 * The persistent class for the assignment_answers database table.
 * 
 */
@Entity
@Table(name="assignment_answers")
@NamedQuery(name="AssignmentAnswer.findAll", query="SELECT a FROM AssignmentAnswer a")
public class AssignmentAnswer implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(unique=true, nullable=false)
	private int id;

	@Column(name="answer_id")
	private int answerId;

	@Column(name="answer_text", length=255)
	private String answerText;

	@Column(name="answered_on", nullable=false)
	private Timestamp answeredOn;

	@Column(nullable=false)
	private Timestamp answeredVersionDt;

	@Column(name="content_language", length=255)
	private String contentLanguage;

	@Column(name="journey_id", length=255)
	private String journeyId;

	@Column(name="question_id", nullable=false)
	private int questionId;

	//bi-directional many-to-one association to Assignment
	@ManyToOne
	@JoinColumn(name="assignment_id", nullable=false)
	private Assignment assignment;

	//bi-directional many-to-one association to Channel
	@ManyToOne
	@JoinColumn(name="channel_id")
	private Channel channel;

	public AssignmentAnswer() {
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getAnswerId() {
		return this.answerId;
	}

	public void setAnswerId(int answerId) {
		this.answerId = answerId;
	}

	public String getAnswerText() {
		return this.answerText;
	}

	public void setAnswerText(String answerText) {
		this.answerText = answerText;
	}

	public Timestamp getAnsweredOn() {
		return this.answeredOn;
	}

	public void setAnsweredOn(Timestamp answeredOn) {
		this.answeredOn = answeredOn;
	}

	public Timestamp getAnsweredVersionDt() {
		return this.answeredVersionDt;
	}

	public void setAnsweredVersionDt(Timestamp answeredVersionDt) {
		this.answeredVersionDt = answeredVersionDt;
	}

	public String getContentLanguage() {
		return this.contentLanguage;
	}

	public void setContentLanguage(String contentLanguage) {
		this.contentLanguage = contentLanguage;
	}

	public String getJourneyId() {
		return this.journeyId;
	}

	public void setJourneyId(String journeyId) {
		this.journeyId = journeyId;
	}

	public int getQuestionId() {
		return this.questionId;
	}

	public void setQuestionId(int questionId) {
		this.questionId = questionId;
	}

	public Assignment getAssignment() {
		return this.assignment;
	}

	public void setAssignment(Assignment assignment) {
		this.assignment = assignment;
	}

	public Channel getChannel() {
		return this.channel;
	}

	public void setChannel(Channel channel) {
		this.channel = channel;
	}

}