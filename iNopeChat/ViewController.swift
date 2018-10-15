import UIKit

class ViewController: UIViewController {
    var lookUponMyWorks: UITextField!
    var andDespair: UILabel!
    var heisenberg: UILabel!
    var ozymandias: Timer!
    var sayMyName: Timer!
    var count = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        heisenberg = buildTitle()
        let tagline = buildTagline(below: heisenberg)
        lookUponMyWorks = buildField(below: tagline)
        andDespair = buildFlashLabel(below: lookUponMyWorks)
        view.backgroundColor = .white

        ozymandias = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(thisTooShallPass), userInfo: nil, repeats: true)
        sayMyName = Timer.scheduledTimer(timeInterval: 0.25, target: self, selector: #selector(youreGodDamnRight), userInfo: nil, repeats: true)
    }

    func buildTitle() -> UILabel {
        let label = UILabel(frame: CGRect(x: 16, y: 36, width: 343, height: 32))
        label.font = .boldSystemFont(ofSize: 32)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)
        let margins = view.layoutMarginsGuide
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            label.trailingAnchor.constraint(equalTo: margins.trailingAnchor),
            label.topAnchor.constraint(equalTo: margins.topAnchor, constant: 16),
            label.bottomAnchor.constraint(equalTo: margins.topAnchor, constant: 48)
        ])
        return label
    }

    func buildTagline(below title: UIView) -> UILabel {
        let label = UILabel(frame: CGRect(x: 16, y: 84, width: 343, height: 21))
        label.font = .systemFont(ofSize: 17)
        label.adjustsFontSizeToFitWidth = true
        label.text = "changing how the world sends extremely temporary messages"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)
        let margins = view.layoutMarginsGuide
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            label.trailingAnchor.constraint(equalTo: margins.trailingAnchor),
            label.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 16),
        ])
        return label
    }

    func buildField(below tagline: UIView) -> UITextField {
        let field = UITextField(frame: CGRect(x: 16, y: 137, width: 343, height: 30))
        field.borderStyle = .roundedRect
        field.font = .systemFont(ofSize: 14)
        field.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(field)
        let margins = view.layoutMarginsGuide
        NSLayoutConstraint.activate([
            field.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            field.trailingAnchor.constraint(equalTo: margins.trailingAnchor),
            field.topAnchor.constraint(equalTo: tagline.bottomAnchor, constant: 16),
        ])
        return field
    }

    func buildFlashLabel(below field: UIView) -> UILabel {
        let label = UILabel(frame: CGRect(x: 16, y: 199, width: 343, height: 20.5))
        label.alpha = 0
        label.font = .systemFont(ofSize: 17)
        label.text = "Message destroyed!"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)
        let margins = view.layoutMarginsGuide
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            label.trailingAnchor.constraint(equalTo: margins.trailingAnchor),
            label.topAnchor.constraint(equalTo: field.bottomAnchor, constant: 32)
        ])
        return label
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
