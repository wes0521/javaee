package com.bookstore.admin.notices.service;

import com.bookstore.commons.beans.Notice;

import java.util.List;

public interface INoticesService {
    List<Notice> findNotices();

    int removeNotice(String id);

    int addNotice(Notice notice);

    Notice findNoticeById(String id);

    int editNotice(Notice notice);
}
