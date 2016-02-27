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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let url = NSBundle.mainBundle().URLForResource("movie_quote", withExtension: "mp3"){
            audioPlayer = try! AVAudioPlayer(contentsOfURL: url)
        }
        else{
            print("The path is empty.")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func playSlowAudio(sender: UIButton) {
        audioPlayer.play()
    }

}
