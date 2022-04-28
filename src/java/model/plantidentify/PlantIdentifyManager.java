package model.plantidentify;

import java.io.Serializable;
import javax.ejb.EJB;
import javax.enterprise.context.SessionScoped;
import javax.inject.Named;

/**
 *
 * @author CK
 */
@Named("pim")
@SessionScoped
public class PlantIdentifyManager implements Serializable {
    
    @EJB
    private PlantIdentifyFacade plantIdentifyFacade;
    private PlantJsonObject plantJsonObject;
    private boolean identified;
    private String status;
    private boolean errors;
    
    public PlantIdentifyManager() {
    }
    
    public PlantJsonObject getIdentifiedPlant(String picturePath) {
        return plantIdentifyFacade.getIdentifiedPlant(picturePath);
    }

    public PlantIdentifyFacade getPlantIdentifyFacade() {
        return plantIdentifyFacade;
    }

    public void setPlantIdentifyFacade(PlantIdentifyFacade plantIdentifyFacade) {
        this.plantIdentifyFacade = plantIdentifyFacade;
    }

    public PlantJsonObject getPlantJsonObject() {
        return plantJsonObject;
    }

    public void setPlantJsonObject(PlantJsonObject plantJsonObject) {
        this.plantJsonObject = plantJsonObject;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public boolean getErrors() {
        return errors;
    }

    public void setErrors(boolean errors) {
        this.errors = errors;
    }

    public boolean isIdentified() {
        return identified;
    }

    public void setIdentified(boolean identified) {
        this.identified = identified;
    }
    
}
