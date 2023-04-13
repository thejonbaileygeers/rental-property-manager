package com.techelevator.controller;

import com.techelevator.dao.PropertyDao;
import com.techelevator.model.Property;
import com.techelevator.model.PropertyDto;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@CrossOrigin
@RestController
public class PropertyController {
    private final PropertyDao propertyDao;

    public PropertyController(PropertyDao propertyDao) {
        this.propertyDao = propertyDao;
    }

    @GetMapping(path = "/properties")
    public List<Property> list() {
        List<Property> properties = propertyDao.getAllProperties();
        return properties;
    }

    @GetMapping("/properties/{id}")
    public Property getPropertyById(@PathVariable int id) {
        Property property = propertyDao.getPropertyById(id);
        return property;
    }

    // Create property

    @ResponseStatus(HttpStatus.CREATED)
    @PostMapping("/properties")
    public void createProperty(@RequestBody PropertyDto newProperty) {
        propertyDao.createProperty(newProperty.getName(), newProperty.getStreetAddress(), newProperty.getUnit(),
                newProperty.getState(), newProperty.getZip(), newProperty.getBedrooms(), newProperty.getBathrooms(),
                newProperty.getSquareFootage(), newProperty.getOwnerId(), newProperty.getDescription(),
                newProperty.getImgUrl());
    }
    // Update property

//    @ResponseStatus(HttpStatus.ACCEPTED)
//    @PutMapping("/properties/{id}")
//    public void updateProperty(@RequestBody PropertyDto propertyToUpdate, @PathVariable int id) {
//        propertyDao.update(propertyToUpdate, id);
//    }

    @ResponseStatus(HttpStatus.ACCEPTED)
    @PutMapping("/properties/{id}")
    public void updateProperty(@RequestBody PropertyDto propertyToUpdate, @PathVariable int id) {
        propertyDao.update(propertyToUpdate.getName(), propertyToUpdate.getStreetAddress(), propertyToUpdate.getUnit(),
                propertyToUpdate.getState(), propertyToUpdate.getZip(), propertyToUpdate.getBedrooms(),
                propertyToUpdate.getBathrooms(), propertyToUpdate.getSquareFootage(), propertyToUpdate.getOwnerId(),
                propertyToUpdate.getDescription(), propertyToUpdate.getImgUrl(), id);
    }

    // Delete property

    @ResponseStatus(HttpStatus.NO_CONTENT)
    @DeleteMapping("/properties/{id}")
    public void deleteProperty(@PathVariable int id) {

        propertyDao.deleteProperty(id);
    }



}
