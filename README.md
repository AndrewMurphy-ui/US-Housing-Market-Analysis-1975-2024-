# 🏠 Housing Data Pipeline Service (1975–2024)

An automated backend pipeline that ingests, validates, and exposes long-term U.S. housing market data through a stable HTTP API, with emphasis on reliability, automation, and production-oriented architecture.
---

## 🚩 Problem Statements

Housing market data is commonly distributed as static files (CSV/Excel) that must be repeatedly imported, cleaned, and recalculated by each consumer. This leads to:

- duplicated data processing
- inconsistent metric definitions  
- silent data quality issues  
- difficulty tracking data freshness and failures 

As a result, dashboards, scripts, and analysts often disagree on results and lack visibility into data reliability.

---

## ✅ Solution

This project provides a **centralized backend service** that:

- ingests housing data through a repeatable pipeline  
- validates and enforces data quality rules  
- quarantines invalid data instead of silently failing  
- records ingestion run history for auditability  
- triggers alerts on failure or partial success  
- exposes trusted metrics and time-series data via HTTP APIs  

The system is designed to be **operated**, not just run once.

---

## 🧠 Key Design Concepts

- **Outcome-based workflows**  
  Ingestion runs explicitly result in `SUCCESS`, `PARTIAL`, or `FAILURE`, each triggering different actions.

- **Single source of truth**  
  All consumers rely on the same validated data and metric definitions.

- **Separation of concerns**  
  Ingestion, validation, storage, and API access are clearly separated.

- **Reproducible environment**  
  The entire system runs via Docker for consistency across machines.

---

## 🏗️ Architecture Overview

**Data flow:**

1. Raw housing data is ingested into a staging layer  
2. Validation rules are applied  
3. Valid rows are promoted to clean storage  
4. Invalid rows are quarantined with error reasons  
5. Ingestion results are recorded and alerts generated  
6. Clients consume data through HTTP APIs  

---

## 🗄️ Database Structure

Core tables include:

- `housing_raw` – staging area for incoming data  
- `housing_clean` – validated, trusted housing data  
- `quarantine_rows` – rejected rows with validation errors  
- `ingestion_runs` – audit trail of ingestion outcomes  
- `alerts` – warnings and failures triggered by workflows  

Uniqueness and integrity are enforced at the database level.

---

## 🔌 API Endpoints

### Operational
- `GET /health` – service health check  
- `GET /meta/last-run` – most recent ingestion status  
- `GET /runs` – ingestion run history  
- `GET /runs/{id}` – detailed run information  
- `GET /alerts` – recent alerts  

### Data Access
- `GET /states` – available states  
- `GET /series/{state}` – quarterly time-series data  
- `GET /metrics/{state}` – computed housing metrics  
- `GET /rankings?metric=total_growth&top=10` – ranked results  

All endpoints return JSON and are documented via OpenAPI.

---

## ⚙️ Running the Project

### Prerequisites
- Docker  
- Docker Compose  

### Start the system
```bash
docker compose up --build


