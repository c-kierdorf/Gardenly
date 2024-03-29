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
@Table(name = "prequestionnaire")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "PreQuestionnaire.findAll", query = "SELECT p FROM PreQuestionnaire p"),
    @NamedQuery(name = "PreQuestionnaire.findByPreQuestionnaireId", query = "SELECT p FROM PreQuestionnaire p WHERE p.preQuestionnaireId = :preQuestionnaireId"),
    @NamedQuery(name = "PreQuestionnaire.findByErwartungen", query = "SELECT p FROM PreQuestionnaire p WHERE p.erwartungen like :erwartungen"),
    @NamedQuery(name = "PreQuestionnaire.findByVersion", query = "SELECT p FROM PreQuestionnaire p WHERE p.version = :version")})
public class PreQuestionnaire implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "prequestionnaire_id")
    private Integer preQuestionnaireId;
    @Basic(optional = false)
    @NotNull
    @Size(max = 40)
    @Column(name = "haeufigkeit_pflanzenpflege")
    private String haeufigkeitPflanzenpflege;
    @Basic(optional = false)
    @NotNull
    @Size(max = 40)
    @Column(name = "erfahrung_automatisierte_pflanzenpflege")
    private String erfahrungAutomatisiertePflanzenpflege;
    @Basic(optional = false)
    @NotNull
    @Size(max = 40)
    @Column(name = "einstellung_zu_technik")
    private String technik;
    @Basic(optional = false)
    @NotNull
    @Size(max = 40)
    @Column(name = "einstellung_zu_smarthome")
    private String smartHome;
    @Basic(optional = false)
    @NotNull
    @Column(name = "erwartungen")
    private String erwartungen;
    @JoinColumn(name = "participant_fk", referencedColumnName = "participant_id")
    @ManyToOne(optional = false)
    private Participant participantFk;
    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "date")
    private Date date;
    @Basic(optional = false)
    @NotNull
    @Version
    private int version;
    
    public PreQuestionnaire() {
    }
    
    public PreQuestionnaire(Integer preQuestionnaireId) {
        this.preQuestionnaireId = preQuestionnaireId;
    }

    public PreQuestionnaire(Participant participant,
                           String haeufigkeitPflanzenpflege,
                           String erfahrungAutomatisiertePflanzenpflege,
                           String technik,
                           String smartHome,
                           String erwartungen, 
                           Date date) {
        this.participantFk = participant;
        this.haeufigkeitPflanzenpflege = haeufigkeitPflanzenpflege;
        this.erfahrungAutomatisiertePflanzenpflege = erfahrungAutomatisiertePflanzenpflege;
        this.technik = technik;
        this.smartHome = smartHome;
        this.erwartungen = erwartungen;
        this.date = date;
    }

    public Integer getPreQuestionnaireId() {
        return preQuestionnaireId;
    }

    public void setPreQuestionnaireId(Integer preQuestionnaireId) {
        this.preQuestionnaireId = preQuestionnaireId;
    }

    public String getHaeufigkeitPflanzenpflege() {
        return haeufigkeitPflanzenpflege;
    }

    public void setHaeufigkeitPflanzenpflege(String haeufigkeitPflanzenpflege) {
        this.haeufigkeitPflanzenpflege = haeufigkeitPflanzenpflege;
    }

    public String getErfahrungAutomatisiertePflanzenpflege() {
        return erfahrungAutomatisiertePflanzenpflege;
    }

    public void setErfahrungAutomatisiertePflanzenpflege(String erfahrungAutomatisiertePflanzenpflege) {
        this.erfahrungAutomatisiertePflanzenpflege = erfahrungAutomatisiertePflanzenpflege;
    }

    public String getTechnik() {
        return technik;
    }

    public void setTechnik(String technik) {
        this.technik = technik;
    }

    public String getSmartHome() {
        return smartHome;
    }

    public void setSmartHome(String smartHome) {
        this.smartHome = smartHome;
    }

    public String getErwartungen() {
        return erwartungen;
    }

    public void setErwartungen(String erwartungen) {
        this.erwartungen = erwartungen;
    }

    public Participant getParticipantFk() {
        return participantFk;
    }

    public void setParticipantFk(Participant participantFk) {
        this.participantFk = participantFk;
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
        hash += (preQuestionnaireId != null ? preQuestionnaireId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof PreQuestionnaire)) {
            return false;
        }
        PreQuestionnaire other = (PreQuestionnaire) object;
        if ((this.preQuestionnaireId == null && other.preQuestionnaireId != null) || (this.preQuestionnaireId != null && !this.preQuestionnaireId.equals(other.preQuestionnaireId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "db.PreQuestionnaire[ preQuestionnaireId=" + preQuestionnaireId + " ]";
    }

}
