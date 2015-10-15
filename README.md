create database writeapp_sinatra default character set utf8mb4;

create table users ( 
  id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL,
  score BIGINT NOT NULL,
  PRIMARY KEY(id)
);
