BEGIN TRANSACTION;
INSERT INTO users (username,password_hash,role,phone,first_name,last_name,type) VALUES ('tenant','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER','(555)555-5555', 'Don', 'Julio', 'tenant');
INSERT INTO users (username,password_hash,role,phone,first_name,last_name,type) VALUES ('landlord','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER','(555)555-5555', 'Benjamin', 'Courtilou', 'landlord');
INSERT INTO users (username,password_hash,role,phone,first_name,last_name,type) VALUES ('maintenance','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER','(555)555-5555', 'Chaz', 'Michael-michaels', 'maintenance');
INSERT INTO users (username,password_hash,role,phone,first_name,last_name,type) VALUES ('admin','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_ADMIN', '(555)555-5555', 'Media', 'Fernando', 'admin');

INSERT INTO users (username, password_hash, role, phone, first_name, last_name, type) VALUES ('eraffeorty0', 'z0BOuj', 'USER', '475-477-9617', 'Errick', 'Raffeorty', 'landlord');
INSERT INTO users (username, password_hash, role, phone, first_name, last_name, type) VALUES ('swaldera1', 'n6VjNr9gxuF', 'ADMIN', '836-841-4089', 'Sebastien', 'Waldera', 'landlord');
INSERT INTO users (username, password_hash, role, phone, first_name, last_name, type) VALUES ('pswynfen2', 'W2QDvai7d', 'ADMIN', '510-152-2276', 'Phil', 'Swynfen', 'worker');
INSERT INTO users (username, password_hash, role, phone, first_name, last_name, type) VALUES ('nbaldwin3', 'Q5gvoIxKT0', 'USER', '637-919-4060', 'Nanice', 'Baldwin', 'landlord');

