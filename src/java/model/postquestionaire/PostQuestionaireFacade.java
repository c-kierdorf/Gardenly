package model.postquestionaire;

import db.PostQuestionaire;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

@Stateless
public class PostQuestionaireFacade extends AbstractFacade<PostQuestionaire> {

    @PersistenceContext(unitName = "GardenlyPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public PostQuestionaireFacade() {
        super(PostQuestionaire.class);
    }
    
    public PostQuestionaire findPostQuestionaireById(Integer id) {
        return em.find(PostQuestionaire.class, id);
    }
    
}
