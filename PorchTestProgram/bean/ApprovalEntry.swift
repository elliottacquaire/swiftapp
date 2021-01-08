//
//  ApprovalEntry.swift
//  PorchTestProgram
//
//  Created by Elliott on 2020/12/30.
//  Copyright © 2020 ElliottTest. All rights reserved.
//

import Foundation
import HandyJSON

class ApprovalEntry: HandyJSON {
    
    var id: Int = 0
    
    
    var flowName = ""//折扣申请
    
    
    var no = ""//300123459059
    
    var infoList: Array<InfoModel> = []
    var flowCode = ""
    var committerLabel : String{
        //销售
        get {
            return infoList[0].operateType
        }
    }
    
    var committer : String {
        //王一波
        get {
            return "\(infoList[0].operateRoleName) \(infoList[0].operateName)"
        }
    }
    var transferLabel : String {
        //销售
        get {
            if infoList.count > 1 {
                return  infoList[1].operateType
                
            } else {
                return "";
            }
        }
    }
    var transfer = ""
    //王一波
    //           get() {
    //               return if (infoList!!.size > 1) "${infoList!![1].operateRoleName} ${infoList!![1].operateName}" else "";
    //           }
    
    var approvalLabel = ""
    //销售
    //           get() {
    //               return if (infoList!!.size > 2) infoList!![2].operateType else "";
    //           }
    var approval = ""
    //王一波
    //           get() {
    //               return if (infoList!!.size > 2) "${infoList!![2].operateRoleName} ${infoList!![2].operateName}" else "";
    //           }
    
    
    var bpId = ""//608101234
    
    
    var customerName = ""
    
    
    var carType = ""//911 Carrera
    
    // 2020-1-22
    var submitDate = 0
    //    {
    //        didSet{
    //           return String.timeIntervalChangeToTimeStr(timeInterval: Double.init(oldValue) ?? 0, "yyyy-MM-dd")
    //        }
    //
    //    }
    
    //日期转化
    var dateTrans : String {
        get{
            return String.timeIntervalChangeToTimeStr(timeInterval: Double.init(submitDate) , "yyyy-MM-dd")
        }
    }
    
    //带属性监视器的普通属性
    var age:Int = 0
    {
        //我们需要在age属性变化前做点什么
        willSet{
            
        }
        //我们需要在age属性发生变化后，更新一下nickName这个属性
        didSet{
            
            if age<10
            {
                //                nickName = "Little"
            }else
            {
                //                nickName = "Big"
            }
        }
    }
    
    var totalPrice = ""//1,980,000.00
    
    
    var businessId = ""
    
    //saleTotalPrice  预估销售总价 ----对应报价单列表
    //transactionPrice 车辆成交价 ----对应合同列表
    //marketPrice  市场指导价 ----对应暂留列表
    
    var saleTotalPrice = 0.0
    
    
    var transactionPrice = 0.0
    
    
    var marketPrice = 0.0
    
    
    var flowType = 0
    
    
    var flowOrderId = 0
    
    
    var isHistory: Int = 0
    
    
    var reserveExpiredTime: String = ""
    
    
    var currentStepStatus = 0
    
    
    var protocolCount = 0
    
    
    
    
    required init(){
        
    }
    
}
