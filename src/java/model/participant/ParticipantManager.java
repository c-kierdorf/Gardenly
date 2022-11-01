package model.participant;

import db.Participant;
import java.io.Serializable;
import java.util.List;
import javax.ejb.EJB;
import javax.enterprise.context.SessionScoped;
import javax.inject.Named;

/**
 *
 * @author CK
 */

@Named("pam")
@SessionScoped
public class ParticipantManager implements Serializable {
    
    @EJB
    private ParticipantFacade participantFacade;
    private List<Participant> participants;
    private Participant participant;
    private String status;
    private boolean errors;
    private boolean errorsQueryParticipantDetails;

    public ParticipantManager() {
    }
    
    public void create(Participant participant) {
        participantFacade.create(participant);
    }
    
    public void update(Participant participant) {
        participantFacade.edit(participant);
    }
    
    public void delete(Participant participant) {
        participantFacade.remove(participant);
    }
    
    public List<Participant> findAll() {
        return participantFacade.findAll();
    }
    
    public Participant findParticipantById(Integer id) {
        return participantFacade.findParticipantById(id);
    }
    
    public List<Participant> findParticipantByName (String name) {
        return participantFacade.findParticipantByName(name);
    }

    public ParticipantFacade getParticipantFacade() {
        return participantFacade;
    }

    public void setParticipantFacade(ParticipantFacade participantFacade) {
        this.participantFacade = participantFacade;
    }

    public List<Participant> getParticipants() {
        return participants;
    }

    public void setParticipants(List<Participant> participants) {
        this.participants = participants;
    }

    public Participant getParticipant() {
        return participant;
    }

    public void setParticipant(Participant participant) {
        this.participant = participant;
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

    public boolean isErrorsQueryParticipantDetails() {
        return errorsQueryParticipantDetails;
    }

    public void setErrorsQueryParticipantDetails(boolean errorsQueryParticipantDetails) {
        this.errorsQueryParticipantDetails = errorsQueryParticipantDetails;
    }
    
}
