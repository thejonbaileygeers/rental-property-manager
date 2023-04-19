BEGIN TRANSACTION;
INSERT INTO users (username,password_hash,role,phone,first_name,last_name,type) VALUES ('tenant@quest.com','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER','(555)555-5555', 'Don', 'Julio', 'tenant');
INSERT INTO users (username,password_hash,role,phone,first_name,last_name,type) VALUES ('landlord@quest.com','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER','(555)555-5555', 'Benjamin', 'Courtilou', 'landlord');
INSERT INTO users (username,password_hash,role,phone,first_name,last_name,type) VALUES ('maintenance@quest.com','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER','(555)555-5555', 'Chaz', 'Michael-michaels', 'maintenance');
INSERT INTO users (username,password_hash,role,phone,first_name,last_name,type) VALUES ('tenant2@quest.com','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_ADMIN', '(555)555-5555', 'Media', 'Fernando', 'tenant');

INSERT INTO users (username, password_hash, role, phone, first_name, last_name, type) VALUES ('eraffeorty0@quest.com', '$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC', 'USER', '475-477-9617', 'Errick', 'Raffeorty', 'landlord');
INSERT INTO users (username, password_hash, role, phone, first_name, last_name, type) VALUES ('swaldera1@quest.com', '$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC', 'ADMIN', '836-841-4089', 'Sebastien', 'Waldera', 'landlord');
INSERT INTO users (username, password_hash, role, phone, first_name, last_name, type) VALUES ('pswynfen2@quest.com', '$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC', 'ADMIN', '510-152-2276', 'Phil', 'Swynfen', 'maintenance');
INSERT INTO users (username, password_hash, role, phone, first_name, last_name, type) VALUES ('nbaldwin3@quest.com', '$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC', 'USER', '637-919-4060', 'Nanice', 'Baldwin', 'landlord');
INSERT INTO users (username,password_hash,role,phone,first_name,last_name,type) VALUES ('tenant3@quest.com','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_ADMIN', '(555)555-5555', 'Andrew', 'Rodriguez', 'tenant');
INSERT INTO users (username,password_hash,role,phone,first_name,last_name,type) VALUES ('tenant4@quest.com','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_ADMIN', '(555)555-5555', 'Sherry', 'Cisco', 'tenant');
INSERT INTO users (username,password_hash,role,phone,first_name,last_name,type) VALUES ('tenant5@quest.com','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_ADMIN', '(555)555-5555', 'Nathan', 'Bacon', 'tenant');

