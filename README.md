# iOS Developer Documentation

**Minimum Platform Version**: iOS 15.0

**Current version:** 0.12.0

Fullview iOS SDK supports following frameworks:

- Native iOS
  - UIKit
  - SwiftUI

Other platforms supported:

  - Android
  - React Native
  - Flutter

Soon-supported platforms:

  - Ionic
  - Cordova


## Installation

### Swift Package Manager

Both **FullviewSDK** and **Daily** libraries are required. The easiest way to is to use Use XCode UI (`File -> Add Packages...`) using the following urls:

- **FullviewSDK**: `https://github.com/fullviewdev/fullview-sdk-ios`
- **Daily**: `https://github.com/daily-co/daily`

Alternatively, add the following to your `Package` dependencies:

```swift
.package(url: "https://github.com/fullviewdev/fullview-sdk-ios", .upToNextMinor(from: "0.11.0")),
.package(url: "https://github.com/daily-co/daily", from: "0.28.0"),
```

Then include `"FullviewSDK"` in your target dependencies. For example:

```swift
.target(name: "MySwiftPackage", dependencies: ["FullviewSDK", "Daily"]),
```

## Configuration

- Add the following permissions if you don't already have them:
	- **NSMicrophoneUsageDescription**
	- **NSCameraUsageDescription**
	- **UIBackgroundModes** **voip**


## Usage

Add `import FullviewSDK` and then use the methods in **FullviewCore** to configure and start the SDK.

A minimal implementation looks like the following:

```swift
import FullviewSDK

var fullview: FullviewCore?

do {
    let config = try FullviewConfig(
        region: <FullviewRegion>,
        organisationId: "<String>",
        userId: "<String>",
        deviceId: "<String>" // must be a uuid string
        name: "<String>",
        email: "<String>"
    )
    fullview = FullviewCore()
    fullview?.onError = { error in
        print("Runtime error: \(error)")
    }
    fullview?.register(config: config)
} catch {
    print("Error: \(error)")
}
```
*Note*: `device_id` must be an unique UUID. Generate it with `UUID().uuidString` and save it locally to be reused.

And use `FullviewCore.stop()` to disconnect and disable the SDK.
 
## Additional features usage
- [Data Redaction](data_redaction.md)
- [Screen Sharing](screen_share.md)
 
 
## Examples
- [UIKit basic example](examples/UIKit)
- [SwiftUI basic example](examples/SwiftUI)

## Fullview SDK API

- `func register(_ config: FullviewConfig, onCompletion: ((Error?) -> Void)? = nil)`

	Registers user to be available in Fullview
   Attaches the Fullview SDK to the host app. All the Fullview functionality is done through an additional UIWindow on top of the rest of the windows.

- `func logout()`

	Logs out the current user from Fullview

- `func requestCoBrowse(completion: @escaping (Error?) -> Void)`

	Puts the user into a waiting queue requesting help from agents

- `func cancelCoBrowseRequest(completion: @escaping (Error?) -> Void)`

	Remove the user from the waiting queue

- `var delegate: FullviewCoreDelegate?`

	Delegate to receive information about Fullview events so the UI can react if necessary (optional).

- `val coBrowseStatus: CoBrowseStatus`

	Published status emitting the current state of the SDK. Used to update the UI in SwiftUI if necessary (optional)
	
- `var onError: ((FullviewError) -> Void)?`

	Completion block to receive runtime errors. (error are also received through the delegate)