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
    
    func playAudio() {
        audioPlayer.play()
        audioPlayer.currentTime = 0.0
        audioEngine.reset()
        
    }
    
    func stopAllAudio(){
        audioPlayer.stop()
        audioEngine.stop()
        audioEngine.reset()
        audioPlayer.currentTime = 0.0
    }
    
    
    @IBAction func playSlowAudio(sender: UIButton) {
        audioPlayer.rate = 0.5
        playAudio()
    }

    @IBAction func playFastAudio(sender: UIButton) {
        audioPlayer.rate = 1.5
        playAudio()
        
    }
    
    
    @IBAction func stopAudio(sender: UIButton) {
        stopAllAudio()
        
    }
    
    @IBAction func playChipmunkAudio(sender: UIButton) {
        playAudioWithVariablePitch(1000)
        
    }
    
    @IBAction func playDarthvaderAudio(sender: UIButton) {
        playAudioWithVariablePitch(-1000)
        
    }
    
    func playAudioWithVariablePitch(pitch: Float){
        stopAllAudio()
        
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
