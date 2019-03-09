package br.com.oslourencos.condominio;


import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import springfox.documentation.builders.ApiInfoBuilder;
import springfox.documentation.builders.PathSelectors;
import springfox.documentation.builders.RequestHandlerSelectors;
import springfox.documentation.service.Contact;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spring.web.plugins.Docket;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

/*
 *  CLasse para configurar a documentação da API 
 */

@EnableSwagger2
@Configuration
public class SwaggerConfig {

	@Bean
	public Docket detalheApi() {

		Docket docket = new Docket(DocumentationType.SWAGGER_2);

		docket
		.select()
		.apis(RequestHandlerSelectors.basePackage("br.com.oslourencos.condominio"))
		.paths(PathSelectors.any())
		.build()
		.apiInfo(this.informacoesApi().build());

		return docket;
	}

	private ApiInfoBuilder informacoesApi() {

		ApiInfoBuilder apiInfoBuilder = new ApiInfoBuilder();

		apiInfoBuilder.title("Api-Condominio");
		apiInfoBuilder.description("Api para realização de um CRUD na  Aplicação Condominio");
		apiInfoBuilder.version("1.0");
		apiInfoBuilder.termsOfServiceUrl("Termo de uso: Deve ser usada para estudos.");
		apiInfoBuilder.license("Licença - Open Source");
		apiInfoBuilder.licenseUrl("https://linkedin.com/in/conceicaolourenco");
		apiInfoBuilder.contact(this.contact());

		return apiInfoBuilder;

	}
	private Contact contact() {

		return new Contact(
				"Conceição Lourenço",
				"https://linkedin.com/in/conceicaolourenco", 
				"conceicaolourenco@gmail.com");
	}
}
