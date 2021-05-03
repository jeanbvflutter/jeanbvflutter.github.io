'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "build/web/manifest.json": "cd52b6655fcf84c0c38d739f40200981",
"build/web/favicon.png": "5dcef449791fa27946b3d35ad8803796",
"build/web/main.dart.js": "4959de55a0577d0ae6187c1c0a27d2f7",
"build/web/icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"build/web/icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"build/web/assets/AssetManifest.json": "51e70d2990b226e1273d43d241a5fd72",
"build/web/assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"build/web/assets/assets/icons/flutter_orange_dot.png": "c3837674f0d8ed951d9c198ea986806b",
"build/web/assets/assets/icons/flutter_red_dot.png": "c7cda9be72fc798005d61a9dd7605824",
"build/web/assets/assets/icons/flutter_green_dot.png": "4bf1d0dafff1368e3dee479082bd86be",
"build/web/assets/assets/icons/transparent.png": "c771fc7113f3dea82d580c397617d5e4",
"build/web/assets/fonts/MaterialIcons-Regular.otf": "4e6447691c9509f7acdbf8a931a85ca1",
"build/web/assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"build/web/assets/NOTICES": "d15259996903f3d4f8e77fed8521645f",
"build/web/version.json": "9928cab8b88cea9826101cd40698a07d",
"build/web/index.html": "02ee9946318ff11797f22ac86879f0dc",
"/": "6a45988df587021acc07f8d4d324db10",
"manifest.json": "cd52b6655fcf84c0c38d739f40200981",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
".git/description": "a0a7c3fff21f2aea3cfa1d0316dd816c",
".git/COMMIT_EDITMSG": "d8e8fca2dc0f896fd7cb4cb0031ba249",
".git/info/exclude": "036208b4a1ab4a235d75c181e685e5a3",
".git/index": "5e98210328946c6bebbf640d9d1c25c2",
".git/refs/heads/master": "1caf27dff8fa25d4e3629d5fe6a50b2a",
".git/refs/remotes/git/master": "1caf27dff8fa25d4e3629d5fe6a50b2a",
".git/HEAD": "4cf2d64e44205fe628ddd534e1151b58",
".git/hooks/prepare-commit-msg.sample": "2b5c047bdb474555e1787db32b2d2fc5",
".git/hooks/applypatch-msg.sample": "ce562e08d8098926a3862fc6e7905199",
".git/hooks/update.sample": "517f14b9239689dff8bda3022ebd9004",
".git/hooks/fsmonitor-watchman.sample": "ecbb0cb5ffb7d773cd5b2407b210cc3b",
".git/hooks/post-update.sample": "2b7ea5cee3c49ff53d41e00785eb974c",
".git/hooks/pre-push.sample": "3c5989301dd4b949dfa1f43738a22819",
".git/hooks/pre-applypatch.sample": "054f9ffb8bfe04a599751cc757226dda",
".git/hooks/pre-rebase.sample": "56e45f2bcbc8226d2b4200f7c46371bf",
".git/hooks/commit-msg.sample": "579a3c1e12a1e74a98169175fb913012",
".git/hooks/pre-receive.sample": "2ad18ec82c20af7b5926ed9cea6aeedd",
".git/hooks/pre-commit.sample": "01b1688f97f94776baae85d77b06048b",
".git/logs/refs/heads/master": "aedd65b69f634b16a83f170a8e41db80",
".git/logs/refs/remotes/git/master": "95416d651178e38179a12f3208e497a4",
".git/logs/HEAD": "aedd65b69f634b16a83f170a8e41db80",
".git/objects/65/b6a93251144282c7d35522d3bd495352f9cf01": "3711eaf11ffde49ee630011b7f7418ee",
".git/objects/ae/833ec64aec2de037376d6b5eee8e3a941a0df1": "c2a655669cde10f4ce39d648d82b6561",
".git/objects/4f/d03ddad02c5897eb9a82a03f2c16e6508eda47": "4497e53af2a28f5d5f2f28bc996ecb68",
".git/objects/42/a7c03798359ef1a4f67553b7763376186b7827": "7e2da38720d0b5335b884b1db17cea9e",
".git/objects/fd/31fc2dd7d1959cac8a04827bd26d96ca9c892f": "741d1f0fbe7ab7a86ee47449fe4e40f4",
".git/objects/pack/pack-f02a9f7356ecf48a8781ef1e440cb25c2e2a5017.pack": "3fa87da1cb953edf57a00992d8383d9a",
".git/objects/pack/pack-f02a9f7356ecf48a8781ef1e440cb25c2e2a5017.idx": "ca13f976c4f16272eaee361b2ccba480",
".git/config": "7c1cfe2a8be22e3c705eb97fc3092ab2",
".git/FETCH_HEAD": "9f25dfa2f084c6cee64258db007b6743",
"main.dart.js": "d7806e4c412589ff1d071e2026db9676",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"assets/AssetManifest.json": "51e70d2990b226e1273d43d241a5fd72",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/assets/icons/flutter_orange_dot.png": "c3837674f0d8ed951d9c198ea986806b",
"assets/assets/icons/flutter_red_dot.png": "c7cda9be72fc798005d61a9dd7605824",
"assets/assets/icons/flutter_green_dot.png": "4bf1d0dafff1368e3dee479082bd86be",
"assets/assets/icons/transparent.png": "c771fc7113f3dea82d580c397617d5e4",
"assets/fonts/MaterialIcons-Regular.otf": "4e6447691c9509f7acdbf8a931a85ca1",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/NOTICES": "d15259996903f3d4f8e77fed8521645f",
"android/app/src/main/java/io/flutter/plugins/GeneratedPluginRegistrant.java": "da78ab41f38737a5b2dcbbe34da1c40e",
"android/local.properties": "546fc2151160889c48ef927b80ef7902",
"ios/Flutter/flutter_export_environment.sh": "93830bf213726db2f12e3283ab5b43a9",
"ios/Flutter/Generated.xcconfig": "f72aeca7403a5efbeaea18a3b5f84e83",
"ios/Runner/GeneratedPluginRegistrant.m": "67f35b1006b2010c1d0e31485247411e",
"ios/Runner/GeneratedPluginRegistrant.h": "51e4cefb306d339b47a67bb0477a1d27",
"version.json": "9928cab8b88cea9826101cd40698a07d",
"index.html": "6a45988df587021acc07f8d4d324db10",
".dart_tool/package_config_subset": "c1eeb47aed4127dbf4ad780906a87862",
".dart_tool/flutter_build/a943a077d60bf4e3fa9690f2873ffb76/main.dart.js": "4959de55a0577d0ae6187c1c0a27d2f7",
".dart_tool/flutter_build/a943a077d60bf4e3fa9690f2873ffb76/main.dart.js.deps": "0d3c9ad13599ac740ac91011be30ae50",
".dart_tool/flutter_build/a943a077d60bf4e3fa9690f2873ffb76/web_entrypoint.stamp": "ccab72882c26af2d04523eecacff341b",
".dart_tool/flutter_build/a943a077d60bf4e3fa9690f2873ffb76/flutter_assets.d": "8ed4589c437a9e31b37f08ca6c0a0f53",
".dart_tool/flutter_build/a943a077d60bf4e3fa9690f2873ffb76/outputs.json": "478549e8b0da338a83abb7592231249e",
".dart_tool/flutter_build/a943a077d60bf4e3fa9690f2873ffb76/web_resources.d": "25a2018fbdcc2c2f864a039560c99c81",
".dart_tool/flutter_build/a943a077d60bf4e3fa9690f2873ffb76/service_worker.d": "690fa9f696712b84d0e2b003f88c0a45",
".dart_tool/flutter_build/a943a077d60bf4e3fa9690f2873ffb76/dart2js.stamp": "622529b3f18071d92a4c9de15a3802bb",
".dart_tool/flutter_build/a943a077d60bf4e3fa9690f2873ffb76/app.dill.deps": "763b4d33d15269c5567cbec6f75b650e",
".dart_tool/flutter_build/a943a077d60bf4e3fa9690f2873ffb76/web_service_worker.stamp": "43b467a0cd70b0f988bdf96274ac83e6",
".dart_tool/flutter_build/a943a077d60bf4e3fa9690f2873ffb76/main.dart": "a64c8585dae9a18694b4e1da7f4f596f",
".dart_tool/flutter_build/a943a077d60bf4e3fa9690f2873ffb76/gen_localizations.stamp": "436d2f2faeb7041740ee3f49a985d62a",
".dart_tool/flutter_build/a943a077d60bf4e3fa9690f2873ffb76/app.dill": "6a36efacad6bc3d947c69e0dc4df175c",
".dart_tool/flutter_build/a943a077d60bf4e3fa9690f2873ffb76/web_release_bundle.stamp": "6074dd317b056dc7300c1040b86c972b",
".dart_tool/flutter_build/a943a077d60bf4e3fa9690f2873ffb76/dart2js.d": "bc418e6e813ffd8f40cc62c32e1dd42c",
".dart_tool/package_config.json": "0fb0446b4dac4e7bba0f5df1f75e468b",
".dart_tool/version": "9753b32ac9705e3f68582af31d55107d"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "/",
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
