//
//  ApprovalBackLogEntry.swift
//  PorchTestProgram
//
//  Created by Elliott on 2020/12/30.
//  Copyright © 2020 ElliottTest. All rights reserved.
//

import Foundation
import HandyJSON

class ApprovalBackLogEntry: HandyJSON ,Identifiable {
    
    var id = UUID()
    
    var carType: String? = ""
    
    
    var orderNo: String? = ""//300123459059
    
    
    var appResource: ApprovalEntry?
    
    
    var flowOrderAppResourceList: Array<ApprovalEntry>?
    
    required init(){}
}
