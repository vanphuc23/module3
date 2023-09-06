package Repository;

import Model.Member;

import java.util.List;

public interface IMemberRepository {
    List<Member> findAll(int id);
}
