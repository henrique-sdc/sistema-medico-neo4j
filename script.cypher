// PARTE 1: CRIAÇÃO DO MODELO
MATCH (n) DETACH DELETE n;

// Criação dos Nós
// -- Especialidades
CREATE (:Especialidade {nome: 'Pediatria'});
CREATE (:Especialidade {nome: 'Oftalmologia'});
CREATE (:Especialidade {nome: 'Cardiologia'});

// -- Médicos
CREATE (:Medico {nome: 'Dr. Carlos Andrade'});
CREATE (:Medico {nome: 'Dra. Beatriz Lima'});
CREATE (:Medico {nome: 'Dr. Diego Fernandes'});
CREATE (:Medico {nome: 'Dra. Juliana Moreira'});
CREATE (:Medico {nome: 'Dr. Ricardo Alves'});
CREATE (:Medico {nome: 'Dra. Fernanda Costa'});

// -- Hospitais
CREATE (:Hospital {nome: 'Hospital Central'});
CREATE (:Hospital {nome: 'Clínica Sul'});
CREATE (:Hospital {nome: 'Hospital Pediátrico Anjos'});
CREATE (:Hospital {nome: 'Instituto do Coração'});
CREATE (:Hospital {nome: 'Clínica Visão Clara'});

// -- Planos de Saúde
CREATE (:PlanoDeSaude {nome: 'Plano Vida+'});
CREATE (:PlanoDeSaude {nome: 'Saúde Total'});
CREATE (:PlanoDeSaude {nome: 'Bem Estar Corp'});

// -- Pacientes
CREATE (:Paciente {nome: 'Ana Costa'});
CREATE (:Paciente {nome: 'Bruno Martins'});
CREATE (:Paciente {nome: 'Carlos Lima'});
CREATE (:Paciente {nome: 'Daniela Souza'});
CREATE (:Paciente {nome: 'Eduardo Pereira'});


// Criação dos Relacionamentos
// -- Médicos -> Especialidades
MATCH (m:Medico {nome: 'Dr. Carlos Andrade'}), (e:Especialidade {nome: 'Cardiologia'}) CREATE (m)-[:TEM_ESPECIALIDADE]->(e);
MATCH (m:Medico {nome: 'Dra. Beatriz Lima'}), (e:Especialidade {nome: 'Pediatria'}) CREATE (m)-[:TEM_ESPECIALIDADE]->(e);
MATCH (m:Medico {nome: 'Dr. Diego Fernandes'}), (e:Especialidade {nome: 'Oftalmologia'}) CREATE (m)-[:TEM_ESPECIALIDADE]->(e);
MATCH (m:Medico {nome: 'Dra. Juliana Moreira'}), (e:Especialidade {nome: 'Cardiologia'}) CREATE (m)-[:TEM_ESPECIALIDADE]->(e);
MATCH (m:Medico {nome: 'Dr. Ricardo Alves'}), (e:Especialidade {nome: 'Pediatria'}) CREATE (m)-[:TEM_ESPECIALIDADE]->(e);
MATCH (m:Medico {nome: 'Dra. Fernanda Costa'}), (e:Especialidade {nome: 'Oftalmologia'}) CREATE (m)-[:TEM_ESPECIALIDADE]->(e);

