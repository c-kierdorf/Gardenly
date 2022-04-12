package model.currentweatherapi;

import java.io.Serializable;
import java.util.List;
import javax.ejb.EJB;
import javax.enterprise.context.SessionScoped;
import javax.inject.Named;

/**
 *
 * @author CK
 */
@Named("wm")
@SessionScoped
public class WeatherManager implements Serializable {

    @EJB
    private WeatherFacade weatherFacade;
    private WeatherJsonObject weatherJsonObject;
    private String status;
    private boolean errors;

    public WeatherManager() {
    }
    
    public WeatherJsonObject getCurrentWeather() {
        return weatherFacade.getCurrentWeather();
    }

    public WeatherFacade getWeatherFacade() {
        return weatherFacade;
    }

    public void setWeatherFacade(WeatherFacade weatherFacade) {
        this.weatherFacade = weatherFacade;
    }

    public WeatherJsonObject getWeatherJsonObject() {
        return weatherJsonObject;
    }

    public void setWeatherJsonObject(WeatherJsonObject weatherJsonObject) {
        this.weatherJsonObject = weatherJsonObject;
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
