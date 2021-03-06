//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation


func createRandomNumbers(range: ClosedRange<Int> = (1...9), count: Int = 3) -> [Int] {
    let shuffledNumbers = [Int](range).shuffled()
    let extractedNumbers = [Int](shuffledNumbers[0..<count])
    return extractedNumbers
}

func classifyStrikeOrBall(triedNumbersIndex: Int, matchIndex: Int?, strikeCount: inout Int, ballCount: inout Int) {
    if matchIndex == nil {
        return
    } else if matchIndex == triedNumbersIndex {
        strikeCount += 1
    } else {
        ballCount += 1
    }
}

func sumUpScores(secretNumbers: [Int], triedNumbers: [Int]) -> (Int, Int) {
    var strikeCount: Int = 0
    var ballCount: Int = 0
    
    for index in 0..<secretNumbers.count {
        let matchIndex = secretNumbers.firstIndex(of: triedNumbers[index])
        classifyStrikeOrBall(triedNumbersIndex: index, matchIndex: matchIndex, strikeCount: &strikeCount, ballCount: &ballCount)
    }
    return (strikeCount, ballCount)
}

func printVictoryMessage(leftGameCount: Int, strikeScore: Int) {
    let victoryGoal = 3
    
    if leftGameCount == .zero && strikeScore < victoryGoal {
        print("컴퓨터 승리…!")
    } else if strikeScore == victoryGoal {
        print("사용자 승리!")
    }
}

func startGame() {
    let randomSecretNumbers = createRandomNumbers()
    var gameCount = 9
    
    while gameCount > .zero {
        gameCount -= 1
        let userNumbers = createRandomNumbers()
        let (strikeCount, ballCount) = sumUpScores(secretNumbers: randomSecretNumbers, triedNumbers: userNumbers)
        
        print("임의의 수 : \(userNumbers.reduce("", { $0 + String($1) + " " }))")
        print("\(strikeCount) 스트라이크, \(ballCount) 볼")
        print("남은 기회 : \(gameCount)")
        
        printVictoryMessage(leftGameCount: gameCount, strikeScore: strikeCount)
    }
}

startGame()
