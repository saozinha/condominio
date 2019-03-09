package br.com.oslourencos.condominio.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
 

import org.springframework.transaction.annotation.Transactional;
import br.com.oslourencos.condominio.model.GrupoModel;
import br.com.oslourencos.condominio.entity.GrupoEntity;
import br.com.oslourencos.condominio.repository.GrupoRepository;


/**
 * @author conceicao lourenco
 *
 * Classe para acessar dados dos grupos cadastrados no banco de dados
 */
@Service
@Transactional
public class GrupoService {

	@Autowired
	private GrupoRepository grupoRepository;
 
	/**CONSULA OS GRUPOS CADASTRADOS*/
	@Transactional(readOnly = true)
	public List<GrupoModel> consultarGrupos(){
 
		List<GrupoModel> gruposModel =  new ArrayList<GrupoModel>();
 
		/*CONSULTA TODOS OS GRUPOS*/
		List<GrupoEntity> gruposEntity = this.grupoRepository.findAll();
 
 
	    gruposEntity.forEach(grupo ->{ 
		   gruposModel.add(new GrupoModel(grupo.getCodigo(), grupo.getDescricao())); 
	    });
 
		return gruposModel;
	}
	
}
