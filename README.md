# Gas Up v3 — cloud mileage tracker

Gas Up v3 stores completed mileage trips in **your own Supabase project**, protected by Supabase authentication and Row Level Security (RLS). It is a static app that can run on GitHub Pages. No paid hosting is required for a small project, though Supabase usage limits may apply.

## Project configuration

This package is preconfigured for your Supabase project `ivszmjibgsythbdfegwd`. The SQL schema **has not been run automatically**: you must run `schema.sql` in the Supabase SQL Editor before trips will save. The project URL and publishable key are not proof of a working database connection; check login and a sample trip after deployment.

## Set up cloud storage

1. Create a Supabase project at https://supabase.com/dashboard.
2. In **SQL Editor**, paste and run the entire `schema.sql` file in this folder. (Run only once. The `create policy` commands are not repeatable.)
3. **Already done for this package:** `config.js` contains your supplied Supabase Project URL and publishable key. **Never use a service_role key or secret API key in browser code.**
4. In **Authentication > Providers**, ensure Email authentication is enabled. Configure email confirmation and mail delivery for your deployment; Supabase's default email service has limitations.
5. In **Authentication > URL Configuration**, set the Site URL to your final HTTPS app URL, e.g. `https://YOURNAME.github.io/gas-up/`. Add it to allowed redirect URLs for password reset/email confirmation. Configure custom SMTP for dependable production emails.
6. Upload the contents of this folder (not the enclosing folder) to a GitHub repository; enable **Settings > Pages > Deploy from a branch** and choose your publishing branch/root. Access the resulting **HTTPS** GitHub Pages URL.
7. Sign up, verify email if required, and sign in. The app creates a starter driver and you can add others with **+ Driver**.

## Existing v1/v2 records

If this browser previously used Gas Up v1/v2 **at the exact same website origin** (same protocol/hostname/port), click **Download old-data backup**, then **Import saved local data**. The older records stay in browser storage untouched. The app imports each local driver and their trips. **Import only once**: retrying after a partial failure can duplicate rows, so inspect Supabase before trying again. Legacy records from other devices or website origins will not appear automatically. There is no JSON-file upload yet.

## What stays local

Only **finished and confirmed** trips are saved to Supabase. GPS progress is temporarily kept in the phone/browser's local storage and can be lost if the browser data is cleared. Browser GPS requires HTTPS and an active page, and may suspend when the phone locks. GPS results are estimates, not odometer-verified readings.

## Sharing and privacy

Reports can be filtered by driver and day, week (Monday–Sunday), or month. Export to CSV or printable HTML, print the current view, or share using the device share sheet when supported. All authenticated records for one account are visible to anyone signed into **that account**; drivers are labels within that account, not separate sign-ins. For separate employees to have private records, give each employee their own account. This version has no employer/admin cross-account reporting or automated backup/export.

## Troubleshooting

- If the app says **Connect Gas Up to Supabase**, check `config.js` and whether the internet connection allows the Supabase JS library CDN.
- If saving fails with `relation does not exist` or `permission denied`, check the SQL Editor setup and RLS policies.
- If signup works but login does not, verify email, URL settings and confirmation messages in Supabase.
- To avoid losing GPS tracking, finish trips with **End & save** while online and confirm the cloud success message.
- Your data resides in your Supabase project; keep account credentials and recovery email secure. Supabase is not a guarantee against accidental deletion; maintain periodic CSV backups.
