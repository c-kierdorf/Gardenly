package web.raspberrypiapi;

public class UserPlantJson {
    
    private Integer id;
    private String name;
    private Integer transferIntervall;
    
    public UserPlantJson() {
    }

    public UserPlantJson(Integer id, String name, Integer transferIntervall) {
        this.id = id;
        this.name = name;
        this.transferIntervall = transferIntervall;
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

    public Integer getTransferIntervall() {
        return transferIntervall;
    }

    public void setTransferIntervall(Integer transferIntervall) {
        this.transferIntervall = transferIntervall;
    }
}
