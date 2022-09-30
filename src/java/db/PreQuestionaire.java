package db;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Version;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

@Entity
@Table(name = "prequestionaire")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "PreQuestionaire.findAll", query = "SELECT p FROM PreQuestionaire p"),
    @NamedQuery(name = "PreQuestionaire.findByPreQuestionaireId", query = "SELECT p FROM PreQuestionaire p WHERE p.preQuestionaireId = :preQuestionaireId"),
    @NamedQuery(name = "PreQuestionaire.findByTechnik", query = "SELECT p FROM PreQuestionaire p WHERE p.technik like :technik"),
    @NamedQuery(name = "PreQuestionaire.findByErwartungen", query = "SELECT p FROM PreQuestionaire p WHERE p.erwartungen like :erwartungen"),
    @NamedQuery(name = "PreQuestionaire.findByVersion", query = "SELECT p FROM PreQuestionaire p WHERE p.version = :version")})
public class PreQuestionaire implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "preQuestionaire_id")
    private Integer preQuestionaireId;
    @Basic(optional = false)
    @NotNull
    @Size(max = 40)
    @Column(name = "technik")
    private String technik;
    @Basic(optional = false)
    @NotNull
    @Column(name = "erwartungen")
    private String erwartungen;
    @JoinColumn(name = "subject_fk", referencedColumnName = "subject_id")
    @ManyToOne(optional = false)
    private Subject subjectFk;
    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "date")
    private Date date;
    @Basic(optional = false)
    @NotNull
    @Version
    private int version;
    
    public PreQuestionaire() {
    }
    
    public PreQuestionaire(Integer preQuestionaireId) {
        this.preQuestionaireId = preQuestionaireId;
    }

    public PreQuestionaire(Subject subject, 
                           String technik, 
                           String erwartungen, 
                           Date date) {
        this.subjectFk = subject;
        this.technik = technik;
        this.erwartungen = erwartungen;
        this.date = date;
    }

    public Integer getPreQuestionaireId() {
        return preQuestionaireId;
    }

    public void setPreQuestionaireId(Integer preQuestionaireId) {
        this.preQuestionaireId = preQuestionaireId;
    }

    public String getTechnik() {
        return technik;
    }

    public void setTechnik(String technik) {
        this.technik = technik;
    }

    public String getErwartungen() {
        return erwartungen;
    }

    public void setErwartungen(String erwartungen) {
        this.erwartungen = erwartungen;
    }

    public Subject getSubjectFk() {
        return subjectFk;
    }

    public void setSubjectFk(Subject subjectFk) {
        this.subjectFk = subjectFk;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public int getVersion() {
        return version;
    }

    public void setVersion(int version) {
        this.version = version;
    }


    @Override
    public int hashCode() {
        int hash = 0;
        hash += (preQuestionaireId != null ? preQuestionaireId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof PreQuestionaire)) {
            return false;
        }
        PreQuestionaire other = (PreQuestionaire) object;
        if ((this.preQuestionaireId == null && other.preQuestionaireId != null) || (this.preQuestionaireId != null && !this.preQuestionaireId.equals(other.preQuestionaireId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "db.PreQuestionaire[ preQuestionaireId=" + preQuestionaireId + " ]";
    }

}
