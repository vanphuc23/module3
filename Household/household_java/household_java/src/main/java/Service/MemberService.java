package Service;

import Model.Member;
import Repository.IMemberRepository;
import Repository.MemberRepository;

import java.util.List;

public class MemberService implements IMemberService{
    private IMemberRepository iMemberRepository = new MemberRepository();

    @Override
    public List<Member> findAll(int id) {
        return iMemberRepository.findAll(id);
    }
}
