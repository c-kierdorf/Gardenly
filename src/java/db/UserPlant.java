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
    @NamedQuery(name = "UserPlant.findByVersion", query = "SELECT u FROM UserPlant u WHERE u.version = :version"),
    @NamedQuery(name = "UserPlant.findByHumidityNow", query = "SELECT u FROM UserPlant u WHERE u.humidityNow = :humidityNow"),
    @NamedQuery(name = "UserPlant.findByHumidityAverageWeek", query = "SELECT u FROM UserPlant u WHERE u.humidityAverageWeek = :humidityAverageWeek"),
    @NamedQuery(name = "UserPlant.findByLightNow", query = "SELECT u FROM UserPlant u WHERE u.lightNow = :lightNow"),
    @NamedQuery(name = "UserPlant.findByLightAverageWeek", query = "SELECT u FROM UserPlant u WHERE u.lightAverageWeek = :lightAverageWeek"),
    @NamedQuery(name = "UserPlant.findBySoilmoistureNow", query = "SELECT u FROM UserPlant u WHERE u.soilmoistureNow = :soilmoistureNow"),
    @NamedQuery(name = "UserPlant.findBySoilmoistureAverageWeek", query = "SELECT u FROM UserPlant u WHERE u.soilmoistureAverageWeek = :soilmoistureAverageWeek"),
    @NamedQuery(name = "UserPlant.findByTemperatureNow", query = "SELECT u FROM UserPlant u WHERE u.temperatureNow = :temperatureNow"),
    @NamedQuery(name = "UserPlant.findByTemperatureAverageWeek", query = "SELECT u FROM UserPlant u WHERE u.temperatureAverageWeek = :temperatureAverageWeek"),
    @NamedQuery(name = "UserPlant.findByIsConnected", query = "SELECT u FROM UserPlant u WHERE u.isConnected = :isConnected"),
    @NamedQuery(name = "UserPlant.findByTransferInterval", query = "SELECT u FROM UserPlant u WHERE u.transferInterval = :transferInterval"),
    @NamedQuery(name = "UserPlant.findByTransferDate", query = "SELECT u FROM UserPlant u WHERE u.transferDate = :transferDate"),
    @NamedQuery(name = "UserPlant.findByWaterNow", query = "SELECT u FROM UserPlant u WHERE u.waterNow = :waterNow"),
    @NamedQuery(name = "UserPlant.findByAutomaticWatering", query = "SELECT u FROM UserPlant u WHERE u.automaticWatering = :automaticWatering")})
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
    @Column(name = "humidity_now")
    private Integer humidityNow;
    @Column(name = "humidity_average_week")
    private Integer humidityAverageWeek;
    @Column(name = "light_now")
    private Integer lightNow;
    @Column(name = "light_average_week")
    private Integer lightAverageWeek;
    @Column(name = "soilmoisture_now")
    private Integer soilmoistureNow;
    @Column(name = "soilmoisture_average_week")
    private Integer soilmoistureAverageWeek;
    @Column(name = "temperature_now")
    private Integer temperatureNow;
    @Column(name = "temperature_average_week")
    private Integer temperatureAverageWeek;
    @Column(name = "is_connected")
    private boolean isConnected;
    @Column(name = "transfer_interval")
    private Integer transferInterval;
    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "transfer_date")
    private Date transferDate;
    @Column(name = "water_now")
    private boolean waterNow;
    @Column(name = "automatic_watering")
    private boolean automaticWatering;
    
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
                     Date planted,
                     boolean isConnected) {
        this.plantsFk = plant;
        this.userFk = user;
        this.userPlantName = userPlantName;
        this.userPlantPicturePath = userPlantPicturePath;
        this.planted = planted;
        health = 0;
        waterlevel = 0;
        version = 1;
        wateringDate = null;
        humidityNow = 0;
        humidityAverageWeek = 0;
        lightNow = 0;
        lightAverageWeek = 0;
        soilmoistureNow = 0;
        soilmoistureAverageWeek = 0;
        temperatureNow = 0;
        temperatureAverageWeek = 0;
        this.isConnected = isConnected;
        transferInterval = 1;
        transferDate = null;
        waterNow = false;
        automaticWatering = false;
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

    public Integer getHumidityNow() {
        return humidityNow;
    }

    public void setHumidityNow(Integer humidityNow) {
        this.humidityNow = humidityNow;
    }

    public Integer getLightNow() {
        return lightNow;
    }

    public void setLightNow(Integer lightNow) {
        this.lightNow = lightNow;
    }

    public Integer getSoilmoistureNow() {
        return soilmoistureNow;
    }

    public void setSoilmoistureNow(Integer soilmoistureNow) {
        this.soilmoistureNow = soilmoistureNow;
    }

    public Integer getTemperatureNow() {
        return temperatureNow;
    }

    public void setTemperatureNow(Integer temperatureNow) {
        this.temperatureNow = temperatureNow;
    }

    public Integer getHumidityAverageWeek() {
        return humidityAverageWeek;
    }

    public void setHumidityAverageWeek(Integer humidityAverageWeek) {
        this.humidityAverageWeek = humidityAverageWeek;
    }

    public Integer getLightAverageWeek() {
        return lightAverageWeek;
    }

    public void setLightAverageWeek(Integer lightAverageWeek) {
        this.lightAverageWeek = lightAverageWeek;
    }

    public Integer getSoilmoistureAverageWeek() {
        return soilmoistureAverageWeek;
    }

    public void setSoilmoistureAverageWeek(Integer soilmoistureAverageWeek) {
        this.soilmoistureAverageWeek = soilmoistureAverageWeek;
    }

    public Integer getTemperatureAverageWeek() {
        return temperatureAverageWeek;
    }

    public void setTemperatureAverageWeek(Integer temperatureAverageWeek) {
        this.temperatureAverageWeek = temperatureAverageWeek;
    }

    public boolean isIsConnected() {
        return isConnected;
    }

    public void setIsConnected(boolean isConnected) {
        this.isConnected = isConnected;
    }

    public Integer getTransferInterval() {
        return transferInterval;
    }

    public void setTransferInterval(Integer transferInterval) {
        this.transferInterval = transferInterval;
    }

    public Date getTransferDate() {
        return transferDate;
    }

    public void setTransferDate(Date transferDate) {
        this.transferDate = transferDate;
    }

    public boolean isWaterNow() {
        return waterNow;
    }

    public void setWaterNow(boolean waterNow) {
        this.waterNow = waterNow;
    }

    public boolean isAutomaticWatering() {
        return automaticWatering;
    }

    public void setAutomaticWatering(boolean automaticWatering) {
        this.automaticWatering = automaticWatering;
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
