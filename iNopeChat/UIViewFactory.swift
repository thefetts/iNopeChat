import UIKit
import SnapKit

extension ConstraintMaker {
    func centerBelow(_ view: UIView, offset: Int) {
        leadingMargin.equalToSuperview()
        trailingMargin.equalToSuperview()
        top.equalTo(view.snp.bottom).offset(offset)
    }
}

class UIViewFactory {
    class func buildTitle(within superview: UIView) -> UILabel {
        let label = UILabel(frame: CGRect(x: 16, y: 36, width: 343, height: 32))
        label.font = .boldSystemFont(ofSize: 32)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        superview.addSubview(label)
        label.snp.makeConstraints { (make) -> Void in
            make.leadingMargin.equalToSuperview()
            make.trailingMargin.equalToSuperview()
            make.topMargin.equalToSuperview().offset(16)
            make.height.equalTo(32)
        }
        return label
    }

    class func buildTagline(within superview: UIView, below title: UIView) -> UILabel {
        let label = UILabel(frame: CGRect(x: 16, y: 84, width: 343, height: 21))
        label.font = .systemFont(ofSize: 17)
        label.adjustsFontSizeToFitWidth = true
        label.text = "changing how the world sends extremely temporary messages"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        superview.addSubview(label)
        label.snp.makeConstraints { (make) -> Void in
            make.centerBelow(title, offset: 16)
        }
        return label
    }

    class func buildField(within superview: UIView, below tagline: UIView) -> UITextField {
        let field = UITextField(frame: CGRect(x: 16, y: 137, width: 343, height: 30))
        field.borderStyle = .roundedRect
        field.font = .systemFont(ofSize: 14)
        field.translatesAutoresizingMaskIntoConstraints = false
        superview.addSubview(field)
        field.snp.makeConstraints { (make) -> Void in
            make.centerBelow(tagline, offset: 16)
        }
        return field
    }

    class func buildFlashLabel(within superview: UIView, below field: UIView) -> UILabel {
        let label = UILabel(frame: CGRect(x: 16, y: 199, width: 343, height: 20.5))
        label.alpha = 0
        label.font = .systemFont(ofSize: 17)
        label.text = "Message destroyed!"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        superview.addSubview(label)
        label.snp.makeConstraints { (make) -> Void in
            make.centerBelow(field, offset: 32)
        }
        return label
    }
}
