package web.connect;

public class UserPlantJson {
    
    private Integer id;
    private String name;
    private Integer checkIntervall;
    
    public UserPlantJson() {
    }

    public UserPlantJson(Integer id, String name, Integer checkIntervall) {
        this.id = id;
        this.name = name;
        this.checkIntervall = checkIntervall;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getCheckIntervall() {
        return checkIntervall;
    }

    public void setCheckIntervall(Integer checkIntervall) {
        this.checkIntervall = checkIntervall;
    }
}
