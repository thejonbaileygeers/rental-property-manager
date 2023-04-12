package com.techelevator.dao;

import com.techelevator.model.Property;
import com.techelevator.model.PropertyDto;
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
        while (rs.next()) {
            Property property = mapRowToProperty(rs);
            properties.add(property);
        }
        return properties;
    }

    @Override
    public Property getPropertyById(int id) {
        Property property = new Property();
        String sql = "SELECT *\n" +
                "\tFROM properties\n" +
                "\tWHERE property_id = ?;";
        SqlRowSet rs = jdbcTemplate.queryForRowSet(sql, id);
        if (rs.next()) {
            property = mapRowToProperty(rs);
        }
        return property;
    }

    @Override
    public boolean createProperty(String name, String streetAddress, int unit, String state, String zip, int bedrooms,
                                  int bathrooms, int squareFootage, int ownerId, String description, String imgUrl) {
        String sql = "INSERT INTO properties (\n" +
                "\tname\n" +
                "\t, street_address, unit\n" +
                "\t, state\n" +
                "\t, zip\n" +
                "\t, bedrooms\n" +
                "\t, bathrooms\n" +
                "\t, square_footage\n" +
                "\t, owner_id\n" +
                "\t, description\n" +
                "\t, img_url\n" +
                ") VALUES (\n" +
                "?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?\n" +
                ") RETURNING property_id;";
        return (jdbcTemplate.queryForObject(sql, Integer.class, name, streetAddress, unit, state, zip,
                bedrooms, bathrooms, squareFootage, ownerId, description, imgUrl) != null);

    }

    @Override
    public void deleteProperty(int id) {
        String sql = "\tDELETE FROM leases\n" +
                "\tWHERE property_id = ?;\n" +
                "\tDELETE FROM properties\n" +
                "\tWHERE property_id = ?;";
        jdbcTemplate.update(sql, id, id);
    }

    @Override
    public boolean update(PropertyDto propertyToUpdate, int id) {
        String sql = "\tUPDATE properties SET \n" +
                "\tname = ?,\n" +
                "\tstreet_address = ?,\n" +
                "\tstate = ?,\n" +
                "\tzip = ?,\n" +
                "\tbedrooms = ?,\n" +
                "\tbathrooms = ?,\n" +
                "\tsquare_footage = ?,\n" +
                "\towner_id = ?,\n" +
                "\tdescription = ?,\n" +
                "\timg_url = ?\n" +
                "\tWHERE property_id = ?;";
        return jdbcTemplate.update(sql, );
    }


    private Property mapRowToProperty(SqlRowSet rs) {
        Property property = new Property();

        property.setPropertyId(rs.getInt("property_id"));
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
        property.setImgUrl(rs.getString("img_url"));

        return property;
    }

    ;
}
