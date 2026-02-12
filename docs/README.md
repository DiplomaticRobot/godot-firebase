<p align="center">
	<img width="256" height="256" src="https://raw.githubusercontent.com/godot-mobile-plugins/godot-godot-firebase/main/demo/assets/godot-firebase-android.png">
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<img width="256" height="256" src="https://raw.githubusercontent.com/godot-mobile-plugins/godot-godot-firebase/main/demo/assets/godot-firebase-ios.png">
</p>

---


# <img src="https://raw.githubusercontent.com/godot-mobile-plugins/godot-godot-firebase/main/addon/src/icon.png" width="24"> Godot Godot Firebase Plugin

A Godot plugin that provides a unified GDScript interface for getting information on plugin templates on **Android** and **iOS**.

**Key Features:**
- Get information about all available plugin templates
- Know when a template is ready
- ...

---

## <img src="https://raw.githubusercontent.com/godot-mobile-plugins/godot-godot-firebase/main/addon/src/icon.png" width="20"> Table of Contents
- [Installation](#installation)
- [Usage](#usage)
- [Signals](#signals)
- [Methods](#methods)
- [Classes](#classes)
- [Platform-Specific Notes](#platform-specific-notes)
- [Links](#links)
- [All Plugins](#all-plugins)
- [Credits](#credits)
- [Contributing](#contributing)

---

<a name="installation"></a>

## <img src="https://raw.githubusercontent.com/godot-mobile-plugins/godot-godot-firebase/main/addon/src/icon.png" width="20"> Installation
_Before installing this plugin, make sure to uninstall any previous versions of the same plugin._

_If installing both Android and iOS versions of the plugin in the same project, then make sure that both versions use the same addon interface version._

There are 2 ways to install the `GodotFirebase` plugin into your project:
- Through the Godot Editor's AssetLib
- Manually by downloading archives from Github

### <img src="https://raw.githubusercontent.com/godot-mobile-plugins/godot-godot-firebase/main/addon/src/icon.png" width="18"> Installing via AssetLib
Steps:
- search for and select the `GodotFirebase` plugin in Godot Editor
- click `Download` button
- on the installation dialog...
	- keep `Change Install Folder` setting pointing to your project's root directory
	- keep `Ignore asset root` checkbox checked
	- click `Install` button
- enable the plugin via the `Plugins` tab of `Project->Project Settings...` menu, in the Godot Editor

#### <img src="https://raw.githubusercontent.com/godot-mobile-plugins/godot-godot-firebase/main/addon/src/icon.png" width="16"> Installing both Android and iOS versions of the plugin in the same project
When installing via AssetLib, the installer may display a warning that states "_[x number of]_ files conflict with your project and won't be installed." You can ignore this warning since both versions use the same addon code.

### <img src="https://raw.githubusercontent.com/godot-mobile-plugins/godot-godot-firebase/main/addon/src/icon.png" width="18"> Installing manually
Steps:
- download release archive from Github
- unzip the release archive
- copy to your Godot project's root directory
- enable the plugin via the `Plugins` tab of `Project->Project Settings...` menu, in the Godot Editor

---

<a name="usage"></a>


## <img src="https://raw.githubusercontent.com/godot-mobile-plugins/godot-godot-firebase/main/addon/src/icon.png" width="20"> Usage
Add `GodotFirebase` node to your main scene or an autoload global scene.

- use the `GodotFirebase` node's `get_godot_firebase()` method to get information on all available plugin templates
- connect `GodotFirebase` node signals
	- `template_ready(a_template: GodotFirebaseInfo)`
	- ...

Example usage:
```
@onready var godot_firebase := $GodotFirebase

func _ready():
	godot_firebase.template_ready.connect(_on_template_ready)

	var templates: Array[GodotFirebaseInfo] = godot_firebase.get_godot_firebase()
	for template in templates:
		print("Template description: %s" % [template.get_description()])

func _on_template_ready(template: GodotFirebaseInfo):
	print("Template ready:", template.get_description())
```

---

<a name="signals"></a>

## <img src="https://raw.githubusercontent.com/godot-mobile-plugins/godot-godot-firebase/main/addon/src/icon.png" width="20"> Signals
- register listeners to the following signals of the `GodotFirebase` node:
	- `template_ready(a_template: GodotFirebaseInfo)`
	- ...

---

<a name="methods"></a>

## <img src="https://raw.githubusercontent.com/godot-mobile-plugins/godot-godot-firebase/main/addon/src/icon.png" width="20"> Methods
- `get_godot_firebase() -> Array[GodotFirebaseInfo]` - returns an array of `GodotFirebaseInfo` objects

---

<a name="classes"></a>

## <img src="https://raw.githubusercontent.com/godot-mobile-plugins/godot-godot-firebase/main/addon/src/icon.png" width="20"> Classes

### <img src="https://raw.githubusercontent.com/godot-mobile-plugins/godot-godot-firebase/main/addon/src/icon.png" width="16"> GodotFirebaseInfo
- Encapsulates plugin template information.
- Properties:
	- `description`: description of the template
	- `other`: ...
	- ...

---

<a name="platform-specific-notes"></a>

## <img src="https://raw.githubusercontent.com/godot-mobile-plugins/godot-godot-firebase/main/addon/src/icon.png" width="20"> Platform-Specific Notes

### Android
- Download Android export template and enable gradle build from export settings
- **Troubleshooting:**
- Logs: `adb logcat | grep 'godot'` (Linux), `adb.exe logcat | select-string "godot"` (Windows)
- You may find the following resources helpful:
	- https://docs.godotengine.org/en/stable/tutorials/export/exporting_for_android.html
	- https://developer.android.com/tools/adb
	- https://developer.android.com/studio/debug
	- https://developer.android.com/courses

### iOS
- Follow instructions on [Exporting for iOS](https://docs.godotengine.org/en/stable/tutorials/export/exporting_for_ios.html)
- View XCode logs while running the game for troubleshooting.
- See [Godot iOS Export Troubleshooting](https://docs.godotengine.org/en/stable/tutorials/export/exporting_for_ios.html#troubleshooting).

---

<a name="links"></a>

# <img src="https://raw.githubusercontent.com/godot-mobile-plugins/godot-godot-firebase/main/addon/src/icon.png" width="24"> Links

- [AssetLib Entry Android](https://godotengine.org/asset-library/asset/9999)
- [AssetLib Entry iOS](https://godotengine.org/asset-library/asset/8888)

---

# <img src="https://raw.githubusercontent.com/godot-mobile-plugins/godot-godot-firebase/main/addon/src/icon.png" width="24"> All Plugins

| Plugin | Android | iOS | Free | Open Source | License |
| :--- | :---: | :---: | :---: | :---: | :---: |
| [Admob](https://github.com/godot-sdk-integrations/godot-admob) | ✅ | ✅ | ✅ | ✅ | MIT |
| [Notification Scheduler](https://github.com/godot-mobile-plugins/godot-notification-scheduler) | ✅ | ✅ | ✅ | ✅ | MIT |
| [Deeplink](https://github.com/godot-mobile-plugins/godot-deeplink) | ✅ | ✅ | ✅ | ✅ | MIT |
| [Share](https://github.com/godot-mobile-plugins/godot-share) | ✅ | ✅ | ✅ | ✅ | MIT |
| [In-App Review](https://github.com/godot-mobile-plugins/godot-inapp-review) | ✅ | ✅ | ✅ | ✅ | MIT |
| [Native Camera](https://github.com/godot-mobile-plugins/godot-native-camera) | ✅ | ✅ | ✅ | ✅ | MIT |
| [Connection State](https://github.com/godot-mobile-plugins/godot-connection-state) | ✅ | ✅ | ✅ | ✅ | MIT |
| [OAuth 2.0](https://github.com/godot-mobile-plugins/godot-oauth2) | ✅ | ✅ | ✅ | ✅ | MIT |
| [QR](https://github.com/godot-mobile-plugins/godot-qr) | ✅ | ✅ | ✅ | ✅ | MIT |
| [Godot Firebase](https://github.com/godot-mobile-plugins/godot-godot-firebase) | ✅ | ✅ | ✅ | ✅ | MIT |

---

<a name="credits"></a>

# <img src="https://raw.githubusercontent.com/godot-mobile-plugins/godot-godot-firebase/main/addon/src/icon.png" width="24"> Credits

Developed by [<<AuthorName>>](https://github.com/<<GitHubUsername>>)

Original repository: [Godot Godot Firebase Plugin](https://github.com/godot-mobile-plugins/godot-godot-firebase)

---

<a name="contributing"></a>

# <img src="https://raw.githubusercontent.com/godot-mobile-plugins/godot-godot-firebase/main/addon/src/icon.png" width="24"> Contributing

See [our guide](https://github.com/godot-mobile-plugins/godot-godot-firebase?tab=contributing-ov-file) if you would like to contribute to this project.
