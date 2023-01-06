package model.preQuestionnaire;

import db.PreQuestionnaire;
import javax.ejb.LocalBean;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

@Stateless
@LocalBean
public class PreQuestionnaireFacade extends AbstractFacade<PreQuestionnaire> {

    @PersistenceContext(unitName = "GardenlyPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public PreQuestionnaireFacade() {
        super(PreQuestionnaire.class);
    }
    
    public PreQuestionnaire findPreQuestionnaireById(Integer id) {
        return em.find(PreQuestionnaire.class, id);
    }
}
