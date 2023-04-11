BEGIN TRANSACTION;

INSERT INTO users (username,password_hash,role,phone,first_name,last_name,type) VALUES ('tenant','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER','(555)555-5555', 'Don', 'Julio', 'tenant');
INSERT INTO users (username,password_hash,role,phone,first_name,last_name,type) VALUES ('landlord','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER','(555)555-5555', 'Benjamin', 'Courtilou', 'landlord');
INSERT INTO users (username,password_hash,role,phone,first_name,last_name,type) VALUES ('maintenance','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER','(555)555-5555', 'Chaz', 'Michael-michaels', 'maintenance');
INSERT INTO users (username,password_hash,role,phone,first_name,last_name,type) VALUES ('admin','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_ADMIN', '(555)555-5555', 'Media', 'Fernando', 'admin');

COMMIT TRANSACTION;
