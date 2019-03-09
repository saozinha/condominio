package br.com.oslourencos.condominio.repository;

import java.util.List;
 
 
import org.springframework.data.jpa.repository.JpaRepository; 

import br.com.oslourencos.condominio.entity.GrupoEntity;
import br.com.oslourencos.condominio.entity.UsuarioEntity;

public interface GrupoRepository extends JpaRepository<GrupoEntity, Long>{
	 
		List<GrupoEntity> findByUsuariosIn(UsuarioEntity usuarioEntity);

}
