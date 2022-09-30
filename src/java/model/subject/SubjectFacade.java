package model.subject;

import db.Subject;
import java.util.List;
import javax.ejb.LocalBean;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

@Stateless
@LocalBean
public class SubjectFacade extends AbstractFacade<Subject> {

    @PersistenceContext(unitName = "GardenlyPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public SubjectFacade() {
        super(Subject.class);
    }
    
    public Subject findSubjectById(Integer id) {
        return em.find(Subject.class, id);
    }
    
    public List<Subject> findSubjectByName(String name) {
        Query subjectNameQuery = em.createNamedQuery("Subject.findByNickName");
        subjectNameQuery.setParameter("name", name);
        return subjectNameQuery.getResultList();
    }
    
}
