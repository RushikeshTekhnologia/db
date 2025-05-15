CREATE DATABASE  IF NOT EXISTS `hms_backend3` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `hms_backend3`;
-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: hms_backend3
-- ------------------------------------------------------
-- Server version	8.0.41

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `tbl_admitted_patient`
--

DROP TABLE IF EXISTS `tbl_admitted_patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_admitted_patient` (
  `admitted_patient_id` int NOT NULL AUTO_INCREMENT,
  `uh_id` varchar(45) NOT NULL,
  `ipd_id` varchar(45) DEFAULT NULL,
  `appointment_id` int DEFAULT NULL,
  `doctor_id` int DEFAULT NULL,
  `admitted_date` bigint DEFAULT NULL,
  `approx_discharge_date` bigint DEFAULT NULL,
  `bed_id` int NOT NULL,
  `created_by` int DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `status` int DEFAULT NULL,
  `mlc_no` varchar(255) DEFAULT NULL,
  `mediclaim` int DEFAULT '0',
  `reference_doctor` varchar(255) DEFAULT NULL,
  `tpa` varchar(45) DEFAULT NULL,
  `department_id` int NOT NULL,
  `occupation` varchar(255) DEFAULT NULL,
  `admit_time` bigint DEFAULT NULL,
  `discharge_date` bigint DEFAULT NULL,
  `discharge_status` int NOT NULL DEFAULT '0',
  `bill_status` varchar(45) NOT NULL DEFAULT '0',
  `mrd_no` varchar(100) DEFAULT NULL,
  UNIQUE KEY `admitted_patient_id_UNIQUE` (`admitted_patient_id`)
) ENGINE=InnoDB AUTO_INCREMENT=116 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_admitted_patient`
--

LOCK TABLES `tbl_admitted_patient` WRITE;
/*!40000 ALTER TABLE `tbl_admitted_patient` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_admitted_patient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_appointment`
--

DROP TABLE IF EXISTS `tbl_appointment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_appointment` (
  `appo_id` int NOT NULL AUTO_INCREMENT,
  `appo_patient_id` int NOT NULL,
  `appo_reason` text NOT NULL,
  `appo_doctor_id` int NOT NULL,
  `appo_patient_source` varchar(255) NOT NULL,
  `appo_visited_type` enum('New','Follow-up') NOT NULL,
  `appo_shift_slot_id` int DEFAULT NULL,
  `appo_date` bigint NOT NULL,
  `appo_department_id` int NOT NULL,
  `appo_status` enum('Scheduled','Completed','Cancelled') NOT NULL DEFAULT 'Scheduled',
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `appo_disease` varchar(255) DEFAULT NULL,
  `appo_biil_status` enum('Paid','Pending','Cancelled') DEFAULT 'Pending',
  `appo_time` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`appo_id`)
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_appointment`
--

LOCK TABLES `tbl_appointment` WRITE;
/*!40000 ALTER TABLE `tbl_appointment` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_appointment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_bed`
--

