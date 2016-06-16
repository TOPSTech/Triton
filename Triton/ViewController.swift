import UIKit
import Intents

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        INPreferences.requestSiriAuthorization { status in
            print(status)
        }
    }
}

