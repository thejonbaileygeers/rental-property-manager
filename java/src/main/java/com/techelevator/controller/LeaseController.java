package com.techelevator.controller;

import com.techelevator.dao.LeaseDao;
import com.techelevator.model.Lease;
import org.springframework.web.bind.annotation.*;

import java.util.List;


@CrossOrigin
@RestController
public class LeaseController {
    //dependency inject lease DAO
    private final LeaseDao leaseDao;
    public LeaseController(LeaseDao leaseDao) {
        this.leaseDao = leaseDao;
    }

    @PostMapping(path = "/leases")
    public Lease create(@RequestBody Lease lease) {
//        Lease existingLease = leaseDao.getLeaseByPropertyId(lease.getPropertyId());
//        if (existingLease != null) {
//            existingLease.setActive(false);
//            leaseDao.updateLease(existingLease.getId(), existingLease);
//        }
        int leaseId = leaseDao.create(lease);
        return leaseDao.getLeaseById(leaseId);
    }

    @GetMapping(path = "/leases")
    public List<Lease> getAllLeases() {
        return leaseDao.getAllLeases();
    }

//    @GetMapping(path = "/leases/{id}")
//    public Lease getLeaseByPropertyId(@PathVariable int propertyId) {
//        return leaseDao.getLeaseByPropertyId(propertyId);
//    }

    @PutMapping(path="/leases/{id}")
    public void updateLease(@PathVariable int id, @RequestBody Lease updatedLease ) {
        leaseDao.updateLease(id, updatedLease);
    }

    @DeleteMapping("/leases/{id}")
    public void deleteLease(@PathVariable int id) {
        leaseDao.deleteLease(id);
    }
}
