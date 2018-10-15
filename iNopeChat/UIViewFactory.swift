import UIKit

class UIViewFactory {
    class func buildTitle(within view: UIView) -> UILabel {
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

    class func buildTagline(within view: UIView, below title: UIView) -> UILabel {
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

    class func buildField(within view: UIView, below tagline: UIView) -> UITextField {
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

    class func buildFlashLabel(within view: UIView, below field: UIView) -> UILabel {
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
}
