package Controller;

import Model.Household;
import Model.Member;
import Service.HouseholdService;
import Service.IHouseholdService;
import Service.IMemberService;
import Service.MemberService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDate;
import java.util.List;
import java.util.Map;

@WebServlet(name = "HouseholdServlet", value = "/households")

public class HouseholdServlet extends HttpServlet {
    private IHouseholdService iHouseholdService = new HouseholdService();
    private IMemberService iMemberService = new MemberService();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if(action == null) {
            action = "";
        }
        switch (action) {
            case "showEdit":
                showEdit(request, response);
                break;
            case "showMember":
                showMember(request, response);
                break;
            default:
                showListHousehold(request,response);
                break;
        }
    }

    private void showMember(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        List<Member> memberList = iMemberService.findAll(id);
        request.setAttribute("memberList", memberList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/households?action");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void showEdit(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Household household = iHouseholdService.editHousehold(id);
        request.setAttribute("household", household);
        RequestDispatcher dispatcher = request.getRequestDispatcher("edit.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void showListHousehold(HttpServletRequest request, HttpServletResponse response) {
        List<Household> list = iHouseholdService.display();
        request.setAttribute("list", list);
        RequestDispatcher dispatcher = request.getRequestDispatcher("list.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if(action == null) {
            action = "";
        }
        switch (action) {
            case "editHousehold":
                editHousehold(request, response);
                break;
        }
    }
    private void editHousehold(HttpServletRequest request, HttpServletResponse response) {
        int household_id = Integer.parseInt(request.getParameter("household_id"));
        String household_code = request.getParameter("household_code");
        String household_name = request.getParameter("household_name");
        int number = Integer.parseInt(request.getParameter("number"));
        LocalDate date = LocalDate.parse(request.getParameter("date"));
        String address = request.getParameter("address");
        Household household = new Household(household_id, household_code, household_name, number, address, date);
        Map<String, String> map = iHouseholdService.updateHousehold(household);
            try {
                if(map.isEmpty()) {
                    response.sendRedirect("/households?ms=1");
                } else {
                    request.setAttribute("household_name", household_name);
                    request.setAttribute("date", date);
                    request.setAttribute("address", address);
                    request.setAttribute("household", household);
                    request.setAttribute("map", map);
                    request.getRequestDispatcher("edit.jsp").forward(request, response);
                }
            } catch (IOException e) {
                throw new RuntimeException(e);
            } catch (ServletException e) {
                e.printStackTrace();
            }
    }
}
