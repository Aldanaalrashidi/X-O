//
//  ViewController.swift
//  X-O
//
//  Created by tahani alrashidi on 6/21/20.
//  Copyright © 2020 Aldana Al-Rashidi. All rights reserved.
//

import AVFoundation
import UIKit
import AudioToolbox



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
    
    @IBOutlet weak var xScore: UILabel!
    @IBOutlet weak var oScore: UILabel!
    
    @IBOutlet weak var reset: UIButton!
    @IBOutlet weak var turnLabel: UILabel!
    
    //buttons
    var buttons: [UIButton] = []
    var counter = 0
    var alert:UIAlertController!
    
    //all music
    var silly1Sound: AVAudioPlayer?
    var silly2Sound: AVAudioPlayer?
    var cheer: AVAudioPlayer?
    
    //X and O score counter
    var scoreX = 0
    var scoreO = 0
    
    let backgroundColorSource = BackgroundColorSource()
    
    //X music
    func playSilly1(){
        let path = Bundle.main.path(forResource: "silly1.mp4", ofType: nil)!
        let url = URL(fileURLWithPath: path)
        
        do{
            silly1Sound = try AVAudioPlayer(contentsOf: url)
            silly1Sound?.play()
        } catch{
            // couldn't load file
        }
    }
    
    //O music
    func playSilly2(){
        let path = Bundle.main.path(forResource: "silly2.mp4", ofType: nil)!
        let url = URL(fileURLWithPath: path)
        
        do{
            silly2Sound = try AVAudioPlayer(contentsOf: url)
            silly2Sound?.play()
        }catch{
            // couldn't load file
        }
    }
    
    //winning music
    func playCheer(){
        let path = Bundle.main.path(forResource: "cheer.m4a", ofType: nil)!
        let url = URL(fileURLWithPath: path)
        
        do{
            cheer = try AVAudioPlayer(contentsOf: url)
            cheer?.play()
        }catch{
            // couldn't load file
        }
    }
    
    override func viewDidLoad() {
        buttons = [b1, b2, b3, b4, b5, b6, b7, b8, b9]
        super.viewDidLoad()
    }
    
    //9 buttons
    @IBAction func press(_ sender: UIButton) {
        
        print("تم الضغط علي")
        print(counter)
        
         if counter % 2 == 0 {
            playSilly1()
            sender.setTitle("X", for: .normal)
            AudioServicesPlayAlertSoundWithCompletion(SystemSoundID(kSystemSoundID_Vibrate)) { }
            sender.setTitleColor(.red, for: .normal)
            sender.backgroundColor = UIColor.green
            turnLabel.text = "O Turn"
        }else{
            playSilly2()
            sender.setTitle("O", for: .normal)
            AudioServicesPlayAlertSoundWithCompletion(SystemSoundID(kSystemSoundID_Vibrate)) { }
            sender.setTitleColor(.blue, for: .normal)
            sender.backgroundColor = UIColor.red
            turnLabel.text = "X Turn"
        }
        
        counter += 1
        sender.isEnabled = false
        
        winning(winner: "X")
        winning(winner: "O")
        
    }
    
    //Reset button
    @IBAction func resetTapped() {
        self.restartGame()
    }
    
    //Play Again button
    @IBAction func playAgain() {
        self.restartGame()
        self.restartGame2()
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
            self.changeColor()
            
            //counting the scores
           if winner == "X"{
                self.scoreX += 1
                self.xScore.text = String(self.scoreX)
            }
          else if winner == "O"{
                self.scoreO += 1
                self.oScore.text = String(self.scoreO)
            }
            
            self.restartGame()
            
            //winner if the score is 3
            if scoreX == 3{
            playCheer()
            let alertController = UIAlertController(title: "\(winner) has won 3 times 🎉", message: "Click on the play button to play again", preferredStyle: .alert)
            let restartAction = UIAlertAction(title: "Play Again", style: .cancel) { (alert) in
            
                self.restartGame()
                self.restartGame2()
                }
                alertController.addAction(restartAction)
                present(alertController, animated: true, completion: nil)
            }
            else if scoreO == 3{
                playCheer()
                let alertController = UIAlertController(title: "\(winner) has won 3 times 🎉", message: "Click on the play button to play again", preferredStyle: .alert)
                let restartAction = UIAlertAction(title: "Play Again", style: .cancel) { (alert) in
                    
                    self.restartGame()
                    self.restartGame2()
                    }
                    alertController.addAction(restartAction)
                    present(alertController, animated: true, completion: nil)
            }
            
        }
    }

    
    
    
   // first restart func is for the buttons the second is for the score
    func restartGame()
    {
        for b in buttons{
            b.setTitle("", for: .normal)
            b.titleLabel?.text = ""
            b.isEnabled = true
            b.backgroundColor = UIColor.white
        }
        counter = 0
        turnLabel.text = "X Turn"
    }
    
    func restartGame2(){
       self.oScore.text = " "
        self.xScore.text = " "
        scoreO = 0
        scoreX = 0
    }
    
    //change color every time someone wins
    func changeColor(){
       view.backgroundColor = BackgroundColorSource().randomColor()
    }
    
   
     //Background music
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

