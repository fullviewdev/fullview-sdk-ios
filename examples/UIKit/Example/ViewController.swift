//
//  ViewController.swift
//  Example
//

import UIKit
import FullviewSDK

class ViewController: UIViewController {

    private var fullview: FullviewCore?
    
    @IBOutlet weak var normalText: UILabel!
    @IBOutlet weak var dataRedactionText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
        dataRedactionText.tag = DataRedactionTag
    }
}

