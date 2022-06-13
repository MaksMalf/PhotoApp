import Foundation
import UIKit

class FoodCell: UICollectionViewCell {

    static var reuseId: String = "FoodCell"

    let photoView = UIImageView()
    let titleLabel = UILabel()
    let photoCountLabel = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor(white: 1, alpha: 1)
        setupElements()
        setupConstraints()

        self.layer.cornerRadius = 4
        self.clipsToBounds = true

    }

    func setupElements() {

        photoView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        photoCountLabel.translatesAutoresizingMaskIntoConstraints = false
    }

    func configure(model: PhotoItemModel) {

        photoView.translatesAutoresizingMaskIntoConstraints = false
        photoView.layer.cornerRadius = 4
        photoView.clipsToBounds = true
        photoView.contentMode = .scaleAspectFill
        photoView.image = UIImage(named: model.photoName)

        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = UIFont.preferredFont(forTextStyle: .subheadline)
        titleLabel.adjustsFontForContentSizeCategory = true
        titleLabel.text = "Альбом № \(model.textLabel)"

        photoCountLabel.translatesAutoresizingMaskIntoConstraints = false
        photoCountLabel.font = UIFont.preferredFont(forTextStyle: .subheadline)
        photoCountLabel.adjustsFontForContentSizeCategory = true
        photoCountLabel.textColor = .placeholderText
        photoCountLabel.text = "\(model.totalNumberOfPhotos)"
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension FoodCell {
    func setupConstraints() {

        addSubview(photoView)
        addSubview(titleLabel)
        addSubview(photoCountLabel)

        NSLayoutConstraint.activate([
            photoView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            photoView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            photoView.widthAnchor.constraint(equalToConstant: 78),
            photoView.heightAnchor.constraint(equalToConstant: 78),

            titleLabel.topAnchor.constraint(equalTo: photoView.topAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: photoView.trailingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),

            photoCountLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            photoCountLabel.leadingAnchor.constraint(equalTo: photoView.trailingAnchor, constant: 16),
            photoCountLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16)
        ])
    }
}
