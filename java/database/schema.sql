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
	    state varchar(2),
	    zip numeric(10),
	    bedrooms numeric(10),
	    bathrooms numeric(10),
	    square_footage numeric(4),
	    owner_id int NOT NULL,
	    description TEXT,
	    image_url VARCHAR(2083),
		CONSTRAINT CHK_properties_state CHECK (UPPER(state) IN ('AK', 'AL', 'AR', 'AS', 'AZ', 'CA', 'CO', 'CT', 'DC', 'DE', 'FL', 'GA', 'GU', 'HI', 'IA', 'ID', 'IL', 'IN', 'KS', 'KY', 'LA', 'MA', 'MD', 'ME', 'MI', 'MN', 'MO', 'MP', 'MS', 'MT', 'NC', 'ND', 'NE', 'NH', 'NJ', 'NM', 'NV', 'NY', 'OH', 'OK', 'OR', 'PA', 'PR', 'RI', 'SC', 'SD', 'TN', 'TX', 'UM', 'UT', 'VA', 'VI', 'VT', 'WA', 'WI', 'WV', 'WY')),
		CONSTRAINT FK_properties_users_owner_id FOREIGN KEY (owner_id) REFERENCES users(user_id),
		CONSTRAINT PK_property_id PRIMARY KEY (property_id)
    );

    CREATE TABLE leases (
        lease_id SERIAL,
        tenant_id int UNIQUE NOT NULL,
        property_id int UNIQUE NOT NULL,
        rent_amount numeric(6),
        start_date date,
        end_date date,
		CONSTRAINT PK_leases_lease_id PRIMARY KEY (lease_id),
		CONSTRAINT FK_leases_users_tenant_id FOREIGN KEY (tenant_id) REFERENCES users(user_id),
		CONSTRAINT FK_leases_properties_property_id FOREIGN KEY (property_id) REFERENCES properties(property_id)
    );

COMMIT TRANSACTION;
