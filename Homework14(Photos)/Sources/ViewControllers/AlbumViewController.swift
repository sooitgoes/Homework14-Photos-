//
//  AlbumViewController.swift
//  Homework14(Photos)
//
//  Created by Михаил Латий on 16.07.2023.
//

import UIKit

class AlbumViewController: UIViewController {

    // MARK: - UI Elements
    private lazy var collectionView: UICollectionView = {
        let collection = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
        collection.dataSource = self
        collection.delegate = self
        collection.translatesAutoresizingMaskIntoConstraints = false
        return collection
    }()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Albums"
        navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = .white
        registerCellForCollection()
        setupHierarchy()
        setupLayout()
    }

    // MARK: - Setup
    private func setupHierarchy() {
        view.addSubview(collectionView)
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.rightAnchor.constraint(equalTo: view.rightAnchor),
            collectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

    private func registerCellForCollection() {
        collectionView.register(AlbumCell.self, forCellWithReuseIdentifier: AlbumCell.identifier)
        collectionView.register(TableCell.self, forCellWithReuseIdentifier: TableCell.identifier)
        collectionView.register(TableCellWithLock.self, forCellWithReuseIdentifier: TableCellWithLock.lockIdentifier)
        collectionView.register(NameCellHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: NameCellHeader.identifier)
    }

    // MARK: - CollectionViewLayout
    private func createLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { sectionIndex, _ in
            let sectionType = Sections(rawValue: sectionIndex)

            switch sectionType {
            case .albumVertical:
                let itemSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .fractionalHeight(1))
                let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
                layoutItem.contentInsets = NSDirectionalEdgeInsets(
                    top: 5,
                    leading: 5,
                    bottom: .zero,
                    trailing: 5)

                let groupSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(0.47),
                    heightDimension: .estimated(470))
                let layoutGroup = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitem: layoutItem, count: 2)

                let layoutSection = NSCollectionLayoutSection(group: layoutGroup)
                layoutSection.contentInsets = NSDirectionalEdgeInsets(
                    top: 5,
                    leading: 10,
                    bottom: 20,
                    trailing: 10)
                layoutSection.orthogonalScrollingBehavior = .groupPaging

                // Header
                let layoutSectionHeaderSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .fractionalWidth(0.1))
                let layoutSectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
                    layoutSize: layoutSectionHeaderSize,
                    elementKind: UICollectionView.elementKindSectionHeader,
                    alignment: .top)
                layoutSection.boundarySupplementaryItems = [layoutSectionHeader]

                return layoutSection
            case .albumHorizontal:
                let itemSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .fractionalHeight(1))
                let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
                layoutItem.contentInsets = NSDirectionalEdgeInsets(
                    top: 5,
                    leading: 5,
                    bottom: .zero,
                    trailing: 5)

                let groupSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(0.47),
                    heightDimension: .estimated(470 / 2))
                let layoutGroup = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [layoutItem])

                let layoutSection = NSCollectionLayoutSection(group: layoutGroup)
                layoutSection.contentInsets = NSDirectionalEdgeInsets(
                    top: 5,
                    leading: 10,
                    bottom: 20,
                    trailing: 10)
                layoutSection.orthogonalScrollingBehavior = .groupPaging

                // Header
                let layoutSectionHeaderSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .fractionalWidth(0.1))
                let layoutSectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
                    layoutSize: layoutSectionHeaderSize,
                    elementKind: UICollectionView.elementKindSectionHeader,
                    alignment: .top)
                layoutSection.boundarySupplementaryItems = [layoutSectionHeader]

                return layoutSection
            default:
                let itemSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .fractionalHeight(1))
                let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)

                let groupSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .estimated(46))
                let layoutGroup = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [layoutItem])

                let layoutSection = NSCollectionLayoutSection(group: layoutGroup)
                layoutSection.contentInsets = NSDirectionalEdgeInsets(
                    top: 10,
                    leading: 15,
                    bottom: 20,
                    trailing: 15)

                // Header
                let layoutSectionHeaderSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .fractionalWidth(0.1))
                let layoutSectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
                    layoutSize: layoutSectionHeaderSize,
                    elementKind: UICollectionView.elementKindSectionHeader,
                    alignment: .top)
                layoutSection.boundarySupplementaryItems = [layoutSectionHeader]

                return layoutSection
            }
        }
    }
}

