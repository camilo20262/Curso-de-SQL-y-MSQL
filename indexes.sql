-- Consulta sin índice
SELECT * FROM clients WHERE name = 'Twila Rosenbaum';
-- Tiempo: 0.08 segundos

-- Creamos un índice sobre la columna name
CREATE INDEX idx_clients_name ON clients (name);

-- La misma consulta con índice
SELECT * FROM clients WHERE name = 'Twila Rosenbaum';
-- Tiempo: 0.00 segundos (menos de una centésima)

CREATE INDEX idx_a ON clients (name, email);
CREATE INDEX idx_b ON clients (email, name);


-- Optimizado por idx_a
SELECT * FROM clients WHERE name = 'John' AND email = 'john@example.com';

-- Optimizado por idx_b
SELECT * FROM clients WHERE email = 'john@example.com' AND name = 'John';

-- Índice sobre una columna de fecha en orden descendente
CREATE INDEX idx_clients_created ON clients (created_at DESC);