// -- Médicos -> Hospitais
MATCH (m:Medico {nome: 'Dr. Carlos Andrade'}), (h:Hospital {nome: 'Instituto do Coração'}) CREATE (m)-[:ATENDE_EM]->(h);
MATCH (m:Medico {nome: 'Dra. Juliana Moreira'}), (h:Hospital {nome: 'Instituto do Coração'}) CREATE (m)-[:ATENDE_EM]->(h);
MATCH (m:Medico {nome: 'Dra. Beatriz Lima'}), (h:Hospital {nome: 'Hospital Pediátrico Anjos'}) CREATE (m)-[:ATENDE_EM]->(h);
MATCH (m:Medico {nome: 'Dr. Ricardo Alves'}), (h:Hospital {nome: 'Hospital Pediátrico Anjos'}) CREATE (m)-[:ATENDE_EM]->(h);
MATCH (m:Medico {nome: 'Dr. Diego Fernandes'}), (h:Hospital {nome: 'Clínica Visão Clara'}) CREATE (m)-[:ATENDE_EM]->(h);
MATCH (m:Medico {nome: 'Dra. Fernanda Costa'}), (h:Hospital {nome: 'Clínica Visão Clara'}) CREATE (m)-[:ATENDE_EM]->(h);
MATCH (m:Medico {nome: 'Dr. Carlos Andrade'}), (h:Hospital {nome: 'Hospital Central'}) CREATE (m)-[:ATENDE_EM]->(h);
MATCH (m:Medico {nome: 'Dra. Beatriz Lima'}), (h:Hospital {nome: 'Clínica Sul'}) CREATE (m)-[:ATENDE_EM]->(h);

// -- Médicos -> Planos de Saúde
MATCH (m:Medico {nome: 'Dr. Carlos Andrade'}), (p:PlanoDeSaude {nome: 'Plano Vida+'}) CREATE (m)-[:ACEITA_PLANO]->(p);
MATCH (m:Medico {nome: 'Dra. Beatriz Lima'}), (p:PlanoDeSaude {nome: 'Saúde Total'}) CREATE (m)-[:ACEITA_PLANO]->(p);
MATCH (m:Medico {nome: 'Dr. Diego Fernandes'}), (p:PlanoDeSaude {nome: 'Bem Estar Corp'}) CREATE (m)-[:ACEITA_PLANO]->(p);
MATCH (m:Medico {nome: 'Dra. Juliana Moreira'}), (p:PlanoDeSaude {nome: 'Saúde Total'}) CREATE (m)-[:ACEITA_PLANO]->(p);
MATCH (m:Medico {nome: 'Dr. Ricardo Alves'}), (p:PlanoDeSaude {nome: 'Plano Vida+'}) CREATE (m)-[:ACEITA_PLANO]->(p);
MATCH (m:Medico {nome: 'Dra. Fernanda Costa'}), (p:PlanoDeSaude {nome: 'Saúde Total'}) CREATE (m)-[:ACEITA_PLANO]->(p);
MATCH (m:Medico {nome: 'Dr. Carlos Andrade'}), (p:PlanoDeSaude {nome: 'Saúde Total'}) CREATE (m)-[:ACEITA_PLANO]->(p);

// -- Pacientes -> Planos de Saúde
MATCH (pa:Paciente {nome: 'Ana Costa'}), (pl:PlanoDeSaude {nome: 'Plano Vida+'}) CREATE (pa)-[:POSSUI_PLANO]->(pl);
MATCH (pa:Paciente {nome: 'Bruno Martins'}), (pl:PlanoDeSaude {nome: 'Saúde Total'}) CREATE (pa)-[:POSSUI_PLANO]->(pl);
MATCH (pa:Paciente {nome: 'Carlos Lima'}), (pl:PlanoDeSaude {nome: 'Bem Estar Corp'}) CREATE (pa)-[:POSSUI_PLANO]->(pl);
MATCH (pa:Paciente {nome: 'Daniela Souza'}), (pl:PlanoDeSaude {nome: 'Plano Vida+'}) CREATE (pa)-[:POSSUI_PLANO]->(pl);
MATCH (pa:Paciente {nome: 'Eduardo Pereira'}), (pl:PlanoDeSaude {nome: 'Saúde Total'}) CREATE (pa)-[:POSSUI_PLANO]->(pl);

