//
//  Answer.swift
//  TabBar
//
//  Created by Florian Bernard on 01/06/2019.
//  Copyright © 2019 Florian Bernard. All rights reserved.
//

import Foundation

struct Answer{
    var text: String
    var type: AnimalType
}

enum AnimalType: Character{
    case dog = "🐶", cat = "🐱", rabbit = "🐰", turtle = "🐢"
    
    var definition: String{
        switch self {
        case .dog:
            return "Tu es incroyablement amical. Tu t'entoures des gens que tu aimes et tu adores faire des activités avec eux. 😜"
        case .cat:
            return "Espiègle, mais tempéré, tu aimes faire des activités avec tes propres règles. 😼"
        case .rabbit:
            return "Tu aimes tout ce qui est doux. Tu es en pleine forme et énérgique. ✊"
        case .turtle:
            return "Tu es quelqu'un de sage et tu te concentres sur les détails. Lentement mais surement. 🙏"
        }
    }
}
