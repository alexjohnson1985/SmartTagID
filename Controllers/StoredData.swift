//
//  StoredData.swift
//  SmartTagID
//
//  Created by Alex Johnson on 11/03/2018.
//  Copyright © 2018 Alex Johnson. All rights reserved.
//

import Foundation

var activeItemList : [String]?
let intialInstruction = "Tap 'Scan' below to start"

func saveData(activeItemList:[String]) {
    UserDefaults.standard.set(activeItemList, forKey: "activeItemList")
}

func fetchData() -> [String]? {
    if let activeItem = UserDefaults.standard.array(forKey: "activeItemList") as? [String] {
        return activeItem
    }
    else {
        return nil
    }
}
