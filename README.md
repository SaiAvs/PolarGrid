# PolarGrid

AI-powered energy intelligence for polar research stations.

## What is included

- Responsive landing page
- Station Energy Manager dashboard
- Energy monitoring
- AI load forecasting demo
- Renewable generation monitoring
- Battery/storage monitoring
- Fuel optimization
- AI recommendations
- Anomaly detection
- Alerts
- Analytics
- What-if scenario simulator
- Reports view
- Role-based demo login
- Synthetic/demo station data
- Vercel-ready Vite configuration
- PostgreSQL schema and seed files

> Demo data is synthetic and is clearly intended for prototype/demo use. No real station telemetry is claimed.

## Local setup

Requirements: Node.js 18+.

```bash
npm install
npm run dev
```

Open the local URL shown by Vite.

## Production build

```bash
npm run build
npm run preview
```

## Vercel deployment

1. Push this folder to GitHub.
2. Import the repository into Vercel.
3. Vercel detects Vite automatically.
4. Build command: `npm run build`
5. Output directory: `dist`
6. Add environment variables only if you connect a real PostgreSQL service later.
7. Deploy.

The project intentionally does not contain `node_modules`, `.env`, credentials, or deployment secrets.

## Demo accounts

Use the login screen:

- Manager: manager@polargrid.demo / PolarGrid123
- Admin: admin@polargrid.demo / PolarGrid123
- Operations: operations@polargrid.demo / PolarGrid123

These are local demo credentials only. Do not use them for production authentication.

## Database

`database/schema.sql` and `database/seed.sql` provide a PostgreSQL starting point for persistent station data. The current browser demo uses local synthetic data so the dashboard works immediately without a database.

## Product flow

Landing → Login → Dashboard → Monitoring → Forecast → Renewable → Storage → Fuel → AI Recommendations → Alerts → Simulation → Analytics → Reports.

## Important prototype boundary

The application is a decision-support prototype. It does not directly control critical station infrastructure, generators, batteries, or fuel systems.

## Manual Station Data Workflow

PolarGrid includes a **Station Data Entry** workspace for the Station Energy Manager / operations team. Enter station, generation, battery, fuel, weather, and forecast inputs, then select **Run AI Analysis**. The submitted dataset recalculates the dashboard, monitoring, forecast, renewable, storage, fuel optimization, recommendations, alerts, analytics, simulation baseline, and reports. **Use Demo Data** restores the prefilled demonstration scenario.

The browser prototype uses local React state for this workflow. The PostgreSQL schema remains available for connecting validated station telemetry and persistent records in a production backend.
