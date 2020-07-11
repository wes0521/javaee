package com.sdm.commons.beans;

/**
 * company: www.abc.com
 * Author: Administrator
 * Create Data: 2019/12/27 0027
 */
public class Absence {
    private int ab_id;
    private String st_sno;
    private String st_name;
    private String st_sex;
    private String st_class;
    private String house_num;
    private String ab_time;
    private String wr_person;

    public Absence() {

    }

    public Absence(int ab_id, String st_sno, String st_name, String st_sex, String st_class, String house_num, String ab_time, String wr_person) {
        this.ab_id = ab_id;
        this.st_sno = st_sno;
        this.st_name = st_name;
        this.st_sex = st_sex;
        this.st_class = st_class;
        this.house_num = house_num;
        this.ab_time = ab_time;
        this.wr_person = wr_person;
    }

    public int getAb_id() {
        return ab_id;
    }

    public void setAb_id(int ab_id) {
        this.ab_id = ab_id;
    }

    public String getSt_sno() {
        return st_sno;
    }

    public void setSt_sno(String st_sno) {
        this.st_sno = st_sno;
    }

    public String getSt_name() {
        return st_name;
    }

    public void setSt_name(String st_name) {
        this.st_name = st_name;
    }

    public String getSt_sex() {
        return st_sex;
    }

    public void setSt_sex(String st_sex) {
        this.st_sex = st_sex;
    }

    public String getSt_class() {
        return st_class;
    }

    public void setSt_class(String st_class) {
        this.st_class = st_class;
    }

    public String getHouse_num() {
        return house_num;
    }

    public void setHouse_num(String house_num) {
        this.house_num = house_num;
    }

    public String getAb_time() {
        return ab_time;
    }

    public void setAb_time(String ab_time) {
        this.ab_time = ab_time;
    }

    public String getWr_person() {
        return wr_person;
    }

    public void setWr_person(String wr_person) {
        this.wr_person = wr_person;
    }


    @Override
    public String toString() {
        return "Absense{" +
                "ab_id=" + ab_id +
                ", st_sno='" + st_sno + '\'' +
                ", st_name='" + st_name + '\'' +
                ", st_sex='" + st_sex + '\'' +
                ", st_class='" + st_class + '\'' +
                ", house_num='" + house_num + '\'' +
                ", ab_time='" + ab_time + '\'' +
                ", wr_person='" + wr_person + '\'' +
                '}';
    }
}
