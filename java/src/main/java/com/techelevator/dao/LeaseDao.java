package com.techelevator.dao;
import com.techelevator.model.Lease;
import org.springframework.stereotype.Component;

import java.time.LocalDate;
import java.util.List;

public interface LeaseDao {
    int create(Lease lease);
    List<Lease> getAllLeases();
//    Lease getLeaseByPropertyId(int propertyId);
    void updateLease(int id, Lease updatedLease);
}
