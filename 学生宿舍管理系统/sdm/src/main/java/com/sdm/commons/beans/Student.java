package com.sdm.commons.beans;

public class Student {
    private int sid;
    private String sno;
    private String name;
    private String password;
    private String sex;
    private String college;
    private String classes;
    private String phone;
    private String house;

    public Student() {
    }

    public Student(String sno, String name, String password, String sex, String college, String classes, String phone, String house) {
        this.sno = sno;
        this.name = name;
        this.password = password;
        this.sex = sex;
        this.college = college;
        this.classes = classes;
        this.phone = phone;
        this.house = house;
    }

    public int getSid() {
        return sid;
    }

    public void setSid(int sid) {
        this.sid = sid;
    }

    public String getSno() {
        return sno;
    }

    public void setSno(String sno) {
        this.sno = sno;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getCollege() {
        return college;
    }

    public void setCollege(String college) {
        this.college = college;
    }

    public String getClasses() {
        return classes;
    }

    public void setClasses(String classes) {
        this.classes = classes;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getHouse() {
        return house;
    }

    public void setHouse(String house) {
        this.house = house;
    }

    @Override
    public String toString() {
        return "Student{" +
                "sid=" + sid +
                ", sno='" + sno + '\'' +
                ", name='" + name + '\'' +
                ", password='" + password + '\'' +
                ", sex='" + sex + '\'' +
                ", college='" + college + '\'' +
                ", classes='" + classes + '\'' +
                ", phone='" + phone + '\'' +
                ", house='" + house + '\'' +
                '}';
    }
}
