//
//  GameViewController.swift
//  WhoWantsToBeAMillioner
//
//  Created by Андрей Дитякин on 16.04.2023.
//

import UIKit

protocol GameViewControllerDelegate: AnyObject {
    func didEndGame(withResult result: Int)
}
class GameViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet var questionLabel: UILabel!
    
    @IBAction func answerButton(_ sender: UIButton) {
        if sender.currentTitle == questions[numberOfQuestion].trueAnswer {
            numberOfQuestion += 1
            result += 5000
            print("Success")
            initData(question: questions[numberOfQuestion])
        } else {
            session.gameDelegate?.didEndGame(withResult: result)
        }
    }
    @IBOutlet var answer: [UIButton]!
    // MARK: - Variablees
    
    let session = GameSession()
    weak var delegate: GameViewControllerDelegate?
    var result = 0
    var numberOfQuestion = 0
    var questions: [Question] = [
        Question(question: "Как назывался первый советский фильм-катастрофа?", allAnswers: ["A: «34-й скорый»","B: «Остановился поезд»","C: «Экипаж»","D: «Берегись автомобиля»"], trueAnswer: "C: «Экипаж»"),
        Question(question: "Какой газ преобладает в атмосфере Земли?", allAnswers: ["А: Кислород","B: Азот","C: Углекислый газ","D: Водород»"], trueAnswer: "B: Азот"),
        Question(question: "Кто из этих деятелей искусства стал директором первого профессионального публичного театра России?", allAnswers: ["A: Александр Сумароков","B: Василий Каратыгин»","C: Павел Молчанов","D: Яков Княжнин"], trueAnswer: "A: Александр Сумароков"),
        Question(question: "Какой вид спорта не входит в современное пятиборье?", allAnswers: ["A: Метание копья»","B: Верховая езда","C: Фехтование","D: Плавание"], trueAnswer: "A: Метание копья»"),
        Question(question: "Как иначе называют пиратский флаг?", allAnswers: ["A: Весёлый Роджер","B: Грязный Гарри","C: Бедный Йорик","D: Лимонадный Джо"], trueAnswer: "A: Весёлый Роджер"),
        Question(question: "Какой фильм Феллини сделал имя Папарацци нарицательным?", allAnswers: ["A: «Сладкая жизнь»","B: «Восемь с половиной»","C: «Ночи Кабирии»","D: «Дорога»"], trueAnswer: "A: «Сладкая жизнь»")
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        session.gameDelegate = self
        initData(question: questions[numberOfQuestion])
    }
    

    func initData(question: Question){
        self.questionLabel.text = question.question
        for index in question.allAnswers.enumerated() {
            self.answer[index.offset].setTitle(question.allAnswers[index.offset], for: .normal)
        }
    }
    
}
extension GameViewController: GameSessionDelegate {
    func didEndGame(withResult result: Int) {
        delegate?.didEndGame(withResult: result)
        self.dismiss(animated: true)
    }
}
