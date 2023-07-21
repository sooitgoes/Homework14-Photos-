//
//  AlbumCell.swift
//  Homework14(Photos)
//
//  Created by Михаил Латий on 19.07.2023.
//

import UIKit

class AlbumCell: UICollectionViewCell {
    static let identifier = "Album cell"

    // MARK: - UI Elements
    private lazy var photo: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 5
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private lazy var namePhoto: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .regular)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var numberPhoto: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .regular)
        label.textColor = .gray
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        clipsToBounds = true
        setupHierarchy()
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup
    private func setupHierarchy() {
        contentView.addSubview(photo)
        contentView.addSubview(namePhoto)
        contentView.addSubview(numberPhoto)
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
            photo.topAnchor.constraint(equalTo: contentView.topAnchor),
            photo.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            photo.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            photo.heightAnchor.constraint(equalTo: photo.widthAnchor),

            namePhoto.topAnchor.constraint(equalTo: photo.bottomAnchor, constant: 5),

            numberPhoto.topAnchor.constraint(equalTo: namePhoto.bottomAnchor, constant: 0)
        ])
    }

    // MARK: - Configuration
    func prepareData(data: Model) {
        self.photo.image = UIImage(named: data.image)
        self.namePhoto.text = data.name
        self.numberPhoto.text = data.description
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        self.photo.image = nil
    }
}
