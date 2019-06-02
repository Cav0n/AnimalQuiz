//
//  Question.swift
//  TabBar
//
//  Created by Florian Bernard on 01/06/2019.
//  Copyright © 2019 Florian Bernard. All rights reserved.
//

import Foundation

struct Question{
    var text: String
    var type: ResponseType
    var answers: [Answer]
}

enum ResponseType{
    case single, multiple, slider
}
