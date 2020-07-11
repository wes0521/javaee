package com.hrm.document.handler;

import com.hrm.commons.beans.Document;
import com.hrm.commons.beans.User;
import com.hrm.document.service.IDocumentService;
import com.hrm.utils.PageModel;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import sun.misc.BASE64Encoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.nio.charset.Charset;
import java.util.List;

@Controller
@RequestMapping("/document")
public class DocumentHandler {

    @Autowired
    private IDocumentService documentService;

    //查询文档
    @RequestMapping("/findDocument")
    public String findDocument(@RequestParam(defaultValue = "1") int pageIndex, String title, Model model){
        //System.out.println(title);
        PageModel pageModel = new PageModel();
        int recordCount = documentService.findDocumentCount(title);
        pageModel.setRecordCount(recordCount);
        //int i = 1/0;
        pageModel.setPageSize(4);
        pageModel.setPageIndex(pageIndex);
        List<Document> documents = documentService.findDocument(title,pageModel);
        /*for (Document d:documents){
            System.out.println(d);
        }*/
        model.addAttribute("documents",documents);
        model.addAttribute("pageModel",pageModel);
        model.addAttribute("title",title);
        return "/jsp/document/document.jsp";
    }

    //上传文件
    @RequestMapping("/addDocument")
    public String addDocument(Document document, HttpSession session,Model model) throws IOException {
        //System.out.println(document);
        //保存上传文件到服务器
        String path = "E:\\JavaEE\\Spring\\Spring_next\\hrm\\hrm1\\src\\main\\upload";

        File file = new File(path);
        if (!file.exists()){//如果路径不存在，就创建
            file.mkdirs();
        }
        //获取原始文件的名称:重名文件不被覆盖
        String filename = System.currentTimeMillis() + "-" + document.getFile().getOriginalFilename();
        //定义保存的文件就是把MutilpartFile转换为File,保存到服务器对于地址
        document.getFile().transferTo(new File(path,filename));

        //为文件名称赋值
        document.setFilename(filename);
        System.out.println("filename-->"+filename);
        //获取当前登录用户，就是上传文档者
        User login_user = (User) session.getAttribute(  "login_user");
        document.setUser(login_user);
        int rows = documentService.addDocument(document);
        if (rows > 0){
            PageModel pageModel = new PageModel();
            int recordCount = documentService.findDocumentCount(null);
            pageModel.setRecordCount(recordCount);
            return "redirect:/document/findDocument?pageIndex="+pageModel.getTotalSize();
        }
        else{
            model.addAttribute("fail","文档上传失败！");
            return "/jsp/fail.jsp";
        }
    }

    //修改文档
    @RequestMapping("/modifyDocument")
    public String modifyDocument(String flag,int pageIndex,Document document,Model model) throws IOException {
        if (flag == null){
            //按照id查询原始文档信息
            document = documentService.findDocumentById(document.getId());
            model.addAttribute("document",document);
            model.addAttribute("pageIndex",pageIndex);
            return "/jsp/document/showUpdateDocument.jsp";
        }
        else{
            System.out.println(document);
            //判断修改文档信息时是否上传了文件
            if (!document.getFile().isEmpty()){
                String path = "E:\\JavaEE\\Spring\\Spring_next\\hrm\\hrm1\\src\\main\\upload";
                //获取原始目标文件信息
                Document target = documentService.findDocumentById(document.getId());
                //判断原始文件是否存在
                File targetFile = new File(path,target.getFilename());
                if (targetFile.exists()){
                    //删除该数据库描述信息对应的原始文件
                    targetFile.delete();
                }
                //把修改后接收到的新文件保存在服务器
                //获取原始文件的名称:重名文件不被覆盖
                String filename = System.currentTimeMillis() + "-" + document.getFile().getOriginalFilename();
                //定义保存的文件就是把MutilpartFile转换为File,保存到服务器对于地址
                document.getFile().transferTo(new File(path,filename));
                //为文件名称赋值
                document.setFilename(filename);
            }
            int rows = documentService.modifyDocument(document);
            if(rows > 0){
                return "redirect:/document/findDocument?pageIndex="+pageIndex;
            }
            else{
                model.addAttribute("fail","文档信息修改失败！");
                return "/jsp/fail.jsp";
            }
        }
    }

    //下载文件
    @RequestMapping("/downLoad")
    public ResponseEntity<Object> downLoad(int id,HttpServletRequest request) throws IOException {
        String path = "E:\\JavaEE\\Spring\\Spring_next\\hrm\\hrm1\\src\\main\\upload";
        Document targetDocument = documentService.findDocumentById(id);
        String filename = targetDocument.getFilename();
        //获取下载的目标文件
        File file = new File(path,filename);
        //filename = new String(filename.getBytes("UTF-8"),"iso8859-1");
        //如果下载的文件存在
        if (file.exists()){
            filename = getFileName(request,filename);
            //设置响应头的响应内容类型
            HttpHeaders headers = new HttpHeaders();
            headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
            headers.setContentDispositionFormData("attachment",filename);
            return new ResponseEntity<Object>(FileUtils.readFileToByteArray(file),headers, HttpStatus.OK);
        }
        else {
            String error = "下载的文件不存在！";
            // 设置响应头的内容为html
            HttpHeaders headers = new HttpHeaders();
            MediaType mediaType = new MediaType("text","html", Charset.forName("utf-8"));
            headers.setContentType(mediaType);
            return new ResponseEntity<Object>(error,headers,HttpStatus.OK);
        }
    }

    //浏览器文件下载乱码问题
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

    //删除文档
    @RequestMapping("/removeDocument")
    public String removeDocument(Integer[] ids,Model model){
        int rows = 0;
        String path = "E:\\JavaEE\\Spring\\Spring_next\\hrm\\hrm1\\src\\main\\upload";
        //查找要删除的目标文档
        for (Integer id:ids){
            Document target = documentService.findDocumentById(id);
            File targetFile = new File(path,target.getFilename());
            //如果目标文档存在，从服务器删除文件
            if (targetFile.exists()){
                targetFile.delete();
            }
            //删除文档对应的数据库信息
            int i = documentService.removeDocument(id);
            if (i > 0){
                rows++;
            }
        }
        if (rows == ids.length){
            return "redirect:/document/findDocument";
        }
        else{
            model.addAttribute("fail","文档删除失败！");
            return "/jsp/fail.jsp";
        }
    }

}
