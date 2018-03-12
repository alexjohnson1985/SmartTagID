//
//  StoredData.swift
//  SmartTagID
//
//  Created by Alex Johnson on 11/03/2018.
//  Copyright © 2018 Alex Johnson. All rights reserved.
//

import Foundation

var activeItemList : [String]?
var dateStampArray : [String]?
var timeStampArray : [String]?

func saveItemData(activeItemList:[String]) {
    UserDefaults.standard.set(activeItemList, forKey: "activeItemList")
}

func saveDateData(dateStampArray:[String]) {
    UserDefaults.standard.set(dateStampArray, forKey: "dateStampArray")
}

func saveTimeData(timeStampArray:[String]) {
    UserDefaults.standard.set(timeStampArray, forKey: "timeStampArray")
}

func fetchItemData() -> [String]? {
    if let activeItem = UserDefaults.standard.array(forKey: "activeItemList") as? [String] {
        return activeItem
    }
    else {
        return nil
         }
    
    }
    
func fetchDateData() -> [String]? {
    if let dateStamp = UserDefaults.standard.array(forKey: "dateStampArray") as? [String] {
        return dateStamp
    }
    else {
        return nil
         }
    }

func fetchTimeData() -> [String]? {
    if let timeStamp = UserDefaults.standard.array(forKey: "timeStampArray") as? [String] {
        return timeStamp
    }
    else {
        return nil
    }
}
