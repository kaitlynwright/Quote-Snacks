//
//  MessageViewController.swift
//  Quote Snacks
//
//  Created by Kaitlyn Wright on 2/18/19.
//  Copyright © 2019 Kaitlyn Wright. All rights reserved.
//

import UIKit

class MessageViewController: UIViewController {

    // MARK - Outlets
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var quoteLabel: UILabel!
    
    // MARK - Variables
    var quotes = ["“Better to remain silent and be thought a fool than to speak out and remove all doubt.” – Abraham Lincoln", "“If I were two-faced, would I be wearing this one?” – Abraham Lincoln", "“The best thing about the future is that it comes one day at a time.” – Abraham Lincoln", "“The only mystery in life is why the kamikaze pilots wore helmets.” – Al McGuire", "“People say nothing is impossible, but I do nothing every day.” – A. A. Milne", "“Light travels faster than sound. This is why some people appear bright until you hear them speak.” – Alan Dundes", "“Men marry women with the hope they will never change. Women marry men with the hope they will change. Invariably they are both disappointed.” – Albert Einstein", "“The difference between stupidity and genius is that genius has its limits.” – Albert Einstein", "“All the things I really like to do are either immoral, illegal or fattening.” – Alexander Woollcott", "“War is God’s way of teaching Americans geography.” – Ambrose Bierce", "“It would be nice to spend billions on schools and roads, but right now that money is desperately needed for political ads.” – Andy Borowitz", "“The average dog is a nicer person than the average person.” – Andy Rooney", "“At every party there are two kinds of people – those who want to go home and those who don’t. The trouble is, they are usually married to each other.” – Ann Landers", "“I don’t believe in astrology; I’m a Sagittarius and we’re skeptical.” – Arthur C. Clarke", "“My opinions may have changed, but not the fact that I’m right.” – Ashleigh Brilliant", "“To be sure of hitting the target, shoot first, and call whatever you hit the target.” – Ashleigh Brilliant", "“Trouble knocked at the door, but, hearing laughter, hurried away.” – Benjamin Franklin", "“Wine is constant proof that God loves us and loves to see us happy.” – Benjamin Franklin"]
    
    let strokeTextAttributes = [
        NSAttributedString.Key.strokeColor.rawValue : UIColor.black,
        NSAttributedString.Key.foregroundColor : UIColor.white,
        NSAttributedString.Key.strokeWidth : -4.0,
        NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 45)
        ] as! [NSAttributedString.Key : Any]
    
    var lastImage: Int?
    var lastQuote: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        assignBackground()
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe))
        swipeLeft.direction = .left
        self.view.addGestureRecognizer(swipeLeft)
    }
    
    @IBAction func handleSwipe(_ sender: UISwipeGestureRecognizer) {
        if sender.state == .ended  {
            assignBackground()
        }
    }
    
    // MARK - Methods
    func assignBackground() {
        // set image
        var randomNum = Int(arc4random_uniform(UInt32(26 - 1))) + 1
        while randomNum == lastImage {
            randomNum = Int(arc4random_uniform(UInt32(26 - 1))) + 1
        }
        lastImage = randomNum
        
        let background = UIImage(named: "image_" + String(randomNum) + ".jpg")
        imageView?.contentMode =  UIView.ContentMode.scaleAspectFill
        imageView?.image = background
        
        // set quote
        randomNum = Int(arc4random_uniform(UInt32(quotes.count)))
        while randomNum == lastQuote {
            randomNum = Int(arc4random_uniform(UInt32(quotes.count)))
        }
        lastQuote = randomNum
        
        let quote = quotes[randomNum]
        quoteLabel.attributedText = NSMutableAttributedString(string: quote, attributes: strokeTextAttributes)
    }
}