extension AlbumViewController: UICollectionViewDataSource {
    private enum Sections: Int, CaseIterable {
        case albumVertical = 0
        case albumHorizontal = 1
        case table = 2
        case tableWithLock = 3
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        let sections = Sections.allCases.count
        return sections
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let sectionType = Sections(rawValue: section)

        switch sectionType {
        case .albumVertical:
            return Model.firstSectionData.count
        case .albumHorizontal:
            return Model.secondSectionData.count
        case .table:
            return Model.thirdSecrionData.count
        case .tableWithLock:
            return Model.fourthSectionData.count
        default:
            return 0
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let sectionType = Sections(rawValue: indexPath.section)

        switch sectionType {
        case .albumVertical:
            guard let item = collectionView.dequeueReusableCell(withReuseIdentifier: AlbumCell.identifier, for: indexPath) as? AlbumCell else {
                return UICollectionViewCell()
            }
            item.prepareData(data: Model.firstSectionData[indexPath.item])

            return item
        case .albumHorizontal:
            guard let item = collectionView.dequeueReusableCell(withReuseIdentifier: AlbumCell.identifier, for: indexPath) as? AlbumCell else {
                return UICollectionViewCell()
            }
            item.prepareData(data: Model.secondSectionData[indexPath.item])

            return item
        case .table:
            guard let item = collectionView.dequeueReusableCell(withReuseIdentifier: TableCell.identifier, for: indexPath) as? TableCell else {
                return UICollectionViewCell()
            }
            item.prepareData(data: Model.thirdSecrionData[indexPath.item])

            return item
        default:
            guard let item = collectionView.dequeueReusableCell(withReuseIdentifier: TableCellWithLock.lockIdentifier, for: indexPath) as? TableCellWithLock else {
                return UICollectionViewCell()
            }
            item.prepareData(data: Model.fourthSectionData[indexPath.item])
            
            return item
        }
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let sectionType = Sections(rawValue: indexPath.section)

        switch sectionType {
        case .albumVertical:
            guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: NameCellHeader.identifier, for: indexPath) as? NameCellHeader else {
                return UICollectionReusableView()
            }
            header.prepareData(name: "My Albums", buttonIsHidden: false)

            return header
        case .albumHorizontal:
            guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: NameCellHeader.identifier, for: indexPath) as? NameCellHeader else {
                return UICollectionReusableView()
            }
            header.prepareData(name: "Shared Albums", buttonIsHidden: true)

            return header
        case .table:
            guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: NameCellHeader.identifier, for: indexPath) as? NameCellHeader else {
                return UICollectionReusableView()
            }

            header.prepareData(name: "Media Types", buttonIsHidden: true)

            return header
        default:
            guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: NameCellHeader.identifier, for: indexPath) as? NameCellHeader else {
                return UICollectionReusableView()
            }
            header.prepareData(name: "Utilities", buttonIsHidden: true)

            return header
        }
    }
}

extension AlbumViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let sectionType = Sections(rawValue: indexPath.section)

        collectionView.deselectItem(at: indexPath, animated: true)
        switch sectionType {
        case .albumVertical:
            print(Model.firstSectionData[indexPath.item].name)
        case .albumHorizontal:
            print(Model.secondSectionData[indexPath.item].name)
        case .table:
            print(Model.thirdSecrionData[indexPath.item].name)
        default:
            print(Model.fourthSectionData[indexPath.item].name)
        }
    }
}

