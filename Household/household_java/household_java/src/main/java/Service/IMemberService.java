package Service;

import Model.Member;

import java.util.List;

public interface IMemberService {
    List<Member> findAll(int id);
}
