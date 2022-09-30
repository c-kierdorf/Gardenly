package model.prequestionaire;

import db.PreQuestionaire;
import javax.ejb.LocalBean;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

@Stateless
@LocalBean
public class PreQuestionaireFacade extends AbstractFacade<PreQuestionaire> {

    @PersistenceContext(unitName = "GardenlyPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public PreQuestionaireFacade() {
        super(PreQuestionaire.class);
    }
    
    public PreQuestionaire findPreQuestionaireById(Integer id) {
        return em.find(PreQuestionaire.class, id);
    }
}
