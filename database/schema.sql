CREATE TABLE IF NOT EXISTS stations (
  id SERIAL PRIMARY KEY,
  name VARCHAR(120) NOT NULL,
  location VARCHAR(120) NOT NULL,
  timezone VARCHAR(80) DEFAULT 'UTC'
);

CREATE TABLE IF NOT EXISTS energy_readings (
  id BIGSERIAL PRIMARY KEY,
  station_id INTEGER REFERENCES stations(id),
  recorded_at TIMESTAMPTZ NOT NULL,
  generation_kw NUMERIC(10,2) NOT NULL,
  consumption_kw NUMERIC(10,2) NOT NULL,
  battery_soc NUMERIC(5,2) NOT NULL,
  fuel_level_pct NUMERIC(5,2) NOT NULL
);

CREATE TABLE IF NOT EXISTS weather_readings (
  id BIGSERIAL PRIMARY KEY,
  station_id INTEGER REFERENCES stations(id),
  recorded_at TIMESTAMPTZ NOT NULL,
  temperature_c NUMERIC(6,2),
  wind_kmh NUMERIC(8,2),
  renewable_index NUMERIC(5,2),
  condition VARCHAR(80)
);

CREATE TABLE IF NOT EXISTS forecasts (
  id BIGSERIAL PRIMARY KEY,
  station_id INTEGER REFERENCES stations(id),
  forecast_for TIMESTAMPTZ NOT NULL,
  predicted_demand_kw NUMERIC(10,2),
  predicted_generation_kw NUMERIC(10,2),
  confidence NUMERIC(5,2)
);

CREATE TABLE IF NOT EXISTS alerts (
  id BIGSERIAL PRIMARY KEY,
  station_id INTEGER REFERENCES stations(id),
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  severity VARCHAR(20) NOT NULL,
  title VARCHAR(180) NOT NULL,
  message TEXT NOT NULL,
  status VARCHAR(20) DEFAULT 'OPEN'
);

CREATE TABLE IF NOT EXISTS recommendations (
  id BIGSERIAL PRIMARY KEY,
  station_id INTEGER REFERENCES stations(id),
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  category VARCHAR(80),
  recommendation TEXT NOT NULL,
  estimated_saving_kwh NUMERIC(10,2),
  priority VARCHAR(20)
);
