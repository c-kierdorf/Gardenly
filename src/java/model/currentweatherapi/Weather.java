package model.currentweatherapi;

import java.nio.ByteBuffer;
import java.nio.charset.StandardCharsets;

public class Weather {

    private int id;
    private String main;
    private String description;
    private String icon;

    public Weather() {
    }

    public Weather(int id, String main, String description, String icon) {
        this.id = id;
        this.main = main;
        this.description = description;
        this.icon = icon;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getMain() {
        return main;
    }

    public void setMain(String main) {
        this.main = main;
    }

    public String getDescription() {
        /*
        Encoding String to UTF-8. https://www.baeldung.com/java-string-encode-utf-8
        */
        String rawString = description;
        ByteBuffer buffer = StandardCharsets.UTF_8.encode(rawString);
        String utf8EncodedString = StandardCharsets.UTF_8.decode(buffer).toString();
        return utf8EncodedString;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getIcon() {
        return icon;
    }

    public void setIcon(String icon) {
        this.icon = icon;
    }

}
