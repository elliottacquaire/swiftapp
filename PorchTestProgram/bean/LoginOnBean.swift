//
//  LoginOnBean.swift
//  PorchTestProgram
//
//  Created by Elliott on 2020/12/21.
//  Copyright © 2020 ElliottTest. All rights reserved.
//

import Foundation
import HandyJSON

class LoginOnBean: HandyJSON {
    var accessToken: String? = ""
    var refreshToken: String = ""
    var userId: String = ""
    var clientId: String = ""
    var expiration: String = ""
    var tokenType : String = ""
    
    var roleList: Array<String>?
    
    
    required init() {
        
    }
    
}
