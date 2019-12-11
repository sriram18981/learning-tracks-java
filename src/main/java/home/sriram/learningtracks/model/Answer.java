package home.sriram.learningtracks.model;

import java.io.Serializable;
import javax.persistence.*;
import java.sql.Timestamp;
import java.util.List;


/**
 * The persistent class for the answers database table.
 * 
 */
@Entity
@Table(name="answers")
@NamedQuery(name="Answer.findAll", query="SELECT a FROM Answer a")
public class Answer implements Serializable {
	private static final long serialVersionUID = 1L;

	@EmbeddedId
	private AnswerPK id;

	@Column(nullable=false, length=255)
	private String answer;

	@Column(name="client_id", length=255)
	private String clientId;

	@Column(name="created_on", nullable=false)
	private Timestamp createdOn;

	@Column(name="effective_till")
	private Timestamp effectiveTill;

	@Column(length=255)
	private String keywords;

	private byte mutex;

	@Column(length=255)
	private String reportingKey;

	@Column(length=255)
	private String status;

	@Column(name="updated_on", nullable=false)
	private Timestamp updatedOn;

	//bi-directional many-to-many association to AnswerGroup
	@ManyToMany(mappedBy="answers", fetch=FetchType.EAGER)
	private List<AnswerGroup> answerGroups;

	public Answer() {
	}

	public AnswerPK getId() {
		return this.id;
	}

	public void setId(AnswerPK id) {
		this.id = id;
	}

	public String getAnswer() {
		return this.answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
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

	public byte getMutex() {
		return this.mutex;
	}

	public void setMutex(byte mutex) {
		this.mutex = mutex;
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

	public List<AnswerGroup> getAnswerGroups() {
		return this.answerGroups;
	}

	public void setAnswerGroups(List<AnswerGroup> answerGroups) {
		this.answerGroups = answerGroups;
	}

}