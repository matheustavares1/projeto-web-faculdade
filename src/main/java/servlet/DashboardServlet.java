package servlet;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;
import repo.Repository;

public class DashboardServlet extends HttpServlet {
    private Repository repo = Repository.get();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("clientCount", repo.countClients());
        req.setAttribute("productCount", repo.countProducts());
        req.setAttribute("transactionCount", repo.countTransactions());
        req.setAttribute("totalRevenue", repo.totalRevenue());
        req.getRequestDispatcher("/dashboard.jsp").forward(req, resp);
    }
}
