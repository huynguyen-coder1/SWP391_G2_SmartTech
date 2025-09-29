package model;

import java.util.Date;

public class Notification {

    private int notificationID;
    private int userID;
    private String type;
    private String content;
    private Date sentAt;
    private boolean isRead;

    public Notification() {
    }

    public Notification(int notificationID, int userID, String type, String content, Date sentAt, boolean isRead) {
        this.notificationID = notificationID;
        this.userID = userID;
        this.type = type;
        this.content = content;
        this.sentAt = sentAt;
        this.isRead = isRead;
    }

    public int getNotificationID() {
        return notificationID;
    }

    public void setNotificationID(int notificationID) {
        this.notificationID = notificationID;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getSentAt() {
        return sentAt;
    }

    public void setSentAt(Date sentAt) {
        this.sentAt = sentAt;
    }

    public boolean isRead() {
        return isRead;
    }

    public void setRead(boolean isRead) {
        this.isRead = isRead;
    }
}
