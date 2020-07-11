package com.sdm.commons.beans;

public class Repair {
    private int rid;
    private String sno;
    private String sname;
    private String rname;
    private String rcase;
    private String rtime;
    private String rhouse;

    public Repair() {
    }

    public Repair(String sno, String sname, String rname, String rcase, String rtime, String rhouse) {
        this.sno = sno;
        this.sname = sname;
        this.rname = rname;
        this.rcase = rcase;
        this.rtime = rtime;
        this.rhouse = rhouse;
    }

    public int getRid() {
        return rid;
    }

    public void setRid(int rid) {
        this.rid = rid;
    }

    public String getSno() {
        return sno;
    }

    public void setSno(String sno) {
        this.sno = sno;
    }

    public String getSname() {
        return sname;
    }

    public void setSname(String sname) {
        this.sname = sname;
    }

    public String getRname() {
        return rname;
    }

    public void setRname(String rname) {
        this.rname = rname;
    }

    public String getRcase() {
        return rcase;
    }

    public void setRcase(String rcase) {
        this.rcase = rcase;
    }

    public String getRtime() {
        return rtime;
    }

    public void setRtime(String rtime) {
        this.rtime = rtime;
    }

    public String getRhouse() {
        return rhouse;
    }

    public void setRhouse(String rhouse) {
        this.rhouse = rhouse;
    }

    @Override
    public String toString() {
        return "Repair{" +
                "rid=" + rid +
                ", sno='" + sno + '\'' +
                ", sname='" + sname + '\'' +
                ", rname='" + rname + '\'' +
                ", rcase='" + rcase + '\'' +
                ", rtime='" + rtime + '\'' +
                ", rhouse='" + rhouse + '\'' +
                '}';
    }
}
