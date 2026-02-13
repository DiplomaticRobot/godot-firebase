//
// © 2026-present https://github.com/<<GitHubUsername>>
//

#ifndef godot_firebase_plugin_h
#define godot_firebase_plugin_h

#import <Foundation/Foundation.h>

#include "core/object/object.h"
#include "core/object/class_db.h"


@class GodotFirebase;


extern const String INITIALIZATION_COMPLETED_SIGNAL;
extern const String INITIALIZATION_ERROR_SIGNAL;


class GodotFirebasePlugin : public Object {
	GDCLASS(GodotFirebasePlugin, Object);

private:
	static GodotFirebasePlugin* instance; // Singleton instance
	GodotFirebase* godot_firebase;

	static void _bind_methods();

public:
	void initialize();
	bool is_initialized();

	GodotFirebasePlugin();
	~GodotFirebasePlugin();
};

#endif /* godot_firebase_plugin_h */
