'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {".git/COMMIT_EDITMSG": "9d8a295242237cfcbfc0c788a8f69d72",
".git/config": "84de8efda12674dab5dc95593170fcd5",
".git/description": "a0a7c3fff21f2aea3cfa1d0316dd816c",
".git/HEAD": "5ab7a4355e4c959b0c5c008f202f51ec",
".git/hooks/applypatch-msg.sample": "ce562e08d8098926a3862fc6e7905199",
".git/hooks/commit-msg.sample": "579a3c1e12a1e74a98169175fb913012",
".git/hooks/fsmonitor-watchman.sample": "ea587b0fae70333bce92257152996e70",
".git/hooks/post-update.sample": "2b7ea5cee3c49ff53d41e00785eb974c",
".git/hooks/pre-applypatch.sample": "054f9ffb8bfe04a599751cc757226dda",
".git/hooks/pre-commit.sample": "305eadbbcd6f6d2567e033ad12aabbc4",
".git/hooks/pre-merge-commit.sample": "39cb268e2a85d436b9eb6f47614c3cbc",
".git/hooks/pre-push.sample": "2c642152299a94e05ea26eae11993b13",
".git/hooks/pre-rebase.sample": "56e45f2bcbc8226d2b4200f7c46371bf",
".git/hooks/pre-receive.sample": "2ad18ec82c20af7b5926ed9cea6aeedd",
".git/hooks/prepare-commit-msg.sample": "2b5c047bdb474555e1787db32b2d2fc5",
".git/hooks/push-to-checkout.sample": "c7ab00c7784efeadad3ae9b228d4b4db",
".git/hooks/update.sample": "647ae13c682f7827c22f5fc08a03674e",
".git/index": "0b82eca7c1da1d54fffe400957f4906d",
".git/info/exclude": "036208b4a1ab4a235d75c181e685e5a3",
".git/logs/HEAD": "c1f6e6f25fd20411ac4f80cf4df8fbf1",
".git/logs/refs/heads/gh-pages": "2813cf0a9c67ddfe24ffe59e3bfa23a3",
".git/logs/refs/remotes/origin/gh-pages": "a6a3723776d8a69b5189ca69dacf13b8",
".git/objects/02/02a94dda95eb9cc623841bb9e9ac8a4e65d53a": "866158668140766711c533e088ab26e1",
".git/objects/08/32d0db2def1613c1c45aa4fe9156a1c6b7d589": "e05df183e5eeaddf39672a2516f9c41d",
".git/objects/18/db263dbdc958f63f14c4904cb7e2124c766ecc": "f8de7758db8b931ae09f803f670ed09a",
".git/objects/18/fcda1ce77c17ab1c68e452450d16c39ec78df4": "0d88e3836867a10af7f53b32661cbb8b",
".git/objects/1e/033de5043d6248fba3f65198d7fcaab00aa3d9": "c130c7f8bfb45f5d84073174f13f15e7",
".git/objects/1f/45b5bcaac804825befd9117111e700e8fcb782": "7a9d811fd6ce7c7455466153561fb479",
".git/objects/29/772e3b4931fb845bb60d931a18c3ed0eecb2cb": "877fe6e16871b10693987e26c8d59c60",
".git/objects/31/4447e385219f26e10dc94209033e39d5b7d18d": "8494d5bd62c61fa6843e345aab2412c4",
".git/objects/32/aa3cae58a7432051fc105cc91fca4d95d1d011": "4f8558ca16d04c4f28116d3292ae263d",
".git/objects/3a/7525f2996a1138fe67d2a0904bf5d214bfd22c": "ab6f2f6356cba61e57d5c10c2e18739d",
".git/objects/3c/70574b0109e3e4349cbcd3370c824f3073eba1": "4eacd5973caf268083def29ddbde2216",
".git/objects/40/0d5b186c9951e294699e64671b9dde52c6f6a0": "f6bd3c7f9b239e8898bace6f9a7446b9",
".git/objects/44/a8b8e41b111fcf913a963e318b98e7f6976886": "5014fdb68f6b941b7c134a717a3a2bc6",
".git/objects/46/4ab5882a2234c39b1a4dbad5feba0954478155": "2e52a767dc04391de7b4d0beb32e7fc4",
".git/objects/46/8c44d7a54f15e8f5c63e8cc4fa809b70a31ff7": "dfa72f19e816b92e728bd0901570e8f5",
".git/objects/4c/db0b4867d43c4bc6dbaa6102e7bac9492df330": "54e88d3736c57222b43a878e246ccb51",
".git/objects/4d/b958da8cab190182d43aba1525f3fb350d6a1d": "f5ad6fc4b7bc1dd80100765434f8bed8",
".git/objects/56/e66a204b43bb0dca556b21d28882cecd6f654a": "4a64598472f1759f321bddded87a9498",
".git/objects/57/32aa9374536caa16409a5a16cef1fda03206cc": "9a3f10b51517a197ceec7564c360c376",
".git/objects/59/5bf435d606aa2d3f9f10629a63975afba90472": "caa42c98ff71953e097d3860ac118f16",
".git/objects/6b/e909fbf40b23748412f0ea89bf0fae827ed976": "5f118419157d9534688915220cc803f7",
".git/objects/6e/7a8539259a03006f6f2db2bdef254d59b1dd48": "e6c6d08e675b60ea73c0de14da04e897",
".git/objects/80/c20b0f0a77b385bad8ddd53d7f2a8a36a79abb": "9f91768eab896e21df5b2204fd388fb8",
".git/objects/84/0516208d35dcb4298847ab835e2ef84ada92fa": "36a4a870d8d9c1c623d8e1be329049da",
".git/objects/84/4f5abb6d61db81e4e6a0d5fa17d517b848a397": "ece5499b8b84eff46c8fb08b9c5f4dc5",
".git/objects/84/f666a5af390023ce2e618d347d882c98dd1004": "b6be11f7205869b3448aaa466cf0f364",
".git/objects/85/6a39233232244ba2497a38bdd13b2f0db12c82": "eef4643a9711cce94f555ae60fecd388",
".git/objects/87/f604a3311216638343f0a79d5e76c8a5f2cf03": "528bc5a0448f8ec16a0eeaddae780f86",
".git/objects/88/cfd48dff1169879ba46840804b412fe02fefd6": "e42aaae6a4cbfbc9f6326f1fa9e3380c",
".git/objects/8a/aa46ac1ae21512746f852a42ba87e4165dfdd1": "1d8820d345e38b30de033aa4b5a23e7b",
".git/objects/90/bcfcf0a77ab618a826db0fd8b0942963b653af": "fc109675cdf1233dd6599a4c3c0a7a69",
".git/objects/93/4ec9a118df3faf68774e3d1add43fef469838b": "16fd31bcf5d83a78a66618b39d803a44",
".git/objects/98/57c9b3b0448c92818efc5fda0f206b21914168": "ecbde07c564dabbec0f249821051b8af",
".git/objects/98/5ff2f6ebe24ac12f9668af4a92eb1aa16e3044": "863f32cd15267e919437e2c9f7b433cc",
".git/objects/99/69abf551bb822f3c3ca7eb1ce23f93f38612bf": "44c6d9e222ff10f87ce4ef7fae0b2801",
".git/objects/9f/b3c041f6a86995b9b159fbb016e5ea349972c8": "fac3cbc7d268a5cc89e25a02fe8d72e6",
".git/objects/a1/f57385865473375fee76e37447e924f18d5a83": "7defbb5035241a811a1518b1253c9318",
".git/objects/a2/e29e376af03a78cefd4b43eb005e0b53e46f49": "f2b953fdae02f6c593a68eb831d5117a",
".git/objects/aa/d3165bf5666fe1a7673def5e8cafdd1e7d4a0c": "254283d7ec65519af0fba01afc482d18",
".git/objects/ac/e88f74f8d2eeb58d158605417d06f02330de1d": "e3c6dba4ce8ea63c13d1f6bbfd4a81fb",
".git/objects/ae/c3455c3c1738868439177dd64946132f27975a": "d8f553424a9c4dbb7d302ff3ba6cc991",
".git/objects/b1/5ad935a6a00c2433c7fadad53602c1d0324365": "8f96f41fe1f2721c9e97d75caa004410",
".git/objects/b7/49bfef07473333cf1dd31e9eed89862a5d52aa": "36b4020dca303986cad10924774fb5dc",
".git/objects/b9/2a0d854da9a8f73216c4a0ef07a0f0a44e4373": "f62d1eb7f51165e2a6d2ef1921f976f3",
".git/objects/ba/5317db6066f0f7cfe94eec93dc654820ce848c": "9b7629bf1180798cf66df4142eb19a4e",
".git/objects/c0/8c87792d7a68ffd71898fa598b9b983f7e7ef9": "f455d63cfccab304798020f3d589d259",
".git/objects/c2/6256edfff5ab2a0f83b23d4a6a8bcec423530e": "4ed6c980af3f66463925918a5b910dab",
".git/objects/c2/9d1161207f845649b44942212e1636cbaf4e0d": "663c62c195c2e6dbbffca3be4d21a0c7",
".git/objects/cc/747e610c5934c12670983020990c70abaf381a": "9d9eb6ed0a8b608c3d290004d08df0b4",
".git/objects/cc/fcb55261ca477cc4efa673cfd3f7db80eb7a3a": "de28d906d92d88d5b438e5ea7c98503f",
".git/objects/cd/ff18c100fe4378f6e40f316939ac1217085d5d": "63014aa27c098c6dd4d4a86282a0e47d",
".git/objects/d0/23371979cf1e985205df19078051c10de0a82d": "700b71074bad7afee32068791dec7442",
".git/objects/d0/2bd71477582bed6c8c7dcecc480b221a0291a8": "8f6783be13ad82f7dbfe9bb7348b5569",
".git/objects/d4/3532a2348cc9c26053ddb5802f0e5d4b8abc05": "3dad9b209346b1723bb2cc68e7e42a44",
".git/objects/d5/bb50b3c3bc534b51ba035a5e8495ba7af5025b": "81d30e6f235d2cd1960b1a0d917b3043",
".git/objects/d6/95e3ad75285f0fdec1782ebf1f064d5c442d7b": "837e706adf5c9d32baaf90f59701e3c2",
".git/objects/d6/9c56691fbdb0b7efa65097c7cc1edac12a6d3e": "868ce37a3a78b0606713733248a2f579",
".git/objects/da/fd65422747502c19b5c74b4230282644d2169c": "d8a62caf99a372ff6c7692e143787ce3",
".git/objects/e9/b8d76d0df118d295b79717987785fe473a51d2": "ad6d4054d6e336ce43306c5e9a9c7eab",
".git/objects/eb/9b4d76e525556d5d89141648c724331630325d": "37c0954235cbe27c4d93e74fe9a578ef",
".git/objects/ec/df0a918d01240d25f4de03d3b22a3d46954033": "8e1f2e4a4dba488e11f325c54dd4c91f",
".git/objects/f2/04823a42f2d890f945f70d88b8e2d921c6ae26": "6b47f314ffc35cf6a1ced3208ecc857d",
".git/objects/fb/d28cd57723cfdaa77879a7d5a5b154f46e417a": "054ddf9fbda021b701282e433c3d8a21",
".git/refs/heads/gh-pages": "242c35c3cfc35a42be39ecb71108bda8",
".git/refs/remotes/origin/gh-pages": "242c35c3cfc35a42be39ecb71108bda8",
"assets/AssetManifest.bin": "206006035db9021b415e1b21d6b01845",
"assets/AssetManifest.bin.json": "009f1b1153d6c1744df805d5f5bdc43d",
"assets/AssetManifest.json": "f92c449cff1094f826a36c61b5debfa9",
"assets/assets/icons/avatar.svg": "cca40a7e6ff4f49811f9310a59e7b802",
"assets/assets/icons/barcode.png": "a733cf1cf4d1f675dd4e3adf22f7bdd1",
"assets/assets/icons/notification.png": "1350bd4c57565f4e53e00ba587cafe69",
"assets/assets/icons/search.png": "e4fbeda2e389b309dd7f9d9aad2c0a67",
"assets/assets/images/building.png": "796b250ec90d3ecb0d4b9d3fd9a74e6c",
"assets/assets/images/mainlogo.png": "9fc9ce4add99bf640c57270d791d2147",
"assets/assets/images/moving.png": "3c097a109b15ae60ae2fe8e2dc4f85bd",
"assets/assets/images/ncp.png": "2654f10bea9fb069f2136ed8f95ef5da",
"assets/assets/images/nodata.jpg": "9e89f48a1c8a912ca70730fa4cb31749",
"assets/assets/images/notfound.jpg": "45c8c9f215e628d6de2c19c1cd1dd4cd",
"assets/assets/images/station.png": "7d16bb1a18a16228f4b337886ca85e28",
"assets/assets/images/trolley.png": "abb8f6cab1902572b5849cfc31550c98",
"assets/assets/images/unloading.png": "594ac27498b1cf64471c3ef0c432455b",
"assets/assets/images/unpack.png": "1765ca38a42ef0b90715c011872799af",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "9a3e1965a0eb475714bc3ababca8f450",
"assets/NOTICES": "8a2c1ff4eb4999053e9b31608c1d4618",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "e986ebe42ef785b27164c36a9abc7818",
"assets/packages/simple_barcode_scanner/assets/barcode.html": "55dd479b440ade30760a1b3a4db300f1",
"assets/packages/simple_barcode_scanner/assets/html5-qrcode.min.js": "d88d3200cb547c9e86ee972975561dcd",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "66177750aff65a66cb07bb44b8c6422b",
"canvaskit/canvaskit.js.symbols": "48c83a2ce573d9692e8d970e288d75f7",
"canvaskit/canvaskit.wasm": "1f237a213d7370cf95f443d896176460",
"canvaskit/chromium/canvaskit.js": "671c6b4f8fcc199dcc551c7bb125f239",
"canvaskit/chromium/canvaskit.js.symbols": "a012ed99ccba193cf96bb2643003f6fc",
"canvaskit/chromium/canvaskit.wasm": "b1ac05b29c127d86df4bcfbf50dd902a",
"canvaskit/skwasm.js": "694fda5704053957c2594de355805228",
"canvaskit/skwasm.js.symbols": "262f4827a1317abb59d71d6c587a93e2",
"canvaskit/skwasm.wasm": "9f0c0c02b82a910d12ce0543ec130e60",
"canvaskit/skwasm.worker.js": "89990e8c92bcb123999aa81f7e203b1c",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "f393d3c16b631f36852323de8e583132",
"flutter_bootstrap.js": "22e8a21c837fba378043c452fcc51f41",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "7193886a56662c33ad174278e14fee18",
"/": "7193886a56662c33ad174278e14fee18",
"main.dart.js": "a56438fa26dd2fac737f6099e7eff430",
"manifest.json": "0d5d9713d4668e450eb32ca152246e2d",
"version.json": "53590a85f932bd7c03bb2d6663fd8705"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
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
        // Claim client to enable caching on first launch
        self.clients.claim();
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
      // Claim client to enable caching on first launch
      self.clients.claim();
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
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
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
