package db;

import java.io.Serializable;
import java.util.Collection;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Version;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

@Entity
@Table(name = "plants")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Plant.findAll", query = "SELECT p FROM Plant p"),
    @NamedQuery(name = "Plant.findByPlantsId", query = "SELECT p FROM Plant p WHERE p.plantsId = :plantsId"),
    @NamedQuery(name = "Plant.findByName", query = "SELECT p FROM Plant p WHERE p.name like :name"),
    @NamedQuery(name = "Plant.findByLocation", query = "SELECT p FROM Plant p WHERE p.location = :location"),
    @NamedQuery(name = "Plant.findByWatering", query = "SELECT p FROM Plant p WHERE p.watering = :watering"),
    @NamedQuery(name = "Plant.findByPicturePath", query = "SELECT p FROM Plant p WHERE p.picturePath = :picturePath"),
    @NamedQuery(name = "Plant.findByOrderBiology", query = "SELECT p FROM Plant p WHERE p.orderBiology = :orderBiology"),
    @NamedQuery(name = "Plant.findByFamilyBiology", query = "SELECT p FROM Plant p WHERE p.familyBiology = :familyBiology"),
    @NamedQuery(name = "Plant.findBySubfamilyBiology", query = "SELECT p FROM Plant p WHERE p.subfamilyBiology = :subfamilyBiology"),
    @NamedQuery(name = "Plant.findByGrowingHeight", query = "SELECT p FROM Plant p WHERE p.growingHeight = :growingHeight"),
    @NamedQuery(name = "Plant.findByCareRecommendations", query = "SELECT p FROM Plant p WHERE p.careRecommendations = :careRecommendations"),
    @NamedQuery(name = "Plant.findByVersion", query = "SELECT p FROM Plant p WHERE p.version = :version")})
public class Plant implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "plants_id")
    private Integer plantsId;
    @Size(max = 40)
    private String name;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 999)
    private String location;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 40)
    private String watering;
    @Size(max = 999)
    @Column(name = "picture_path")
    private String picturePath;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 40)
    @Column(name = "order_biology")
    private String orderBiology;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 40)
    @Column(name = "family_biology")
    private String familyBiology;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 40)
    @Column(name = "subfamily_biology")
    private String subfamilyBiology;
    @Basic(optional = false)
    @NotNull
    @Column(name = "growing_height")
    private int growingHeight;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 40)
    @Column(name = "care_recommendations")
    private String careRecommendations;
    @Basic(optional = false)
    @NotNull
    @Version
    private int version;
    @JoinColumn(name = "created_by", referencedColumnName = "user_id")
    @ManyToOne(optional = false)
    private User createdBy;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "plantsFk")
    private Collection<UserPlant> userPlantCollection;

    public Plant() {
    }

    public Plant(Integer plantsId) {
        this.plantsId = plantsId;
    }

    public Plant(String name, String location, String watering, String orderBiology, String familyBiology, String subfamilyBiology, Integer growingHeight, String careRecommendations, String picturePath, User user) {
        this.name = name;
        this.location = location;
        this.watering = watering;
        this.orderBiology = orderBiology;
        this.familyBiology = familyBiology;
        this.subfamilyBiology = subfamilyBiology;
        this.growingHeight = growingHeight;
        this.careRecommendations = careRecommendations;
        this.picturePath = picturePath;
        this.createdBy = user;
    }

    public Integer getPlantsId() {
        return plantsId;
    }

    public void setPlantsId(Integer plantsId) {
        this.plantsId = plantsId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getWatering() {
        return watering;
    }

    public void setWatering(String watering) {
        this.watering = watering;
    }

    public String getPicturePath() {
        return picturePath;
    }

    public void setPicturePath(String picturePath) {
        this.picturePath = picturePath;
    }

    public String getOrderBiology() {
        return orderBiology;
    }

    public void setOrderBiology(String orderBiology) {
        this.orderBiology = orderBiology;
    }

    public String getFamilyBiology() {
        return familyBiology;
    }

    public void setFamilyBiology(String familyBiology) {
        this.familyBiology = familyBiology;
    }

    public String getSubfamilyBiology() {
        return subfamilyBiology;
    }

    public void setSubfamilyBiology(String subfamilyBiology) {
        this.subfamilyBiology = subfamilyBiology;
    }

    public int getGrowingHeight() {
        return growingHeight;
    }

    public void setGrowingHeight(int growingHeight) {
        this.growingHeight = growingHeight;
    }

    public String getCareRecommendations() {
        return careRecommendations;
    }

    public void setCareRecommendations(String careRecommendations) {
        this.careRecommendations = careRecommendations;
    }

    public int getVersion() {
        return version;
    }

    public void setVersion(int version) {
        this.version = version;
    }

    public User getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(User createdBy) {
        this.createdBy = createdBy;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (plantsId != null ? plantsId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Plant)) {
            return false;
        }
        Plant other = (Plant) object;
        if ((this.plantsId == null && other.plantsId != null) || (this.plantsId != null && !this.plantsId.equals(other.plantsId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "db.Plant[ plantsId=" + plantsId + " ]";
    }

    @XmlTransient
    public Collection<UserPlant> getUserPlantCollection() {
        return userPlantCollection;
    }

    public void setUserPlantCollection(Collection<UserPlant> userPlantCollection) {
        this.userPlantCollection = userPlantCollection;
    }
}
