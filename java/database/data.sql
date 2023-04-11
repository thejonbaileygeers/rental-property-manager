BEGIN TRANSACTION;

INSERT INTO users (username,password_hash,role,phone,first_name,last_name,type) VALUES ('tenant','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER','(555)555-5555', 'Don', 'Julio', 'tenant');
INSERT INTO users (username,password_hash,role,phone,first_name,last_name,type) VALUES ('landlord','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER','(555)555-5555', 'Benjamin', 'Courtilou', 'landlord');
INSERT INTO users (username,password_hash,role,phone,first_name,last_name,type) VALUES ('maintenance','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER','(555)555-5555', 'Chaz', 'Michael-michaels', 'maintenance');
INSERT INTO users (username,password_hash,role,phone,first_name,last_name,type) VALUES ('admin','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_ADMIN', '(555)555-5555', 'Media', 'Fernando', 'admin');

INSERT INTO users (user_id, username, password_hash, role, phone, first_name, last_name, type) VALUES (10, 'eraffeorty0', 'z0BOuj', 'USER', '475-477-9617', 'Errick', 'Raffeorty', 'admin');
INSERT INTO users (user_id, username, password_hash, role, phone, first_name, last_name, type) VALUES (11, 'swaldera1', 'n6VjNr9gxuF', 'ADMIN', '836-841-4089', 'Sebastien', 'Waldera', 'admin');
INSERT INTO users (user_id, username, password_hash, role, phone, first_name, last_name, type) VALUES (12, 'pswynfen2', 'W2QDvai7d', 'ADMIN', '510-152-2276', 'Phil', 'Swynfen', 'worker');
INSERT INTO users (user_id, username, password_hash, role, phone, first_name, last_name, type) VALUES (13, 'nbaldwin3', 'Q5gvoIxKT0', 'USER', '637-919-4060', 'Nanice', 'Baldwin', 'landlord');

INSERT INTO properties (property_id, name, street_address, unit, state, zip, bedrooms, bathrooms, square_footage, owner_id, description, image_url) VALUES (1, 'Trevor', '837 Springview Court', 95, 'OR', 4, 72, 19, 3, 10, 'sollicitudin ut suscipit a feugiat et eros vestibulum ac est lacinia nisi venenatis tristique fusce congue', 'http://dummyimage.com/173x100.png/5fa2dd/ffffff');
INSERT INTO properties (property_id, name, street_address, unit, state, zip, bedrooms, bathrooms, square_footage, owner_id, description, image_url) VALUES (2, 'Deck', '283 Sundown Center', 51, 'AR', 7, 60, 39, 2, 11, 'ipsum integer a nibh in quis justo maecenas rhoncus aliquam lacus morbi quis tortor id nulla ultrices aliquet', 'http://dummyimage.com/192x100.png/ff4444/ffffff');
INSERT INTO properties (property_id, name, street_address, unit, state, zip, bedrooms, bathrooms, square_footage, owner_id, description, image_url) VALUES (3, 'Ashlin', '42 Maple Lane', 68, 'AL', 10, 57, 44, 3, 12, 'imperdiet et commodo vulputate', 'http://dummyimage.com/169x100.png/cc0000/ffffff');
INSERT INTO properties (property_id, name, street_address, unit, state, zip, bedrooms, bathrooms, square_footage, owner_id, description, image_url) VALUES (4, 'Agnella', '2 Brickson Park Parkway', 64, 'VT', 6, 88, 8, 4, 13, 'curae donec pharetra magna vestibulum aliquet ultrices erat tortor sollicitudin mi sit amet lobortis sapien sapien non mi integer ac', 'http://dummyimage.com/210x100.png/cc0000/ffffff');

COMMIT TRANSACTION;
