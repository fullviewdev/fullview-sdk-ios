# iOS Developer Documentation

**Minimum Platform Version**: iOS 13

**Current version:** 0.1.0

Fullview iOS SDK supports following frameworks:

- Native iOS
  - UIKit
  - SwiftUI

Soon-supported frameworks:

- React Native
- Ionic
- Cordova
- Flutter


## Installation

### Swift Package Manager

Both **FullviewSDK** and **Daily** libraries are required. The easiest way to is to use Use XCode UI (`File -> Add Packages...`) using the following urls:

- **FullviewSDK**: `https://github.com/fullviewdev/fullview-sdk-ios`
- **Daily**: `https://github.com/daily-co/daily`

Alternatively, add the following to your `Package` dependencies:

```swift
.package(url: "https://github.com/fullviewdev/fullview-sdk-ios", .upToNextMinor(from: "1.0.0")),
.package(url: "https://github.com/daily-co/daily", from: "1.0.0"),
```

Then include `"FullviewSDK"` in your target dependencies. For example:

```swift
.target(name: "MySwiftPackage", dependencies: ["FullviewSDK", "Daily"]),
```

## Configuration

- Add your Fullview organisation id in your `Info.plist`, key **FullviewSDKOrganisationId**
- Add the following permissions if you don't already have them:
	- **NSMicrophoneUsageDescription**
	- **NSCameraUsageDescription**
	- **UIBackgroundModes** **voip**


## Usage

Add `import FullviewSDK` and then use the static methods in **FullviewCore** to configure and start the SDK.

A minimal implementation looks like the following:

```swift
import FullviewSDK

let config = FullviewConfig(
    userId: "<user_identifier>",
    name: "<username>",
    email: "<email>,
    deviceId: "<device_id"
)
FullviewCore.config(config)
FullviewCore.start()
```
*Note*: `device_id` must be an unique UUID. Generate it with `UUID().uuidString` and save it locally to be reused.

And use `FullviewCore.stop()` to disconnect and disable the SDK.
 
## Additional features usage
- [Data Redaction](data_redaction.md)
- [Screen Sharing](screen_share.md)
 
## Fullview SDK API

- `static func start()`

	Attaches the Fullview SDK to the host app. Can be called at any time. All the Fullview functionality is done through an additional UIWindow on top of the rest of the Windows.

- `static func config(_ config: FullviewConfig)`

	Registers user to be available in Fullview


- `stop()`

	Logs out the current user from Fullview

- `static func makeCoBrowseRequest(completion: @escaping (Error?) -> Void)`

	Puts the user into a waiting queue requesting help from agents

- `static func cancelCoBrowseRequest(completion: @escaping (Error?) -> Void)`

	Remove the user from the waiting queue

- `static var delegate: FullviewCoreDelegate?`

	Delegate to receive information about Fullview events so the UI can react if necessary (optional).

- `static val coBrowseStatus: CoBrowseStatus`

	Published status emitting the current state of the SDK. Used to update the UI in SwiftUI if necessary (optional)