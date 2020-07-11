package com.hrm.document.service;

import com.hrm.commons.beans.Document;
import com.hrm.document.dao.IDocumentDao;
import com.hrm.utils.PageModel;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class DocumentServiceImpl implements IDocumentService {

    @Resource
    private IDocumentDao documentDao;

    @Override
    public List<Document> findDocument(String title, PageModel pageModel) {
        Map map = new HashMap();
        map.put("title",title);
        map.put("start",pageModel.getFirstLimitParam());
        map.put("pageSize",pageModel.getPageSize());
        return documentDao.selectDocument(map);
    }

    @Override
    public int findDocumentCount(String title) {
        return documentDao.selectDocumentCount(title);
    }

    @Override
    public int addDocument(Document document) {
        return documentDao.insertDocument(document);
    }

    @Override
    public int modifyDocument(Document document) {
        return documentDao.updateDocument(document);
    }

    @Override
    public Document findDocumentById(Integer id) {
        return documentDao.selectDocumentById(id);
    }

    @Override
    public int removeDocument(Integer id) {
        return documentDao.deleteDocument(id);
    }

}
