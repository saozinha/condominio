package br.com.oslourencos.condominio.controller;

import java.util.List;

import javax.validation.Valid;
 
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
 
import br.com.oslourencos.condominio.model.GrupoModel;
import br.com.oslourencos.condominio.model.UsuarioModel;
import br.com.oslourencos.condominio.service.GrupoService;
import br.com.oslourencos.condominio.service.UsuarioService;
 
 
/**
 * @author conceicao lourenco
 *
 */
@Controller
@RequestMapping("/usuario") 
public class UsuarioController {
 
 
	@Autowired
	private GrupoService grupoService;
 
	 
	@Autowired 
	private UsuarioService usuarioService;
 
 
 
	/***
	 * Mapeamento de rota para page novo usuario
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/novo", method= RequestMethod.GET)	
	public ModelAndView novoCadastro(Model model) {
 
		/*LISTA DE GRUPOS QUE VAMOS MOSTRAR NA PÁGINA*/
		model.addAttribute("grupos", grupoService.consultarGrupos());
 
		/*OBJETO QUE VAMOS ATRIBUIR OS VALORES DOS CAMPOS*/
		model.addAttribute("usuarioModel", new UsuarioModel());
 
	    return new ModelAndView("novo");
	}
 
 
 
	/***
	 * Mapeamento para metodo salvar usuario
	 * @param usuarioModel
	 * @param result
	 * @param model
	 * @param redirectAttributes
	 * @return
	 */
	@RequestMapping(value="/salvarUsuario", method= RequestMethod.POST)
	public ModelAndView salvarUsuario(@ModelAttribute 
								@Valid UsuarioModel usuarioModel, 
								final BindingResult result,
								Model model,
								RedirectAttributes redirectAttributes){
 
		/*VERIFICA SE TEM ALGUM ERRO (@NotEmpty),
		 *SE TIVER ALGUM ERRO DEVEMOS RETORNAR PARA A MESMA PÁGINA PARA O USUÁRIO CORRIGIR*/
		if(result.hasErrors()){
 
 
 
			List<GrupoModel> gruposModel =grupoService.consultarGrupos();			
 
			/*POSICIONANDO OS CKECKBOX SELECIONADOS
			 * 
			 * SE O SISTEMA ENCONTROU ALGUM ERRO DE VALIDAÇÃO DEVEMOS 
			 * BUSCAR OS GRUPOS E MARCAR COMO SELECIONADO NOVAMENTE 
			 * PARA MOSTRAR NÁ PÁGINAS DA FORMA QUE O USUÁRIO ENVIO A REQUEST*/
			gruposModel.forEach(grupo ->{
 
				if(usuarioModel.getGrupos() != null && usuarioModel.getGrupos().size() >0){
 
					usuarioModel.getGrupos().forEach(grupoSelecionado->{
 
						/*DEVEMOS MOSTRAR NA PÁGINA OS GRUPOS COM O CHECKBOX SELECIONADO*/
						if(grupoSelecionado!= null){
							if(grupo.getCodigo().equals(grupoSelecionado))
								grupo.setChecked(true);
						}					
					});				
				}
 
			});
 
			/*ADICIONA O GRUPOS QUE VÃO SER MOSTRADOS NA PÁGINA*/
			model.addAttribute("grupos", gruposModel);
 
			/*ADICIONA OS DADOS DO USUÁRIO PARA COLOCAR NO FORMULÁRIO*/
			model.addAttribute("usuarioModel", usuarioModel);
 
			/*RETORNA A VIEW*/
			return new ModelAndView("novo");	
		}
		else{
 
			/*SALVANDO UM NOVO REGISTRO*/
			usuarioService.salvarUsuario(usuarioModel);
 
		}
 
 
		ModelAndView modelAndView = new ModelAndView("redirect:/usuario/novo");
 
		/*PASSANDO O ATRIBUTO PARA O ModelAndView QUE VAI REALIZAR 
		 * O REDIRECIONAMENTO COM A MENSAGEM DE SUCESSO*/
		redirectAttributes.addFlashAttribute("msg_resultado", "Registro salvo com sucesso!");
 
		/*REDIRECIONANDO PARA UM NOVO CADASTRO*/
		return modelAndView;
	}
	
	/***
	 * Mapeamento para metodo listar Usuario
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/pesquisar", method= RequestMethod.GET)	
	public ModelAndView consultar(Model model) {
 
		/*CONSULTA USUÁRIOS CADASTRADOS*/
		model.addAttribute("usuariosModel", this.usuarioService.ListaUsuarios());
 
		/*RETORNA A VIEW*/
	    return new ModelAndView("pesquisar");
	}
	
	/***
	 * Mapeamento para excluir usuario do sistema pelo codigo
	 * @param codigoUsuario
	 * @return
	 */
	@RequestMapping(value="/excluir", method= RequestMethod.POST)
	public ModelAndView excluir(@RequestParam("codigoUsuario") Long codigoUsuario){
 
		ModelAndView modelAndView = new ModelAndView("redirect:/usuario/pesquisar");
 
		/*EXCLUINDO O REGISTRO*/
		this.usuarioService.excluir(codigoUsuario);
 
		/*RETORNANDO A VIEW*/
		return modelAndView;
	}
	
	/***
	 *  Mapeamento para buscar usuario pelo codigo
	 * @param codigoUsuario
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/editar", method= RequestMethod.GET)		
	public ModelAndView editarCadastro(@RequestParam("codigoUsuario") Long codigoUsuario, Model model) {
 
		/*CONSULTA OS GRUPOS CADASTRADOS*/
		List<GrupoModel> gruposModel =grupoService.consultarGrupos();			
 
		/*CONSULTA O USUÁRIO PELO CÓDIGO*/
		UsuarioModel usuarioModel = this.usuarioService.consultarUsuario(codigoUsuario);
 
		/*DEIXA SELECIONADO OS GRUPOS CADASTRADOS PARA O USUÁRIO*/
		gruposModel.forEach(grupo ->{
 
		    usuarioModel.getGrupos().forEach(grupoCadastrado->{
 
		 	if(grupoCadastrado!= null){
			    if(grupo.getCodigo().equals(grupoCadastrado))
				grupo.setChecked(true);
			}					
		    });				
 
		});
 
 
		/*ADICIONANDO GRUPOS PARA MOSTRAR NA PÁGINA(VIEW)*/
		model.addAttribute("grupos", gruposModel);
 
		/*ADICIONANDO INFORMAÇÕES DO USUÁRIO PARA MOSTRAR NA PÁGINA(VIEW)*/
		model.addAttribute("usuarioModel", usuarioModel);
 
		/*CHAMA A VIEW /src/main/resources/templates/editarCadastro.html*/
	    return new ModelAndView("editar");
	 }
 
    
	 /***
	 * Mapeamento para salvar as alteracoes do cadastro
	 * @param usuarioModel
	 * @param result
	 * @param model
	 * @param redirectAttributes
	 * @return
	 */
	@RequestMapping(value="/salvarAlteracao", method= RequestMethod.POST)
	public ModelAndView salvarAlteracao(@ModelAttribute 
					    @Valid UsuarioModel usuarioModel, 
					    final BindingResult result,
					    Model model,
					   RedirectAttributes redirectAttributes){
 
		boolean isErroNullCampos = false;
 
		/*AQUI ESTAMOS VERIFICANDO SE TEM ALGUM CAMPO QUE NÃO ESTÁ PREENCHIDO,
		 * MENOS O CAMPO DA SENHA, POIS SE O USUÁRIO NÃO INFORMAR VAMOS MANTER A
		 * SENHA JÁ CADASTRADA*/
		for (FieldError fieldError : result.getFieldErrors()) {
		    if(!fieldError.getField().equals("senha")){
		 	isErroNullCampos = true;	
		    }	
		}
 
		/*SE ENCONTROU ERRO DEVEMOS RETORNAR PARA A VIEW PARA QUE O 
		 * USUÁRIO TERMINE DE INFORMAR OS DADOS*/
		if(isErroNullCampos){
 
		    List<GrupoModel> gruposModel =grupoService.consultarGrupos();			
 
		    gruposModel.forEach(grupo ->{
 
		         if(usuarioModel.getGrupos() != null && usuarioModel.getGrupos().size() >0){
 
			     /*DEIXA CHECADO OS GRUPOS QUE O USUÁRIO SELECIONOU*/
			     usuarioModel.getGrupos().forEach(grupoSelecionado->{
 
			         if(grupoSelecionado!= null){
				    if(grupo.getCodigo().equals(grupoSelecionado))
				        grupo.setChecked(true);
			         }					
		             });				
			  }
 
		     });
 
		     /*ADICIONANDO GRUPOS PARA MOSTRAR NA PÁGINA(VIEW)*/
		     model.addAttribute("grupos", gruposModel);
 
		     /*ADICIONANDO O OBJETO usuarioModel PARA MOSTRAR NA PÁGINA(VIEW) AS INFORMAÇÕES DO USUÁRIO*/
		     model.addAttribute("usuarioModel", usuarioModel);
 
		     /*RETORNANDO A VIEW*/
		     return new ModelAndView("editar");	
		}
		else{
 
		     /*SALVANDO AS INFORMAÇÕES ALTERADAS DO USUÁRIO*/
		     usuarioService.alterarUsuario(usuarioModel);
 
		}
 
		/*APÓS SALVAR VAMOS REDIRICIONAR O USUÁRIO PARA A PÁGINA DE CONSULTA*/
		ModelAndView modelAndView = new ModelAndView("redirect:/usuario/pesquisar");
 
		/*RETORNANDO A VIEW*/
		return modelAndView;
	}
	
}
