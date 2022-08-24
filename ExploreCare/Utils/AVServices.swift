//
//  AVService.swift
//  ExploreCare
//
//  Created by Rasyid Ridla on 22/08/22.
//

import Foundation
import AVFoundation

class AVService {
    private var player : AVAudioPlayer?
    private var backgroundMusicPlayer: AVAudioPlayer?
    
    private(set) var isPlayingBackgroundMusic: Bool = false
    
    static let shared = AVService()
    
    private init() {}
    
    func playMusic(name: String, type: String){
        //akses alamat
        let path = Bundle.main.path(forResource: name, ofType: type) ?? ""
        //ubah alamatnya jadi url
        let url = URL(fileURLWithPath: path)
        do {
            //masukin url ke audio player
            player = try AVAudioPlayer(contentsOf: url)
            
            //player di mainkan
            player?.play()
        } catch {
            print("couldn't load file")
        }
    }
    
    func playBackgroundMusic() {
        let path = Bundle.main.path(forResource: "background_music", ofType: "mpeg") ?? ""
        let url = URL(fileURLWithPath: path)
        
        do {
            if backgroundMusicPlayer == nil {
                backgroundMusicPlayer = try AVAudioPlayer(contentsOf: url)
            }
            backgroundMusicPlayer?.play()
            backgroundMusicPlayer?.numberOfLoops = -1
            isPlayingBackgroundMusic = true
        } catch {
            print("couldn't load file")
        }
    }
    
    func stopBackgroundMusic() {
        backgroundMusicPlayer?.stop()
        isPlayingBackgroundMusic = false
    }
    
    //play object sound
    func playObjectSound(player: AVService, objectRecog: ObjectRecog) {
        switch objectRecog.objectName {
            //Bedroom
        case "backpack": player.playMusic(name: "backpack", type: "mp3")
        case "book": player.playMusic(name: "book", type: "mp3")
        case "laptop": player.playMusic(name: "laptop", type: "mp3")
            
            //livingroom
        case "tvmonitor": player.playMusic(name: "tv", type: "mp3")
        case "clock": player.playMusic(name: "clock", type: "mp3")
            
            //kitchen
        case "cup": player.playMusic(name: "cup", type: "mp3")
            
            //garden
            //zoo
            //food
            //vehicles
            
        default:
            player.playMusic(name: "laptop", type: "mp3")
        }
    }


    //play additional sound
    func playAdditionalSound(player: AVService, type: String) {
        switch type {
        case "correct": player.playMusic(name: "correct", type: "aiff")
        default:
            player.playMusic(name: "correct", type: "aiff")
        }
    }
}
