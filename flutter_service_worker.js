'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "assets/AssetManifest.json": "01f47da2f147bd22f0933ea56a85b881",
"assets/assets/images/act.jpg": "f294d2923aa77f44be1e89795e870d1f",
"assets/assets/images/background.jpg": "4544ffcd97825d99c5716f6e32a33ff2",
"assets/assets/images/icons8-rain.gif": "7f3dd8ced7fb2a89f7111b868d502b4b",
"assets/assets/images/landing_picture.jpg": "362d71fb6f2e3ee6fb2a97ff31c2e02f",
"assets/assets/images/logo.png": "bee3faabdb849409707c147e30f3eda4",
"assets/assets/images/nsw.jpg": "dc726a743d0d4aa49807ad1a2b84615c",
"assets/assets/images/nt.jpg": "c68f2bca2819dbf43b705442d9944ea8",
"assets/assets/images/qld.jpg": "ea8c470afb104177e5d98bd505242b86",
"assets/assets/images/sa.jpg": "2c51c6056a8a66e3fd139f1d0ee7eeff",
"assets/assets/images/shower_background.jpg": "87e4113ac81f0ca75eb433b56bc865ed",
"assets/assets/images/shower_man.jpg": "5cf21703bcdad51089d092a2333d0e89",
"assets/assets/images/tas.jpg": "2c9568f14bf02ed3fb35bb5aca809f5f",
"assets/assets/images/vic.jpg": "41d8a4f8f6c940e336606010e983b625",
"assets/assets/images/wa.jpg": "dad0cf86a2c2d5a6ff3b72a1a9101156",
"assets/assets/images/water_bye.jpg": "4126d084f83d61c5c151ea9e16c4e487",
"assets/assets/images/water_cry.jpg": "10b24fa6df12ade5327d9e677dcebdad",
"assets/assets/images/water_drop.jpg": "fbff624c2fc7d5d164900c19deac2a8c",
"assets/assets/images/water_glass.jpg": "1a2970d9c629b5285bd0af990d88b76b",
"assets/assets/images/water_love.jpg": "a8a12f9c8e8d143c047e58feeaeaf42f",
"assets/assets/images/water_mad.jpg": "79bdb7e687ea8564fc884727fbddca62",
"assets/assets/images/water_money.jpg": "9f3d02de12372762547294719fe4b217",
"assets/assets/images/water_normal.jpg": "27e7ae10d84c6fede4184baf50d21160",
"assets/assets/images/water_stars.jpg": "cd3c5e5034850e591660b193048ddb99",
"assets/assets/images/water_strong.jpg": "46c9c7f0064bba8f32f64d9fb76d7a98",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "95db9098c58fd6db106f1116bae85a0b",
"assets/NOTICES": "1188371d285a55b5fa6e3da57ca48cc5",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"canvaskit/canvaskit.js": "c2b4e5f3d7a3d82aed024e7249a78487",
"canvaskit/canvaskit.wasm": "4b83d89d9fecbea8ca46f2f760c5a9ba",
"canvaskit/profiling/canvaskit.js": "ae2949af4efc61d28a4a80fffa1db900",
"canvaskit/profiling/canvaskit.wasm": "95e736ab31147d1b2c7b25f11d4c32cd",
"favicon.png": "bee3faabdb849409707c147e30f3eda4",
"flutter.js": "3688efe0a39e59781b4f95efbd6b5b62",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "db642805f080d1bb743f12b6da2ef1f8",
"/": "db642805f080d1bb743f12b6da2ef1f8",
"main.dart.js": "dbaee19ea5103ee4b440cbae7a3fd212",
"manifest.json": "3318bdcd6229cba3e58d5127ebef2b2f",
"version.json": "1f8373c1f4e85b6217b1268f1a8a2e17"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "main.dart.js",
"index.html",
"assets/NOTICES",
"assets/AssetManifest.json",
"assets/FontManifest.json"];
// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});

// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});

// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache.
        return response || fetch(event.request).then((response) => {
          cache.put(event.request, response.clone());
          return response;
        });
      })
    })
  );
});

self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});

// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}

// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
