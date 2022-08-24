//
//  Constans.swift
//  learnEnglish
//
//  Created by Rasyid Ridla on 24/06/22.
//

import Foundation


//key userdefaults
let udIsShowOnBoardKey = "udIsShowOnBoardKey"
let udUserNameKey = "udUserNameKey"
let udIsShowTutorialKey = "udIsShowTutorialKey"

//value userdefaults
var udUserName = UserDefaults.standard.string(forKey: udUserNameKey)
var udIsShowOnBoard = UserDefaults.standard.bool(forKey: udIsShowOnBoardKey)
