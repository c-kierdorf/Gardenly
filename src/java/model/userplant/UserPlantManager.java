package model.userplant;

import db.User;
import db.UserPlant;
import java.io.Serializable;
import java.util.List;
import javax.ejb.EJB;
import javax.enterprise.context.SessionScoped;
import javax.inject.Named;

/**
 *
 * @author CK
 */
@Named("upm")
@SessionScoped

public class UserPlantManager implements Serializable {

    @EJB
    private UserPlantFacade userPlantFacade;
    private List<UserPlant> userPlants;
    private UserPlant userPlant;
    private String status;
    private boolean errors;

    public UserPlantManager() {
    }
    
    public void create(UserPlant userPlant) {
        userPlantFacade.create(userPlant);
    }
    
    public void update(UserPlant userPlant) {
        userPlantFacade.edit(userPlant);
    }
    
    public void delete(UserPlant userPlant) {
        userPlantFacade.remove(userPlant);
    }
    
    public List<UserPlant> findAll() {
        return userPlantFacade.findAll();
    }
    
    public UserPlant findUserPlantById(Integer id) {
        return userPlantFacade.findUserPlantById(id);
    }
    
    public List<UserPlant> findUserPlantsByName (String name) {
        return userPlantFacade.findUserPlantByName(name);
    }
    
    public List<UserPlant> findUserPlantsByUserFk(User userFk) {
        return userPlantFacade.findUserPlantsByUserFk(userFk);
    }

    public UserPlantFacade getUserPlantFacade() {
        return userPlantFacade;
    }

    public void setUserPlantFacade(UserPlantFacade userPlantFacade) {
        this.userPlantFacade = userPlantFacade;
    }

    public List<UserPlant> getUserPlants() {
        return userPlants;
    }

    public void setUserPlants(List<UserPlant> userPlants) {
        this.userPlants = userPlants;
    }

    public UserPlant getUserPlant() {
        return userPlant;
    }

    public void setUserPlant(UserPlant userPlant) {
        this.userPlant = userPlant;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public boolean isErrors() {
        return errors;
    }

    public void setErrors(boolean errors) {
        this.errors = errors;
    }
}
