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
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 10
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

    private lazy var namePhoto: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .regular)
        label.textAlignment = .left
        return label
    }()

    private lazy var numberPhoto: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .regular)
        label.textColor = .gray
        label.textAlignment = .left
        return label
    }()

    private lazy var stack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 5
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
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
        stack.addArrangedSubview(photo)
        stack.addArrangedSubview(namePhoto)
        stack.addArrangedSubview(numberPhoto)
        contentView.addSubview(stack)
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
            photo.heightAnchor.constraint(equalTo: photo.widthAnchor),

            stack.topAnchor.constraint(equalTo: contentView.topAnchor),
            stack.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            stack.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            stack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
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
