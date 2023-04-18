package com.techelevator.model;

import javax.validation.constraints.Positive;
import java.time.LocalDate;

public class Lease {
    private int id;
   private int leaseId;
   private int tenantId;
   private int propertyId;
   @Positive
   private int rentAmount;
   private LocalDate startDate;
   private LocalDate endDate;
   private boolean isActive;


    public Lease() {
    }

    public Lease(int leaseId, int tenantId, int propertyId, int rentAmount, LocalDate startDate, LocalDate endDate) {
        this.leaseId = leaseId;
        this.tenantId = tenantId;
        this.propertyId = propertyId;
        this.rentAmount = rentAmount;
        this.startDate = startDate;
        this.endDate = endDate;
    }

    public int getLeaseId() {
        return leaseId;
    }

    public void setLeaseId(int leaseId) {
        this.leaseId = leaseId;
    }

    public int getTenantId() {
        return tenantId;
    }

    public void setTenantId(int tenantId) {
        this.tenantId = tenantId;
    }

    public int getPropertyId() {
        return propertyId;
    }

    public void setPropertyId(int propertyId) {
        this.propertyId = propertyId;
    }

    public int getRentAmount() {
        return rentAmount;
    }

    public void setRentAmount(int rentAmount) {
        this.rentAmount = rentAmount;
    }

    public LocalDate getStartDate() {
        return startDate;
    }

    public void setStartDate(LocalDate startDate) {
        this.startDate = startDate;
    }

    public LocalDate getEndDate() {
        return endDate;
    }

    public void setEndDate(LocalDate endDate) {
        this.endDate = endDate;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public boolean isActive() {
        return isActive;
    }

    public void setActive(boolean active) {
        isActive = active;
    }

    @Override
    public String toString() {
        return "Lease{" +
                "propertyId=" + propertyId +
                ", rentAmount=" + rentAmount +
                '}';
    }
}
