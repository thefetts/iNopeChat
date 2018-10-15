import UIKit

class ViewController: UIViewController {
    @IBOutlet var lookUponMyWorks: UITextField!
    @IBOutlet var andDespair: UILabel!
    @IBOutlet var heisenberg: UILabel!
    var ozymandias: Timer!
    var sayMyName: Timer!
    var count = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        ozymandias = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(thisTooShallPass), userInfo: nil, repeats: true)
        sayMyName = Timer.scheduledTimer(timeInterval: 0.25, target: self, selector: #selector(youreGodDamnRight), userInfo: nil, repeats: true)
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

    @objc
    func youreGodDamnRight() {
        let fullName = "nopechat"
        count += 1
        if(count > fullName.count + 5) {
            count = 0
        }
        heisenberg.text = fullName.upTo(i: count)
    }
}

extension String {
    func upTo(i: Int) -> String {
        let offset = i > endIndex.encodedOffset ? self.count : i
        let end = self.index(startIndex, offsetBy: offset)
        return String(self[startIndex..<end])
    }
}
