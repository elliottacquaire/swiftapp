//
//  BackLogListModel.swift
//  PorchTestProgram
//
//  Created by Elliott on 2020/12/30.
//  Copyright © 2020 ElliottTest. All rights reserved.
//

import Foundation
import HandyJSON

class BackLogListModel: HandyJSON {
    
     var groupResources: Array<ApprovalBackLogEntry> = []
    
    required init(){}
}
