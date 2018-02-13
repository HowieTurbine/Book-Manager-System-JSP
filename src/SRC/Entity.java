package SRC;
public class Entity {
	private String name;
	private String author;
	private int number;
	private double price;
	public Entity(String name,String author,int number,double price)
	{
		this.name=name;
		this.author=author;
		this.number=number;
		this.price=price;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public int getNumber() {
		return number;
	}
	public void setNumber(int number) {
		this.number = number;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
}
