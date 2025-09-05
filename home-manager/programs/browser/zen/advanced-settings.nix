{...}: {
  programs.zen-browser.policies = let
    mkLockedAttrs = builtins.mapAttrs (_: value: {
      "Value" = value;
      "Status" = "locked";
    });
  in {
    Preferences = mkLockedAttrs {
      # https://github.com/Eratas/rapidfox/wiki/Rapidfox-Guide-v7.1
      # === MANDATORY UNLOCK ===
      "browser.preferences.defaultPerformanceSettings.enabled" = false;

      # === BALANCED NETWORK SETTINGS ===
      "network.http.max-connections" = 1200;
      "network.http.max-persistent-connections-per-server" = 8;
      "network.http.max-urgent-start-excessive-connections-per-host" = 5;
      "network.http.request.max-start-delay" = 5;
      "network.http.pacing.requests.burst" = 32;
      "network.http.pacing.requests.min-parallelism" = 10;

      # === DNS OPTIMIZATION ===
      "network.dnsCacheExpiration" = 600;
      "network.dnsCacheExpirationGracePeriod" = 120;
      "network.dnsCacheEntries" = 10000;
      "network.ssl_tokens_cache_capacity" = 32768;

      # === BALANCED CACHE SETTINGS ===
      "browser.cache.disk.enable" = true;
      "browser.cache.disk.capacity" = 2097152; # 2GB disk cache
      "browser.cache.disk.smart_size.enabled" = false;
      "browser.cache.memory.capacity" = 65536; # 64MB RAM cache
      "browser.cache.memory.max_entry_size" = 16384; # 16MB max entry
      "browser.cache.disk.metadata_memory_limit" = 16384;
      "browser.cache.max_shutdown_io_lag" = 100;

      # === BALANCED MEMORY MANAGEMENT ===
      "javascript.options.mem.high_water_mark" = 128;
      "image.mem.max_decoded_image_kb" = 256000; # 250MB
      "image.cache.size" = 5242880; # 5MB
      "image.mem.decode_bytes_at_a_time" = 65536;
      "image.mem.shared.unmap.min_expiration_ms" = 90000;

      # === ENHANCED MEDIA SETTINGS ===
      "media.memory_cache_max_size" = 524288; # 512MB
      "media.memory_caches_combined_limit_kb" = 2097152; # 2GB total
      "media.cache_readahead_limit" = 480; # 8 minutes
      "media.cache_resume_threshold" = 240; # 4 minutes

      # === OPTIMIZED CONTENT PROCESSING ===
      "content.notify.interval" = 100000;
      "content.max.tokenizing.time" = 1000000;
      "content.switch.threshold" = 500000;
      "content.interrupt.parsing" = true;
      "content.notify.ontimer" = true;
      "content.maxtextrun" = 8191;

      # === BALANCED PROCESS MANAGEMENT ===
      "dom.ipc.processCount" = 4;
      "dom.ipc.keepProcessesAlive.web" = 2;
      "dom.ipc.processPriorityManager.backgroundUsesEcoQoS" = false;
      "accessibility.force_disabled" = 1;

      # === ENHANCED GPU ACCELERATION ===
      "gfx.webrender.all" = true;
      "gfx.webrender.enabled" = true;
      "gfx.webrender.compositor" = true;
      "gfx.webrender.precache-shaders" = true;
      "gfx.canvas.accelerated.cache-items" = 16384;
      "gfx.canvas.accelerated.cache-size" = 2048;
      "gfx.canvas.max-size" = 8192;
      "gfx.content.skia-font-cache-size" = 32;
      "webgl.max-size" = 8192;
      "dom.webgpu.enabled" = true;

      # === PERFECT SCROLLING ===
      "general.smoothScroll" = true;
      "general.smoothScroll.msdPhysics.enabled" = false;
      "general.smoothScroll.currentVelocityWeighting" = 0;
      "apz.overscroll.enabled" = false;
      "general.smoothScroll.stopDecelerationWeighting" = 1;
      "general.smoothScroll.mouseWheel.durationMaxMS" = 150;
      "general.smoothScroll.mouseWheel.durationMinMS" = 50;
      "mousewheel.min_line_scroll_amount" = 18;
      "mousewheel.scroll_series_timeout" = 10;

      # === WINDOWS OPTIMIZATIONS ===
      "config.trim_on_minimize" = true;
      "timer.auto_increase_timer_resolution" = true;
      "widget.windows.mica" = false;
      "widget.windows.mica.toplevel-backdrop" = 3;

      # === MODERN CODEC SUPPORT ===
      "dom.media.webcodecs.h265.enabled" = true;
      "media.wmf.hevc.enabled" = true;

      # === EFFICIENT PREFETCH CONTROL ===
      "network.http.speculative-parallel-limit" = 0;
      "network.dns.disablePrefetch" = true;
      "network.dns.disablePrefetchFromHTTPS" = true;
      "network.prefetch-next" = false;
      "network.predictor.enabled" = false;
      "network.predictor.enable-prefetch" = false;
      "browser.urlbar.speculativeConnect.enabled" = false;
      "browser.places.speculativeConnect.enabled" = false;

      # === PRIVACY & PERFORMANCE BALANCE ===
      "privacy.trackingprotection.enabled" = true;
      "privacy.query_stripping.enabled" = true;
      "privacy.query_stripping.enabled.pbmode" = true;
      "network.http.referer.XOriginPolicy" = 0;
      "network.http.referer.XOriginTrimmingPolicy" = 0;
      "browser.safebrowsing.downloads.remote.enabled" = false;

      # === SESSION MANAGEMENT ===
      "browser.sessionstore.interval" = 60000; # 1 minute
      "browser.sessionhistory.max_total_viewers" = 8;
      "browser.sessionstore.max_tabs_undo" = 10;
      "browser.sessionstore.max_entries" = 10;
      "dom.storage.default_quota" = 20480; # 20MB
      "dom.storage.shadow_writes" = true;

      # === UI RESPONSIVENESS ===
      "ui.submenuDelay" = 0;
      "browser.uidensity" = 0;
      "layout.frame_rate" = -1;
      "nglayout.initialpaint.delay" = 5;
      "dom.element.animate.enabled" = true;
    };
  };
}
