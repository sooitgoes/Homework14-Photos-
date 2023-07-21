//
//  NameCellHeader.swift
//  Homework14(Photos)
//
//  Created by Михаил Латий on 21.07.2023.
//

import UIKit

class NameCellHeader: UICollectionReusableView {
    static let identifier = "Header"

    // MARK: - Outlets
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 22, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var button: UIButton = {
        var button = UIButton()
        button.setTitle("See All", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var separator: UIView = {
        let line = UIView()
        line.backgroundColor = .systemGray4
        line.translatesAutoresizingMaskIntoConstraints = false
        return line
    }()

    // MARK: - Initiaziers
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
        addSubview(separator)
        addSubview(nameLabel)
        addSubview(button)
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
            separator.topAnchor.constraint(equalTo: topAnchor),
            separator.leftAnchor.constraint(equalTo: leftAnchor, constant: 5),
            separator.rightAnchor.constraint(equalTo: rightAnchor),
            separator.heightAnchor.constraint(equalToConstant: 1),

            nameLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            nameLabel.leftAnchor.constraint(equalTo: separator.leftAnchor),

            button.bottomAnchor.constraint(equalTo: bottomAnchor),
            button.rightAnchor.constraint(equalTo: rightAnchor, constant: -10)
        ])
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        nameLabel.text = nil
    }
}
