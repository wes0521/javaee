package com.bookstore.admin.products.handler;

import com.bookstore.admin.products.service.IAdminProductService;
import com.bookstore.commons.beans.Product;
import com.bookstore.commons.beans.ProductList;
import com.bookstore.utils.IdUtils;
import org.apache.commons.io.FileUtils;
import org.apache.poi.hssf.usermodel.*;
import org.apache.poi.ss.util.CellRangeAddress;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import sun.misc.BASE64Encoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;

@Controller
@RequestMapping("/admin/products")
public class AdminProductsHandler {

    @Autowired
    IAdminProductService adminProductService;

    //查询全部商品信息
    @RequestMapping("/listProduct")
    public String listProduct(Model model) {
        List<Product> products = adminProductService.findProduct();
        for (Product p : products) {
            System.out.println(p);
        }
        model.addAttribute("products", products);
        return "/admin/products/list.jsp";
    }

    //按多个条件查询商品
    @RequestMapping("/findProductByManyCondition")
    public String findProductByManyCondition(Product product, Double minprice, Double maxprice, Model model) {
        System.out.println("商品条件：" + product);
        System.out.println("最小价格：" + minprice);
        System.out.println("最大价格：" + maxprice);
        List<Product> products = adminProductService.findProductByManyCondition(product, minprice, maxprice);
        model.addAttribute("products", products);
        model.addAttribute("product", product);
        model.addAttribute("minprice", minprice);
        model.addAttribute("maxprice", maxprice);
        return "/admin/products/list.jsp";
    }

    //添加商品
    @RequestMapping("/addProduct")
    public String addProduct(Product product, MultipartFile upload, HttpSession session) throws IOException {
        //保存图片
        String path = session.getServletContext().getRealPath("/productImg");
        String path1 = "E:\\JavaEE\\Spring\\Spring_next\\bookstore\\src\\main\\webapp\\productImg";
        System.out.println("文件上传路径" + path);

        //文件上传路径不存在则创建对应目录
        File file = new File(path);
        if (!file.exists()) {
            file.mkdirs();
        }
        String filename = IdUtils.getUUID() + "-" + upload.getOriginalFilename();
        upload.transferTo(new File(path, filename));
        //文件拷贝
        FileUtils.copyFile(new File(path, filename), new File(path1, filename));

        //数据库添加
        product.setId(IdUtils.getUUID());
        product.setImgurl("/productImg/" + filename);
        adminProductService.addProduct(product);
        return "redirect:/admin/products/listProduct";
    }

    //编辑商品前先查询商品详细信息
    @RequestMapping("/findProductById")
    public String findProductById(String id, Model model) {
        Product product = adminProductService.findProductById(id);
        model.addAttribute("p", product);
        return "/admin/products/edit.jsp";
    }

    //修改的商品信息
    @RequestMapping("/editProduct")
    public String editProduct(Product product, MultipartFile upload, HttpSession session) throws IOException {
        System.out.println("修改的商品信息" + product);

        if (!upload.isEmpty()) {//如果上传了新图片
            //查找商品的原始信息
            Product target = adminProductService.findProductById(product.getId());
            //删除原始图片
            File targetFile = new File(session.getServletContext().getRealPath("/") + target.getImgurl());
            String path2 = "E:\\JavaEE\\Spring\\Spring_next\\bookstore\\src\\main\\webapp\\productImg";
            if (targetFile.exists()) {
                targetFile.delete();
            }

            //保存新图片
            String path = session.getServletContext().getRealPath("/productImg");
            String filename = IdUtils.getUUID() + "-" + upload.getOriginalFilename();
            upload.transferTo(new File(path, filename));
            FileUtils.copyFile(new File(path, filename), new File(path2, filename));
            //如果上传了新的图片，给product的imgurl赋新值
            product.setImgurl("/productImg/" + filename);
        }

        //修改数据库商品信息
        adminProductService.editProduct(product);
        return "redirect:/admin/products/listProduct";
    }

