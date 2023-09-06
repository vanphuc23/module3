package Model;

public class Member {
    private String name;
    private int household_id;

    public Member(String name, int household_id) {
        this.name = name;
        this.household_id = household_id;
    }

    public Member(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getHousehold_id() {
        return household_id;
    }

    public void setHousehold_id(int household_id) {
        this.household_id = household_id;
    }
}
