//
//  ViewController.swift
//  Sonajero
//
//  Created by CLAG on 1/4/16.
//  Copyright © 2016 Clag. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var maracasImage: UIImageView!
    
    var player:AVAudioPlayer = AVAudioPlayer()
    let sounds = ["accent", "ticking", "blast", "whirly", "down", "whistle", "wah", "bean", "crash", "shake", "cartoon"]
    
    override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent?) {
        if event?.subtype == UIEventSubtype.MotionShake{
            let randomNumber = Int(arc4random_uniform(UInt32(sounds.count)))
            if let audioPath = NSBundle.mainBundle().pathForResource(self.sounds[randomNumber], ofType: "mp3"){
                do {
                    self.player = try AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: audioPath))
                    self.player.play()
                } catch let error as NSError{
                    print(error)
                }
            }
        }
        
        // Animación de maracas
        UIView.animateWithDuration(2, animations: {
            self.maracasImage.transform = CGAffineTransformMakeRotation(-90)
            }, completion:{
                (value: Bool) in
                UIView.animateWithDuration(2, animations: {
                    self.maracasImage.transform = CGAffineTransformMakeRotation(0)
                })
            })

        UIView.animateWithDuration(2, animations: {
            self.maracasImage.transform = CGAffineTransformMakeRotation(90)
            }, completion:{
                (value: Bool) in
                UIView.animateWithDuration(2, animations: {
                    self.maracasImage.transform = CGAffineTransformMakeRotation(0)
                })
        })

    }

}

