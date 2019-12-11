package home.sriram.learningtracks.repo;

import org.springframework.data.repository.CrudRepository;

import home.sriram.learningtracks.model.Assessment;
import home.sriram.learningtracks.model.AssessmentPK;

public interface AssessmentRepository extends CrudRepository<Assessment, AssessmentPK> {

}
