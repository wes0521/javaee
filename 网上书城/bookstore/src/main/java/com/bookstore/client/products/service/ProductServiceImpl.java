package com.bookstore.client.products.service;

import com.bookstore.client.products.dao.IProductDao;
import com.bookstore.commons.beans.Notice;
import com.bookstore.commons.beans.Product;
import com.bookstore.utils.PageModel;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class ProductServiceImpl implements IProductService {

    @Resource
    IProductDao productDao;

    @Override
    public List<Product> findProductByCategory(String category, PageModel pageModel) {
        return productDao.selectProductByCategory(category,pageModel);
    }

    @Override
    public int findProductCountByCategory(String category) {
        return productDao.selectProductCountByCategory(category);
    }

    @Override
    public List<Product> findProductByName(String name, PageModel pageModel) {
        return productDao.selectProductByName(name,pageModel);
    }

    @Override
    public int findProductCountByName(String name) {
        return productDao.selectProductCountByName(name);
    }

    @Override
    public Product findProductById(String id) {
        return productDao.selectProductById(id);
    }

    @Override
    public Notice findNoticeRecent() {
        return productDao.selectNoticeRecent();
    }

    @Override
    public List<Product> findWeekHotProduct() {
        return productDao.selectWeekHotProduct();
    }
}
