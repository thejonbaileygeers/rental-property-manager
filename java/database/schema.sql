BEGIN TRANSACTION;

DROP TABLE IF EXISTS users;

CREATE TABLE users (
	user_id SERIAL,
	username varchar(50) NOT NULL UNIQUE,
	password_hash varchar(200) NOT NULL,
	role varchar(50) NOT NULL,
	phone varchar(50) NOT NULL,
	first_name varchar(50) NOT NULL,
	last_name varchar(50) NOT NULL,
	type varchar(12) NOT NULL,

	CONSTRAINT PK_user PRIMARY KEY (user_id)
    );

	CREATE TABLE properties (
	    property_id SERIAL,
	    name varchar(50) NOT NULL UNIQUE,
	    street_address varchar(50) NOT NULL,
	    unit numeric (10) NOT NULL,
	    state varchar(2) varchar(2),
	    zip numeric(10),
	    bedrooms numeric(10),
	    bathrooms numeric(10),
	    square_footage numeric(4000),
	    owner_id int NOT NULL,
	    description varchar(900),
	    image_url NVARCHAR(2083),
    );

    CREATE TABLE leases (
        lease_id SERIAL,
        tenant_id,
        property_id,
        rent_amount,
        start_date,
        end_date,

    );

COMMIT TRANSACTION;
