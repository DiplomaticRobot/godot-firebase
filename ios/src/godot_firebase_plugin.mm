//
// © 2026-present https://github.com/<<GitHubUsername>>
//

#import "godot_firebase_plugin.h"

#import "godot_firebase_plugin-Swift.h"

#import "godot_firebase_logger.h"


const String TEMPLATE_READY_SIGNAL = "template_ready";
// TODO: Define all signals


GodotFirebasePlugin* GodotFirebasePlugin::instance = NULL;


void GodotFirebasePlugin::_bind_methods() {
	ClassDB::bind_method(D_METHOD("get_godot_firebase"), &GodotFirebasePlugin::get_godot_firebase);
	// TODO: Register all methods

	ADD_SIGNAL(MethodInfo(TEMPLATE_READY_SIGNAL, PropertyInfo(Variant::DICTIONARY, "a_dict")));
	// TODO: Register all signals
}

Array GodotFirebasePlugin::get_godot_firebase() {
	os_log_debug(godot_firebase_log, "::get_godot_firebase()");

	Array godot_array = Array();

	return godot_array;
}

GodotFirebasePlugin::GodotFirebasePlugin() {
	os_log_debug(godot_firebase_log, "Plugin singleton constructor");

	ERR_FAIL_COND(instance != NULL);

	instance = this;
}

GodotFirebasePlugin::~GodotFirebasePlugin() {
	os_log_debug(godot_firebase_log, "Plugin singleton destructor");

	if (instance == this) {
		instance = nullptr;
	}
}
