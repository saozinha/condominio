# condominio
Aplicação Web que simula a gestão de condomínio , construida com Spring Boot, Thymeleaf, Material Designer Lite e Mysql

Ferramentas Necessárias :

1. Java (JDK 1.8)
2. Eclipse Neon ou superior (instale o plugin do spring) 
3. Mysql ou utilize o H2 do Spring boot.


* Para visualizar o projeto em seu eclipse:

 1. faça o download do projeto em : 
 
 https://github.com/saozinha/condominio/archive/master.zip

 2. Descompacte o arquivo.
 
 3. Abra o eclise, clique em File > import > Maven > Existing Maven Projects.
 
 4. Clique com o botão direito do mouse sobre o projeto, procure por : 
    Maven > update project para baixar as dependências do projeto.
 
 5. O Banco de dados utlizados é o H2 embed no spring boot, sendo que existe um arquivo schema.sql que esta sendo lido no ato de execução do projeto. Observe que está sendo inserido um usuário : admin com senha 123456.
 
 6. Para executar o projeto, clique com botão direito do mouse sobre a classe CondominioAplication > Run as > Java Aplication.
 
 ** Caso queira utilizar o MYSQL Abra a pasta do projeto e procure pelo Dump do banco de dados, execute-o no mysql. Configure o arquivo application.properties para o mysql. 
 
 
