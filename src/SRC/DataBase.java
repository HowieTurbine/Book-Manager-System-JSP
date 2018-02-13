package SRC;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class DataBase {
	List<Entity> list=new ArrayList<>();

	private Connection conn;
	private java.sql.Statement stmt;
	ResultSet rs;
	List<Entity> ls=new ArrayList<>();;
	
		public DataBase()
		{
			try {
				Class.forName("com.mysql.jdbc.Driver");// 第一步,加载类
				//long start=System.currentTimeMillis();
				conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/bookmanager?characterEncoding=utf8&useSSL=true","root","qq1996002008");//第二步，建立连接
				//long end=System.currentTimeMillis();
				stmt=conn.createStatement();
				//System.out.println(conn);
				//System.out.println("耗时"+(end-start)+"ms");//建立连接是很耗时间的,后期会改用连接池来做
	
				
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		public List<Entity> getEntity()
		{
			ls=new ArrayList<>();
			String sql="SELECT name,author,number,price FROM book where 1";
			try {
				stmt.execute(sql);
				rs=stmt.getResultSet();
				
				while(rs.next())
				{
					String name=rs.getString(1);
					String author=rs.getString(2);
					int number=Integer.parseInt(rs.getString(3));
					double price=Double.parseDouble(rs.getString(4));
					ls.add(new Entity(name,author,number,price));
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				System.out.print(stmt==null);
				System.out.print(rs==null);
			}
			return ls;
			
		}
		public void addEntity(String name,String author,double price,int number)
		{
			
			String sql="insert into book (name,author,number,price) values ('" + name + "','"
					+ author + "' ,'" + number + "','" + price + "') "
					+ "ON DUPLICATE KEY UPDATE number=number+" + number + ", price=price+" + price + ";";
			try {
				stmt.execute(sql);
				
				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				System.out.print(stmt==null);
				System.out.print(rs==null);
			}
			
		}
		public void deleteEntity(String name,String author)
		{
			
			String sql="delete from book WHERE name='" + name + "' AND author='" + author + "';";
			try {
				stmt.execute(sql);
				
				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				System.out.print(stmt==null);
				System.out.print(rs==null);
			}
			
		}
		public void modifyEntity(String name,String author,double price,int number)
		{
			
			String sql="UPDATE book set number=" + number + " ,price=" + price + " WHERE name='" + name
					+ "' AND author='" + author + "'";
			try {
				stmt.execute(sql);
				
				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				System.out.print(stmt==null);
				System.out.print(rs==null);
			}
			
		}
		public List<Entity> searchByAuthor(String author)
		{
			ls=new ArrayList<>();
			String sql="SELECT name,author,number,price FROM book where author='" + author + "'";
			try {
				stmt.execute(sql);
				rs=stmt.getResultSet();
				
				while(rs.next())
				{
					String name1=rs.getString(1);
					String author1=rs.getString(2);
					int number=Integer.parseInt(rs.getString(3));
					double price=Double.parseDouble(rs.getString(4));
					ls.add(new Entity(name1,author1,number,price));
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				System.out.print(stmt==null);
				System.out.print(rs==null);
			}
			return ls;
			
		}
		public List<Entity> searchByName(String name)
		{
			ls=new ArrayList<>();
			String sql="SELECT name,author,number,price FROM book where name='" + name + "'";
			try {
				stmt.execute(sql);
				rs=stmt.getResultSet();
				
				while(rs.next())
				{
					String name1=rs.getString(1);
					String author1=rs.getString(2);
					int number=Integer.parseInt(rs.getString(3));
					double price=Double.parseDouble(rs.getString(4));
					ls.add(new Entity(name1,author1,number,price));
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				System.out.print(stmt==null);
				System.out.print(rs==null);
			}
			return ls;
			
		}
		
		public Connection getConn() {
			return conn;
		}
		public java.sql.Statement  getStmt() {
			return  stmt;
		}
		
}
