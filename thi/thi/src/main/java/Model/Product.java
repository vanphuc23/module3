package Model;

public class Product {
    private int id_product;
    private String name;

    private double price;
    private int number;
    private String color;
    private String mota;
    private Category category;

    public Product(int id_product, String name, double price, int number, String color, String mota, Category category) {
        this.id_product = id_product;
        this.name = name;
        this.price = price;
        this.number = number;
        this.color = color;
        this.mota = mota;
        this.category = category;
    }

    public Product(String name, double price, int number, String color, String mota, Category category) {
        this.name = name;
        this.price = price;
        this.number = number;
        this.color = color;
        this.mota = mota;
        this.category = category;
    }

    public Product(int id_product, String name, double price, int number, String color, String mota) {
        this.id_product = id_product;
        this.name = name;
        this.price = price;
        this.number = number;
        this.color = color;
        this.mota = mota;
    }

    public int getId_product() {
        return id_product;
    }

    public void setId_product(int id_product) {
        this.id_product = id_product;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getNumber() {
        return number;
    }

    public void setNumber(int number) {
        this.number = number;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public String getMota() {
        return mota;
    }

    public void setMota(String mota) {
        this.mota = mota;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }
}
