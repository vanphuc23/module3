package service;

import model.Customer;
import repository.CustomerRepository;
import repository.ICustomerRepository;

import java.util.List;

public class CustomerService implements ICustomerService{
    private final ICustomerRepository iCustomerRepository = new CustomerRepository();
    @Override
    public List<Customer> display() {
        return iCustomerRepository.display();
    }

    @Override
    public void createCustomer(Customer customer) {
        iCustomerRepository.createCustomer(customer);
    }

    @Override
    public boolean checkPhoneExist(String phone) {
        return iCustomerRepository.checkPhoneExist(phone);
    }
}
