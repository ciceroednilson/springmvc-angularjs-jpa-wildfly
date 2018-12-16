## Aplicação com Spring MVC, AngularJS, JPA e Wildfly 9.

### Requisitos.

- Eclipse
- Java 8
- Widfly 9
- Mysql


### Configurando Data Source no Wildfly 9 com MySQL.

<p>Vamos acessar o diretório do Wildfly e vamos até wildfly-9.0.2.Final/modules/system/layers/base/com, agora vamos criar um diretório com o nome de mysql.</p>
<p>Agora no nosso diretório mysql (/etc/wildfly-9.0.2.Final/modules/system/layers/base/com/mysql) vamos criar um outro diretório com o nome de main.</p>
<ṕ>Agora vamos acessar o repositório do maven e vamos fazer download do MySQL JDBC versão 5.1.37.</p>

- Repositório Maven: http://mvnrepository.com/artifact/mysql/mysql-connector-java/5.1.37

<p>Depois que completar o download vamos copiar nosso arquivo .jar do MySQL para o nosso diretório wildfly-9.0.2.Final/modules/system/layers/base/com/mysql/main.</p>

<p>Ainda no nosso diretório /etc/wildfly-9.0.2.Final/modules/system/layers/base/com/mysql/main vamos criar um arquivo chamado module.xml, e vamos adicionar o código abaixo.</p>

```javascript

<?xml version="1.0″ encoding="UTF-8″?>

<module xmlns="urn:jboss:module:1.1" name="com.mysql">
<resources>
<!–NO ATRIBUTO PATH DEVEMOS COLOCAR O NOME COMPLETO DO NOSSO JAR DO MYSQL–> 
<resource-root path="mysql-connector-java-5.1.37.jar"/>
</resources>
<dependencies>
<module name="javax.api"/>
<module name="javax.transaction.api"/>
<module name="javax.servlet.api" optional="true"/>
</dependencies>
</module>
```


Agora vamos acessar o diretório /etc/wildfly-9.0.2.Final/standalone/configuration e vamos abrir o arquivo standalone.xml.

Com o nosso arquivo aberto vamos procurar a tag <datasources>, você vai ver que já existe uma configuração de exemplo do banco h2, abaixo da configuração do h2 vamos colar o código abaixo com as informações de acesso a nossa base de dados que criamos.


```javascript
<datasource jta="true" jndi-name="java:jboss/datasources/base_usuarioDS" pool-name="base_usuarioDS" enabled="true" use-java-context="true" use-ccm="true">
<!– endereço da nossa base de dados –>
<connection-url>jdbc:mysql://localhost:3306/base_usuario</connection-url>
<driver>mysql</driver>
<transaction-isolation>TRANSACTION_READ_COMMITTED</transaction-isolation>
<pool>
<min-pool-size>10</min-pool-size>
<max-pool-size>100</max-pool-size>
<prefill>true</prefill>
</pool>
<security>
<user-name>root</user-name>
<password>123456</password>
</security>
<statement>
<prepared-statement-cache-size>32</prepared-statement-cache-size>
<share-prepared-statements>true</share-prepared-statements>
</statement>
</datasource>
```


<p>Agora na tag **drivers** que fica logo abaixo da tag **datasource** vamos adicionar o código abaixo.</p>


```javascript


<driver name="mysql" module="com.mysql">
<xa-datasource-class>com.mysql.jdbc.jdbc2.optional.MysqlXADataSource</xa-datasource-class>
</driver>
```

<p>Pronto, até aqui já temos o nosso Data Source configurado, agora na nossa aplicação vamos mudar nosso arquivo persistence.xml do JPA para trabalhar com o Data Source que criamos, vamos deixar ele com o código abaixo. </p>