package com.sdm.service;

import com.sdm.commons.beans.Announcement;
import com.sdm.dao.IAnnouncementDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * company: www.abc.com
 * Author: Administrator
 * Create Data: 2019/12/24 0024
 */
@Service
public class AnnouncementServiceImpl implements IAnnouncementService {

    @Autowired
    private IAnnouncementDao announcementDao;

    @Autowired
    public void setAnnouncementDao(IAnnouncementDao announcementDao){
        this.announcementDao=announcementDao;
    }

    @Override
    public List<Announcement> findAnnouncement() {
        return announcementDao.selectAnnouncement();
    }

    @Override
    public int deleteAnno(int anno_id) {
        return announcementDao.deleteAnnoById(anno_id);
    }

    @Override
    public void addAnno(Announcement announcement) {
        announcementDao.addAnnos(announcement);
    }

    @Override
    public int modifyById(Announcement announcement) {
        return announcementDao.updateAnnoById(announcement);
    }

    @Override
    public Announcement findAnnoById(String id) {
        return announcementDao.findAnnoById(id);
    }

    @Override
    public List<String> findAllId() {
        return announcementDao.findAllId();
    }
}
