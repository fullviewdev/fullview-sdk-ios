# Data Redaction

## Overview
The **Data Redaction** feature in the **FullviewSDK** allows developers to hide sensitive information from the screen shared with support agents. This feature ensures user privacy while providing remote assistance.

## Usage

### UIKit
To redact a specific `UIView` in UIKit, assign the tag `DataRedactionTag` to that view. This signals to the SDK that the view should not be captured or transmitted to the server.

#### Example in UIKit

```swift
import FullviewSDK

let sensitiveLabel = UILabel()
sensitiveLabel.text = "Confidential Information"
sensitiveLabel.tag = SensitiveViewTag // Marks the view for redaction
```


### SwiftUI

In SwiftUI, wrap the view you want to hide within the `DataRedaction` container. Any view within this container will be excluded from the screen capture.

#### Example in SwiftUI

```swift
import FullviewSDK

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Data visible to the agent")
            DataRedaction {
                Text("Confidential Information")
            }
        }
    }
}
```

### Others

In cases where the above methods are not applicable for your platform, you can use a notification-based approach. Listen for the notification **Notification.Name.fullviewUpdateDataRedaction** with the *iOS Notification Center*, when received, use the `setDataRedactionFrames(_: [CGRect])` method of the **FullviewCore** instance to specify which frames (*absolute coordinates CGRects*) should be redacted.

#### Example

```swift
import FullviewSDK

let fullviewCore = FullviewCore(...)

NotificationCenter.default.publisher(for: .fullviewUpdateDataRedaction)) { _ in
	let subviewsAbsoluteFrames = view.subviews.map { subview -> CGRect in
		return subview.convert(subview.bounds, to: nil)
	}
	fullviewCore.setDataRedactionFrames(subviewsAbsoluteFrames)
}
```

### Note
This setup ensures that tagged or wrapped elements, or frames provided through `setDataRedactionFrames`, will not appear in the shared screen feed.