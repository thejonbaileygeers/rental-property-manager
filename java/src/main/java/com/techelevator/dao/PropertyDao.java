package com.techelevator.dao;
import com.techelevator.model.Property;
import com.techelevator.model.PropertyDto;

import java.util.List;

public interface PropertyDao {
    public List<Property> getAllProperties();

    public Property getPropertyById(int id);


    public boolean createProperty(String name, String streetAddress, int unit, String state, String zip, int bedrooms,
                                  int bathrooms, int squareFootage, int ownerId, String description, String imgUrl);

    public void deleteProperty(int id);

    Property update(PropertyDto propertyToUpdate, int id);

}
