BEGIN TRANSACTION;
INSERT INTO users (username,password_hash,role,phone,first_name,last_name,type) VALUES ('tenant','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER','(555)555-5555', 'Don', 'Julio', 'tenant');
INSERT INTO users (username,password_hash,role,phone,first_name,last_name,type) VALUES ('landlord','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER','(555)555-5555', 'Benjamin', 'Courtilou', 'landlord');
INSERT INTO users (username,password_hash,role,phone,first_name,last_name,type) VALUES ('maintenance','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER','(555)555-5555', 'Chaz', 'Michael-michaels', 'maintenance');
INSERT INTO users (username,password_hash,role,phone,first_name,last_name,type) VALUES ('admin','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_ADMIN', '(555)555-5555', 'Media', 'Fernando', 'admin');

INSERT INTO users (username, password_hash, role, phone, first_name, last_name, type) VALUES ('eraffeorty0', 'z0BOuj', 'USER', '475-477-9617', 'Errick', 'Raffeorty', 'landlord');
INSERT INTO users (username, password_hash, role, phone, first_name, last_name, type) VALUES ('swaldera1', 'n6VjNr9gxuF', 'ADMIN', '836-841-4089', 'Sebastien', 'Waldera', 'landlord');
INSERT INTO users (username, password_hash, role, phone, first_name, last_name, type) VALUES ('pswynfen2', 'W2QDvai7d', 'ADMIN', '510-152-2276', 'Phil', 'Swynfen', 'worker');
INSERT INTO users (username, password_hash, role, phone, first_name, last_name, type) VALUES ('nbaldwin3', 'Q5gvoIxKT0', 'USER', '637-919-4060', 'Nanice', 'Baldwin', 'landlord');

INSERT INTO properties (name, street_address, unit, state, zip, bedrooms, bathrooms, square_footage, owner_id, description, img_url) VALUES ('Trevor', '837 Springview Court', 95, 'OR', '4', 72, 19, 3, 2, 'sollicitudin ut suscipit a feugiat et eros vestibulum ac est lacinia nisi venenatis tristique fusce congue', 'http://dummyimage.com/173x100.png/5fa2dd/ffffff');
INSERT INTO properties (name, street_address, unit, state, zip, bedrooms, bathrooms, square_footage, owner_id, description, img_url) VALUES ('Deck', '283 Sundown Center', 51, 'AR', '7', 60, 39, 2, 5, 'ipsum integer a nibh in quis justo maecenas rhoncus aliquam lacus morbi quis tortor id nulla ultrices aliquet', 'http://dummyimage.com/192x100.png/ff4444/ffffff');
INSERT INTO properties (name, street_address, unit, state, zip, bedrooms, bathrooms, square_footage, owner_id, description, img_url) VALUES ('Ashlin', '42 Maple Lane', 68, 'AL', '10', 57, 44, 3, 6, 'imperdiet et commodo vulputate', 'http://dummyimage.com/169x100.png/cc0000/ffffff');
INSERT INTO properties (name, street_address, unit, state, zip, bedrooms, bathrooms, square_footage, owner_id, description, img_url) VALUES ('Agnella', '2 Brickson Park Parkway', 64, 'VT', '6', 88, 8, 4, 8, 'curae donec pharetra magna vestibulum aliquet ultrices erat tortor sollicitudin mi sit amet lobortis sapien sapien non mi integer ac', 'http://dummyimage.com/210x100.png/cc0000/ffffff');

INSERT INTO leases (tenant_id, property_id, rent_amount, start_date, end_date) VALUES(1, 1, 500, '2023-01-01', '2023-06-01');
INSERT INTO leases (tenant_id, property_id, rent_amount, start_date, end_date) VALUES(2, 2, 1000, '2023-01-01', '2023-06-01');
INSERT INTO leases (tenant_id, property_id, rent_amount, start_date, end_date) VALUES(3, 3, 500, '2023-01-01', '2023-06-01');
INSERT INTO leases (tenant_id, property_id, rent_amount, start_date, end_date) VALUES(4, 4, 1000, '2023-01-01', '2023-06-01');


COMMIT TRANSACTION;
