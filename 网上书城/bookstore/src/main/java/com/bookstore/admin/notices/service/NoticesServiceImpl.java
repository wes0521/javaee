package com.bookstore.admin.notices.service;

import com.bookstore.admin.notices.dao.INoticesDao;
import com.bookstore.commons.beans.Notice;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class NoticesServiceImpl implements INoticesService {

    @Resource
    INoticesDao noticeDao;

    @Override
    public List<Notice> findNotices() {
        return noticeDao.selectNotices();
    }

    @Override
    public int removeNotice(String id) {
        return noticeDao.deleteNotices(id);
    }

    @Override
    public int addNotice(Notice notice) {
        return noticeDao.insertNotice(notice);
    }

    @Override
    public Notice findNoticeById(String id) {
        return noticeDao.selectNoticeById(id);
    }

    @Override
    public int editNotice(Notice notice) {
        return noticeDao.updateNotice(notice);
    }
}
