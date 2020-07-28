//
//  Constant.swift
//  Interview
//
//  Created by imagawa on 2019/02/02.
//  Copyright © 2019 imagawa. All rights reserved.
//

import Foundation
import Alamofire

class Constant: NSObject {

    // 本番のドメイン
    private static let productionApiDomain = "example.com"
    
    class func grpcApiHostStr() -> String {
        return "\(productionApiDomain):6565"
    }
    
    class func restApiDomain() -> URL {
        return URL(string: "http://\(productionApiDomain)")!
    }
    
    class func getAppVersion() -> String {
        return Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as! String
    }
}
