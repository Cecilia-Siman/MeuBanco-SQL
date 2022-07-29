CREATE TABLE customers (
	id serial NOT NULL PRIMARY KEY,
	"fullName" text NOT NULL,
	cpf varchar(11) NOT NULL UNIQUE,
	email text NOT NULL UNIQUE,
	password text NOT NULL
);

CREATE TABLE "bankAccount" (
	id serial NOT NULL PRIMARY KEY,
	"customerId" integer REFERENCES customers(id),
	"accountNumber" integer NOT NULL UNIQUE,
	agency integer NOT NULL,
	"openDate" timestamp NOT NULL DEFAULT NOW(),
	"closeDate" timestamp
);

CREATE TABLE transactions (
	id serial NOT NULL PRIMARY KEY,
	"bankAccountId" integer REFERENCES "bankAccount"(id),
	amount integer NOT NULL,
	type text NOT NULL,
	time timestamp NOT NULL DEFAULT NOW(),
	description text,
	cancelled bool
);

CREATE TABLE "creditCards" (
	id serial NOT NULL PRIMARY KEY,
	"bankAccountId" integer REFERENCES "bankAccount"(id),
	name text NOT NULL,
	"securityCode" integer NOT NULL,
	"expirationMonth" integer NOT NULL,
	"expirationYear" integer NOT NULL,
	password text NOT NULL,
	"limit" integer
);

CREATE TABLE "customerPhones" (
	id serial NOT NULL PRIMARY KEY,
	"customerId" integer REFERENCES customers(id),
	number varchar(11) NOT NULL,
	type text
);

CREATE TABLE states (
	id serial NOT NULL PRIMARY KEY,
	name text NOT NULL
);

CREATE TABLE cities (
	id serial NOT NULL PRIMARY KEY,
	name text NOT NULL,
	"stateId" integer REFERENCES states(id) 
);

CREATE TABLE "customerAdresses" (
	id serial NOT NULL PRIMARY KEY,
	"customerId" integer REFERENCES customers(id) UNIQUE,
	street text NOT NULL,
	number integer NOT NULL,
	complement text,
	"postalCode" integer NOT NULL,
	"cityId" integer REFERENCES cities(id)
);

