# 🏥 Sistema de Atendimento Médico com Neo4j

![Neo4j](https://img.shields.io/badge/Neo4j-5-blue.svg?logo=neo4j&logoColor=white)![Cypher](https://img.shields.io/badge/Language-Cypher-informational.svg)![Docker](https://img.shields.io/badge/Docker-blue?logo=docker&logoColor=white)

## 📌 Visão Geral

Este projeto é uma atividade da matéria de **NoSQL** que modela um sistema de atendimento médico utilizando o banco de dados orientado a grafos **Neo4j**. O objetivo é representar as complexas relações entre os diversos atores do sistema: médicos, pacientes, hospitais, especialidades e planos de saúde, de forma intuitiva e eficiente.

A entrega consiste em um único script **Cypher** que cria o modelo de dados completo e fornece um conjunto de consultas para extrair informações relevantes, demonstrando o poder do Neo4j para navegar e analisar dados conectados.

## 🛠️ Tecnologias Utilizadas

-   **Banco de Dados:** [Neo4j](https://neo4j.com/) (versão 5)
-   **Linguagem de Consulta:** Cypher
-   **Ambiente de Execução:** [Docker](https://www.docker.com/) / [Docker Desktop](https://www.docker.com/products/docker-desktop/)

## 📋 Pré-requisitos

-   **[Git](https://git-scm.com/downloads/)**
-   **[Docker Desktop](https://www.docker.com/products/docker-desktop/)** - Essencial para o método de execução principal.

## 📂 Estrutura do Projeto

```
sistema-medico-neo4j/
│
├── script.cypher           # Script Cypher com a criação do modelo e todas as consultas
└── README.md                 # Este arquivo de instruções
```

## ▶️ Como Executar com Docker (Método Recomendado)

Este método garante um ambiente limpo e consistente para a execução do projeto na sua máquina local.

1.  **Clone o repositório:**
    ```bash
    git clone https://github.com/henrique-sdc/sistema-medico-neo4j.git
    cd sistema-medico-neo4j
    ```

2.  **Inicie o Container do Neo4j:**
    Execute o comando abaixo em seu terminal. Ele irá baixar a imagem do Neo4j e iniciar um container com as configurações necessárias, incluindo a senha `senha123`.
    ```bash
    docker run -d --name neo4j-medico -p 7474:7474 -p 7687:7687 -e NEO4J_AUTH=neo4j/senha123 neo4j:5
    ```

3.  **Acesse o Neo4j Browser:**
    -   Aguarde cerca de um minuto para o Neo4j inicializar completamente.
    -   Abra seu navegador e acesse: `http://localhost:7474`
    -   Na tela de login:
        -   **Usuário:** `neo4j`
        -   **Senha:** `senha123`

4.  **Execute o Script:**
    -   Abra o arquivo `script.cypher` deste repositório.
    -   Copie **todo o conteúdo** do arquivo.
    -   Cole o script na caixa de comando do Neo4j Browser e clique no botão de "Play" (▶️) para executar.

## 🚀 Entregáveis do Exercício

### 1. Script Utilizado

O arquivo `script.cypher` contido neste repositório é o script completo solicitado na entrega.

### 3. Execução das Consultas

As consultas solicitadas estão na **Parte 2** do arquivo `script.cypher`, comentadas para fácil identificação. Para testá-las, copie e cole uma por uma na caixa de comando do Neo4j Browser e execute.

<br>

---

<br>

## 🌐 Execução Alternativa no Docker Playground (Para Teste de Script)

Este método é útil para validar a execução do script em um ambiente online. No entanto, possui **limitações para a visualização gráfica**.

**1. Inicie o Container no Playground:**
-   Acesse o [Docker Playground](https://labs.play-with-docker.com/) e crie **uma nova instância**.
-   Execute o comando abaixo para iniciar o container do Neo4j:
    ```bash
    docker run -d --name neo4j-medico -p 7474:7474 -p 7687:7687 -e NEO4J_AUTH=neo4j/senha123 neo4j:5
    ```

**2. Execute o Script via `cypher-shell`:**
-   Aguarde um minuto para o Neo4j inicializar.
-   No terminal do Playground, entre no container:
    ```bash
    docker exec -it neo4j-medico /bin/bash
    ```
-   Dentro do container, inicie o shell do Cypher:
    ```bash
    cypher-shell -u neo4j -p senha123
    ```
-   Clone este repositório em uma **segunda aba do navegador** ou abra o arquivo `script.cypher` localmente. Copie todo o conteúdo, cole no terminal do `cypher-shell` e pressione Enter.
