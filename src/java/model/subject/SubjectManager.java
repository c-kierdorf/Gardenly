package model.subject;

import db.Subject;
import java.io.Serializable;
import java.util.List;
import javax.ejb.EJB;
import javax.enterprise.context.SessionScoped;
import javax.inject.Named;

/**
 *
 * @author CK
 */

@Named("sm")
@SessionScoped
public class SubjectManager implements Serializable {
    
    @EJB
    private SubjectFacade subjectFacade;
    private List<Subject> subjects;
    private Subject subject;
    private String status;
    private boolean errors;
    private boolean errorsQuerySubjectDetails;

    public SubjectManager() {
    }
    
    
    
    public void create(Subject subject) {
        subjectFacade.create(subject);
    }
    
    public void update(Subject subject) {
        subjectFacade.edit(subject);
    }
    
    public void delete(Subject subject) {
        subjectFacade.remove(subject);
    }
    
    public List<Subject> findAll() {
        return subjectFacade.findAll();
    }
    
    public Subject findSubjectById(Integer id) {
        return subjectFacade.findSubjectById(id);
    }
    
    public List<Subject> findSubjectByName (String name) {
        return subjectFacade.findSubjectByName(name);
    }

    public SubjectFacade getSubjectFacade() {
        return subjectFacade;
    }

    public void setSubjectFacade(SubjectFacade subjectFacade) {
        this.subjectFacade = subjectFacade;
    }

    public List<Subject> getSubjects() {
        return subjects;
    }

    public void setSubjects(List<Subject> subjects) {
        this.subjects = subjects;
    }

    public Subject getSubject() {
        return subject;
    }

    public void setSubject(Subject subject) {
        this.subject = subject;
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

    public boolean isErrorsQuerySubjectDetails() {
        return errorsQuerySubjectDetails;
    }

    public void setErrorsQuerySubjectDetails(boolean errorsQuerySubjectDetails) {
        this.errorsQuerySubjectDetails = errorsQuerySubjectDetails;
    }
    
}
