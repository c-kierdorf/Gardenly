package model.postquestionaire;

import db.PostQuestionaire;
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
public class PostQuestionaireManager implements Serializable {
    
    @EJB
    private PostQuestionaireFacade postQuestionaireFacade;
    private List<PostQuestionaire> postQuestionaires;
    private PostQuestionaire postQuestionaire;
    private String status;
    private boolean errors;
    private boolean errorsQueryPostQuestionaireDetails;

    public PostQuestionaireManager() {
    }
    
    public void create(PostQuestionaire postQuestionaire) {
        postQuestionaireFacade.create(postQuestionaire);
    }
    
    public void update(PostQuestionaire postQuestionaire) {
        postQuestionaireFacade.edit(postQuestionaire);
    }
    
    public void delete(PostQuestionaire postQuestionaire) {
        postQuestionaireFacade.remove(postQuestionaire);
    }
    
    public List<PostQuestionaire> findAll() {
        return postQuestionaireFacade.findAll();
    }
    
    public PostQuestionaire findPostQuestionaireById(Integer id) {
        return postQuestionaireFacade.findPostQuestionaireById(id);
    }

    public PostQuestionaireFacade getPostQuestionaireFacade() {
        return postQuestionaireFacade;
    }

    public void setPostQuestionaireFacade(PostQuestionaireFacade postQuestionaireFacade) {
        this.postQuestionaireFacade = postQuestionaireFacade;
    }

    public List<PostQuestionaire> getPostQuestionaires() {
        return postQuestionaires;
    }

    public void setPostQuestionaires(List<PostQuestionaire> postQuestionaires) {
        this.postQuestionaires = postQuestionaires;
    }

    public PostQuestionaire getPostQuestionaire() {
        return postQuestionaire;
    }

    public void setPostQuestionaire(PostQuestionaire postQuestionaire) {
        this.postQuestionaire = postQuestionaire;
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

    public boolean isErrorsQueryPostQuestionaireDetails() {
        return errorsQueryPostQuestionaireDetails;
    }

    public void setErrorsQueryPostQuestionaireDetails(boolean errorsQueryPostQuestionaireDetails) {
        this.errorsQueryPostQuestionaireDetails = errorsQueryPostQuestionaireDetails;
    }
    
}
