//
//  SoundPlayerManager.swift
//  Star Guitar
//
//  Created by djzhang on 3/23/17.
//  Copyright © 2017 djzhang. All rights reserved.
//

import Foundation
import AVFoundation
import UIKit

/**
* https://github.com/asmz/SwiftAudioPlayerSample/blob/master/SwiftAudioPlayerSample/SwiftPlayerManager.swift
*/

class SoundPlayerManager: AnyObject {

    var soundPlayers: [AVAudioPlayer] = [AVAudioPlayer]()

    init() {
        do {
            // Preperation
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
            try AVAudioSession.sharedInstance().setActive(true)
        } catch _ {
        }
    }

    func prepareSounds(count: Int, withFormat format: String, withType type: String) {
        for index in 1 ... count {
            do {
                // Set the sound file name & extension
                let fileName = String(format: format, index)
                if let filePath = Bundle.main.path(forResource: fileName, ofType: type) {
                    let alertSound = URL(fileURLWithPath: filePath)
                    let audioPlayer = try AVAudioPlayer(contentsOf: alertSound)
                    audioPlayer.prepareToPlay()
                    self.soundPlayers.append(audioPlayer)
                }
            } catch {
                print("Sound initialization failed")
            }
        }

    }

    func resetAndPlay(index: Int) {
        let player = self.soundPlayers[index]
        self.setPlayingTime(player: player, toPos: 0)
        player.play()
    }

    // 再生位置変更
    func setPlayingTime(player: AVAudioPlayer, toPos pos: Double) {
        // 引数に設定された再生位置をプレイヤーに設定
        if (player.isPlaying) {
            player.currentTime = pos
        }
    }

}

