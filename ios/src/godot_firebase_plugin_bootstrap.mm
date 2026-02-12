//
// © 2026-present https://github.com/<<GitHubUsername>>
//

#import <Foundation/Foundation.h>

#import "godot_firebase_plugin_bootstrap.h"
#import "godot_firebase_plugin.h"
#import "godot_firebase_logger.h"

#import "core/config/engine.h"


GodotFirebasePlugin *godot_firebase_plugin;


void godot_firebase_plugin_init() {
	os_log_debug(godot_firebase_log, "GodotFirebasePlugin: Initializing plugin at timestamp: %f", [[NSDate date] timeIntervalSince1970]);

	godot_firebase_plugin = memnew(GodotFirebasePlugin);
	Engine::get_singleton()->add_singleton(Engine::Singleton("GodotFirebasePlugin", godot_firebase_plugin));
	os_log_debug(godot_firebase_log, "GodotFirebasePlugin: Singleton registered");
}


void godot_firebase_plugin_deinit() {
	os_log_debug(godot_firebase_log, "GodotFirebasePlugin: Deinitializing plugin");
	godot_firebase_log = NULL; // Prevent accidental reuse

	if (godot_firebase_plugin) {
		memdelete(godot_firebase_plugin);
		godot_firebase_plugin = nullptr;
	}
}
