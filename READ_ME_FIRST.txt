GAS UP — ANDROID INSTALL FIX (November 18, 2026)

IMPORTANT: Your live GitHub index.html currently contains a REPAIR UTILITY instead of the actual mileage tracker. This package restores an earlier Gas Up cloud-tracker version that was available in our prior project files. If you added newer features after that version, compare before replacing.

UPLOAD THESE FIVE FILES to the ROOT of https://github.com/spental/GasUp using Add file > Upload files and Commit changes:
- index.html  (REPLACES current repair utility)
- manifest.webmanifest  (REPLACES old SVG-only manifest)
- sw.js  (REPLACES old service worker)
- icon-192.png  (NEW)
- icon-512.png  (NEW)

KEEP AS-IS: config.js, schema.sql, README.md, icon.svg.
No Supabase database changes required. Existing saved cloud data is not intentionally modified by this package.

ON ANDROID:
1. Remove the old Gas Up Chrome shortcut from the home screen (do not clear Chrome data).
2. In Chrome open https://spental.github.io/GasUp/
3. Give GitHub Pages a moment to deploy; refresh the page.
4. Chrome menu > Install app. If the install option is absent, revisit after confirming the website shows the REAL sign-in screen instead of the repair tool.
5. Sign in and verify your past trip records are present.

Note: GPS tracking requires the page to stay active. It is not guaranteed to record in the background when a phone locks.
