/************************************************************
 * Author: Aumnescio
 * Based on: BetterFox
    - Link: "https://github.com/yokoffing/BetterFox"
 * Description:
    - Improved performance, and security.
    - Much better smoothscroll.
    - Other minor improvements.
************************************************************/

/// START => Experimental CSS Settings
// user_pref("layout.css.has-selector.enabled", true);

/// START => FastFox Settings
//
// |> Initial Pain Delay        ( Default: 5 | Impact: Extremely Low )
user_pref("nglayout.initialpaint.delay", 1);
user_pref("nglayout.initialpaint.delay_in_oopif", 1);

// |> preSkeletonUI             ( Default: true | Impact: Probably extremely Low )
user_pref("browser.startup.preXulSkeletonUI", false);

// |> Webrender and GPU
// user_pref("gfx.webrender.all", true);
// user_pref("gfx.webrender.precache-shaders", true);
// user_pref("gfx.webrender.compositor", true);
// user_pref("gfx.webrender.compositor.force-enabled", true); // enforce
// user_pref("layers.gpu-process.enabled", true);
// user_pref("layers.gpu-process.force-enabled", true); // enforce
// user_pref("media.hardware-video-decoding.enabled", true);

// GPU-Accelerated Canvas
user_pref("gfx.canvas.accelerated", true);                      // Default on macOS and Linux v.110
user_pref("gfx.canvas.accelerated.cache-items", 32768);         // Impact unclear, presumably sacrificing memory for performance.
user_pref("gfx.canvas.accelerated.cache-size", 4096);           // Impact unclear, presumably sacrificing memory for performance.
user_pref("gfx.content.skia-font-cache-size", 80);              // Impact unclear, presumably sacrificing memory for performance.

// Image Tweaks (Doubling some cache sizes)
user_pref("image.cache.size", 10485760);
user_pref("image.mem.decode_bytes_at_a_time", 131072);          // alt=65536; preferred=262144; chunk size for calls to the image decoders
user_pref("image.mem.shared.unmap.min_expiration_ms", 120000);  // default=60000; minimum timeout to unmap shared surfaces since they have been last used

// Media Cache
user_pref("media.memory_cache_max_size", 1048576);              // alt=512000; also in Securefox (inactive there)
user_pref("media.memory_caches_combined_limit_kb", 2560000);    // preferred=3145728; // default=524288

// Video Buffering Range
// [NOTE] Does not affect videos over 720p since they use DASH playback [1]
user_pref("media.cache_readahead_limit", 120);  // default=60; stop reading ahead when our buffered data is this many seconds ahead of the current playback
user_pref("media.cache_resume_threshold", 60);  // default=30; when a network connection is suspended, don't resume it until the amount of buffered data falls below this threshold (in seconds)

// Browser Cache
user_pref("browser.cache.memory.max_entry_size", 153600);
//
/// END => FastFox Settings

/// START => SecureFox Settings
// |> Disable Telemetry
user_pref("toolkit.telemetry.unified", false);
user_pref("toolkit.telemetry.enabled", false);
user_pref("toolkit.telemetry.server", "data:,");
user_pref("toolkit.telemetry.archive.enabled", false);
user_pref("toolkit.telemetry.newProfilePing.enabled", false);
user_pref("toolkit.telemetry.shutdownPingSender.enabled", false);
user_pref("toolkit.telemetry.updatePing.enabled", false);
user_pref("toolkit.telemetry.bhrPing.enabled", false);
user_pref("toolkit.telemetry.firstShutdownPing.enabled", false);
user_pref("toolkit.telemetry.coverage.opt-out", true);
user_pref("toolkit.coverage.opt-out", true);
user_pref("datareporting.healthreport.uploadEnabled", false);
user_pref("datareporting.policy.dataSubmissionEnabled", false);
user_pref("app.shield.optoutstudies.enabled", false);
user_pref("browser.discovery.enabled", false);
user_pref("breakpad.reportURL", "");
user_pref("browser.tabs.crashReporting.sendReport", false);
user_pref("browser.crashReports.unsubmittedCheck.autoSubmit2", false);
user_pref("captivedetect.canonicalURL", "");
user_pref("network.captive-portal-service.enabled", false);
user_pref("network.connectivity-service.enabled", false);
user_pref("default-browser-agent.enabled", false);
user_pref("app.normandy.enabled", false);
user_pref("app.normandy.api_url", "");
user_pref("browser.ping-centre.telemetry", false);
user_pref("browser.newtabpage.activity-stream.feeds.telemetry", false);
user_pref("browser.newtabpage.activity-stream.telemetry", false);
//
/// END => SecureFox Settings

