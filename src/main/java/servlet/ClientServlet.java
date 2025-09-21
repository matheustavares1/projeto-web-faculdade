package servlet;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;
import repo.Repository;

public class ClientServlet extends HttpServlet {
    private Repository repo = Repository.get();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("clients", repo.findAllClients());
        req.getRequestDispatcher("/clients.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        double balance = Double.parseDouble(req.getParameter("balance"));
        repo.addClient(name, balance);
        resp.sendRedirect(req.getContextPath() + "/clients");
    }
}
