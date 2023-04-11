package com.techelevator.dao;

import com.techelevator.model.Property;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Component
public class JdbcPropertyDao implements PropertyDao {

    private final JdbcTemplate jdbcTemplate;

    public JdbcPropertyDao(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    public List<Property> getAllProperties() {
        String sql = "SELECT * FROM properties;";
        SqlRowSet rs = jdbcTemplate.queryForRowSet(sql);
        List<Property> properties = new ArrayList<>();
        while(rs.next()) {
            Property property = mapRowToProperty(rs);
            properties.add(property);
        }

        return properties;
    }

    private Property mapRowToProperty(SqlRowSet rs)  {
        Property property = new Property();

        property.setName(rs.getString("name"));
        property.setStreetAddress(rs.getString("street_address"));
        property.setUnit(rs.getInt("unit"));
        property.setState(rs.getString("state"));
        property.setZip(rs.getString("zip"));
        property.setBedrooms(rs.getInt("bedrooms"));
        property.setBathrooms(rs.getInt("bathrooms"));
        property.setSquareFootage(rs.getInt("square_footage"));
        property.setOwnerId(rs.getInt("owner_id"));
        property.setDescription(rs.getString("description"));
        property.setImgUrl(rs.getString("image_url"));

        return property;
    };
}
