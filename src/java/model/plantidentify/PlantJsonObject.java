package model.plantidentify;

public class PlantJsonObject {
    
    private String bestMatch;
    
    public PlantJsonObject() {
    }

    public PlantJsonObject(String bestMatch) {
        this.bestMatch = bestMatch;
    }

    public String getBestMatch() {
        return bestMatch;
    }

    public void setBestMatch(String bestMatch) {
        this.bestMatch = bestMatch;
    }
    
}
