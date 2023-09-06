package Service;

import Model.Household;
import Model.Member;

import java.util.List;
import java.util.Map;

public interface IHouseholdService {
    List<Household> display();
    Household editHousehold(int id);
    Map<String, String> updateHousehold(Household household);
}
