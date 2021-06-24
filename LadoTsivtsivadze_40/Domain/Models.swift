//
//  Models.swift
//  LadoTsivtsivadze_40
//
//  Created by Ladolado3911 on 6/24/21.
//

import Foundation
import UIKit

struct Response: Codable {
    var List: [News]
}

struct News: Codable {
    var Title: String?
    var ShortDescription: String?
    var BigCoverPhotoUrl: String?
    var Content: String?
    var Date: String?
    var Time: String?
    var ArticleSource: String?
}
