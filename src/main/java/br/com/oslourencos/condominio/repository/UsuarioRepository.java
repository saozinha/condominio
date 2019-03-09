package br.com.oslourencos.condominio.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import br.com.oslourencos.condominio.entity.UsuarioEntity;

// Um repositorio utiliza  Spring Data , dispensa a criacao de sql, dispensa o uso de EntityManager 
public interface UsuarioRepository  extends JpaRepository<UsuarioEntity, Long> {
	 
		UsuarioEntity findByLogin(String login);

}
