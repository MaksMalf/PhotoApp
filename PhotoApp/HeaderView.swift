import UIKit

class HeaderView: UICollectionReusableView {

    static let headerViewID = "HeaderView"

    let label = UILabel()
    let subView = UIView()
    let button: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("См. все", for: .normal)
        button.titleLabel?.textColor = .systemBlue
        button.titleLabel?.font = UIFont.preferredFont(forTextStyle: .title3)
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }

    required init?(coder: NSCoder) {
        fatalError()
    }
}

extension HeaderView {

    func configure() {

        backgroundColor = .systemBackground

        addSubview(label)
        addSubview(subView)
        addSubview(button)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontForContentSizeCategory = true
        subView.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false

        let inset = CGFloat(20)
        NSLayoutConstraint.activate([
            subView.topAnchor.constraint(equalTo: topAnchor),
            subView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: inset),
            subView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -inset),
            subView.heightAnchor.constraint(equalToConstant: 1),

            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: inset),
            label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -100),
            label.topAnchor.constraint(equalTo: subView.bottomAnchor, constant: 5),
            label.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -inset),

            button.leadingAnchor.constraint(equalTo: label.trailingAnchor, constant: 10),
            button.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -inset),
            button.topAnchor.constraint(equalTo: subView.bottomAnchor, constant: 5),
            button.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -inset),
        ])

        label.font = UIFont.preferredFont(forTextStyle: .title2)
        subView.backgroundColor = .lightGray
    }
}

