//
//  UserEntity.swift
//  TalkingSns
//
//  Created by imagawa on 2020/02/03.
//  Copyright © 2020 imagawa. All rights reserved.
//

class UserEntity: NSObject, NSSecureCoding {
    
    enum GenderType: Int {
        case male = 0
        case female = 1
    }
    
    let id: Int
    let name: String
    let genderType: GenderType
    let age: Int
    let pr: String
    let profileImage: ProfileImageEntity?
    let lastOnlineDatetime: Date
    let created: Date
    let modified: Date
    
    private let keyId = "id"
    private let keyName = "name"
    private let keyGenderType = "genderType"
    private let keyAge = "age"
    private let keyPr = "pr"
    private let keyProfileImage = "profileImage"
    private let keyLastOnlineDatetime = "lastOnlineDatetime"
    private let keyCreated = "created"
    private let keyModified = "modified"
    
    init(
        id: Int,
        name: String,
        genderType: GenderType,
        age: Int,
        pr: String,
        profileImage: ProfileImageEntity?,
        lastOnlineDatetime: Date,
        created: Date,
        modified: Date
    ) {
        self.id = id
        self.name = name
        self.genderType = genderType
        self.age = age
        self.pr = pr
        self.profileImage = profileImage
        self.lastOnlineDatetime = lastOnlineDatetime
        self.created = created
        self.modified = modified
    }
    
    override func isEqual(_ object: Any?) -> Bool {
        guard let val = object as? UserEntity else {
            return false
        }
        return self.id == val.id &&
            self.name == val.name &&
            self.genderType == val.genderType &&
            self.age == val.age &&
            self.pr == val.pr &&
            self.profileImage == val.profileImage &&
            self.lastOnlineDatetime == val.lastOnlineDatetime &&
            self.created == val.created &&
            self.modified == val.modified
    }
    
    static func toEntity(user: User) -> UserEntity {
        
        var profileImage: ProfileImageEntity?
        
        if user.hasProfileImage, let userProfileImage = user.profileImage {
            profileImage = ProfileImageEntity(
                imageOriginalUrl: userProfileImage.imageOriginalURL?.value,
                image100Url: userProfileImage.image100URL?.value,
                image300Url: userProfileImage.image300URL?.value,
                image600Url: userProfileImage.image600URL?.value)
        }
        
        return UserEntity(
            id: Int(user.id_p),
            name: user.name,
            genderType: UserEntity.GenderType(rawValue: Int(user.genderType.rawValue)) ?? GenderType.male,
            age: Int(user.age),
            pr: user.pr,
            profileImage: profileImage,
            lastOnlineDatetime: user.lastOnlineDatetime.date,
            created: user.created.date,
            modified: user.modified.date)
    }
    
    // MARK: - NSSecureCoding
    required init(coder aDecoder: NSCoder) {
        self.id = Int(aDecoder.decodeInt64(forKey: keyId))
        self.name = aDecoder.decodeObject(forKey: keyName) as! String
        self.genderType = GenderType(rawValue: Int(aDecoder.decodeInt32(forKey: keyGenderType))) ?? .male
        self.age = Int(aDecoder.decodeInt32(forKey: keyAge))
        self.pr = aDecoder.decodeObject(forKey: keyPr) as! String
        self.profileImage = aDecoder.decodeObject(forKey: keyProfileImage) as? ProfileImageEntity
        self.lastOnlineDatetime = aDecoder.decodeObject(of: NSDate.self, forKey: keyLastOnlineDatetime) as Date? ?? Date()
        self.created = aDecoder.decodeObject(of: NSDate.self, forKey: keyCreated) as Date? ?? Date()
        self.modified = aDecoder.decodeObject(of: NSDate.self, forKey: keyModified) as Date? ?? Date()
    }

    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.id, forKey: keyId)
        aCoder.encode(self.name, forKey: keyName)
        aCoder.encode(self.genderType.rawValue, forKey: keyGenderType)
        aCoder.encode(self.age, forKey: keyAge)
        aCoder.encode(self.pr, forKey: keyPr)
        aCoder.encode(self.profileImage, forKey: keyProfileImage)
        aCoder.encode(self.lastOnlineDatetime as NSDate, forKey: keyLastOnlineDatetime)
        aCoder.encode(self.created as NSDate, forKey: keyCreated)
        aCoder.encode(self.modified as NSDate, forKey: keyModified)
    }

    static var supportsSecureCoding: Bool {
        return true
    }
}
