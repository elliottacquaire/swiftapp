//
//  BaseModel.swift
//  PorchTestProgram
//
//  Created by Elliott on 2020/12/21.
//  Copyright © 2020 ElliottTest. All rights reserved.
//

import Foundation
import HandyJSON

class BaseModel<T:Any>: HandyJSON {
    
    
    var message:String?
    var data:T?
    var code : Int? = 0
    
    required init(){
        
    }
}

extension BaseModel{
    
 
}
