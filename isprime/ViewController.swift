//
//  ViewController.swift
//  isprime
//
//  Created by Kenneth Taylor on 2/15/18.
//  Copyright © 2018 Kenneth Taylor. All rights reserved.
//

import UIKit
var score: Int = 0;
var numPrimes: Int = 0;
var highScore: Int = 0;
class ViewController: UIViewController {
    @IBOutlet weak var scoreboard: UILabel!
    @IBOutlet weak var highscore: UILabel!
    @IBOutlet weak var primescore: UILabel!
    @IBOutlet weak var target: UILabel!
    @IBOutlet weak var timestamp: UILabel!
    @IBOutlet weak var youwin: UILabel!

    // the beginning of time
    var time = 0.0;
    var timer = Timer();
    
    
    @IBAction func start(_ sender: Any) {
        timer.invalidate();
        if(youwin.textColor == UIColor.white){
            youLose();
            timestamp.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1);
        } else {
            target.text = String(arc4random_uniform(98)+2);
            youwin.textColor = UIColor.white;
            youwin.text = "";
            time = 0;
            timestamp.text = String(time); //reset time, create new timer instance
            
            timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(ViewController.action), userInfo: nil, repeats: true);
            timestamp.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1);
        }
        
    }
    func action(){
        time+=0.1;
        if(time>5){
            self.youLose();
        }
        timestamp.text = String(time);
        
    }
    
   /* @IBAction func choice(_ sender: Any){
     TODO: make all buttons connect to one function
    }*/

    @IBAction func two(_ sender: Any) {
        if(divisible(n: 2)){
            divide(n: 2);
            scoring(n: 2);
        } else {
            youLose();
        }
    }
    @IBAction func three(_ sender: Any) {
        if(divisible(n: 3)){
            divide(n: 3);
            scoring(n: 3);
        } else {
            youLose();
        }
    }
    @IBAction func five(_ sender: Any) {
        if(divisible(n: 5)){
            divide(n: 5);
            scoring(n: 5);
        } else {
            youLose();
        }
    }
    @IBAction func seven(_ sender: Any) {
        if(divisible(n: 7)){
            divide(n: 7);
            scoring(n: 7);
        } else {
            youLose();
        }
    }
    @IBAction func eleven(_ sender: Any) {
        if(divisible(n: 11)){
            divide(n: 11);
            scoring(n: 5); // valued less because they are easy to spot
        } else {
            youLose();
        }
    }
    @IBAction func thirteen(_ sender: Any) {
        if(divisible(n: 13)){
            divide(n: 13);
            scoring(n: 13);
        } else {
            youLose();
        }
    }
    @IBAction func seventeen(_ sender: Any) {
        if(divisible(n: 17)){
            divide(n: 17);
            scoring(n: 17);
        } else {
            youLose();
        }
    }
    @IBAction func nineteen(_ sender: Any) {
        if(divisible(n: 19)){
            divide(n: 19);
            scoring(n: 19);
        } else {
            youLose();
        }
    }
    @IBAction func twentythree(_ sender: Any) {
        if(divisible(n: 23)){
            divide(n: 23);
            scoring(n: 23);
        } else {
            youLose();
        }
    }
    @IBAction func twentynine(_ sender: Any) {
        if(divisible(n: 29)){
            divide(n: 29);
            scoring(n: 29);
        } else {
            youLose();
        }
    }
    @IBAction func isprime(_ sender: Any) {
        if let tar = (Int((target.text!))){
            if(isPrime(tar)){
                timestamp.text = "0";
                timestamp.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1);
                timer.invalidate();
                
                youwin.textColor = UIColor.black;
                youwin.text = "You Win";
                numPrimes += 1;
                primescore.text = "# of Primes: "+String(numPrimes);
            } else {
                youLose();
            }
        }
    }
    func youLose(){
        timestamp.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1);
        timer.invalidate();
        if(highScore<score){
            highscore.text = "High Score: "+String(score);
            highScore = score;
        }
        youwin.text = "You Lose.\nFinal Score: "+String(score);
        youwin.textColor = UIColor.red;
        score = 0;
        scoring(n:0);
        numPrimes = 0;
        primescore.text = "# of Primes: "+String(numPrimes);
        target.text = "Get Ready"
    }
    func divisible(n: Int) -> Bool {
        if let tar = (Int((target.text!))){
            return (n != tar) && tar%n == 0;
        } else {
            return false;
        }
    }
    func divide(n:Int) {
        self.target.text = String(Int(self.target.text!)!/n);
    }
    func scoring(n: Int) {
        score = score + n;
        scoreboard.text = "Score: " + String(score);
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        score = 0;
        numPrimes = 0;
        highScore = 0;
    }
    func isPrime(_ number: Int) -> Bool {
        return number > 1 && !(2..<number).contains { number % $0 == 0
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
