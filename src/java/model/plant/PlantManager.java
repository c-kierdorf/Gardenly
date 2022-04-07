package model.plant;

import db.Plant;
import java.io.Serializable;
import java.util.List;
import javax.ejb.EJB;
import javax.enterprise.context.SessionScoped;
import javax.inject.Named;

/**
 *
 * @author CK
 */

@Named("pm")
@SessionScoped
public class PlantManager implements Serializable {
    
    @EJB
    private PlantFacade plantFacade;
    private List<Plant> plants;
    private Plant plant;
    private String status;
    private boolean errors;
    
    public PlantManager() {
    }
    
    public void create(Plant plant) {
        plantFacade.create(plant);
    }
    
    public void update(Plant plant) {
        plantFacade.edit(plant);
    }
    
    public void delete(Plant plant) {
        plantFacade.remove(plant);
    }
    
    public List<Plant> findAll() {
        return plantFacade.findAll();
    }
    
    public Plant findPlantById(Integer id) {
        return plantFacade.findPlantById(id);
    }
    
    public List<Plant> findPlantByName (String name) {
        return plantFacade.findPlantByName(name);
    }

    public PlantFacade getPlantFacade() {
        return plantFacade;
    }

    public void setPlantFacade(PlantFacade plantFacade) {
        this.plantFacade = plantFacade;
    }

    public List<Plant> getPlants() {
        return plants;
    }

    public void setPlants(List<Plant> plants) {
        this.plants = plants;
    }

    public Plant getPlant() {
        return plant;
    }

    public void setPlant(Plant plant) {
        this.plant = plant;
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
