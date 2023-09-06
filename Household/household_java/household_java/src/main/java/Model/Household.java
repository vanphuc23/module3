package Model;

import java.time.LocalDate;

public class Household {
    private int household_id;
    private String household_code;
    private String household_name;
    private int number;
    private String household_date;
    private String address;
    private LocalDate date;

    public Household(int household_id, String household_code, String household_name, int number, String household_date, String address) {
        this.household_id = household_id;
        this.household_code = household_code;
        this.household_name = household_name;
        this.number = number;
        this.household_date = household_date;
        this.address = address;
    }

    public Household(String household_code, String household_name, int number, String household_date, String address) {
        this.household_code = household_code;
        this.household_name = household_name;
        this.number = number;
        this.household_date = household_date;
        this.address = address;
    }

    public Household(int household_id, String household_code, String household_name, int number, String address, LocalDate date) {
        this.household_id = household_id;
        this.household_code = household_code;
        this.household_name = household_name;
        this.number = number;
        this.address = address;
        this.date = date;
    }

    public LocalDate getDate() {
        return date;
    }

    public void setDate(LocalDate date) {
        this.date = date;
    }

    public int getHousehold_id() {
        return household_id;
    }

    public void setHousehold_id(int household_id) {
        this.household_id = household_id;
    }

    public String getHousehold_code() {
        return household_code;
    }

    public void setHousehold_code(String household_code) {
        this.household_code = household_code;
    }

    public String getHousehold_name() {
        return household_name;
    }

    public void setHousehold_name(String household_name) {
        this.household_name = household_name;
    }

    public int getNumber() {
        return number;
    }

    public void setNumber(int number) {
        this.number = number;
    }

    public String getHousehold_date() {
        return household_date;
    }

    public void setHousehold_date(String household_date) {
        this.household_date = household_date;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }
}
