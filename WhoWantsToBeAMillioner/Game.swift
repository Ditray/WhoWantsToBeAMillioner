//
//  Singleton.swift
//  WhoWantsToBeAMillioner
//
//  Created by Андрей Дитякин on 16.04.2023.
//

import Foundation
class Game {
    private init() {}
    static let shared = Game()
    var session: GameSession
}
