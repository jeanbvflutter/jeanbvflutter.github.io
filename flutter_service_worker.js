'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "manifest.json": "cd52b6655fcf84c0c38d739f40200981",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
".git/refs/remotes/origin/master": "112999b942f398b8b975a1c06a3420a7",
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
".git/logs/refs/heads/master": "d5bf0affa6a9dc2a6bcca9efb179a140",
".git/logs/refs/remotes/origin/master": "0326e9886db46cca10d07030011c67bb",
".git/logs/HEAD": "d5bf0affa6a9dc2a6bcca9efb179a140",
".git/objects/69/4d673d85ec3e86e786bbec8137f92e43c316e8": "ffc1a2941d8e3efc34ac2628058a04d8",
".git/objects/32/46ad559eeae0370195978eaed83f1053ee13fd": "a043dbc0a0bda96ce2127799ccc27506",
".git/objects/4b/825dc642cb6eb9a060e54bf8d69288fbee4904": "75589287973d2772c2fc69d664e10822",
".git/objects/9d/f862927473462564c2656f9e6e71c66f9a6ec6": "17a36357af9309148e50da68e79bdb4f",
".git/objects/ac/a5ea2b749e04ea6987a2b860d7203cb921301a": "6f6520b6dbdfc9ffaaae7817ea336b1c",
".git/objects/5e/b6df8f3d0a492031c8fb102e091b90e762d273": "91b02aaa147de870224a263c57a7b850",
".git/objects/46/4ab5882a2234c39b1a4dbad5feba0954478155": "2e52a767dc04391de7b4d0beb32e7fc4",
".git/objects/97/678a0e4d390457ba16a68c7074d2a80c16d751": "f774eb33fcf36bc80be4dc9ea39cce3f",
".git/objects/a1/3837a12450aceaa5c8e807c32e781831d67a8f": "bfe4910ea01eb3d69e9520c3b42a0adf",
".git/objects/20/5bb5db271c6d8de8399864c7bb9b917f638893": "c993b22f115d7f3ae6d5b7b212806539",
".git/objects/20/02cfdbd84d8a67e7ee3b2ff3c7026dacfe2b06": "e9dfe4a0f8681b0bd05743f98e0c496e",
".git/objects/e9/a2435c8b25676e2fb2eb33284ef59c4ccf8866": "b1f9bf18015d99cc4c42e2a8fc024b79",
".git/objects/e5/951dfb943474a56e611d9923405cd06c2dd28d": "c6fa51103d8db5478e1a43a661f6c68d",
".git/objects/af/53110b56cc76852e1b721b262518a99e6eb0cf": "bda6aa8b4e9e059e4c7a88c258b76121",
".git/objects/b7/49bfef07473333cf1dd31e9eed89862a5d52aa": "36b4020dca303986cad10924774fb5dc",
".git/objects/cb/dba8cd76816f1e63df42c98a5e52fb5af854fc": "1cb2cf0f112178f924f44a89d99a021b",
".git/objects/4c/010b637c985f280a904f39ba3a97ff917d3c0f": "ac10719e53e14de5ed5ff3b43da8ba21",
".git/objects/e1/59a859ce480539553f2398a393dc9a31ddd9eb": "e51671109cca1294ec9d666addce1feb",
".git/objects/8a/aa46ac1ae21512746f852a42ba87e4165dfdd1": "1d8820d345e38b30de033aa4b5a23e7b",
".git/objects/a8/beffd3ad4fe54d6cabccf83a05477d6a986cd0": "6677888e4a051c7838b5b240c09f0981",
".git/objects/88/cfd48dff1169879ba46840804b412fe02fefd6": "e42aaae6a4cbfbc9f6326f1fa9e3380c",
".git/objects/78/c3af06ee06e14194b600a96870ff662fc0d72d": "5dcc47039ad7a7033274cb5ef27467e9",
".git/objects/79/ba7ea0836b93b3f178067bcd0a0945dbc26b3f": "f3e31aec622d6cf63f619aa3a6023103",
".git/objects/66/34d2a05fbe3ded78ea94678c4bf849a369f4f7": "29c42d3f2a8a26d74acabb4d0620b6c5",
".git/objects/c8/18cbbbc4afbdd89647d4fcdee89cabcec64654": "70195585336320ff20171389d6abd38d",
".git/objects/aa/fcbfbf6382a86b5ec2242080e48020dc64ff97": "ee78e895a0ddc666b3d53847b0036aa6",
".git/objects/6d/010fffa29a9f0a783dd5b76429f05846cf582a": "28599b817e30b4e0e486959d09d4dcd8",
".git/objects/ab/0e98497a51ead7821d1da35a24968ff314e50f": "557c35fe3928eb2af403d1b3926bb9ba",
".git/objects/ab/d955ff935010ba20c9a291f1295ae206c2830c": "d413ec555d4ba78110675cbfb931aa08",
".git/config": "dd69b0045e2268d9442205b0e4743842",
"main.dart.js": "f741ceff596d74355e91f09f2e700d54",
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
"version.json": "9928cab8b88cea9826101cd40698a07d",
"index.html": "91116476150a836d696599f261de6ad9",
"/": "91116476150a836d696599f261de6ad9"
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
