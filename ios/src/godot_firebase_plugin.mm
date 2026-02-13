//
// © 2026-present https://github.com/<<GitHubUsername>>
//

#import "godot_firebase_plugin.h"

#import "godot_firebase_plugin-Swift.h"

#import "godot_firebase_logger.h"


const String INITIALIZATION_COMPLETED_SIGNAL = "initialization_completed";
const String INITIALIZATION_ERROR_SIGNAL = "initialization_error";


GodotFirebasePlugin* GodotFirebasePlugin::instance = NULL;


void GodotFirebasePlugin::_bind_methods() {
	ClassDB::bind_method(D_METHOD("initialize"), &GodotFirebasePlugin::initialize);
	ClassDB::bind_method(D_METHOD("is_initialized"), &GodotFirebasePlugin::is_initialized);

	ADD_SIGNAL(MethodInfo(INITIALIZATION_COMPLETED_SIGNAL));
	ADD_SIGNAL(MethodInfo(INITIALIZATION_ERROR_SIGNAL, PropertyInfo(Variant::STRING, "error_message")));
}

void GodotFirebasePlugin::initialize() {
	os_log_debug(godot_firebase_log, "::initialize()");

	if (godot_firebase == nil) {
		os_log_error(godot_firebase_log, "GodotFirebase Swift instance is nil");
		emit_signal(INITIALIZATION_ERROR_SIGNAL, String("GodotFirebase Swift instance is nil"));
		return;
	}

	[godot_firebase initialize];
}

bool GodotFirebasePlugin::is_initialized() {
	if (godot_firebase == nil) {
		return false;
	}
	return [godot_firebase isInitialized];
}

GodotFirebasePlugin::GodotFirebasePlugin() {
	os_log_debug(godot_firebase_log, "Plugin singleton constructor");

	ERR_FAIL_COND(instance != NULL);

	instance = this;

	godot_firebase = [[GodotFirebase alloc] init];

	// Bridge Swift callbacks to Godot signals
	[godot_firebase setOnInitializationCompleted:^{
		os_log_debug(godot_firebase_log, "Firebase initialization completed");
		instance->emit_signal(INITIALIZATION_COMPLETED_SIGNAL);
	}];

	[godot_firebase setOnInitializationError:^(NSString* errorMessage) {
		os_log_error(godot_firebase_log, "Firebase initialization error: %{public}@", errorMessage);
		instance->emit_signal(INITIALIZATION_ERROR_SIGNAL, String([errorMessage UTF8String]));
	}];
}

GodotFirebasePlugin::~GodotFirebasePlugin() {
	os_log_debug(godot_firebase_log, "Plugin singleton destructor");

	if (instance == this) {
		instance = nullptr;
	}

	godot_firebase = nil;
}
