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
        let layout = UICollectionViewLayout()
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        return collection
    }()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Albums"
        navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = .white
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

    }

    // MARK: - CollectionViewLayout

}

