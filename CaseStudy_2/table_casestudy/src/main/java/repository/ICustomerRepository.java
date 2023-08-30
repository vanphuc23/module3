package repository;

import model.Customer;

import java.util.List;

public interface ICustomerRepository {
    List<Customer> display();
    void createCustomer(Customer customer);

    boolean checkPhoneExist(String phone);
}
