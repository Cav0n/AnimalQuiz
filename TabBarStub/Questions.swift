//
//  Questions.swift
//  TabBar
//
//  Created by Florian Bernard on 02/06/2019.
//  Copyright © 2019 Florian Bernard. All rights reserved.
//

import Foundation

let questionsStub : [Question] = [
    Question(text: "Quel nourriture aimes-tu le plus ?",
             type: .single,
             answers: [
                Answer(text: "🥩", type: .dog),
                Answer(text: "🐟", type: .cat),
                Answer(text: "🥕", type: .rabbit),
                Answer(text: "🌽", type: .turtle)]),
    Question(text: "Quel activités aimes-tu ?",
             type: .multiple,
             answers: [
                Answer(text: "Nager", type: .turtle),
                Answer(text: "Dormir", type: .cat),
                Answer(text: "Câliner", type: .rabbit),
                Answer(text: "Manger", type: .dog)]),
    Question(text: "Aimes-tu les trajets en voiture ?",
             type: .slider,
             answers: [
                Answer(text: "Je déteste ça", type: .cat),
                Answer(text: "Ça me stresse un petit peu",
                       type: .rabbit),
                Answer(text: "Je n'y fait pas attention",
                       type: .turtle),
                Answer(text: "J'adore !", type: .dog)])]
