package util;

import java.io.BufferedReader;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

public class HttpUtil {

	public static String getHttpResult(String urlStr, File file) {
		URL url = null;
		HttpURLConnection connection = null;
		try {
			//创建URL对象
			url = new URL(urlStr);
			//通过URL对象与服务端建立连接
			connection = (HttpURLConnection) url.openConnection();
			//设置输入输出，客户端请求到服务端需要发送数据流(输出流写出),服务端响应给客户端,客户端需要接受数据流(输入流读取)
			connection.setDoOutput(true);
			connection.setDoInput(true);
			connection.setRequestMethod("POST");
			// 如果是struts2的action接收请求必须设置此属性,否者接收不到数据流
			connection.setRequestProperty("content-type", "text/html");
			connection.setUseCaches(false);
			connection.connect();
			
			DataInputStream dis = new DataInputStream(new FileInputStream(file));
			byte[] bytes = new byte[dis.available()];
			dis.read(bytes);
			
			//将数据以流的方式写出到服务端
			DataOutputStream out = new DataOutputStream(connection.getOutputStream());
			out.write(bytes);
			out.flush();
			out.close();
			
			//接收服务端响应的数据流
			BufferedReader reader = new BufferedReader(new InputStreamReader(connection.getInputStream(), "utf-8"));
			StringBuffer buffer = new StringBuffer();
			String line = "";
			while ((line = reader.readLine()) != null) {
				buffer.append(line);
			}
			reader.close();
			return buffer.toString();
			
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (connection != null) {
				connection.disconnect();
			}
		}
		return null;
	}
	
	public static String getHttpResult(String urlStr, byte[] bytes) {
		URL url = null;
		HttpURLConnection connection = null;
		try {
			//创建URL对象
			url = new URL(urlStr);
			//通过URL对象与服务端建立连接
			connection = (HttpURLConnection) url.openConnection();
			//设置输入输出，客户端请求到服务端需要发送数据流(输出流写出),服务端响应给客户端,客户端需要接受数据流(输入流读取)
			connection.setDoOutput(true);
			connection.setDoInput(true);
			connection.setRequestMethod("POST");
			// 如果是struts2的action接收请求必须设置此属性,否者接收不到数据流
			connection.setRequestProperty("content-type", "text/html");
			connection.setUseCaches(false);
			connection.connect();
			
			//将数据以流的方式写出到服务端
			DataOutputStream out = new DataOutputStream(connection.getOutputStream());
			out.write(bytes);
			out.flush();
			out.close();
			
			//接收服务端响应的数据流
			BufferedReader reader = new BufferedReader(new InputStreamReader(connection.getInputStream(), "utf-8"));
			StringBuffer buffer = new StringBuffer();
			String line = "";
			while ((line = reader.readLine()) != null) {
				buffer.append(line);
			}
			reader.close();
			return buffer.toString();
			
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (connection != null) {
				connection.disconnect();
			}
		}
		return null;
	}

	public static void main(String[] args) {

		String result = getHttpResult("http://192.168.10.188:8090/httpImgServer/servlet/ServerServlet2?suffix=jpg",new File("e:/a.jpg"));
		System.out.println("请求完毕");
		System.out.println("客户端接收：" + result);
	
	}
}
