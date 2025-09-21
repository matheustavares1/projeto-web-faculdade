# Cantina Pro - Sistema de Gestão para Cantinas 🥪

![Dashboard Cantina Pro](image_44a9a2.png)

## 📖 Sobre o Projeto

**Cantina Pro** é um sistema de gestão web desenvolvido para administrar as operações de uma pequena cantina, como a de uma escola ou empresa. A aplicação permite o controle de clientes, o gerenciamento de produtos e estoque, e o registro de vendas (consumo), oferecendo uma visão geral e simplificada do negócio através de um dashboard interativo.

Este projeto foi construído utilizando tecnologias Java para o backend (Servlets) e JSP para a renderização dinâmica do frontend, seguindo o padrão de arquitetura MVC (Model-View-Controller).

---

## ✨ Funcionalidades

* **📊 Dashboard Principal:** Visualização rápida dos indicadores mais importantes:
    * Total de clientes cadastrados.
    * Total de produtos.
    * Número de vendas realizadas.
    * Receita total.
    * Gráficos de desempenho (vs. mês anterior).
* **👤 Gestão de Clientes:**
    * Cadastro de novos clientes com saldo inicial.
    * Listagem de todos os clientes.
* **🍔 Gestão de Produtos:**
    * Cadastro de novos produtos com preço e quantidade em estoque.
    * Listagem completa dos produtos e seus estoques.
* **💸 Registro de Consumo:**
    * Módulo para registrar vendas, debitando o valor do saldo do cliente e atualizando o estoque do produto.
    * Histórico de todas as transações realizadas.
* **🎨 Interface Moderna:**
    * Layout limpo.

---

## 🛠️ Tecnologias Utilizadas

Este projeto foi construído com as seguintes tecnologias:

* **Backend:**
    * Java 11 (ou superior)
    * Java Servlets API
* **Frontend:**
    * JavaServer Pages (JSP)
    * HTML5
    * CSS3
* **Servidor de Aplicação:**
    * Apache Tomcat 9.0 (ou superior).
* **Ambiente de Desenvolvimento:**
    * Eclipse IDE for Java EE Developers

---

## 🚀 Como Executar o Projeto

Siga os passos abaixo para configurar e executar o projeto em seu ambiente local.

### Pré-requisitos

Antes de começar, certifique-se de ter instalado:
* [JDK 11](https://www.oracle.com/java/technologies/javase-jdk11-downloads.html) ou superior.
* [Apache Tomcat 9.0](https://tomcat.apache.org/download-90.cgi) ou superior.
* [Eclipse IDE for Java EE Developers](https://www.eclipse.org/downloads/packages/).
* Um SGBD como o [MySQL Server](https://dev.mysql.com/downloads/mysql/).

### Passos de Instalação

1.  **Clone o Repositório:**
    ```bash
    git clone [https://github.com/seu-usuario/seu-repositorio.git](https://github.com/seu-usuario/seu-repositorio.git)
    cd seu-repositorio
    ```

3.  **Importe o Projeto no Eclipse:**
    * Abra o Eclipse e vá em `File > Import`.
    * Escolha `General > Existing Projects into Workspace`.
    * Selecione o diretório onde você clonou o repositório e clique em `Finish`.

4.  **Configure o Servidor Tomcat:**
    * Na aba `Servers` do Eclipse, adicione seu servidor Apache Tomcat.
    * Clique com o botão direito no projeto, vá em `Properties > Targeted Runtimes` e certifique-se de que o Tomcat está selecionado.

5.  **Configure a Conexão com o Banco de Dados:**
    * Localize a classe de conexão com o banco de dados no seu projeto (ex: `src/main/java/dao/ConnectionFactory.java`).
    * Altere as credenciais (URL, usuário e senha) para corresponder à sua configuração do MySQL.

6.  **Execute a Aplicação:**
    * Clique com o botão direito no projeto.
    * Selecione `Run As > Run on Server`.
    * Escolha o servidor Tomcat configurado.
    * O Eclipse irá iniciar o servidor e abrir a aplicação no seu navegador. A página inicial deve ser o dashboard.

---
