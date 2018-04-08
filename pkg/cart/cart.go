package cart

import (
	"github.com/jmoiron/sqlx"
)

type Cart struct {
	ID         string `json:"id"`
	ProductID  string `json:"product_id" db:"product_id"`
	CustomerID string `json:"customer_id" db:"customer_id"`
	Qty        int    `json:"qty"`
}

func (c *Cart) Add(db *sqlx.DB) error {
	return db.QueryRow(
		"INSERT INTO carts(id, product_id, customer_id, qty) VALUES($1, $2, $3, $4) RETURNING id",
		c.ID, c.ProductID, c.CustomerID, c.Qty,
	).Scan(&c.ID)
}

func (c *Cart) remove(db *sqlx.DB) error {
	_, err := db.Exec("DELETE FROM carts WHERE id=$1", c.ID)
	return err
}

func (c *Cart) updateQty(db *sqlx.DB) error {
	_, err := db.Exec(
		"UPDATE carts SET qty=$1 WHERE id=$2",
		c.Qty, c.ID,
	)
	return err
}

func ListCartByCustomer(db *sqlx.DB, customerID string, start, count int) ([]Cart, error) {
	carts := []Cart{}
	err := db.Select(&carts, "SELECT id, product_id, customer_id, qty FROM carts where customer_id=$1 LIMIT $2 OFFSET $3", customerID, count, start)

	if err != nil {
		return nil, err
	}

	return carts, nil
}
