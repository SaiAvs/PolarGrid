INSERT INTO stations (name, location, timezone)
VALUES ('Aurora Research Station', 'Polar Region', 'UTC')
ON CONFLICT DO NOTHING;

-- Demo telemetry is intentionally synthetic.
