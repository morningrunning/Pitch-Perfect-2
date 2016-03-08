//
//  PlaySoundsViewController.swift
//  Pitch Perfect 2
//
//  Created by Ronald Morgan on 2/25/16.
//  Copyright © 2016 Ronald Morgan. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController {

    var audioPlayer = AVAudioPlayer!()
    var receivedAudio:RecordedAudio!
    var audioEngine: AVAudioEngine!
    var audioFile: AVAudioFile!
    
    override func viewDidLoad() {
    super.viewDidLoad()

      
        
    audioPlayer = try! AVAudioPlayer(contentsOfURL:receivedAudio.filePathUrl)
    audioPlayer.enableRate = true
    audioEngine = AVAudioEngine()
    audioFile = try! AVAudioFile(forReading: receivedAudio.filePathUrl)
        
    }

    override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    
        
    }
    
    func stopAllAudio(rate: Float){
        audioPlayer.stop()
        audioEngine.stop()
    }
    
    func playAudio(rate: Float) {
        audioPlayer.play()
        audioPlayer.currentTime = 0.0
        audioPlayer.rate = rate
    }
    
    @IBAction func playSlowAudio(sender: UIButton) {
        audioPlayer.rate = 0.5
    }

    @IBAction func playFastAudio(sender: UIButton) {
        audioPlayer.rate = 1.5
    }
    
    
    @IBAction func stopAudio(sender: UIButton) {
        audioEngine.reset()
    }
    
    @IBAction func playChipmunkAudio(sender: UIButton) {
        playAudioWithVariablePitch(1000)
    }
    
    
    
    @IBAction func playDarthvaderAudio(sender: UIButton) {
        playAudioWithVariablePitch(-1000)
    }
    
    func playAudioWithVariablePitch(pitch: Float){
        audioPlayer.stop()
        audioEngine.stop()
        audioEngine.reset()
        
        let audioPlayerNode = AVAudioPlayerNode()
        audioEngine.attachNode(audioPlayerNode)
        
        let changePitchEffect = AVAudioUnitTimePitch()
        changePitchEffect.pitch = pitch
        audioEngine.attachNode(changePitchEffect)
        
        audioEngine.connect(audioPlayerNode, to: changePitchEffect, format: nil)
        audioEngine.connect(changePitchEffect, to: audioEngine.outputNode, format: nil)
        
        audioPlayerNode.scheduleFile(audioFile, atTime: nil, completionHandler: nil)
        try! audioEngine.start()
        
        audioPlayerNode.play()
    }
}
