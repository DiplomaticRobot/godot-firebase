//
// © 2026-present https://github.com/<<GitHubUsername>>
//

#ifndef godot_firebase_plugin_h
#define godot_firebase_plugin_h

#import <Foundation/Foundation.h>

#include "core/object/object.h"
#include "core/object/class_db.h"


@class GodotFirebase;


extern const String TEMPLATE_READY_SIGNAL;
// TODO: Declare all signals


class GodotFirebasePlugin : public Object {
	GDCLASS(GodotFirebasePlugin, Object);

private:
	static GodotFirebasePlugin* instance; // Singleton instance

	static void _bind_methods();

public:
	Array get_godot_firebase();
	// TODO: Declare all methods

	GodotFirebasePlugin();
	~GodotFirebasePlugin();
};

#endif /* godot_firebase_plugin_h */
