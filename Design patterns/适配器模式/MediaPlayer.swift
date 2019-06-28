//
//  MediaPlayer.swift
//  Design patterns
//
//  Created by xhkj on 2019/6/27.
//  Copyright © 2019 Chuck. All rights reserved.
//

import UIKit

protocol MediaPlayer {
    func player(audioType type :String, withFileName filename: String) -> Void
}

protocol AdvancedMediaPlayer {
    func playVlc(filename: String) -> Void
    func playMp4(filename: String) -> Void
}

class VlcPlayer: AdvancedMediaPlayer {
    func playMp4(filename: String) {
        
    }
    
    func playVlc(filename: String) {
        print("player vlc")
    }
}

class Mp4Player: AdvancedMediaPlayer {
    func playVlc(filename: String) {
        
    }
    
    func playMp4(filename: String) {
        print("player mp4")
    }
}

class MediaAdapter: MediaPlayer {
    
    func player(audioType type: String, withFileName filename: String) {
        if type == "vlc" {
            print("player vlc form filename: \(filename)")
        } else {
            print("player mp4 form filename: \(filename)")
        }
    }
}

class AudioPlayer: MediaPlayer {
    
    func player(audioType type: String, withFileName filename: String) {
        if type == "mp3" {
            print("player mp3 form filename: \(filename)")
        } else if type == "vlc" || type == "mp4" {
            MediaAdapter().player(audioType: type, withFileName: filename)
        } else {
            print("invalid mdeia \(type) and filename:\(filename)")
        }
    }
}


