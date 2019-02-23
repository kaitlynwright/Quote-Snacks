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
    @IBOutlet weak var backButton: UIButton!
    
    // MARK - Variables
    var quotes = ["“Better to remain silent and be thought a fool than to speak out and remove all doubt.” – Abraham Lincoln", "“If I were two-faced, would I be wearing this one?” – Abraham Lincoln", "“The best thing about the future is that it comes one day at a time.” – Abraham Lincoln", "“The only mystery in life is why the kamikaze pilots wore helmets.” – Al McGuire", "“People say nothing is impossible, but I do nothing every day.” – A. A. Milne", "“Light travels faster than sound. This is why some people appear bright until you hear them speak.” – Alan Dundes", "“Men marry women with the hope they will never change. Women marry men with the hope they will change. Invariably they are both disappointed.” – Albert Einstein", "“The difference between stupidity and genius is that genius has its limits.” – Albert Einstein", "“All the things I really like to do are either immoral, illegal or fattening.” – Alexander Woollcott", "“War is God’s way of teaching Americans geography.” – Ambrose Bierce", "“It would be nice to spend billions on schools and roads, but right now that money is desperately needed for political ads.” – Andy Borowitz", "“The average dog is a nicer person than the average person.” – Andy Rooney", "“At every party there are two kinds of people – those who want to go home and those who don’t. The trouble is, they are usually married to each other.” – Ann Landers", "“I don’t believe in astrology; I’m a Sagittarius and we’re skeptical.” – Arthur C. Clarke", "“My opinions may have changed, but not the fact that I’m right.” – Ashleigh Brilliant", "“To be sure of hitting the target, shoot first, and call whatever you hit the target.” – Ashleigh Brilliant", "“Trouble knocked at the door, but, hearing laughter, hurried away.” – Benjamin Franklin", "“Wine is constant proof that God loves us and loves to see us happy.” – Benjamin Franklin", "“Have you noticed that all the people in favor of birth control are already born?”– Benny Hill", "“Be who you are and say what you feel, because those who mind don’t matter and those who matter don’t mind.”– Bernard Baruch", "“Most people would sooner die than think; in fact, they do so.”– Bertrand Russell", "“The world is full of magical things patiently waiting for our wits to grow sharper.”– Bertrand Russell", "“Money won’t buy happiness, but it will pay the salaries of a large research staff to study the problem.” – Bill Vaughan", "“The surest sign that intelligent life exists elsewhere in the universe is that it has never tried to contact us.” – Bill Watterson", "“Before you judge a man, walk a mile in his shoes. After that who cares?… He’s a mile away and you’ve got his shoes!” – Billy Connolly", "“I’ve always wanted to go to Switzerland to see what the army does with those wee red knives.” – Billy Connolly", "“A bank is a place that will lend you money if you can prove that you don’t need it.”– Bob Hope", "“Inside me there’s a thin person struggling to get out, but I can usually sedate him with four or five cupcakes.” – Bob Thaves", "“We never really grow up, we only learn how to act in public.” – Bryan White", "“As a child my family’s menu consisted of two choices: take it or leave it.” – Buddy Hackett", "“My favorite machine at the gym is the vending machine.” – Caroline Rhea", "“All right everyone, line up alphabetically according to your height.” – Casey Stengel", "“He who laughs last didn’t get the joke.”– Charles de Gaulle", "“I always arrive late at the office, but I make up for it by leaving early.” – Charles Lamb", "“Don’t worry about the world coming to an end today. It is already tomorrow in Australia.” – Charles M. Schulz", "“By the time a man realizes that his father was right, he has a son who thinks he’s wrong.” – Charles Wadsworth", "“A day without laughter is a day wasted.” – Charlie Chaplin", "“Political correctness is tyranny with manners.” – Charlton Heston", "“High heels were invented by a woman who had been kissed on the forehead.” – Christopher Morley", "“If you love something set it free, but don’t be surprised if it comes back with herpes.” – Chuck Palahniuk", "“When I was a boy I was told that anybody could become President. I’m beginning to believe it.” – Clarence Darrow", "“A stockbroker urged me to buy a stock that would triple its value every year. I told him, ‘At my age, I don’t even buy green bananas.'”– Claude Pepper", "“They say marriages are made in Heaven. But so is thunder and lightning.”– Clint Eastwood", "“I’m too drunk to taste this chicken.” – Colonel Sanders", "“A study in the Washington Post says that women have better verbal skills than men. I just want to say to the authors of that study: ‘Duh.'” – Conan O’Brien", "“Starbucks says they are going to start putting religious quotes on cups. The very first one will say, ‘Jesus! This cup is expensive!'” – Conan O’Brien" ]
    
    let strokeTextAttributes = [
        NSAttributedString.Key.strokeColor.rawValue : UIColor.black,
        NSAttributedString.Key.foregroundColor : UIColor.white,
        NSAttributedString.Key.strokeWidth : -4.0,
        NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 45)
        ] as! [NSAttributedString.Key : Any]
    
    let backButtonAttributes = [
        NSAttributedString.Key.strokeColor.rawValue : UIColor.darkGray,
        NSAttributedString.Key.foregroundColor : UIColor.white,
        NSAttributedString.Key.strokeWidth : -3.0,
        NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 18)
        ] as! [NSAttributedString.Key : Any]
    
    var lastImage: Int?
    var lastQuote: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // set background
        assignBackground()
        
        // set back button
        backButton.setAttributedTitle(NSMutableAttributedString(string: "Back", attributes: backButtonAttributes), for: .normal)
        
        // set gesture recognizer
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe))
        swipeLeft.direction = .left
        self.view.addGestureRecognizer(swipeLeft)
        
    }
    
    // MARK - Actions
    @IBAction func handleSwipe(_ sender: UISwipeGestureRecognizer) {
        if sender.state == .ended  {
            assignBackground()
        }
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
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
