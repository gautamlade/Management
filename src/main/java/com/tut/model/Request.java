package com.tut.model;

public class Request {
    private int id;                // Primary key
    private int userId;           // Foreign key referencing users
    private int softwareId;       // Foreign key referencing software
    private String username;       // Username of the user making the request
    private String softwareName;   // Name of the software requested
    private String accessType;     // Type of access requested (Read, Write, Admin)
    private String status;         // Status of the request (Pending, Approved, Rejected)
    private String reason;         // Reason for the request

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getSoftwareId() {
        return softwareId;
    }

    public void setSoftwareId(int softwareId) {
        this.softwareId = softwareId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getSoftwareName() {
        return softwareName;
    }

    public void setSoftwareName(String softwareName) {
        this.softwareName = softwareName;
    }

    public String getAccessType() {
        return accessType;
    }

    public void setAccessType(String accessType) {
        this.accessType = accessType;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }
}
