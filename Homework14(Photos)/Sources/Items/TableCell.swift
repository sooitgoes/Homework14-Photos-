//
//  TableCell.swift
//  Homework14(Photos)
//
//  Created by Михаил Латий on 19.07.2023.
//

import UIKit

class TableCell: UICollectionViewCell {
    static let identifier = "Table cell"

    // MARK: - UI Elements
    private lazy var icon: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private  lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .regular)
        label.textColor = .systemBlue
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var numberLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17, weight: .regular)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var buttonChevron: UIButton = {
        let button = UIButton()
        let icon = UIImage(systemName: "chevron.right")
        button.tintColor = .systemGray4
        button.setImage(icon, for: .normal)
        button.setPreferredSymbolConfiguration(UIImage.SymbolConfiguration(pointSize: 15, weight: .medium), forImageIn: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private lazy var separartor: UIView = {
        let line = UIView()
        line.backgroundColor = .systemGray4
        line.translatesAutoresizingMaskIntoConstraints = false
        return line
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
    func setupHierarchy() {
        contentView.addSubview(icon)
        contentView.addSubview(nameLabel)
        contentView.addSubview(numberLabel)
        contentView.addSubview(buttonChevron)
        contentView.addSubview(separartor)
    }

    func setupLayout() {
        NSLayoutConstraint.activate([
            icon.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            icon.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            icon.heightAnchor.constraint(equalToConstant: 27),
            icon.widthAnchor.constraint(equalToConstant: 27),

            nameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            nameLabel.leftAnchor.constraint(equalTo: icon.rightAnchor, constant: 20),

            buttonChevron.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            buttonChevron.rightAnchor.constraint(equalTo: contentView.rightAnchor),

            numberLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            numberLabel.rightAnchor.constraint(equalTo: buttonChevron.leftAnchor, constant: -5),

            separartor.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            separartor.leftAnchor.constraint(equalTo: nameLabel.leftAnchor),
            separartor.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            separartor.heightAnchor.constraint(equalToConstant: 1)
        ])
    }

    // MARK: - Configuration
    func prepareData(data: Model) {
        self.icon.image = UIImage(systemName: data.image)
        self.nameLabel.text = data.name
        self.numberLabel.text = data.description

        if nameLabel.text != "Imports" {
            numberLabel.isHidden = true
        }
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        self.icon.image = nil
    }
}


