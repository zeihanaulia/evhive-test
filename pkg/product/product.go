package product

import (
	"github.com/jmoiron/sqlx"
)

type Product struct {
	ID    string `json:"id"`
	Name  string `json:"name"`
	Price int    `json:"price"`
	Photo string `json:"photo"`
}

func (p *Product) get(db *sqlx.DB) error {
	return db.Get(p, "SELECT id, name, price FROM products WHERE id=$1", p.ID)
}

func (p *Product) update(db *sqlx.DB) error {
	_, err := db.Exec(
		"UPDATE products SET name=$1, email=$2 WHERE id=$3",
		p.Name, p.Price, p.ID,
	)
	return err
}

func (p *Product) delete(db *sqlx.DB) error {
	_, err := db.Exec("DELETE FROM products WHERE id=$1", p.ID)
	return err
}

func (p *Product) Create(db *sqlx.DB) error {
	return db.QueryRow(
		"INSERT INTO products(id, name, price, photo) VALUES($1, $2, $3, $4) RETURNING id",
		p.ID, p.Name, p.Price, p.Photo,
	).Scan(&p.ID)
}

func list(db *sqlx.DB, start, count int) ([]Product, error) {
	products := []Product{}
	err := db.Select(&products, "SELECT id, name, price, photo FROM products LIMIT $1 OFFSET $2", count, start)

	if err != nil {
		return nil, err
	}

	return products, nil
}
