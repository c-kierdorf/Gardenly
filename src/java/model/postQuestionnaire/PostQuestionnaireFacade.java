package model.postQuestionnaire;

import model.postQuestionnaire.AbstractFacade;
import db.PostQuestionnaire;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

@Stateless
public class PostQuestionnaireFacade extends AbstractFacade<PostQuestionnaire> {

    @PersistenceContext(unitName = "GardenlyPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public PostQuestionnaireFacade() {
        super(PostQuestionnaire.class);
    }
    
    public PostQuestionnaire findPostQuestionnaireById(Integer id) {
        return em.find(PostQuestionnaire.class, id);
    }
    
}
