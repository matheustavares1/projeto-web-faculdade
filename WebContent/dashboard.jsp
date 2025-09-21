<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%-- Importando as classes necessárias para o casting --%>
<%@ page import="java.util.List" %>
<%@ page import="model.Client" %>
<%@ page import="model.Product" %>
<%@ page import="model.Transaction" %>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard - Cantina Pro</title>
    <link rel="stylesheet" href="css/styles.css">
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
            <a href="dashboard"><button class="active">
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
            <a href="transactions"><button>
                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" d="M3 7.5L7.5 3m0 0L12 7.5M7.5 3v13.5m13.5 0L16.5 21m0 0L12 16.5m4.5 4.5V7.5" /></svg>
                Consumo
            </button></a>
        </nav>
    </aside>

    <%-- ======================= MAIN CONTENT (CONTEÚDO PRINCIPAL) ======================= --%>
    <main>
        <h2>Dashboard da Cantina</h2>
        <p class="subtitle">Gerencie clientes, produtos e vendas da sua cantina</p>

        <%-- Cards de Resumo --%>
        <div class="summary-cards">
            <div class="summary-card">
                <div class="summary-info">
                    <small>Clientes</small>
                    <strong>${clientCount}</strong>
                    <div class="pct-change">+12% vs mês anterior</div>
                </div>
                <div class="summary-icon">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M12 12c2.21 0 4-1.79 4-4s-1.79-4-4-4-4 1.79-4 4 1.79 4 4 4zm0 2c-2.67 0-8 1.34-8 4v2h16v-2c0-2.66-5.33-4-8-4z"></path></svg>
                </div>
            </div>
            <div class="summary-card">
                <div class="summary-info">
                    <small>Produtos</small>
                    <strong>${productCount}</strong>
                    <div class="pct-change">+5% vs mês anterior</div>
                </div>
                <div class="summary-icon">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M20.54 5.23l-1.39-1.68C18.88 3.21 18.47 3 18 3H6c-.47 0-.88.21-1.16.55L3.46 5.23C3.17 5.57 3 6.02 3 6.5V19c0 1.1.9 2 2 2h14c1.1 0 2-.9 2-2V6.5c0-.48-.17-.93-.46-1.27zM6.24 5h11.52l.83 1H5.42l.82-1zM5 19V8h14v11H5z"></path></svg>
                </div>
            </div>
            <div class="summary-card">
                <div class="summary-info">
                    <small>Vendas</small>
                    <strong>${transactionCount}</strong>
                    <div class="pct-change">+23% vs mês anterior</div>
                </div>
                <div class="summary-icon">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M11.8 10.9c-2.27-.59-3-1.2-3-2.15 0-1.09 1.01-1.85 2.7-1.85 1.78 0 2.44.85 2.5 2.1h2.21c-.07-1.72-1.12-3.3-3.21-3.81V3h-3v2.16c-1.94.42-3.5 1.68-3.5 3.61 0 2.31 1.91 3.46 4.7 4.13 2.5.6 3 1.48 3 2.41 0 .69-.49 1.79-2.7 1.79-2.06 0-2.87-.92-2.98-2.1h-2.2c.12 2.19 1.76 3.42 3.68 3.83V21h3v-2.15c2.11-.46 3.5-1.78 3.5-3.97 0-2.02-1.31-3.39-4.2-4.08z"></path></svg>
                </div>
            </div>
            <div class="summary-card">
                <div class="summary-info">
                    <small>Receita</small>
                    <strong>R$ ${String.format("%.2f", totalRevenue)}</strong>
                    <div class="pct-change">+18% vs mês anterior</div>
                </div>
                <div class="summary-icon">
                    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" d="M4.5 12.75l6 6 9-13.5" /></svg>
                </div>
            </div>
        </div>

        <%-- Seções de conteúdo --%>
        <div class="sections">
            <%-- Transações Recentes --%>
            <div class="card">
                <h3>
                    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" d="M3.75 12h16.5m-16.5 3.75h16.5M3.75 19.5h16.5M5.625 4.5h12.75a1.875 1.875 0 010 3.75H5.625a1.875 1.875 0 010-3.75z" /></svg>
                    Transações Recentes
                </h3>
                <div class="transactions-list">
                    <%-- Exemplo de como você preencheria com dados do servlet --%>
                    <%-- Supondo que você tenha uma lista 'recentTransactions' no request --%>
                    <%
                        // Mock de dados para exemplo. Substitua por request.getAttribute("recentTransactions")
                        List<Transaction> transactions = (List<Transaction>) request.getAttribute("transactions");
                        List<Client> clients = (List<Client>) request.getAttribute("clients");
                        List<Product> products = (List<Product>) request.getAttribute("products");

                        // Limita para mostrar apenas as 5 transações mais recentes, por exemplo
                        int count = 0;
                        if (transactions != null) {
                            for (int i = transactions.size() - 1; i >= 0 && count < 5; i--, count++) {
                                Transaction t = transactions.get(i);
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
                    <%
                            }
                        }
                    %>
                </div>
            </div>

            <%-- Melhores Clientes --%>
            <div class="card">
                <h3>
                    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" d="M16.5 18.75h-9a9.75 9.75 0 011.316-5.033A5.25 5.25 0 0112 10.5h0a5.25 5.25 0 014.184 2.217A9.75 9.75 0 0116.5 18.75z" /><path stroke-linecap="round" stroke-linejoin="round" d="M9 10.5a3 3 0 116 0 3 3 0 01-6 0z" /></svg>
                    Melhores Clientes
                </h3>
                 <div class="clients-list">
                     <%-- Exemplo de dados. O ideal é que o servlet envie uma lista ordenada --%>
                     <%
                        if (clients != null) {
                            // Simulando um ranking simples. O ideal é o backend fazer isso.
                            clients.sort((c1, c2) -> Double.compare(c2.getBalance(), c1.getBalance()));
                            int rank = 1;
                            for (Client c : clients) {
                                if(rank > 3) break; // Mostra apenas os top 3
                     %>
                    <div class="client-item">
                        <div class="client-info">
                            <div class="client-rank"><%= rank++ %></div>
                            <div class="client-text">
                                <strong><%= c.getName() %></strong>
                                <small>Saldo: R$ <%= String.format("%.2f", c.getBalance()) %></small>
                            </div>
                        </div>
                        <div class="client-value">
                           R$ 0.00 <small>gastos</small> <%-- Você precisaria calcular isso no backend --%>
                        </div>
                    </div>
                    <%
                            }
                        }
                     %>
                </div>
            </div>

            <%-- Estoque Baixo --%>
            <div class="card">
                 <h3>Estoque Baixo</h3>
                 <div class="low-stock">
                    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" d="M4.5 12.75l6 6 9-13.5" /></svg>
                    Nenhum produto com estoque baixo.
                </div>
            </div>

            <%-- Produtos Populares --%>
            <div class="card">
                <h3>Produtos Populares</h3>
                <div class="popular-list">
                    <%-- Exemplo estático --%>
                    <div class="popular-item">
                        <div class="popular-left">
                            <div class="popular-rank">1</div>
                            <div class="popular-info">
                                <strong>Sanduíche Natural</strong>
                                <small>Categoria: Lanches</small>
                            </div>
                        </div>
                        <div class="popular-right">
                            <span class="popular-sales">2 vendas</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>
</body>
</html>