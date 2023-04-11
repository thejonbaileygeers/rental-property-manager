BEGIN TRANSACTION;

INSERT INTO users (username,password_hash,role,phone,first_name,last_name,type) VALUES ('user1','user1','ROLE_USER', '555-555-5555', 'Jon', 'Geers', 'tenant');
INSERT INTO users (username,password_hash,role,phone,first_name,last_name,type) VALUES ('user2','user2','ROLE_USER', '555-555-5556', 'Chris', 'Jackson', 'tenant');
INSERT INTO users (username,password_hash,role,phone,first_name,last_name,type) VALUES ('user3','user3','ROLE_USER', '555-555-5557', 'Luis', 'Manzo', 'tenant');

COMMIT TRANSACTION;
