package home.sriram.learningtracks.constroller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import home.sriram.learningtracks.model.Assessment;
import home.sriram.learningtracks.repo.AssessmentRepository;

@RestController
@RequestMapping(path = "/assessment")
public class AssessmentController {
	
	@Autowired
	private AssessmentRepository assessmentRepo;
	
	@GetMapping
	private Iterable<Assessment> getAllAssessments(){
		return assessmentRepo.findAll();
	}

}
