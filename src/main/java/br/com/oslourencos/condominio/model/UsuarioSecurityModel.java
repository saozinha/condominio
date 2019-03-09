package br.com.oslourencos.condominio.model;

import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User; 


/**
 * @author conceicao
 * 
 * Esta classe sera usada para dar as devidas permissoes ao usuario
 *
 */
public class UsuarioSecurityModel extends User {
	 
		private static final long serialVersionUID = 1L;
	 
		public UsuarioSecurityModel(String login, String senha,Boolean ativo,  Collection<? extends GrantedAuthority> authorities) {		
			super(login, senha, ativo,	true, true,true, authorities);
		}	
}
