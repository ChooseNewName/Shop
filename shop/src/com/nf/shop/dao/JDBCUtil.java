package com.nf.shop.dao;

import java.lang.reflect.*;
import java.sql.*;
import java.util.*;

/*
 *数据层：连接访问操作数据库的类
 */
public class JDBCUtil {
	
	//驱动
	public static String driver = "org.mariadb.jdbc.Driver";
	//连接字符串
	public static String url = "jdbc:mariadb://localhost:3306/shopdata";
	//用户名
	public static String name = "root";
	//密码
	public static String pwd = "123456";

	//加载驱动
	static{
		try {
			Class.forName(driver);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	//获取连接对象的方法
	public static Connection getConn() {
		try {
			return DriverManager.getConnection(url, name, pwd);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	//释放资源的方法
	public static void close(Connection conn,Statement stmt,ResultSet rs) {
		try {
			if(rs!=null) rs.close();
			if(stmt!=null) stmt.close();
			if(conn!=null) conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	//执行增删改的方法
	public static int execUpdate(String sql){
		//获取连接对象
		Connection conn = getConn();
		//定义语句执行对象
		Statement stmt = null;
		
		try {
			//获取语句执行对象
			stmt = conn.createStatement();
			//发送接收到的语句到数据库并执行
			return stmt.executeUpdate(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			//释放资源
			close(conn,stmt,null);
		}
		
		return 0;
	}
	
	//执行增删改的方法(预编译)
	public static int preparedUpdate(String sql,Object...args){
		//获取连接对象
		Connection conn = getConn();
		//定义语句执行对象(预编译)
		PreparedStatement stmt = null;
		
		try {
			//获取语句执行对象(预编译)
			stmt = conn.prepareStatement(sql);
			
			//设置参数
			for (int i = 0; i < args.length; i++) {
				stmt.setObject(i+1, args[i]);
			}
			
			//发送接收到的语句到数据库并执行
			return stmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			//释放资源
			close(conn,stmt,null);
		}
		
		return 0;
	}
	
	//执行查询的方法(预编译)
	public static <T> List<T> preparedQuery(Class<T> classObj,String sql,Object...args){
				
		//获取连接对象
		Connection conn = getConn();
		//定义语句执行对象(预编译)
		PreparedStatement stmt = null;
		//定义结果集对象
		ResultSet rs = null;
		
		try {
			//获取语句执行对象(预编译)
			stmt = conn.prepareStatement(sql);
			
			//设置参数
			for (int i = 0; i < args.length; i++) {
				stmt.setObject(i+1, args[i]);
			}
			
			//发送接收到的语句到数据库并执行
			rs = stmt.executeQuery();
			
			//获取结果集的所有列信息的对象
			ResultSetMetaData rsmd = rs.getMetaData();
			
			List<T> list = new ArrayList<T>();
			
			while(rs.next()){
				
				//通过反射动态获取类信息来创建对象
				T obj = (T)classObj.getConstructor().newInstance();
				
				//根据总列数，对所有列进行循环
				for (int i = 1; i <= rsmd.getColumnCount(); i++) {
					//获取第i列的列名
					String fieldName = rsmd.getColumnName(i);
					String typeName = rsmd.getColumnTypeName(i);
					//通过反射获取对象的某个属性
					Field field = classObj.getDeclaredField(fieldName);
					field.setAccessible(true);
					//给某个对象的某个属性赋值
					if("date".equals(typeName)){
						field.set(obj, rs.getString(i));
					}else if("decimal".equals(typeName)){
						field.set(obj, rs.getBigDecimal(i));
					}else if("money".equals(typeName)){
						field.set(obj, rs.getDouble(i));
					}else{
						field.set(obj, rs.getObject(i));
					}
				}
				
				list.add(obj);
			}
			
			return list;
			
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			//释放资源
			close(conn,stmt,rs);
		}
		
		return null;
	}
	
	/*
	//执行查询的方法(预编译和注解)
	public static <T> List<T> preparedQuery(Class<T> classObj,String sql,Object...args){
		//获取连接对象
		Connection conn = getConn();
		//定义语句执行对象(预编译)
		PreparedStatement stmt = null;
		//定义结果集对象
		ResultSet rs = null;
		
		try {
			//获取语句执行对象(预编译)
			stmt = conn.prepareStatement(sql);
			
			//设置参数
			for (int i = 0; i < args.length; i++) {
				stmt.setObject(i+1, args[i]);
			}
			
			//发送接收到的语句到数据库并执行
			rs = stmt.executeQuery();
			
			//获取结果集的所有列信息的对象
			ResultSetMetaData rsmd = rs.getMetaData();
			
			List<T> list = new ArrayList<T>();
			
			while(rs.next()){
				//通过反射动态获取类信息来创建对象
				T obj = classObj.getConstructor().newInstance();
				//循环一次取当前行的一列数据
				for (int i = 1; i <= rsmd.getColumnCount(); i++) {
					//获取第i列的列名
					String dbFieldName = rsmd.getColumnName(i);
					//通过反射获取对象的所有属性
					Field[] fields = classObj.getDeclaredFields();
					
					for(Field field : fields){
						//判断当前属性上是否有FieldName类型的注解
						if(field.isAnnotationPresent(FieldName.class)){
							//获取注解信息
							String fieldName = field.getAnnotation(FieldName.class).value();
							//断注解的值是否与数据库表的字段名一致
							if(dbFieldName.equals(fieldName)){
								field.setAccessible(true);
								field.set(obj, rs.getObject(i));
								break;
							}
						}
					}
				}
				
				list.add(obj);
			}
			
			return list;
			
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			//释放资源
			close(conn,stmt,rs);
		}
		
		return null;
	}
	*/
}
