//
//  Pokemon.swift
//  TestCodeExample
//
//  Created by 박진수 on 2020/06/03.
//  Copyright © 2020 박진수. All rights reserved.
//

import Foundation

enum PokemonType {
    case fire
    case water
}

class Pokemon {
    let type: PokemonType
    var health: Int = 100
    
    init(type: PokemonType) {
        self.type = type
    }
    
    func attack(enemy: Pokemon) {
        var damage = 30
        
        switch enemy.type {
        case .fire:
            if type == .water {
                damage = 60
            }
        case .water:
            if type == .fire {
                damage = 10
            }
        }
        enemy.health -= damage
    }
    
}
