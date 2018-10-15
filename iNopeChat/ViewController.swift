import UIKit

class ViewController: UIViewController {
    var lookUponMyWorks: UITextField!
    var andDespair: UILabel!
    var heisenberg: UILabel!
    var ozymandias: Timer!
    var sayMyName: Timer!
    var count = 0
    var messagesDestroyed: Int!
    open override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .all
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        heisenberg = UIViewFactory.buildTitle(within: view)
        let tagline = UIViewFactory.buildTagline(within: view, below: heisenberg)
        lookUponMyWorks = UIViewFactory.buildField(within: view, below: tagline)
        andDespair = UIViewFactory.buildFlashLabel(within: view, below: lookUponMyWorks)
        view.backgroundColor = .white

        ozymandias = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(thisTooShallPass), userInfo: nil, repeats: true)
        sayMyName = Timer.scheduledTimer(timeInterval: 0.25, target: self, selector: #selector(youreGodDamnRight), userInfo: nil, repeats: true)

        messagesDestroyed = UserDefaults.standard.integer(forKey: "messagesDestroyed")
    }

    @objc
    func thisTooShallPass() {
        if let text = lookUponMyWorks.text {
            if(text.count > 0) {
                lookUponMyWorks.text = ""

                messagesDestroyed += 1
                UserDefaults.standard.set(messagesDestroyed, forKey: "messagesDestroyed")

                andDespair.text = "\(messagesDestroyed!) messages destroyed!"
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
