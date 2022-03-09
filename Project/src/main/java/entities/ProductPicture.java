package entities;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

@Entity
public class ProductPicture
{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	private String photoName;
	@ManyToOne(cascade = CascadeType.ALL)
	private ImgColor color;
	@ManyToOne(cascade = CascadeType.ALL)
	private Product product;
	
	public ProductPicture(String photoName, ImgColor color, Product product) {
		super();
		this.photoName = photoName;
		this.color = color;
		this.product = product;
	}
	public Long getId() {
		return id;
	}
	public String getPhotoName() {
		return photoName;
	}
	public void setPhotoName(String photoName) {
		this.photoName = photoName;
	}
	public ImgColor getColor() {
		return color;
	}
	public void setColor(ImgColor color) {
		this.color = color;
	}
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	public void setId(Long id) {
		this.id = id;
	}
	@Override
	public String toString() {
		return "ProductPicture [id=" + id + ", photoName=" + photoName + ", color=" + color + ", product=" + product
				+ "]";
	}
}
