package db;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Version;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

@Entity
@Table(name = "user_plants")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "UserPlant.findAll", query = "SELECT u FROM UserPlant u"),
    @NamedQuery(name = "UserPlant.findByUserPlantsId", query = "SELECT u FROM UserPlant u WHERE u.userPlantsId = :userPlantsId"),
    @NamedQuery(name = "UserPlant.findByUserPlantName", query = "SELECT u FROM UserPlant u WHERE u.userPlantName like :userPlantName"),
    @NamedQuery(name = "UserPlant.findByUserPlantPicturePath", query = "SELECT u FROM UserPlant u WHERE u.userPlantPicturePath = :userPlantPicturePath"),
    @NamedQuery(name = "UserPlant.findByHealth", query = "SELECT u FROM UserPlant u WHERE u.health = :health"),
    @NamedQuery(name = "UserPlant.findByWaterlevel", query = "SELECT u FROM UserPlant u WHERE u.waterlevel = :waterlevel"),
    @NamedQuery(name = "UserPlant.findByPlanted", query = "SELECT u FROM UserPlant u WHERE u.planted = :planted"),
    @NamedQuery(name = "UserPlant.findByUserFk", query = "SELECT u FROM UserPlant u WHERE u.userFk = :userFk"),
    @NamedQuery(name = "UserPlant.findByVersion", query = "SELECT u FROM UserPlant u WHERE u.version = :version")})
public class UserPlant implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "user_plants_id")
    private Integer userPlantsId;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 40)
    @Column(name = "user_plant_name")
    private String userPlantName;
    @Size(max = 999)
    @Column(name = "user_plant_picture_path")
    private String userPlantPicturePath;
    private Integer health;
    private Integer waterlevel;
    @Temporal(TemporalType.DATE)
    private Date planted;
    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "watering_date")
    private Date wateringDate;
    @Basic(optional = false)
    @NotNull
    @Version
    private int version;
    @JoinColumn(name = "plants_fk", referencedColumnName = "plants_id")
    @ManyToOne(optional = false)
    private Plant plantsFk;
    @JoinColumn(name = "user_fk", referencedColumnName = "user_id")
    @ManyToOne(optional = false)
    private User userFk;

    public UserPlant() {
    }

    public UserPlant(Integer userPlantsId) {
        this.userPlantsId = userPlantsId;
    }

    public UserPlant(Integer userPlantsId, String userPlantName, int version) {
        this.userPlantsId = userPlantsId;
        this.userPlantName = userPlantName;
        this.version = version;
    }
    
    public UserPlant(Plant plant, 
                     User user, 
                     String userPlantName, 
                     String userPlantPicturePath, 
                     Date planted) {
        this.plantsFk = plant;
        this.userFk = user;
        this.userPlantName = userPlantName;
        this.userPlantPicturePath = userPlantPicturePath;
        this.planted = planted;
        health = 0;
        waterlevel = 0;
        version = 1;
        wateringDate = null;
    }

    public Integer getUserPlantsId() {
        return userPlantsId;
    }

    public void setUserPlantsId(Integer userPlantsId) {
        this.userPlantsId = userPlantsId;
    }

    public String getUserPlantName() {
        return userPlantName;
    }

    public void setUserPlantName(String userPlantName) {
        this.userPlantName = userPlantName;
    }

    public String getUserPlantPicturePath() {
        return userPlantPicturePath;
    }

    public void setUserPlantPicturePath(String userPlantPicturePath) {
        this.userPlantPicturePath = userPlantPicturePath;
    }

    public Integer getHealth() {
        return health;
    }

    public void setHealth(Integer health) {
        this.health = health;
    }

    public Integer getWaterlevel() {
        return waterlevel;
    }

    public void setWaterlevel(Integer waterlevel) {
        this.waterlevel = waterlevel;
    }

    public Date getWateringDate() {
        return wateringDate;
    }

    public void setWateringDate(Date wateringDate) {
        this.wateringDate = wateringDate;
    }

    public Date getPlanted() {
        return planted;
    }

    public void setPlanted(Date planted) {
        this.planted = planted;
    }

    public int getVersion() {
        return version;
    }

    public void setVersion(int version) {
        this.version = version;
    }

    public Plant getPlantsFk() {
        return plantsFk;
    }

    public void setPlantsFk(Plant plantsFk) {
        this.plantsFk = plantsFk;
    }

    public User getUserFk() {
        return userFk;
    }

    public void setUserFk(User userFk) {
        this.userFk = userFk;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (userPlantsId != null ? userPlantsId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof UserPlant)) {
            return false;
        }
        UserPlant other = (UserPlant) object;
        if ((this.userPlantsId == null && other.userPlantsId != null) || (this.userPlantsId != null && !this.userPlantsId.equals(other.userPlantsId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "db.UserPlant[ userPlantsId=" + userPlantsId + " ]";
    }
}
