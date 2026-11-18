// Intentionally do not cache application files in v3. Online updates and auth
// reliability take priority over offline use. Only completed trips sync online.
self.addEventListener('install',()=>self.skipWaiting());
self.addEventListener('activate',e=>e.waitUntil(self.registration.unregister()));
