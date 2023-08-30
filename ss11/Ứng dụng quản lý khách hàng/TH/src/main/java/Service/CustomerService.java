package Service;

import Model.Customer;

import java.util.ArrayList;
import java.util.List;

public class CustomerService implements ICustomerService{
    private static final List<Customer> listCustomer = new ArrayList<>();

    static {
        listCustomer.add( new Customer(1, "John", "john@codegym.vn", "Hanoi"));
        listCustomer.add( new Customer(2, "Bill", "bill@codegym.vn", "Danang"));
        listCustomer.add( new Customer(3, "Alex", "alex@codegym.vn", "Saigon"));
        listCustomer.add( new Customer(4, "Adam", "adam@codegym.vn", "Beijin"));
        listCustomer.add( new Customer(5, "Sophia", "sophia@codegym.vn", "Miami"));
        listCustomer.add( new Customer(6, "Rose", "rose@codegym.vn", "Newyork"));
    }

    @Override
    public List<Customer> findAll() {
        return listCustomer;
    }

    @Override
    public void save(Customer customer) {
        listCustomer.add(customer);
    }

    @Override
    public Customer findById(int id) {
        return null;
    }

    @Override
    public void update(int id, Customer customer) {

    }

    @Override
    public void remove(int id) {

    }
}
