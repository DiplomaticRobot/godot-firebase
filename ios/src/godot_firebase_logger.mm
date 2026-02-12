//
// © 2026-present https://github.com/<<GitHubUsername>>
//

#import "godot_firebase_logger.h"

// Define and initialize the shared os_log_t instance
os_log_t godot_firebase_log;

__attribute__((constructor)) // Automatically runs at program startup
static void initialize_godot_firebase_log(void) {
	godot_firebase_log = os_log_create("org.godotengine.plugin.godot_firebase", "GodotFirebasePlugin");
}
