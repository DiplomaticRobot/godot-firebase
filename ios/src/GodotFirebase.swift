//
// © 2026-present https://github.com/<<GitHubUsername>>
//

import Foundation
import FirebaseCore

@objc public class GodotFirebase: NSObject {

	// Callbacks to be set by the Objective-C++ bridge
	@objc public var onInitializationCompleted: (() -> Void)?
	@objc public var onInitializationError: ((_ errorMessage: String) -> Void)?

	@objc public private(set) var isInitialized: Bool = false

	override init() {
		super.init()
	}

	deinit {
	}

	@objc public func initialize() {
		if isInitialized {
			onInitializationCompleted?()
			return
		}

		if FirebaseApp.app() != nil {
			isInitialized = true
			onInitializationCompleted?()
			return
		}

		do {
			FirebaseApp.configure()
			isInitialized = true
			onInitializationCompleted?()
		} catch {
			let errorMsg = "Firebase initialization failed: \(error.localizedDescription)"
			onInitializationError?(errorMsg)
		}
	}
}
