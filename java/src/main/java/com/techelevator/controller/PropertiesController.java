package com.techelevator.controller;

import com.techelevator.dao.PropertyDao;
import com.techelevator.model.Property;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class PropertiesController {
    private final PropertyDao propertyDao;
    public PropertiesController(PropertyDao propertyDao) {
        this.propertyDao = propertyDao;
    }

    @GetMapping(path="/properties")
    public List<Property> list() {
       List<Property> properties = propertyDao.getAllProperties();
       return properties;
    }
}
