import UIKit

class ViewController: UIViewController {
    @IBOutlet var lookUponMyWorks: UITextField!
    var timer: Timer!

    override func viewDidLoad() {
        super.viewDidLoad()
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(thisTooShallPass), userInfo: nil, repeats: true)
    }

    @objc
    func thisTooShallPass() {
        if let text = lookUponMyWorks.text {
            if(text.count > 0) {
                lookUponMyWorks.text = ""
            }
        }
    }
}
