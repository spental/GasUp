// Network-first: no offline data caching; Supabase remains the source of truth.
const VERSION = 'gas-up-pwa-2026-11-18';
self.addEventListener('install', event => { self.skipWaiting(); });
self.addEventListener('activate', event => { event.waitUntil(self.clients.claim()); });
self.addEventListener('fetch', event => { /* Allow normal network behavior. */ });