INSERT INTO properties (name, street_address, unit, state, zip, bedrooms, bathrooms, square_footage, owner_id, description, img_url) VALUES ('Trevor''s Tower', '837 Springview Court', 95, 'OH', '45211', 3, 2, 3000, 2, '837 Springview Court is a beautiful apartment that offers an exceptional living experience with its stunning view and spacious layout. This apartment boasts three bedrooms and two bathrooms, making it the perfect choice for families or roommates looking for comfortable and convenient living space.' || chr(10) || chr(10) || 'As you enter the apartment, you''ll be greeted by a bright and airy living room with large windows that allow natural light to flood the space. The view from the windows is breathtaking, showcasing the city skyline or scenic surroundings, depending on the location. The living room leads to a cozy dining area, perfect for enjoying meals with family and friends.' || chr(10) || chr(10) || 'The apartment''s three bedrooms are generously sized, offering ample space for furniture and storage. The master bedroom features an ensuite bathroom for added privacy and convenience. The other two bedrooms share a well-appointed bathroom, complete with modern fixtures and fittings.' || chr(10) || chr(10) || 'The apartment also comes with a fully equipped kitchen, complete with stainless steel appliances and plenty of counter and cabinet space. There''s also a laundry area with a washer and dryer, making household chores a breeze.' || chr(10) || chr(10) || '837 Springview Court is located in a peaceful and quiet neighborhood, providing a serene and relaxing living experience. The building also offers various amenities, including a fitness center, a swimming pool, and a lounge area, perfect for hosting guests.' || chr(10) || chr(10) || 'Overall, this apartment is a perfect blend of comfort, convenience, and luxury, making it an ideal home for those looking for a high-quality living experience.', 'https://images.unsplash.com/photo-1561321698-40ae82a47b9e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8');
INSERT INTO properties (name, street_address, unit, state, zip, bedrooms, bathrooms, square_footage, owner_id, description, img_url) VALUES ('Decker''s Decks', '283 Sundown Center', 51, 'OH', '45213', 1, 1, 900, 5, 'Welcome to Decker''s Decks! If you''re looking for a place to call home that''s decked out with all the latest amenities, then you''ve come to the right place. Our apartments are so fabulous, you''ll never want to deck-camp anywhere else. Our complex is located in a prime location, so you''ll always be just a deck-stroll away from all the best shopping, dining, and entertainment options in town. Plus, our decks offer some of the most breathtaking views around, making your morning cup of coffee feel like a deck-licious treat. Each of our decks is fully equipped with all the modern conveniences you could ever need. From stainless steel appliances to spacious closets, our apartments have it all. And with our on-site deck-nicians available 24/7, you can rest easy knowing that any deck-related issues will be taken care of in no time. So why wait? Come deck out with us at Decker''s Decks and experience the best in deck-living today!', 'https://images.unsplash.com/photo-1580041065738-e72023775cdc?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8');
INSERT INTO properties (name, street_address, unit, state, zip, bedrooms, bathrooms, square_footage, owner_id, description, img_url) VALUES ('Ashlin Abbey', '42 Maple Lane', 68, 'OH', '45206', 1, 2, 1200, 6, 'Welcome to the cozy apartment at 42 Maple Lane! This unique living space features two bathrooms but only one bed, making it the perfect place for solo travelers or couples who don''t mind sharing a bed. Now, you may be wondering why there are two bathrooms in this apartment. Well, the previous owner, who was an eccentric billionaire, had a fear of bathroom germs and insisted on having two bathrooms in every living space he owned. He believed that having a backup bathroom would prevent him from getting sick from using a contaminated one. The bathrooms themselves are a sight to behold. One is a luxurious spa-style bathroom with a Jacuzzi tub, a steam shower, and heated floors. The other is a minimalist, functional bathroom with just a toilet, sink, and shower. Both bathrooms are fully stocked with fluffy towels, toiletries, and even bathrobes. The rest of the apartment is equally impressive. The living room features a comfortable sofa, a large flat-screen TV, and a cozy fireplace. The kitchen is fully equipped with everything you need to cook a delicious meal, including pots, pans, utensils, and a coffee maker. Overall, this apartment is a perfect combination of luxury and quirkiness. So come and enjoy the comfort of two bathrooms and one bed at 42 Maple Lane!', 'https://images.unsplash.com/photo-1502672260266-1c1ef2d93688?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8');
INSERT INTO properties (name, street_address, unit, state, zip, bedrooms, bathrooms, square_footage, owner_id, description, img_url) VALUES ('Agnella Apartments', '2 Brickson Park Parkway', 64, 'OH', '45201', 3, 1, 2300 , 8, 'Welcome to Agnella Apartments, where you''ll find a cozy and charming three-bedroom apartment with one bathroom. Now, you may be wondering why the designers chose to include only one bathroom in this spacious apartment. Well, rumor has it that the designers were big fans of "taking turns" and believed that having just one bathroom would encourage apartment mates to bond over the shared experience of waiting in line for the loo. But fear not, for the bathroom itself is a sight to behold. With sleek, modern fixtures and a delightful color scheme that''s sure to brighten up even the gloomiest of mornings, this bathroom is truly a work of art. And with its convenient location smack dab in the middle of the apartment, everyone is guaranteed to have equal access to all the glory that lies within. As for the rest of the apartment, you''ll find plenty of room for all your furniture, decor, and knick-knacks. The bedrooms are spacious and inviting, with plenty of natural light to keep you energized and inspired. And the kitchen is a true chef''s dream, with ample counter space, modern appliances, and plenty of room to cook up a storm. So come on down to Agnella Apartments and experience the joys of shared bathrooms (and the many, many benefits of having just one). We promise it''ll be a ride you won''t soon forget!', 'https://images.unsplash.com/photo-1574362848149-11496d93a7c7?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8');

INSERT INTO leases (tenant_id, property_id, rent_amount, start_date, end_date) VALUES(1, 1, 500, '2023-01-01', '2023-06-01');
INSERT INTO leases (tenant_id, property_id, rent_amount, start_date, end_date) VALUES(2, 2, 1000, '2023-01-01', '2023-06-01');
INSERT INTO leases (tenant_id, property_id, rent_amount, start_date, end_date) VALUES(3, 3, 500, '2023-01-01', '2023-06-01');
INSERT INTO leases (tenant_id, property_id, rent_amount, start_date, end_date) VALUES(4, 4, 1000, '2023-01-01', '2023-06-01');

COMMIT TRANSACTION;
