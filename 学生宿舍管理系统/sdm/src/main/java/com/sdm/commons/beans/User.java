/**
 * Created by IntelliJ IDEA.
 * User: 枫桥夜泊
 * Date: 2019/12/26
 * Time: 17:53
 */
package com.sdm.commons.beans;

public class User {
    private int uid;
    private String username;
    private String password;
    public User(){}

    public User(String username, String password) {
        this.username = username;
        this.password = password;
    }

    public User(int uid, String username, String password){
        this.uid=uid;
        this.username=username;
        this.password=password;
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Override
    public String toString() {
        return "User{" +
                "uid=" + uid +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                '}';
    }
}
