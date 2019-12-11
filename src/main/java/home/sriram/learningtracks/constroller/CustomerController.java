package home.sriram.learningtracks.constroller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import home.sriram.learningtracks.entity.Customer;
import home.sriram.learningtracks.repo.CustomerRepository;

@RestController
@RequestMapping(path = "/customer")
public class CustomerController {

	@Autowired
	CustomerRepository customerRepo;

	@PostMapping
	public Customer addCustomer(@RequestBody Customer customer) {
		return customerRepo.save(customer);
	}

	@GetMapping
	public Iterable<Customer> getCustomers() {
		return customerRepo.findAll();
	}

}
