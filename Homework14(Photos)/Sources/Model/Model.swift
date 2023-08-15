//
//  File.swift
//  Homework14(Photos)
//
//  Created by Михаил Латий on 16.07.2023.
//

import Foundation

struct Model: Hashable {
    let image: String
    let name: String
    let description: String?
    let lockIcon: String?
}

extension Model {
    static let firstSectionData = [
        Model(image: "ocean1", name: "Recents", description: "171", lockIcon: nil),
        Model(image: "ocean2", name: "Favourites", description: "34", lockIcon: nil),
        Model(image: "ocean3", name: "WhatsApp", description: "2", lockIcon: nil),
        Model(image: "ocean4", name: "Viber", description: "56", lockIcon: nil),
        Model(image: "ocean5", name: "Telegram", description: "7", lockIcon: nil),
        Model(image: "ocean6", name: "Instagram", description: "98", lockIcon: nil),
        Model(image: "ocean7", name: "Vacation", description: "45", lockIcon: nil),
        Model(image: "ocean8", name: "Hobby", description: "6", lockIcon: nil),
        Model(image: "ocean9", name: "VK", description: "12", lockIcon: nil),
        Model(image: "ocean10", name: "Ocean", description: "24", lockIcon: nil)
    ]

    static let secondSectionData = [
        Model(image: "forest1", name: "My places", description: "18", lockIcon: nil),
        Model(image: "forest2", name: "Forest", description: "22", lockIcon: nil),
        Model(image: "forest3", name: "Family", description: "55", lockIcon: nil),
        Model(image: "forest4", name: "Relax", description: "10", lockIcon: nil),
        Model(image: "forest5", name: "nature", description: "70", lockIcon: nil)
    ]

    static let thirdSecrionData = [
        Model(image: "video", name: "Videos", description: "10", lockIcon: nil),
        Model(image: "person.crop.square", name: "Selfies", description: "9", lockIcon: nil),
        Model(image: "livephoto", name: "Live Photos", description: "1", lockIcon: nil),
        Model(image: "pano", name: "Panoramas", description: "2", lockIcon: nil),
        Model(image: "camera.viewfinder", name: "Screenshots", description: "24", lockIcon: nil)
    ]

    static let fourthSectionData = [
        Model(image: "square.and.arrow.down", name: "Imports", description: "9", lockIcon: nil),
        Model(image: "eye.slash", name: "Hidden", description: nil, lockIcon: "lock.fill"),
        Model(image: "trash", name: "Recently Deleted", description: nil, lockIcon: "lock.fill")
    ]
}
