package entity;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedNativeQueries;
import javax.persistence.NamedNativeQuery;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@NamedQueries({
	@NamedQuery(name = "Video.findByKeyWord", query = "SELECT DISTINCT o.video FROM Favorites o WHERE o.video.title LIKE :keyword"),
	@NamedQuery(name = "Video.findInRange", query = "SELECT DISTINCT o.video FROM Favorites o WHERE o.likeDate BETWEEN :min AND :max"),
	@NamedQuery(name = "Video.findInMonths", query = "SELECT DISTINCT o.video FROM Favorites o WHERE month(o.likeDate) IN (:months)")
})

@NamedNativeQueries({
	@NamedNativeQuery(name = "Report.random10",
			query = "SELECT TOP 3 * FROM Videos ORDER BY newid()",
			resultClass = Videos.class)
})

@Entity
@Table(name = "Videos")
public class Videos {
	@Id
	private String id;
	private String title;
	private String poster;
	private String description;
	private Integer views = 0;
	private Boolean active = true;
	private String href;

	@OneToMany(mappedBy = "video")
	List<Favorites> favorites;

	public Videos() {
		super();
	}

	public Videos(String id, String title, String poster, String description, Integer views, Boolean active,
			String href, List<Favorites> favorites) {
		super();
		this.id = id;
		this.title = title;
		this.poster = poster;
		this.description = description;
		this.views = views;
		this.active = active;
		this.href = href;
		this.favorites = favorites;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getPoster() {
		return poster;
	}

	public void setPoster(String poster) {
		this.poster = poster;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Integer getViews() {
		return views;
	}

	public void setViews(Integer views) {
		this.views = views;
	}

	public Boolean getActive() {
		return active;
	}

	public void setActive(Boolean active) {
		this.active = active;
	}

	public String getHref() {
		return href;
	}

	public void setHref(String href) {
		this.href = href;
	}

	public List<Favorites> getFavorites() {
		return favorites;
	}

	public void setFavorites(List<Favorites> favorites) {
		this.favorites = favorites;
	}

}
