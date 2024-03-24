package entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.UniqueConstraint;

@Entity
@Table(name = "Favorites", uniqueConstraints = {
		@UniqueConstraint(columnNames = {"VideoId","UserId"})
})
public class Favorites {
	@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	@ManyToOne @JoinColumn(name = "UserId")
	private Users user;
	@ManyToOne @JoinColumn(name = "VideoId")
	private Videos video;
	@Temporal(TemporalType.DATE)
	private Date likeDate = new Date();
	
	
	
	public Favorites() {
		super();
	}

	public Favorites(Users user, Videos video, Date likeDate) {
		super();
		this.user = user;
		this.video = video;
		this.likeDate = likeDate;
	}


	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Users getUser() {
		return user;
	}

	public void setUser(Users user) {
		this.user = user;
	}

	public Videos getVideo() {
		return video;
	}

	public void setVideo(Videos video) {
		this.video = video;
	}

	public Date getLikeDate() {
		return likeDate;
	}

	public void setLikeDate(Date likeDate) {
		this.likeDate = likeDate;
	}
	
}
