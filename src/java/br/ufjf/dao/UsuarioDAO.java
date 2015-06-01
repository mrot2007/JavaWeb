/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.ufjf.dao;

import br.ufjf.dao.exceptions.IllegalOrphanException;
import br.ufjf.dao.exceptions.NonexistentEntityException;
import java.io.Serializable;
import javax.persistence.Query;
import javax.persistence.EntityNotFoundException;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import br.ufjf.model.Usuario;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.NoResultException;
import javax.persistence.NonUniqueResultException;

/**
 *
 * @author Daves
 */
public class UsuarioDAO implements Serializable {

    public UsuarioDAO (EntityManagerFactory emf) {
        this.emf = emf;
    }
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    
    public Usuario getUserByLoginAndPassword(String login, String senha){
        Query q = getEntityManager()
                .createNamedQuery("User.findExistsUser");
        q.setParameter("login", login);
        q.setParameter("senha", senha);

        try {
            return (Usuario) q.getSingleResult();
        } catch (NoResultException e) {
            return null;
        } catch (NonUniqueResultException e) {
            List<Usuario> lista = q.getResultList();
            return lista.get(0);
        }
    }
    
}