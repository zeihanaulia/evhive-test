package invoice

import "time"

type Invoice struct {
	ID          string    `json:"invoice"`
	OrderID     string    `json:"order_id"`
	Status      string    `json:"status"`
	DueDate     time.Time `json:"due_date"`
	PaymentDate time.Time `json:"payment_date"`
}
