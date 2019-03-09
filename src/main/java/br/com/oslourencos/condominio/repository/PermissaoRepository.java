package br.com.oslourencos.condominio.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
 
import br.com.oslourencos.condominio.entity.GrupoEntity;
import br.com.oslourencos.condominio.entity.PermissaoEntity;
 
 
public interface PermissaoRepository extends JpaRepository<PermissaoEntity, Long> {
 
	List<PermissaoEntity> findByGruposIn(GrupoEntity grupoEntity);
}
