package validation;

import service.CustomerService;
import service.ICustomerService;

public class ValidCustomer {
    private static ICustomerService customerService = new CustomerService();
    public static boolean PhoneExist(String phone){
        return customerService.checkPhoneExist(phone);
    }
}