    //删除商品
    @RequestMapping("/removeProduct")
    public String removeProduct(String id, HttpSession session) {
        //查找商品的原始信息
        Product target = adminProductService.findProductById(id);
        File targetFile = new File(session.getServletContext().getRealPath("/") + target.getImgurl());
        //删除图片
        if (targetFile.exists()) {
            targetFile.delete();
        }
        adminProductService.removeProduct(id);
        return "redirect:/admin/products/listProduct";
    }

    //下载销售榜单
    @RequestMapping("/download")
    public void download(String year, String month, HttpServletResponse response, HttpServletRequest request) throws IOException {
        List<ProductList> plist = adminProductService.findProductSalList(year, month);
        for (ProductList pl : plist) {
            System.out.println(pl);
        }
        int col = 2;//列数
        String filename = year + "年" + month + "月份销售榜单";
        String sheetName = month + "月份销售榜单";
        String titleName = filename;
        String[] columnName = {"商品名称", "商品数量"};
        String[][] dataList = new String[plist.size()][col];
        for (int i = 0; i < plist.size(); i++) {
            dataList[i][0] = plist.get(i).getName();
            dataList[i][1] = plist.get(i).getSalnum();
        }
        //创建excel文件
        HSSFWorkbook wb = new HSSFWorkbook();
//        //设置格式
//        HSSFFont font = wb.createFont();
//        font.setFontHeightInPoints((short)10);            //设置字体的大小
//        font.setFontName("微软雅黑");                      //设置字体的样式，如：宋体、微软雅黑等
//        font.setItalic(false);                            //斜体true为斜体
//        HSSFCellStyle style = wb.createCellStyle();
//        style.setFont(font);

        //创建excel中的sheet
        HSSFSheet sheet = wb.createSheet(sheetName);
        //创建sheet的第一行
        HSSFRow row1 = sheet.createRow(0);
        //创建第一行的第一个单元格
        HSSFCell cell = row1.createCell(0);
        //合并第一行的两个单元格
        sheet.addMergedRegion(new CellRangeAddress(0, 0, 0, 1));
        //给第一行的第一个合并后的单元格赋值
        cell.setCellValue(titleName);
        //创建第二行
        HSSFRow row = sheet.createRow(1);
        for (int j = 0; j < col; j++) {
            row.createCell(j).setCellValue(columnName[j]);
        }
        //创建数据行
        for (int i = 0; i < dataList.length; i++) {
            row = sheet.createRow(i + 2);
            for (int j = 0; j < col; j++) {
                row.createCell(j).setCellValue(dataList[i][j]);
            }
           // row.createCell(col-1).getCellStyle().setAlignment(HorizontalAlignment.CENTER);
        }
        //定义文件的名称
        String fileName = filename + ".xls";
        response.setContentType("application/ms-excel;charset=utf-8");
        response.setHeader("content-Disposition", "attachment;filename = " + getFileName(request,fileName));
        OutputStream out = response.getOutputStream();
        wb.write(out);
    }
    //浏览器文件下载中文乱码
    public static String getFileName(HttpServletRequest request, String filename) throws UnsupportedEncodingException {
        // 获得请求头中的User-Agent
        String agent = request.getHeader("User-Agent");
        // 根据不同的客户端进行不同的编码
        if (agent.contains("MSIE")) {
            // IE浏览器
            filename = URLEncoder.encode(filename, "utf-8");
        } else if (agent.contains("Firefox")) {
            // 火狐浏览器
            BASE64Encoder base64Encoder = new BASE64Encoder();
            filename = "=?utf-8?B?" + base64Encoder.encode(filename.getBytes("utf-8")) + "?=";
        } else {
            // 其它浏览器
            filename = URLEncoder.encode(filename, "utf-8");
        }
        return filename;
    }
}
