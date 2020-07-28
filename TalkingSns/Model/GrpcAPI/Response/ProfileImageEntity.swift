//
//  ProfileImageEntity.swift
//  TalkingSns
//
//  Created by imagawa on 2020/04/13.
//  Copyright © 2020 imagawa. All rights reserved.
//

class ProfileImageEntity: NSObject, NSSecureCoding {
    let imageOriginalUrl: String?
    let image100Url: String?
    let image300Url: String?
    let image600Url: String?
    
    init(imageOriginalUrl: String?,
         image100Url: String?,
         image300Url: String?,
         image600Url: String?) {
        
        self.imageOriginalUrl = imageOriginalUrl
        self.image100Url = image100Url
        self.image300Url = image300Url
        self.image600Url = image600Url
    }
    
    override func isEqual(_ object: Any?) -> Bool {
        guard let val = object as? ProfileImageEntity else {
            return false
        }
        return self.imageOriginalUrl == val.imageOriginalUrl &&
            self.image100Url == val.image100Url &&
            self.image300Url == val.image300Url &&
            self.image600Url == val.image600Url
    }
    
    // MARK: - NSSecureCoding
    required init(coder aDecoder: NSCoder) {
        self.imageOriginalUrl = aDecoder.decodeObject(forKey: "imageOriginalUrl") as? String
        self.image100Url = aDecoder.decodeObject(forKey: "image100Url") as? String
        self.image300Url = aDecoder.decodeObject(forKey: "image300Url") as? String
        self.image600Url = aDecoder.decodeObject(forKey: "image600Url") as? String
    }

    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.imageOriginalUrl, forKey: "imageOriginalUrl")
        aCoder.encode(self.image100Url, forKey: "image100Url")
        aCoder.encode(self.image300Url, forKey: "image300Url")
        aCoder.encode(self.image600Url, forKey: "image600Url")
    }

    static var supportsSecureCoding: Bool {
        return true
    }
}
