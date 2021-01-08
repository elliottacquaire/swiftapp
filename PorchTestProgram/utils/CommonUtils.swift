//
//  CommonUtils.swift
//  PorchTestProgram
//
//  Created by Elliott on 2020/12/28.
//  Copyright © 2020 ElliottTest. All rights reserved.
//

import Foundation

func checkUserTelNumber(telNumber : String ){
    let expression = "^((13\\d)|(14[5|7])|(15([0-3]|[5-9]))|(18[^14]))\\d{8}$"//"|"表示什么就不用说了吧，[5|7]表示满足其中任意一个即匹配，数量唯一，"[0-3]"则表示满足0到之间的数字即匹配，数量唯一，[^14]表示匹配除1和4以外的任意字符，这里包括了字母，所以建议弹出键盘类型为数字键盘

    let regex = try! NSRegularExpression(pattern: expression, options: .allowCommentsAndWhitespace)//生成NSRegularExpression实例

    let numberOfMatches = regex.numberOfMatches(in: telNumber, options:.reportProgress, range: NSMakeRange(0, (telNumber as NSString).length))//获取匹配的个数

    if numberOfMatches != 0{//如果匹配，则登录按钮生效，否则反之
//        loginBtn.backgroundColor = UIColor.brown
//        loginBtn.isEnabled = true
        print("it is ok")
    }else{
//        loginBtn.backgroundColor = UIColor.lightGray
//        loginBtn.isEnabled = false
         print("it is not ok")
    }
}

