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
@Table(name = "postquestionaire")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "PostQuestionaire.findAll", query = "SELECT p FROM PostQuestionaire p"),
    @NamedQuery(name = "PostQuestionaire.findByPostQuestionaireId", query = "SELECT p FROM PostQuestionaire p WHERE p.postQuestionaireId = :postQuestionaireId"),
    @NamedQuery(name = "PostQuestionaire.findByQ1", query = "SELECT p FROM PostQuestionaire p WHERE p.q1 like :q1"),
    @NamedQuery(name = "PostQuestionaire.findByQ2", query = "SELECT p FROM PostQuestionaire p WHERE p.q2 like :q2"),
    @NamedQuery(name = "PostQuestionaire.findByQ3", query = "SELECT p FROM PostQuestionaire p WHERE p.q3 like :q3"),
    @NamedQuery(name = "PostQuestionaire.findByQ4", query = "SELECT p FROM PostQuestionaire p WHERE p.q4 like :q4"),
    @NamedQuery(name = "PostQuestionaire.findByQ5", query = "SELECT p FROM PostQuestionaire p WHERE p.q5 like :q5"),
    @NamedQuery(name = "PostQuestionaire.findByQ6", query = "SELECT p FROM PostQuestionaire p WHERE p.q6 like :q6"),
    @NamedQuery(name = "PostQuestionaire.findByQ7", query = "SELECT p FROM PostQuestionaire p WHERE p.q7 like :q7"),
    @NamedQuery(name = "PostQuestionaire.findByQ8", query = "SELECT p FROM PostQuestionaire p WHERE p.q8 like :q8"),
    @NamedQuery(name = "PostQuestionaire.findByQ9", query = "SELECT p FROM PostQuestionaire p WHERE p.q9 like :q9"),
    @NamedQuery(name = "PostQuestionaire.findByQ10", query = "SELECT p FROM PostQuestionaire p WHERE p.q10 like :q10"),
    @NamedQuery(name = "PostQuestionaire.findByQ11", query = "SELECT p FROM PostQuestionaire p WHERE p.q11 like :q11"),
    @NamedQuery(name = "PostQuestionaire.findByQ12", query = "SELECT p FROM PostQuestionaire p WHERE p.q12 like :q12"),
    @NamedQuery(name = "PostQuestionaire.findByQ13", query = "SELECT p FROM PostQuestionaire p WHERE p.q13 like :q14"),
    @NamedQuery(name = "PostQuestionaire.findByQ14", query = "SELECT p FROM PostQuestionaire p WHERE p.q14 like :q15"),
    @NamedQuery(name = "PostQuestionaire.findByQ15", query = "SELECT p FROM PostQuestionaire p WHERE p.q15 like :q16"),
    @NamedQuery(name = "PostQuestionaire.findByQ16", query = "SELECT p FROM PostQuestionaire p WHERE p.q16 like :q17"),
    @NamedQuery(name = "PostQuestionaire.findByQ17", query = "SELECT p FROM PostQuestionaire p WHERE p.q17 like :q18"),
    @NamedQuery(name = "PostQuestionaire.findByQ18", query = "SELECT p FROM PostQuestionaire p WHERE p.q18 like :q19"),
    @NamedQuery(name = "PostQuestionaire.findByQ19", query = "SELECT p FROM PostQuestionaire p WHERE p.q19 like :q19"),
    @NamedQuery(name = "PostQuestionaire.findByKritik", query = "SELECT p FROM PostQuestionaire p WHERE p.kritik like :kritik"),
    @NamedQuery(name = "PostQuestionaire.findByLob", query = "SELECT p FROM PostQuestionaire p WHERE p.lob like :lob"),
    @NamedQuery(name = "PostQuestionaire.findByWeiterentwicklung", query = "SELECT p FROM PostQuestionaire p WHERE p.weiterentwicklung like :weiterentwicklung"),
    @NamedQuery(name = "PostQuestionaire.findByVersion", query = "SELECT p FROM PostQuestionaire p WHERE p.version = :version")})
