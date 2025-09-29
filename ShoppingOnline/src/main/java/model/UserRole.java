package model;

public class UserRole {

    private int userID;
    private int roleID;

    public UserRole() {
    }

    public UserRole(int userID, int roleID) {
        this.userID = userID;
        this.roleID = roleID;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public int getRoleID() {
        return roleID;
    }

    public void setRoleID(int roleID) {
        this.roleID = roleID;
    }
}
