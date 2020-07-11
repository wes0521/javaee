package com.oa.commons.vo;

import java.util.ArrayList;
import java.util.List;

public class Page<T> {
    private int pagenum;//当前页码
    private int pageSize;//页面大小
    private int pageStartIndex;//当前页的索引
    private int totalRows;  //记录总数
    private int totalPages;//总页数
    private List<T> datas;//当前页的数据

    public Page() {
        this.pagenum = 1;
        this.pageSize = 3;
        datas = new ArrayList<>();
    }

    public Page(int pagenum, int pageSize) {
        if(pagenum <= 0){
            pagenum = 1;
        }
        if (pageSize <= 0){
            pageSize = 3;
        }
        this.pagenum = pagenum;
        this.pageSize = pageSize;
    }

    public int getPagenum() {
        return pagenum;
    }

    public void setPagenum(int pagenum) {
        this.pagenum = pagenum;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public int getPageStartIndex() {
        return (pagenum - 1) * pageSize;
    }

    public void setPageStartIndex(int pageStartIndex) {

        this.pageStartIndex = pageStartIndex;
    }

    public int getTotalRows() {
        return totalRows;
    }

    public void setTotalRows(int totalRows) {
        this.totalRows = totalRows;
    }

    public int getTotalPages() {

        if(totalRows % pageSize == 0){
            totalPages = totalRows / pageSize;
        }
        else{
            totalPages = totalRows /pageSize + 1;
        }
        return totalPages;
    }

    public void setTotalPages(int totalPages) {
        this.totalPages = totalPages;
    }

    public List<T> getDatas() {
        return datas;
    }

    public void setDatas(List<T> datas) {
        this.datas = datas;
    }

}
