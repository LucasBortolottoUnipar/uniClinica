CREATE TABLE endereco (
    id SERIAL PRIMARY KEY,
    logradouro VARCHAR(255),
    numero INTEGER,
    complemento VARCHAR(255),
    bairro VARCHAR(100),
    cidade VARCHAR(100),
    uf CHAR(2),
    cep VARCHAR(10)
);

CREATE TABLE medico (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    email VARCHAR(100) NOT NULL,
    telefone VARCHAR(20),
    crm VARCHAR(50) NOT NULL,
    especialidade VARCHAR(100),
    id_endereco INTEGER REFERENCES endereco(id),
    ativo BOOLEAN DEFAULT TRUE
);

CREATE TABLE paciente (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    email VARCHAR(100) NOT NULL,
    telefone VARCHAR(20),
    cpf VARCHAR(14) NOT NULL,
    id_endereco INTEGER REFERENCES endereco(id),
    ativo BOOLEAN DEFAULT TRUE
);

CREATE TABLE consulta (
    id SERIAL PRIMARY KEY,
    id_paciente INTEGER NOT NULL REFERENCES paciente(id),
    id_medico INTEGER NOT NULL REFERENCES medico(id),
    data_hora TIMESTAMP NOT NULL,
    ativo BOOLEAN DEFAULT TRUE,
    motivo_cancelamento TEXT,
    data_cancelamento TIMESTAMP
);