//
//  ViewController.swift
//  X-O
//
//  Created by tahani alrashidi on 6/21/20.
//  Copyright © 2020 Aldana Al-Rashidi. All rights reserved.
//

import AVFoundation
import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var b1: UIButton!
    @IBOutlet weak var b2: UIButton!
    @IBOutlet weak var b3: UIButton!
    @IBOutlet weak var b4: UIButton!
    @IBOutlet weak var b5: UIButton!
    @IBOutlet weak var b6: UIButton!
    @IBOutlet weak var b7: UIButton!
    @IBOutlet weak var b8: UIButton!
    @IBOutlet weak var b9: UIButton!
    
    @IBOutlet weak var turnLabel: UILabel!
    
    var buttons: [UIButton] = []
    var counter = 0
    
    override func viewDidLoad() {
        buttons = [b1, b2, b3, b4, b5, b6, b7, b8, b9]
        super.viewDidLoad()
    }
    
    @IBAction func press(_ sender: UIButton) {
        
        print("تم الضغط علي")
        print(counter)
        
        if counter % 2 == 0 {
            sender.setTitle("X", for: .normal)
            sender.setTitleColor(.blue, for: .normal)
            turnLabel.text = "O Turn"
        }
        else{
            sender.setTitle("O", for: .normal)
            sender.setTitleColor(.red, for: .normal)
            turnLabel.text = "X Turn"
        }
        
        counter += 1
        sender.isEnabled = false
        
        winning(winner: "X")
        winning(winner: "O")
    }
    
    @IBAction func resetTapped() {
        self.restartGame()
    }
    
    
    func winning(winner: String) {
        if  (b1.titleLabel?.text == winner && b2.titleLabel?.text == winner && b3.titleLabel?.text == winner) ||
            (b4.titleLabel?.text == winner && b5.titleLabel?.text == winner && b6.titleLabel?.text == winner) ||
            (b7.titleLabel?.text == winner && b8.titleLabel?.text == winner && b9.titleLabel?.text == winner) ||
            (b1.titleLabel?.text == winner && b4.titleLabel?.text == winner && b7.titleLabel?.text == winner) ||
            (b2.titleLabel?.text == winner && b5.titleLabel?.text == winner && b8.titleLabel?.text == winner) ||
            (b3.titleLabel?.text == winner && b6.titleLabel?.text == winner && b9.titleLabel?.text == winner) ||
            (b1.titleLabel?.text == winner && b5.titleLabel?.text == winner && b9.titleLabel?.text == winner) ||
            (b3.titleLabel?.text == winner && b5.titleLabel?.text == winner && b7.titleLabel?.text == winner)
        {
            print("\(winner) is the winner 🎉")
            
            let alertController = UIAlertController(title: "\(winner) is the WINNER 🎉", message: "Click on the play button to play again", preferredStyle: .alert)
            let restartAction = UIAlertAction(title: "Play Again", style: .cancel) { (alert) in
                
                //Restart Game
                self.restartGame()
            }
            alertController.addAction(restartAction)
            present(alertController, animated: true, completion: nil)
        }
    }
    
    
    func restartGame()
    {
        for b in buttons{
            b.setTitle("", for: .normal)
            b.titleLabel?.text = ""
            b.isEnabled = true
        }
        counter = 0
        turnLabel.text = "X Turn"
    }
    
    //music
    
    @IBOutlet var music : UIButton!
    
    var player: AVAudioPlayer?

    @IBAction func didTapMusic() {
            if let player = player, player.isPlaying {
                //stop playback
                player.stop()
            }
            else{
                //set up player, and play
                let urlString = Bundle.main.path(forResource: "audio", ofType: "mp3")
            do{
                try AVAudioSession.sharedInstance().setMode(.default)
                try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)
                
                guard let urlString = urlString else {
                    return
                }
                player = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: urlString))
                
                guard let player = player else {
                    return
                }
                player.play()
            }
            catch{
                print("something went wrong")
            }
        }

    }
    }

