//
//  GameSession.swift
//  WhoWantsToBeAMillioner
//
//  Created by Андрей Дитякин on 16.04.2023.
//

import Foundation
protocol GameSessionDelegate: AnyObject {
    func didEndGame(withResult result: Int)
}
class GameSession{
    var ballance = 0
    var countOfQuestions = 0
    var answeredQuestions = 0
    weak var gameDelegate: GameSessionDelegate?
}
