//
//  CurrentUserService.swift
//  Interview
//
//  Created by imagawa on 2019/02/18.
//  Copyright © 2019 imagawa. All rights reserved.
//

import Foundation
import CocoaLumberjack

class CurrentUserService: NSObject {
    
    private static var currentUser: UserEntity?
    
    class func loadUserDiff() {
        
        guard let userId = CurrentUserService.getCurrentUserId() else {
            return
        }
        
        UserApiService.shared.getUser(userId: userId)
            .startWithResult { (result: Result<UserEntity, Error>) in
                switch result {
                case let .success(user):
                    let _ = CurrentUserService.saveCurrentUser(user)
                default:
                    break
                }
            }
    }

    // MARK: - ユーザー
    class func getCurrentUser() -> UserEntity? {
        
        if currentUser != nil {
            return currentUser
        }
        
        guard let data: Data = UserDefaults.standard.object(forKey: UserDefaultsKey.currentUser) as? Data else { return nil }
        do {
            currentUser = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? UserEntity
            return currentUser
        } catch {
            return nil
        }
    }

    class func saveCurrentUser(_ user: UserEntity) -> Bool {
        do {
            let archive = try NSKeyedArchiver.archivedData(withRootObject: user, requiringSecureCoding: true)
            UserDefaults.standard.set(archive, forKey: UserDefaultsKey.currentUser)
            currentUser = user
            return true
        } catch {
            DDLogError("failed error:" + String(describing: error))
            return false
        }
    }

    class func getCurrentUserId() -> Int? {
        return getCurrentUser()?.id
    }

    class func isLogin() -> Bool {
        return getCurrentUser() != nil
    }
    
    // MARK: - api token
    class func saveApiToken(_ apiToken: String) {
        UserDefaults.standard.set(apiToken, forKey: UserDefaultsKey.apiToken)
    }
    
    class func getApiToken() -> String? {
        return UserDefaults.standard.string(forKey: UserDefaultsKey.apiToken)
    }
}