/// START => PeskyFox Settings
//
// Disable auto-refresh.
//  - Testing because MDN Web Docs flickers occasionally.
//  - This did not help.
// user_pref("accessibility.blockautorefresh", true);
//
// Remove feed crap.
user_pref("browser.newtabpage.activity-stream.feeds.topsites", false);
user_pref("browser.newtabpage.activity-stream.feeds.section.topstories", false);
// Disable Pocket
user_pref("extensions.pocket.enabled", false);
// Enable use of `userChrome.css` for Custom Firefox UI Styling and Theming.
user_pref("toolkit.legacyUserProfileCustomizations.stylesheets",        true);
//
/// END => PeskyFox Settings

/// |> START - Smooth Scrolling
user_pref("general.smoothScroll.msdPhysics.continuousMotionMaxDeltaMS",   12);
user_pref("general.smoothScroll.msdPhysics.enabled",                    true);
user_pref("general.smoothScroll.msdPhysics.motionBeginSpringConstant",   200);
user_pref("general.smoothScroll.msdPhysics.regularSpringConstant",       250);
user_pref("general.smoothScroll.msdPhysics.slowdownMinDeltaMS",           25);
user_pref("general.smoothScroll.msdPhysics.slowdownMinDeltaRatio",     "2.0");
user_pref("general.smoothScroll.msdPhysics.slowdownSpringConstant",      250);
user_pref("general.smoothScroll.currentVelocityWeighting",             "1.0");
user_pref("general.smoothScroll.stopDecelerationWeighting",            "1.0");

// Adjust multiply factor for Mousewheel Scrolling - or set to false if scrolling is way too fast.
user_pref("mousewheel.system_scroll_override.horizontal.factor",         250);
user_pref("mousewheel.system_scroll_override.vertical.factor",           250);
user_pref("mousewheel.system_scroll_override_on_root_content.enabled",  true);
user_pref("mousewheel.system_scroll_override.enabled",                  true);

// Adjust `pixels at a time` count for Mousewheel - cant do more than a page at once if <100.
user_pref("mousewheel.default.delta_multiplier_x",                       100);
user_pref("mousewheel.default.delta_multiplier_y",                       100);
user_pref("mousewheel.default.delta_multiplier_z",                       100);

// Reset a couple extra variables for consistency.
user_pref("apz.allow_zooming",                                          true);
user_pref("apz.force_disable_desktop_zooming_scrollbars",              false);
user_pref("apz.paint_skipping.enabled",                                 true);
user_pref("apz.windows.use_direct_manipulation",                        true);
user_pref("dom.event.wheel-deltaMode-lines.always-disabled",           false);
user_pref("general.smoothScroll.durationToIntervalRatio",                200);
user_pref("general.smoothScroll.lines.durationMaxMS",                    150);
user_pref("general.smoothScroll.lines.durationMinMS",                    150);
user_pref("general.smoothScroll.other.durationMaxMS",                    150);
user_pref("general.smoothScroll.other.durationMinMS",                    150);
user_pref("general.smoothScroll.pages.durationMaxMS",                    150);
user_pref("general.smoothScroll.pages.durationMinMS",                    150);
user_pref("general.smoothScroll.pixels.durationMaxMS",                   150);
user_pref("general.smoothScroll.pixels.durationMinMS",                   150);
user_pref("general.smoothScroll.scrollbars.durationMaxMS",               150);
user_pref("general.smoothScroll.scrollbars.durationMinMS",               150);
user_pref("general.smoothScroll.mouseWheel.durationMaxMS",               200);
user_pref("general.smoothScroll.mouseWheel.durationMinMS",                50);
user_pref("layers.async-pan-zoom.enabled",                              true);
user_pref("layout.css.scroll-behavior.spring-constant",                "250");
user_pref("mousewheel.transaction.timeout",                             1500);
user_pref("mousewheel.acceleration.factor",                               10);
user_pref("mousewheel.acceleration.start",                                -1);
user_pref("mousewheel.min_line_scroll_amount",                             5);
user_pref("toolkit.scrollbox.horizontalScrollDistance",                    5);
user_pref("toolkit.scrollbox.verticalScrollDistance",                      3);
/// |> END - Smooth Scrolling

// End of File
