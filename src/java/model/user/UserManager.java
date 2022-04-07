package model.user;

import db.Plant;
import db.User;
import java.io.Serializable;
import java.util.List;
import javax.ejb.EJB;
import javax.enterprise.context.SessionScoped;
import javax.inject.Named;

@Named("um")
@SessionScoped
public class UserManager implements Serializable {

    @EJB
    private UserFacade userFacade;
    private List<User> users;
    private User user;
    private String status;
    private boolean errors;
    private String lastName;
    private String firstName;
    private String userEmail;
    private String userPwd;
    private boolean isActive;
    private boolean passwordReset;
    private List<Plant> plantCollection;

    public UserManager() {
    }

    public void create(User user) {
        userFacade.create(user);
    }

    public void update(User user) {
        userFacade.edit(user);
    }

    public void delete(User user) {
        userFacade.remove(user);
    }
    
    public User findUserById(Integer id) {
        return userFacade.findUserById(id);
    }

    public List<User> findUserByEmail(String email) {
        return userFacade.findUserByEmail(email);
    }

    public List<User> findUserByPwd(String pwd) {
        return userFacade.findUserByPwd(pwd);
    }

    public UserFacade getUserFacade() {
        return userFacade;
    }

    public void setUserFacade(UserFacade userFacade) {
        this.userFacade = userFacade;
    }

    public List<User> getUsers() {
        return users;
    }

    public void setUsers(List<User> users) {
        this.users = users;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
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

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getUserEmail() {
        return userEmail;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
    }

    public String getUserPwd() {
        return userPwd;
    }

    public void setUserPwd(String userPwd) {
        this.userPwd = userPwd;
    }

    public boolean isIsActive() {
        return isActive;
    }

    public void setIsActive(boolean isActive) {
        this.isActive = isActive;
    }

    public boolean isPasswordReset() {
        return passwordReset;
    }

    public void setPasswordReset(boolean passwordReset) {
        this.passwordReset = passwordReset;
    }

    public List<Plant> getPlantCollection() {
        return plantCollection;
    }

    public void setPlantCollection(List<Plant> plantCollection) {
        this.plantCollection = plantCollection;
    }

}
