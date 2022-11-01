package model.participant;

import db.Participant;
import java.util.List;
import javax.ejb.LocalBean;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

@Stateless
@LocalBean
public class ParticipantFacade extends AbstractFacade<Participant> {

    @PersistenceContext(unitName = "GardenlyPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public ParticipantFacade() {
        super(Participant.class);
    }
    
    public Participant findParticipantById(Integer id) {
        return em.find(Participant.class, id);
    }
    
    public List<Participant> findParticipantByName(String name) {
        Query participantNameQuery = em.createNamedQuery("Participant.findByNickName");
        participantNameQuery.setParameter("name", name);
        return participantNameQuery.getResultList();
    }
    
}
