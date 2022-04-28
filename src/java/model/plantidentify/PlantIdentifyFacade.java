package model.plantidentify;

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
public class PlantIdentifyFacade {
    
    public PlantJsonObject getIdentifiedPlant(String picturePath) {
        String apiKey = PlantIdentifyCredentials.getAPI_KEY();
        String organs = "auto";
        String includeRelatedImages = "false";
        String noReject = "false";
        String lang = "de";
        String images = "https://gardenly.garden/img/plant-identify/" + picturePath;
        String urlString = "https://my-api.plantnet.org/v2/identify/all?"
                + "images=" + images
                + "&organs=" + organs
                + "&include-related-images=" + includeRelatedImages
                + "&no-reject=" + noReject
                + "&lang=" + lang
                + "&api-key=" + apiKey;
        
        try {
            URL url = new URL(urlString);

            StringBuilder result = new StringBuilder();
            URLConnection conn = url.openConnection();
            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            String line;
            while ((line = br.readLine()) != null) {
                result.append(line);
            }
            br.close();

            Gson gson = new Gson();
            PlantJsonObject plantJsonObject = gson.fromJson(result.toString(), PlantJsonObject.class);
            return plantJsonObject;
        } catch (IOException ioe) {
            ioe.printStackTrace();
        }
        return null;
    }
    
}
