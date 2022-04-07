package model.user;

import db.User;
import java.util.List;
import javax.ejb.LocalBean;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

@Stateless
@LocalBean
public class UserFacade extends AbstractFacade {

    @PersistenceContext(unitName = "GardenlyPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public UserFacade() {
        super(User.class);
    }
    
    public User findUserById(Integer id) {
        return em.find(User.class, id);
    }

    public List<User> findUserByEmail(String email) {
        Query userNameQuery = em.createNamedQuery("User.findByEmail");
        userNameQuery.setParameter("email", email);
        return userNameQuery.getResultList();
    }
    
    public List<User> findUserByPwd(String pwd) {
        Query userPwdQuery = em.createNamedQuery("User.findByPwdHash");
        userPwdQuery.setParameter("pwdHash", pwd);
        return userPwdQuery.getResultList();
    }
}
