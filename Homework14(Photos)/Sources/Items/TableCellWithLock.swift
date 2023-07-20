//
//  TableCellWithLock.swift
//  Homework14(Photos)
//
//  Created by Михаил Латий on 20.07.2023.
//

import UIKit

class TableCellWithLock: TableCell {
    static let lockIdentifier = "TableCellLock"

    // MARK: - UI Elements
    private lazy var lockIcon: UIImageView = {
        let icon = UIImageView()
        icon.clipsToBounds = true
        icon.contentMode = .scaleAspectFit
        icon.translatesAutoresizingMaskIntoConstraints = false
        return icon
    }()

    // MARK: - Setup
    override func setupHierarchy() {
        super.setupHierarchy()
        contentView.addSubview(lockIcon)
    }

    override func setupLayout() {
        super.setupLayout()
        NSLayoutConstraint.activate([
            lockIcon.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            lockIcon.rightAnchor.constraint(equalTo: buttonChevron.leftAnchor, constant: -5),
            lockIcon.widthAnchor.constraint(equalToConstant: 20),
            lockIcon.heightAnchor.constraint(equalToConstant: 20)
        ])
    }

    // MARK: - Configuration
    override func prepareData(data: Model) {
        super.prepareData(data: data)
        lockIcon.image = UIImage(systemName: data.lockIcon ?? "")
    }
}
