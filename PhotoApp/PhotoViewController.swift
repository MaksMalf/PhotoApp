import UIKit

class PhotoViewController: UIViewController {

    static let photoVCID = "PhotoViewController"

    enum Section: String, CaseIterable {
        case myAlbums = "Мои альбомы"
        case dogAlbums = "Собачки"
        case catAlbums = "Кошечки"
        case footAlbums = "Еда"
    }

    var dataSource: UICollectionViewDiffableDataSource<Section, PhotoItemModel>! = nil
    var photoCollectionView: UICollectionView! = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = "Альбомы"
        navigationItem.leftBarButtonItem = UIBarButtonItem(systemItem: .add)
        configureCollectionView()
        configureDataSource()
    }
}

extension PhotoViewController {

    func configureCollectionView() {

        let collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: generateLayout())
        view.addSubview(collectionView)
        collectionView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        collectionView.backgroundColor = .systemBackground
        collectionView.register(PhotoCell.self, forCellWithReuseIdentifier: PhotoCell.photoCellID)
        collectionView.register(FoodCell.self, forCellWithReuseIdentifier: FoodCell.reuseId)

        photoCollectionView = collectionView
    }

    func configureDataSource() {

        dataSource = UICollectionViewDiffableDataSource<Section, PhotoItemModel>(collectionView: photoCollectionView) {
            (collectionView: UICollectionView, indexPath: IndexPath, photoItem: PhotoItemModel) -> UICollectionViewCell? in
            let sectionType = Section.allCases[indexPath.section]
            switch sectionType {
            case .footAlbums:
                guard let cell = collectionView.dequeueReusableCell(
                    withReuseIdentifier: FoodCell.reuseId,
                    for: indexPath) as? FoodCell
                else { fatalError("Could not create new cell") }

                cell.configure(model: photoItem)
                return cell
            case .catAlbums:
                guard let cell = collectionView.dequeueReusableCell(
                    withReuseIdentifier: FoodCell.reuseId,
                    for: indexPath) as? FoodCell
                else { fatalError("Could not create new cell") }

                cell.configure(model: photoItem)
                return cell
            default:
                guard let cell = collectionView.dequeueReusableCell(
                    withReuseIdentifier: PhotoCell.photoCellID,
                    for: indexPath) as? PhotoCell
                else { fatalError("Could not create new cell") }

                cell.configure(model: photoItem)
                return cell
            }
        }

        let snapshot = snapshotForCurrentState()
        dataSource.apply(snapshot, animatingDifferences: false)
    }

    func generateLayout() -> UICollectionViewLayout {

        let layout = UICollectionViewCompositionalLayout { (
            sectionIndex: Int,
            layoutEnvironment: NSCollectionLayoutEnvironment
        ) -> NSCollectionLayoutSection? in

            let sectionLayoutKind = Section.allCases[sectionIndex]
            switch (sectionLayoutKind) {
            case .myAlbums: return self.generateMyAlbumsLayout()
            case .dogAlbums: return self.generateDogAlbumsLayout()
            case .catAlbums: return self.generateCatAndFoodAlbumsLayout()
            case .footAlbums: return self.generateCatAndFoodAlbumsLayout()
            }
        }
        return layout
    }

    func generateMyAlbumsLayout() -> NSCollectionLayoutSection {

        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalWidth(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 5)

        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(CGFloat(0.5)), heightDimension: .fractionalWidth(CGFloat(1.0)))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitem: item, count: 2)


        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPaging

        return section
    }

    func generateDogAlbumsLayout() -> NSCollectionLayoutSection {

        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalWidth(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 5)

        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalWidth(0.5))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitem: item, count: 1)

        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPaging

        return section
    }

    func generateCatAndFoodAlbumsLayout() -> NSCollectionLayoutSection {

        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(86))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets.init(top: 0, leading: 0, bottom: 8, trailing: 0)

        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(1))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])

        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0)

        return section
    }

    func snapshotForCurrentState() -> NSDiffableDataSourceSnapshot<Section, PhotoItemModel> {

        let myAlbums = Array(itemsForPhoto())
        let catAlbums = Array(itemsForPhoto().prefix(4))
        let dogAlbums = Array(itemsForPhoto().suffix(8).prefix(4))
        let footAlbums = Array(itemsForPhoto().suffix(4))

        var snapshot = NSDiffableDataSourceSnapshot<Section, PhotoItemModel>()
        snapshot.appendSections([Section.myAlbums])
        snapshot.appendItems(myAlbums)

        snapshot.appendSections([Section.dogAlbums])
        snapshot.appendItems(dogAlbums)

        snapshot.appendSections([Section.catAlbums])
        snapshot.appendItems(catAlbums)

        snapshot.appendSections([Section.footAlbums])
        snapshot.appendItems(footAlbums)

        return snapshot
    }

    func itemsForPhoto() -> [PhotoItemModel] {
        return [
            PhotoItemModel(textLabel: "1", totalNumberOfPhotos: 11, photoName: "cat1"),
            PhotoItemModel(textLabel: "2", totalNumberOfPhotos: 22, photoName: "cat2"),
            PhotoItemModel(textLabel: "3", totalNumberOfPhotos: 33, photoName: "cat3"),
            PhotoItemModel(textLabel: "4", totalNumberOfPhotos: 44, photoName: "cat4"),
            PhotoItemModel(textLabel: "5", totalNumberOfPhotos: 55, photoName: "dog1"),
            PhotoItemModel(textLabel: "6", totalNumberOfPhotos: 66, photoName: "dog2"),
            PhotoItemModel(textLabel: "7", totalNumberOfPhotos: 77, photoName: "dog3"),
            PhotoItemModel(textLabel: "8", totalNumberOfPhotos: 88, photoName: "dog4"),
            PhotoItemModel(textLabel: "9", totalNumberOfPhotos: 99, photoName: "food1"),
            PhotoItemModel(textLabel: "10", totalNumberOfPhotos: 100, photoName: "food2"),
            PhotoItemModel(textLabel: "11", totalNumberOfPhotos: 111, photoName: "food3"),
            PhotoItemModel(textLabel: "12", totalNumberOfPhotos: 122, photoName: "food4")
        ]
    }
}

