package com.oa.commons.beans;

import java.io.Serializable;
import java.util.List;

public class Newlabel implements Serializable {
    private int id;
    private String label_name;
    private String label_content;
    private int pid;

    private Newlabel parent;//当前类为子栏目

    private List<Newlabel> children;//当前类为父栏目

    public Newlabel() {
    }

    public Newlabel(List<Newlabel> children) {
        this.children = children;
    }

    public Newlabel(Newlabel parent) {
        this.parent = parent;
    }

    public Newlabel(String label_name, String label_content, int pid, Newlabel parent, List<Newlabel> children) {
        this.label_name = label_name;
        this.label_content = label_content;
        this.pid = pid;
        this.parent = parent;
        this.children = children;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getLabel_name() {
        return label_name;
    }

    public void setLabel_name(String label_name) {
        this.label_name = label_name;
    }

    public String getLabel_content() {
        return label_content;
    }

    public void setLabel_content(String label_content) {
        this.label_content = label_content;
    }

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public Newlabel getParent() {
        return parent;
    }

    public void setParent(Newlabel parent) {
        this.parent = parent;
    }

    public List<Newlabel> getChildren() {
        return children;
    }

    public void setChildren(List<Newlabel> children) {
        this.children = children;
    }
    @Override
    public String toString() {
        return "Newlabel{" +
                "id=" + id +
                ", label_name='" + label_name + '\'' +
                ", label_content='" + label_content + '\'' +
                ", pid=" + pid +
                ", parent=" + parent +
                ", children=" + children +
                '}';
    }
}
