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
    @Column(name = "pe1")
    private String pe1;
    @Basic(optional = false)
    @NotNull
    @Size(max = 40)
    @Column(name = "pe2")
    private String pe2;
    @Basic(optional = false)
    @NotNull
    @Size(max = 40)
    @Column(name = "pe3")
    private String pe3;
    @Basic(optional = false)
    @NotNull
    @Size(max = 40)
    @Column(name = "pe4")
    private String pe4;
    @Basic(optional = false)
    @NotNull
    @Size(max = 40)
    @Column(name = "ee1")
    private String ee1;
    @Basic(optional = false)
    @NotNull
    @Size(max = 40)
    @Column(name = "ee2")
    private String ee2;
    @Basic(optional = false)
    @NotNull
    @Size(max = 40)
    @Column(name = "ee3")
    private String ee3;
    @Basic(optional = false)
    @NotNull
    @Size(max = 40)
    @Column(name = "ee4")
    private String ee4;
    @Basic(optional = false)
    @NotNull
    @Size(max = 40)
    @Column(name = "si1")
    private String si1;
    @Basic(optional = false)
    @NotNull
    @Size(max = 40)
    @Column(name = "si2")
    private String si2;
    @Basic(optional = false)
    @NotNull
    @Size(max = 40)
    @Column(name = "si3")
    private String si3;
    @Basic(optional = false)
    @NotNull
    @Size(max = 40)
    @Column(name = "fc1")
    private String fc1;
    @Basic(optional = false)
    @NotNull
    @Size(max = 40)
    @Column(name = "fc2")
    private String fc2;
    @Basic(optional = false)
    @NotNull
    @Size(max = 40)
    @Column(name = "fc3")
    private String fc3;
    @Basic(optional = false)
    @NotNull
    @Size(max = 40)
    @Column(name = "fc4")
    private String fc4;
    @Basic(optional = false)
    @NotNull
    @Size(max = 40)
    @Column(name = "hm1")
    private String hm1;
    @Basic(optional = false)
    @NotNull
    @Size(max = 40)
    @Column(name = "hm2")
    private String hm2;
    @Basic(optional = false)
    @NotNull
    @Size(max = 40)
    @Column(name = "hm3")
    private String hm3;
    @Basic(optional = false)
    @NotNull
    @Size(max = 40)
    @Column(name = "pv1")
    private String pv1;
    @Basic(optional = false)
    @NotNull
    @Size(max = 40)
    @Column(name = "pv2")
    private String pv2;
    @Basic(optional = false)
    @NotNull
    @Size(max = 40)
    @Column(name = "pv3")
    private String pv3;
    @Basic(optional = false)
    @NotNull
    @Size(max = 40)
    @Column(name = "ht1")
    private String ht1;
    @Basic(optional = false)
    @NotNull
    @Size(max = 40)
    @Column(name = "ht2")
    private String ht2;
    @Basic(optional = false)
    @NotNull
    @Size(max = 40)
    @Column(name = "ht3")
    private String ht3;
    @Basic(optional = false)
    @NotNull
    @Size(max = 40)
    @Column(name = "ht4")
    private String ht4;
    @Basic(optional = false)
    @NotNull
    @Size(max = 40)
    @Column(name = "bi1")
    private String bi1;
    @Basic(optional = false)
    @NotNull
    @Size(max = 40)
    @Column(name = "bi2")
    private String bi2;
    @Basic(optional = false)
    @NotNull
    @Size(max = 40)
    @Column(name = "bi3")
    private String bi3;
    @Basic(optional = false)
    @NotNull
    @Size(max = 40)
    @Column(name = "use")
    private String use;
    @Basic(optional = false)
    @NotNull
    @Size(max = 40)
    @Column(name = "sq1")
    private String sq1;
    @Basic(optional = false)
    @NotNull
    @Size(max = 40)
    @Column(name = "sq2")
    private String sq2;
    @Basic(optional = false)
    @NotNull
    @Size(max = 40)
    @Column(name = "sq3")
    private String sq3;
    @Basic(optional = false)
    @NotNull
    @Size(max = 40)
    @Column(name = "sq4")
    private String sq4;
    @Basic(optional = false)
    @NotNull
    @Size(max = 40)
    @Column(name = "sq5")
    private String sq5;
    @Basic(optional = false)
    @NotNull
    @Size(max = 40)
    @Column(name = "hq1")
    private String hq1;
    @Basic(optional = false)
    @NotNull
    @Size(max = 40)
    @Column(name = "hq2")
    private String hq2;
    @Basic(optional = false)
    @NotNull
    @Size(max = 40)
    @Column(name = "hq3")
    private String hq3;
    @Basic(optional = false)
    @NotNull
    @Size(max = 40)
    @Column(name = "hq4")
    private String hq4;
    @Basic(optional = false)
    @NotNull
    @Size(max = 40)
    @Column(name = "hq5")
    private String hq5;
    @Basic(optional = false)
    @NotNull
    @Column(name = "lob")
    private String lob;
    @Basic(optional = false)
    @NotNull
    @Column(name = "kritik")
    private String kritik;
    @Basic(optional = false)
    @NotNull
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
            String pe1, 
            String pe2, 
            String pe3, 
            String pe4, 
            String ee1, 
            String ee2, 
            String ee3, 
            String ee4, 
            String si1, 
            String si2, 
            String si3, 
            String fc1, 
            String fc2, 
            String fc3, 
            String fc4, 
            String hm1, 
            String hm2, 
            String hm3, 
            String pv1,
            String pv2,
            String pv3,
            String ht1,
            String ht2,
            String ht3,
            String ht4,
            String bi1,
            String bi2,
            String bi3,
            String use,
            String sq1,
            String sq2,
            String sq3,
            String sq4,
            String sq5,
            String hq1,
            String hq2,
            String hq3,
            String hq4,
            String hq5,
            String lob,
            String kritik,  
            String weiterentwicklung, 
            Date date) {
        this.pe1 = pe1;
        this.pe2 = pe2;
        this.pe3 = pe3;
        this.pe4 = pe4;
        this.ee1 = ee1;
        this.ee2 = ee2;
        this.ee3 = ee3;
        this.ee4 = ee4;
        this.si1 = si1;
        this.si2 = si2;
        this.si3 = si3;
        this.fc1 = fc1;
        this.fc2 = fc2;
        this.fc3 = fc3;
        this.fc4 = fc4;
        this.hm1 = hm1;
        this.hm2 = hm2;
        this.hm3 = hm3;
        this.pv1 = pv1;
        this.pv2 = pv2;
        this.pv3 = pv3;
        this.ht1 = ht1;
        this.ht2 = ht2;
        this.ht3 = ht3;
        this.ht4 = ht4;
        this.bi1 = bi1;
        this.bi2 = bi2;
        this.bi3 = bi3;
        this.use = use;
        this.sq1 = sq1;
        this.sq2 = sq2;
        this.sq3 = sq3;
        this.sq4 = sq4;
        this.sq5 = sq5;
        this.hq1 = hq1;
        this.hq2 = hq2;
        this.hq3 = hq3;
        this.hq4 = hq4;
        this.hq5 = hq5;
        this.lob = lob;
        this.kritik = kritik;
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

    public String getPe1() {
        return pe1;
    }

    public void setPe1(String pe1) {
        this.pe1 = pe1;
    }

    public String getPe2() {
        return pe2;
    }

    public void setPe2(String pe2) {
        this.pe2 = pe2;
    }

    public String getPe3() {
        return pe3;
    }

    public void setPe3(String pe3) {
        this.pe3 = pe3;
    }

    public String getPe4() {
        return pe4;
    }

    public void setPe4(String pe4) {
        this.pe4 = pe4;
    }

    public String getEe1() {
        return ee1;
    }

    public void setEe1(String ee1) {
        this.ee1 = ee1;
    }

    public String getEe2() {
        return ee2;
    }

    public void setEe2(String ee2) {
        this.ee2 = ee2;
    }

    public String getEe3() {
        return ee3;
    }

    public void setEe3(String ee3) {
        this.ee3 = ee3;
    }

    public String getEe4() {
        return ee4;
    }

    public void setEe4(String ee4) {
        this.ee4 = ee4;
    }

    public String getSi1() {
        return si1;
    }

    public void setSi1(String si1) {
        this.si1 = si1;
    }

    public String getSi2() {
        return si2;
    }

    public void setSi2(String si2) {
        this.si2 = si2;
    }

    public String getSi3() {
        return si3;
    }

    public void setSi3(String si3) {
        this.si3 = si3;
    }

    public String getFc1() {
        return fc1;
    }

    public void setFc1(String fc1) {
        this.fc1 = fc1;
    }

    public String getFc2() {
        return fc2;
    }

    public void setFc2(String fc2) {
        this.fc2 = fc2;
    }

    public String getFc3() {
        return fc3;
    }

    public void setFc3(String fc3) {
        this.fc3 = fc3;
    }

    public String getFc4() {
        return fc4;
    }

    public void setFc4(String fc4) {
        this.fc4 = fc4;
    }

    public String getHm1() {
        return hm1;
    }

    public void setHm1(String hm1) {
        this.hm1 = hm1;
    }

    public String getHm2() {
        return hm2;
    }

    public void setHm2(String hm2) {
        this.hm2 = hm2;
    }

    public String getHm3() {
        return hm3;
    }

    public void setHm3(String hm3) {
        this.hm3 = hm3;
    }

    public String getPv1() {
        return pv1;
    }

    public void setPv1(String pv1) {
        this.pv1 = pv1;
    }

    public String getPv2() {
        return pv2;
    }

    public void setPv2(String pv2) {
        this.pv2 = pv2;
    }

    public String getPv3() {
        return pv3;
    }

    public void setPv3(String pv3) {
        this.pv3 = pv3;
    }

    public String getHt1() {
        return ht1;
    }

    public void setHt1(String ht1) {
        this.ht1 = ht1;
    }

    public String getHt2() {
        return ht2;
    }

    public void setHt2(String ht2) {
        this.ht2 = ht2;
    }

    public String getHt3() {
        return ht3;
    }

    public void setHt3(String ht3) {
        this.ht3 = ht3;
    }

    public String getHt4() {
        return ht4;
    }

    public void setHt4(String ht4) {
        this.ht4 = ht4;
    }

    public String getBi1() {
        return bi1;
    }

    public void setBi1(String bi1) {
        this.bi1 = bi1;
    }

    public String getBi2() {
        return bi2;
    }

    public void setBi2(String bi2) {
        this.bi2 = bi2;
    }

    public String getBi3() {
        return bi3;
    }

    public void setBi3(String bi3) {
        this.bi3 = bi3;
    }

    public String getUse() {
        return use;
    }

    public void setUse(String use) {
        this.use = use;
    }

    public String getSq1() {
        return sq1;
    }

    public void setSq1(String sq1) {
        this.sq1 = sq1;
    }

    public String getSq2() {
        return sq2;
    }

    public void setSq2(String sq2) {
        this.sq2 = sq2;
    }

    public String getSq3() {
        return sq3;
    }

    public void setSq3(String sq3) {
        this.sq3 = sq3;
    }

    public String getSq4() {
        return sq4;
    }

    public void setSq4(String sq4) {
        this.sq4 = sq4;
    }

    public String getSq5() {
        return sq5;
    }

    public void setSq5(String sq5) {
        this.sq5 = sq5;
    }

    public String getHq1() {
        return hq1;
    }

    public void setHq1(String hq1) {
        this.hq1 = hq1;
    }

    public String getHq2() {
        return hq2;
    }

    public void setHq2(String hq2) {
        this.hq2 = hq2;
    }

    public String getHq3() {
        return hq3;
    }

    public void setHq3(String hq3) {
        this.hq3 = hq3;
    }

    public String getHq4() {
        return hq4;
    }

    public void setHq4(String hq4) {
        this.hq4 = hq4;
    }

    public String getHq5() {
        return hq5;
    }

    public void setHq5(String hq5) {
        this.hq5 = hq5;
    }
    
    public String getLob() {
        return lob;
    }

    public void setLob(String lob) {
        this.lob = lob;
    }

    public String getKritik() {
        return kritik;
    }

    public void setKritik(String kritik) {
        this.kritik = kritik;
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
