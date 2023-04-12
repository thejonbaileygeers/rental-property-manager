package com.techelevator.dao;

import com.techelevator.model.Lease;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.security.core.parameters.P;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.PathVariable;

import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@Component
public class JdbcLeaseDao implements LeaseDao {

    private final JdbcTemplate jdbcTemplate;

    public JdbcLeaseDao(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    public int create(Lease lease) {
        String sql = "INSERT INTO leases (tenant_id, property_id, rent_amount, start_date, end_date) VALUES (?,?,?,?,?) RETURNING lease_id";
        int leaseId = jdbcTemplate.queryForObject(sql, Integer.class, lease.getTenantId(), lease.getPropertyId(), lease.getRentAmount(), lease.getStartDate(), lease.getEndDate());
        return leaseId;
    }
    @Override
    public List<Lease> getAllLeases() {
        String sql = "SELECT * FROM leases;";
        SqlRowSet rs = jdbcTemplate.queryForRowSet(sql);
        List<Lease> allLeases = new ArrayList<>();
        while(rs.next()) {
            Lease lease = new Lease();
            lease.setLeaseId(rs.getInt("lease_id"));
            lease.setTenantId(rs.getInt("tenant_id"));
            lease.setPropertyId(rs.getInt("property_id"));
            lease.setRentAmount(rs.getInt("rent_amount"));
            lease.setStartDate(rs.getDate("start_date").toLocalDate());
            lease.setEndDate(rs.getDate("end_date").toLocalDate());
            allLeases.add(lease) ;
        }
        return allLeases;
    }
//    @Override
//    public Lease getLeaseByPropertyId(int id) {
//        String sql = "SELECT * FROM leases WHERE property_id = ?;";
//        SqlRowSet rs = jdbcTemplate.queryForRowSet(sql, Integer.class, id);
//        Lease lease = new Lease();
//        if(rs.next()) {
//            lease.setLeaseId(rs.getInt("lease_id"));
//            lease.setTenantId(rs.getInt("tenant_id"));
//            lease.setPropertyId(rs.getInt("property_id"));
//            lease.setRentAmount(rs.getInt("rent_amount"));
//            lease.setStartDate(rs.getDate("start_date").toLocalDate());
//            lease.setEndDate(rs.getDate("end_date").toLocalDate());
//        }
//        return lease;
//    }

    @Override
    public void updateLease(int id, Lease updatedLease) {
        String sql = "UPDATE leases SET tenant_id=?, property_id=?, rent_amount=?, start_date=?, end_date=? WHERE lease_id = ?;";
            jdbcTemplate.update(sql, updatedLease.getTenantId(), updatedLease.getPropertyId(), updatedLease.getRentAmount(), updatedLease.getStartDate(), updatedLease.getEndDate(), id);
    }
}
