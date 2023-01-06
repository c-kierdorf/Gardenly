package model.preQuestionnaire;

import db.PreQuestionnaire;
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
public class PreQuestionnaireManager implements Serializable {
    
    @EJB
    private PreQuestionnaireFacade preQuestionnaireFacade;
    private List<PreQuestionnaire> preQuestionnaires;
    private PreQuestionnaire preQuestionnaire;
    private String status;
    private boolean errors;
    private boolean errorsQueryPreQuestionnaireDetails;

    public PreQuestionnaireManager() {
    }
    
    public void create(PreQuestionnaire preQuestionnaire) {
        preQuestionnaireFacade.create(preQuestionnaire);
    }
    
    public void update(PreQuestionnaire preQuestionnaire) {
        preQuestionnaireFacade.edit(preQuestionnaire);
    }
    
    public void delete(PreQuestionnaire preQuestionnaire) {
        preQuestionnaireFacade.remove(preQuestionnaire);
    }
    
    public List<PreQuestionnaire> findAll() {
        return preQuestionnaireFacade.findAll();
    }
    
    public PreQuestionnaire findPreQuestionnaireById(Integer id) {
        return preQuestionnaireFacade.findPreQuestionnaireById(id);
    }

    public PreQuestionnaireFacade getPreQuestionnaireFacade() {
        return preQuestionnaireFacade;
    }

    public void setPreQuestionnaireFacade(PreQuestionnaireFacade preQuestionnaireFacade) {
        this.preQuestionnaireFacade = preQuestionnaireFacade;
    }

    public List<PreQuestionnaire> getPreQuestionnaires() {
        return preQuestionnaires;
    }

    public void setPreQuestionnaires(List<PreQuestionnaire> preQuestionnaires) {
        this.preQuestionnaires = preQuestionnaires;
    }

    public PreQuestionnaire getPreQuestionnaire() {
        return preQuestionnaire;
    }

    public void setPreQuestionnaire(PreQuestionnaire preQuestionnaire) {
        this.preQuestionnaire = preQuestionnaire;
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

    public boolean isErrorsQueryPreQuestionnaireDetails() {
        return errorsQueryPreQuestionnaireDetails;
    }

    public void setErrorsQueryPreQuestionnaireDetails(boolean errorsQueryPreQuestionnaireDetails) {
        this.errorsQueryPreQuestionnaireDetails = errorsQueryPreQuestionnaireDetails;
    }
    
}
