package model.currentweatherapi;

import java.util.List;

public class WeatherJsonObject {
    
    private Main main;
    private Wind wind;
    private List<Weather> weather;
    
    public WeatherJsonObject() {
    }

    public WeatherJsonObject(Main main, Wind wind, List<Weather> weather) {
        this.main = main;
        this.wind = wind;
        this.weather = weather;
    }

    public Main getMain() {
        return main;
    }

    public void setMain(Main main) {
        this.main = main;
    }

    public Wind getWind() {
        return wind;
    }

    public void setWind(Wind wind) {
        this.wind = wind;
    }

    public List<Weather> getWeather() {
        return weather;
    }

    public void setWeather(List<Weather> weather) {
        this.weather = weather;
    }

}
