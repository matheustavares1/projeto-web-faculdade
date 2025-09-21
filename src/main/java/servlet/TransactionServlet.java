package servlet;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;
import repo.Repository;

public class TransactionServlet extends HttpServlet {
    private Repository repo = Repository.get();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("clients", repo.findAllClients());
        req.setAttribute("products", repo.findAllProducts());
        req.setAttribute("transactions", repo.findAllTransactions());
        req.getRequestDispatcher("/transactions.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int clientId = Integer.parseInt(req.getParameter("clientId"));
        int productId = Integer.parseInt(req.getParameter("productId"));
        int quantity = Integer.parseInt(req.getParameter("quantity"));

        repo.addTransaction(clientId, productId, quantity);

        resp.sendRedirect(req.getContextPath() + "/transactions");
    }
}