INSERT INTO properties (name, street_address, unit, city, state, zip, bedrooms, bathrooms, square_footage, owner_id, description, img_url) VALUES ('Trevor''s Tower', '837 Springview Court', 95, 'Cincinnati', 'OH', '45211', 3, 2, 3000, 2, '837 Springview Court is a beautiful apartment that offers an exceptional living experience with its stunning view and spacious layout. This apartment boasts three bedrooms and two bathrooms, making it the perfect choice for families or roommates looking for comfortable and convenient living space.' || chr(10) || chr(10) || 'As you enter the apartment, you''ll be greeted by a bright and airy living room with large windows that allow natural light to flood the space. The view from the windows is breathtaking, showcasing the city skyline or scenic surroundings, depending on the location. The living room leads to a cozy dining area, perfect for enjoying meals with family and friends.' || chr(10) || chr(10) || 'The apartment''s three bedrooms are generously sized, offering ample space for furniture and storage. The master bedroom features an ensuite bathroom for added privacy and convenience. The other two bedrooms share a well-appointed bathroom, complete with modern fixtures and fittings.' || chr(10) || chr(10) || 'The apartment also comes with a fully equipped kitchen, complete with stainless steel appliances and plenty of counter and cabinet space. There''s also a laundry area with a washer and dryer, making household chores a breeze.' || chr(10) || chr(10) || '837 Springview Court is located in a peaceful and quiet neighborhood, providing a serene and relaxing living experience. The building also offers various amenities, including a fitness center, a swimming pool, and a lounge area, perfect for hosting guests.' || chr(10) || chr(10) || 'Overall, this apartment is a perfect blend of comfort, convenience, and luxury, making it an ideal home for those looking for a high-quality living experience.', 'https://images.unsplash.com/photo-1561321698-40ae82a47b9e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8');
INSERT INTO properties (name, street_address, unit, city, state, zip, bedrooms, bathrooms, square_footage, owner_id, description, img_url) VALUES ('Decker''s Decks', '283 Sundown Center', 51, 'Cincinnati', 'OH', '45213', 1, 5, 900, 5, 'Welcome to Decker''s Decks! If you''re looking for a place to call home that''s decked out with all the latest amenities, then you''ve come to the right place. Our apartments are so fabulous, you''ll never want to deck-camp anywhere else. Our complex is located in a prime location, so you''ll always be just a deck-stroll away from all the best shopping, dining, and entertainment options in town. Plus, our decks offer some of the most breathtaking views around, making your morning cup of coffee feel like a deck-licious treat. Each of our decks is fully equipped with all the modern conveniences you could ever need. From stainless steel appliances to spacious closets, our apartments have it all. And with our on-site deck-nicians available 24/7, you can rest easy knowing that any deck-related issues will be taken care of in no time. So why wait? Come deck out with us at Decker''s Decks and experience the best in deck-living today!', 'https://images.unsplash.com/photo-1580041065738-e72023775cdc?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8');
INSERT INTO properties (name, street_address, unit, city, state, zip, bedrooms, bathrooms, square_footage, owner_id, description, img_url) VALUES ('Ashlin Abbey', '42 Maple Lane', 68, 'Cincinnati', 'OH', '45206', 1, 2, 1200, 6, 'Welcome to the cozy apartment at 42 Maple Lane! This unique living space features two bathrooms but only one bed, making it the perfect place for solo travelers or couples who don''t mind sharing a bed. Now, you may be wondering why there are two bathrooms in this apartment. Well, the previous owner, who was an eccentric billionaire, had a fear of bathroom germs and insisted on having two bathrooms in every living space he owned. He believed that having a backup bathroom would prevent him from getting sick from using a contaminated one. The bathrooms themselves are a sight to behold. One is a luxurious spa-style bathroom with a Jacuzzi tub, a steam shower, and heated floors. The other is a minimalist, functional bathroom with just a toilet, sink, and shower. Both bathrooms are fully stocked with fluffy towels, toiletries, and even bathrobes. The rest of the apartment is equally impressive. The living room features a comfortable sofa, a large flat-screen TV, and a cozy fireplace. The kitchen is fully equipped with everything you need to cook a delicious meal, including pots, pans, utensils, and a coffee maker. Overall, this apartment is a perfect combination of luxury and quirkiness. So come and enjoy the comfort of two bathrooms and one bed at 42 Maple Lane!', 'https://images.unsplash.com/photo-1502672260266-1c1ef2d93688?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8');
INSERT INTO properties (name, street_address, unit, city, state, zip, bedrooms, bathrooms, square_footage, owner_id, description, img_url) VALUES ('Agnella Apartments', '2 Brickson Park Parkway', 64, 'Cincinnati', 'OH', '45201', 3, 1, 2300 , 8, 'Welcome to Agnella Apartments, where you''ll find a cozy and charming three-bedroom apartment with one bathroom. Now, you may be wondering why the designers chose to include only one bathroom in this spacious apartment. Well, rumor has it that the designers were big fans of "taking turns" and believed that having just one bathroom would encourage apartment mates to bond over the shared experience of waiting in line for the loo. But fear not, for the bathroom itself is a sight to behold. With sleek, modern fixtures and a delightful color scheme that''s sure to brighten up even the gloomiest of mornings, this bathroom is truly a work of art. And with its convenient location smack dab in the middle of the apartment, everyone is guaranteed to have equal access to all the glory that lies within. As for the rest of the apartment, you''ll find plenty of room for all your furniture, decor, and knick-knacks. The bedrooms are spacious and inviting, with plenty of natural light to keep you energized and inspired. And the kitchen is a true chef''s dream, with ample counter space, modern appliances, and plenty of room to cook up a storm. So come on down to Agnella Apartments and experience the joys of shared bathrooms (and the many, many benefits of having just one). We promise it''ll be a ride you won''t soon forget!', 'https://images.unsplash.com/photo-1574362848149-11496d93a7c7?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8');
INSERT INTO properties (name, street_address, unit, city, state, zip, bedrooms, bathrooms, square_footage, owner_id, description, img_url) VALUES ('Liberty Commune', '1776 Liberty Dr', 2, 'Cincinnati', 'OH', '45201', 2, 2, 1700 , 2, 'Welcome to Liberty Commune, where your pursuit of happiness begins! This apartment complex embodies the principles of the Declaration of Independence, with a community that values individual liberty and the pursuit of a better life.

As you enter your new apartment, you''ll notice the spacious living room, with its large windows providing natural light and a view of the surrounding neighborhood. The room is adorned with a simple yet elegant fireplace, symbolizing the warmth and comfort of your own home.

The kitchen is fully equipped with modern appliances, inviting you to explore your culinary skills and taste the flavors of freedom. You''ll find ample space for your cooking adventures, with cabinets and drawers decorated with engraved stars, representing the union of the states.

The bedroom is a peaceful retreat, with a soft and comfortable bed that beckons you to rest and recharge. The walls are painted in a calming blue, reminding you of the unalienable rights of life, liberty, and the pursuit of happiness.

As you step outside, you''ll discover a community that cherishes diversity and the pursuit of individual passions. The communal spaces are designed for you to connect with your fellow residents, to share your ideas and aspirations, and to foster a sense of belonging.

Welcome to Liberty Commune, where you can enjoy the blessings of liberty in a community that values your independence and celebrates your unique contribution to the world.', 'https://images.unsplash.com/photo-1597047084897-51e81819a499?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format');
INSERT INTO properties (name, street_address, unit, city, state, zip, bedrooms, bathrooms, square_footage, owner_id, description, img_url) VALUES ('Shell Shelters', '37 Conch Way', 3, 'Cincinnati', 'OH', '45201', 1, 1, 500 , 2, 'Welcome to Shell Shelters, where you can find the ultimate shelter for your lifestyle! Our apartment complex boasts a unique architecture with a shell-inspired design that will make you feel right at home.

As you enter your apartment, you will notice the spacious living area, which is perfect for shell-abrating all of life''s special moments. The walls are adorned with beautiful seashell decorations that provide a calm and relaxing ambiance.

The kitchen is fully equipped with all the amenities you need to cook up a storm, including a shell-shaped sink and shell-handled cabinets. You''ll feel like a true master chef as you prepare your meals on the shell-themed countertops.

When it''s time to rest and relax, head to the bedroom, where you''ll find a cozy bed with a shell-shaped headboard. The windows offer breathtaking views of the nearby beach, and the curtains have delicate shell patterns that add a touch of elegance to the room.

As you make your way to the bathroom, you''ll notice the seashell-shaped tiles and the showerhead that is reminiscent of a clam. You can relax in the bathtub, surrounded by the soothing sound of ocean waves, and let all your worries wash away.

But that''s not all! The Shell Shelters complex also offers a range of amenities that are perfect for your shellf-care routine. Take a dip in the shell-shaped swimming pool, relax in the shell-adorned lounge area, or get your heart pumping in the shell-themed fitness center.

So come on down to Shell Shelters and experience the shell-ebrity treatment that you deserve!', 'https://images.unsplash.com/photo-1602082550187-3f954840a0f7?ixlib=rb-4.0.3');

INSERT INTO leases (tenant_id, property_id, rent_amount, start_date, end_date) VALUES(1, 1, 500, '2023-01-01', '2023-06-01');
INSERT INTO leases (tenant_id, property_id, rent_amount, start_date, end_date) VALUES(4, 2, 1000, '2023-01-01', '2023-06-01');
INSERT INTO leases (tenant_id, property_id, rent_amount, start_date, end_date) VALUES(9, 3, 500, '2023-01-01', '2023-06-01');
INSERT INTO leases (tenant_id, property_id, rent_amount, start_date, end_date) VALUES(10, 5, 1000, '2023-01-01', '2023-06-01');

INSERT INTO maintenance_requests(property_id, maintenance_id, requester_id, title, description, priority, repeat_issue, date_requested, date_completed, status)
	VALUES (1, null,7, 'Toilet Malfunction' ,'Hope you guys are doing well. Listen, I''ve got a bit of an issue with my toilet. It''s not flushing properly and it''s starting to become a real pain in the you-know-what.

I tried using a plunger, but no luck. The water''s not going down and I''m afraid it''s gonna overflow soon. So, I was hoping you could send someone over to take a look and fix it up.

If you could let me know when someone''s available, that''d be great. I''m pretty flexible, so just give me a shout and I''ll make sure I''m home.'
		   , 'urgent', false, '2023-04-20', null, 'pending');
INSERT INTO maintenance_requests(property_id, maintenance_id, requester_id, title, description, priority, repeat_issue, date_requested, date_completed, status)
	VALUES (5,3,10,'Bedroom Door BROKEN','So, I''ve got a bit of a situation. My dog got a little too excited and managed to break my bedroom door clean in half. I''m pretty impressed, to be honest, but it''s definitely not helping with privacy or keeping the cold out.

I was hoping you guys could send someone over to fix or replace the door as soon as possible. I know it''s not ideal, but I''ll do my best to keep my pup under control from now on.

Let me know when someone can swing by, and I''ll make sure to be around to let them in.','urgent',false,'4/19/2023',null,'in-progress'
);

COMMIT TRANSACTION;
