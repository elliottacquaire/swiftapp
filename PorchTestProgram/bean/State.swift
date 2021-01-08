//
//  State.swift
//  PorchTestProgram
//
//  Created by Elliott on 2020/12/31.
//  Copyright © 2020 ElliottTest. All rights reserved.
//

import Foundation

enum Statess<T>{
    case notRequested
    case isLoading(last: T?)
    case loaded(T)
    case failed(Error)
}
