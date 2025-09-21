<%@ page import="model.Transaction, model.Client, model.Product" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Consumo - Cantina Pro</title>
    <link rel="stylesheet" href="css/styles.css">
    <%-- Estilos extras para formulários --%>
    <style>
        .form-card { margin-bottom: 25px; }
        .form-card form { display: flex; flex-wrap: wrap; gap: 15px; align-items: flex-end; }
        .form-group { display: flex; flex-direction: column; gap: 5px; flex-grow: 1; }
        .form-group label { font-size: 13px; font-weight: 600; color: #555; }
        .form-group input, .form-group select { border: 1px solid #ddd; padding: 8px 12px; border-radius: 6px; font-size: 14px; width: 100%;}
        .form-card button {
            background: linear-gradient(90deg, #de6d0a 0%, #f4a83d 100%);
            color: white; border: none; padding: 8px 20px; border-radius: 6px;
            font-weight: 600; font-size: 14px; cursor: pointer; transition: opacity 0.3s;
        }
        .form-card button:hover { opacity: 0.9; }
    </style>
</head>
<body>
    <%-- ======================= SIDEBAR (MENU LATERAL) ======================= --%>
    <aside>
        <div class="logo">
            <div class="logo-icon">C</div>
            <div class="logo-text">
                <h1>Cantina Pro</h1>
                <span>Sistema de Gestão</span>
            </div>
        </div>
        <nav>
            <a href="dashboard"><button>
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M4 13h6c.55 0 1-.45 1-1V4c0-.55-.45-1-1-1H4c-.55 0-1 .45-1 1v8c0 .55.45 1 1 1zm0 8h6c.55 0 1-.45 1-1v-4c0-.55-.45-1-1-1H4c-.55 0-1 .45-1 1v4c0 .55.45 1 1 1zm10 0h6c.55 0 1-.45 1-1v-8c0-.55-.45-1-1-1h-6c-.55 0-1 .45-1 1v8c0 .55.45 1 1 1zM13 4v4c0 .55.45 1 1 1h6c.55 0 1-.45 1-1V4c0-.55-.45-1-1-1h-6c-.55 0-1 .45-1 1z"></path></svg>
                Visão Geral
            </button></a>
            <a href="clients"><button>
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M12 12c2.21 0 4-1.79 4-4s-1.79-4-4-4-4 1.79-4 4 1.79 4 4 4zm0 2c-2.67 0-8 1.34-8 4v2h16v-2c0-2.66-5.33-4-8-4z"></path></svg>
                Clientes
            </button></a>
            <a href="products"><button>
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M20.54 5.23l-1.39-1.68C18.88 3.21 18.47 3 18 3H6c-.47 0-.88.21-1.16.55L3.46 5.23C3.17 5.57 3 6.02 3 6.5V19c0 1.1.9 2 2 2h14c1.1 0 2-.9 2-2V6.5c0-.48-.17-.93-.46-1.27zM6.24 5h11.52l.83 1H5.42l.82-1zM5 19V8h14v11H5z"></path></svg>
                Produtos
            </button></a>
            <a href="transactions"><button class="active">
                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" d="M3 7.5L7.5 3m0 0L12 7.5M7.5 3v13.5m13.5 0L16.5 21m0 0L12 16.5m4.5 4.5V7.5" /></svg>
                Consumo
            </button></a>
        </nav>
    </aside>

    <%-- ======================= MAIN CONTENT (CONTEÚDO PRINCIPAL) ======================= --%>
    <main>
        <h2>Registrar Consumo</h2>
        <p class="subtitle">Selecione o cliente, o produto e a quantidade para registrar uma nova venda.</p>

        <%-- Formulário de Registro --%>
        <div class="card form-card">
            <h3>Nova Transação</h3>
            <form method="post" action="transactions">
                <div class="form-group" style="min-width: 200px;">
                    <label for="clientId">Cliente</label>
                    <select id="clientId" name="clientId" required>
                        <% for(Client c : (List<Client>)request.getAttribute("clients")) { %>
                            <option value="<%= c.getId() %>"><%= c.getName() %></option>
                        <% } %>
                    </select>
                </div>
                <div class="form-group" style="min-width: 250px;">
                    <label for="productId">Produto</label>
                    <select id="productId" name="productId" required>
                        <% for(Product p : (List<Product>)request.getAttribute("products")) { %>
                            <option value="<%= p.getId() %>"><%= p.getName() %> (R$ <%= String.format("%.2f", p.getPrice()) %>)</option>
                        <% } %>
                    </select>
                </div>
                 <div class="form-group" style="max-width: 100px;">
                    <label for="quantity">Quantidade</label>
                    <input type="number" id="quantity" name="quantity" value="1" min="1" required>
                </div>
                <button type="submit">Registrar</button>
            </form>
        </div>

        <%-- Lista de Transações --%>
        <div class="card list-card">
            <h3>Histórico de Consumo</h3>
            <div class="transactions-list">
                <% List<Transaction> transactions = (List<Transaction>) request.getAttribute("transactions");
                   if (transactions != null && !transactions.isEmpty()) {
                       // O ideal é passar os objetos Client e Product já associados à transação no servlet
                       // para evitar esses loops aninhados no JSP.
                       List<Client> clients = (List<Client>)request.getAttribute("clients");
                       List<Product> products = (List<Product>)request.getAttribute("products");

                       for(Transaction t : transactions) {
                           Client c = clients.stream().filter(cl -> cl.getId() == t.getClientId()).findFirst().orElse(null);
                           Product p = products.stream().filter(pr -> pr.getId() == t.getProductId()).findFirst().orElse(null);
                %>
                <div class="transaction">
                    <div class="transaction-info">
                        <strong><%= c != null ? c.getName() : "Cliente não encontrado" %></strong>
                        <small><%= p != null ? p.getName() : "Produto não encontrado" %></small>
                    </div>
                    <div class="transaction-value">
                        R$ <%= String.format("%.2f", t.getTotal()) %>
                        <small><%= t.getQuantity() %>x</small>
                    </div>
                </div>
                <%     }
                   } else { %>
                    <p>Nenhuma transação registrada.</p>
                <% } %>
            </div>
        </div>
    </main>
</body>
</html>