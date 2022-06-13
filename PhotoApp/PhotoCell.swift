import UIKit

class PhotoCell: UICollectionViewCell {

    static let photoCellID = "PhotoCell"
    let titleLabel = UILabel()
    let photoCountLabel = UILabel()
    let photoView = UIImageView()
    let contentContainer = UIView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension PhotoCell {

    func configure(model: PhotoItemModel) {

        contentContainer.translatesAutoresizingMaskIntoConstraints = false

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

    func setupConstraints() {

        contentView.addSubview(photoView)
        contentView.addSubview(contentContainer)
        contentContainer.addSubview(titleLabel)
        contentContainer.addSubview(photoCountLabel)

        NSLayoutConstraint.activate([
            contentContainer.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            contentContainer.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            contentContainer.topAnchor.constraint(equalTo: contentView.topAnchor),
            contentContainer.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),

            photoView.leadingAnchor.constraint(equalTo: contentContainer.leadingAnchor),
            photoView.trailingAnchor.constraint(equalTo: contentContainer.trailingAnchor),
            photoView.topAnchor.constraint(equalTo: contentContainer.topAnchor),
            photoView.heightAnchor.constraint(equalTo: contentContainer.heightAnchor, multiplier: 0.75),
            photoView.widthAnchor.constraint(equalTo: contentContainer.widthAnchor, multiplier: 1),

            titleLabel.topAnchor.constraint(equalTo: photoView.bottomAnchor, constant: 7),
            titleLabel.leadingAnchor.constraint(equalTo: photoView.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: photoView.trailingAnchor),

            photoCountLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            photoCountLabel.leadingAnchor.constraint(equalTo: contentContainer.leadingAnchor),
            photoCountLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            photoCountLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }

}
