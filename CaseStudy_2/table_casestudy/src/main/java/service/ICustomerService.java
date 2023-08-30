package service;

import model.Customer;

import java.util.List;

public interface ICustomerService {
    List<Customer> display();
    void createCustomer(Customer customer);

    boolean checkPhoneExist(String phone);
}
