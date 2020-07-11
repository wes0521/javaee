package com.sdm.commons.beans;

import java.io.Serializable;

/**
 * company: www.abc.com
 * Author: Administrator
 * Create Data: 2019/12/24 0024
 */
public class Announcement implements Serializable {
    private Integer anno_id;
    private String anno_name;
    private String anno_content;
    private String anno_data;

    public Announcement() {
    }

    public Announcement(Integer anno_id, String anno_name, String anno_content, String anno_data) {
        this.anno_id = anno_id;
        this.anno_name = anno_name;
        this.anno_content = anno_content;
        this.anno_data = anno_data;
    }

    public Integer getAnno_id() {
        return anno_id;
    }

    public void setAnno_id(Integer anno_id) {
        this.anno_id = anno_id;
    }

    public String getAnno_name() {
        return anno_name;
    }

    public void setAnno_name(String anno_name) {
        this.anno_name = anno_name;
    }

    public String getAnno_content() {
        return anno_content;
    }

    public void setAnno_content(String anno_content) {
        this.anno_content = anno_content;
    }

    public String getAnno_data() {
        return anno_data;
    }

    public void setAnno_data(String anno_data) {
        this.anno_data = anno_data;
    }

    @Override
    public String toString() {
        return "Announcement{" +
                "anno_id=" + anno_id +
                ", anno_name='" + anno_name + '\'' +
                ", anno_content='" + anno_content + '\'' +
                ", anno_data='" + anno_data + '\'' +
                '}';
    }
}