public class PostQuestionaire implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "preQuestionaire_id")
    private Integer postQuestionaireId;
    @Basic(optional = false)
    @NotNull
    @Size(max = 40)
    @Column(name = "q1")
    private String q1;
    @Basic(optional = false)
    @NotNull
    @Size(max = 40)
    @Column(name = "q2")
    private String q2;
    @Basic(optional = false)
    @NotNull
    @Size(max = 40)
    @Column(name = "q3")
    private String q3;
    @Basic(optional = false)
    @NotNull
    @Size(max = 40)
    @Column(name = "q4")
    private String q4;
    @Basic(optional = false)
    @NotNull
    @Size(max = 40)
    @Column(name = "q5")
    private String q5;
    @Basic(optional = false)
    @NotNull
    @Size(max = 40)
    @Column(name = "q6")
    private String q6;
    @Basic(optional = false)
    @NotNull
    @Size(max = 40)
    @Column(name = "q7")
    private String q7;
    @Basic(optional = false)
    @NotNull
    @Size(max = 40)
    @Column(name = "q8")
    private String q8;
    @Basic(optional = false)
    @NotNull
    @Size(max = 40)
    @Column(name = "q9")
    private String q9;
    @Basic(optional = false)
    @NotNull
    @Size(max = 40)
    @Column(name = "q10")
    private String q10;
    @Basic(optional = false)
    @NotNull
    @Size(max = 40)
    @Column(name = "q11")
    private String q11;
    @Basic(optional = false)
    @NotNull
    @Size(max = 40)
    @Column(name = "q12")
    private String q12;
    @Basic(optional = false)
    @NotNull
    @Size(max = 40)
    @Column(name = "q13")
    private String q13;
    @Basic(optional = false)
    @NotNull
    @Size(max = 40)
    @Column(name = "q14")
    private String q14;
    @Basic(optional = false)
    @NotNull
    @Size(max = 40)
    @Column(name = "q15")
    private String q15;
    @Basic(optional = false)
    @NotNull
    @Size(max = 40)
    @Column(name = "q16")
    private String q16;
    @Basic(optional = false)
    @NotNull
    @Size(max = 40)
    @Column(name = "q17")
    private String q17;
    @Basic(optional = false)
    @NotNull
    @Size(max = 40)
    @Column(name = "q18")
    private String q18;
    @Basic(optional = false)
    @NotNull
    @Size(max = 40)
    @Column(name = "q19")
    private String q19;
    @Basic(optional = false)
    @NotNull
    @Size(max = 40)
    @Column(name = "kritik")
    private String kritik;
    @Basic(optional = false)
    @NotNull
    @Size(max = 40)
    @Column(name = "lob")
    private String lob;
    @Basic(optional = false)
    @NotNull
    @Size(max = 40)
    @Column(name = "weiterentwicklung")
    private String weiterentwicklung;
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
    
    public PostQuestionaire() {
    }
    
    public PostQuestionaire(Integer postQuestionaireId) {
        this.postQuestionaireId = postQuestionaireId;
    }

    public PostQuestionaire(Participant participantFk, 
            String q1, 
            String q2, 
            String q3, 
            String q4, 
            String q5, 
            String q6, 
            String q7, 
            String q8, 
            String q9, 
            String q10, 
            String q11, 
            String q12, 
            String q13, 
            String q14, 
            String q15, 
            String q16, 
            String q17, 
            String q18, 
            String q19, 
            String kritik, 
            String lob, 
            String weiterentwicklung, 
            Date date) {
        this.q1 = q1;
        this.q2 = q2;
        this.q3 = q3;
        this.q4 = q4;
        this.q5 = q5;
        this.q6 = q6;
        this.q7 = q7;
        this.q8 = q8;
        this.q9 = q9;
        this.q10 = q10;
        this.q11 = q11;
        this.q12 = q12;
        this.q13 = q13;
        this.q14 = q14;
        this.q15 = q15;
        this.q16 = q16;
        this.q17 = q17;
        this.q18 = q18;
        this.q19 = q19;
        this.kritik = kritik;
        this.lob = lob;
        this.weiterentwicklung = weiterentwicklung;
        this.participantFk = participantFk;
        this.date = date;
    }

    public Integer getPostQuestionaireId() {
        return postQuestionaireId;
    }

    public void setPostQuestionaireId(Integer postQuestionaireId) {
        this.postQuestionaireId = postQuestionaireId;
    }

    public String getQ1() {
        return q1;
    }

    public void setQ1(String q1) {
        this.q1 = q1;
    }

    public String getQ2() {
        return q2;
    }

    public void setQ2(String q2) {
        this.q2 = q2;
    }

    public String getQ3() {
        return q3;
    }

    public void setQ3(String q3) {
        this.q3 = q3;
    }

    public String getQ4() {
        return q4;
    }

    public void setQ4(String q4) {
        this.q4 = q4;
    }

    public String getQ5() {
        return q5;
    }

    public void setQ5(String q5) {
        this.q5 = q5;
    }

    public String getQ6() {
        return q6;
    }

    public void setQ6(String q6) {
        this.q6 = q6;
    }

    public String getQ7() {
        return q7;
    }

    public void setQ7(String q7) {
        this.q7 = q7;
    }

    public String getQ8() {
        return q8;
    }

    public void setQ8(String q8) {
        this.q8 = q8;
    }

    public String getQ9() {
        return q9;
    }

    public void setQ9(String q9) {
        this.q9 = q9;
    }

    public String getQ10() {
        return q10;
    }

    public void setQ10(String q10) {
        this.q10 = q10;
    }

    public String getQ11() {
        return q11;
    }

    public void setQ11(String q11) {
        this.q11 = q11;
    }

    public String getQ12() {
        return q12;
    }

    public void setQ12(String q12) {
        this.q12 = q12;
    }

    public String getQ13() {
        return q13;
    }

    public void setQ13(String q13) {
        this.q13 = q13;
    }

    public String getQ14() {
        return q14;
    }

    public void setQ14(String q14) {
        this.q14 = q14;
    }

    public String getQ15() {
        return q15;
    }

    public void setQ15(String q15) {
        this.q15 = q15;
    }

    public String getQ16() {
        return q16;
    }

    public void setQ16(String q16) {
        this.q16 = q16;
    }

    public String getQ17() {
        return q17;
    }

    public void setQ17(String q17) {
        this.q17 = q17;
    }

    public String getQ18() {
        return q18;
    }

    public void setQ18(String q18) {
        this.q18 = q18;
    }

    public String getQ19() {
        return q19;
    }

    public void setQ19(String q19) {
        this.q19 = q19;
    }

    public String getKritik() {
        return kritik;
    }

    public void setKritik(String kritik) {
        this.kritik = kritik;
    }

    public String getLob() {
        return lob;
    }

    public void setLob(String lob) {
        this.lob = lob;
    }

    public String getWeiterentwicklung() {
        return weiterentwicklung;
    }

    public void setWeiterentwicklung(String weiterentwicklung) {
        this.weiterentwicklung = weiterentwicklung;
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
        hash += (postQuestionaireId != null ? postQuestionaireId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof PostQuestionaire)) {
            return false;
        }
        PostQuestionaire other = (PostQuestionaire) object;
        if ((this.postQuestionaireId == null && other.postQuestionaireId != null) || (this.postQuestionaireId != null && !this.postQuestionaireId.equals(other.postQuestionaireId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "db.PostQuestionaire[ postQuestionaireId=" + postQuestionaireId + " ]";
    }

}
