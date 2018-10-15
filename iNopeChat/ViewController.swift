import UIKit

class ViewController: UIViewController {
    @IBOutlet var lookUponMyWorks: UITextField!
    @IBOutlet var andDespair: UILabel!
    var ozymandias: Timer!

    override func viewDidLoad() {
        super.viewDidLoad()
        ozymandias = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(thisTooShallPass), userInfo: nil, repeats: true)
    }

    @objc
    func thisTooShallPass() {
        if let text = lookUponMyWorks.text {
            if(text.count > 0) {
                lookUponMyWorks.text = ""
                andDespair.alpha = 1

                UIView.animate(withDuration: 1) {
                    self.andDespair.alpha = 0
                }
            }
        }
    }
}
