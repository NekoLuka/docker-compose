CREATE DATABASE chyrp;
CREATE USER IF NOT EXISTS chyrp IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON chyrp.* to chyrp;