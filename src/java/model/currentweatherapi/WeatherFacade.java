package model.currentweatherapi;

import com.google.gson.Gson;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
import javax.ejb.LocalBean;
import javax.ejb.Stateless;

@Stateless
@LocalBean
public class WeatherFacade {

    public WeatherJsonObject getCurrentWeather() {
        String apiKey = WeatherCredentials.getApiKey();
        String latitude = "50.92205061337295"; // Köln Rheinauhafen
        String longitude = "6.967979935851583"; // Köln Rheinauhafen
//        String latitude = "49.07176887700034"; // Stuttgart wegen überwiegend bewölkt
//        String longitude = "9.584511808341885"; // Stuttgart wegen überwiegend bewölkt
        String units = "metric";
        String lang = "de";
        String urlString = "http://api.openweathermap.org/data/2.5/weather?"
                + "lat=" + latitude
                + "&lon=" + longitude
                + "&appid=" + apiKey
                + "&units=" + units
                + "&lang=" + lang;
        try {
            URL url = new URL(urlString);

            StringBuilder result = new StringBuilder();
            URLConnection conn = url.openConnection();
//            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream())); // ANSI-Codierung
            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8")); // UTF-8 Codierung 
            String line;
            while ((line = br.readLine()) != null) {
                result.append(line);
            }
            br.close();

            Gson gson = new Gson();
            WeatherJsonObject weather = gson.fromJson(result.toString(), WeatherJsonObject.class);
            return weather;
        } catch (IOException ioe) {
            ioe.printStackTrace();
        }
        return null;
    }
}
