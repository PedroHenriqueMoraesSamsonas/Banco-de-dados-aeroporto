-- --------------------------------------------------------
-- Servidor:                     carmine
-- Versão do servidor:           5.7.33 - MySQL Community Server (GPL)
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Copiando estrutura do banco de dados para 1dsb_pedro_samsonas_companhia_aeria
CREATE DATABASE IF NOT EXISTS `1dsb_pedro_samsonas_companhia_aeria` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `1dsb_pedro_samsonas_companhia_aeria`;

-- Copiando estrutura para tabela 1dsb_pedro_samsonas_companhia_aeria.tb01_companhia
CREATE TABLE IF NOT EXISTS `tb01_companhia` (
  `tb01_CNPJ` bigint(20) NOT NULL,
  `tb01_telefone` bigint(20) NOT NULL,
  `tb01_nome` varchar(50) NOT NULL,
  `tb01_email` varchar(50) NOT NULL,
  `tb01_cod_passagem(FK)` varchar(50) NOT NULL,
  PRIMARY KEY (`tb01_CNPJ`),
  KEY `cod_passagem` (`tb01_cod_passagem(FK)`),
  CONSTRAINT `cod_passagem` FOREIGN KEY (`tb01_cod_passagem(FK)`) REFERENCES `tb06_passagem` (`tb06_cod_passagem`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela 1dsb_pedro_samsonas_companhia_aeria.tb01_companhia: ~0 rows (aproximadamente)
DELETE FROM `tb01_companhia`;
/*!40000 ALTER TABLE `tb01_companhia` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb01_companhia` ENABLE KEYS */;

-- Copiando estrutura para tabela 1dsb_pedro_samsonas_companhia_aeria.tb02_aeroporto
CREATE TABLE IF NOT EXISTS `tb02_aeroporto` (
  `tb02_cod_aeroporto` varchar(50) NOT NULL,
  `tb02_localizacao` varchar(50) NOT NULL,
  PRIMARY KEY (`tb02_cod_aeroporto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela 1dsb_pedro_samsonas_companhia_aeria.tb02_aeroporto: ~0 rows (aproximadamente)
DELETE FROM `tb02_aeroporto`;
/*!40000 ALTER TABLE `tb02_aeroporto` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb02_aeroporto` ENABLE KEYS */;

-- Copiando estrutura para tabela 1dsb_pedro_samsonas_companhia_aeria.tb03_voos
CREATE TABLE IF NOT EXISTS `tb03_voos` (
  `tb03_cod_voo` varchar(50) NOT NULL,
  `tb03_destino` varchar(50) NOT NULL,
  `tb03_status` varchar(50) NOT NULL,
  `tb03_partida` varchar(50) NOT NULL,
  `tb03_cod_aeronave` varchar(50) NOT NULL,
  PRIMARY KEY (`tb03_cod_voo`),
  KEY `cod_aeronave` (`tb03_cod_aeronave`),
  CONSTRAINT `cod_aeronave` FOREIGN KEY (`tb03_cod_aeronave`) REFERENCES `tb03_voos` (`tb03_cod_voo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela 1dsb_pedro_samsonas_companhia_aeria.tb03_voos: ~0 rows (aproximadamente)
DELETE FROM `tb03_voos`;
/*!40000 ALTER TABLE `tb03_voos` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb03_voos` ENABLE KEYS */;

-- Copiando estrutura para tabela 1dsb_pedro_samsonas_companhia_aeria.tb04_clientes
CREATE TABLE IF NOT EXISTS `tb04_clientes` (
  `tb04_cod_clientes` varchar(50) NOT NULL,
  `tb04_telefone` varchar(50) NOT NULL,
  `tb04_nome` varchar(50) NOT NULL,
  `tb04_email` varchar(50) NOT NULL,
  `tb04_cod_passagem(FK)` varchar(50) NOT NULL,
  `tb04_cod_func(FK)` varchar(50) NOT NULL,
  PRIMARY KEY (`tb04_cod_clientes`),
  KEY `tb04_cod_func` (`tb04_cod_func(FK)`),
  KEY `cod_passgem` (`tb04_cod_passagem(FK)`),
  CONSTRAINT `cod_passgem` FOREIGN KEY (`tb04_cod_passagem(FK)`) REFERENCES `tb06_passagem` (`tb06_cod_passagem`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `tb04_cod_func` FOREIGN KEY (`tb04_cod_func(FK)`) REFERENCES `tb07_funcinarios` (`tb07_cod_func`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela 1dsb_pedro_samsonas_companhia_aeria.tb04_clientes: ~0 rows (aproximadamente)
DELETE FROM `tb04_clientes`;
/*!40000 ALTER TABLE `tb04_clientes` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb04_clientes` ENABLE KEYS */;

-- Copiando estrutura para tabela 1dsb_pedro_samsonas_companhia_aeria.tb05_aeronaves
CREATE TABLE IF NOT EXISTS `tb05_aeronaves` (
  `tb05_cod_aeronave` varchar(50) NOT NULL,
  `tb05_status` varchar(50) NOT NULL,
  `tb05_cod_aeroporto` varchar(50) NOT NULL,
  PRIMARY KEY (`tb05_cod_aeronave`),
  KEY `cod_aeroporto` (`tb05_cod_aeroporto`),
  CONSTRAINT `cod_aeroporto` FOREIGN KEY (`tb05_cod_aeroporto`) REFERENCES `tb02_aeroporto` (`tb02_cod_aeroporto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela 1dsb_pedro_samsonas_companhia_aeria.tb05_aeronaves: ~0 rows (aproximadamente)
DELETE FROM `tb05_aeronaves`;
/*!40000 ALTER TABLE `tb05_aeronaves` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb05_aeronaves` ENABLE KEYS */;

-- Copiando estrutura para tabela 1dsb_pedro_samsonas_companhia_aeria.tb06_passagem
CREATE TABLE IF NOT EXISTS `tb06_passagem` (
  `tb06_cod_passagem` varchar(50) NOT NULL,
  `tb06_preco` varchar(50) NOT NULL,
  `tb06_cod_voo(FK)` varchar(50) NOT NULL,
  PRIMARY KEY (`tb06_cod_passagem`),
  KEY `cod_voo` (`tb06_cod_voo(FK)`),
  CONSTRAINT `cod_voo` FOREIGN KEY (`tb06_cod_voo(FK)`) REFERENCES `tb03_voos` (`tb03_cod_voo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela 1dsb_pedro_samsonas_companhia_aeria.tb06_passagem: ~0 rows (aproximadamente)
DELETE FROM `tb06_passagem`;
/*!40000 ALTER TABLE `tb06_passagem` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb06_passagem` ENABLE KEYS */;

-- Copiando estrutura para tabela 1dsb_pedro_samsonas_companhia_aeria.tb07_funcinarios
CREATE TABLE IF NOT EXISTS `tb07_funcinarios` (
  `tb07_cod_func` varchar(50) NOT NULL,
  `tb07_espediente` varchar(50) NOT NULL,
  `tb07_salario` varchar(50) NOT NULL,
  PRIMARY KEY (`tb07_cod_func`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela 1dsb_pedro_samsonas_companhia_aeria.tb07_funcinarios: ~0 rows (aproximadamente)
DELETE FROM `tb07_funcinarios`;
/*!40000 ALTER TABLE `tb07_funcinarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb07_funcinarios` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
