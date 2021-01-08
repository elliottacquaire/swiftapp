//
//  ApprovalDetail.swift
//  PorchTestProgram
//
//  Created by Elliott on 2021/1/5.
//  Copyright © 2021 ElliottTest. All rights reserved.
//

import SwiftUI

struct ApprovalDetail: View {
    var body: some View {
        ZStack(alignment: .topLeading) {
                   Text("Hello")
                       .alignmentGuide(HorizontalAlignment.leading, computeValue: { d in return 0 })
                       .alignmentGuide(.top, computeValue: { d in return 0 })
                       .background(Color.green)

                   Text("World")
                       .alignmentGuide(.top, computeValue: { d in return 100 })
                       .alignmentGuide(HorizontalAlignment.leading, computeValue: { d in return 0 })
                       .background(Color.purple)

               }
               .background(Color.orange)
    }
}

struct ApprovalDetail_Previews: PreviewProvider {
    static var previews: some View {
        ApprovalDetail()
    }
}
