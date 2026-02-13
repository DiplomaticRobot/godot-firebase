//
// © 2026-present https://github.com/<<GitHubUsername>>
//

package org.godotengine.plugin.godotfirebase;

import android.app.Activity;
import android.util.Log;
import android.view.View;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.godotengine.godot.Godot;
import org.godotengine.godot.Dictionary;
import org.godotengine.godot.plugin.GodotPlugin;
import org.godotengine.godot.plugin.SignalInfo;
import org.godotengine.godot.plugin.UsedByGodot;

import com.google.firebase.FirebaseApp;


public class GodotFirebasePlugin extends GodotPlugin {
	public static final String CLASS_NAME = GodotFirebasePlugin.class.getSimpleName();
	static final String LOG_TAG = "godot::" + CLASS_NAME;


	static final String INITIALIZATION_COMPLETED_SIGNAL = "initialization_completed";
	static final String INITIALIZATION_ERROR_SIGNAL = "initialization_error";

	private boolean isInitialized = false;

	public GodotFirebasePlugin(Godot godot) {
		super(godot);
	}

	@Override
	public String getPluginName() {
		return CLASS_NAME;
	}

	@Override
	public Set<SignalInfo> getPluginSignals() {
		Set<SignalInfo> signals = new HashSet<>();
		signals.add(new SignalInfo(INITIALIZATION_COMPLETED_SIGNAL));
		signals.add(new SignalInfo(INITIALIZATION_ERROR_SIGNAL, String.class));

		return signals;
	}

	@Override
	public View onMainCreate(Activity activity) {
		return super.onMainCreate(activity);
	}

	@Override
	public void onGodotSetupCompleted() {
		super.onGodotSetupCompleted();
	}

	@UsedByGodot
	public void initialize() {
		Log.d(LOG_TAG, "initialize() invoked");

		if (isInitialized) {
			emitSignal(INITIALIZATION_COMPLETED_SIGNAL);
			return;
		}

		try {
			Activity activity = getActivity();
			if (activity == null) {
				String error = "Activity is null, cannot initialize Firebase";
				Log.e(LOG_TAG, error);
				emitSignal(INITIALIZATION_ERROR_SIGNAL, error);
				return;
			}

			if (FirebaseApp.getApps(activity).isEmpty()) {
				FirebaseApp.initializeApp(activity);
			}

			isInitialized = true;
			Log.d(LOG_TAG, "Firebase initialized successfully");
			emitSignal(INITIALIZATION_COMPLETED_SIGNAL);
		} catch (Exception e) {
			String error = "Firebase initialization failed: " + e.getMessage();
			Log.e(LOG_TAG, error, e);
			emitSignal(INITIALIZATION_ERROR_SIGNAL, error);
		}
	}

	@UsedByGodot
	public boolean is_initialized() {
		return isInitialized;
	}

	@Override
	public void onMainDestroy() {
		isInitialized = false;
	}
}
