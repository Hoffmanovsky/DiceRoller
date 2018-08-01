//
//  HandChecker.swift
//  DiceRoller
//
//  Created by Admin on 22.07.2018.
//  Copyright © 2018 Daniel Kaminski. All rights reserved.
//

import UIKit
import AVFoundation

class HandChecker {
    
    var audioPlayer: AVAudioPlayer?
    
    func playSound() {
        let soundURL = Bundle.main.url(forResource: "RollingSound", withExtension: "mp3")
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: soundURL!)
        } catch  {
            print(error)
        }
        audioPlayer?.play()
    }
    
    func checkHand(_ hand: [Int]) -> Hand {
        var seenOnce: Set<Int> = []
        var seenMorethanOnce: Set<Int> = []
        
        for number in hand {
            if seenMorethanOnce.contains(number) {}
            else if seenOnce.contains(number) {
                seenOnce.remove(number)
                seenMorethanOnce.insert(number)
            } else {
                seenOnce.insert(number)
            }
        }
        if seenOnce.isEmpty && seenMorethanOnce.count == 1 {
            return Hand.FiveOfKind
        } else if seenOnce.count == 1 && seenMorethanOnce.count == 1 {
            return Hand.FourOfKind
        } else if seenOnce.count == 2 && seenMorethanOnce.count == 1 {
            return Hand.ThreeOfKind
        } else if seenOnce.count == 1 && seenMorethanOnce.count == 2 {
            return Hand.TwoPairs
        } else if seenOnce.count == 3 && seenMorethanOnce.count == 1 {
            return Hand.OnePair
        } else if seenOnce.isEmpty && seenMorethanOnce.count == 2 {
            return Hand.FullHouse
        } else if seenOnce.count == 5 && seenMorethanOnce.isEmpty {
            let sum = hand.reduce(0, +)
            if sum == 15 {
                return Hand.LowStraight
            } else if sum == 20 {
                return Hand.HighStraight
            }
            return Hand.Bust
        }
        return Hand.Bust
    }
}
