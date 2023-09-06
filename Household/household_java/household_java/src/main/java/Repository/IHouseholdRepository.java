package Repository;

import Model.Household;
import Model.Member;

import java.util.List;

public interface IHouseholdRepository {
    List<Household> display();
    Household editHousehold(int id);
    void updateHousehold(Household household);
}
