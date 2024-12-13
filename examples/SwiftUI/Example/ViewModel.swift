//
//  ViewModel.swift
//  Example
//

import SwiftUI
import FullviewSDK

class ViewModel: ObservableObject {
    private var fullview: FullviewCore?
    init() {
        do {
            let config = try FullviewConfig(
                userId: "<user_identifier>",
                name: "<username>",
                email: "<email>",
                deviceId: "<device_id>" // must be a uuid string
            )
            fullview = FullviewCore(config: config)
            fullview?.onError = { error in
                print("Runtime error: \(error)")
            }
            fullview?.start()
        } catch {
            print("Error: \(error)")
        }
    }
}
