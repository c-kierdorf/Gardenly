package web.plants;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;
import javax.servlet.http.HttpServletRequest;

public class GetLocation {
    
    public static String of(HttpServletRequest request) {
        List<String> locations = new ArrayList();
        if (request.getParameter("locationHell") != null) {
            locations.add(request.getParameter("locationHell"));
        }
        if (request.getParameter("locationSonnig") != null) {
            locations.add(request.getParameter("locationSonnig"));
        }
        if (request.getParameter("locationHalbschattig") != null) {
            locations.add(request.getParameter("locationHalbschattig"));
        }
        if (request.getParameter("locationSchattig") != null) {
            locations.add(request.getParameter("locationSchattig"));
        }
        if (request.getParameter("locationWarm") != null) {
            locations.add(request.getParameter("locationWarm"));
        }
        if (request.getParameter("locationKuehl") != null) {
            locations.add(request.getParameter("locationKuehl"));
        }
        if (request.getParameter("locationLuftfeucht") != null) {
            locations.add(request.getParameter("locationLuftfeucht"));
        }
        if (request.getParameter("locationWindgeschuetzt") != null) {
            locations.add(request.getParameter("locationWindgeschuetzt"));
        }
        if (request.getParameter("locationKeineSonne") != null) {
            locations.add(request.getParameter("locationKeineSonne"));
        }
        if (request.getParameter("locationNordfenster") != null) {
            locations.add(request.getParameter("locationNordfenster"));
        }
        if (request.getParameter("locationOstfenster") != null) {
            locations.add(request.getParameter("locationOstfenster"));
        }
        if (request.getParameter("locationSuedfenster") != null) {
            locations.add(request.getParameter("locationSuedfenster"));
        }
        if (request.getParameter("locationWestfenster") != null) {
            locations.add(request.getParameter("locationWestfenster"));
        }
        if (request.getParameter("locationIndoor") != null) {
            locations.add(request.getParameter("locationIndoor"));
        }
        if (request.getParameter("locationOutdoor") != null) {
            locations.add(request.getParameter("locationOutdoor"));
        }

        String location = locations.stream()
                .map(i -> String.valueOf(i))
                .collect(Collectors.joining(", "));
        return location;
    }
    
}
