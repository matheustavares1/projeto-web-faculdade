package model;


import java.time.LocalDateTime;

public class Transaction {
    private final int id;
    private final int clientId;
    private final int productId;
    private final int quantity;
    private final double total;
    private final LocalDateTime createdAt;

    public Transaction(int id, int clientId, int productId, int quantity, double total) {
        this.id = id;
        this.clientId = clientId;
        this.productId = productId;
        this.quantity = quantity;
        this.total = total;
        this.createdAt = LocalDateTime.now();
    }
    public int getId(){ return id; }
    public int getClientId(){ return clientId; }
    public int getProductId(){ return productId; }
    public int getQuantity(){ return quantity; }
    public double getTotal(){ return total; }
    public LocalDateTime getCreatedAt(){ return createdAt; }
}
