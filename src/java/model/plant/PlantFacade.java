package model.plant;

import db.Plant;
import java.util.List;
import javax.ejb.LocalBean;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

@Stateless
@LocalBean
public class PlantFacade extends AbstractFacade<Plant> {

    @PersistenceContext(unitName = "GardenlyPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public PlantFacade() {
        super(Plant.class);
    }
    
    public Plant findPlantById(Integer id) {
        return em.find(Plant.class, id);
    }
    
    public List<Plant> findPlantByName(String name) {
        Query plantNameQuery = em.createNamedQuery("Plant.findByName");
        plantNameQuery.setParameter("name", name);
        return plantNameQuery.getResultList();
    }
    
    public List<Plant> findPlantByScientificName(String scientificName) {
        Query plantNameQuery = em.createNamedQuery("Plant.findByScientificName");
        plantNameQuery.setParameter("scientificName", scientificName);
        return plantNameQuery.getResultList();
    }
}
