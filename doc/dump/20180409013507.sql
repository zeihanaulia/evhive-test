/*
PostgreSQL Backup
Database: evhivecart/public
Backup Time: 2018-04-09 02:03:42
*/

DROP TABLE IF EXISTS "public"."carts";
DROP TABLE IF EXISTS "public"."order_items";
DROP TABLE IF EXISTS "public"."orders";
DROP TABLE IF EXISTS "public"."products";
DROP TABLE IF EXISTS "public"."users";
CREATE TABLE "public"."carts" (
  "id" varchar(36) COLLATE "pg_catalog"."default" NOT NULL,
  "product_id" varchar(36) COLLATE "pg_catalog"."default",
  "customer_id" varchar(36) COLLATE "pg_catalog"."default",
  "qty" int2
)
;ALTER TABLE "public"."carts" OWNER TO "postgres";
CREATE TABLE "public"."order_items" (
  "id" varchar(36) COLLATE "pg_catalog"."default" NOT NULL,
  "order_id" varchar(36) COLLATE "pg_catalog"."default",
  "product_id" varchar(36) COLLATE "pg_catalog"."default",
  "price" int2,
  "qty" int2
)
;ALTER TABLE "public"."order_items" OWNER TO "postgres";
CREATE TABLE "public"."orders" (
  "id" varchar(36) COLLATE "pg_catalog"."default" NOT NULL,
  "customer_id" varchar(36) COLLATE "pg_catalog"."default",
  "status" varchar(30) COLLATE "pg_catalog"."default",
  "created_at" timestamp(6) DEFAULT now()
)
;ALTER TABLE "public"."orders" OWNER TO "postgres";
CREATE TABLE "public"."products" (
  "id" varchar(36) COLLATE "pg_catalog"."default" NOT NULL,
  "name" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "price" numeric(10,2) NOT NULL,
  "photo" varchar(500) COLLATE "pg_catalog"."default"
)
;ALTER TABLE "public"."products" OWNER TO "postgres";
CREATE TABLE "public"."users" (
  "id" varchar(36) COLLATE "pg_catalog"."default" NOT NULL,
  "name" varchar(255) COLLATE "pg_catalog"."default",
  "email" varchar(255) COLLATE "pg_catalog"."default",
  "password" text COLLATE "pg_catalog"."default"
)
;ALTER TABLE "public"."users" OWNER TO "postgres";
BEGIN;
LOCK TABLE "public"."carts" IN SHARE MODE;
DELETE FROM "public"."carts";
INSERT INTO "public"."carts" ("id","product_id","customer_id","qty") VALUES ('be9ad497-62b8-4911-937d-958e51c3c762', 'f1cb04b5-2358-49bd-99f0-68f27f94672e', '147b43d2-6df3-407e-9af0-4d4ff423185e', 1),('0ca44155-110b-4ff6-b579-3ba5f10b711b', '06688007-f810-462c-85cd-7253ccec3316', '147b43d2-6df3-407e-9af0-4d4ff423185e', 1);
COMMIT;
BEGIN;
LOCK TABLE "public"."order_items" IN SHARE MODE;
DELETE FROM "public"."order_items";
COMMIT;
BEGIN;
LOCK TABLE "public"."orders" IN SHARE MODE;
DELETE FROM "public"."orders";
COMMIT;
BEGIN;
LOCK TABLE "public"."products" IN SHARE MODE;
DELETE FROM "public"."products";
INSERT INTO "public"."products" ("id","name","price","photo") VALUES ('f1cb04b5-2358-49bd-99f0-68f27f94672e', 'Product A', 1000.00, '9520d0f66b06aaf32e2f54b3.png'),('06688007-f810-462c-85cd-7253ccec3316', 'Product B', 500.00, '9520d0f66b06aaf32e2f54b3.png');
COMMIT;
BEGIN;
LOCK TABLE "public"."users" IN SHARE MODE;
DELETE FROM "public"."users";
INSERT INTO "public"."users" ("id","name","email","password") VALUES ('147b43d2-6df3-407e-9af0-4d4ff423185e', 'Zeihan Aulia', 'zeihanaulia@gmail.com', '$2a$10$Uz9rvZH3TSBrY6huZjMeoOR7vT.JbjInSjCvm94JmmL85cF4vAwAu');
COMMIT;
ALTER TABLE "public"."carts" ADD CONSTRAINT "carts_pkey" PRIMARY KEY ("id");
ALTER TABLE "public"."order_items" ADD CONSTRAINT "order_items_pkey" PRIMARY KEY ("id");
ALTER TABLE "public"."orders" ADD CONSTRAINT "orders_pkey" PRIMARY KEY ("id");
ALTER TABLE "public"."products" ADD CONSTRAINT "products_pkey" PRIMARY KEY ("id");
ALTER TABLE "public"."users" ADD CONSTRAINT "users_pkey" PRIMARY KEY ("id");
ALTER TABLE "public"."carts" ADD CONSTRAINT "fk1_cart_product" FOREIGN KEY ("product_id") REFERENCES "public"."products" ("id") ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE "public"."order_items" ADD CONSTRAINT "fk1_order_items_order" FOREIGN KEY ("order_id") REFERENCES "public"."orders" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "public"."order_items" ADD CONSTRAINT "fk2_order_items_product" FOREIGN KEY ("product_id") REFERENCES "public"."products" ("id") ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE "public"."orders" ADD CONSTRAINT "fk1_orders_customers" FOREIGN KEY ("customer_id") REFERENCES "public"."users" ("id") ON DELETE RESTRICT ON UPDATE CASCADE;