DROP TABLE IF EXISTS `tbl_bed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_bed` (
  `bed_id` int NOT NULL AUTO_INCREMENT,
  `room_id` int NOT NULL,
  `bed_status` enum('available','occupied') NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` int DEFAULT NULL,
  `upated_by` int DEFAULT NULL,
  `bed_soft_status` int DEFAULT '1',
  `bed_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`bed_id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_bed`
--

LOCK TABLES `tbl_bed` WRITE;
/*!40000 ALTER TABLE `tbl_bed` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_bed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_bed_booking`
--

DROP TABLE IF EXISTS `tbl_bed_booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_bed_booking` (
  `bed_booking_id` int NOT NULL AUTO_INCREMENT,
  `admitted_patient_id` int NOT NULL,
  `ipd_id` varchar(45) NOT NULL,
  `bed_id` int NOT NULL,
  `start_date` bigint DEFAULT NULL,
  `end_date` bigint DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `booking_status` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`bed_booking_id`),
  UNIQUE KEY `bed_booking_id_UNIQUE` (`bed_booking_id`)
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_bed_booking`
--

LOCK TABLES `tbl_bed_booking` WRITE;
/*!40000 ALTER TABLE `tbl_bed_booking` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_bed_booking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_billing_and_charges`
--

DROP TABLE IF EXISTS `tbl_billing_and_charges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_billing_and_charges` (
  `billing_and_charges_no` int NOT NULL AUTO_INCREMENT,
  `class_name` int NOT NULL,
  `bed` float NOT NULL,
  `nursing` float NOT NULL,
  `doctor` float NOT NULL,
  `rmo` float NOT NULL,
  `bmw` float NOT NULL,
  `total` float NOT NULL,
  `deposit` float NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(50) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_by` varchar(50) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `deleted_by` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`billing_and_charges_no`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_billing_and_charges`
--

LOCK TABLES `tbl_billing_and_charges` WRITE;
/*!40000 ALTER TABLE `tbl_billing_and_charges` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_billing_and_charges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_blood_groups`
--

DROP TABLE IF EXISTS `tbl_blood_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_blood_groups` (
  `blood_id` int NOT NULL AUTO_INCREMENT,
  `blood_group_name` varchar(45) NOT NULL,
  PRIMARY KEY (`blood_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_blood_groups`
--

LOCK TABLES `tbl_blood_groups` WRITE;
/*!40000 ALTER TABLE `tbl_blood_groups` DISABLE KEYS */;
INSERT INTO `tbl_blood_groups` VALUES (1,'A+'),(2,'A-'),(3,'B+'),(4,'B-'),(5,'O+'),(6,'O-'),(7,'AB+'),(8,'AB-');
/*!40000 ALTER TABLE `tbl_blood_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_courses`
--

DROP TABLE IF EXISTS `tbl_courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_courses` (
  `id` int NOT NULL AUTO_INCREMENT,
  `admit_id` int NOT NULL,
  `course_details` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_courses`
--

LOCK TABLES `tbl_courses` WRITE;
/*!40000 ALTER TABLE `tbl_courses` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_day`
--

DROP TABLE IF EXISTS `tbl_day`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_day` (
  `day_id` int NOT NULL AUTO_INCREMENT,
  `day_name` varchar(50) NOT NULL,
  PRIMARY KEY (`day_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_day`
--

LOCK TABLES `tbl_day` WRITE;
/*!40000 ALTER TABLE `tbl_day` DISABLE KEYS */;
INSERT INTO `tbl_day` VALUES (1,'Monday'),(2,'Tuesday'),(3,'Wensday'),(4,'Thursday'),(5,'Friday'),(6,'Saturday'),(7,'Sunday');
/*!40000 ALTER TABLE `tbl_day` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_department`
--

DROP TABLE IF EXISTS `tbl_department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_department` (
  `department_id` int NOT NULL AUTO_INCREMENT,
  `department_name` varchar(45) NOT NULL,
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_by` int DEFAULT NULL,
  `department_status` int DEFAULT '1',
  PRIMARY KEY (`department_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_department`
--

LOCK TABLES `tbl_department` WRITE;
/*!40000 ALTER TABLE `tbl_department` DISABLE KEYS */;
INSERT INTO `tbl_department` VALUES (1,'Cardiology',1,'2025-02-28 06:18:16','2025-05-14 06:23:21',NULL,1),(2,'Neurology',2,'2025-02-28 12:45:09','2025-05-09 12:28:12',NULL,1),(3,'Oncology',13,'2025-03-03 09:29:37','2025-05-09 10:50:34',NULL,1),(4,'Orthopedics ',13,'2025-03-06 05:41:26','2025-03-07 04:15:28',NULL,1),(7,'Emergency',13,'2025-05-15 10:47:37','2025-05-15 10:47:37',NULL,1);
/*!40000 ALTER TABLE `tbl_department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_discharge_detail`
--

DROP TABLE IF EXISTS `tbl_discharge_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_discharge_detail` (
  `discharge_details_id` int NOT NULL AUTO_INCREMENT,
  `ipd_id` varchar(45) NOT NULL,
  `chief_complaints` text,
  `diagnosis` text,
  `signs` varchar(255) DEFAULT NULL,
  `temprature` varchar(50) DEFAULT NULL,
  `pulse` varchar(50) DEFAULT NULL,
  `blood_pressure` varchar(50) DEFAULT NULL,
  `respiratory_rate` varchar(50) DEFAULT NULL,
  `cvs` varchar(255) DEFAULT NULL,
  `rs` varchar(255) DEFAULT NULL,
  `pa` varchar(255) DEFAULT NULL,
  `cns` varchar(255) DEFAULT NULL,
  `local_examination` text,
  `past_history` text,
  `discharge_advice` text,
  `discharge_date_time` bigint DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `follow_up_date_time` bigint DEFAULT NULL,
  `icd_code` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`discharge_details_id`),
  UNIQUE KEY `discharge_details_id_UNIQUE` (`discharge_details_id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_discharge_detail`
--

LOCK TABLES `tbl_discharge_detail` WRITE;
/*!40000 ALTER TABLE `tbl_discharge_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_discharge_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_doctor_availability`
--

DROP TABLE IF EXISTS `tbl_doctor_availability`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_doctor_availability` (
  `doc_ava_id` int NOT NULL AUTO_INCREMENT,
  `doc_ava_user_id` int NOT NULL,
  `doc_ava_slot_shift_id` int NOT NULL,
  `doc_ava_status` int NOT NULL,
  `doc_ava_day_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_by` int DEFAULT NULL,
  PRIMARY KEY (`doc_ava_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2019 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_doctor_availability`
--

LOCK TABLES `tbl_doctor_availability` WRITE;
/*!40000 ALTER TABLE `tbl_doctor_availability` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_doctor_availability` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_education`
--

DROP TABLE IF EXISTS `tbl_education`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_education` (
  `education_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `degree` varchar(255) DEFAULT NULL,
  `specialization` varchar(255) DEFAULT NULL,
  `graduation_year` year DEFAULT NULL,
  `university` varchar(255) DEFAULT NULL,
  `post_degree` varchar(255) DEFAULT NULL,
  `post_specialization` varchar(255) DEFAULT NULL,
  `post_graduation_year` year DEFAULT NULL,
  `post_university` varchar(255) DEFAULT NULL,
  `additional_certifications` text,
  `language_known` varchar(255) DEFAULT NULL,
  `field_of_study` varchar(255) DEFAULT NULL,
  `computer_skills` varchar(255) DEFAULT NULL,
  `issuing_body` varchar(256) DEFAULT NULL,
  `issuing_authirity` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_by` int DEFAULT NULL,
  `board_certification` varchar(45) DEFAULT NULL,
  `institute_name` varchar(45) DEFAULT NULL,
  `highest_qualification` varchar(45) DEFAULT NULL,
  `registation_number` varchar(45) DEFAULT NULL,
  `blood_group` int DEFAULT NULL,
  PRIMARY KEY (`education_id`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_education`
--

LOCK TABLES `tbl_education` WRITE;
/*!40000 ALTER TABLE `tbl_education` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_education` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_fees`
--

DROP TABLE IF EXISTS `tbl_fees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_fees` (
  `fees_id` int NOT NULL AUTO_INCREMENT,
  `fees_name` varchar(45) NOT NULL,
  `fees_amount` bigint NOT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `fees_status` int DEFAULT '1',
  PRIMARY KEY (`fees_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_fees`
--

LOCK TABLES `tbl_fees` WRITE;
/*!40000 ALTER TABLE `tbl_fees` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_fees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_ipd_bills`
--

DROP TABLE IF EXISTS `tbl_ipd_bills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_ipd_bills` (
  `ipd_bill_id` int NOT NULL AUTO_INCREMENT,
  `bill_admit_id` int NOT NULL,
  `bill_total_amount` decimal(10,2) NOT NULL,
  `payment_method` enum('Cash','Online') NOT NULL DEFAULT 'Cash',
  `bill_report` varchar(255) DEFAULT NULL,
  `bill_date` bigint DEFAULT NULL,
  `receipt_number` varchar(50) NOT NULL,
  `created_by` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `discount` bigint DEFAULT '0',
  PRIMARY KEY (`ipd_bill_id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_ipd_bills`
--

LOCK TABLES `tbl_ipd_bills` WRITE;
/*!40000 ALTER TABLE `tbl_ipd_bills` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_ipd_bills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_ipd_charges`
--

DROP TABLE IF EXISTS `tbl_ipd_charges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_ipd_charges` (
  `ipd_charge_id` int NOT NULL AUTO_INCREMENT,
  `charge_id` int NOT NULL,
  `date` bigint NOT NULL,
  `created_by` int NOT NULL,
  `admited_id` int NOT NULL,
  PRIMARY KEY (`ipd_charge_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_ipd_charges`
--

LOCK TABLES `tbl_ipd_charges` WRITE;
/*!40000 ALTER TABLE `tbl_ipd_charges` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_ipd_charges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_ipd_deposite`
--

DROP TABLE IF EXISTS `tbl_ipd_deposite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_ipd_deposite` (
  `ipd_deposite_id` int NOT NULL AUTO_INCREMENT,
  `admited_id` int NOT NULL,
  `date` bigint NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `payment_mode` varchar(45) DEFAULT 'Cash',
  PRIMARY KEY (`ipd_deposite_id`),
  CONSTRAINT `tbl_ipd_deposite_chk_1` CHECK ((`amount` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_ipd_deposite`
--

LOCK TABLES `tbl_ipd_deposite` WRITE;
/*!40000 ALTER TABLE `tbl_ipd_deposite` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_ipd_deposite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_ipd_doctor_visits`
--

DROP TABLE IF EXISTS `tbl_ipd_doctor_visits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_ipd_doctor_visits` (
  `ipd_doctor_visit_id` int NOT NULL AUTO_INCREMENT,
  `ipd_doctor_id` int NOT NULL,
  `ipd_doctor_date` bigint NOT NULL,
  `ipd_dv_stauts` int NOT NULL DEFAULT '1',
  `admited_id` int NOT NULL,
  `created_by` int DEFAULT NULL,
  PRIMARY KEY (`ipd_doctor_visit_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_ipd_doctor_visits`
--

LOCK TABLES `tbl_ipd_doctor_visits` WRITE;
/*!40000 ALTER TABLE `tbl_ipd_doctor_visits` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_ipd_doctor_visits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_ipd_lab`
--

DROP TABLE IF EXISTS `tbl_ipd_lab`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_ipd_lab` (
  `ipd_lab_id` int NOT NULL AUTO_INCREMENT,
  `admited_id` int NOT NULL,
  `test_id` int NOT NULL,
  `recommendation_date` bigint NOT NULL,
  `reason` text,
  `status` enum('Pending','Completed','Cancelled') NOT NULL DEFAULT 'Pending',
  `ipd_lab_status` int DEFAULT '1',
  PRIMARY KEY (`ipd_lab_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_ipd_lab`
--

LOCK TABLES `tbl_ipd_lab` WRITE;
/*!40000 ALTER TABLE `tbl_ipd_lab` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_ipd_lab` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_ipd_prescription`
--

DROP TABLE IF EXISTS `tbl_ipd_prescription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_ipd_prescription` (
  `ipd_prescription_id` int NOT NULL AUTO_INCREMENT,
  `ipd_id` varchar(45) NOT NULL,
  `medicine_name` varchar(255) DEFAULT NULL,
  `dosage` varchar(255) DEFAULT NULL,
  `days` int DEFAULT NULL,
  `frequency` int DEFAULT NULL,
  `common_note` text,
  `medicine_quantity` int DEFAULT NULL,
  `medicine_type` varchar(50) DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  UNIQUE KEY `ipd_prescription_id_UNIQUE` (`ipd_prescription_id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_ipd_prescription`
--

LOCK TABLES `tbl_ipd_prescription` WRITE;
/*!40000 ALTER TABLE `tbl_ipd_prescription` DISABLE KEYS */;
INSERT INTO `tbl_ipd_prescription` VALUES (53,'10713052025','Acetaminophen','234mg',12,1,' cx',12,'Tablet',41,'2025-05-13 10:27:50'),(54,'10513052025','Metformin','250mg',10,2,'after dinner',20,'Capsule',41,'2025-05-14 04:45:45'),(55,'10513052025','Aspirin','500mg',10,2,'after lunch',20,'Tablet',41,'2025-05-14 04:46:19'),(56,'10513052025','Celecoxib','',10,3,'daily 3 times',1,'Liquid',41,'2025-05-14 04:48:06'),(57,'10513052025','Dexamethasone','',10,2,'daily 2 times',1,'Powder',41,'2025-05-14 05:23:32');
/*!40000 ALTER TABLE `tbl_ipd_prescription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_ipd_report`
--

DROP TABLE IF EXISTS `tbl_ipd_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_ipd_report` (
  `rep_ipd_id` int NOT NULL AUTO_INCREMENT,
  `rep_adm_id` int NOT NULL,
  `rep_labtest_id` int NOT NULL,
  `rep_ipd_date` bigint DEFAULT NULL,
  `rep_ipd_photo` varchar(255) NOT NULL,
  PRIMARY KEY (`rep_ipd_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_ipd_report`
--

LOCK TABLES `tbl_ipd_report` WRITE;
/*!40000 ALTER TABLE `tbl_ipd_report` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_ipd_report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_labtest`
--

DROP TABLE IF EXISTS `tbl_labtest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_labtest` (
  `lab_id` int NOT NULL AUTO_INCREMENT,
  `lab_appoi_id` int NOT NULL,
  `lab_test_id` int NOT NULL,
  `lab_date_of_recommendation` bigint NOT NULL,
  `lab_test_reason` text,
  `lab_test_status` enum('Pending','Completed','Cancelled') DEFAULT 'Pending',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `lab_deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`lab_id`),
  KEY `idx_lab_appoi_id` (`lab_appoi_id`),
  KEY `idx_lab_test_id` (`lab_test_id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_labtest`
--

LOCK TABLES `tbl_labtest` WRITE;
/*!40000 ALTER TABLE `tbl_labtest` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_labtest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_medicine`
--

DROP TABLE IF EXISTS `tbl_medicine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_medicine` (
  `medicine_id` int NOT NULL AUTO_INCREMENT,
  `medicine_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`medicine_id`)
) ENGINE=InnoDB AUTO_INCREMENT=126 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_medicine`
--

LOCK TABLES `tbl_medicine` WRITE;
/*!40000 ALTER TABLE `tbl_medicine` DISABLE KEYS */;
INSERT INTO `tbl_medicine` VALUES (1,'Acetaminophen'),(2,'Albuterol'),(3,'Allopurinol'),(4,'Amlodipine'),(5,'Amoxicillin'),(6,'Aspirin'),(7,'Atenolol'),(8,'Atorvastatin'),(9,'Azithromycin'),(10,'Bisoprolol'),(11,'Bupropion'),(12,'Captopril'),(13,'Carbamazepine'),(14,'Cefalexin'),(15,'Celecoxib'),(16,'Cetirizine'),(17,'Ciprofloxacin'),(18,'Citalopram'),(19,'Clarithromycin'),(20,'Clindamycin'),(21,'Clonazepam'),(22,'Clopidogrel'),(23,'Codeine'),(24,'Cyclobenzaprine'),(25,'Dexamethasone'),(26,'Diclofenac'),(27,'Diltiazem'),(28,'Doxycycline'),(29,'Duloxetine'),(30,'Enalapril'),(31,'Erythromycin'),(32,'Escitalopram'),(33,'Esomeprazole'),(34,'Ezetimibe'),(35,'Famotidine'),(36,'Fentanyl'),(37,'Fluconazole'),(38,'Fluoxetine'),(39,'Fluticasone'),(40,'Furosemide'),(41,'Gabapentin'),(42,'Gliclazide'),(43,'Glimepiride'),(44,'Hydrochlorothiazide'),(45,'Hydrocodone'),(46,'Ibuprofen'),(47,'Insulin glargine'),(48,'Isosorbide'),(49,'Lansoprazole'),(50,'Levetiracetam'),(51,'Levothyroxine'),(52,'Lisinopril'),(53,'Loratadine'),(54,'Lorazepam'),(55,'Losartan'),(56,'Metformin'),(57,'Methotrexate'),(58,'Methylprednisolone'),(59,'Metoprolol'),(60,'Montelukast'),(61,'Morphine'),(62,'Naproxen'),(63,'Nifedipine'),(64,'Omeprazole'),(65,'Ondansetron'),(66,'Oxycodone'),(67,'Pantoprazole'),(68,'Paroxetine'),(69,'Phenobarbital'),(70,'Phenytoin'),(71,'Pioglitazone'),(72,'Potassium chloride'),(73,'Pravastatin'),(74,'Prednisolone'),(75,'Prednisone'),(76,'Pregabalin'),(77,'Propranolol'),(78,'Quetiapine'),(79,'Ramipril'),(80,'Ranitidine'),(81,'Risperidone'),(82,'Rosuvastatin'),(83,'Salmeterol'),(84,'Sertraline'),(85,'Simvastatin'),(86,'Sitagliptin'),(87,'Sotalol'),(88,'Spironolactone'),(89,'Sulfamethoxazole'),(90,'Tamsulosin'),(91,'Telmisartan'),(92,'Terbinafine'),(93,'Trazodone'),(94,'Tramadol'),(95,'Valproate'),(96,'Valsartan'),(97,'Venlafaxine'),(98,'Verapamil'),(99,'Warfarin'),(100,'Zolpidem'),(101,'Zopiclone'),(102,'Adalimumab'),(103,'Alprazolam'),(104,'Amitriptyline'),(105,'Anastrozole'),(106,'Apixaban'),(107,'Aripiprazole'),(108,'Betamethasone'),(109,'Budesonide'),(110,'Carvedilol'),(111,'Cefuroxime'),(112,'Clonidine'),(113,'Dabigatran'),(114,'Diazepam'),(115,'Digoxin'),(116,'Donepezil'),(117,'Efavirenz'),(118,'Etanercept'),(119,'Exenatide'),(120,'Febuxostat'),(121,'Finasteride'),(125,'para ');
/*!40000 ALTER TABLE `tbl_medicine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_opd_bill_fees`
--

DROP TABLE IF EXISTS `tbl_opd_bill_fees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_opd_bill_fees` (
  `opd_bill_fees_id` int NOT NULL AUTO_INCREMENT,
  `opd_bill_id` int NOT NULL,
  `fees_id` int NOT NULL,
  `quantity` int DEFAULT NULL,
  `total_fee` int DEFAULT NULL,
  UNIQUE KEY `opd_bill_fees_id_UNIQUE` (`opd_bill_fees_id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_opd_bill_fees`
--

LOCK TABLES `tbl_opd_bill_fees` WRITE;
/*!40000 ALTER TABLE `tbl_opd_bill_fees` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_opd_bill_fees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_opd_bills`
--

DROP TABLE IF EXISTS `tbl_opd_bills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_opd_bills` (
  `bill_id` int NOT NULL AUTO_INCREMENT,
  `bill_appointment_id` int NOT NULL,
  `bill_total_amount` decimal(10,2) DEFAULT '0.00',
  `payment_status` enum('Paid','Pending','Cancelled') DEFAULT 'Pending',
  `payment_method` varchar(50) DEFAULT NULL,
  `bill_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `bill_report` text,
  `created_at` timestamp NULL DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `receipt_number` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`bill_id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_opd_bills`
--

LOCK TABLES `tbl_opd_bills` WRITE;
/*!40000 ALTER TABLE `tbl_opd_bills` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_opd_bills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_opd_charges`
--

DROP TABLE IF EXISTS `tbl_opd_charges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_opd_charges` (
  `cha_opd_id` int NOT NULL AUTO_INCREMENT,
  `cha_opd_appo_id` int NOT NULL,
  `cha_opd_quantity` int NOT NULL,
  `cha_opd_fees_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`cha_opd_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_opd_charges`
--

LOCK TABLES `tbl_opd_charges` WRITE;
/*!40000 ALTER TABLE `tbl_opd_charges` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_opd_charges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_opd_examination`
--

DROP TABLE IF EXISTS `tbl_opd_examination`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_opd_examination` (
  `opd_examination_id` int NOT NULL AUTO_INCREMENT,
  `uh_id` varchar(45) NOT NULL,
  `appointment_id` int NOT NULL,
  `chief_complaints` text,
  `personal_history` text,
  `present_medication` text,
  `past_medical_history` text,
  `respiratory_system` text,
  `general_condition` text,
  `pulse` varchar(50) DEFAULT NULL,
  `blood_pressure` varchar(50) DEFAULT NULL,
  `respiratory_rate` varchar(50) DEFAULT NULL,
  `spo2` varchar(50) DEFAULT NULL,
  `signs` text,
  `cardiovascular_system` text,
  `central_nervous_system` text,
  `per_abdomen` text,
  `created_at` timestamp NULL DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  UNIQUE KEY `opd_examination_id_UNIQUE` (`opd_examination_id`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_opd_examination`
--

LOCK TABLES `tbl_opd_examination` WRITE;
/*!40000 ALTER TABLE `tbl_opd_examination` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_opd_examination` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_patient`
--

DROP TABLE IF EXISTS `tbl_patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_patient` (
  `patient_id` int NOT NULL AUTO_INCREMENT,
  `patient_type_id` int NOT NULL,
  `patient_name` varchar(255) NOT NULL,
  `patient_sex` varchar(255) NOT NULL,
  `patient_phone_no` varchar(255) NOT NULL,
  `patient_age` int NOT NULL,
  `patient_address` text NOT NULL,
  `patient_id_proof` varchar(255) NOT NULL,
  `patient_proof_image` varchar(255) NOT NULL,
  `patient_image` varchar(255) NOT NULL,
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_by` int DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `patient_status` int DEFAULT '1',
  `patient_city` varchar(45) DEFAULT NULL,
  `uh_id` varchar(45) DEFAULT NULL,
  `patient_blgr_id` int DEFAULT NULL,
  PRIMARY KEY (`patient_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_patient`
--

LOCK TABLES `tbl_patient` WRITE;
/*!40000 ALTER TABLE `tbl_patient` DISABLE KEYS */;
INSERT INTO `tbl_patient` VALUES (12,1,'Rohit Linge','Male','9456856956',25,'new street','pan','uploads\\new_service_banner.webp','uploads\\vector-guy-expressing-thumbs-up 1.png',18,'2025-05-15 07:34:24',NULL,'2025-05-15 07:34:24',1,'pune','AH1215052025',1),(13,1,'Nikhil','Male','7584695823',21,'lkkk','aadhar','uploads\\home_banner_marathi.webp','uploads\\vector-guy-expressing-thumbs-up 1.png',18,'2025-05-15 07:38:45',NULL,'2025-05-15 07:38:45',1,'pune','AH1315052025',1),(14,1,'Lukika','Male','9822519796',25,'ws','aadhar','uploads\\Screenshot 2025-03-10 182053.png','uploads\\Screenshot 2025-03-11 123024.png',16,'2025-05-15 07:57:50',NULL,'2025-05-15 07:57:50',1,'Pune','AH1415052025',1),(15,1,'rohini','Male','9234567893',25,'ws','aadhar','uploads\\Screenshot 2025-03-10 182053.png','uploads\\Screenshot 2025-03-10 182053.png',18,'2025-05-15 09:43:44',NULL,'2025-05-15 09:43:44',1,'Pune','AH1515052025',1);
/*!40000 ALTER TABLE `tbl_patient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_patient_relatives`
--

DROP TABLE IF EXISTS `tbl_patient_relatives`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_patient_relatives` (
  `patient_relatives_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `age` int NOT NULL,
  `gender` varchar(45) NOT NULL,
  `mobile` bigint NOT NULL,
  `relation` varchar(60) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `admitted_id` int NOT NULL,
  `ipd_id` varchar(45) NOT NULL,
  `created_by` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  UNIQUE KEY `patient_relatives_id_UNIQUE` (`patient_relatives_id`)
) ENGINE=InnoDB AUTO_INCREMENT=114 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_patient_relatives`
--

LOCK TABLES `tbl_patient_relatives` WRITE;
/*!40000 ALTER TABLE `tbl_patient_relatives` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_patient_relatives` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_patient_type`
--

DROP TABLE IF EXISTS `tbl_patient_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_patient_type` (
  `patient_type_id` int NOT NULL AUTO_INCREMENT,
  `patient_type` varchar(45) NOT NULL,
  PRIMARY KEY (`patient_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_patient_type`
--

LOCK TABLES `tbl_patient_type` WRITE;
/*!40000 ALTER TABLE `tbl_patient_type` DISABLE KEYS */;
INSERT INTO `tbl_patient_type` VALUES (1,'Internal'),(2,'External');
/*!40000 ALTER TABLE `tbl_patient_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_prescription`
--

DROP TABLE IF EXISTS `tbl_prescription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_prescription` (
  `prescription_id` int NOT NULL AUTO_INCREMENT,
  `appointment_id` int NOT NULL,
  `medicine_name` varchar(255) NOT NULL,
  `dosage` varchar(255) NOT NULL,
  `days` int NOT NULL,
  `frequency` int NOT NULL,
  `common_note` text,
  `medicine_quantity` int NOT NULL,
  `created_by` int DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `medicine_type` varchar(45) DEFAULT NULL,
  UNIQUE KEY `prescription_id_UNIQUE` (`prescription_id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_prescription`
--

LOCK TABLES `tbl_prescription` WRITE;
/*!40000 ALTER TABLE `tbl_prescription` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_prescription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_rec_lab_avaibility`
--

DROP TABLE IF EXISTS `tbl_rec_lab_avaibility`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_rec_lab_avaibility` (
  `rec_lab_ava_id` int NOT NULL AUTO_INCREMENT,
  `rec_lab_ava_user_id` int NOT NULL,
  `rec_lab_ava_slot_shift_id` int NOT NULL,
  `rec_lab_ava_status` int DEFAULT NULL,
  `rec_lab_ava_day_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_by` int DEFAULT NULL,
  PRIMARY KEY (`rec_lab_ava_id`)
) ENGINE=InnoDB AUTO_INCREMENT=116 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_rec_lab_avaibility`
--

LOCK TABLES `tbl_rec_lab_avaibility` WRITE;
/*!40000 ALTER TABLE `tbl_rec_lab_avaibility` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_rec_lab_avaibility` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_report`
--

DROP TABLE IF EXISTS `tbl_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_report` (
  `report_id` int NOT NULL AUTO_INCREMENT,
  `report_appo_id` int NOT NULL,
  `report_test_id` int NOT NULL,
  `report_photo` varchar(255) DEFAULT NULL,
  `report_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`report_id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_report`
--

LOCK TABLES `tbl_report` WRITE;
/*!40000 ALTER TABLE `tbl_report` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_role`
--

DROP TABLE IF EXISTS `tbl_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_role` (
  `role_id` int NOT NULL AUTO_INCREMENT,
  `role_name` varchar(45) NOT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_role`
--

LOCK TABLES `tbl_role` WRITE;
/*!40000 ALTER TABLE `tbl_role` DISABLE KEYS */;
INSERT INTO `tbl_role` VALUES (1,'Admin'),(2,'Doctor'),(3,'Lab'),(4,'Receptionist'),(5,'Accountant');
/*!40000 ALTER TABLE `tbl_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_room`
--

DROP TABLE IF EXISTS `tbl_room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_room` (
  `room_id` int NOT NULL AUTO_INCREMENT,
  `room_type_id` int NOT NULL,
  `room_status` int NOT NULL DEFAULT '1',
  `room_name` varchar(45) DEFAULT NULL,
  `max_bed` int DEFAULT NULL,
  PRIMARY KEY (`room_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_room`
--

LOCK TABLES `tbl_room` WRITE;
/*!40000 ALTER TABLE `tbl_room` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_room_type`
--

DROP TABLE IF EXISTS `tbl_room_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_room_type` (
  `room_type_id` int NOT NULL AUTO_INCREMENT,
  `room_type` varchar(45) NOT NULL,
  PRIMARY KEY (`room_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_room_type`
--

LOCK TABLES `tbl_room_type` WRITE;
/*!40000 ALTER TABLE `tbl_room_type` DISABLE KEYS */;
INSERT INTO `tbl_room_type` VALUES (1,'ICU'),(2,'Triple Sharing'),(3,'Single Room'),(4,'Twin Sharing'),(5,'Casualty'),(6,'VIP');
/*!40000 ALTER TABLE `tbl_room_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_shift`
--

DROP TABLE IF EXISTS `tbl_shift`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_shift` (
  `shift_id` int NOT NULL AUTO_INCREMENT,
  `shift_time` varchar(255) NOT NULL,
  `shift_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`shift_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_shift`
--

LOCK TABLES `tbl_shift` WRITE;
/*!40000 ALTER TABLE `tbl_shift` DISABLE KEYS */;
INSERT INTO `tbl_shift` VALUES (1,'06:00-14:00','Morning Shift'),(2,'14:00-22:00','Evening Shift'),(3,'22:00-06:00','Night Shift');
/*!40000 ALTER TABLE `tbl_shift` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_slot`
--

DROP TABLE IF EXISTS `tbl_slot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_slot` (
  `slot_id` int NOT NULL AUTO_INCREMENT,
  `slot_time` varchar(45) NOT NULL,
  PRIMARY KEY (`slot_id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_slot`
--

LOCK TABLES `tbl_slot` WRITE;
/*!40000 ALTER TABLE `tbl_slot` DISABLE KEYS */;
INSERT INTO `tbl_slot` VALUES (1,'00:00'),(2,'00:30'),(3,'01:00'),(4,'01:30'),(5,'02:00'),(6,'02:30'),(7,'03:00'),(8,'03:30'),(9,'04:00'),(10,'04:30'),(11,'05:00'),(12,'05:30'),(13,'06:00'),(14,'06:30'),(15,'07:00'),(16,'07:30'),(17,'08:00'),(18,'08:30'),(19,'09:00'),(20,'09:30'),(21,'10:00'),(22,'10:30'),(23,'11:00'),(24,'11:30'),(25,'12:00'),(26,'12:30'),(27,'13:00'),(28,'13:30'),(29,'14:00'),(30,'14:30'),(31,'15:00'),(32,'15:30'),(33,'16:00'),(34,'16:30'),(35,'17:00'),(36,'17:30'),(37,'18:00'),(38,'18:30'),(39,'19:00'),(40,'19:30'),(41,'20:00'),(42,'20:30'),(43,'21:00'),(44,'21:30'),(45,'22:00'),(46,'22:30'),(47,'23:00'),(48,'23:30');
/*!40000 ALTER TABLE `tbl_slot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_slot_shift`
--

DROP TABLE IF EXISTS `tbl_slot_shift`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_slot_shift` (
  `slot_shift_id` int NOT NULL AUTO_INCREMENT,
  `slot_id` int NOT NULL,
  `shift_id` int NOT NULL,
  `day_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_by` int DEFAULT NULL,
  PRIMARY KEY (`slot_shift_id`)
) ENGINE=InnoDB AUTO_INCREMENT=628 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_slot_shift`
--

LOCK TABLES `tbl_slot_shift` WRITE;
/*!40000 ALTER TABLE `tbl_slot_shift` DISABLE KEYS */;
INSERT INTO `tbl_slot_shift` VALUES (255,13,1,7,'2025-03-03 06:07:58',NULL,'2025-03-03 06:07:58',NULL),(256,13,1,6,'2025-03-03 06:07:58',NULL,'2025-03-03 06:07:58',NULL),(257,13,1,5,'2025-03-03 06:07:58',NULL,'2025-03-03 06:07:58',NULL),(258,13,1,4,'2025-03-03 06:07:58',NULL,'2025-03-03 06:07:58',NULL),(259,13,1,3,'2025-03-03 06:07:58',NULL,'2025-03-03 06:07:58',NULL),(260,13,1,2,'2025-03-03 06:07:58',NULL,'2025-03-03 06:07:58',NULL),(261,13,1,1,'2025-03-03 06:07:58',NULL,'2025-03-03 06:07:58',NULL),(262,14,1,7,'2025-03-03 06:07:58',NULL,'2025-03-03 06:07:58',NULL),(263,14,1,6,'2025-03-03 06:07:58',NULL,'2025-03-03 06:07:58',NULL),(264,14,1,5,'2025-03-03 06:07:58',NULL,'2025-03-03 06:07:58',NULL),(265,14,1,4,'2025-03-03 06:07:58',NULL,'2025-03-03 06:07:58',NULL),(266,14,1,3,'2025-03-03 06:07:58',NULL,'2025-03-03 06:07:58',NULL),(267,14,1,2,'2025-03-03 06:07:58',NULL,'2025-03-03 06:07:58',NULL),(268,14,1,1,'2025-03-03 06:07:58',NULL,'2025-03-03 06:07:58',NULL),(269,15,1,7,'2025-03-03 06:07:58',NULL,'2025-03-03 06:07:58',NULL),(270,15,1,6,'2025-03-03 06:07:58',NULL,'2025-03-03 06:07:58',NULL),(271,15,1,5,'2025-03-03 06:07:58',NULL,'2025-03-03 06:07:58',NULL),(272,15,1,4,'2025-03-03 06:07:58',NULL,'2025-03-03 06:07:58',NULL),(273,15,1,3,'2025-03-03 06:07:58',NULL,'2025-03-03 06:07:58',NULL),(274,15,1,2,'2025-03-03 06:07:58',NULL,'2025-03-03 06:07:58',NULL),(275,15,1,1,'2025-03-03 06:07:58',NULL,'2025-03-03 06:07:58',NULL),(276,16,1,7,'2025-03-03 06:07:58',NULL,'2025-03-03 06:07:58',NULL),(277,16,1,6,'2025-03-03 06:07:58',NULL,'2025-03-03 06:07:58',NULL),(278,16,1,5,'2025-03-03 06:07:58',NULL,'2025-03-03 06:07:58',NULL),(279,16,1,4,'2025-03-03 06:07:58',NULL,'2025-03-03 06:07:58',NULL),(280,16,1,3,'2025-03-03 06:07:58',NULL,'2025-03-03 06:07:58',NULL),(281,16,1,2,'2025-03-03 06:07:58',NULL,'2025-03-03 06:07:58',NULL),(282,16,1,1,'2025-03-03 06:07:58',NULL,'2025-03-03 06:07:58',NULL),(283,17,1,7,'2025-03-03 06:07:58',NULL,'2025-03-03 06:07:58',NULL),(284,17,1,6,'2025-03-03 06:07:58',NULL,'2025-03-03 06:07:58',NULL),(285,17,1,5,'2025-03-03 06:07:58',NULL,'2025-03-03 06:07:58',NULL),(286,17,1,4,'2025-03-03 06:07:58',NULL,'2025-03-03 06:07:58',NULL),(287,17,1,3,'2025-03-03 06:07:58',NULL,'2025-03-03 06:07:58',NULL),(288,17,1,2,'2025-03-03 06:07:58',NULL,'2025-03-03 06:07:58',NULL),(289,17,1,1,'2025-03-03 06:07:58',NULL,'2025-03-03 06:07:58',NULL),(290,18,1,7,'2025-03-03 06:07:58',NULL,'2025-03-03 06:07:58',NULL),(291,18,1,6,'2025-03-03 06:07:58',NULL,'2025-03-03 06:07:58',NULL),(292,18,1,5,'2025-03-03 06:07:58',NULL,'2025-03-03 06:07:58',NULL),(293,18,1,4,'2025-03-03 06:07:58',NULL,'2025-03-03 06:07:58',NULL),(294,18,1,3,'2025-03-03 06:07:58',NULL,'2025-03-03 06:07:58',NULL),(295,18,1,2,'2025-03-03 06:07:58',NULL,'2025-03-03 06:07:58',NULL),(296,18,1,1,'2025-03-03 06:07:58',NULL,'2025-03-03 06:07:58',NULL),(297,19,1,7,'2025-03-03 06:07:58',NULL,'2025-03-03 06:07:58',NULL),(298,19,1,6,'2025-03-03 06:07:58',NULL,'2025-03-03 06:07:58',NULL),(299,19,1,5,'2025-03-03 06:07:58',NULL,'2025-03-03 06:07:58',NULL),(300,19,1,4,'2025-03-03 06:07:58',NULL,'2025-03-03 06:07:58',NULL),(301,19,1,3,'2025-03-03 06:07:58',NULL,'2025-03-03 06:07:58',NULL),(302,19,1,2,'2025-03-03 06:07:58',NULL,'2025-03-03 06:07:58',NULL),(303,19,1,1,'2025-03-03 06:07:58',NULL,'2025-03-03 06:07:58',NULL),(304,20,1,7,'2025-03-03 06:07:58',NULL,'2025-03-03 06:07:58',NULL),(305,20,1,6,'2025-03-03 06:07:58',NULL,'2025-03-03 06:07:58',NULL),(306,20,1,5,'2025-03-03 06:07:58',NULL,'2025-03-03 06:07:58',NULL),(307,20,1,4,'2025-03-03 06:07:58',NULL,'2025-03-03 06:07:58',NULL),(308,20,1,3,'2025-03-03 06:07:58',NULL,'2025-03-03 06:07:58',NULL),(309,20,1,2,'2025-03-03 06:07:58',NULL,'2025-03-03 06:07:58',NULL),(310,20,1,1,'2025-03-03 06:07:58',NULL,'2025-03-03 06:07:58',NULL),(311,21,1,7,'2025-03-03 06:07:58',NULL,'2025-03-03 06:07:58',NULL),(312,21,1,6,'2025-03-03 06:07:58',NULL,'2025-03-03 06:07:58',NULL),(313,21,1,5,'2025-03-03 06:07:58',NULL,'2025-03-03 06:07:58',NULL),(314,21,1,4,'2025-03-03 06:07:58',NULL,'2025-03-03 06:07:58',NULL),(315,21,1,3,'2025-03-03 06:07:58',NULL,'2025-03-03 06:07:58',NULL),(316,21,1,2,'2025-03-03 06:07:58',NULL,'2025-03-03 06:07:58',NULL),(317,21,1,1,'2025-03-03 06:07:58',NULL,'2025-03-03 06:07:58',NULL),(318,22,1,7,'2025-03-03 06:07:58',NULL,'2025-03-03 06:07:58',NULL),(319,22,1,6,'2025-03-03 06:07:58',NULL,'2025-03-03 06:07:58',NULL),(320,22,1,5,'2025-03-03 06:07:58',NULL,'2025-03-03 06:07:58',NULL),(321,22,1,4,'2025-03-03 06:07:58',NULL,'2025-03-03 06:07:58',NULL),(322,22,1,3,'2025-03-03 06:07:58',NULL,'2025-03-03 06:07:58',NULL),(323,22,1,2,'2025-03-03 06:07:58',NULL,'2025-03-03 06:07:58',NULL),(324,22,1,1,'2025-03-03 06:07:58',NULL,'2025-03-03 06:07:58',NULL),(325,23,1,7,'2025-03-03 06:07:58',NULL,'2025-03-03 06:07:58',NULL),(326,23,1,6,'2025-03-03 06:07:58',NULL,'2025-03-03 06:07:58',NULL),(327,23,1,5,'2025-03-03 06:07:58',NULL,'2025-03-03 06:07:58',NULL),(328,23,1,4,'2025-03-03 06:07:58',NULL,'2025-03-03 06:07:58',NULL),(329,23,1,3,'2025-03-03 06:07:58',NULL,'2025-03-03 06:07:58',NULL),(330,23,1,2,'2025-03-03 06:07:58',NULL,'2025-03-03 06:07:58',NULL),(331,23,1,1,'2025-03-03 06:07:58',NULL,'2025-03-03 06:07:58',NULL),(332,24,1,7,'2025-03-03 06:07:58',NULL,'2025-03-03 06:07:58',NULL),(333,24,1,6,'2025-03-03 06:07:58',NULL,'2025-03-03 06:07:58',NULL),(334,24,1,5,'2025-03-03 06:07:58',NULL,'2025-03-03 06:07:58',NULL),(335,24,1,4,'2025-03-03 06:07:58',NULL,'2025-03-03 06:07:58',NULL),(336,24,1,3,'2025-03-03 06:07:58',NULL,'2025-03-03 06:07:58',NULL),(337,24,1,2,'2025-03-03 06:07:58',NULL,'2025-03-03 06:07:58',NULL),(338,24,1,1,'2025-03-03 06:07:58',NULL,'2025-03-03 06:07:58',NULL),(339,25,1,7,'2025-03-03 06:07:58',NULL,'2025-03-03 06:07:58',NULL),(340,25,1,6,'2025-03-03 06:07:58',NULL,'2025-03-03 06:07:58',NULL),(341,25,1,5,'2025-03-03 06:07:58',NULL,'2025-03-03 06:07:58',NULL),(342,25,1,4,'2025-03-03 06:07:58',NULL,'2025-03-03 06:07:58',NULL),(343,25,1,3,'2025-03-03 06:07:58',NULL,'2025-03-03 06:07:58',NULL),(344,25,1,2,'2025-03-03 06:07:58',NULL,'2025-03-03 06:07:58',NULL),(345,25,1,1,'2025-03-03 06:07:58',NULL,'2025-03-03 06:07:58',NULL),(346,26,1,7,'2025-03-03 06:07:58',NULL,'2025-03-03 06:07:58',NULL),(347,26,1,6,'2025-03-03 06:07:58',NULL,'2025-03-03 06:07:58',NULL),(348,26,1,5,'2025-03-03 06:07:58',NULL,'2025-03-03 06:07:58',NULL),(349,26,1,4,'2025-03-03 06:07:58',NULL,'2025-03-03 06:07:58',NULL),(350,26,1,3,'2025-03-03 06:07:58',NULL,'2025-03-03 06:07:58',NULL),(351,26,1,2,'2025-03-03 06:07:58',NULL,'2025-03-03 06:07:58',NULL),(352,26,1,1,'2025-03-03 06:07:58',NULL,'2025-03-03 06:07:58',NULL),(353,27,1,7,'2025-03-03 06:07:58',NULL,'2025-03-03 06:07:58',NULL),(354,27,1,6,'2025-03-03 06:07:58',NULL,'2025-03-03 06:07:58',NULL),(355,27,1,5,'2025-03-03 06:07:58',NULL,'2025-03-03 06:07:58',NULL),(356,27,1,4,'2025-03-03 06:07:58',NULL,'2025-03-03 06:07:58',NULL),(357,27,1,3,'2025-03-03 06:07:58',NULL,'2025-03-03 06:07:58',NULL),(358,27,1,2,'2025-03-03 06:07:58',NULL,'2025-03-03 06:07:58',NULL),(359,27,1,1,'2025-03-03 06:07:58',NULL,'2025-03-03 06:07:58',NULL),(360,28,1,7,'2025-03-03 06:07:58',NULL,'2025-03-03 06:07:58',NULL),(361,28,1,6,'2025-03-03 06:07:58',NULL,'2025-03-03 06:07:58',NULL),(362,28,1,5,'2025-03-03 06:07:58',NULL,'2025-03-03 06:07:58',NULL),(363,28,1,4,'2025-03-03 06:07:58',NULL,'2025-03-03 06:07:58',NULL),(364,28,1,3,'2025-03-03 06:07:58',NULL,'2025-03-03 06:07:58',NULL),(365,28,1,2,'2025-03-03 06:07:58',NULL,'2025-03-03 06:07:58',NULL),(366,28,1,1,'2025-03-03 06:07:58',NULL,'2025-03-03 06:07:58',NULL),(367,29,1,7,'2025-03-03 06:07:58',NULL,'2025-03-03 06:07:58',NULL),(368,29,1,6,'2025-03-03 06:07:58',NULL,'2025-03-03 06:07:58',NULL),(369,29,1,5,'2025-03-03 06:07:58',NULL,'2025-03-03 06:07:58',NULL),(370,29,1,4,'2025-03-03 06:07:58',NULL,'2025-03-03 06:07:58',NULL),(371,29,1,3,'2025-03-03 06:07:58',NULL,'2025-03-03 06:07:58',NULL),(372,29,1,2,'2025-03-03 06:07:58',NULL,'2025-03-03 06:07:58',NULL),(373,29,1,1,'2025-03-03 06:07:58',NULL,'2025-03-03 06:07:58',NULL),(382,29,2,7,'2025-03-03 06:12:03',NULL,'2025-03-03 06:12:03',NULL),(383,29,2,6,'2025-03-03 06:12:03',NULL,'2025-03-03 06:12:03',NULL),(384,29,2,5,'2025-03-03 06:12:03',NULL,'2025-03-03 06:12:03',NULL),(385,29,2,4,'2025-03-03 06:12:03',NULL,'2025-03-03 06:12:03',NULL),(386,29,2,3,'2025-03-03 06:12:03',NULL,'2025-03-03 06:12:03',NULL),(387,29,2,2,'2025-03-03 06:12:03',NULL,'2025-03-03 06:12:03',NULL),(388,29,2,1,'2025-03-03 06:12:03',NULL,'2025-03-03 06:12:03',NULL),(389,30,2,7,'2025-03-03 06:12:03',NULL,'2025-03-03 06:12:03',NULL),(390,30,2,6,'2025-03-03 06:12:03',NULL,'2025-03-03 06:12:03',NULL),(391,30,2,5,'2025-03-03 06:12:03',NULL,'2025-03-03 06:12:03',NULL),(392,30,2,4,'2025-03-03 06:12:03',NULL,'2025-03-03 06:12:03',NULL),(393,30,2,3,'2025-03-03 06:12:03',NULL,'2025-03-03 06:12:03',NULL),(394,30,2,2,'2025-03-03 06:12:03',NULL,'2025-03-03 06:12:03',NULL),(395,30,2,1,'2025-03-03 06:12:03',NULL,'2025-03-03 06:12:03',NULL),(396,31,2,7,'2025-03-03 06:12:03',NULL,'2025-03-03 06:12:03',NULL),(397,31,2,6,'2025-03-03 06:12:03',NULL,'2025-03-03 06:12:03',NULL),(398,31,2,5,'2025-03-03 06:12:03',NULL,'2025-03-03 06:12:03',NULL),(399,31,2,4,'2025-03-03 06:12:03',NULL,'2025-03-03 06:12:03',NULL),(400,31,2,3,'2025-03-03 06:12:03',NULL,'2025-03-03 06:12:03',NULL),(401,31,2,2,'2025-03-03 06:12:03',NULL,'2025-03-03 06:12:03',NULL),(402,31,2,1,'2025-03-03 06:12:03',NULL,'2025-03-03 06:12:03',NULL),(403,32,2,7,'2025-03-03 06:12:03',NULL,'2025-03-03 06:12:03',NULL),(404,32,2,6,'2025-03-03 06:12:03',NULL,'2025-03-03 06:12:03',NULL),(405,32,2,5,'2025-03-03 06:12:03',NULL,'2025-03-03 06:12:03',NULL),(406,32,2,4,'2025-03-03 06:12:03',NULL,'2025-03-03 06:12:03',NULL),(407,32,2,3,'2025-03-03 06:12:03',NULL,'2025-03-03 06:12:03',NULL),(408,32,2,2,'2025-03-03 06:12:03',NULL,'2025-03-03 06:12:03',NULL),(409,32,2,1,'2025-03-03 06:12:03',NULL,'2025-03-03 06:12:03',NULL),(410,33,2,7,'2025-03-03 06:12:03',NULL,'2025-03-03 06:12:03',NULL),(411,33,2,6,'2025-03-03 06:12:03',NULL,'2025-03-03 06:12:03',NULL),(412,33,2,5,'2025-03-03 06:12:03',NULL,'2025-03-03 06:12:03',NULL),(413,33,2,4,'2025-03-03 06:12:03',NULL,'2025-03-03 06:12:03',NULL),(414,33,2,3,'2025-03-03 06:12:03',NULL,'2025-03-03 06:12:03',NULL),(415,33,2,2,'2025-03-03 06:12:03',NULL,'2025-03-03 06:12:03',NULL),(416,33,2,1,'2025-03-03 06:12:03',NULL,'2025-03-03 06:12:03',NULL),(417,34,2,7,'2025-03-03 06:12:03',NULL,'2025-03-03 06:12:03',NULL),(418,34,2,6,'2025-03-03 06:12:03',NULL,'2025-03-03 06:12:03',NULL),(419,34,2,5,'2025-03-03 06:12:03',NULL,'2025-03-03 06:12:03',NULL),(420,34,2,4,'2025-03-03 06:12:03',NULL,'2025-03-03 06:12:03',NULL),(421,34,2,3,'2025-03-03 06:12:03',NULL,'2025-03-03 06:12:03',NULL),(422,34,2,2,'2025-03-03 06:12:03',NULL,'2025-03-03 06:12:03',NULL),(423,34,2,1,'2025-03-03 06:12:03',NULL,'2025-03-03 06:12:03',NULL),(424,35,2,7,'2025-03-03 06:12:03',NULL,'2025-03-03 06:12:03',NULL),(425,35,2,6,'2025-03-03 06:12:03',NULL,'2025-03-03 06:12:03',NULL),(426,35,2,5,'2025-03-03 06:12:03',NULL,'2025-03-03 06:12:03',NULL),(427,35,2,4,'2025-03-03 06:12:03',NULL,'2025-03-03 06:12:03',NULL),(428,35,2,3,'2025-03-03 06:12:03',NULL,'2025-03-03 06:12:03',NULL),(429,35,2,2,'2025-03-03 06:12:03',NULL,'2025-03-03 06:12:03',NULL),(430,35,2,1,'2025-03-03 06:12:03',NULL,'2025-03-03 06:12:03',NULL),(431,36,2,7,'2025-03-03 06:12:03',NULL,'2025-03-03 06:12:03',NULL),(432,36,2,6,'2025-03-03 06:12:03',NULL,'2025-03-03 06:12:03',NULL),(433,36,2,5,'2025-03-03 06:12:03',NULL,'2025-03-03 06:12:03',NULL),(434,36,2,4,'2025-03-03 06:12:03',NULL,'2025-03-03 06:12:03',NULL),(435,36,2,3,'2025-03-03 06:12:03',NULL,'2025-03-03 06:12:03',NULL),(436,36,2,2,'2025-03-03 06:12:03',NULL,'2025-03-03 06:12:03',NULL),(437,36,2,1,'2025-03-03 06:12:03',NULL,'2025-03-03 06:12:03',NULL),(438,37,2,7,'2025-03-03 06:12:03',NULL,'2025-03-03 06:12:03',NULL),(439,37,2,6,'2025-03-03 06:12:03',NULL,'2025-03-03 06:12:03',NULL),(440,37,2,5,'2025-03-03 06:12:03',NULL,'2025-03-03 06:12:03',NULL),(441,37,2,4,'2025-03-03 06:12:03',NULL,'2025-03-03 06:12:03',NULL),(442,37,2,3,'2025-03-03 06:12:03',NULL,'2025-03-03 06:12:03',NULL),(443,37,2,2,'2025-03-03 06:12:03',NULL,'2025-03-03 06:12:03',NULL),(444,37,2,1,'2025-03-03 06:12:03',NULL,'2025-03-03 06:12:03',NULL),(445,38,2,7,'2025-03-03 06:12:03',NULL,'2025-03-03 06:12:03',NULL),(446,38,2,6,'2025-03-03 06:12:03',NULL,'2025-03-03 06:12:03',NULL),(447,38,2,5,'2025-03-03 06:12:03',NULL,'2025-03-03 06:12:03',NULL),(448,38,2,4,'2025-03-03 06:12:03',NULL,'2025-03-03 06:12:03',NULL),(449,38,2,3,'2025-03-03 06:12:03',NULL,'2025-03-03 06:12:03',NULL),(450,38,2,2,'2025-03-03 06:12:03',NULL,'2025-03-03 06:12:03',NULL),(451,38,2,1,'2025-03-03 06:12:03',NULL,'2025-03-03 06:12:03',NULL),(452,39,2,7,'2025-03-03 06:12:03',NULL,'2025-03-03 06:12:03',NULL),(453,39,2,6,'2025-03-03 06:12:03',NULL,'2025-03-03 06:12:03',NULL),(454,39,2,5,'2025-03-03 06:12:03',NULL,'2025-03-03 06:12:03',NULL),(455,39,2,4,'2025-03-03 06:12:03',NULL,'2025-03-03 06:12:03',NULL),(456,39,2,3,'2025-03-03 06:12:03',NULL,'2025-03-03 06:12:03',NULL),(457,39,2,2,'2025-03-03 06:12:03',NULL,'2025-03-03 06:12:03',NULL),(458,39,2,1,'2025-03-03 06:12:03',NULL,'2025-03-03 06:12:03',NULL),(459,40,2,7,'2025-03-03 06:12:03',NULL,'2025-03-03 06:12:03',NULL),(460,40,2,6,'2025-03-03 06:12:03',NULL,'2025-03-03 06:12:03',NULL),(461,40,2,5,'2025-03-03 06:12:03',NULL,'2025-03-03 06:12:03',NULL),(462,40,2,4,'2025-03-03 06:12:03',NULL,'2025-03-03 06:12:03',NULL),(463,40,2,3,'2025-03-03 06:12:03',NULL,'2025-03-03 06:12:03',NULL),(464,40,2,2,'2025-03-03 06:12:03',NULL,'2025-03-03 06:12:03',NULL),(465,40,2,1,'2025-03-03 06:12:03',NULL,'2025-03-03 06:12:03',NULL),(466,41,2,7,'2025-03-03 06:12:03',NULL,'2025-03-03 06:12:03',NULL),(467,41,2,6,'2025-03-03 06:12:03',NULL,'2025-03-03 06:12:03',NULL),(468,41,2,5,'2025-03-03 06:12:03',NULL,'2025-03-03 06:12:03',NULL),(469,41,2,4,'2025-03-03 06:12:03',NULL,'2025-03-03 06:12:03',NULL),(470,41,2,3,'2025-03-03 06:12:03',NULL,'2025-03-03 06:12:03',NULL),(471,41,2,2,'2025-03-03 06:12:03',NULL,'2025-03-03 06:12:03',NULL),(472,41,2,1,'2025-03-03 06:12:03',NULL,'2025-03-03 06:12:03',NULL),(473,42,2,7,'2025-03-03 06:12:03',NULL,'2025-03-03 06:12:03',NULL),(474,42,2,6,'2025-03-03 06:12:03',NULL,'2025-03-03 06:12:03',NULL),(475,42,2,5,'2025-03-03 06:12:03',NULL,'2025-03-03 06:12:03',NULL),(476,42,2,4,'2025-03-03 06:12:03',NULL,'2025-03-03 06:12:03',NULL),(477,42,2,3,'2025-03-03 06:12:03',NULL,'2025-03-03 06:12:03',NULL),(478,42,2,2,'2025-03-03 06:12:03',NULL,'2025-03-03 06:12:03',NULL),(479,42,2,1,'2025-03-03 06:12:03',NULL,'2025-03-03 06:12:03',NULL),(480,43,2,7,'2025-03-03 06:12:03',NULL,'2025-03-03 06:12:03',NULL),(481,43,2,6,'2025-03-03 06:12:03',NULL,'2025-03-03 06:12:03',NULL),(482,43,2,5,'2025-03-03 06:12:03',NULL,'2025-03-03 06:12:03',NULL),(483,43,2,4,'2025-03-03 06:12:03',NULL,'2025-03-03 06:12:03',NULL),(484,43,2,3,'2025-03-03 06:12:03',NULL,'2025-03-03 06:12:03',NULL),(485,43,2,2,'2025-03-03 06:12:03',NULL,'2025-03-03 06:12:03',NULL),(486,43,2,1,'2025-03-03 06:12:03',NULL,'2025-03-03 06:12:03',NULL),(487,44,2,7,'2025-03-03 06:12:03',NULL,'2025-03-03 06:12:03',NULL),(488,44,2,6,'2025-03-03 06:12:03',NULL,'2025-03-03 06:12:03',NULL),(489,44,2,5,'2025-03-03 06:12:03',NULL,'2025-03-03 06:12:03',NULL),(490,44,2,4,'2025-03-03 06:12:03',NULL,'2025-03-03 06:12:03',NULL),(491,44,2,3,'2025-03-03 06:12:03',NULL,'2025-03-03 06:12:03',NULL),(492,44,2,2,'2025-03-03 06:12:03',NULL,'2025-03-03 06:12:03',NULL),(493,44,2,1,'2025-03-03 06:12:03',NULL,'2025-03-03 06:12:03',NULL),(494,45,2,7,'2025-03-03 06:12:03',NULL,'2025-03-03 06:12:03',NULL),(495,45,2,6,'2025-03-03 06:12:03',NULL,'2025-03-03 06:12:03',NULL),(496,45,2,5,'2025-03-03 06:12:03',NULL,'2025-03-03 06:12:03',NULL),(497,45,2,4,'2025-03-03 06:12:03',NULL,'2025-03-03 06:12:03',NULL),(498,45,2,3,'2025-03-03 06:12:03',NULL,'2025-03-03 06:12:03',NULL),(499,45,2,2,'2025-03-03 06:12:03',NULL,'2025-03-03 06:12:03',NULL),(500,45,2,1,'2025-03-03 06:12:03',NULL,'2025-03-03 06:12:03',NULL),(509,45,3,7,'2025-03-03 06:16:37',NULL,'2025-03-03 06:16:37',NULL),(510,45,3,6,'2025-03-03 06:16:37',NULL,'2025-03-03 06:16:37',NULL),(511,45,3,5,'2025-03-03 06:16:37',NULL,'2025-03-03 06:16:37',NULL),(512,45,3,4,'2025-03-03 06:16:37',NULL,'2025-03-03 06:16:37',NULL),(513,45,3,3,'2025-03-03 06:16:37',NULL,'2025-03-03 06:16:37',NULL),(514,45,3,2,'2025-03-03 06:16:37',NULL,'2025-03-03 06:16:37',NULL),(515,45,3,1,'2025-03-03 06:16:37',NULL,'2025-03-03 06:16:37',NULL),(516,46,3,7,'2025-03-03 06:16:37',NULL,'2025-03-03 06:16:37',NULL),(517,46,3,6,'2025-03-03 06:16:37',NULL,'2025-03-03 06:16:37',NULL),(518,46,3,5,'2025-03-03 06:16:37',NULL,'2025-03-03 06:16:37',NULL),(519,46,3,4,'2025-03-03 06:16:37',NULL,'2025-03-03 06:16:37',NULL),(520,46,3,3,'2025-03-03 06:16:37',NULL,'2025-03-03 06:16:37',NULL),(521,46,3,2,'2025-03-03 06:16:37',NULL,'2025-03-03 06:16:37',NULL),(522,46,3,1,'2025-03-03 06:16:37',NULL,'2025-03-03 06:16:37',NULL),(523,47,3,7,'2025-03-03 06:16:37',NULL,'2025-03-03 06:16:37',NULL),(524,47,3,6,'2025-03-03 06:16:37',NULL,'2025-03-03 06:16:37',NULL),(525,47,3,5,'2025-03-03 06:16:37',NULL,'2025-03-03 06:16:37',NULL),(526,47,3,4,'2025-03-03 06:16:37',NULL,'2025-03-03 06:16:37',NULL),(527,47,3,3,'2025-03-03 06:16:37',NULL,'2025-03-03 06:16:37',NULL),(528,47,3,2,'2025-03-03 06:16:37',NULL,'2025-03-03 06:16:37',NULL),(529,47,3,1,'2025-03-03 06:16:37',NULL,'2025-03-03 06:16:37',NULL),(530,48,3,7,'2025-03-03 06:16:37',NULL,'2025-03-03 06:16:37',NULL),(531,48,3,6,'2025-03-03 06:16:37',NULL,'2025-03-03 06:16:37',NULL),(532,48,3,5,'2025-03-03 06:16:37',NULL,'2025-03-03 06:16:37',NULL),(533,48,3,4,'2025-03-03 06:16:37',NULL,'2025-03-03 06:16:37',NULL),(534,48,3,3,'2025-03-03 06:16:37',NULL,'2025-03-03 06:16:37',NULL),(535,48,3,2,'2025-03-03 06:16:37',NULL,'2025-03-03 06:16:37',NULL),(536,48,3,1,'2025-03-03 06:16:37',NULL,'2025-03-03 06:16:37',NULL),(537,1,3,7,'2025-03-03 06:16:37',NULL,'2025-03-03 06:16:37',NULL),(538,1,3,6,'2025-03-03 06:16:37',NULL,'2025-03-03 06:16:37',NULL),(539,1,3,5,'2025-03-03 06:16:37',NULL,'2025-03-03 06:16:37',NULL),(540,1,3,4,'2025-03-03 06:16:37',NULL,'2025-03-03 06:16:37',NULL),(541,1,3,3,'2025-03-03 06:16:37',NULL,'2025-03-03 06:16:37',NULL),(542,1,3,2,'2025-03-03 06:16:37',NULL,'2025-03-03 06:16:37',NULL),(543,1,3,1,'2025-03-03 06:16:37',NULL,'2025-03-03 06:16:37',NULL),(544,2,3,7,'2025-03-03 06:16:37',NULL,'2025-03-03 06:16:37',NULL),(545,2,3,6,'2025-03-03 06:16:37',NULL,'2025-03-03 06:16:37',NULL),(546,2,3,5,'2025-03-03 06:16:37',NULL,'2025-03-03 06:16:37',NULL),(547,2,3,4,'2025-03-03 06:16:37',NULL,'2025-03-03 06:16:37',NULL),(548,2,3,3,'2025-03-03 06:16:37',NULL,'2025-03-03 06:16:37',NULL),(549,2,3,2,'2025-03-03 06:16:37',NULL,'2025-03-03 06:16:37',NULL),(550,2,3,1,'2025-03-03 06:16:37',NULL,'2025-03-03 06:16:37',NULL),(551,3,3,7,'2025-03-03 06:16:37',NULL,'2025-03-03 06:16:37',NULL),(552,3,3,6,'2025-03-03 06:16:37',NULL,'2025-03-03 06:16:37',NULL),(553,3,3,5,'2025-03-03 06:16:37',NULL,'2025-03-03 06:16:37',NULL),(554,3,3,4,'2025-03-03 06:16:37',NULL,'2025-03-03 06:16:37',NULL),(555,3,3,3,'2025-03-03 06:16:37',NULL,'2025-03-03 06:16:37',NULL),(556,3,3,2,'2025-03-03 06:16:37',NULL,'2025-03-03 06:16:37',NULL),(557,3,3,1,'2025-03-03 06:16:37',NULL,'2025-03-03 06:16:37',NULL),(558,4,3,7,'2025-03-03 06:16:37',NULL,'2025-03-03 06:16:37',NULL),(559,4,3,6,'2025-03-03 06:16:37',NULL,'2025-03-03 06:16:37',NULL),(560,4,3,5,'2025-03-03 06:16:37',NULL,'2025-03-03 06:16:37',NULL),(561,4,3,4,'2025-03-03 06:16:37',NULL,'2025-03-03 06:16:37',NULL),(562,4,3,3,'2025-03-03 06:16:37',NULL,'2025-03-03 06:16:37',NULL),(563,4,3,2,'2025-03-03 06:16:37',NULL,'2025-03-03 06:16:37',NULL),(564,4,3,1,'2025-03-03 06:16:37',NULL,'2025-03-03 06:16:37',NULL),(565,5,3,7,'2025-03-03 06:16:37',NULL,'2025-03-03 06:16:37',NULL),(566,5,3,6,'2025-03-03 06:16:37',NULL,'2025-03-03 06:16:37',NULL),(567,5,3,5,'2025-03-03 06:16:37',NULL,'2025-03-03 06:16:37',NULL),(568,5,3,4,'2025-03-03 06:16:37',NULL,'2025-03-03 06:16:37',NULL),(569,5,3,3,'2025-03-03 06:16:37',NULL,'2025-03-03 06:16:37',NULL),(570,5,3,2,'2025-03-03 06:16:37',NULL,'2025-03-03 06:16:37',NULL),(571,5,3,1,'2025-03-03 06:16:37',NULL,'2025-03-03 06:16:37',NULL),(572,6,3,7,'2025-03-03 06:16:37',NULL,'2025-03-03 06:16:37',NULL),(573,6,3,6,'2025-03-03 06:16:37',NULL,'2025-03-03 06:16:37',NULL),(574,6,3,5,'2025-03-03 06:16:37',NULL,'2025-03-03 06:16:37',NULL),(575,6,3,4,'2025-03-03 06:16:37',NULL,'2025-03-03 06:16:37',NULL),(576,6,3,3,'2025-03-03 06:16:37',NULL,'2025-03-03 06:16:37',NULL),(577,6,3,2,'2025-03-03 06:16:37',NULL,'2025-03-03 06:16:37',NULL),(578,6,3,1,'2025-03-03 06:16:37',NULL,'2025-03-03 06:16:37',NULL),(579,7,3,7,'2025-03-03 06:16:37',NULL,'2025-03-03 06:16:37',NULL),(580,7,3,6,'2025-03-03 06:16:37',NULL,'2025-03-03 06:16:37',NULL),(581,7,3,5,'2025-03-03 06:16:37',NULL,'2025-03-03 06:16:37',NULL),(582,7,3,4,'2025-03-03 06:16:37',NULL,'2025-03-03 06:16:37',NULL),(583,7,3,3,'2025-03-03 06:16:37',NULL,'2025-03-03 06:16:37',NULL),(584,7,3,2,'2025-03-03 06:16:37',NULL,'2025-03-03 06:16:37',NULL),(585,7,3,1,'2025-03-03 06:16:37',NULL,'2025-03-03 06:16:37',NULL),(586,8,3,7,'2025-03-03 06:16:37',NULL,'2025-03-03 06:16:37',NULL),(587,8,3,6,'2025-03-03 06:16:37',NULL,'2025-03-03 06:16:37',NULL),(588,8,3,5,'2025-03-03 06:16:37',NULL,'2025-03-03 06:16:37',NULL),(589,8,3,4,'2025-03-03 06:16:37',NULL,'2025-03-03 06:16:37',NULL),(590,8,3,3,'2025-03-03 06:16:37',NULL,'2025-03-03 06:16:37',NULL),(591,8,3,2,'2025-03-03 06:16:37',NULL,'2025-03-03 06:16:37',NULL),(592,8,3,1,'2025-03-03 06:16:37',NULL,'2025-03-03 06:16:37',NULL),(593,9,3,7,'2025-03-03 06:16:37',NULL,'2025-03-03 06:16:37',NULL),(594,9,3,6,'2025-03-03 06:16:37',NULL,'2025-03-03 06:16:37',NULL),(595,9,3,5,'2025-03-03 06:16:37',NULL,'2025-03-03 06:16:37',NULL),(596,9,3,4,'2025-03-03 06:16:37',NULL,'2025-03-03 06:16:37',NULL),(597,9,3,3,'2025-03-03 06:16:37',NULL,'2025-03-03 06:16:37',NULL),(598,9,3,2,'2025-03-03 06:16:37',NULL,'2025-03-03 06:16:37',NULL),(599,9,3,1,'2025-03-03 06:16:37',NULL,'2025-03-03 06:16:37',NULL),(600,10,3,7,'2025-03-03 06:16:37',NULL,'2025-03-03 06:16:37',NULL),(601,10,3,6,'2025-03-03 06:16:37',NULL,'2025-03-03 06:16:37',NULL),(602,10,3,5,'2025-03-03 06:16:37',NULL,'2025-03-03 06:16:37',NULL),(603,10,3,4,'2025-03-03 06:16:37',NULL,'2025-03-03 06:16:37',NULL),(604,10,3,3,'2025-03-03 06:16:37',NULL,'2025-03-03 06:16:37',NULL),(605,10,3,2,'2025-03-03 06:16:37',NULL,'2025-03-03 06:16:37',NULL),(606,10,3,1,'2025-03-03 06:16:37',NULL,'2025-03-03 06:16:37',NULL),(607,11,3,7,'2025-03-03 06:16:37',NULL,'2025-03-03 06:16:37',NULL),(608,11,3,6,'2025-03-03 06:16:37',NULL,'2025-03-03 06:16:37',NULL),(609,11,3,5,'2025-03-03 06:16:37',NULL,'2025-03-03 06:16:37',NULL),(610,11,3,4,'2025-03-03 06:16:37',NULL,'2025-03-03 06:16:37',NULL),(611,11,3,3,'2025-03-03 06:16:37',NULL,'2025-03-03 06:16:37',NULL),(612,11,3,2,'2025-03-03 06:16:37',NULL,'2025-03-03 06:16:37',NULL),(613,11,3,1,'2025-03-03 06:16:37',NULL,'2025-03-03 06:16:37',NULL),(614,12,3,7,'2025-03-03 06:16:37',NULL,'2025-03-03 06:16:37',NULL),(615,12,3,6,'2025-03-03 06:16:37',NULL,'2025-03-03 06:16:37',NULL),(616,12,3,5,'2025-03-03 06:16:37',NULL,'2025-03-03 06:16:37',NULL),(617,12,3,4,'2025-03-03 06:16:37',NULL,'2025-03-03 06:16:37',NULL),(618,12,3,3,'2025-03-03 06:16:37',NULL,'2025-03-03 06:16:37',NULL),(619,12,3,2,'2025-03-03 06:16:37',NULL,'2025-03-03 06:16:37',NULL),(620,12,3,1,'2025-03-03 06:16:37',NULL,'2025-03-03 06:16:37',NULL),(621,13,3,7,'2025-03-03 06:16:37',NULL,'2025-03-03 06:16:37',NULL),(622,13,3,6,'2025-03-03 06:16:37',NULL,'2025-03-03 06:16:37',NULL),(623,13,3,5,'2025-03-03 06:16:37',NULL,'2025-03-03 06:16:37',NULL),(624,13,3,4,'2025-03-03 06:16:37',NULL,'2025-03-03 06:16:37',NULL),(625,13,3,3,'2025-03-03 06:16:37',NULL,'2025-03-03 06:16:37',NULL),(626,13,3,2,'2025-03-03 06:16:37',NULL,'2025-03-03 06:16:37',NULL),(627,13,3,1,'2025-03-03 06:16:37',NULL,'2025-03-03 06:16:37',NULL);
/*!40000 ALTER TABLE `tbl_slot_shift` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_test`
--

DROP TABLE IF EXISTS `tbl_test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_test` (
  `test_id` int NOT NULL AUTO_INCREMENT,
  `test_name` varchar(45) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int DEFAULT NULL,
  `test_photo` varchar(255) NOT NULL,
  `test_description` varchar(100) NOT NULL,
  `test_status` varchar(45) NOT NULL DEFAULT '1',
  `test_fees` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`test_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_test`
--

LOCK TABLES `tbl_test` WRITE;
/*!40000 ALTER TABLE `tbl_test` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_test` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_treatment_points`
--

DROP TABLE IF EXISTS `tbl_treatment_points`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_treatment_points` (
  `id` int NOT NULL AUTO_INCREMENT,
  `admit_id` int NOT NULL,
  `point_text` text NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_treatment_points`
--

LOCK TABLES `tbl_treatment_points` WRITE;
/*!40000 ALTER TABLE `tbl_treatment_points` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_treatment_points` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_user_details`
--

DROP TABLE IF EXISTS `tbl_user_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_user_details` (
  `details_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `gender` varchar(45) NOT NULL,
  `mobile` bigint NOT NULL,
  `age` int DEFAULT NULL,
  `id_proof_type` varchar(45) NOT NULL,
  `id_proof` varchar(256) NOT NULL,
  `medical_license_number` varchar(100) DEFAULT NULL,
  `address` varchar(256) DEFAULT NULL,
  `city` varchar(56) DEFAULT NULL,
  `postal_code` int DEFAULT NULL,
  `license_validity` bigint DEFAULT NULL,
  `joining_date` bigint DEFAULT NULL,
  `nursing_license` varchar(255) DEFAULT NULL,
  `arae_of_experties` varchar(255) DEFAULT NULL,
  `blood_group` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_by` int DEFAULT NULL,
  `consultancy_fee` int DEFAULT NULL,
  `shift_id` int DEFAULT NULL,
  PRIMARY KEY (`details_id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_user_details`
--

LOCK TABLES `tbl_user_details` WRITE;
/*!40000 ALTER TABLE `tbl_user_details` DISABLE KEYS */;
INSERT INTO `tbl_user_details` VALUES (1,1,'Male',9921228387,27,'aadhar','uploads\\1741323096050.jpg',NULL,'ws','Pune',NULL,NULL,1741478400,NULL,NULL,7,'2025-03-07 04:51:36',13,'2025-05-15 11:10:07',NULL,NULL,NULL);
/*!40000 ALTER TABLE `tbl_user_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_users`
--

DROP TABLE IF EXISTS `tbl_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) NOT NULL,
  `user_email` varchar(56) NOT NULL,
  `user_password` varchar(256) NOT NULL,
  `user_role_id` int NOT NULL,
  `user_department_id` int DEFAULT NULL,
  `user_photo` varchar(256) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_by` int DEFAULT NULL,
  `user_username` varchar(45) NOT NULL,
  `user_status` int DEFAULT '1',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_email` (`user_email`),
  UNIQUE KEY `username_UNIQUE` (`user_username`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_users`
--

LOCK TABLES `tbl_users` WRITE;
/*!40000 ALTER TABLE `tbl_users` DISABLE KEYS */;
INSERT INTO `tbl_users` VALUES (13,'Hospital','hospital@gmail.com','Admin@123',1,1,NULL,'2025-02-28 06:02:28',1,'2025-05-10 12:16:24',NULL,'Admin@123',1);
/*!40000 ALTER TABLE `tbl_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'hms_backend3'
--

--
-- Dumping routines for database 'hms_backend3'
--
/*!50003 DROP PROCEDURE IF EXISTS `AddAccountant` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AddAccountant`(
    -- User Education Details
    IN p_degree VARCHAR(100),
    IN p_year_of_graduation YEAR,
    -- User Details
    IN p_name VARCHAR(100),
    IN p_phoneno VARCHAR(15),
    IN p_email_id VARCHAR(100),
    IN p_sex ENUM('Male', 'Female', 'Other'),
    IN p_age INT,
    IN p_address TEXT,
    IN p_city VARCHAR(100),
    IN p_id_proof VARCHAR(50),
    IN p_id_proof_image VARCHAR(255),
    IN p_photo VARCHAR(255),
    IN p_username VARCHAR(100),
    IN p_password VARCHAR(255),
    IN p_joining_date BIGINT,
    IN p_created_by INT,
    IN p_shift_id INT,
    IN p_blood_group INT
)
BEGIN
    DECLARE v_accountant_id INT;
    -- Declare a handler to rollback in case of an error
    -- DECLARE EXIT HANDLER FOR SQLEXCEPTION 
    -- BEGIN
     --   ROLLBACK;
      --  SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Transaction failed due to an error';
   -- END;
 
    -- Start Transaction
   -- START TRANSACTION;
    -- Check for duplicate username
    IF EXISTS (SELECT 1 FROM tbl_users WHERE user_username = p_username) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error: Username already exists';
    END IF;
    -- Check for duplicate email
    IF EXISTS (SELECT 1 FROM tbl_users WHERE user_email = p_email_id) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error: Email already exists';
    END IF;
 
    -- Check for duplicate phone number
    IF EXISTS (SELECT 1 FROM tbl_user_details WHERE mobile = p_phoneno) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error: Phone number already exists';
    END IF;
 
    -- Insert into tbl_users
    INSERT INTO tbl_users (
        user_name,
        user_email, 
        user_photo, 
        user_password, 
        user_role_id,
        user_username,
        created_by
    ) VALUES (
        p_name,
        p_email_id, 
        p_photo,
        p_password,
        5,
        p_username, 
        p_created_by
    );
 
    -- Get the last inserted user ID
    SET v_accountant_id = LAST_INSERT_ID();
    -- Insert into tbl_user_details
    INSERT INTO tbl_user_details (
        user_id,
        gender, 
        mobile, 
        age, 
        id_proof_type,
        id_proof,
        joining_date,
        city,
        address,
        shift_id,
        created_by,
        blood_group
    ) VALUES (
        v_accountant_id,
        p_sex, 
        p_phoneno,
        p_age,
        p_id_proof,
        p_id_proof_image,
        p_joining_date,
        p_city,
        p_address,
        p_shift_id,
        p_created_by,
        p_blood_group
    );
 
    -- Insert into tbl_education
    INSERT INTO tbl_education (
        user_id,
        degree,
        graduation_year,
        blood_group
    ) VALUES (
        v_accountant_id,
        p_degree,
        p_year_of_graduation,
        p_blood_group
    );
 
    -- Commit Transaction
   -- COMMIT;
 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AddAdmitPatient` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AddAdmitPatient`(
    IN p_uh_id VARCHAR(255),
    IN p_appointment_id INT,
    IN p_department_id INT,
    IN p_occupation VARCHAR(255),
    IN p_doctor_id INT,
    IN p_admit_date BIGINT,
    IN p_admit_time BIGINT,
    IN p_discharge_date BIGINT,
    IN p_discharge_time BIGINT,
    IN p_bed_id INT,
    IN p_mlc_no VARCHAR(255),
    IN p_mediclaim INT,
    IN p_reference_doctor VARCHAR(255),
    IN p_tpa VARCHAR(45),
    IN p_name VARCHAR(255),
    IN p_age INT,
    IN p_gender VARCHAR(45),
    IN p_mobile BIGINT,
    IN p_relation VARCHAR(60),
    IN p_address VARCHAR(255),
    IN p_created_by INT,
    IN p_mrd_no VARCHAR(60)
)
BEGIN
    DECLARE new_patient_id INT;
    DECLARE generated_id VARCHAR(255);
    -- Start transaction
    START TRANSACTION;
    
    -- Check if patient is already admitted
    IF EXISTS (SELECT 1 FROM tbl_admitted_patient WHERE uh_id = p_uh_id and status=1 ) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Patient already admitted';
    END IF;
    
    -- Insert patient record
    INSERT INTO tbl_admitted_patient (
        uh_id, 
        appointment_id,
        department_id,
        doctor_id,
        occupation,
        admitted_date,
        admit_time,
        approx_discharge_date,
        discharge_date,
        bed_id,
        status,
        mlc_no,
        mediclaim,
        reference_doctor,
        tpa,
        created_by,
        created_at,
        mrd_no
    ) 
    VALUES (
        p_uh_id, 
        p_appointment_id,
        p_department_id,
        p_doctor_id,
        p_occupation,
        p_admit_date,
        p_admit_time,
        p_discharge_date,
        NULL,
        p_bed_id,
        1,
        p_mlc_no,
        p_mediclaim,
        p_reference_doctor,
        p_tpa,
        p_created_by,
        NOW(),
        p_mrd_no
    );
    
    -- Get the last inserted patient ID
    SET new_patient_id = LAST_INSERT_ID();
    
    -- Generate the IPD ID (Format: {ID}{DDMMYYYY})
    SET generated_id = CONCAT(new_patient_id, DATE_FORMAT(NOW(), '%d%m%Y'));
    
    -- Update the record with the generated IPD ID
    UPDATE tbl_admitted_patient 
    SET ipd_id = generated_id 
    WHERE admitted_patient_id = new_patient_id;
    
    -- Update bed status to "occupied"
    UPDATE tbl_bed
    SET bed_status = 'occupied'
    WHERE bed_id = p_bed_id;
    
    -- Insert bed booking record
    INSERT INTO tbl_bed_booking (
        admitted_patient_id,
        ipd_id,
        bed_id, 
        start_date,
        created_by, 
        created_at
    ) 
    VALUES (
        new_patient_id,
        generated_id,
        p_bed_id, 
        p_admit_date,
        p_created_by, 
        NOW()
    );
    
    -- Add relatives details
    CALL AddPatientRelative(
        p_name,
        p_age,
        p_gender,
        p_mobile,
        p_relation,
        p_address,
        new_patient_id,
        generated_id,
        p_created_by 
    );
    
    -- Commit transaction
    COMMIT;
    
    -- Success message with the generated IPD ID
    SELECT 'Patient admitted successfully' AS message, generated_id AS ipd_id, new_patient_id AS admit_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AddAppointment` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AddAppointment`(
    IN p_patient_id INT,
    IN p_reason TEXT,
    IN p_patient_source VARCHAR(255),
    IN p_visited_type ENUM('New', 'Follow-up'),
    IN p_appo_time VARCHAR(50),
    IN p_date bigint,
    IN p_doctor_id INT,
    IN p_appo_department_id INT,
    IN p_created_by INT,
    IN p_appo_disease VARCHAR(255) 
)
BEGIN
    -- Declare an exit handler to rollback on error
    DECLARE EXIT HANDLER FOR SQLEXCEPTION 
    BEGIN
        ROLLBACK;
        SELECT 'Error: Could not insert appointment' AS message;
    END;
    
    START TRANSACTION;

    -- Insert the appointment record
    INSERT INTO tbl_appointment (
        appo_patient_id,
        appo_reason,
        appo_patient_source,
        appo_visited_type,
        appo_time,
        appo_date,
        appo_doctor_id,
        appo_department_id,
        created_by,
        appo_status,
        appo_disease
    ) 
    VALUES (
        p_patient_id,
        p_reason,
        p_patient_source,
        p_visited_type,
        p_appo_time,
        p_date,
        p_doctor_id,
        p_appo_department_id,
        p_created_by,
        'Scheduled',
        p_appo_disease
    );

    -- Call the nested stored procedure using the provided shift slot id
   -- CALL UpdateDoctorAvaiblity(p_shift_slot_id);

    COMMIT;

    SELECT 'Appointment added successfully' AS message;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AddBed` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AddBed`(
    IN p_bed_name VARCHAR(255),
    IN p_room_id INT,
    IN p_created_by INT
)
BEGIN
    -- Check if bed_name already exists
    IF EXISTS (SELECT 1 FROM tbl_bed WHERE bed_name = p_bed_name) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: Bed name already exists!';
    ELSE
        -- Insert the new bed if the name is unique
        INSERT INTO tbl_bed (bed_name, room_id, bed_status, created_by)
        VALUES (p_bed_name, p_room_id, "available", p_created_by);
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AddBillingAndCharges` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AddBillingAndCharges`(
    IN p_class_name INT,
    IN p_bed FLOAT,
    IN p_nursing FLOAT,
    IN p_doctor FLOAT,
    IN p_rmo FLOAT,
    IN p_bmw FLOAT,
    IN p_total FLOAT,
    IN p_deposit FLOAT,
    IN p_created_by INT
)
BEGIN
    DECLARE class_count INT;

    -- Start transaction for atomicity
    START TRANSACTION;

    -- Check if class_name already exists
    SELECT COUNT(*) INTO class_count
    FROM tbl_billing_and_charges
    WHERE class_name = p_class_name;

    IF class_count > 0 THEN
        -- Class name already exists, signal an error
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Room type already exists.';
    ELSE
        -- Insert the new record
        INSERT INTO tbl_billing_and_charges (
            class_name, bed, nursing, doctor, rmo, bmw, total, deposit, created_by
        ) VALUES (
            p_class_name, p_bed, p_nursing, p_doctor, p_rmo, p_bmw, p_total, p_deposit, p_created_by
        );
    END IF;

    -- Commit the transaction
    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AddDepartment` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AddDepartment`(
    IN p_dep_name VARCHAR(255),
    IN p_created_by INT
)
BEGIN
    DECLARE duplicate_department INT;

    -- Check if the department name already exists
    SELECT COUNT(*) INTO duplicate_department 
    FROM tbl_department 
    WHERE department_name = p_dep_name;

    IF duplicate_department > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: Department name already exists';
    END IF;

    -- Start Transaction
    START TRANSACTION;

    -- Insert into tbl_department
    INSERT INTO tbl_department (department_name, created_by) 
    VALUES (p_dep_name, p_created_by);

    -- Commit Transaction
    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AddDoctor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AddDoctor`(
    -- User Education Details
    IN p_degree VARCHAR(100),
    IN p_specialization VARCHAR(100),
    IN p_year_of_graduation YEAR,
    IN p_additional_certificate TEXT,
    IN p_board_certificate VARCHAR(255),
    IN p_issue_body VARCHAR(255),
    IN p_medical_license_number VARCHAR(100),
    IN p_license_expiry_date bigint,
    IN p_post_degree VARCHAR(255),
    IN p_post_specialization VARCHAR(255),
    IN p_post_year_of_graduation YEAR, 
    -- User Details
    IN p_name VARCHAR(100),
    IN p_phoneno VARCHAR(15),
    IN p_email_id VARCHAR(100),
    IN p_sex ENUM('Male', 'Female', 'Other'),
    IN p_age INT,
    IN p_address TEXT,
    IN p_city VARCHAR(100),
    IN p_id_proof VARCHAR(50),
    IN p_id_proof_image VARCHAR(255),
    IN p_photo VARCHAR(255),
    IN p_department_id INT,
    IN p_role_id INT,
    IN p_username VARCHAR(100),
    IN p_password VARCHAR(255),
    IN p_joining_date bigint,
    IN p_created_by INT,
    IN p_consultancy_fee INT,   
    IN p_shift_id INT,
	IN p_day_ids VARCHAR(50)


)
BEGIN
    DECLARE v_doctor_id INT;
    DECLARE duplicate_error CONDITION FOR SQLSTATE '23000';
    
    -- Check for duplicate username
    IF (SELECT COUNT(*) FROM tbl_users WHERE user_username = p_username) > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error: Username already exists';
    END IF;
    
    -- Check for duplicate email
    IF (SELECT COUNT(*) FROM tbl_users WHERE user_email = p_email_id) > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error: Email already exists';
    END IF;

    -- Check for duplicate phone number
    IF (SELECT COUNT(*) FROM tbl_user_details WHERE mobile = p_phoneno) > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error: Phone number already exists';
    END IF;

    -- Start Transaction
    START TRANSACTION;
    
    -- Insert into tbl_users
    INSERT INTO tbl_users (
        user_name,
        user_email, 
        user_photo, 
        user_password, 
        user_department_id,
        user_role_id,
        user_username,
        created_by
    ) VALUES (
        p_name,
        p_email_id, 
        p_photo,
        p_password,
        p_department_id,
        p_role_id,
        p_username, 
        p_created_by
    );

    -- Get the last inserted user ID
    SET v_doctor_id = LAST_INSERT_ID();
    
    -- Insert into tbl_user_details
    INSERT INTO tbl_user_details (
        user_id,
        gender, 
        mobile, 
        age, 
        id_proof_type,
        id_proof,
        medical_license_number,
        joining_date,
        license_validity,
        city,
        address,
        created_by,
        consultancy_fee
    ) VALUES (
        v_doctor_id,
        p_sex, 
        p_phoneno,
        p_age,
        p_id_proof,
        p_id_proof_image,
        p_medical_license_number, 
        p_joining_date,
        p_license_expiry_date,
        p_city,
        p_address,
        p_created_by,
        p_consultancy_fee
    );

    -- Insert into tbl_education
    INSERT INTO tbl_education (
        user_id,
        degree,
        specialization,
        graduation_year, 
        post_degree,
        post_specialization,
        post_graduation_year,
        issuing_body,    
        board_certification,
        additional_certifications
    ) VALUES (
        v_doctor_id,
        p_degree,
        p_specialization,
        p_year_of_graduation, 
        p_post_degree,
        p_post_specialization,
        p_post_year_of_graduation, 
        p_issue_body,
        p_board_certificate,
        p_additional_certificate
    );

    CALL InsertDoctorAvailability(v_doctor_id, p_shift_id, p_day_ids);

    -- Commit Transaction
    COMMIT;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AddDoctorBill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AddDoctorBill`(
    IN p_bill_appointment_id INT,
    IN p_user_id INT,
    IN p_bill_total_amount DECIMAL(10,2),
    IN p_chargesList JSON
)
BEGIN
    DECLARE appointment_exists INT DEFAULT 0;
    DECLARE generated_bill_id INT;
    DECLARE receipt_number VARCHAR(20);
    DECLARE idx INT DEFAULT 0;
    DECLARE total_charges INT;

    -- Check if the appointment exists before starting the transaction
    SELECT COUNT(*) INTO appointment_exists 
    FROM tbl_appointment 
    WHERE appo_id = p_bill_appointment_id 
    LIMIT 1;

    -- If the appointment does not exist, exit immediately
    IF appointment_exists = 0 THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Appointment ID does not exist';
    END IF;

    -- Start the transaction
    START TRANSACTION;

    -- Insert the bill record without receipt_number first
    INSERT INTO tbl_opd_bills (bill_appointment_id, bill_total_amount, created_by, created_at)
    VALUES (p_bill_appointment_id, p_bill_total_amount, p_user_id, NOW());

    -- Retrieve the generated bill ID
    SET generated_bill_id = LAST_INSERT_ID();

    -- Generate the unique receipt number (RC + bill_id + YYYYMMDD)
    SET receipt_number = CONCAT('RC', generated_bill_id, DATE_FORMAT(NOW(), '%d%m%Y'));

    -- Update the bill record with the generated receipt_number
    UPDATE tbl_opd_bills 
    SET receipt_number = receipt_number 
    WHERE bill_id = generated_bill_id;

    -- Get the total number of charge entries
    SET total_charges = JSON_LENGTH(p_chargesList);

    -- Loop through each charge in chargesList and insert into tbl_opd_bill_fees
    WHILE idx < total_charges DO
        INSERT INTO tbl_opd_bill_fees (opd_bill_id, fees_id, quantity, total_fee)
        VALUES (
            p_bill_appointment_id,
            JSON_UNQUOTE(JSON_EXTRACT(p_chargesList, CONCAT('$[', idx, '].chargeId'))),
            JSON_UNQUOTE(JSON_EXTRACT(p_chargesList, CONCAT('$[', idx, '].quantity'))),
            JSON_UNQUOTE(JSON_EXTRACT(p_chargesList, CONCAT('$[', idx, '].total')))
        );
        
        -- Increment the index
        SET idx = idx + 1;
    END WHILE;

    -- Update the appointment status to "Completed"
    UPDATE tbl_appointment
    SET appo_status = 'Completed'
    WHERE appo_id = p_bill_appointment_id;

    -- Commit the transaction
    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AddFees` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AddFees`(
    IN p_fees_name VARCHAR(255),
    IN p_fees_amount DECIMAL(10,2),
    IN p_created_by INT
)
BEGIN
    DECLARE fee_exists INT;
 
    -- Check if the fees_name already exists
    SELECT COUNT(*) INTO fee_exists FROM tbl_fees WHERE fees_name = p_fees_name AND fees_status = 1;
 
    IF fee_exists = 0 THEN
        -- Insert new fee if not exists
        INSERT INTO tbl_fees (fees_name, fees_amount, created_by, updated_by)
        VALUES (p_fees_name, p_fees_amount, p_created_by, p_created_by);
    ELSE
        -- Raise an error or handle duplicate case
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Fees name already exists';
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AddIPDDeposite` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AddIPDDeposite`(
    IN p_admited_id INT,
    IN p_date bigint,
    IN p_amount DECIMAL(10,2),
    In p_mode varchar(50)
)
BEGIN
    -- Check if the admited_id exists
    IF NOT EXISTS (SELECT 1 FROM `tbl_admitted_patient` WHERE admitted_patient_id = p_admited_id) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Invalid admited_id: Record not found in tbl_admited';
    END IF;

    -- Insert the record
    INSERT INTO tbl_ipd_deposite (admited_id, date, amount,payment_mode)
    VALUES (p_admited_id, p_date, p_amount,p_mode);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AddIPDDoctorVisit` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AddIPDDoctorVisit`(
    IN p_ipd_doctor_id INT,
    IN p_ipd_doctor_date bigint,
    IN p_admitted_id INT,
	IN p_created_by INT
)
BEGIN
    INSERT INTO tbl_ipd_doctor_visits (
        ipd_doctor_id,
        ipd_doctor_date,
        admited_id,
        created_by
    )
    VALUES (
        p_ipd_doctor_id,
        p_ipd_doctor_date,
        p_admitted_id,
        p_created_by
    );

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AddIpdLabTest` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AddIpdLabTest`(
    IN p_lab_adm_id INT,       
    IN p_lab_ipd_test_id INT,        
    IN p_recommendation_date bigint,  
    IN p_lab_test_reason TEXT

)
BEGIN
    DECLARE epoch_recommendation BIGINT;



    INSERT INTO `tbl_ipd_lab` (
        admited_id, test_id, recommendation_date, reason, status) VALUES (
        p_lab_adm_id, p_lab_ipd_test_id, p_recommendation_date, p_lab_test_reason, "Pending"
    );

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AddIpdPatientCharges` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AddIpdPatientCharges`(
    IN p_admited_id INT,
    IN p_chrge_id int,
    IN p_date Bigint,
    In p_created_by int
)
BEGIN

        INSERT INTO tbl_ipd_charges (charge_id, date, admited_id, created_by)
        VALUES (p_chrge_id, p_date, p_admited_id, p_created_by);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AddIPDPrescription` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AddIPDPrescription`(
    IN p_ipd_id VARCHAR(45),
    IN p_medicine_name VARCHAR(255),
    IN p_medicine_type VARCHAR(255),
    IN p_dosage VARCHAR(255),
    IN p_days INT,
    IN p_frequency INT,
    IN p_common_note TEXT,
    IN p_medicine_quantity INT,
    IN p_created_by INT
)
BEGIN
    DECLARE v_medicine_exists INT DEFAULT 0;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        -- Rollback transaction on error
        ROLLBACK;
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'An error occurred while adding the IPD prescription.';
    END;

    -- Start transaction
    START TRANSACTION;

    -- Check if medicine_name exists in tbl_medicine (case-insensitive)
    SELECT COUNT(*) INTO v_medicine_exists
    FROM tbl_medicine
    WHERE LOWER(medicine_name) = LOWER(p_medicine_name);

    -- If medicine_name does not exist, insert it into tbl_medicine
    IF v_medicine_exists = 0 THEN
        INSERT INTO tbl_medicine (medicine_name)
        VALUES (p_medicine_name);
    END IF;

    -- Insert into tbl_ipd_prescription
    INSERT INTO tbl_ipd_prescription (
        ipd_id, medicine_name, medicine_type, dosage, days, 
        frequency, common_note, medicine_quantity, created_by, created_at
    ) VALUES (
        p_ipd_id, p_medicine_name, p_medicine_type, p_dosage, p_days, 
        p_frequency, p_common_note, p_medicine_quantity, p_created_by, NOW()
    );

    -- Commit transaction
    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AddIpdReport` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AddIpdReport`(
    IN p_report_adm_id INT,
    IN p_report_test_id INT,
    IN p_report_photo VARCHAR(255)
)
BEGIN
    DECLARE adm_exists INT;
    DECLARE error_occurred INT DEFAULT 0;
    -- Start Transaction
    START TRANSACTION;
    -- Check if the admission ID exists
    SELECT COUNT(*) INTO adm_exists FROM `tbl_admitted_patient` WHERE admitted_patient_id = p_report_adm_id;
    
    -- If the admission ID exists, proceed
    IF adm_exists > 0 THEN
        -- Insert the record into tbl_ipd_report
        INSERT INTO tbl_ipd_report (rep_adm_id, rep_labtest_id, rep_ipd_photo)
        VALUES (p_report_adm_id, p_report_test_id, p_report_photo);
        
        -- Update ipd_lab_status to "Completed"
        UPDATE tbl_ipd_lab SET status = "Completed" WHERE ipd_lab_id = p_report_test_id;
        
    ELSE
        SET error_occurred = 1;
    END IF;

    -- Check for errors
    IF error_occurred = 1 THEN
        ROLLBACK; -- Undo all changes if an error occurred
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid adm_id';
    ELSE
        COMMIT; -- Finalize the transaction if everything is successful
    END IF;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AddLabAssistant` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AddLabAssistant`(
    -- User Education Details
    IN p_highest_qualification VARCHAR(100),
    IN p_specialization VARCHAR(100),
    IN p_year_of_graduation YEAR,
    IN p_computer_skills VARCHAR(255),
    IN p_language_known VARCHAR(255),
    IN p_institute_name VARCHAR(255),
    -- User Details
    IN p_nursing_license INT,
    IN p_name VARCHAR(100),
    IN p_phoneno VARCHAR(15),
    IN p_email_id VARCHAR(100),
    IN p_sex ENUM('Male', 'Female', 'Other'),
    IN p_age INT,
    IN p_address TEXT,
    IN p_city VARCHAR(100),
    IN p_id_proof VARCHAR(50),
    IN p_id_proof_image VARCHAR(255),
    IN p_photo VARCHAR(255),
    IN p_department_id INT,
    IN p_role_id INT,
    IN p_username VARCHAR(100),
    IN p_password VARCHAR(255),
    IN p_joining_date bigint,
    IN p_license_expiry_date bigint,
    IN p_created_by INT
)
BEGIN
    DECLARE v_user_id INT;
  DECLARE EXIT HANDLER FOR SQLEXCEPTION 
    BEGIN
        ROLLBACK;
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Transaction Failed';
   END;

    -- Start Transaction
    START TRANSACTION;
    
    -- Check for duplicate username
    IF (SELECT COUNT(*) FROM tbl_users WHERE user_username = p_username) > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error: Username already exists';
    END IF;
    
    -- Check for duplicate email
    IF (SELECT COUNT(*) FROM tbl_users WHERE user_email = p_email_id) > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error: Email already exists';
    END IF;

    -- Check for duplicate phone number
    IF (SELECT COUNT(*) FROM tbl_user_details WHERE mobile = p_phoneno) > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error: Phone number already exists';
    END IF;
    
    -- Insert into tbl_users
    INSERT INTO tbl_users (
        user_name,
        user_email, 
        user_photo, 
        user_password, 
        user_department_id,
        user_role_id,
        user_username,
        created_by
    ) VALUES (
        p_name,
        p_email_id, 
        p_photo,
        p_password,
        p_department_id,
        p_role_id,
        p_username, 
        p_created_by
    );

    -- Get the last inserted user ID
    SET v_user_id = LAST_INSERT_ID();
    
    -- Insert into tbl_user_details
    INSERT INTO tbl_user_details (
        user_id,
        gender, 
        mobile, 
        age, 
        id_proof_type,
        id_proof,
        nursing_license,
        joining_date,
        license_validity,
        city,
        address,
        created_by
    ) VALUES (
        v_user_id,
        p_sex, 
        p_phoneno,
        p_age,
        p_id_proof,
        p_id_proof_image,
        p_nursing_license, 
        p_joining_date,
        p_license_expiry_date,
        p_city,
        p_address,
        p_created_by
    );

    -- Insert into tbl_education
    INSERT INTO tbl_education (
        user_id,
        highest_qualification,
        field_of_study,
        graduation_year, 
        computer_skills,
        language_known,
        institute_name
    ) VALUES (
        v_user_id,
        p_highest_qualification,
        p_specialization,
        p_year_of_graduation, 
        p_computer_skills,
        p_language_known,
        p_institute_name
    );

    -- Commit Transaction
    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AddLabAssistant1` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AddLabAssistant1`(
    IN p_name VARCHAR(100),
    IN p_email_id VARCHAR(100),
    IN p_photo VARCHAR(255),
    IN p_password VARCHAR(255),
    IN p_department_id INT,
    IN p_username VARCHAR(100),
    IN p_created_by INT,
    -- User Education Details
    IN p_highest_qualification VARCHAR(100),
    IN p_specialization VARCHAR(100),
    IN p_year_of_graduation YEAR,
    IN p_registration_number VARCHAR(45),
    IN p_issuing_authority VARCHAR(100),
    IN p_institute_name VARCHAR(255),
    IN p_license_expiry_date BIGINT,
    IN p_joining_date BIGINT,
    -- User Details
    IN p_phoneno VARCHAR(15),
    IN p_sex ENUM('Male', 'Female', 'Other'),
    IN p_age INT,
    IN p_address TEXT,
    IN p_city VARCHAR(100),
    IN p_id_proof VARCHAR(50),
    IN p_id_proof_image VARCHAR(255),
    -- Work Details
    IN p_shift_id INT,
    IN p_day_ids JSON,
    IN p_blood_group INT
)
BEGIN
    DECLARE v_user_id INT;
    DECLARE v_day_id INT;
    DECLARE v_index INT DEFAULT 0;
    DECLARE v_day_count INT;
    

    START TRANSACTION;
    
    -- Check if username, email, or phone number already exists
    IF (SELECT COUNT(*) FROM tbl_users WHERE user_username = p_username) > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error: Username already exists';
    END IF;

    IF (SELECT COUNT(*) FROM tbl_users WHERE user_email = p_email_id) > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error: Email already exists';
    END IF;

    IF (SELECT COUNT(*) FROM tbl_user_details WHERE mobile = p_phoneno) > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error: Phone number already exists';
    END IF;

    -- Insert into tbl_users
    INSERT INTO tbl_users (
        user_name, user_email, user_photo, user_password, user_department_id,
        user_role_id, user_username, created_by
    ) VALUES (
        p_name, p_email_id, p_photo, p_password, p_department_id, 
        3, p_username, p_created_by
    );

    -- Get the last inserted user_id
    SET v_user_id = LAST_INSERT_ID();

    -- Insert into tbl_user_details
    INSERT INTO tbl_user_details (
        user_id, gender, mobile, age, id_proof_type, id_proof, joining_date,
        city, address, created_by, license_validity, blood_group
    ) VALUES (
        v_user_id, p_sex, p_phoneno, p_age, p_id_proof,
        p_id_proof_image, p_joining_date, p_city, p_address, p_created_by, p_license_expiry_date, p_blood_group
    );

    -- Insert into tbl_education
    INSERT INTO tbl_education (
        user_id, degree, specialization, graduation_year, 
        issuing_authirity, institute_name, registation_number
    ) VALUES (
        v_user_id, p_highest_qualification, p_specialization, 
        p_year_of_graduation, p_issuing_authority, p_institute_name, p_registration_number
    );

    -- Process JSON array p_day_ids
    SET v_day_count = JSON_LENGTH(p_day_ids);
    WHILE v_index < v_day_count DO
        -- Extract day_id from JSON array
        SET v_day_id = CAST(JSON_UNQUOTE(JSON_EXTRACT(p_day_ids, CONCAT('$[', v_index, ']'))) AS UNSIGNED);

        -- Call AddLabAssistantDay to insert work days
        CALL AddLabAssistantDay(v_user_id, v_day_id, p_shift_id);

        -- Increment index
        SET v_index = v_index + 1;
    END WHILE;

    -- Commit Transaction
    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AddLabAssistantDay` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AddLabAssistantDay`(
    IN p_user_id INT,
    IN p_day_id INT,
    IN p_shift_id INT
)
BEGIN
    -- Insert into tbl_rec_lab_avaibility
    INSERT INTO tbl_rec_lab_avaibility (rec_lab_ava_user_id, rec_lab_ava_day_id, rec_lab_ava_slot_shift_id)
    VALUES (p_user_id, p_day_id, p_shift_id);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AddLabTest` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AddLabTest`(
    IN p_lab_appoi_id INT,       
    IN p_lab_test_id INT,        
    IN p_lab_date_of_recommendation DATE,  
    IN p_lab_test_reason TEXT
 
)
BEGIN
    DECLARE epoch_recommendation BIGINT;



    -- Convert date to epoch (Unix timestamp)
    SET epoch_recommendation = UNIX_TIMESTAMP(p_lab_date_of_recommendation);

    -- Insert the new lab test record with epoch timestamp
    INSERT INTO tbl_labTest (
        lab_appoi_id, lab_test_id, lab_date_of_recommendation, lab_test_reason, lab_test_status
    ) VALUES (
        p_lab_appoi_id, p_lab_test_id, epoch_recommendation, p_lab_test_reason, "Pending"
    );

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AddPatient` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AddPatient`(
    IN p_patient_name VARCHAR(255),
    IN p_patient_phone_no VARCHAR(15),
    IN p_patient_age INT,
    IN p_patient_sex ENUM('Male', 'Female', 'Other'),
    IN p_patient_address TEXT,
    IN p_patient_id_proof VARCHAR(255),
    IN p_patient_proof_image VARCHAR(255),
    IN p_patient_photo VARCHAR(255),
    IN p_created_by INT,
    IN p_patient_city VARCHAR(255),
    In p_patient_blgr_id INT
)
BEGIN
    DECLARE phone_exists INT DEFAULT 0;
    DECLARE new_patient_id INT;
    DECLARE generated_uh_id VARCHAR(255);
    -- Start transaction
    START TRANSACTION;
    -- Check if the phone number already exists
    SELECT COUNT(*) INTO phone_exists 
    FROM tbl_patient 
    WHERE patient_phone_no = p_patient_phone_no;
    -- If phone number exists, rollback and return an error message
    IF phone_exists > 0 THEN
        ROLLBACK;
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Error: Phone number already exists';
    END IF;
    -- Insert patient record without uh_id
    INSERT INTO tbl_patient (
        patient_type_id, 
        patient_name,
        patient_phone_no, 
        patient_age, 
        patient_sex,
        patient_address,
        patient_id_proof, 
        patient_proof_image, 
        created_by,
        patient_image,
        patient_city,
        patient_blgr_id
    ) 
    VALUES (
        1, 
        p_patient_name,
        p_patient_phone_no,
        p_patient_age, 
        p_patient_sex,
        p_patient_address,
        p_patient_id_proof,
        p_patient_proof_image, 
        p_created_by,
        p_patient_photo,
        p_patient_city,
        p_patient_blgr_id
    );
    -- Get the last inserted patient ID
    SET new_patient_id = LAST_INSERT_ID();
    -- Generate the UH ID (Format: AH{ID}{YYMMDD})
    SET generated_uh_id = CONCAT('AH', new_patient_id, DATE_FORMAT(NOW(), '%d%m%Y'));
    -- Update the record with the generated uh_id
    UPDATE tbl_patient 
    SET uh_id = generated_uh_id 
    WHERE patient_id = new_patient_id;
    -- Commit transaction
    COMMIT;
    -- Success message with the generated UH ID
    SELECT 'Patient added successfully', generated_uh_id AS uh_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AddPatientRelative` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AddPatientRelative`(
    IN p_name VARCHAR(255),
    IN p_age INT,
	IN p_gender VARCHAR(45),
    IN p_mobile BIGINT,
    IN p_relation VARCHAR(60),
    IN p_address VARCHAR(255),
    IN p_admitted_id INT,
    IN p_ipd_id VARCHAR(45),
    IN p_created_by INT
)
BEGIN
    -- Start transaction
    START TRANSACTION;
    -- Insert patient record without uh_id
    INSERT INTO tbl_patient_relatives (
        name, 
        age,
        gender, 
        mobile, 
        relation,
        address,
        admitted_id,
        ipd_id,
        created_by,
        created_at
    ) 
    VALUES (
        p_name, 
        p_age,
        p_gender,
        p_mobile, 
        p_relation,
        p_address,
        p_admitted_id,
        p_ipd_id,
        p_created_by,
        NOW()
    );
    -- Commit transaction
    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AddPrescription` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AddPrescription`(
    IN p_appointment_id INT,
    IN p_medicine_name VARCHAR(255),
    IN p_medicine_type VARCHAR(255),
    IN p_dosage VARCHAR(255),
    IN p_days INT,
    IN p_frequency INT,
    IN p_common_note TEXT,
    IN p_medicine_quantity INT,
    IN p_created_by INT
)
BEGIN
    DECLARE v_medicine_exists INT DEFAULT 0;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        -- Rollback transaction on error
        ROLLBACK;
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'An error occurred while adding the prescription.';
    END;

    -- Start transaction
    START TRANSACTION;

    -- Check if medicine_name exists in tbl_medicine (case-insensitive)
    SELECT COUNT(*) INTO v_medicine_exists
    FROM tbl_medicine
    WHERE LOWER(medicine_name) = LOWER(p_medicine_name);

    -- If medicine_name does not exist, insert it into tbl_medicine
    IF v_medicine_exists = 0 THEN
        INSERT INTO tbl_medicine (medicine_name)
        VALUES (p_medicine_name);
    END IF;

    -- Insert into tbl_prescription
    INSERT INTO tbl_prescription (
        appointment_id, medicine_name, medicine_type, dosage, days, 
        frequency, common_note, medicine_quantity, created_by, created_at
    ) VALUES (
        p_appointment_id, p_medicine_name, p_medicine_type, p_dosage, p_days, 
        p_frequency, p_common_note, p_medicine_quantity, p_created_by, NOW()
    );

    -- Commit transaction
    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AddReceptionist` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AddReceptionist`(
    IN p_name VARCHAR(100),
    IN p_email_id VARCHAR(100),
    IN p_photo VARCHAR(255),
    IN p_password VARCHAR(255),
    IN p_department_id INT,
    IN p_username VARCHAR(100),
    IN p_created_by INT,
    -- User Education Details
    IN p_highest_qualification VARCHAR(100),
    IN p_specialization VARCHAR(100),
    IN p_year_of_graduation YEAR,
    IN p_registration_number VARCHAR(255),
	IN p_institute_name VARCHAR(255),
	IN p_skills VARCHAR(255),
    IN p_languages VARCHAR(255),
 
    IN p_issuing_authority VARCHAR(100),
    IN p_license_expiry_date DATE,
    IN p_joining_date BIGINT,
    -- User Details
    IN p_phoneno BIGINT,
    IN p_sex ENUM('Male', 'Female', 'Other'),
    IN p_age INT,
    IN p_address TEXT,
    IN p_city VARCHAR(100),
    IN p_id_proof VARCHAR(50),
    IN p_id_proof_image VARCHAR(255),
    -- Work Details
    IN p_shift_id INT,
    IN p_day_ids JSON  -- Expecting JSON array like '[1,2,3]'
)
BEGIN
    DECLARE v_user_id INT;
    DECLARE v_day_id INT;
    DECLARE v_index INT DEFAULT 0;
    DECLARE v_day_count INT;
 
    -- Start Transaction
    START TRANSACTION;
    -- Check if username, email, or phone number already exists
    IF (SELECT COUNT(*) FROM tbl_users WHERE user_username = p_username) > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error: Username already exists';
    END IF;
 
    IF (SELECT COUNT(*) FROM tbl_users WHERE user_email = p_email_id) > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error: Email already exists';
    END IF;
 
    IF (SELECT COUNT(*) FROM tbl_user_details WHERE mobile = p_phoneno) > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error: Phone number already exists';
    END IF;
 
    -- Insert into tbl_users
    INSERT INTO tbl_users (
        user_name, user_email, user_photo, user_password, user_department_id,
        user_role_id, user_username, created_by
    ) VALUES (
        p_name, p_email_id, p_photo, p_password, p_department_id, 
        4, p_username, p_created_by
    );
 
    -- Get the last inserted user_id
    SET v_user_id = LAST_INSERT_ID();
 
    -- Insert into tbl_user_details
    INSERT INTO tbl_user_details (
        user_id, gender, mobile, age, id_proof_type, id_proof, joining_date,
        city, address, created_by, license_validity
    ) VALUES (
        v_user_id, p_sex, p_phoneno, p_age, p_id_proof,
        p_id_proof_image, p_joining_date, p_city, p_address, p_created_by, p_license_expiry_date
    );
 
    -- Insert into tbl_education
    INSERT INTO tbl_education (
        user_id, degree, specialization, graduation_year, 
        issuing_authirity, institute_name, registation_number, language_known, computer_skills
    ) VALUES (
        v_user_id, p_highest_qualification, p_specialization, 
        p_year_of_graduation, p_issuing_authority, p_institute_name, p_registration_number, p_languages, p_skills
    );
 
    -- Process JSON array p_day_ids
    SET v_day_count = JSON_LENGTH(p_day_ids);
    WHILE v_index < v_day_count DO
        -- Extract day_id from JSON array
        SET v_day_id = CAST(JSON_UNQUOTE(JSON_EXTRACT(p_day_ids, CONCAT('$[', v_index, ']'))) AS UNSIGNED);
 
        -- Call AddLabAssistantDay to insert work days
        CALL AddLabAssistantDay(v_user_id, v_day_id, p_shift_id);
 
        -- Increment index
        SET v_index = v_index + 1;
    END WHILE;
 
    -- Commit Transaction
    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AddReport` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AddReport`(
    IN p_report_appo_id INT,
    IN p_report_test_id INT,
    IN p_report_photo VARCHAR(255)
)
BEGIN
    INSERT INTO tbl_report (report_appo_id, report_test_id, report_photo)
    VALUES (p_report_appo_id, p_report_test_id, p_report_photo);
    
    update tbl_labtest set lab_test_status="Completed" where lab_id=p_report_test_id;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AddRoom` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AddRoom`(
    IN p_room_type_id VARCHAR(50),
	IN p_room_name VARCHAR(50),
    IN p_max_bed INT
)
BEGIN
    DECLARE room_exists INT;
    -- Check if the room type already exists
    SELECT COUNT(*) INTO room_exists FROM tbl_room WHERE room_name = p_room_name And room_status=1;
    IF room_exists > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: Room type already exists!';
    ELSE
        -- Insert new room if it doesn't exist
        INSERT INTO tbl_room (room_type_id,room_name,max_bed) 
        VALUES (p_room_type_id,p_room_name, p_max_bed);
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AddTest` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AddTest`(
    IN p_test_name VARCHAR(255),
    IN p_test_description VARCHAR(255),
    IN p_test_image VARCHAR(255),
	IN p_test_fees Int,
    IN p_created_by INT
)
BEGIN
    DECLARE EXIT HANDLER FOR 1062 
    BEGIN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Error: Test name must be unique';
    END;
    
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK; -- Rollback the transaction in case of any error
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'An unexpected error occurred while adding the test';
    END;

    START TRANSACTION; -- Begin transaction
    
    INSERT INTO tbl_test (test_name, test_description, test_photo,test_fees, created_by) 
    VALUES (p_test_name, p_test_description, p_test_image,p_test_fees, p_created_by);
    
    COMMIT; -- Commit transaction if no errors
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ChangeBed` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ChangeBed`(
    IN p_admited_id INT,
    IN p_ipd_id bigint,
    IN p_bed_id INT,
    IN p_start_date BIGINT
)
BEGIN
    -- Declare variables
    DECLARE v_old_bed_id INT;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION 
    BEGIN
        ROLLBACK;
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'An error occurred while changing the bed';
    END;

    -- Start transaction
    START TRANSACTION;

    -- Get current bed ID
    SELECT bed_id INTO v_old_bed_id 
    FROM tbl_bed_booking 
    WHERE admitted_patient_id = p_admited_id 
    AND booking_status = 1
    LIMIT 1;

    -- End existing booking
    IF v_old_bed_id IS NOT NULL THEN
        UPDATE tbl_bed_booking 
        SET booking_status = 0,
            end_date = p_start_date 
        WHERE admitted_patient_id = p_admited_id 
        AND booking_status = 1;
    END IF;

    -- Create new bed booking
    INSERT INTO tbl_bed_booking 
        (admitted_patient_id, ipd_id, bed_id, start_date)
    VALUES 
        (p_admited_id, p_ipd_id, p_bed_id, p_start_date);

    -- Update admitted patient record
    UPDATE tbl_admitted_patient 
    SET bed_id = p_bed_id 
    WHERE admitted_patient_id = p_admited_id;

    -- Update old bed status to available (if it exists)
    IF v_old_bed_id IS NOT NULL THEN
        UPDATE tbl_bed 
        SET bed_status = 'available' 
        WHERE bed_id = v_old_bed_id;
    END IF;

    -- Update new bed status to occupied
    UPDATE tbl_bed 
    SET bed_status = 'occupied' 
    WHERE bed_id = p_bed_id;

    -- Commit the transaction
    COMMIT;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `DaywiseCollectionReport` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `DaywiseCollectionReport`(IN p_date BIGINT)
BEGIN
    DECLARE start_ts BIGINT;
    DECLARE end_ts BIGINT;

    -- Set start and end of the day
    SET start_ts = p_date;
    SET end_ts = p_date + 86399;  -- 86400 seconds in a day - 1

    SELECT
        d.*,
        p.patient_name,
        p.patient_image,
		p.uh_id
    FROM tbl_ipd_deposite d
    JOIN tbl_admitted_patient ap ON ap.admitted_patient_id = d.admited_id
    JOIN tbl_patient p ON ap.uh_id = p.uh_id
    WHERE d.date BETWEEN start_ts AND end_ts;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `DeleteBed` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteBed`(
    IN p_bed_id INT
)
BEGIN
    -- Check if the bed exists before updating
    IF EXISTS (SELECT 1 FROM tbl_bed WHERE bed_id = p_bed_id) THEN
        UPDATE tbl_bed 
        SET bed_soft_status = 0
        WHERE bed_id = p_bed_id;
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: Bed ID not found!';
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `DeleteDepartment` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteDepartment`(
    IN p_dep_id INT
)
BEGIN
    UPDATE tbl_department 
    SET department_status = 0 
    WHERE department_id = p_dep_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `DeletePatient` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `DeletePatient`(
    IN p_patient_id INT
)
BEGIN
    DECLARE patient_exists INT DEFAULT 0;

    -- Check if the patient exists
    SELECT COUNT(*) INTO patient_exists 
    FROM tbl_patient 
    WHERE patient_id = p_patient_id;

    IF patient_exists = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: Patient ID does not exist';
    END IF;

    -- Soft delete: update status instead of deleting the record
    UPDATE tbl_patient 
    SET patient_status = 0 
    WHERE patient_id = p_patient_id;

    -- Return success message
    SELECT 'Patient record marked as inactive' AS message;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `DeleteRoom` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteRoom`(
    IN p_room_id INT
)
BEGIN
    DECLARE room_exists INT;
    
    -- Start transaction
    START TRANSACTION;
    
    -- Check if the room exists
    SELECT COUNT(*) INTO room_exists FROM tbl_room WHERE room_id = p_room_id;
    
    IF room_exists > 0 THEN
        -- Update room status
        UPDATE tbl_room 
        SET room_status = 0
        WHERE room_id = p_room_id;
        
        -- Update beds associated with the room
        UPDATE tbl_bed 
        SET bed_soft_status = 0
        WHERE room_id = p_room_id AND bed_soft_status = 1;
        
        -- Commit transaction
        COMMIT;
    ELSE
        -- Rollback and throw error if room does not exist
        ROLLBACK;
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: Room ID not found!';
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `DeleteTest` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteTest`(
    IN p_test_id INT
)
BEGIN
    DECLARE v_test_exists INT;

    -- Check if the test exists
    SELECT COUNT(*) INTO v_test_exists FROM tbl_test WHERE test_id = p_test_id AND test_status = 1;

    IF v_test_exists = 0 THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Error: Test ID does not exist or is already deleted';
    ELSE
        -- Soft delete: Update status instead of deleting the record
        UPDATE tbl_test 
        SET test_status = 0
        WHERE test_id = p_test_id;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `DischargePatient` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `DischargePatient`(

    IN p_ipd_id VARCHAR(255),

    IN p_chief_complaints TEXT,

    IN p_diagnosis TEXT,

    IN p_signs VARCHAR(255),

    IN p_temprature VARCHAR(50),

    IN p_pulse VARCHAR(50),

    IN p_blood_pressure VARCHAR(50),

    IN p_respiratory_rate VARCHAR(50),

    IN p_cvs VARCHAR(255),

    IN p_rs VARCHAR(255),

    IN p_pa VARCHAR(255),

    IN p_cns VARCHAR(255),

    IN p_local_examination TEXT,

    IN p_past_history TEXT,

    IN p_discharge_advice TEXT,

    IN p_discharge_date_time BIGINT,

    IN p_follow_up_date_time BIGINT,

    IN p_created_by INT,
    
	IN p_icd_code INT


)
BEGIN

    -- Start transaction

    START TRANSACTION;

    -- Insert discharge details

    INSERT INTO tbl_discharge_detail (

        ipd_id, 

        chief_complaints,

        diagnosis,

        signs,

        temprature,

        pulse,

        blood_pressure,

        respiratory_rate,

        cvs,

        rs,

        pa,

        cns,

        local_examination,

        past_history,

        discharge_advice,

        discharge_date_time,

        follow_up_date_time,

        created_by,

        created_at,
        
        icd_code

    ) 

    VALUES (

        p_ipd_id, 

        p_chief_complaints,

        p_diagnosis,

        p_signs,

        p_temprature,

        p_pulse,

        p_blood_pressure,

        p_respiratory_rate,

        p_cvs,

        p_rs,

        p_pa,

        p_cns,

        p_local_examination,

        p_past_history,

        p_discharge_advice,

        p_discharge_date_time,

        p_follow_up_date_time,

        p_created_by,

        NOW(),
        
		p_icd_code


    );

    -- Update discharge date in tbl_admitted_patient

    UPDATE tbl_admitted_patient 

    SET approx_discharge_date = p_discharge_date_time,

    discharge_status = 1

    WHERE ipd_id = p_ipd_id;


    UPDATE tbl_admitted_patient 

    SET discharge_date = p_discharge_date_time,

    discharge_status = 1

    WHERE ipd_id = p_ipd_id;


	UPDATE tbl_bed_booking 

    SET end_date = p_discharge_date_time

    WHERE ipd_id = p_ipd_id and booking_status=1;

    -- Commit transaction

    COMMIT;

    -- Success message

    SELECT 'Patient discharged successfully' AS message;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ExamineOPDPatient` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ExamineOPDPatient`(
    IN p_uh_id VARCHAR(255),
    IN p_appointment_id INT,
    IN p_chief_complaints TEXT,
    IN p_personal_history TEXT,
    IN p_past_medical_history TEXT,
    IN p_present_medication TEXT,
    IN p_general_condition TEXT,
    IN p_pulse VARCHAR(50),
    IN p_blood_pressure VARCHAR(50),
    IN p_respiratory_rate VARCHAR(50),
    IN p_spo2 VARCHAR(50),
    IN p_signs TEXT,
    IN p_respiratory_system TEXT,
    IN p_cardiovascular_system TEXT,
    IN p_central_nervous_system TEXT,
    IN p_per_abdomen TEXT,
    IN p_created_by INT
)
BEGIN
    -- Start transaction
    START TRANSACTION;
 
    -- Insert patient record without uh_id
    INSERT INTO tbl_opd_examination (
        uh_id, 
        appointment_id,
        chief_complaints,
        personal_history,
        past_medical_history,
        present_medication,
        general_condition,
        pulse,
        blood_pressure,
        respiratory_rate,
        spo2,
        signs,
        respiratory_system,
        cardiovascular_system,
        central_nervous_system,
        per_abdomen,
        created_by,
        created_at
    ) 
    VALUES (
        p_uh_id, 
        p_appointment_id,
        p_chief_complaints,
        p_personal_history,
        p_past_medical_history,
        p_present_medication,
        p_general_condition,
        p_pulse,
        p_blood_pressure,
        p_respiratory_rate,
        p_spo2,
        p_signs,
        p_respiratory_system,
        p_cardiovascular_system,
        p_central_nervous_system,
        p_per_abdomen,
        p_created_by,
        NOW()
    );
 
    COMMIT;
 
    -- Success message with the generated UH ID
    SELECT 'Patient monitored successfully' AS message;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetAdmitPatients` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAdmitPatients`(
    IN p_page INT,
    IN p_page_size INT
)
BEGIN
    DECLARE v_offset INT DEFAULT 0;
    DECLARE v_total_patients INT;
    DECLARE v_total_pages INT;
 
    -- Get total number of admitted patients
    SELECT COUNT(*) INTO v_total_patients 
    FROM tbl_patient p
    INNER JOIN tbl_admitted_patient ap ON p.uh_id = ap.uh_id
    WHERE p.patient_status = 1;
 
    -- If page and page size are NULL or 0, fetch all records
    IF p_page IS NULL OR p_page_size IS NULL OR p_page = 0 OR p_page_size = 0 THEN
        -- Fetch all admitted patients without pagination
        SELECT 
            p.patient_name AS Name,
            p.patient_id AS Patient_ID,
            p.patient_image AS Photo,
            p.uh_id,
            p.patient_sex,
            p.patient_age,
            ap.ipd_id,
            ap.doctor_id,
            u.user_name AS doctor_name,
            ap.admitted_date,
            ap.approx_discharge_date AS discharge_date,
            ap.bed_id,
            ap.mlc_no,
            ap.tpa,
            ap.mediclaim,
            ap.reference_doctor,
            ap.department_id,
            d.department_name AS department,
            ap.occupation,
            ap.admit_time,
            ap.discharge_date,
            ap.admitted_patient_id,
            -- Aggregating patient relatives
            JSON_ARRAYAGG(
                JSON_OBJECT(
                    'relative_name', pr.name,
                    'relative_age', pr.age,
                    'relative_gender', pr.gender,
                    'relation', pr.relation,
                    'relative_mobile', pr.mobile,
                    'relative_address', pr.address
                )
            ) AS relatives
        FROM tbl_patient p
        INNER JOIN tbl_admitted_patient ap ON p.uh_id = ap.uh_id
        JOIN tbl_users u ON ap.doctor_id = u.user_id
        JOIN tbl_department d ON d.department_id = ap.department_id
        LEFT JOIN tbl_patient_relatives pr ON pr.ipd_id = ap.ipd_id
        WHERE ap.status = 1
        GROUP BY p.patient_name, p.patient_id, p.patient_image, p.uh_id, 
                 p.patient_sex, p.patient_age, ap.ipd_id, ap.doctor_id, u.user_name, 
                 ap.admitted_date, ap.approx_discharge_date, ap.bed_id, ap.mlc_no, 
                 ap.tpa, ap.mediclaim, ap.reference_doctor, ap.department_id, 
                 d.department_name, ap.occupation, ap.admit_time, ap.discharge_date,
                 ap.admitted_patient_id; -- Added ap.admitted_patient_id to GROUP BY
 
    ELSE
        -- Calculate offset for pagination
        SET v_offset = (p_page - 1) * p_page_size;
        -- Calculate total pages
        SET v_total_pages = CEIL(v_total_patients / p_page_size);
        -- Fetch paginated list of admitted patients with relatives
        SELECT 
            p.patient_name AS Name,
            p.patient_id AS Patient_ID,
            p.patient_image AS Photo,  
            p.uh_id,
            p.patient_sex,
            p.patient_age,
            ap.ipd_id,
            ap.doctor_id,
            u.user_name AS doctor_name,
            ap.admitted_patient_id,
            ap.admitted_date,
            ap.approx_discharge_date AS discharge_date,
            ap.bed_id,
            ap.mlc_no,
            ap.tpa,
            ap.mediclaim,
            ap.reference_doctor,
            ap.department_id,
            d.department_name AS department,
            ap.occupation,
            ap.admit_time,
            ap.discharge_date,
            -- Aggregating patient relatives
            JSON_ARRAYAGG(
                JSON_OBJECT(
                    'relative_name', pr.name,
                    'relative_age', pr.age,
                    'relative_gender', pr.gender,
                    'relation', pr.relation,
                    'relative_mobile', pr.mobile,
                    'relative_address', pr.address
                )
            ) AS relatives
        FROM tbl_patient p
        INNER JOIN tbl_admitted_patient ap ON p.uh_id = ap.uh_id
        JOIN tbl_users u ON ap.doctor_id = u.user_id
        JOIN tbl_department d ON d.department_id = ap.department_id
        LEFT JOIN tbl_patient_relatives pr ON pr.ipd_id = ap.ipd_id
        WHERE ap.status = 1
        GROUP BY p.patient_name, p.patient_id, p.patient_image, p.uh_id, 
                 p.patient_sex, p.patient_age, ap.ipd_id, ap.doctor_id, u.user_name, 
                 ap.admitted_date, ap.approx_discharge_date, ap.bed_id, ap.mlc_no, 
                 ap.tpa, ap.mediclaim, ap.reference_doctor, ap.department_id, 
                 d.department_name, ap.occupation, ap.admit_time, ap.discharge_date,
                 ap.admitted_patient_id -- Added ap.admitted_patient_id to GROUP BY
        LIMIT p_page_size OFFSET v_offset;
 
        -- Return pagination details separately
        SELECT 
            v_total_patients AS TotalRecords,
            v_total_pages AS TotalPages,
            p_page AS CurrentPage,
            p_page_size AS LimitPerPage;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetAdmitPatientsDeposite` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAdmitPatientsDeposite`()
BEGIN
    SELECT 
        p.patient_name AS Name,
        p.patient_id AS Patient_ID,
        p.patient_image AS Photo,
        p.patient_sex,
        p.patient_age,
        ap.ipd_id,
        ap.doctor_id,
        u.user_name AS doctor_name,
        ap.admitted_date,
        ap.approx_discharge_date AS discharge_date,
        ap.bed_id,
        ap.mlc_no,
        ap.tpa,
        ap.mediclaim,
        ap.reference_doctor,
        ap.department_id,
        d.department_name AS department,
        ap.occupation,
        ap.admit_time,
        ap.discharge_date,
        ap.admitted_patient_id,
        ap.bill_status,
        ap.discharge_status,
        JSON_ARRAYAGG(
            JSON_OBJECT(
                'relative_name', pr.name,
                'relative_age', pr.age,
                'relative_gender', pr.gender,
                'relation', pr.relation,
                'relative_mobile', pr.mobile,
                'relative_address', pr.address
            )
        ) AS relatives,
        
        JSON_ARRAYAGG(
            JSON_OBJECT(
                'date', dp.date,
                'amount', COALESCE(dp.amount, 0),
                'deposite_id', dp.ipd_deposite_id
            )
        ) AS deposits,

        -- Subquery to get room-related data, only selecting room info once per patient
        (SELECT JSON_ARRAYAGG(
            JSON_OBJECT(
                'room_type', r.room_type_id,
                'bed_id', bb.bed_id,
                'start_date', bb.start_date,
                'end_date', bb.end_date,
                'total', bc.total
            )
        )
        FROM tbl_bed_booking bb
        LEFT JOIN tbl_bed b ON bb.bed_id = b.bed_id
        LEFT JOIN tbl_room r ON r.room_id = b.room_id
        LEFT JOIN tbl_room_type rt ON rt.room_type_id = r.room_type_id
        LEFT JOIN tbl_billing_and_charges bc ON bc.class_name = rt.room_type_id
        WHERE bb.admitted_patient_id = ap.admitted_patient_id) AS room1,
        
           (SELECT JSON_ARRAYAGG(
            JSON_OBJECT(
                'ipd_charge_id', ic.ipd_charge_id,
                'charge_date', ic.date,
                'charge_name', f.fees_name,
                'amount', f.fees_amount
            )
        )
        FROM tbl_ipd_charges ic
		LEFT JOIN tbl_fees f ON ic.charge_id = f.fees_id  
        WHERE ic.admited_id = ap.admitted_patient_id) AS othercharges,
        
        (SELECT JSON_ARRAYAGG(
            JSON_OBJECT(
                'ipd_doctor_visit_id', dv.ipd_doctor_visit_id,
                'visit_date', dv.ipd_doctor_date,
                'doctor_name', u.user_name,
                'amount', ud.consultancy_fee
            )
        )
        FROM tbl_ipd_doctor_visits dv
		LEFT JOIN tbl_users u ON u.user_id = dv.ipd_doctor_id
		LEFT JOIN tbl_user_details ud ON u.user_id = ud.user_id  
        WHERE dv.admited_id = ap.admitted_patient_id) AS doctorvisiting
        
        
    FROM tbl_patient p
    INNER JOIN tbl_admitted_patient ap ON p.uh_id = ap.uh_id
    JOIN tbl_users u ON ap.doctor_id = u.user_id
    JOIN tbl_department d ON d.department_id = ap.department_id
    LEFT JOIN tbl_patient_relatives pr ON pr.ipd_id = ap.ipd_id
    LEFT JOIN tbl_ipd_deposite dp ON dp.admited_id = ap.admitted_patient_id
    WHERE ap.status = 1
    GROUP BY p.patient_name, p.patient_id, p.patient_image, p.uh_id, 
             p.patient_sex, p.patient_age, ap.ipd_id, ap.doctor_id, u.user_name, 
             ap.admitted_date, ap.approx_discharge_date, ap.bed_id, ap.mlc_no, 
             ap.tpa, ap.mediclaim, ap.reference_doctor, ap.department_id, 
             d.department_name, ap.occupation, ap.admit_time, ap.discharge_date,
             ap.admitted_patient_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetAdmitPatientsParticular` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAdmitPatientsParticular`(IN p_admited_id INT)
BEGIN
        SELECT 
            p.patient_name AS Name,
            p.patient_id AS Patient_ID,
            p.patient_image AS Photo,
            p.uh_id,
            p.patient_sex,
            p.patient_age,
            ap.ipd_id,
            ap.doctor_id,
            u.user_name AS doctor_name,
            ap.admitted_date,
            ap.approx_discharge_date AS discharge_date,
            ap.bed_id,
            ap.mlc_no,
            ap.tpa,
            ap.mediclaim,
            ap.reference_doctor,
            ap.department_id,
            d.department_name AS department,
            ap.occupation,
            ap.admit_time,
            ap.discharge_date,
            ap.admitted_patient_id,
            -- Aggregating patient relatives
            JSON_ARRAYAGG(
                JSON_OBJECT(
                    'relative_name', pr.name,
                    'relative_age', pr.age,
                    'relative_gender', pr.gender,
                    'relation', pr.relation,
                    'relative_mobile', pr.mobile,
                    'relative_address', pr.address
                )
            ) AS relatives
        FROM tbl_patient p
        INNER JOIN tbl_admitted_patient ap ON p.uh_id = ap.uh_id
        JOIN tbl_users u ON ap.doctor_id = u.user_id
        JOIN tbl_department d ON d.department_id = ap.department_id
        LEFT JOIN tbl_patient_relatives pr ON pr.ipd_id = ap.ipd_id
        WHERE ap.status = 1 and ap.admitted_patient_id=p_admited_id
        GROUP BY p.patient_name, p.patient_id, p.patient_image, p.uh_id, 
                 p.patient_sex, p.patient_age, ap.ipd_id, ap.doctor_id, u.user_name, 
                 ap.admitted_date, ap.approx_discharge_date, ap.bed_id, ap.mlc_no, 
                 ap.tpa, ap.mediclaim, ap.reference_doctor, ap.department_id, 
                 d.department_name, ap.occupation, ap.admit_time, ap.discharge_date,
                 ap.admitted_patient_id; 

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetAdmitPatientsReceiptDetails` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAdmitPatientsReceiptDetails`(IN specific_admited_id INT)
BEGIN
    SELECT 
        p.patient_name AS Name,
        p.patient_id AS Patient_ID,
        p.patient_image AS Photo,
        p.patient_sex,
        p.patient_age,
        ap.ipd_id,
        ap.doctor_id,
        ap.bill_status,
        ap.discharge_status,
        u.user_name AS doctor_name,
        ap.admitted_date,
        ap.approx_discharge_date AS discharge_date,
        ap.bed_id,
        ap.mlc_no,
        ap.tpa,
        ap.mediclaim,
        ap.reference_doctor,
        ap.department_id,
        d.department_name AS department,
        ap.occupation,
        ap.admit_time,
        ap.discharge_date,
        ap.admitted_patient_id,
        b.bill_report,
        JSON_ARRAYAGG(
            JSON_OBJECT(
                'relative_name', pr.name,
                'relative_age', pr.age,
                'relative_gender', pr.gender,
                'relation', pr.relation,
                'relative_mobile', pr.mobile,
                'relative_address', pr.address
            )
        ) AS relatives,
        JSON_ARRAYAGG(
            JSON_OBJECT(
                'date', dp.date,
                'amount', COALESCE(dp.amount, 0),
                'mode',dp.payment_mode,
                'deposite_id', dp.ipd_deposite_id
            )
        ) AS deposits,
        -- Subquery to get room-related data, only selecting room info once per patient
        (SELECT JSON_ARRAYAGG(
            JSON_OBJECT(
                'room_type', r.room_type_id,
                "room_type_name",rt.room_type,
                'bed_id', bb.bed_id,
                'start_date', bb.start_date,
                'end_date', bb.end_date,
                'total', bc.total
            )
        )
        FROM tbl_bed_booking bb
        LEFT JOIN tbl_bed b ON bb.bed_id = b.bed_id
        LEFT JOIN tbl_room r ON r.room_id = b.room_id
        LEFT JOIN tbl_room_type rt ON rt.room_type_id = r.room_type_id
        LEFT JOIN tbl_billing_and_charges bc ON bc.class_name = rt.room_type_id
        WHERE bb.admitted_patient_id = ap.admitted_patient_id) AS room1,
        (SELECT JSON_ARRAYAGG(
            JSON_OBJECT(
                'ipd_charge_id', ic.ipd_charge_id,
                'charge_date', ic.date,
                'charge_name', f.fees_name,
                'amount', f.fees_amount
            )
        )
        FROM tbl_ipd_charges ic 
        LEFT JOIN tbl_fees f ON ic.charge_id = f.fees_id
        WHERE ic.admited_id = ap.admitted_patient_id) AS othercharges,
        (SELECT JSON_ARRAYAGG(
            JSON_OBJECT(
                'ipd_doctor_visit_id', dv.ipd_doctor_visit_id,
                'visit_date', dv.ipd_doctor_date,
                'doctor_name', u.user_name,
                'amount', ud.consultancy_fee
            )
        )
        FROM tbl_ipd_doctor_visits dv 
        LEFT JOIN tbl_users u ON u.user_id = dv.ipd_doctor_id 
        LEFT JOIN tbl_user_details ud ON u.user_id = ud.user_id
        WHERE dv.admited_id = ap.admitted_patient_id) AS doctorvisiting
    FROM tbl_patient p
    INNER JOIN tbl_admitted_patient ap ON p.uh_id = ap.uh_id
    JOIN tbl_users u ON ap.doctor_id = u.user_id
    JOIN tbl_department d ON d.department_id = ap.department_id
    LEFT JOIN tbl_patient_relatives pr ON pr.ipd_id = ap.ipd_id
	LEFT JOIN tbl_ipd_bills b ON b.bill_admit_id = ap.admitted_patient_id
    LEFT JOIN tbl_ipd_deposite dp ON dp.admited_id = ap.admitted_patient_id
    WHERE ap.status = 1 
    AND ap.admitted_patient_id = specific_admited_id -- Changed to filter by specific admited_id
    GROUP BY p.patient_name, p.patient_id, p.patient_image, p.uh_id,
             p.patient_sex, p.patient_age, ap.ipd_id, ap.doctor_id, u.user_name,
             ap.admitted_date, ap.approx_discharge_date, ap.bed_id, ap.mlc_no,
             ap.tpa, ap.mediclaim, ap.reference_doctor, ap.department_id,
             d.department_name, ap.occupation, ap.admit_time, ap.discharge_date,
             ap.admitted_patient_id,b.bill_report;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetAllAccountants` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAllAccountants`(
    IN p_page INT,
    IN p_page_size INT
)
BEGIN
    DECLARE v_offset INT;
    DECLARE v_total_doctors INT;
    DECLARE v_total_pages INT;

    -- Get total number of doctors
    SELECT COUNT(*) INTO v_total_doctors 
    FROM tbl_users 
    WHERE 
        user_status = 1 
        AND user_role_id = 5;

    -- Check if both parameters are NULL
    IF p_page IS NULL AND p_page_size IS NULL THEN
        -- Return all doctors without pagination
        IF v_total_doctors = 0 THEN
            SELECT NULL AS Name, NULL AS User_ID, NULL AS Photo, NULL AS Department_name LIMIT 0;
        ELSE
            SELECT 
                u.user_name AS Name,
                u.user_id AS User_ID,
                u.user_photo AS Photo,     
                ud.joining_date,
                e.degree,
				ud.mobile,
                ud.age,
                u.user_email,
                 s.shift_name
         
            FROM tbl_users u
           left JOIN tbl_education e ON e.user_id = u.user_id
           left JOIN tbl_user_details ud ON ud.user_id = u.user_id
		 left JOIN tbl_shift s ON ud.shift_id = s.shift_id
            WHERE u.user_status = 1 
              AND u.user_role_id = 5;
        END IF;

        -- Return pagination details with all records
        SELECT 
            v_total_doctors AS TotalRecords,
            1 AS TotalPages,
            1 AS CurrentPage,
            v_total_doctors AS LimitPerPage;
    ELSE
        -- Pagination logic when parameters are provided
        SET p_page = IFNULL(p_page, 1);
        SET p_page_size = IFNULL(p_page_size, 10);
        SET p_page = GREATEST(p_page, 1);
        SET p_page_size = GREATEST(p_page_size, 1);

        -- Calculate offset and total pages
        SET v_offset = (p_page - 1) * p_page_size;
        SET v_total_pages = CEIL(v_total_doctors / p_page_size);

        -- Return paginated results
        IF v_total_doctors = 0 THEN
            SELECT NULL AS Name, NULL AS User_ID, NULL AS Photo, NULL AS Department_name LIMIT 0;
        ELSE
            SELECT 
                u.user_name AS Name,
                u.user_id AS User_ID,
                u.user_photo AS Photo,     
                ud.joining_date,
                e.degree,
				ud.mobile,
                ud.age,
                u.user_email,
                s.shift_name
    
            FROM tbl_users u
           left JOIN tbl_education e ON e.user_id = u.user_id
           left  JOIN tbl_user_details ud ON ud.user_id = u.user_id
		   left  JOIN tbl_shift s ON ud.shift_id = s.shift_id
            WHERE u.user_status = 1 
              AND u.user_role_id = 5 
            LIMIT p_page_size OFFSET v_offset;
        END IF;

        -- Return pagination details
        SELECT 
            v_total_doctors AS TotalRecords,
            v_total_pages AS TotalPages,
            p_page AS CurrentPage,
            p_page_size AS LimitPerPage;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetAllAppointmentsDoctorwise` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAllAppointmentsDoctorwise`(
    IN p_doctor_id INT,
    IN p_page INT,
    IN p_limit INT
)
BEGIN
    DECLARE v_offset INT;
    DECLARE v_total_records INT;
    DECLARE v_total_pages INT;

    -- Calculate offset for pagination
    SET v_offset = (p_page - 1) * p_limit;

    -- Get total number of records for pagination metadata
    SELECT COUNT(*) INTO v_total_records
    FROM tbl_appointment
    WHERE appo_doctor_id = p_doctor_id;

    -- Calculate total pages
    SET v_total_pages = CEIL(v_total_records / p_limit);

    -- First result set: Appointment data for the doctor with pagination
    SELECT 
        a.appo_id AS Appointment_Id,
        a.appo_date AS Appointment_Date,
        a.appo_patient_source AS Appointment_Source,
        a.appo_status AS Appointment_Status,   
        a.appo_reason AS Consultant_Reason,
        p.patient_id AS Patient_Id,
        p.patient_name AS Patient_Name,
        p.patient_age AS Patient_Age,
        p.patient_sex AS Patient_Sex,
        p.patient_image AS Patient_Photo,
        u.user_name AS Doctor_Name
    FROM tbl_appointment a
    JOIN tbl_patient p ON p.patient_id = a.appo_patient_id
    JOIN tbl_users u ON a.appo_doctor_id = u.user_id
    WHERE a.appo_doctor_id = p_doctor_id
    LIMIT v_offset, p_limit;

    -- Second result set: Pagination metadata
    SELECT 
        v_total_records AS total_records,
        v_total_pages AS total_pages,
        p_page AS current_page;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetAllBillingAndCharges` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAllBillingAndCharges`()
BEGIN
    SELECT b.*, rt.room_type 
    FROM tbl_billing_and_charges b
   left JOIN `tbl_room_type` rt ON rt.room_type_id = b.class_name;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetAllDepartment` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAllDepartment`()
BEGIN
    SELECT department_id,department_name FROM tbl_department WHERE department_status = 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetAllDoctors` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAllDoctors`(
    IN p_page INT,
    IN p_page_size INT
)
BEGIN
    DECLARE v_offset INT;
    DECLARE v_total_doctors INT;
    DECLARE v_total_pages INT;

    -- Get total number of doctors
    SELECT COUNT(*) INTO v_total_doctors 
    FROM tbl_users 
    WHERE 
        user_status = 1 
        AND user_role_id = 2;

    -- Check if both parameters are NULL
    IF p_page IS NULL AND p_page_size IS NULL THEN
        -- Return all doctors without pagination
        IF v_total_doctors = 0 THEN
            SELECT NULL AS Name, NULL AS User_ID, NULL AS Photo, NULL AS Department_name LIMIT 0;
        ELSE
            SELECT 
                u.user_name AS Name,
                u.user_id AS User_ID,
                u.user_photo AS Photo,     
                d.department_name AS Department_name,
                d.department_id,
                ud.joining_date,
                ud.consultancy_fee,
                e.degree,
                e.post_degree,
				ud.mobile,
                ud.age,
                u.user_email,
                e.specialization
            FROM tbl_users u
            JOIN tbl_department d ON d.department_id = u.user_department_id
            JOIN tbl_education e ON e.user_id = u.user_id
            JOIN tbl_user_details ud ON ud.user_id = u.user_id
            WHERE u.user_status = 1 
              AND u.user_role_id = 2;
        END IF;

        -- Return pagination details with all records
        SELECT 
            v_total_doctors AS TotalRecords,
            1 AS TotalPages,
            1 AS CurrentPage,
            v_total_doctors AS LimitPerPage;
    ELSE
        -- Pagination logic when parameters are provided
        SET p_page = IFNULL(p_page, 1);
        SET p_page_size = IFNULL(p_page_size, 10);
        SET p_page = GREATEST(p_page, 1);
        SET p_page_size = GREATEST(p_page_size, 1);

        -- Calculate offset and total pages
        SET v_offset = (p_page - 1) * p_page_size;
        SET v_total_pages = CEIL(v_total_doctors / p_page_size);

        -- Return paginated results
        IF v_total_doctors = 0 THEN
            SELECT NULL AS Name, NULL AS User_ID, NULL AS Photo, NULL AS Department_name LIMIT 0;
        ELSE
            SELECT 
                u.user_name AS Name,
                u.user_id AS User_ID,
                u.user_photo AS Photo,     
                d.department_name AS Department_name,
                d.department_id,
                ud.joining_date,
                ud.consultancy_fee,
                e.degree,
                e.post_degree,
				ud.mobile,
                ud.age,
                u.user_email,
				e.specialization

            FROM tbl_users u
            JOIN tbl_department d ON d.department_id = u.user_department_id
            JOIN tbl_education e ON e.user_id = u.user_id
            JOIN tbl_user_details ud ON ud.user_id = u.user_id
            WHERE u.user_status = 1 
              AND u.user_role_id = 2 
            LIMIT p_page_size OFFSET v_offset;
        END IF;

        -- Return pagination details
        SELECT 
            v_total_doctors AS TotalRecords,
            v_total_pages AS TotalPages,
            p_page AS CurrentPage,
            p_page_size AS LimitPerPage;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetAllLabAssistants` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAllLabAssistants`(
    IN p_page INT,
    IN p_page_size INT
)
BEGIN
    DECLARE v_offset INT;
    DECLARE v_total_doctors INT;
    DECLARE v_total_pages INT;

    -- Get total number of receptionists
    SELECT COUNT(*) INTO v_total_doctors 
    FROM tbl_users 
    WHERE 
        user_status = 1 
        AND user_role_id = 3;

    -- Check if both parameters are NULL
    IF p_page IS NULL AND p_page_size IS NULL THEN
        -- Return all receptionists without pagination
        IF v_total_doctors = 0 THEN
            SELECT NULL AS Name, NULL AS User_ID, NULL AS Photo, NULL AS Department_name LIMIT 0;
        ELSE
            SELECT 
                u.user_name AS Name,
                u.user_id AS User_ID,
                u.user_photo AS Photo,     
                d.department_name AS Department_name,
                d.department_id,
                ud.joining_date,
                		ud.mobile,
                ud.age,
                u.user_email,
                GROUP_CONCAT(DISTINCT s.shift_name SEPARATOR ', ') AS shift_name,
                e.degree
            FROM tbl_users u
            LEFT JOIN tbl_department d ON d.department_id = u.user_department_id
            LEFT JOIN tbl_education e ON e.user_id = u.user_id
            LEFT JOIN tbl_user_details ud ON ud.user_id = u.user_id
            LEFT JOIN tbl_rec_lab_avaibility ra ON ra.rec_lab_ava_user_id = u.user_id
            LEFT JOIN tbl_shift s ON s.shift_id = ra.rec_lab_ava_slot_shift_id
            WHERE u.user_status = 1 
              AND u.user_role_id = 3
            GROUP BY u.user_id, u.user_name, u.user_photo, d.department_name, 
                     d.department_id, ud.joining_date, e.degree,		ud.mobile,
                ud.age,
                u.user_email;
        END IF;

        -- Return pagination details with all records
        SELECT 
            v_total_doctors AS TotalRecords,
            1 AS TotalPages,
            1 AS CurrentPage,
            v_total_doctors AS LimitPerPage;
    ELSE
        -- Pagination logic when parameters are provided
        SET p_page = IFNULL(p_page, 1);
        SET p_page_size = IFNULL(p_page_size, 10);
        SET p_page = GREATEST(p_page, 1);
        SET p_page_size = GREATEST(p_page_size, 1);

        -- Calculate offset and total pages
        SET v_offset = (p_page - 1) * p_page_size;
        SET v_total_pages = CEIL(v_total_doctors / p_page_size);

        -- Return paginated results
        IF v_total_doctors = 0 THEN
            SELECT NULL AS Name, NULL AS User_ID, NULL AS Photo, NULL AS Department_name LIMIT 0;
        ELSE
            SELECT 
                u.user_name AS Name,
                u.user_id AS User_ID,
                u.user_photo AS Photo,     
                d.department_name AS Department_name,
                d.department_id,
                ud.joining_date,
                		ud.mobile,
                ud.age,
                u.user_email,
                GROUP_CONCAT(DISTINCT s.shift_name SEPARATOR ', ') AS shift_name,
                e.degree
            FROM tbl_users u
            LEFT JOIN tbl_department d ON d.department_id = u.user_department_id
            LEFT JOIN tbl_education e ON e.user_id = u.user_id
            LEFT JOIN tbl_user_details ud ON ud.user_id = u.user_id
            LEFT JOIN tbl_rec_lab_avaibility ra ON ra.rec_lab_ava_user_id = u.user_id
            LEFT JOIN tbl_shift s ON s.shift_id = ra.rec_lab_ava_slot_shift_id
            WHERE u.user_status = 1 
              AND u.user_role_id = 3
            GROUP BY u.user_id, u.user_name, u.user_photo, d.department_name, 
                     d.department_id, ud.joining_date, e.degree,		ud.mobile,
                ud.age,
                u.user_email
            LIMIT p_page_size OFFSET v_offset;
        END IF;

        -- Return pagination details
        SELECT 
            v_total_doctors AS TotalRecords,
            v_total_pages AS TotalPages,
            p_page AS CurrentPage,
            p_page_size AS LimitPerPage;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetAllPatients` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAllPatients`(
    IN p_page INT,
    IN p_page_size INT
)
BEGIN
    DECLARE v_offset INT DEFAULT 0;
    DECLARE v_total_patients INT;
    DECLARE v_total_pages INT;
 
    -- Get total number of patients
    SELECT COUNT(*) INTO v_total_patients 
    FROM tbl_patient 
    WHERE patient_status = 1;
 
    -- If page and page size are NULL or 0, fetch all records
    IF p_page IS NULL OR p_page_size IS NULL OR p_page = 0 OR p_page_size = 0 THEN
        -- Fetch all patients without pagination
        SELECT 
            p.patient_name AS Name,
            p.patient_id AS Patient_ID,
            p.patient_image AS Photo,
            p.uh_id,
            p.patient_sex,
            p.patient_age,
            p.created_at,
            p.patient_phone_no,
			p.patient_address

        FROM tbl_patient p
        WHERE p.patient_status = 1;
    ELSE
        -- Calculate offset for pagination
        SET v_offset = (p_page - 1) * p_page_size;
        -- Calculate total pages
        SET v_total_pages = CEIL(v_total_patients / p_page_size);
        -- Fetch paginated list of patients
        SELECT 
            p.patient_name AS Name,
            p.patient_id AS Patient_ID,
            p.patient_image AS Photo,  
            p.uh_id,
            p.patient_sex,
            p.patient_age,
            p.created_at,
			p.patient_phone_no,
			p.patient_address
        FROM tbl_patient p
        WHERE p.patient_status = 1
        LIMIT p_page_size OFFSET v_offset;
 
        -- Return pagination details separately
        SELECT 
            v_total_patients AS TotalRecords,
            v_total_pages AS TotalPages,
            p_page AS CurrentPage,
            p_page_size AS LimitPerPage;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetAllPaymentHistory` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAllPaymentHistory`(
    IN p_page INT,
    IN p_page_size INT
)
BEGIN
    DECLARE v_offset INT;
    DECLARE v_total_payment_record INT;
    DECLARE v_total_pages INT;
    -- Input validation: Set default values if parameters are NULL or invalid
    SET p_page = IFNULL(p_page, 1);
    SET p_page_size = IFNULL(p_page_size, 10);
    IF p_page < 1 THEN
        SET p_page = 1;
    END IF;
    IF p_page_size < 1 THEN
        SET p_page_size = 10;
    END IF;

    -- Calculate offset for pagination
    SET v_offset = (p_page - 1) * p_page_size;

    -- Get total count of doctors (assuming unique doctors from tbl_users)
    SELECT COUNT(*) INTO v_total_payment_record
    FROM tbl_ipd_bills ib;


    -- Calculate total pages
    SET v_total_pages = CEIL(v_total_payment_record / p_page_size);

    -- Fetch paginated results
    SELECT 
        u.user_name AS Name,
        u.user_id AS User_ID,
        u.user_photo AS Photo,
        p.patient_name,
        p.patient_image,
        p.patient_id,
        ib.*,
        ap.admitted_date,
        ap.uh_id
    FROM tbl_ipd_bills ib
    JOIN tbl_admitted_patient ap ON ib.bill_admit_id = ap.admitted_patient_id
    JOIN tbl_patient p ON p.uh_id = ap.uh_id -- Adjusted join condition
    JOIN tbl_users u ON u.user_id = ap.doctor_id
    LIMIT p_page_size OFFSET v_offset;

    -- Optionally return total pages and total doctors
    SELECT v_total_payment_record AS total_record, v_total_pages AS total_pages;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetAllPaymentHistorySearch` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAllPaymentHistorySearch`(
    IN p_page INT,
    IN p_page_size INT,
	IN p_patient_id varchar(100)
)
BEGIN
    DECLARE v_offset INT;
    DECLARE v_total_payment_record INT;
    DECLARE v_total_pages INT;
    

    SET p_page = IFNULL(p_page, 1);
    SET p_page_size = IFNULL(p_page_size, 10);
    IF p_page < 1 THEN
        SET p_page = 1;
    END IF;
    IF p_page_size < 1 THEN
        SET p_page_size = 10;
    END IF;

    -- Calculate offset for pagination
    SET v_offset = (p_page - 1) * p_page_size;

    -- Get total count of doctors (assuming unique doctors from tbl_users)
    SELECT COUNT(*) INTO v_total_payment_record
	FROM tbl_ipd_bills ib
	JOIN tbl_admitted_patient ap ON ib.bill_admit_id = ap.admitted_patient_id
    JOIN tbl_patient p ON p.uh_id = ap.uh_id
    where ap.uh_id=p_patient_id ;


    -- Calculate total pages
    SET v_total_pages = CEIL(v_total_payment_record / p_page_size);

    -- Fetch paginated results
    SELECT 
        u.user_name AS Name,
        u.user_id AS User_ID,
        u.user_photo AS Photo,
        p.patient_name,
        p.patient_image,
        p.patient_id,
        ib.*,
        ap.admitted_date,
        ap.uh_id
    FROM tbl_ipd_bills ib
    JOIN tbl_admitted_patient ap ON ib.bill_admit_id = ap.admitted_patient_id
    JOIN tbl_patient p ON p.uh_id = ap.uh_id 
    JOIN tbl_users u ON u.user_id = ap.doctor_id
    where ap.uh_id = p_patient_id
    LIMIT p_page_size OFFSET v_offset;

    -- Optionally return total pages and total doctors
    SELECT v_total_payment_record AS total_record, v_total_pages AS total_pages;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetAllReceptionists` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAllReceptionists`(
    IN p_page INT,
    IN p_page_size INT
)
BEGIN
    DECLARE v_offset INT;
    DECLARE v_total_doctors INT;
    DECLARE v_total_pages INT;

    -- Get total number of receptionists
    SELECT COUNT(*) INTO v_total_doctors 
    FROM tbl_users 
    WHERE 
        user_status = 1 
        AND user_role_id = 4;

    -- Check if both parameters are NULL
    IF p_page IS NULL AND p_page_size IS NULL THEN
        -- Return all receptionists without pagination
        IF v_total_doctors = 0 THEN
            SELECT NULL AS Name, NULL AS User_ID, NULL AS Photo, NULL AS Department_name LIMIT 0;
        ELSE
            SELECT 
                u.user_name AS Name,
                u.user_id AS User_ID,
                u.user_photo AS Photo,     
                d.department_name AS Department_name,
                d.department_id,
                ud.joining_date,
				ud.mobile,
                ud.age,
                u.user_email,
                GROUP_CONCAT(DISTINCT s.shift_name SEPARATOR ', ') AS shift_name,
                e.post_degree
            FROM tbl_users u
            LEFT JOIN tbl_department d ON d.department_id = u.user_department_id
            LEFT JOIN tbl_education e ON e.user_id = u.user_id
            LEFT JOIN tbl_user_details ud ON ud.user_id = u.user_id
            LEFT JOIN tbl_rec_lab_avaibility ra ON ra.rec_lab_ava_user_id = u.user_id
            LEFT JOIN tbl_shift s ON s.shift_id = ra.rec_lab_ava_slot_shift_id
            WHERE u.user_status = 1 
              AND u.user_role_id = 4
            GROUP BY u.user_id, u.user_name, u.user_photo, d.department_name, 
                     d.department_id, ud.joining_date, e.post_degree,		ud.mobile,
                ud.age,
                u.user_email;
        END IF;

        -- Return pagination details with all records
        SELECT 
            v_total_doctors AS TotalRecords,
            1 AS TotalPages,
            1 AS CurrentPage,
            v_total_doctors AS LimitPerPage;
    ELSE
        -- Pagination logic when parameters are provided
        SET p_page = IFNULL(p_page, 1);
        SET p_page_size = IFNULL(p_page_size, 10);
        SET p_page = GREATEST(p_page, 1);
        SET p_page_size = GREATEST(p_page_size, 1);

        -- Calculate offset and total pages
        SET v_offset = (p_page - 1) * p_page_size;
        SET v_total_pages = CEIL(v_total_doctors / p_page_size);

        -- Return paginated results
        IF v_total_doctors = 0 THEN
            SELECT NULL AS Name, NULL AS User_ID, NULL AS Photo, NULL AS Department_name LIMIT 0;
        ELSE
            SELECT 
                u.user_name AS Name,
                u.user_id AS User_ID,
                u.user_photo AS Photo,     
                d.department_name AS Department_name,
                d.department_id,
                ud.joining_date,
				ud.mobile,
                ud.age,
                u.user_email,
                GROUP_CONCAT(DISTINCT s.shift_name SEPARATOR ', ') AS shift_name,
                e.post_degree
            FROM tbl_users u
            LEFT JOIN tbl_department d ON d.department_id = u.user_department_id
            LEFT JOIN tbl_education e ON e.user_id = u.user_id
            LEFT JOIN tbl_user_details ud ON ud.user_id = u.user_id
            LEFT JOIN tbl_rec_lab_avaibility ra ON ra.rec_lab_ava_user_id = u.user_id
            LEFT JOIN tbl_shift s ON s.shift_id = ra.rec_lab_ava_slot_shift_id
            WHERE u.user_status = 1 
              AND u.user_role_id = 4
            GROUP BY u.user_id, u.user_name, u.user_photo, d.department_name, 
                     d.department_id, ud.joining_date, e.post_degree,ud.mobile,
                ud.age,
                u.user_email
            LIMIT p_page_size OFFSET v_offset;
        END IF;

        -- Return pagination details
        SELECT 
            v_total_doctors AS TotalRecords,
            v_total_pages AS TotalPages,
            p_page AS CurrentPage,
            p_page_size AS LimitPerPage;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetAllStaff` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAllStaff`(
    IN p_page INT,
    IN p_page_size INT
)
BEGIN
    DECLARE v_offset INT DEFAULT 0;
    DECLARE v_total_staff INT DEFAULT 0;
    DECLARE v_total_pages INT DEFAULT 0;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'An error occurred while retrieving staff records.';
    END;

    -- Input validation
    IF p_page < 1 OR p_page_size < 1 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Page and page size must be positive integers.';
    END IF;

    -- Calculate total staff count
    SELECT COUNT(*) INTO v_total_staff 
    FROM tbl_users 
    WHERE user_status = 1 and user_role_id != 1 ;

    -- Calculate offset and total pages
    SET v_offset = (p_page - 1) * p_page_size;
    SET v_total_pages = CEIL(v_total_staff / p_page_size);

    -- Retrieve paginated staff records
    SELECT 
        u.user_name,
		u.user_photo,
		u.user_email,
        r.*
    FROM tbl_users u
    left join tbl_role r on r.role_id=u.user_role_id
    WHERE u.user_status = 1 and  user_role_id != 1 
    LIMIT p_page_size OFFSET v_offset;

    -- Return pagination metadata
    SELECT 
        v_total_staff AS total_records,
        v_total_pages AS total_pages,
        p_page AS current_page,
        p_page_size AS page_size;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetAppointmentAndAdmittedMonthwiseAdmin` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAppointmentAndAdmittedMonthwiseAdmin`()
BEGIN
    -- Temporary table to store combined results
    CREATE TEMPORARY TABLE IF NOT EXISTS temp_results (
        year INT,
        month VARCHAR(3),
        total_appointments INT DEFAULT 0,
        total_admitted_patients INT DEFAULT 0
    );

    -- Insert appointment data
    IF EXISTS (SELECT 1 FROM tbl_appointment) THEN
        INSERT INTO temp_results (year, month, total_appointments)
        SELECT 
            YEAR(FROM_UNIXTIME(appo_date)) AS year,
            DATE_FORMAT(FROM_UNIXTIME(appo_date), '%b') AS month,
            COUNT(*) AS total_appointments
        FROM 
            tbl_appointment
        GROUP BY 
            YEAR(FROM_UNIXTIME(appo_date)), 
            DATE_FORMAT(FROM_UNIXTIME(appo_date), '%b');
    END IF;

    -- Insert or update admitted patient data
    IF EXISTS (SELECT 1 FROM tbl_admitted_patient) THEN
        INSERT INTO temp_results (year, month, total_admitted_patients)
        SELECT 
            YEAR(FROM_UNIXTIME(admitted_date)) AS year,
            DATE_FORMAT(FROM_UNIXTIME(admitted_date), '%b') AS month,
            COUNT(*) AS total_admitted_patients
        FROM 
            tbl_admitted_patient
        GROUP BY 
            YEAR(FROM_UNIXTIME(admitted_date)), 
            DATE_FORMAT(FROM_UNIXTIME(admitted_date), '%b')
        ON DUPLICATE KEY UPDATE 
            total_admitted_patients = VALUES(total_admitted_patients);
    END IF;

    -- Select combined results with only total patients
    IF EXISTS (SELECT 1 FROM temp_results) THEN
        SELECT 
            year,
            month,
            (total_appointments + total_admitted_patients) AS total_patient
        FROM 
            temp_results
        ORDER BY 
            year, STR_TO_DATE(month, '%b');
    ELSE
        SELECT 'No data found' AS message;
    END IF;

    -- Clean up
    DROP TEMPORARY TABLE IF EXISTS temp_results;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetAppointmentBillDetails` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAppointmentBillDetails`(
    IN p_appointment_id INT  
)
BEGIN
    SELECT 
        u.user_name AS doctor_name,
        u.user_id AS doctor_id, 
        a.appo_id AS Appo_id,
        a.appo_disease AS disease,
        a.appo_status,
        p.patient_id,
        p.patient_name,
        p.patient_image,
        p.patient_age,
        p.patient_sex,
        p.uh_id,
        a.appo_biil_status,
        a.appo_date,
        ud.consultancy_fee,
        ob.receipt_number,
        ob.bill_date,
        ob.bill_total_amount,
        ob.bill_id,
        ob.bill_report,
        (
            SELECT JSON_ARRAYAGG(
                JSON_OBJECT(
                    'chargeId', lt.lab_id,
                    'billingType', t.test_name,
                    'amount', t.test_fees, 
                    'quantity', 1,
                    'total', t.test_fees
                )
            )
            FROM `tbl_appointment` a
			JOIN `tbl_labtest` lt ON lt.lab_appoi_id = a.appo_id
            JOIN tbl_test t ON lt.lab_test_id = t.test_id
            WHERE a.appo_id = p_appointment_id and lt.lab_test_status="Completed"
        ) AS LabchargesList,

        -- Generating the JSON array for chargesList
        (
            SELECT JSON_ARRAYAGG(
                JSON_OBJECT(
                    'chargeId', obf.opd_bill_fees_id,
                    'billingType', f.fees_name,
                    'amount', f.fees_amount, -- Unit price calculation
                    'quantity', obf.quantity,
                    'total', obf.total_fee
                )
            )
            FROM tbl_opd_bill_fees obf
            JOIN tbl_fees f ON obf.fees_id = f.fees_id
            WHERE obf.opd_bill_id = ob.bill_appointment_id
        ) AS chargesList

    FROM tbl_appointment a
    JOIN tbl_patient p ON a.appo_patient_id = p.patient_id
    JOIN tbl_users u ON u.user_id = a.appo_doctor_id
    JOIN tbl_user_details ud ON u.user_id = ud.user_id
    JOIN tbl_opd_bills ob ON ob.bill_appointment_id = a.appo_id
    WHERE 
        a.appo_id = p_appointment_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetAppointmentDatewise` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAppointmentDatewise`(
    IN p_appo_date INT  
)
BEGIN
    SELECT 
        u.user_name AS Name,
        u.user_id AS User_ID, 
        a.appo_id AS Appo_id,
        a.appo_disease AS disease,
        a.appo_status,
        p.patient_id,
        p.patient_name,
        p.patient_image,
        p.patient_age,
        p.patient_sex,
        p.uh_id,
        a.appo_biil_status,
        a.appo_date,
        ud.consultancy_fee
    FROM tbl_appointment a
    JOIN tbl_patient p ON a.appo_patient_id = p.patient_id
    JOIN tbl_users u ON u.user_id = a.appo_doctor_id
    JOIN tbl_user_details ud ON u.user_id = ud.user_id
    WHERE 
        a.appo_date >= p_appo_date - (p_appo_date % 86400)  -- Start of the day (00:00:00)
        AND a.appo_date < (p_appo_date - (p_appo_date % 86400)) + 86400;  -- End of the day (23:59:59)
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetAppointmentMonthwise` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAppointmentMonthwise`(
    IN p_user_id INT
)
BEGIN
    IF EXISTS (
        SELECT 1 
        FROM tbl_appointment 
        WHERE appo_doctor_id = p_user_id
    ) THEN
        SELECT 
            YEAR(FROM_UNIXTIME(appo_date)) AS year,
            DATE_FORMAT(FROM_UNIXTIME(appo_date), '%b') AS month,
            COUNT(*) AS total_appointments
        FROM 
            tbl_appointment
        WHERE 
            appo_doctor_id = p_user_id
        GROUP BY 
            YEAR(FROM_UNIXTIME(appo_date)), 
            DATE_FORMAT(FROM_UNIXTIME(appo_date), '%b')
        ORDER BY 
            year, STR_TO_DATE(month, '%b');
    ELSE
        SELECT 'No data found' AS message;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetAppointmentMonthwiseAdmin` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAppointmentMonthwiseAdmin`(
)
BEGIN
    IF EXISTS (
        SELECT 1 
        FROM tbl_appointment 
    ) THEN
        SELECT 
            YEAR(FROM_UNIXTIME(appo_date)) AS year,
            DATE_FORMAT(FROM_UNIXTIME(appo_date), '%b') AS month,
            COUNT(*) AS total_appointments
        FROM 
            tbl_appointment
        WHERE 
            appo_doctor_id = p_user_id
        GROUP BY 
            YEAR(FROM_UNIXTIME(appo_date)), 
            DATE_FORMAT(FROM_UNIXTIME(appo_date), '%b')
        ORDER BY 
            year, STR_TO_DATE(month, '%b');
    ELSE
        SELECT 'No data found' AS message;
    END IF;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetAppointmentsDetails` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAppointmentsDetails`(
    IN p_appoi_id INT
)
BEGIN
    SELECT 
        a.appo_id AS Appointment_Id,
        a.appo_patient_source AS Appointment_Source,
        a.appo_date AS Appointment_Date,  
        a.appo_status AS Appointment_Status,   
        a.appo_reason AS Consultant_Reason,
	    a.appo_disease AS disease,
        a.appo_biil_status AS payment_status,
        p.uh_id,
        p.patient_id AS Patient_Id,
        p.patient_name AS Patient_Name,
        p.patient_age AS Patient_Age,
		p.patient_city AS Patient_city,
        p.patient_sex AS Patient_Sex,
		p.patient_phone_no AS patient_phone,
		p.created_at AS RegisterDate,
        p.patient_image AS Patient_Photo,
        u.user_name AS Doctor_Name,
        ud.consultancy_fee,
        s.slot_time
    FROM tbl_appointment a
    JOIN tbl_patient p ON p.patient_id = a.appo_patient_id
    JOIN tbl_users u ON a.appo_doctor_id = u.user_id
    JOIN tbl_user_details ud ON ud.user_id = u.user_id
	left JOIN tbl_doctor_availability da ON da.doc_ava_id = a.appo_shift_slot_id
	left JOIN tbl_slot_shift ss ON da.doc_ava_slot_shift_id = ss.slot_shift_id
	left JOIN tbl_slot s ON s.slot_id = ss.slot_id
    WHERE a.appo_id = p_appoi_id ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetAppointmentsDoctorwise` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAppointmentsDoctorwise`(
    IN p_doctor_id INT,
    IN p_date BIGINT -- Assuming `appo_date` is of type DATE
)
BEGIN
    SELECT 
        a.appo_id AS Appointment_Id,
        a.appo_patient_source AS Appointment_Source,
        a.appo_date AS Appointment_Date,  
        a.appo_status AS Appointment_Status,   
        a.appo_reason AS Consultant_Reason,
        a.appo_disease As Disease,
        p.patient_id AS Patient_Id,
        p.patient_name AS Patient_Name,
        p.patient_age AS Patient_Age,
        p.patient_sex AS Patient_Sex,
        p.patient_image AS Patient_Photo,
        p.patient_proof_image as document,
        u.user_name AS Doctor_Name,
        s.slot_time,
        a.appo_time
    FROM tbl_appointment a
    LEFT JOIN tbl_patient p ON p.patient_id = a.appo_patient_id
    LEFT JOIN tbl_users u ON a.appo_doctor_id = u.user_id
    LEFT JOIN tbl_doctor_availability da ON da.doc_ava_id = a.appo_shift_slot_id
    LEFT JOIN tbl_slot_shift ss ON da.doc_ava_slot_shift_id = ss.slot_shift_id
    LEFT JOIN tbl_slot s ON s.slot_id = ss.slot_id
    WHERE a.appo_doctor_id = p_doctor_id 
    AND  a.appo_date = p_date;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetAvailableBedByRoomType` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAvailableBedByRoomType`(
    IN p_room_type INT,
    IN p_date BIGINT
)
BEGIN
    SELECT 
        b.bed_id,
        b.room_id,
        b.bed_status,
        b.bed_name,
        b.bed_soft_status,
        r.room_name,
        r.room_type_id,
        r.max_bed
    FROM 
        tbl_bed b
    JOIN 
        tbl_room r ON b.room_id = r.room_id
    LEFT JOIN 
        tbl_bed_booking bb 
        ON b.bed_id = bb.bed_id 
        AND p_date BETWEEN bb.start_date AND bb.end_date  -- Check if the bed is already booked
    WHERE 
        b.bed_status = 'available'
        AND r.room_type_id = p_room_type
        AND bb.bed_id IS NULL;  -- Ensure bed is NOT booked within the date range
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetBedInfo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetBedInfo`(
    IN p_page_no INT,
    IN p_page_size INT
)
BEGIN
    DECLARE v_offset INT;
    DECLARE v_total_count INT;
    DECLARE v_total_pages INT;

    -- Get the total count of matching records
    SELECT COUNT(*) INTO v_total_count
    FROM tbl_room_type rt
    JOIN tbl_room r ON r.room_type_id = rt.room_type_id
    JOIN tbl_bed b ON r.room_id = b.room_id
    WHERE r.room_status = 1
      AND b.bed_soft_status = 1;

    -- If page number or page size is NULL, return all data
    IF p_page_no IS NULL OR p_page_size IS NULL OR p_page_size = 0 THEN
        -- Return all bed records without pagination
        SELECT 
            r.room_id,
            r.room_name,
            rt.room_type,
            rt.room_type_id,
            b.bed_id,
            b.bed_name,
            b.bed_status
        FROM tbl_room_type rt
        LEFT JOIN tbl_room r ON r.room_type_id = rt.room_type_id
        LEFT JOIN tbl_bed b ON r.room_id = b.room_id
        WHERE r.room_status = 1
          AND b.bed_soft_status = 1;

        -- Return pagination metadata
        SELECT v_total_count AS total_records, 1 AS total_pages, 1 AS current_page;
    ELSE
        -- Calculate offset for pagination
        SET v_offset = (p_page_no - 1) * p_page_size;
        SET v_total_pages = CEIL(v_total_count / p_page_size);

        -- Return paginated bed records
        SELECT 
            r.room_id,
            r.room_name,
            rt.room_type,
            rt.room_type_id,
            b.bed_id,
            b.bed_name,
            b.bed_status
        FROM tbl_room_type rt
        LEFT JOIN tbl_room r ON r.room_type_id = rt.room_type_id
        LEFT JOIN tbl_bed b ON r.room_id = b.room_id
        WHERE r.room_status = 1
          AND b.bed_soft_status = 1
        LIMIT v_offset, p_page_size;

        -- Return pagination metadata
        SELECT v_total_count AS total_records, v_total_pages AS total_pages, p_page_no AS current_page;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetBedRoomTypeWise` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetBedRoomTypeWise`(
    IN p_room_type_id INT,
    IN p_page_no INT,
    IN p_page_size INT
)
BEGIN
    DECLARE v_offset INT;
    DECLARE v_total_count INT;
    DECLARE v_total_pages INT;

    -- Calculate the offset based on page number and page size
    SET v_offset = (p_page_no - 1) * p_page_size;
    
    -- Get the total count of matching records
    SELECT COUNT(*) INTO v_total_count
    FROM tbl_room_type rt
    JOIN tbl_room r ON r.room_type_id = rt.room_type_id
    JOIN tbl_bed b ON r.room_id = b.room_id
    WHERE rt.room_type_id = p_room_type_id
      AND r.room_status = 1
      AND b.bed_soft_status = 1;
    
    -- Calculate total pages using CEIL to round up
    SET v_total_pages = CEIL(v_total_count / p_page_size);
    

    -- Return the paginated bed records
    SELECT 
        r.room_id,
        r.room_name,
        rt.room_type,
        rt.room_type_id,
        b.bed_id,
        b.bed_name,
        b.bed_status
    FROM tbl_room_type rt
    JOIN tbl_room r ON r.room_type_id = rt.room_type_id
    JOIN tbl_bed b ON r.room_id = b.room_id
    WHERE rt.room_type_id = p_room_type_id
      AND r.room_status = 1
      AND b.bed_soft_status = 1
    LIMIT v_offset, p_page_size;
    
    
    
        -- Return pagination metadata: total records, total pages, and current page
    SELECT v_total_count AS total_records, v_total_pages AS total_pages, p_page_no AS current_page;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetCompletedAppointmentDatewise` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetCompletedAppointmentDatewise`(
    IN p_appo_date BIGINT  
)
BEGIN
    SELECT 
        u.user_name AS doctor_name,
        u.user_id AS doctor_id, 
        a.appo_id AS Appo_id,
        a.appo_disease AS disease,
        a.appo_status,
        p.patient_id,
        p.patient_name,
        p.patient_image,
        p.patient_age,
        p.patient_sex,
        p.uh_id,
        a.appo_biil_status,
        a.appo_date,
        ud.consultancy_fee,
        ob.receipt_number,
        ob.bill_date,
        ob.bill_total_amount,
        ob.bill_report,
        -- Ensure chargesList is always a valid JSON array
        IFNULL(
            (
                SELECT JSON_ARRAYAGG(
                    JSON_OBJECT(
                        'chargeId', obf.opd_bill_fees_id,
                        'billingType', f.fees_name,
                        'amount', f.fees_amount,
                        'quantity', obf.quantity,
                        'total', obf.total_fee
                    )
                )
                FROM tbl_opd_bill_fees obf
                JOIN tbl_fees f ON obf.fees_id = f.fees_id
                WHERE obf.opd_bill_id = ob.bill_appointment_id
            ),
            '[]' -- Empty array as a JSON string if no data
        ) AS chargesList

    FROM tbl_appointment a
    JOIN tbl_patient p ON a.appo_patient_id = p.patient_id
    JOIN tbl_users u ON u.user_id = a.appo_doctor_id
    JOIN tbl_user_details ud ON u.user_id = ud.user_id
    JOIN tbl_opd_bills ob ON ob.bill_appointment_id = a.appo_id
    WHERE 
        a.appo_date = p_appo_date 
        AND a.appo_status = 'Completed';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetDepartmentwiseSatff` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetDepartmentwiseSatff`(
    IN p_dep_id INT,
    IN p_page INT,
    IN p_page_size INT
)
BEGIN
    DECLARE v_offset INT;
    DECLARE v_total_staff INT;
    DECLARE v_total_pages INT;
    
    -- Calculate offset for pagination
    SET v_offset = (p_page - 1) * p_page_size;
    SELECT COUNT(*) INTO v_total_staff 
    FROM tbl_users 
    WHERE 
     user_status = 1 
      AND user_department_id = p_dep_id;
    -- Calculate total pages
    SET v_total_pages = CEIL(v_total_staff / p_page_size);

    IF v_total_staff = 0 THEN
        SELECT NULL AS Name, NULL AS User_ID, NULL AS Photo, NULL AS Department_name  LIMIT 0;
    ELSE
        SELECT 
            u.user_name AS Name,
            u.user_id AS User_ID,
            u.user_photo AS Photo,     
            d.department_name AS Department_name,
            d.department_id,
            ud.joining_date,
			r.role_name
        FROM tbl_users u
        JOIN tbl_department d ON d.department_id = u.user_department_id
		JOIN tbl_role r ON r.role_id = u.user_role_id
	    JOIN tbl_user_details ud ON u.user_id = u.user_id
        WHERE u.user_status = 1 
          AND u.user_department_id = p_dep_id
        LIMIT p_page_size OFFSET v_offset;
    END IF;
    -- Return pagination details separately
    SELECT 
        v_total_staff AS TotalRecords,
        v_total_pages AS TotalPages,
        p_page AS CurrentPage,
        p_page_size AS LimitPerPage;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetDoctorOPDPatients` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetDoctorOPDPatients`(
    IN p_page INT,
    IN p_page_size INT,
    IN p_doctor_id INT
)
BEGIN
    DECLARE v_offset INT DEFAULT 0;
    DECLARE v_total_patients INT;
    DECLARE v_total_pages INT;
 
    -- Get total number of scheduled patients
    SELECT COUNT(DISTINCT p.patient_id) INTO v_total_patients 
    FROM tbl_patient p
    JOIN tbl_appointment a ON p.patient_id = a.appo_patient_id
    WHERE p.patient_status = 1 AND a.appo_status = 'Scheduled';
 
    -- If page and page size are NULL or 0, fetch all records
    IF p_page IS NULL OR p_page_size IS NULL OR p_page = 0 OR p_page_size = 0 THEN
        -- Fetch all patients without pagination
        SELECT 
            p.patient_name AS Name,
            p.patient_id AS Patient_ID,
            p.patient_image AS Photo,
            p.uh_id,
            p.patient_sex,
            p.patient_age,
            p.created_at,
            JSON_ARRAYAGG(
                JSON_OBJECT(
                    'appointment_date', a.appo_date,
                    'doctor_id', a.appo_doctor_id,
                    'doctor_name', u.user_name,
                    'reason', a.appo_reason,
                    'appointment_time', s.slot_time,
                    'source', a.appo_patient_source
                )
            ) AS appointments
        FROM tbl_patient p
        JOIN tbl_appointment a ON p.patient_id = a.appo_patient_id
        JOIN tbl_users u ON a.appo_doctor_id = u.user_id
        LEFT JOIN tbl_doctor_availability da ON a.appo_shift_slot_id = da.doc_ava_id
        LEFT JOIN tbl_slot_shift ss ON da.doc_ava_slot_shift_id = ss.slot_shift_id
        LEFT JOIN tbl_slot as s ON ss.slot_id = s.slot_id
        WHERE p.patient_status = 1 AND a.appo_status = 'Scheduled' AND a.appo_doctor_id = p_doctor_id
        GROUP BY p.patient_id;
    ELSE
        -- Calculate offset for pagination
        SET v_offset = (p_page - 1) * p_page_size;
        -- Calculate total pages
        SET v_total_pages = CEIL(v_total_patients / p_page_size);
        -- Fetch paginated list of patients
        SELECT 
            p.patient_name AS Name,
            p.patient_id AS Patient_ID,
            p.patient_image AS Photo,  
            p.uh_id,
            p.patient_sex,
            p.patient_age,
            p.created_at,
            JSON_ARRAYAGG(
                JSON_OBJECT(
                    'appointment_date', a.appo_date,
                    'doctor_id', a.appo_doctor_id,
                    'doctor_name', u.user_name,
                    'reason', a.appo_reason,
                    'appointment_time', s.slot_time,
                    'source', a.appo_patient_source
                )
            ) AS appointments
        FROM tbl_patient p
        JOIN tbl_appointment a ON p.patient_id = a.appo_patient_id
        JOIN tbl_users u ON a.appo_doctor_id = u.user_id
        LEFT JOIN tbl_doctor_availability da ON a.appo_shift_slot_id = da.doc_ava_id
        LEFT JOIN tbl_slot_shift ss ON da.doc_ava_slot_shift_id = ss.slot_shift_id
        LEFT JOIN tbl_slot as s ON ss.slot_id = s.slot_id
        WHERE p.patient_status = 1 AND a.appo_status = 'Scheduled' AND a.appo_doctor_id = p_doctor_id
        GROUP BY p.patient_id
        LIMIT p_page_size OFFSET v_offset;
 
        -- Return pagination details separately
        SELECT 
            v_total_patients AS TotalRecords,
            v_total_pages AS TotalPages,
            p_page AS CurrentPage,
            p_page_size AS LimitPerPage;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetDoctorPatientCount` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetDoctorPatientCount`(
    IN p_doctor_id INT
)
BEGIN
    SELECT
        COUNT(*) AS totalCount,
        (SELECT COUNT(*) FROM tbl_appointment a 
         INNER JOIN tbl_patient p ON p.patient_id = a.appo_patient_id 
         WHERE p.patient_status = 1 
         AND a.appo_status = "Scheduled"
         AND a.appo_doctor_id = p_doctor_id) AS appointmentCount,
        (SELECT COUNT(*) FROM tbl_admitted_patient ap 
         INNER JOIN tbl_patient p ON p.uh_id = ap.uh_id 
         WHERE p.patient_status = 1 
         AND ap.status = 1) AS admittedCount
    FROM tbl_patient p
    WHERE p.patient_status = 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetDoctorsAvailableSlot` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetDoctorsAvailableSlot`(
    IN p_doctor_id INT,
    IN p_date BIGINT,
    IN p_day INT
)
BEGIN
           SELECT 
        av.doc_ava_id as Doc_ava_id,
        av.doc_ava_slot_shift_id as slot_shift_id,
        ss.slot_id as SlotId,
        ss.shift_id,
        s.slot_time as SlotName
    FROM tbl_doctor_availability av
    JOIN tbl_slot_shift ss ON ss.slot_shift_id = av.doc_ava_slot_shift_id
    JOIN tbl_slot s ON s.slot_id = ss.slot_id
    LEFT JOIN tbl_appointment a 
        ON av.doc_ava_id = a.appo_shift_slot_id 
        AND a.appo_doctor_id = p_doctor_id
        AND a.appo_date = p_date
    WHERE av.doc_ava_user_id = p_doctor_id 
          AND av.doc_ava_day_id = p_day
          AND a.appo_shift_slot_id IS NULL; -- Ensures the slot is not booked
 
 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetDoctorsDateAppointments` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetDoctorsDateAppointments`(
    IN p_doctor_id INT,
    IN p_appointment_date bigint,
    IN p_page INT,
    IN p_page_size INT
)
BEGIN
    DECLARE offset_val INT;
    SET offset_val = (p_page - 1) * p_page_size;
    -- Fetch doctor details
    SELECT 
        u.user_name AS doctor_name,
        u.user_photo as doctor_photo,
        e.specialization AS specialization,
        s.shift_time AS doctor_time
    INTO @doctor_name, @doctor_photo, @specialization, @doctor_time 
    FROM tbl_users u
    LEFT JOIN tbl_education e ON u.user_id = e.user_id
    LEFT JOIN tbl_doctor_availability av ON u.user_id = av.doc_ava_user_id
    LEFT JOIN tbl_slot_shift ss ON av.doc_ava_slot_shift_id = ss.slot_shift_id
    LEFT JOIN tbl_shift s ON ss.shift_id = s.shift_id
    WHERE u.user_id = p_doctor_id
    LIMIT 1;
    -- Fetch total appointment count for the doctor on the given date
    SELECT COUNT(*) INTO @appointments_count
    FROM tbl_appointment
    WHERE appo_doctor_id = p_doctor_id AND appo_date = p_appointment_date;
    -- Fetch patient details with pagination
    DROP TEMPORARY TABLE IF EXISTS temp_patients;
    CREATE TEMPORARY TABLE temp_patients AS
    SELECT 
        p.patient_name AS patient_name,
		p.patient_image AS patient_image,
        p.patient_id AS UH_id,
		p.patient_sex AS sex,
		a.appo_reason AS reason,
        p.patient_age AS age,
        a.appo_id AS appointment_id,
        a.appo_status AS status
    FROM tbl_appointment a
    JOIN tbl_patient p ON a.appo_patient_id = p.patient_id
    WHERE a.appo_doctor_id = p_doctor_id AND a.appo_date = p_appointment_date
    LIMIT p_page_size OFFSET offset_val;
    -- Format the output as JSON
    SELECT JSON_OBJECT(
        'doctor_details', JSON_OBJECT(
            'doctor_name', @doctor_name,
            'doctor_photo', @doctor_photo,
            'specialization', @specialization,
            'appointments_count', @appointments_count,
            'doctor_time', @doctor_time
        ),
        'patients', (SELECT JSON_ARRAYAGG(
            JSON_OBJECT(
				'appointment_id', appointment_id, 
                'patient_name', patient_name,
                'patient_image',patient_image,
                'UH_id', UH_id,
                'sex', sex,
                'reason',reason,
                'age', age,
                'status', status
            )
        ) FROM temp_patients)
    ) AS result;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetDoctorsDepartmentwise` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetDoctorsDepartmentwise`(
    IN p_department_id INT,
    IN p_page INT,
    IN p_page_size INT
)
BEGIN
    DECLARE v_offset INT DEFAULT 0;
    DECLARE v_total_doctors INT;
    DECLARE v_total_pages INT;

    -- If p_page or p_page_size is NULL, return all doctors without pagination
    IF p_page IS NULL OR p_page_size IS NULL THEN
        -- Get all doctors in the department without pagination
        SELECT 
            u.user_name AS Name,
            u.user_id AS User_ID,
            u.user_photo AS Photo,     
            d.department_name AS Department_name,
            d.department_id,
            ud.joining_date
        FROM tbl_users u
        JOIN tbl_department d ON d.department_id = u.user_department_id
        JOIN tbl_user_details ud ON ud.user_id = u.user_id
        WHERE u.user_status = 1 
          AND u.user_department_id = p_department_id
          AND u.user_role_id = 2;

    ELSE
        -- Calculate offset for pagination
        SET v_offset = (p_page - 1) * p_page_size;

        -- Get total number of doctors in the department
        SELECT COUNT(*) INTO v_total_doctors 
        FROM tbl_users 
        WHERE user_department_id = p_department_id 
          AND user_status = 1 
          AND user_role_id = 2;

        -- Calculate total pages
        SET v_total_pages = CEIL(v_total_doctors / p_page_size);

        -- Check if there are doctors, if not, return an empty result set
        IF v_total_doctors = 0 THEN
            SELECT NULL AS Name, NULL AS User_ID, NULL AS Photo, NULL AS Department_name LIMIT 0;
        ELSE
            -- Fetch paginated list of doctors
            SELECT 
                u.user_name AS Name,
                u.user_id AS User_ID,
                u.user_photo AS Photo,     
                d.department_name AS Department_name,
                d.department_id,
                ud.joining_date
            FROM tbl_users u
            JOIN tbl_department d ON d.department_id = u.user_department_id
            JOIN tbl_user_details ud ON ud.user_id = u.user_id
            WHERE u.user_status = 1 
              AND u.user_department_id = p_department_id
              AND u.user_role_id = 2 
            LIMIT p_page_size OFFSET v_offset;
        END IF;

        -- Return pagination details separately
        SELECT 
            v_total_doctors AS TotalRecords,
            v_total_pages AS TotalPages,
            p_page AS CurrentPage,
            p_page_size AS LimitPerPage;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetDoctorslot` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetDoctorslot`(
    IN p_doc_ava_user_id INT,
    IN p_doc_ava_day_id INT
)
BEGIN
    SELECT 
        s.slot_id AS SlotId,
        s.slot_time AS SlotName,
        da.doc_ava_id as Doc_ava_id
    FROM tbl_doctor_availability da
    JOIN tbl_slot_shift ss ON da.doc_ava_slot_shift_id = ss.slot_shift_id
    JOIN tbl_slot s ON ss.slot_id = s.slot_id
    WHERE da.doc_ava_status = 0
      AND da.doc_ava_user_id = p_doc_ava_user_id
      AND da.doc_ava_day_id = p_doc_ava_day_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetDoctorsWithTodayAppointments` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetDoctorsWithTodayAppointments`(IN p_appointment_date BIGINT)
BEGIN
 
    SELECT DISTINCT
        u.user_id AS Doctor_Id,
        u.user_photo AS Doctor_photo,
        u.user_name AS Doctor_Name,
        u.user_email AS Doctor_Email,
        e.specialization AS specialization,
		e.degree AS degree,
        ud.joining_date AS joiningDate,
        s.shift_name AS Shift_Name,
        s.shift_time AS Doctor_Time
    FROM tbl_appointment a
    JOIN tbl_users u ON a.appo_doctor_id = u.user_id
    JOIN tbl_education e ON u.user_id = e.user_id
    JOIN tbl_user_details ud ON u.user_id = ud.user_id
JOIN tbl_doctor_availability av ON u.user_id = av.doc_ava_user_id
  JOIN tbl_slot_shift ss ON av.doc_ava_slot_shift_id = ss.slot_shift_id
  JOIN tbl_shift s ON ss.shift_id = s.shift_id
    WHERE a.appo_date = p_appointment_date; -- Fetch only doctors having appointments today
 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetIpdAppointmentsDetails` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetIpdAppointmentsDetails`(
    IN p_admited_id INT
)
BEGIN
    SELECT 
        ad.admitted_patient_id AS Admited_Id,
        ad.reference_doctor AS Admited_Source,
        ad.admit_time AS Admited_Date,  
        p.uh_id,
        p.patient_id AS Patient_Id,
        p.patient_name AS Patient_Name,
        p.patient_age AS Patient_Age,
		p.patient_city AS Patient_city,
        p.patient_sex AS Patient_Sex,
		p.patient_phone_no AS patient_phone,
        p.patient_image AS Patient_Photo,
        u.user_name AS Doctor_Name
    FROM `tbl_admitted_patient` ad
    JOIN tbl_patient p ON p.uh_id = ad.uh_id
    JOIN tbl_users u ON ad.doctor_id = u.user_id
    JOIN tbl_user_details ud ON ud.user_id = u.user_id
    WHERE ad.admitted_patient_id = p_admited_id ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetIpdChargesOfpatient` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetIpdChargesOfpatient`(
    IN p_admited_id INT
)
BEGIN
        SELECT 
	        ic.*,
            f.fees_name,
            f.fees_amount
        FROM tbl_ipd_charges ic
        LEFT JOIN tbl_fees f ON ic.charge_id = f.fees_id
        WHERE ic.admited_id = p_admited_id;
          

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetIpdDoctorVisitAdmitedidwise` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetIpdDoctorVisitAdmitedidwise`(
    IN p_admitted_id INT
)
BEGIN
    SELECT 
        idv.*,             
        u.user_name        
    FROM 
        tbl_ipd_doctor_visits idv
    JOIN 
        tbl_users u 
        ON u.user_id = idv.ipd_doctor_id
    WHERE 
        idv.admited_id = p_admitted_id;  
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetIPDPrescription` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetIPDPrescription`(
    IN p_ipd_id VARCHAR(45)
)
BEGIN
    SELECT 
        p.ipd_prescription_id AS Prescription_Id,
        p.medicine_name AS medicine_name,
        p.medicine_type AS medicine_type,
        p.dosage AS dosage,  
        p.days AS days,   
        p.frequency AS frequency,
        p.medicine_quantity AS quantity,
        p.common_note AS common_note
    FROM tbl_ipd_prescription p
    WHERE p.ipd_id = p_ipd_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetLabAssistantDepartmentwise` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetLabAssistantDepartmentwise`(
    IN p_department_id INT,
    IN p_page INT,
    IN p_page_size INT
)
BEGIN
    DECLARE v_offset INT;
    DECLARE v_total_doctors INT;
    DECLARE v_total_pages INT;
    
    -- Calculate offset for pagination
    SET v_offset = (p_page - 1) * p_page_size;

    -- Get total number of doctors in the department
    SELECT COUNT(*) INTO v_total_doctors 
    FROM tbl_users 
    WHERE user_department_id = p_department_id 
      AND user_status = 1 
      AND user_role_id = 3;

    SET v_total_pages = CEIL(v_total_doctors / p_page_size);

    IF v_total_doctors = 0 THEN
        SELECT NULL AS Name, NULL AS User_ID, NULL AS Photo, NULL AS Department_name  LIMIT 0;
    ELSE
        -- Fetch paginated list of doctors
        SELECT distinct
            u.user_name AS Name,
            u.user_id AS User_ID,
            u.user_photo AS Photo, 
		    FROM_UNIXTIME(ud.joining_date) as JoningDate,
            d.department_name AS Department_name,
            d.department_id,
			s.shift_name
        FROM tbl_users u
		left JOIN tbl_user_details ud ON ud.user_id = u.user_id
		left JOIN tbl_rec_lab_avaibility ra ON ra.rec_lab_ava_user_id = u.user_id
		left JOIN tbl_shift s ON ra.rec_lab_ava_slot_shift_id = s.shift_id
        JOIN tbl_department d ON d.department_id = u.user_department_id
        WHERE u.user_status = 1 
          AND u.user_department_id = p_department_id
          AND u.user_role_id = 3 
        LIMIT p_page_size OFFSET v_offset;
    END IF;

    -- Return pagination details separately
    SELECT 
        v_total_doctors AS TotalRecords,
        v_total_pages AS TotalPages,
        p_page AS CurrentPage,
        p_page_size AS LimitPerPage;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetOPDPatients` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetOPDPatients`(
    IN p_page INT,
    IN p_page_size INT,
    In P_date int
)
BEGIN
    DECLARE v_offset INT DEFAULT 0;
    DECLARE v_total_patients INT;
    DECLARE v_total_pages INT;
 
    -- Get total number of scheduled patients
    SELECT COUNT(DISTINCT p.patient_id) INTO v_total_patients 
    FROM tbl_patient p
    JOIN tbl_appointment a ON p.patient_id = a.appo_patient_id
    WHERE p.patient_status = 1 AND a.appo_status = 'Scheduled' AND a.appo_date >= P_date ;
 
    -- If page and page size are NULL or 0, fetch all records
    IF p_page IS NULL OR p_page_size IS NULL OR p_page = 0 OR p_page_size = 0 THEN
        -- Fetch all patients without pagination
SELECT 
    p.patient_name,
    p.patient_id,
    p.patient_image,  
    p.uh_id,
    p.patient_sex,
    p.patient_age,
    p.created_at,
    a.appo_doctor_id,
    a.appo_date,
    a.appo_status,
    a.appo_reason,
	a.appo_time,
    a.appo_patient_source,
    s.slot_time,
    u.user_name
FROM tbl_appointment a
LEFT JOIN tbl_patient p ON p.patient_id = a.appo_patient_id
LEFT JOIN tbl_users u ON a.appo_doctor_id = u.user_id
LEFT JOIN tbl_doctor_availability da ON a.appo_shift_slot_id = da.doc_ava_id
LEFT JOIN tbl_slot_shift ss ON da.doc_ava_slot_shift_id = ss.slot_shift_id
LEFT JOIN tbl_slot s ON ss.slot_id = s.slot_id
WHERE p.patient_status = 1 and a.appo_status = 'Scheduled' 
AND a.appo_date >= P_date; 
    ELSE
        -- Calculate offset for pagination
        SET v_offset = (p_page - 1) * p_page_size;
        -- Calculate total pages
        SET v_total_pages = CEIL(v_total_patients / p_page_size);
        -- Fetch paginated list of patients
  SELECT 
    p.patient_name,
    p.patient_id,
    p.patient_image,  
    p.uh_id,
    p.patient_sex,
    p.patient_age,
    p.created_at,
    a.appo_doctor_id,
    a.appo_date,
    a.appo_status,
    a.appo_reason,
	a.appo_time,
    a.appo_patient_source,
    s.slot_time, u.user_name
FROM tbl_appointment a
LEFT JOIN tbl_patient p ON p.patient_id = a.appo_patient_id
LEFT JOIN tbl_users u ON a.appo_doctor_id = u.user_id
LEFT JOIN tbl_doctor_availability da ON a.appo_shift_slot_id = da.doc_ava_id
LEFT JOIN tbl_slot_shift ss ON da.doc_ava_slot_shift_id = ss.slot_shift_id
LEFT JOIN tbl_slot s ON ss.slot_id = s.slot_id
WHERE p.patient_status = 1 and a.appo_status = 'Scheduled' 
AND a.appo_date >= P_date
        LIMIT p_page_size OFFSET v_offset;
 
        -- Return pagination details separately
        SELECT 
            v_total_patients AS TotalRecords,
            v_total_pages AS TotalPages,
            p_page AS CurrentPage,
            p_page_size AS LimitPerPage;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetPatientCount` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetPatientCount`()
BEGIN
    DECLARE today_date BIGINT;
    SET today_date = UNIX_TIMESTAMP(CURDATE());
    
    SELECT
        (SELECT COUNT(*) FROM tbl_patient WHERE patient_status = 1) AS totalCount,
        (SELECT COUNT(*) 
         FROM tbl_appointment a 
         INNER JOIN tbl_patient p ON p.patient_id = a.appo_patient_id 
         WHERE p.patient_status = 1 
         AND a.appo_status = 'Scheduled' 
         AND a.appo_date >= today_date) AS appointmentCount,
        (SELECT COUNT(*) 
         FROM tbl_admitted_patient ap 
         INNER JOIN tbl_patient p ON p.uh_id = ap.uh_id 
         WHERE p.patient_status = 1 
         AND ap.status = 1) AS admittedCount;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetPatientDischargeSummeryDetails` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetPatientDischargeSummeryDetails`(
    IN p_ipd_id bigint
)
BEGIN
    DECLARE admited_id INT;  -- Added semicolon and fixed spelling

    -- Fixed syntax for SELECT INTO and added table name
    SELECT admitted_patient_id 
    INTO admited_id 
    FROM tbl_admitted_patient 
    WHERE ipd_id = p_ipd_id;

    SELECT 
        pa.uh_id,
        pa.ipd_id,
        p.patient_name,
        p.patient_age,
        pa.admitted_date,
        pd.diagnosis,
        pd.chief_complaints,
        pd.signs,
        pd.temprature,
        pd.pulse,
        pd.blood_pressure,
        pd.respiratory_rate,
        pd.cvs,
        pd.rs,
        pd.pa,
        pd.cns,
        pd.local_examination,
        pd.past_history,
        pd.discharge_advice,
        pd.discharge_date_time,
        u.user_name AS doctor_name,
        d.department_name AS department,
        c.course_details,
        pd.follow_up_date_time,
		(
            SELECT JSON_ARRAYAGG(
                JSON_OBJECT(
                    'treatment_id', t.id,
                    'treatment_point', t.point_text
                )
            )
            FROM tbl_treatment_points t
            WHERE t.admit_id = pa.admitted_patient_id
        ) AS treatment_point

    FROM tbl_admitted_patient pa
    JOIN tbl_discharge_detail pd ON pd.ipd_id = pa.ipd_id
	left JOIN tbl_courses c ON c.admit_id = pa.admitted_patient_id
    JOIN tbl_patient p ON p.uh_id = pa.uh_id
    JOIN tbl_users u ON u.user_id = pa.doctor_id
    JOIN tbl_department d ON pa.department_id = d.department_id
    WHERE pa.admitted_patient_id = admited_id;  -- Using the variable instead of p_ipd_id directly
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetPatientType` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetPatientType`()
BEGIN
    SELECT * FROM tbl_patient_type;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetPrescriptionTest` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetPrescriptionTest`(
    IN p_appoi_id INT
)
BEGIN
    -- First result set: Prescription details from tbl_appointment
    SELECT 
        p.prescription_id AS Prescription_Id,
        p.medicine_name AS medicine_name,
        p.medicine_type AS medicine_type,
        p.dosage AS dosage,  
        p.days AS days,   
        p.frequency AS frequency,
        p.medicine_quantity AS quantity,
        p.common_note AS common_note
    FROM tbl_prescription p
    WHERE p.appointment_id = p_appoi_id;
    -- Second result set: Lab Test details from tbl_labtest joined with tbl_test
    SELECT 
        lt.lab_id AS lab_id,
        t.test_id AS TestId,
        t.test_name AS TestName
    FROM tbl_labtest lt
    LEFT JOIN tbl_test t ON lt.lab_test_id = t.test_id
    WHERE lt.lab_appoi_id = p_appoi_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetReceptionistDepartmentwise` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetReceptionistDepartmentwise`(
    IN p_department_id INT,
    IN p_page INT,
    IN p_page_size INT
)
BEGIN
    DECLARE v_offset INT;
    DECLARE v_total_doctors INT;
    DECLARE v_total_pages INT;

    -- Calculate offset for pagination
    SET v_offset = (p_page - 1) * p_page_size;

    -- Get total number of doctors in the department
    SELECT COUNT(*) INTO v_total_doctors 
    FROM tbl_users 
    WHERE user_department_id = p_department_id 
      AND user_status = 1 
      AND user_role_id = 4;
    SET v_total_pages = CEIL(v_total_doctors / p_page_size);
    IF v_total_doctors = 0 THEN
        SELECT NULL AS Name, NULL AS User_ID, NULL AS Photo, NULL AS Department_name  LIMIT 0;
    ELSE
        -- Fetch paginated list of doctors
        SELECT distinct 
            u.user_name AS Name,
            u.user_id AS User_ID,
            u.user_photo AS Photo, 
            FROM_UNIXTIME(ud.joining_date) as joining_date,
            d.department_name AS Department_name,
            d.department_id,
            s.shift_name
        FROM tbl_users u
		JOIN tbl_user_details ud ON ud.user_id = u.user_id
		JOIN tbl_rec_lab_avaibility ra ON ra.rec_lab_ava_user_id = u.user_id
		JOIN tbl_shift s ON ra.rec_lab_ava_slot_shift_id = s.shift_id

        JOIN tbl_department d ON d.department_id = u.user_department_id
        WHERE u.user_status = 1 
          AND u.user_department_id = p_department_id
          AND u.user_role_id = 4 
        LIMIT p_page_size OFFSET v_offset;
    END IF;
    SELECT 
        v_total_doctors AS TotalRecords,
        v_total_pages AS TotalPages,
        p_page AS CurrentPage,
        p_page_size AS LimitPerPage;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetRoomBedCount` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetRoomBedCount`()
BEGIN
    SELECT 'TotalRooms' AS metric, COUNT(*) AS count FROM tbl_room WHERE room_status = 1
    UNION ALL
    SELECT 'Total Beds', COUNT(*) FROM tbl_bed WHERE bed_soft_status = 1
    UNION ALL
    SELECT 'OccupiedBeds', COUNT(*) FROM tbl_bed WHERE bed_status = 'occupied' AND bed_soft_status = 1
    UNION ALL
    SELECT 'AvailableBeds', COUNT(*) FROM tbl_bed WHERE bed_status = 'available' AND bed_soft_status = 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetRooms` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetRooms`()
BEGIN
    SELECT 
        r.*,  -- Select all columns from tbl_room
        rt.*  -- Select all columns from tbl_room_type
    FROM tbl_room AS r
    JOIN tbl_room_type AS rt ON r.room_type_id = rt.room_type_id
    WHERE r.room_status = 1;  -- Filter only active rooms
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetTodayDischargepatient` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetTodayDischargepatient`(
    IN p_date BIGINT
)
BEGIN
    SELECT 
        p.patient_name AS Name,
        p.patient_id AS Patient_ID,
        p.patient_image AS Photo,
        p.patient_sex,
        ap.ipd_id,
        ap.doctor_id,
        u.user_name AS doctor_name,
        ap.admitted_date,
        ap.department_id,
        d.department_name AS department,
        ap.discharge_date,
        ap.admitted_patient_id,
        ap.bill_status,
		ap.discharge_status,
        ib.bill_report,
        ib.bill_date
    FROM tbl_patient p
    INNER JOIN tbl_admitted_patient ap ON p.uh_id = ap.uh_id
    JOIN tbl_users u ON ap.doctor_id = u.user_id
    JOIN tbl_department d ON d.department_id = ap.department_id
	left JOIN tbl_ipd_bills ib ON ib.bill_admit_id = ap.admitted_patient_id
    LEFT JOIN tbl_ipd_deposite dp ON dp.admited_id = ap.admitted_patient_id
    WHERE  ap.discharge_date >= p_date
        AND ap.discharge_date < (p_date + 86400) -- 86400 seconds = 1 day
    GROUP BY p.patient_name, p.patient_id, p.patient_image, p.uh_id, 
             ap.ipd_id, ap.doctor_id, u.user_name, 
             ap.admitted_date, ap.approx_discharge_date, ap.department_id, 
             d.department_name, ap.occupation, ap.discharge_date,
             ap.admitted_patient_id,ib.bill_report,
        ib.bill_date;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetTodayIpdAppointments` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetTodayIpdAppointments`()
BEGIN
    DECLARE current_epoch BIGINT;
    -- Get current epoch time (Unix timestamp)
    SET current_epoch = UNIX_TIMESTAMP(CURDATE());
    SELECT 
        ilt.ipd_lab_id,
        t.test_id,
        t.test_id,
        p.patient_id,
		p.uh_id,
        p.patient_name,
	    p.patient_image,
        p.patient_sex,
        p.patient_age,
        ilt.status,
        FROM_UNIXTIME(ilt.recommendation_date) AS RecommendationDate, 
        ad.admitted_patient_id,
		u.user_name as Doctor_name,
		r.rep_ipd_photo as report_photo,
        t.test_name
    FROM tbl_ipd_lab ilt
    JOIN tbl_test t ON ilt.test_id = t.test_id
    JOIN tbl_admitted_patient ad ON ilt.admited_id = ad.admitted_patient_id
    JOIN tbl_patient p ON p.uh_id = ad.uh_id
	left JOIN tbl_ipd_report r ON r.rep_labtest_id = ilt.ipd_lab_id
	JOIN tbl_users u ON ad.doctor_id = u.user_id; 
    


    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetTodayIpdLabAppointment` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetTodayIpdLabAppointment`(IN p_test_id Int)
BEGIN
    DECLARE current_epoch BIGINT;
    -- Get current epoch time (Unix timestamp)
    SET current_epoch = UNIX_TIMESTAMP(CURDATE());
    SELECT 
        ilt.ipd_lab_id,
        t.test_id,
        t.test_description,
        t.test_id,
        p.patient_id,
		p.uh_id,
        p.patient_name,
	    p.patient_image,
        p.patient_sex,
        p.patient_age,
        ilt.status,
        FROM_UNIXTIME(ilt.recommendation_date) AS RecommendationDate, 
        ad.admitted_patient_id,
         u.user_name as Doctor_name,
         r.rep_ipd_photo as report_photo
    FROM tbl_ipd_lab ilt
    JOIN tbl_test t ON ilt.test_id = t.test_id
    JOIN tbl_admitted_patient ad ON ilt.admited_id = ad.admitted_patient_id
    JOIN tbl_patient p ON p.uh_id = ad.uh_id
	left JOIN tbl_ipd_report r ON r.rep_labtest_id = ilt.ipd_lab_id
	JOIN tbl_users u ON ad.doctor_id = u.user_id
    WHERE  t.test_id = p_test_id; 
    
    select t.test_id,
	    t.test_name,
        t.test_description,
        t.test_photo
            FROM tbl_test t
            where t.test_id=p_test_id;

    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetTodayLabAppointment` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetTodayLabAppointment`(IN p_test_id Int)
BEGIN
    DECLARE current_epoch BIGINT;
    -- Get current epoch time (Unix timestamp)
    SET current_epoch = UNIX_TIMESTAMP(CURDATE());
    SELECT 
        lt.lab_id,
        t.test_name,
        t.test_description,
        t.test_id,
        p.patient_id,
        p.uh_id,
        p.patient_name,
	    p.patient_image,
        p.patient_sex,
        p.patient_age,
        lt.lab_test_status,
        FROM_UNIXTIME(lt.lab_date_of_recommendation) AS RecommendationDate, 
        a.appo_id,
        u.user_name AS DoctorName,
        u.user_id AS Doctor_id,
        r.report_photo
    FROM tbl_labtest lt
    JOIN tbl_test t ON lt.lab_test_id = t.test_id
    JOIN tbl_appointment a ON lt.lab_appoi_id = a.appo_id
    JOIN tbl_patient p ON p.patient_id = a.appo_patient_id
    JOIN tbl_users u ON a.appo_doctor_id = u.user_id
	left JOIN tbl_report r ON lt.lab_id = r.report_test_id

    WHERE lt.lab_date_of_recommendation >= current_epoch  and t.test_id=p_test_id; 
    
    
    
    
select t.test_id,
	    t.test_name,
        t.test_description,
        t.test_photo
            FROM tbl_test t
            where t.test_id=p_test_id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetTodayLabAppointmentDashboard` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetTodayLabAppointmentDashboard`()
BEGIN
    DECLARE current_epoch BIGINT;
    SET current_epoch = UNIX_TIMESTAMP(CURDATE());
    SELECT 
        lt.lab_id,
        t.test_name,
        t.test_id,
        p.patient_id,
        p.uh_id,
        p.patient_name,
	    p.patient_image,
        p.patient_sex,
        p.patient_age,
        lt.lab_test_status,
        u.user_name AS DoctorName,
        u.user_id AS Doctor_id,
        t.test_name
    FROM tbl_labtest lt
    JOIN tbl_test t ON lt.lab_test_id = t.test_id
    JOIN tbl_appointment a ON lt.lab_appoi_id = a.appo_id
    JOIN tbl_patient p ON p.patient_id = a.appo_patient_id
    JOIN tbl_users u ON a.appo_doctor_id = u.user_id
	left JOIN tbl_report r ON lt.lab_id = r.report_test_id
    WHERE lt.lab_date_of_recommendation >= current_epoch ; 
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetTodaysAppointments` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetTodaysAppointments`()
BEGIN
    SELECT 
        a.appo_id AS Appointment_Id,
        a.appo_patient_source AS Appointment_Source,
        a.appo_date AS Appointment_Date,  
        a.appo_status AS Appointment_Status,   
        a.appo_reason AS Consultant_Reason,
        p.patient_id AS Patient_Id,
        p.patient_name AS Patient_Name,
        p.patient_age AS Patient_Age,
        p.patient_sex AS Patient_Sex,
        p.patient_image AS Patient_Photo,
        u.user_name AS Doctor_Name
    FROM tbl_appointment a
    JOIN tbl_patient p ON p.patient_id = a.appo_patient_id
    JOIN tbl_users u ON a.appo_doctor_id = u.user_id
    WHERE DATE(a.appo_date) = CURDATE();
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetUserCount` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetUserCount`()
BEGIN
    SELECT
    COUNT(*) AS totalCount,
    SUM(CASE WHEN user_role_id = 2 THEN 1 ELSE 0 END) AS totalDoctors,
	SUM(CASE WHEN user_role_id = 3 THEN 1 ELSE 0 END) AS totalLabAssistance,
	SUM(CASE WHEN user_role_id = 4 THEN 1 ELSE 0 END) AS totalReceptionist,
	SUM(CASE WHEN user_role_id = 5 THEN 1 ELSE 0 END) AS totalAccountant

    FROM tbl_users
    WHERE user_status = 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetUserCountByDepartment` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetUserCountByDepartment`(IN p_department_id INT)
BEGIN

    SELECT

    COUNT(*) AS totalCount,

    SUM(CASE WHEN user_role_id = 2 THEN 1 ELSE 0 END) AS totalDoctors,

	SUM(CASE WHEN user_role_id = 3 THEN 1 ELSE 0 END) AS totalLabAssistance,

	SUM(CASE WHEN user_role_id = 4 THEN 1 ELSE 0 END) AS totalReceptionist

    FROM tbl_users

    WHERE user_status = 1 AND user_department_id = p_department_id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetUserDetails` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetUserDetails`(IN p_user_id INT)
BEGIN
 SELECT
 u.user_photo AS photo,
 u.user_name AS name,
 u.user_email AS email,
 ud.mobile, ud.address, 
 ud.city, ud.postal_code, 
 e.degree, e.specialization,
 e.post_degree,
 e.post_specialization,
 d.department_id,
 d.department_name,
 ud.blood_group
 FROM tbl_users AS u
 LEFT JOIN tbl_education e ON u.user_id = e.user_id 
 LEFT JOIN tbl_user_details ud ON u.user_id = ud.user_id 
 LEFT JOIN tbl_department d ON u.user_department_id = d.department_id
 WHERE u.user_id = p_user_id;
 END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetUserName` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetUserName`(
    IN p_username VARCHAR(255)
)
BEGIN
    DECLARE v_user_count INT;

    -- Count if user exists
    SELECT COUNT(*) INTO v_user_count 
    FROM tbl_users 
    WHERE user_username = p_username;

    -- If user doesn't exist, return a message
    IF v_user_count = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'No user found with the given username';
    ELSE
        -- If user exists, return user details
        SELECT * FROM tbl_users WHERE user_username = p_username And user_status=1;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetUserProfile` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetUserProfile`(IN p_user_id INT)
BEGIN
SELECT 
u.user_photo AS photo,
u.user_name AS name,
ud.mobile,
ud.address,
ud.city,
ud.postal_code
FROM tbl_users AS u
LEFT JOIN tbl_education e ON u.user_id = e.user_id
LEFT JOIN tbl_user_details ud ON u.user_id = ud.user_id
WHERE u.user_id = p_user_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `InsertDoctorAvailability` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertDoctorAvailability`(
    IN p_user_id INT, 
    IN p_shift_id INT,
    IN p_day_ids VARCHAR(50) -- Example: '1,2,3'
)
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE v_day_id INT;

    -- Cursor to loop through the given day IDs
    DECLARE cur CURSOR FOR 
        SELECT day_id FROM tbl_day WHERE FIND_IN_SET(day_id, p_day_ids);
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    -- Open the cursor
    OPEN cur;
    read_loop: LOOP
        FETCH cur INTO v_day_id;
        IF done THEN
            LEAVE read_loop;
        END IF;

        -- Insert into tbl_doctor_availability based on slot_shift_id
        INSERT INTO tbl_doctor_availability (doc_ava_user_id, doc_ava_slot_shift_id, doc_ava_status, doc_ava_day_id)
        SELECT p_user_id, slot_shift_id, 0, v_day_id 
        FROM tbl_slot_shift 
        WHERE shift_id = p_shift_id AND day_id = v_day_id;

    END LOOP;
    CLOSE cur;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `InsertIPDBill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertIPDBill`(
    IN p_bill_admit_id INT,
    IN p_bill_total_amount DECIMAL(10,2),
    IN p_payment_method ENUM('Cash','Online'),
    IN p_bill_report VARCHAR(255),
    IN p_receipt_number VARCHAR(50),
    IN p_date BIGINT,
    IN p_created_by INT,
    IN p_discount_bill INT
)
BEGIN
    DECLARE receipt_exists INT DEFAULT 0;

    -- Start transaction
    START TRANSACTION;

    BEGIN
        -- Check if receipt number already exists
        SELECT COUNT(*) INTO receipt_exists 
        FROM tbl_ipd_bills 
        WHERE receipt_number = p_receipt_number;

        IF receipt_exists > 0 THEN
            -- Rollback and leave if duplicate receipt number
            ROLLBACK;
            SIGNAL SQLSTATE '45000' 
                SET MESSAGE_TEXT = 'Duplicate receipt number';
        ELSE
            -- Proceed with insert
            INSERT INTO tbl_ipd_bills (
                bill_admit_id,
                bill_total_amount,
                payment_method,
                bill_report,
                receipt_number,
                bill_date,
                created_by,
                discount
            ) VALUES (
                p_bill_admit_id,
                p_bill_total_amount,
                COALESCE(p_payment_method, 'Cash'),
                p_bill_report,
                p_receipt_number,
                p_date,
                p_created_by,
                p_discount_bill
            );

            -- Update admitted patient
            UPDATE tbl_admitted_patient 
            SET bill_status = 1 
            WHERE admitted_patient_id = p_bill_admit_id;

          -- call UpdateAdmitedpatientStatus(p_bill_admit_id);

            -- Commit transaction
            COMMIT;
        END IF;
    END;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `InsertLabAssistanceAvailability` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertLabAssistanceAvailability`(
    IN p_user_id INT, 
    IN p_shift_id INT,
    IN p_day_ids VARCHAR(50) -- Example: '1,2,3'
)
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE v_day_id INT;

    -- Cursor to loop through the given day IDs
    DECLARE cur CURSOR FOR 
        SELECT day_id FROM tbl_day WHERE FIND_IN_SET(day_id, p_day_ids);
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    -- Open the cursor
    OPEN cur;
    read_loop: LOOP
        FETCH cur INTO v_day_id;
        IF done THEN
            LEAVE read_loop;
        END IF;

        -- Insert into tbl_doctor_availability based on slot_shift_id
        INSERT INTO tbl_rec_lab_avaibility (rec_lab_ava_user_id, rec_lab_ava_slot_shift_id, rec_lab_ava_status, rec_lab_ava_day_id)
        SELECT p_user_id, slot_shift_id, 0, v_day_id 
        FROM tbl_slot_shift 
        WHERE shift_id = p_shift_id AND day_id = v_day_id;

    END LOOP;
    CLOSE cur;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SetdischargeDate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SetdischargeDate`(
    IN p_date bigint,
	IN p_admited_id int
)
BEGIN
declare ipd_iddd bigint;

        UPDATE tbl_admitted_patient
        SET 
            discharge_date = p_date,
            discharge_status = 1
        WHERE admitted_patient_id = p_admited_id;
        
		UPDATE tbl_bed_booking
        SET 
            end_date = p_date
        WHERE admitted_patient_id = p_admited_id and booking_status=1;
        
        
        
        
        select ipd_id into ipd_iddd from tbl_admitted_patient where admitted_patient_id=p_admited_id;
        
        
        
          UPDATE tbl_discharge_detail
        SET 
            discharge_date_time = p_date
            
         WHERE ipd_id = ipd_iddd;
         
         

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Add_IPD_Deposite` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_Add_IPD_Deposite`(
    IN p_admited_id INT,
    IN p_date DATE,
    IN p_amount DECIMAL(10,2)
)
BEGIN
    -- Check if the admited_id exists
    IF NOT EXISTS (SELECT 1 FROM `tbl_admitted_patient` WHERE admitted_patient_id = p_admited_id) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Invalid admited_id: Record not found in tbl_admited';
    END IF;

    -- Insert the record
    INSERT INTO tbl_ipd_deposite (admited_id, date, amount)
    VALUES (p_admited_id, p_date, p_amount);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Add_IPD_Lab` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_Add_IPD_Lab`(
    IN p_admited_id INT,
    IN p_test_id INT,
    IN p_recommendation_date bigint,
    IN p_reason TEXT
)
BEGIN
    -- Check if the admited_id exists
    IF NOT EXISTS (SELECT 1 FROM `tbl_admitted_patient` WHERE admitted_patient_id = p_admited_id) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Invalid admited_id: Record not found in tbl_admited';
    END IF;
    -- Check if the test_id exists
    IF NOT EXISTS (SELECT 1 FROM `tbl_test` WHERE test_id = p_test_id) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Invalid test_id: Record not found in tbl_test';
    END IF;
    -- Insert new lab record
    INSERT INTO tbl_ipd_lab (admited_id, test_id, recommendation_date, reason, status, ipd_lab_status)
    VALUES (p_admited_id, p_test_id, p_recommendation_date, p_reason, 'Pending', 1);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_InsertIPDBill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_InsertIPDBill`(
    IN p_bill_admit_id INT,
    IN p_bill_total_amount DECIMAL(10,2),
    IN p_payment_method ENUM('Cash','Online'),
    IN p_bill_report VARCHAR(255),
    IN p_receipt_number VARCHAR(50),
    IN p_created_by INT,
    OUT p_result INT,
    OUT p_message VARCHAR(100)
)
BEGIN
    DECLARE receipt_exists INT DEFAULT 0;
    
    -- Check if receipt number already exists
    SELECT COUNT(*) INTO receipt_exists 
    FROM tbl_ipd_bills 
    WHERE receipt_number = p_receipt_number;
    
    IF receipt_exists > 0 THEN
        SET p_result = -1;
        SET p_message = 'Error: Receipt number already exists';
    ELSE
        -- Insert the new bill record
        INSERT INTO tbl_ipd_bills (
            bill_admit_id,
            bill_total_amount,
            payment_method,
            bill_report,
            receipt_number,
            created_by
        ) VALUES (
            p_bill_admit_id,
            p_bill_total_amount,
            COALESCE(p_payment_method, 'Cash'), -- Default to 'Cash' if null
            p_bill_report,
            p_receipt_number,
            p_created_by
        );
        
        SET p_result = LAST_INSERT_ID();
        SET p_message = 'Bill created successfully';
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_insert_bed` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insert_bed`(
    IN p_bed_name VARCHAR(255),
    IN p_room_id INT,
    IN p_bed_status ENUM('available', 'occupied'),
    IN p_created_by INT
)
BEGIN
    -- Check if bed_name already exists
    IF EXISTS (SELECT 1 FROM tbl_bed WHERE bed_name = p_bed_name) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: Bed name already exists!';
    ELSE
        -- Insert the new bed if the name is unique
        INSERT INTO tbl_bed (bed_name, room_id, bed_status, created_by)
        VALUES (p_bed_name, p_room_id, "available", p_created_by);
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_update_room` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_update_room`(
    IN p_room_id INT,
    IN p_room_type VARCHAR(50)
)
BEGIN
    DECLARE room_exists INT;

    -- Check if the new room_type already exists in another room
    SELECT COUNT(*) INTO room_exists 
    FROM tbl_room 
    WHERE room_type = p_room_type AND room_id <> p_room_id;

    IF room_exists > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: Room type already exists!';
    ELSE
        -- Perform update (room_status remains 1)
        UPDATE tbl_room 
        SET room_type = p_room_type
        WHERE room_id = p_room_id;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `TodayCollectionReport` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `TodayCollectionReport`(IN report_date DATE)
BEGIN
    SELECT
        ob.bill_date,
        ob.bill_total_amount as amount,
        p.patient_name,
        p.uh_id,
        p.patient_image
    FROM tbl_opd_bills ob
    JOIN tbl_appointment op ON op.appo_id = ob.bill_appointment_id
    JOIN tbl_patient p ON p.patient_id = op.appo_patient_id
    WHERE DATE(ob.bill_date) = report_date;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UpdateAdmitedpatientStatus` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateAdmitedpatientStatus`(
    IN p_admited_id INT
)
BEGIN
    DECLARE v_bed_id INT;

    START TRANSACTION;

    -- Set admitted patient status to 0
    UPDATE tbl_admitted_patient
    SET status = 0
    WHERE admitted_patient_id = p_admited_id;

    -- Get the bed_id associated with this patient
    SELECT bed_id INTO v_bed_id 
    FROM tbl_admitted_patient 
    WHERE admitted_patient_id = p_admited_id;

    -- Update the bed status using the correct bed_id
    UPDATE tbl_bed
    SET bed_status = 'available'
    WHERE bed_id = v_bed_id;

    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UpdateBed` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateBed`(
    IN p_bed_id INT,
    IN p_bed_name VARCHAR(255),
    IN p_room_id INT,
    IN p_bed_status ENUM('available', 'occupied'),
    IN p_updated_by INT
)
BEGIN
    -- Check if another bed already has the same name
    IF EXISTS (SELECT 1 FROM tbl_bed WHERE bed_name = p_bed_name AND bed_id != p_bed_id) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: Bed name already exists!';
    ELSE
        -- Update the bed details if the name is unique
        UPDATE tbl_bed
        SET 
            bed_name = p_bed_name,
            room_id = p_room_id,
            bed_status = p_bed_status,
            upated_by = p_updated_by
        WHERE bed_id = p_bed_id;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UpdateBedStatus` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateBedStatus`(
    IN p_bed_id INT
)
BEGIN
    -- Check if the bed exists
    IF (SELECT COUNT(*) FROM tbl_bed WHERE bed_id = p_bed_id) = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: Bed ID not found!';
    ELSE
        -- Update the bed status and updated_at timestamp
        UPDATE tbl_bed 
        SET 
            bed_status = 'occupied',
            updated_at = CURRENT_TIMESTAMP
        WHERE bed_id = p_bed_id;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UpdateBilling` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateBilling`(
    IN p_bill_id INT,
    IN p_payment_status ENUM('Paid','Pending','Cancelled'),
    IN p_payment_method VARCHAR(50),
    IN p_bill_report TEXT,
    IN p_updated_by INT
)
BEGIN
    DECLARE p_appointment_id INT;

    -- Start Transaction
    START TRANSACTION;

    -- Get appointment_id related to the bill
    SELECT bill_appointment_id INTO p_appointment_id FROM tbl_opd_bills WHERE bill_id = p_bill_id;

    -- Ensure appointment_id is found
    IF p_appointment_id IS NOT NULL THEN
        -- Update OPD Bill Table
        UPDATE tbl_opd_bills
        SET 
            payment_status = COALESCE(p_payment_status, payment_status),
            payment_method = COALESCE(p_payment_method, payment_method),
            bill_date = NOW(),
            bill_report = COALESCE(p_bill_report, bill_report),
            updated_at = NOW(),
            updated_by = p_updated_by
        WHERE bill_id = p_bill_id;

        -- Update Appointment Status based on Payment Status
        UPDATE tbl_appointment
            SET appo_biil_status = p_payment_status
            WHERE appo_id = p_appointment_id;
        
        SELECT * FROM tbl_opd_bills WHERE bill_id = p_bill_id;
        -- Commit Transaction if Everything is Successful
        COMMIT;
    ELSE
        -- Rollback if bill_id is invalid
        ROLLBACK;
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Invalid bill_id: Appointment not found.';
    END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UpdateBillingAndCharges` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateBillingAndCharges`(
In p_id int,
IN p_class_name int,
In p_bed float,
IN p_nursing float,
IN p_doctor float,
IN p_rmo float,
IN p_bmw float,
IN p_total float,
In p_deposit float
)
BEGIN
Update tbl_billing_and_charges
set 
	class_name =p_class_name,
    bed = p_bed,
    nursing = p_nursing,
    doctor = p_doctor,
    rmo = p_rmo,
    bmw = p_bmw, 
    total = p_total,
    deposit = p_deposit
    where billing_and_charges_no = p_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UpdateDepartment` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateDepartment`(
    IN p_dep_id INT,
    IN p_dep_name VARCHAR(255)
)
BEGIN
    DECLARE dep_exists INT DEFAULT 0;
    DECLARE name_exists INT DEFAULT 0;

    -- Check if the department exists
    SELECT COUNT(*) INTO dep_exists 
    FROM tbl_department 
    WHERE department_id = p_dep_id;

    IF dep_exists = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: Department ID does not exist';
    END IF;

    -- Check if the new department name already exists
    SELECT COUNT(*) INTO name_exists 
    FROM tbl_department 
    WHERE department_name = p_dep_name AND department_id <> p_dep_id;

    IF name_exists > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: Department name must be unique';
    END IF;

    -- Update department
    UPDATE tbl_department 
    SET department_name = p_dep_name
    WHERE department_id = p_dep_id;

    -- Success message
    SELECT 'Department updated successfully' AS message;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UpdateDischargePatient` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateDischargePatient`(

    IN p_ipd_id VARCHAR(255),

    IN p_chief_complaints TEXT,

    IN p_diagnosis TEXT,

    IN p_signs VARCHAR(255),

    IN p_temprature VARCHAR(50),

    IN p_pulse VARCHAR(50),

    IN p_blood_pressure VARCHAR(50),

    IN p_respiratory_rate VARCHAR(50),

    IN p_cvs VARCHAR(255),

    IN p_rs VARCHAR(255),

    IN p_pa VARCHAR(255),

    IN p_cns VARCHAR(255),

    IN p_local_examination TEXT,

    IN p_past_history TEXT,

    IN p_discharge_advice TEXT,

    IN p_discharge_date_time BIGINT,

    IN p_follow_up_date_time BIGINT,
        IN p_icd_code varchar(45)


)
BEGIN

    -- Start transaction

    START TRANSACTION;
 
    -- Update discharge details in tbl_discharge_detail

    UPDATE tbl_discharge_detail 

    SET 

        chief_complaints = p_chief_complaints,

        diagnosis = p_diagnosis,

        signs = p_signs,

        temprature = p_temprature,

        pulse = p_pulse,

        blood_pressure = p_blood_pressure,

        respiratory_rate = p_respiratory_rate,

        cvs = p_cvs,

        rs = p_rs,

        pa = p_pa,

        cns = p_cns,

        local_examination = p_local_examination,

        past_history = p_past_history,

        discharge_advice = p_discharge_advice,

        discharge_date_time = p_discharge_date_time,

        follow_up_date_time =p_follow_up_date_time,
        
        icd_code=p_icd_code

    WHERE ipd_id = p_ipd_id;
 
    UPDATE tbl_admitted_patient 

    SET 

        approx_discharge_date = p_discharge_date_time
 
    WHERE ipd_id = p_ipd_id;
 
    -- Check if any rows were affected

    IF ROW_COUNT() = 0 THEN

        -- Rollback if no records were updated

        ROLLBACK;

        SELECT 'No discharge record found for the given IPD ID' AS message;

    ELSE

        -- Commit transaction

        COMMIT;

        SELECT 'Patient discharge details updated successfully' AS message;

    END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UpdateDoctor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateDoctor`(
    IN p_name VARCHAR(255),
    IN p_phone_no bigint,
    IN p_emilId VARCHAR(255),
    IN p_age INT,
    IN p_user_id INT,
	IN p_fees INT

)
BEGIN
    -- Declare variables for error handling
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        -- Rollback the transaction if any error occurs
        ROLLBACK;
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'An error occurred during the update';
    END;

    -- Start the transaction
    START TRANSACTION;

    -- First UPDATE statement
    UPDATE tbl_users
    SET 
        user_name = p_name,
        user_email = p_emilId
    WHERE user_id = p_user_id;

    -- Second UPDATE statement
    UPDATE tbl_user_details
    SET 
        age = p_age,
        mobile = p_phone_no,
        consultancy_fee=p_fees
    WHERE user_id = p_user_id;

    -- If everything succeeds, commit the transaction
    COMMIT;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UpdateDoctorAvaiblity` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateDoctorAvaiblity`(
    IN p_doc_ava_id INT
)
BEGIN
    START TRANSACTION;
    -- Update doc_ava_status to 1
    UPDATE tbl_doctor_availability
    SET doc_ava_status = 1
    WHERE doc_ava_id = p_doc_ava_id;
    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UpdateLabTestStatus` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateLabTestStatus`(
    IN p_lab_appoi_id INT,       
    IN p_lab_test_id INT,        
    IN p_lab_test_status VARCHAR(20)
)
BEGIN
    DECLARE affected_rows INT;

    -- If no status is provided, set the default to 'Pending'
    IF p_lab_test_status IS NULL OR p_lab_test_status = '' THEN
         SET p_lab_test_status = 'Pending';
    END IF;

    -- Validate the lab_test_status value
    IF p_lab_test_status NOT IN ('Pending', 'Completed', 'Cancelled') THEN
       SIGNAL SQLSTATE '45000'
         SET MESSAGE_TEXT = 'Invalid lab_test_status value';
    END IF;

    -- Update the lab test record's status
    UPDATE tbl_labTest
    SET lab_test_status = p_lab_test_status
    WHERE lab_appoi_id = p_lab_appoi_id
      AND lab_test_id = p_lab_test_id;

    -- Get the number of affected rows
    SET affected_rows = ROW_COUNT();

    -- If no rows were updated, signal an error
    IF affected_rows = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'No matching record found for update';
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UpdateOPDExamination` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateOPDExamination`(
	IN p_opd_examination_id INT,
    IN p_appointment_id INT,
    IN p_chief_complaints TEXT,
    IN p_personal_history TEXT,
    IN p_past_medical_history TEXT,
    IN p_present_medication TEXT,
    IN p_general_condition TEXT,
    IN p_pulse VARCHAR(50),
    IN p_blood_pressure VARCHAR(50),
    IN p_respiratory_rate VARCHAR(50),
    IN p_spo2 VARCHAR(50),
    IN p_signs TEXT,
    IN p_respiratory_system TEXT,
    IN p_cardiovascular_system TEXT,
    IN p_central_nervous_system TEXT,
    IN p_per_abdomen TEXT,
    IN p_updated_by INT
)
BEGIN
    DECLARE record_exists INT DEFAULT 0;

    -- Check if record exists
    SELECT COUNT(*) INTO record_exists
    FROM tbl_opd_examination
    WHERE opd_examination_id = p_opd_examination_id;

    -- If the record doesn't exist, return an error message
    IF record_exists = 0 THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'No record found for the given UH ID and Appointment ID';
    END IF;

    -- Start transaction
    START TRANSACTION;

    -- Update the existing record
    UPDATE tbl_opd_examination
    SET 
        chief_complaints = p_chief_complaints,
        personal_history = p_personal_history,
        past_medical_history = p_past_medical_history,
        present_medication = p_present_medication,
        general_condition = p_general_condition,
        pulse = p_pulse,
        blood_pressure = p_blood_pressure,
        respiratory_rate = p_respiratory_rate,
        spo2 = p_spo2,
        signs = p_signs,
        respiratory_system = p_respiratory_system,
        cardiovascular_system = p_cardiovascular_system,
        central_nervous_system = p_central_nervous_system,
        per_abdomen = p_per_abdomen,
        updated_by = p_updated_by,
        updated_at = NOW()
    WHERE opd_examination_id = p_opd_examination_id;

    -- Commit transaction
    COMMIT;

    -- Success message
    SELECT 'Patient examination record updated successfully' AS message;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UpdateOpdReport` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateOpdReport`(
    IN p_report_test_id INT,
    IN p_report_photo VARCHAR(255)
)
BEGIN
    -- Check if the record exists
    IF (SELECT COUNT(*) FROM tbl_report WHERE report_test_id = p_report_test_id) = 0 THEN
        -- Raise an error if record is not found
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Record not found', MYSQL_ERRNO = 1403;
    ELSE
        -- Update the report photo
        UPDATE tbl_report 
        SET report_photo = p_report_photo 
        WHERE report_test_id = p_report_test_id;
        
        SELECT 'OPD report updated successfully' AS message, 1 AS success;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UpdateRoom` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateRoom`(
    IN p_room_type_id INT,
    IN p_room_name VARCHAR(50),
    IN p_room_id INT,
    IN p_max_bed INT
)
BEGIN
    DECLARE room_type_exists INT;
    DECLARE room_name_exists INT;
    
    -- Check if the room_type_id already exists for another room

    
    -- Check if the room_name already exists for another room
    SELECT COUNT(*) INTO room_name_exists 
    FROM tbl_room 
    WHERE room_name = p_room_name AND room_id <> p_room_id;
    
    -- If room_type_id or room_name already exists, throw an error

    IF room_name_exists > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: Room name already exists!';
    ELSE
        -- Perform update (room_status remains unchanged)
        UPDATE tbl_room 
        SET 
            room_type_id = p_room_type_id,
            room_name = p_room_name,
            max_bed = p_max_bed
        WHERE room_id = p_room_id;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UpdateTest` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateTest`(
    IN p_test_id INT,
    IN p_test_name VARCHAR(255),
    IN p_test_description VARCHAR(255),
    IN p_test_image VARCHAR(255),
    IN p_updated_by INT
)
BEGIN
    DECLARE EXIT HANDLER FOR 1062 
    BEGIN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Error: Test name must be unique';
    END;
    
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK; -- Rollback the transaction in case of an error
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'An unexpected error occurred while updating the test';
    END;

    START TRANSACTION;

    UPDATE tbl_test 
    SET 
        test_name = p_test_name,
        test_description = p_test_description,
        test_photo = p_test_image
      --  updated_by = p_updated_by,
      --  updated_at = CURRENT_TIMESTAMP
    WHERE test_id = p_test_id;

    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UpdateUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateUser`(
    IN p_name VARCHAR(255),
    IN p_phone_no bigint,
    IN p_emilId VARCHAR(255),
    IN p_age INT,
    IN p_user_id INT
)
BEGIN
    -- Declare variables for error handling
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        -- Rollback the transaction if any error occurs
        ROLLBACK;
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'An error occurred during the update';
    END;

    -- Start the transaction
    START TRANSACTION;

    -- First UPDATE statement
    UPDATE tbl_users
    SET 
        user_name = p_name,
        user_email = p_emilId
    WHERE user_id = p_user_id;

    -- Second UPDATE statement
    UPDATE tbl_user_details
    SET 
        age = p_age,
        mobile = p_phone_no
    WHERE user_id = p_user_id;

    -- If everything succeeds, commit the transaction
    COMMIT;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UpdateUserDetails` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateUserDetails`(
    IN p_user_id INT,
    IN p_name VARCHAR(100),
    IN p_email_id VARCHAR(100),
    IN p_mobile BIGINT,
    IN p_blood_group VARCHAR(10),
    IN p_address TEXT,
    IN p_city VARCHAR(100),
    IN p_profile VARCHAR(255)
)
BEGIN
    -- Start Transaction
    START TRANSACTION;
    
    -- Check if email or mobile number already exists for another user
    IF (SELECT COUNT(*) FROM tbl_users WHERE user_email = p_email_id AND user_id != p_user_id) > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error: Email already exists';
    END IF;
    
    IF (SELECT COUNT(*) FROM tbl_user_details WHERE mobile = p_mobile AND user_id != p_user_id) > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error: Phone number already exists';
    END IF;
    
    -- Update tbl_users table
    UPDATE tbl_users
    SET user_name = p_name, 
        user_email = p_email_id, 
        user_photo = p_profile
    WHERE user_id = p_user_id;
    
    -- Update tbl_user_details table
    UPDATE tbl_user_details
    SET mobile = p_mobile, 
        blood_group = CASE WHEN p_blood_group IS NOT NULL THEN p_blood_group ELSE blood_group END, 
        address = p_address, 
        city = p_city
    WHERE user_id = p_user_id;
    
    -- Commit Transaction
    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UpdateUserDetailswithoutphoto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateUserDetailswithoutphoto`(
    IN p_user_id INT,
    IN p_name VARCHAR(100),
    IN p_email_id VARCHAR(100),
    IN p_mobile BIGINT,
    IN p_blood_group VARCHAR(10),
    IN p_address TEXT,
    IN p_city VARCHAR(100)
)
BEGIN
    -- Start Transaction
    START TRANSACTION;
    
    -- Check if email or mobile number already exists for another user
    IF (SELECT COUNT(*) FROM tbl_users WHERE user_email = p_email_id AND user_id != p_user_id) > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error: Email already exists';
    END IF;
    
    IF (SELECT COUNT(*) FROM tbl_user_details WHERE mobile = p_mobile AND user_id != p_user_id) > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error: Phone number already exists';
    END IF;
    
    -- Update tbl_users table
    UPDATE tbl_users
    SET user_name = p_name, 
        user_email = p_email_id
    WHERE user_id = p_user_id;
    
    -- Update tbl_user_details table
    UPDATE tbl_user_details
    SET mobile = p_mobile, 
        blood_group = CASE WHEN p_blood_group IS NOT NULL THEN p_blood_group ELSE blood_group END, 
        address = p_address, 
        city = p_city
    WHERE user_id = p_user_id;
    
    -- Commit Transaction
    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-15 16:41:16
