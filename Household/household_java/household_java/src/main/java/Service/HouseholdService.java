package Service;

import Model.Household;
import Model.Member;
import Repository.HouseholdRepository;
import Repository.IHouseholdRepository;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Pattern;

public class HouseholdService implements IHouseholdService {
    private IHouseholdRepository iHouseholdRepository = new HouseholdRepository();

    @Override
    public List<Household> display() {
        return iHouseholdRepository.display();
    }

    @Override
    public Household editHousehold(int id) {
        return iHouseholdRepository.editHousehold(id);
    }

    @Override
    public Map<String, String> updateHousehold(Household household) {
        Map<String, String> map = new HashMap<>();
        if (household.getHousehold_name().isEmpty()) {
            map.put("name", "Tên không được để trống");
        } else if (!household.getHousehold_name().matches("^[\\p{L}\\p{M} ]*")) {
            map.put("name", "Tên không được chứa ký tự số hoặc ký tự đặc biệt");
        }
        if (map.isEmpty()) {
            iHouseholdRepository.updateHousehold(household);
        }
        return map;
    }
}
