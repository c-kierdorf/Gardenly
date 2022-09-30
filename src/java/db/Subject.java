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
@Table(name = "subject")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Subject.findAll", query = "SELECT u FROM Subject u"),
    @NamedQuery(name = "Subject.findBySubjectId", query = "SELECT s FROM Subject s WHERE s.subjectId = :subjectId"),
    @NamedQuery(name = "Subject.findByNickName", query = "SELECT s FROM Subject s WHERE s.nickName like :name"),
    @NamedQuery(name = "Subject.findByAge", query = "SELECT s FROM Subject s WHERE s.age = :age"),
    @NamedQuery(name = "Subject.findByGender", query = "SELECT s FROM Subject s WHERE s.gender = :gender"),
    @NamedQuery(name = "Subject.findByEmail", query = "SELECT s FROM Subject s WHERE s.email = :email"),
    @NamedQuery(name = "Subject.findByVersion", query = "SELECT s FROM Subject s WHERE s.version = :version")})
public class Subject implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "subject_id")
    private Integer subjectId;
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
    @Size(max = 40)
    @Column(name = "email")
    private String email;
    @Basic(optional = false)
    @NotNull
    @Version
    private int version;
    
    public Subject() {
    }
    
    public Subject(Integer subjectId) {
        this.subjectId = subjectId;
    }

    public Subject(String nickName, Integer age, String gender, String email) {
        this.nickName = nickName;
        this.age = age;
        this.gender = gender;
        this.email = email;
    }

    public Subject(String nickName, Integer age, String gender) {
        this.nickName = nickName;
        this.age = age;
        this.gender = gender;
    }

    public Integer getSubjectId() {
        return subjectId;
    }

    public void setSubjectId(Integer subjectId) {
        this.subjectId = subjectId;
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
        hash += (subjectId != null ? subjectId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Subject)) {
            return false;
        }
        Subject other = (Subject) object;
        if ((this.subjectId == null && other.subjectId != null) || (this.subjectId != null && !this.subjectId.equals(other.subjectId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "db.Subject[ subjectId=" + subjectId + " ]";
    }

}
