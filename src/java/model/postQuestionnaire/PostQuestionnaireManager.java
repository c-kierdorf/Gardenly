package model.postQuestionnaire;

import db.PostQuestionnaire;
import java.io.Serializable;
import java.util.List;
import javax.ejb.EJB;
import javax.enterprise.context.SessionScoped;
import javax.inject.Named;

/**
 *
 * @author CK
 */

@Named("postqm")
@SessionScoped
public class PostQuestionnaireManager implements Serializable {
    
    @EJB
    private PostQuestionnaireFacade postQuestionnaireFacade;
    private List<PostQuestionnaire> postQuestionnaires;
    private PostQuestionnaire postQuestionnaire;
    private String status;
    private boolean errors;
    private boolean errorsQueryPostQuestionnaireDetails;

    public PostQuestionnaireManager() {
    }
    
    public void create(PostQuestionnaire postQuestionnaire) {
        postQuestionnaireFacade.create(postQuestionnaire);
    }
    
    public void update(PostQuestionnaire postQuestionnaire) {
        postQuestionnaireFacade.edit(postQuestionnaire);
    }
    
    public void delete(PostQuestionnaire postQuestionnaire) {
        postQuestionnaireFacade.remove(postQuestionnaire);
    }
    
    public List<PostQuestionnaire> findAll() {
        return postQuestionnaireFacade.findAll();
    }
    
    public PostQuestionnaire findPostQuestionnaireById(Integer id) {
        return postQuestionnaireFacade.findPostQuestionnaireById(id);
    }

    public PostQuestionnaireFacade getPostQuestionnaireFacade() {
        return postQuestionnaireFacade;
    }

    public void setPostQuestionnaireFacade(PostQuestionnaireFacade postQuestionnaireFacade) {
        this.postQuestionnaireFacade = postQuestionnaireFacade;
    }

    public List<PostQuestionnaire> getPostQuestionnaires() {
        return postQuestionnaires;
    }

    public void setPostQuestionnaires(List<PostQuestionnaire> postQuestionnaires) {
        this.postQuestionnaires = postQuestionnaires;
    }

    public PostQuestionnaire getPostQuestionnaire() {
        return postQuestionnaire;
    }

    public void setPostQuestionnaire(PostQuestionnaire postQuestionnaire) {
        this.postQuestionnaire = postQuestionnaire;
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

    public boolean isErrorsQueryPostQuestionnaireDetails() {
        return errorsQueryPostQuestionnaireDetails;
    }

    public void setErrorsQueryPostQuestionnaireDetails(boolean errorsQueryPostQuestionnaireDetails) {
        this.errorsQueryPostQuestionnaireDetails = errorsQueryPostQuestionnaireDetails;
    }
    
}
