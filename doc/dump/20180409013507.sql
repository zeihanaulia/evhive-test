/*
PostgreSQL Backup
Database: evhivecart/public
Backup Time: 2018-04-09 01:35:08
*/

DROP TABLE IF EXISTS "public"."carts";
DROP TABLE IF EXISTS "public"."products";
DROP TABLE IF EXISTS "public"."users";
CREATE TABLE "public"."carts" (
  "id" varchar(36) COLLATE "pg_catalog"."default" NOT NULL,
  "product_id" varchar(36) COLLATE "pg_catalog"."default",
  "customer_id" varchar(36) COLLATE "pg_catalog"."default",
  "qty" int2
)
;ALTER TABLE "public"."carts" OWNER TO "postgres";
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
ALTER TABLE "public"."products" ADD CONSTRAINT "products_pkey" PRIMARY KEY ("id");
ALTER TABLE "public"."users" ADD CONSTRAINT "users_pkey" PRIMARY KEY ("id");
ALTER TABLE "public"."carts" ADD CONSTRAINT "fk1_cart_product" FOREIGN KEY ("product_id") REFERENCES "public"."products" ("id") ON DELETE RESTRICT ON UPDATE CASCADE;
