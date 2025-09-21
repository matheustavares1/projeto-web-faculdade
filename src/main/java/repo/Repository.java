package repo;


import model.Client;
import model.Product;
import model.Transaction;

import java.util.*;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.stream.Collectors;

public class Repository {
    private static final Repository INSTANCE = new Repository();
    private final AtomicInteger clientSeq = new AtomicInteger(1);
    private final AtomicInteger productSeq = new AtomicInteger(1);
    private final AtomicInteger trxSeq = new AtomicInteger(1);

    private final List<Client> clients = new ArrayList<>();
    private final List<Product> products = new ArrayList<>();
    private final List<Transaction> transactions = new ArrayList<>();

    private Repository(){
        // dados iniciais
        clients.add(new Client(clientSeq.getAndIncrement(), "João Silva", 150.50));
        clients.add(new Client(clientSeq.getAndIncrement(), "Maria Santos", 89.30));
        clients.add(new Client(clientSeq.getAndIncrement(), "Pedro Costa", 200.00));

        products.add(new Product(productSeq.getAndIncrement(), "Sanduíche Natural", 8.50, 20));
        products.add(new Product(productSeq.getAndIncrement(), "Suco de Laranja", 5.00, 10));
    }

    public static Repository get(){ return INSTANCE; }

    // Clientes
    public List<Client> findAllClients(){ return Collections.unmodifiableList(clients); }
    public Client findClientById(int id){ return clients.stream().filter(c->c.getId()==id).findFirst().orElse(null); }
    public Client addClient(String name, double balance){
        Client c = new Client(clientSeq.getAndIncrement(), name, balance);
        clients.add(c);
        return c;
    }

    // Produtos
    public List<Product> findAllProducts(){ return Collections.unmodifiableList(products); }
    public Product findProductById(int id){ return products.stream().filter(p->p.getId()==id).findFirst().orElse(null); }
    public Product addProduct(String name, double price, int stock){
        Product p = new Product(productSeq.getAndIncrement(), name, price, stock);
        products.add(p);
        return p;
    }

    // Transações
    public List<Transaction> findAllTransactions(){ return Collections.unmodifiableList(transactions); }
    public Transaction addTransaction(int clientId, int productId, int quantity){
        Product p = findProductById(productId);
        Client c = findClientById(clientId);
        if(p==null || c==null) return null;
        double total = p.getPrice() * quantity;
        if(p.getStock() < quantity) return null; // sem estoque
        p.setStock(p.getStock() - quantity);
        c.setBalance(c.getBalance() - total);
        Transaction t = new Transaction(trxSeq.getAndIncrement(), clientId, productId, quantity, total);
        transactions.add(0, t); // insere no topo
        return t;
    }

    // métricas simples
    public long countClients(){ return clients.size(); }
    public long countProducts(){ return products.size(); }
    public long countTransactions(){ return transactions.size(); }
    public double totalRevenue(){ return transactions.stream().mapToDouble(Transaction::getTotal).sum(); }
    public List<Client> topClients(int limit){
        Map<Integer, Double> spending = new HashMap<>();
        for(Transaction t: transactions){
            spending.put(t.getClientId(), spending.getOrDefault(t.getClientId(), 0.0) + t.getTotal());
        }
        return spending.entrySet().stream()
                .sorted((a,b)->Double.compare(b.getValue(), a.getValue()))
                .limit(limit)
                .map(e->findClientById(e.getKey()))
                .collect(Collectors.toList());
    }
}
