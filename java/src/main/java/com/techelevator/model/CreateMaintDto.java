package com.techelevator.model;


public class CreateMaintDto {
    private int propertyId;
    private String title;
    private String description;
    private String priority;
    private boolean isRepeatIssue;

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public int getPropertyId() {
        return propertyId;
    }

    public void setPropertyId(int propertyId) {
        this.propertyId = propertyId;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getPriority() {
        return priority;
    }

    public void setPriority(String priority) {
        this.priority = priority;
    }

    public boolean isRepeatIssue() {
        return isRepeatIssue;
    }

    public void setRepeatIssue(boolean repeatIssue) {
        isRepeatIssue = repeatIssue;
    }


}
