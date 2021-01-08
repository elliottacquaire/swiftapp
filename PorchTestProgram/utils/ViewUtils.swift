//
//  ViewUtils.swift
//  PorchTestProgram
//
//  Created by Elliott on 2020/12/28.
//  Copyright © 2020 ElliottTest. All rights reserved.
//

import Foundation
import SwiftUI

extension View {
    func endEditing() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
    func eraseToAnyView() -> AnyView {
        AnyView(self)
        
    }
    
    func addVerifiedBadge(_ isVerified: Bool) -> some View {
           ZStack(alignment: .topTrailing) {
               self

               if isVerified {
                   Image(systemName: "circle.fill")
                       .foregroundColor(.red)
                       .offset(x: 10, y: -10)
               }
           }
       }
}
