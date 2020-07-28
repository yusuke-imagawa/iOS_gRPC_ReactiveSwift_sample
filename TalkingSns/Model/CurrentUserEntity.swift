//
//  CurrentUserEntity.swift
//  Interview
//
//  Created by imagawa on 2019/02/02.
//  Copyright © 2019 imagawa. All rights reserved.
//

import Foundation

class CurrentUserEntity: NSObject, Codable, NSSecureCoding {

    let id: Int
    var name: String
    let mailAddress: String?
    let apiToken: String

    private enum CodingKeys: String, CodingKey {
        case id
        case name
        case mailAddress = "email"
        case apiToken = "api_token"
    }

    // MARK: - NSSecureCoding
    required init(coder aDecoder: NSCoder) {
        self.id = aDecoder.decodeInteger(forKey: "id")
        self.name = aDecoder.decodeObject(forKey: "name") as! String
        self.mailAddress = aDecoder.decodeObject(forKey: "mailAddress") as? String
        self.apiToken = aDecoder.decodeObject(forKey: "apiToken") as! String
    }

    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.id, forKey: "id")
        aCoder.encode(self.name, forKey: "name")
        aCoder.encode(self.mailAddress, forKey: "mailAddress")
        aCoder.encode(self.apiToken, forKey: "apiToken")
    }

    static var supportsSecureCoding: Bool {
        return true
    }
}