// -- Pacientes -> Médicos (Consultas)
MATCH (pa:Paciente {nome: 'Ana Costa'}), (m:Medico {nome: 'Dr. Ricardo Alves'}) CREATE (pa)-[:CONSULTOU {data: '2024-05-10'}]->(m);
MATCH (pa:Paciente {nome: 'Ana Costa'}), (m:Medico {nome: 'Dr. Carlos Andrade'}) CREATE (pa)-[:CONSULTOU {data: '2024-04-22'}]->(m);
MATCH (pa:Paciente {nome: 'Bruno Martins'}), (m:Medico {nome: 'Dra. Juliana Moreira'}) CREATE (pa)-[:CONSULTOU {data: '2024-05-11'}]->(m);
MATCH (pa:Paciente {nome: 'Carlos Lima'}), (m:Medico {nome: 'Dr. Diego Fernandes'}) CREATE (pa)-[:CONSULTOU {data: '2024-05-12'}]->(m);
MATCH (pa:Paciente {nome: 'Daniela Souza'}), (m:Medico {nome: 'Dra. Beatriz Lima'}) CREATE (pa)-[:CONSULTOU {data: '2024-05-15'}]->(m);
MATCH (pa:Paciente {nome: 'Eduardo Pereira'}), (m:Medico {nome: 'Dra. Fernanda Costa'}) CREATE (pa)-[:CONSULTOU {data: '2024-03-20'}]->(m);
MATCH (pa:Paciente {nome: 'Eduardo Pereira'}), (m:Medico {nome: 'Dra. Juliana Moreira'}) CREATE (pa)-[:CONSULTOU {data: '2024-05-18'}]->(m);
MATCH (pa:Paciente {nome: 'Ana Costa'}), (m:Medico {nome: 'Dr. Ricardo Alves'}) CREATE (pa)-[:CONSULTOU {data: '2024-02-01'}]->(m);
MATCH (pa:Paciente {nome: 'Bruno Martins'}), (m:Medico {nome: 'Dr. Carlos Andrade'}) CREATE (pa)-[:CONSULTOU {data: '2024-01-15'}]->(m);
MATCH (pa:Paciente {nome: 'Carlos Lima'}), (m:Medico {nome: 'Dr. Diego Fernandes'}) CREATE (pa)-[:CONSULTOU {data: '2023-12-10'}]->(m);


// PARTE 2: CONSULTAS SOLICITADAS

// Consulta 1: Listar médicos de uma especialidade específica (ex: Cardiologia)
MATCH (m:Medico)-[:TEM_ESPECIALIDADE]->(e:Especialidade {nome: 'Cardiologia'})
RETURN m.nome AS Medico;

// Consulta 2: Encontrar médicos que aceitam um determinado plano de saúde (ex: Saúde Total)
MATCH (m:Medico)-[:ACEITA_PLANO]->(p:PlanoDeSaude {nome: 'Saúde Total'})
RETURN m.nome AS Medico;

// Consulta 3: Listar hospitais e os médicos que atendem neles
MATCH (h:Hospital)<-[:ATENDE_EM]-(m:Medico)
RETURN h.nome AS Hospital, collect(m.nome) AS Medicos;

// Consulta 4: Obter todas as consultas de um paciente (ex: Ana Costa)
MATCH (p:Paciente {nome: 'Ana Costa'})-[c:CONSULTOU]->(m:Medico)
RETURN m.nome AS Medico, c.data AS DataDaConsulta ORDER BY c.data DESC;

// Consulta 5: Listar especialidades disponíveis em determinado hospital (ex: Hospital Central)
MATCH (h:Hospital {nome: 'Hospital Central'})<-[:ATENDE_EM]-(m:Medico)-[:TEM_ESPECIALIDADE]->(e:Especialidade)
RETURN DISTINCT e.nome AS Especialidade;

// Consulta 6: Listar todos os médicos que podem atender ao plano de saúde de um paciente (ex: Carlos Lima)
MATCH (p:Paciente {nome: 'Carlos Lima'})-[:POSSUI_PLANO]->(pl:PlanoDeSaude)<-[:ACEITA_PLANO]-(m:Medico)
RETURN m.nome AS MedicoRecomendado;

// Consulta 7: Exibir o total de consultas realizadas por médico
MATCH (p:Paciente)-[c:CONSULTOU]->(m:Medico)
RETURN m.nome AS Medico, count(c) AS TotalConsultas ORDER BY TotalConsultas DESC;

// Consulta Para gerar o print do grafo completo
MATCH (n) RETURN n;