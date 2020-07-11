package com.bookstore.utils;

import java.io.FileWriter;
import java.io.IOException;

public class AlipayConfig {
    //↓↓↓↓↓↓↓↓↓↓请在这里配置您的基本信息↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓
    // 应用ID,您的APPID，收款账号既是您的APPID对应支付宝账号
    public static String app_id = "2016102200738347";

    // 商户私钥，您的PKCS8格式RSA2私钥
    public static String merchant_private_key = "MIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCOvwtZFPsAcRU2qQouEknhrIOq9zNFL4Z2s3ulb8imBgmxODV+IDc7o0JhEuDDtAXVONLaZ3/l8TiTFqenfwqkaadXZUYIQKH0e7NlJwxjoumae8warXSXOYsuzdXOmtnq2klzFdue6q0QAPqMJwdrNcUT6JksybUn8wRwPw5w79TAHUQMpUrPpyENPn03mOrpItuDlyqv/cYbXWDFXa5/HHBjv9fDIjaq/ugeiOqukgB2VOBCtnUKZrxFmN/U5KNF3chwFMvVKniAiZ1+VUxnuVxIPnAEPeKxMZPgInH/kiXbV2N9sJ0qV82Cz/o+UDX6pYE2zwHpqErg0XM+Fl4zAgMBAAECggEAMj8jYncVJ4Gmwvfbwn3jjdGpA1xCqt7gyRXCt2hSy8YiUUSE5+G1L4P3UK5RefH7f6Oh7QkzpyAzFuuJllcMyvT517SpYyxFFgcZDckh/kyRSDS9ksJt4PF7gb0ovrIZdSbjZeRSy2y2AIUnrH/sh5uExM5CZNaXsvlDHbPEhJIPcC/j/9VQiJHI5vbV0ODszIf9JsLHgruuewDmdOlXcCZZ1lFFBV+A3JtKHLQ6+RC3TCLllrfILHMS4ncJ3K9XxTV4ye+iGe/PdJ29otEAmREdD1w53JboJfSExIiNzYeMD83tQSmZH8cPJNuCCjW+TFWHFmPszyDw9k4exSN+qQKBgQDcgUoWmq1jXGkla1jyjcjBPd9eKQKrXTQ6JCXbFSbhKCOoBD+3p0JRjNcOsIDP7A4VWm8mhhRmN2bmkQPX49lSrPIM5+yo6zrvuDSKXfsp2Vn9rWXhg3wdpUjjh8/wvmwYTNeaOhpmrbk5WUfiddrOP5uZ11L45tXs/eSMTfTpPQKBgQCluWwpIaelPvLn0NF6/1HKxbMKqum+GvduWdU9pdRSelGMhMv7U2j0BSFCwLwgP+fHDlWh1n8R35StU/ilfaSKBNlVYM03kgOVHiqi7ZYwKRS9ZwqRqu26ePQC0YK336rePAlS0r3WaibaQLH5g17FwX/IuTzyGx28zwQmWB58LwKBgFo1PlUPBF4AwTdAukvIe1eq80V3K5NldudOQHpnJde47xVeX57He1cXciedR6VIId7Ud2JgOdozUhKDQvpASXkMLZ3gB653RU4qorv0hLrzI2CnXmWqv8z1AGOs/QG1NU2fqhh7Kq/U5FC02LapllEILqT6NQSEkwH4QFax0b7VAoGAKYqtXjIdgAKjiRCDMj3GFvovw0DMjubbl0HVfjqPWo1m275+E2X5LRIMIFuHzN24D+G7/XFzMNvGvRwLfBBeqmpEwG4fgwqK81o4fdboivIBTOkDcThTlyayo/I4vjbG8iZCgAxroc/CJXuKIW2Y2CGFEp+8c0Pw1F9gPuxf1+kCgYEAp9wKc0ajMbRhq2/cflcCVU0uOu1f2Immi6j9acwmI8MJkVw4qH/+MuCRUfCAfkC1SHWy1sUjE8dMrSrJySSdBUnMDMuOqmj3JUGEXmBZ8tcVlgz5qU+3bdBNNYt0zm5MIRrGn3ZuqgPK+c6ZFc8mwn76xPg+sDHtJvG6jT8uYLk=";

    // 支付宝公钥,查看地址：https://openhome.alipay.com/platform/keyManage.htm 对应APPID下的支付宝公钥。
    public static String alipay_public_key = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAoPCZ75kYWhu9n9Je7QpZP2QwRwrptapU3Y7s+2h7GaSTacFsauIY2QsHHdXLZLIQIfk+DF46CzIwVH+OJj4Sra+jZPaa/UJHlP9r5i564SzHUfSn/HcADIe0wk3MCvV/WVGQGILcDA91QRB3NOKWy+dRpc0FDp4lRJczsbQIu+hZDzCAvTwcxET3VZjHc3hcuk405EZjWeA7FZZXt4Cer2lpf3inpJ3G/avy9ysCOqy1TpXnKg4fnA0z+ZYWBB0Bq4iJCR4PcfXinTpobz7b1YTWyVkfhVZtZHh5iOZlHxnC04d4hh8w3y0rUt1bsNZfI9dSq5fOKItId7UIQ0pe0wIDAQAB";

    // 服务器异步通知页面路径  需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
    public static String notify_url = "http://工程公网访问地址/alipay.trade.page.pay-JAVA-UTF-8/notify_url.jsp";

    // 页面跳转同步通知页面路径 需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
    public static String return_url = "http://localhost:8080/bookstore_war/client/order/paysuccess";

    // 签名方式
    public static String sign_type = "RSA2";

    // 字符编码格式
    public static String charset = "utf-8";

    // 支付宝网关
    public static String gatewayUrl = "https://openapi.alipaydev.com/gateway.do";

    // 支付宝网关
    public static String log_path = "C:\\";


//↑↑↑↑↑↑↑↑↑↑请在这里配置您的基本信息↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑

    /**
     * 写日志，方便测试（看网站需求，也可以改成把记录存入数据库）
     * @param sWord 要写入日志里的文本内容
     */
    public static void logResult(String sWord) {
        FileWriter writer = null;
        try {
            writer = new FileWriter(log_path + "alipay_log_" + System.currentTimeMillis()+".txt");
            writer.write(sWord);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (writer != null) {
                try {
                    writer.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}
