package com.bookstore.admin.notices.dao;

import com.bookstore.commons.beans.Notice;

import java.util.List;

public interface INoticesDao {
    List<Notice> selectNotices();

    int deleteNotices(String id);

    int insertNotice(Notice notice);

    Notice selectNoticeById(String id);

    int updateNotice(Notice notice);
}
