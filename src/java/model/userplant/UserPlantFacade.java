package model.userplant;

import db.User;
import db.UserPlant;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

@Stateless
public class UserPlantFacade extends AbstractFacade<UserPlant> {

    @PersistenceContext(unitName = "GardenlyPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public UserPlantFacade() {
        super(UserPlant.class);
    }
    
    public UserPlant findUserPlantById(Integer id) {
        return em.find(UserPlant.class, id);
    }
    
    public List<UserPlant> findUserPlantByName(String name) {
        Query userPlantNameQuery = em.createNamedQuery("UserPlant.findByUserPlantName");
        userPlantNameQuery.setParameter("userPlantName", name);
        return userPlantNameQuery.getResultList();
    }
    
    public List<UserPlant> findUserPlantsByUserFk(User userFk) {
        Query userPlantUserFkQuery = em.createNamedQuery("UserPlant.findByUserFk");
        userPlantUserFkQuery.setParameter("userFk", userFk);
        return userPlantUserFkQuery.getResultList();
    }
}
