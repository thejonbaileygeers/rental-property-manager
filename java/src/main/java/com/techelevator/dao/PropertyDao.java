package com.techelevator.dao;
import com.techelevator.model.Property;
import com.techelevator.model.PropertyDto;

import java.util.List;

public interface PropertyDao {
    public List<Property> getAllProperties();

    public Property getPropertyById(int id);


    public boolean createProperty(String name, String streetAddress, int unit, String city, String state, String zip, int bedrooms,
                                  int bathrooms, int squareFootage, int ownerId, String description, String imgUrl);

    public void deleteProperty(int id);

//    public boolean update(PropertyDto propertyToUpdate, int id);

    public boolean update(String name, String streetAddress, int unit, String city, String state, String zip, int bedrooms,
                int bathrooms, int squareFootage, int ownerId, String description, String imgUrl, int id);
}
