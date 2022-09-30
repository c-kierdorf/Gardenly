package model.prequestionaire;

import db.PreQuestionaire;
import java.io.Serializable;
import java.util.List;
import javax.ejb.EJB;
import javax.enterprise.context.SessionScoped;
import javax.inject.Named;

/**
 *
 * @author CK
 */

@Named("preqm")
@SessionScoped
public class PreQuestionaireManager implements Serializable {
    
    @EJB
    private PreQuestionaireFacade preQuestionaireFacade;
    private List<PreQuestionaire> preQuestionaires;
    private PreQuestionaire preQuestionaire;
    private String status;
    private boolean errors;
    private boolean errorsQueryPreQuestionaireDetails;

    public PreQuestionaireManager() {
    }
    
    public void create(PreQuestionaire preQuestionaire) {
        preQuestionaireFacade.create(preQuestionaire);
    }
    
    public void update(PreQuestionaire preQuestionaire) {
        preQuestionaireFacade.edit(preQuestionaire);
    }
    
    public void delete(PreQuestionaire preQuestionaire) {
        preQuestionaireFacade.remove(preQuestionaire);
    }
    
    public List<PreQuestionaire> findAll() {
        return preQuestionaireFacade.findAll();
    }
    
    public PreQuestionaire findPreQuestionaireById(Integer id) {
        return preQuestionaireFacade.findPreQuestionaireById(id);
    }

    public PreQuestionaireFacade getPreQuestionaireFacade() {
        return preQuestionaireFacade;
    }

    public void setPreQuestionaireFacade(PreQuestionaireFacade preQuestionaireFacade) {
        this.preQuestionaireFacade = preQuestionaireFacade;
    }

    public List<PreQuestionaire> getPreQuestionaires() {
        return preQuestionaires;
    }

    public void setPreQuestionaires(List<PreQuestionaire> preQuestionaires) {
        this.preQuestionaires = preQuestionaires;
    }

    public PreQuestionaire getPreQuestionaire() {
        return preQuestionaire;
    }

    public void setPreQuestionaire(PreQuestionaire preQuestionaire) {
        this.preQuestionaire = preQuestionaire;
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

    public boolean isErrorsQueryPreQuestionaireDetails() {
        return errorsQueryPreQuestionaireDetails;
    }

    public void setErrorsQueryPreQuestionaireDetails(boolean errorsQueryPreQuestionaireDetails) {
        this.errorsQueryPreQuestionaireDetails = errorsQueryPreQuestionaireDetails;
    }
    
}
