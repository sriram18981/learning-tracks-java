package home.sriram.learningtracks.repo;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import home.sriram.learningtracks.entity.Customer;

public interface CustomerRepository extends CrudRepository<Customer, Long> {

	List<Customer> findByLastName(String lastName);
	
	Customer findById(long id);
}
