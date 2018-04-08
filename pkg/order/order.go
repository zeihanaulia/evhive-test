package order

type Order struct {
	ID         string `json:"id"`
	CustomerID string `json:"customer_id"`
	Status     string `json:"status"`
}

type OrderItem struct {
	ID          string `json:"id"`
	OrderID     string `json:"order_id"`
	OrderStatus string `json:"order_status"`
	ProductID   string `json:"product_id"`
	Price       int    `json:"price"`
	Qty         int    `json:"qty"`
}
