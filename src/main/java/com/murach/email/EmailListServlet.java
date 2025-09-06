package com.murach.email;

import com.murach.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.*;

public class EmailListServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        process(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        process(req, resp);
    }

    private void process(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 1) Lấy param
        String firstName = request.getParameter("firstName");
        String lastName  = request.getParameter("lastName");
        String email     = request.getParameter("email");

        // 2) Validate server-side
        Map<String,String> errors = new HashMap<>();
        if (email == null || email.isBlank()) {
            errors.put("email", "Bạn phải nhập Email.");
        } else if (!email.matches("^[^@\\s]+@[^@\\s]+\\.[^@\\s]+$")) {
            errors.put("email", "Email chưa đúng định dạng.");
        }
        if (firstName == null || firstName.isBlank()) {
            errors.put("firstName", "Bạn phải nhập First Name.");
        }
        if (lastName == null || lastName.isBlank()) {
            errors.put("lastName", "Bạn phải nhập Last Name.");
        }

        // 3) Nếu có lỗi -> quay lại index.jsp + seed 2 users để không rỗng
        if (!errors.isEmpty()) {
            request.setAttribute("errors", errors);

            HttpSession session = request.getSession();
            @SuppressWarnings("unchecked")
            List<User> users = (List<User>) session.getAttribute("users");
            if (users == null) {
                users = new ArrayList<>();
                users.add(new User("Alice", "Nguyen", "alice@example.com"));
                users.add(new User("Bob", "Tran",   "bob@example.com"));
                session.setAttribute("users", users);
            }

            getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
            return;
        }

        // 4) Không lỗi -> set user + date (request scope)
        User user = new User(firstName, lastName, email);
        request.setAttribute("user", user);
        request.setAttribute("currentDate", new Date());

        // 5) Quản lý list users (session scope) + append user mới
        HttpSession session = request.getSession();
        @SuppressWarnings("unchecked")
        List<User> users = (List<User>) session.getAttribute("users");
        if (users == null) {
            users = new ArrayList<>();
            users.add(new User("Alice", "Nguyen", "alice@example.com"));
            users.add(new User("Bob",   "Tran",   "bob@example.com"));
            session.setAttribute("users", users);
        }
        users.add(user);

        // 6) Tới thanks.jsp
        getServletContext().getRequestDispatcher("/thanks.jsp").forward(request, response);
    }
}
