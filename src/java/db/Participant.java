package db;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Version;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

@Entity
@Table(name = "participants")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Participant.findAll", query = "SELECT u FROM Participant u"),
    @NamedQuery(name = "Participant.findByParticipantId", query = "SELECT s FROM Participant s WHERE s.participantId = :participantId"),
    @NamedQuery(name = "Participant.findByNickName", query = "SELECT s FROM Participant s WHERE s.nickName like :name"),
    @NamedQuery(name = "Participant.findByAge", query = "SELECT s FROM Participant s WHERE s.age = :age"),
    @NamedQuery(name = "Participant.findByGender", query = "SELECT s FROM Participant s WHERE s.gender = :gender"),
    @NamedQuery(name = "Participant.findByEducation", query = "SELECT s FROM Participant s WHERE s.education = :education"),
    @NamedQuery(name = "Participant.findByProfession", query = "SELECT s FROM Participant s WHERE s.profession = :profession"),
    @NamedQuery(name = "Participant.findByEmail", query = "SELECT s FROM Participant s WHERE s.email = :email"),
    @NamedQuery(name = "Participant.findByVersion", query = "SELECT s FROM Participant s WHERE s.version = :version")})
public class Participant implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "participant_id")
    private Integer participantId;
    @Basic(optional = false)
    @NotNull
    @Size(max = 40)
    @Column(name = "nick_name")
    private String nickName;
    @Basic(optional = false)
    @NotNull
    @Column(name = "age")
    private Integer age;
    @Basic(optional = false)
    @NotNull
    @Column(name = "gender")
    @Size(max = 1)
    private String gender;
    @Basic(optional = false)
    @NotNull
    @Size(max = 40)
    @Column(name = "education")
    private String education;
    @Basic(optional = false)
    @NotNull
    @Size(max = 40)
    @Column(name = "profession")
    private String profession;
    @Size(max = 40)
    @Column(name = "email")
    private String email;
    @Basic(optional = false)
    @NotNull
    @Version
    private int version;
    
    public Participant() {
    }
    
    public Participant(Integer participantId) {
        this.participantId = participantId;
    }

    public Participant(String nickName, 
                       Integer age, 
                       String gender, 
                       String education,
                       String profession,
                       String email) {
        this.nickName = nickName;
        this.age = age;
        this.gender = gender;
        this.email = email;
        this.education = education;
        this.profession = profession;
    }

    public Participant(String nickName,
                       Integer age, 
                       String gender,
                       String education,
                       String profession) {
        this.nickName = nickName;
        this.age = age;
        this.gender = gender;
        this.education = education;
        this.profession = profession;
    }

    public Integer getParticipantId() {
        return participantId;
    }

    public void setParticipantId(Integer participantId) {
        this.participantId = participantId;
    }

    public String getNickName() {
        return nickName;
    }

    public void setNickName(String nickName) {
        this.nickName = nickName;
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getEducation() {
        return education;
    }

    public void setEducation(String education) {
        this.education = education;
    }

    public String getProfession() {
        return profession;
    }

    public void setProfession(String profession) {
        this.profession = profession;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
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
        hash += (participantId != null ? participantId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Participant)) {
            return false;
        }
        Participant other = (Participant) object;
        if ((this.participantId == null && other.participantId != null) || (this.participantId != null && !this.participantId.equals(other.participantId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "db.Participant[ participantId=" + participantId + " ]";
    }

}
