//
//  farStudy.swift
//  CPA practice
//
//  Created by Volodymyr Lipunov on 11/27/15.
//  Copyright © 2015 Lippy Design. All rights reserved.
//

import Foundation
import UIKit
import MessageUI

struct farQuestion {
    var Question : String!
    var Answers : [String]!
    var Answer : Int!
    var Explanation: String!
}

class farStudy : UIViewController, MFMailComposeViewControllerDelegate {
    
    @IBOutlet weak var resourceLABEL: UILabel!
    
    @IBOutlet weak var QLabel: UILabel!
    
    @IBOutlet weak var ELabel: UILabel!
    
    @IBOutlet var Buttons: [UIButton]!
   
    @IBOutlet weak var buttonOne: UIButton!
    
    @IBOutlet weak var buttonTwo: UIButton!
    
    @IBOutlet weak var buttonThree: UIButton!
    
    @IBOutlet weak var buttonFour: UIButton!
    
    @IBOutlet weak var IncorrectButton: UIButton!
    
    @IBOutlet weak var NextButton: UIButton!
    
    @IBOutlet weak var SupportButton: UIButton!
   
    @IBOutlet weak var QuitButton: UIButton!
   
    @IBOutlet weak var statsButton: UIButton!
    
    @IBOutlet weak var YesQuitButton: UIButton!
    
    @IBOutlet weak var NoDontQuitButton: UIButton!
    
    
    let lgray = UIColor(hue: 0.00, saturation: 0.00, brightness: 0.82, alpha: 1.0)
    
    var exp = String("")
    var aChoice = "A)  "
    var bChoice = "B)  "
    var cChoice = "C)  "
    var dChoice = "D)  "
    
    
    
    var Questions = [Question]()
    var QNumber = Int()
    var AnswerNumber = Int()
    
    var answeredRight = 0
    var answeredWrong = 0
    
    var seconds = 0
    var timerSeconds = NSTimer()
    var timerSeco = NSTimer()
    var seco = 0
    var secondsString = String("0")
    var secoString = String("0")
    func updateSecondsTimer(){
        
        seconds++
        secondsString = ( "\(seconds)")
    }
    func updateSecoTimer(){
        seco++
        if seco == 60 {
            seco = 0
        }
        secoString = ( "\(seco)")
    }
    func secondsPerQuestion() ->String{
        
        let AnWr = Double(answeredWrong)
        let AnRi = Double(answeredRight)
        let secondsDouble = Double(seconds)
        let secondsPerQuestionDouble = secondsDouble / (AnWr + AnRi)
        
        let y = Double(round(10*secondsPerQuestionDouble)/10)
        
        let secondsPerQuestionString = String(y)
        return secondsPerQuestionString
    }
    
    var minutes = 0
    var timerMinutes = NSTimer()
    var minutesString = String("0")
    func updateMinutesTimer(){
        
        minutes++
        minutesString = ( "\(minutes)")
    }
    
    override func viewDidLoad() {
        
        NextButton.layer.masksToBounds = true
        NextButton.layer.cornerRadius = 10
        IncorrectButton.layer.masksToBounds = true
        IncorrectButton.layer.cornerRadius = 10
        SupportButton.layer.masksToBounds = true
        SupportButton.layer.cornerRadius = 10
        QuitButton.layer.masksToBounds = true
        QuitButton.layer.cornerRadius = 10
        YesQuitButton.layer.masksToBounds = true
        YesQuitButton.layer.cornerRadius = 10
        NoDontQuitButton.layer.masksToBounds = true
        NoDontQuitButton.layer.cornerRadius = 10
        statsButton.layer.masksToBounds = true
        statsButton.layer.cornerRadius = 10
        buttonOne.layer.masksToBounds = true
        buttonOne.layer.cornerRadius = 10
        buttonTwo.layer.masksToBounds = true
        buttonTwo.layer.cornerRadius = 10
        buttonThree.layer.masksToBounds = true
        buttonThree.layer.cornerRadius = 10
        buttonFour.layer.masksToBounds = true
        buttonFour.layer.cornerRadius = 10
        IncorrectButton.hidden = true
        NextButton.hidden = true
        YesQuitButton.hidden = true
        NoDontQuitButton.hidden = true
        resourceLABEL.hidden = true
        
        buttonOne.backgroundColor = lgray
        buttonTwo.backgroundColor = lgray
        buttonThree.backgroundColor = lgray
        buttonFour.backgroundColor = lgray
        
        Questions = [
            
            Question(Question: "Which of the following should be used in computing the basis of a partner’s interest acquired from another partner?\n\n1. Cash paid by transferee to transferor\n2. Transferee's share of partnership liabilities", Answers: ["Only 2","Only 1","Neither 1 nor 2","Both 1 and 2"], Answer: 3, Explanation: "We need explanation for this one"),
            Question(Question: "Which of the following items is tangible personal property?", Answers: ["Stock Certificate","Note payable","Promissory Note","Hardware"], Answer: 3, Explanation: "Tangible property can be touched, and seen. The remaining answers are all intangible property. Their value is not seen."),
            Question(Question: "John is the grantor of a trust over which he has retained discretionary power to receive income. Anastasia, John's mother, receives all taxable income from the trust unless John exercises the discretionary power. To whom is the income (earned by the trust) is taxable?", Answers: ["To the trust to the extent it remains in the trust","To John because he has retained discretionary power","To Anastasia as the beneficiary of the trust","To both in proportion to the distributions paid to them from the trust"], Answer: 1, Explanation: "If a grantor retains discretionary power, then, the income from the trust is taxed to the grantor, whether or not the grantor receives the income."),
            Question(Question: "Trees associated with land are considered what type of property?", Answers: ["Real property","Tangible property","Personal property","Section 1231 property"], Answer: 0, Explanation: "Trees are considered real property as they are permanently attached to the land and are closely associated with the use of the land."),

        ]
        
        
        PickQuestion()
        
        
        timerSeconds = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: ("updateSecondsTimer"), userInfo: nil, repeats: true)
        timerMinutes = NSTimer.scheduledTimerWithTimeInterval(60, target: self, selector: ("updateMinutesTimer"), userInfo: nil, repeats: true)
        timerSeco = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: ("updateSecoTimer"), userInfo: nil, repeats: true)
    }
    override func didReceiveMemoryWarning() {
        
    }
    
    func PickQuestion() {
        if Questions.count > 0 {
            QNumber = Int(arc4random_uniform(UInt32(Questions.count)))
            QLabel.text = Questions[QNumber].Question
            ELabel.text = Questions[QNumber].Explanation
            
            AnswerNumber = Questions[QNumber].Answer
            
            for i in 0..<Buttons.count {
                if i == 0 {
                    Buttons[i].setTitle(aChoice + Questions[QNumber].Answers[i], forState: UIControlState.Normal)
                } else if i == 1 {
                    Buttons[i].setTitle(bChoice + Questions[QNumber].Answers[i], forState: UIControlState.Normal)
                } else if i == 2 {
                    Buttons[i].setTitle(cChoice + Questions[QNumber].Answers[i], forState: UIControlState.Normal)
                } else if i == 3 {
                    Buttons[i].setTitle(dChoice + Questions[QNumber].Answers[i], forState: UIControlState.Normal)
                }
            }
            
            Questions.removeAtIndex(QNumber)
        } else {
            QuitButton.hidden = true
            statsButton.hidden = true
            SupportButton.hidden = true
            NextButton.hidden = true
            IncorrectButton.hidden = true
            buttonOne.hidden = true
            buttonTwo.hidden = true
            buttonThree.hidden = true
            buttonFour.hidden = true
            
            buttonOne.alpha = 0.41
            buttonTwo.alpha = 0.41
            buttonThree.alpha = 0.41
            buttonFour.alpha = 0.41
            
            resourceLABEL.hidden = false
            YesQuitButton.hidden = false
            YesQuitButton.setTitle("Quit", forState: UIControlState.Normal)
            NextButton.hidden = true
            
            
            let totalQuestions = answeredWrong + answeredRight
            let AW = Double(answeredWrong)
            let AR = Double(answeredRight)
            let percentage : Double = (AR / (AR + AW)) * 100.00
            let z = Double(round(10*percentage)/10)
            let RightAnswer = String(answeredRight)
            
            let percentString = String(z)
            
            let QuestionsTotal = String(totalQuestions)
            
            resourceLABEL.text = ("You've just finished Regulation (REG) practice test.\n\n\nYou answered correctly " + RightAnswer + " out of " + QuestionsTotal + " questions, which is " + percentString + " %.\n\n\nYou spent " + minutesString + " minutes and " + secoString + " seconds, averaging " + secondsPerQuestion() + " seconds per question.")
            
        }
        exp = ELabel.text!
        ELabel.text = "Please select an answer choice"
    }
    
    
   
    @IBAction func ButtonOneTapped(sender: AnyObject) {
        
        buttonOne.enabled = false
        buttonTwo.enabled = false
        buttonThree.enabled = false
        buttonFour.enabled = false
        
        if AnswerNumber == 0 {
            buttonOne.backgroundColor = UIColor.cyanColor()
            NextButton.hidden = false
            IncorrectButton.hidden = true
            ELabel.text = exp
            answeredRight += 1
        } else if AnswerNumber == 1 {
            buttonTwo.backgroundColor = UIColor.cyanColor()
            NextButton.hidden = true
            IncorrectButton.hidden = false
            ELabel.text = exp
            answeredWrong += 1
        } else if AnswerNumber == 2 {
            buttonThree.backgroundColor = UIColor.cyanColor()
            NextButton.hidden = true
            IncorrectButton.hidden = false
            ELabel.text = exp
            answeredWrong += 1
        } else if AnswerNumber == 3 {
            buttonFour.backgroundColor = UIColor.cyanColor()
            NextButton.hidden = true
            IncorrectButton.hidden = false
            ELabel.text = exp
            answeredWrong += 1
        }
        
        buttonOne.alpha = 0.41
        buttonTwo.alpha = 0.41
        buttonThree.alpha = 0.41
        buttonFour.alpha = 0.41
    }
    
    
    
    @IBAction func ButtonTwoTapped(sender: AnyObject) {
        
        buttonOne.enabled = false
        buttonTwo.enabled = false
        buttonThree.enabled = false
        buttonFour.enabled = false
        buttonOne.alpha = 0.41
        buttonTwo.alpha = 0.41
        buttonThree.alpha = 0.41
        buttonFour.alpha = 0.41
        
        if AnswerNumber == 1 {
            buttonTwo.backgroundColor = UIColor.cyanColor()
            NextButton.hidden = false
            IncorrectButton.hidden = true
            ELabel.text = exp
            answeredRight += 1
        } else if AnswerNumber == 0 {
            buttonOne.backgroundColor = UIColor.cyanColor()
            NextButton.hidden = true
            IncorrectButton.hidden = false
            ELabel.text = exp
            answeredWrong += 1
        } else if AnswerNumber == 2 {
            buttonThree.backgroundColor = UIColor.cyanColor()
            NextButton.hidden = true
            IncorrectButton.hidden = false
            ELabel.text = exp
            answeredWrong += 1
        } else if AnswerNumber == 3 {
            buttonFour.backgroundColor = UIColor.cyanColor()
            NextButton.hidden = true
            IncorrectButton.hidden = false
            ELabel.text = exp
            answeredWrong += 1
        }
    }
    
    
   
    @IBAction func ButtonThreeTapped(sender: AnyObject) {
        
        buttonOne.enabled = false
        buttonTwo.enabled = false
        buttonThree.enabled = false
        buttonFour.enabled = false
        
        buttonOne.alpha = 0.41
        buttonTwo.alpha = 0.41
        buttonThree.alpha = 0.41
        buttonFour.alpha = 0.41
        
        if AnswerNumber == 2 {
            buttonThree.backgroundColor = UIColor.cyanColor()
            NextButton.hidden = false
            IncorrectButton.hidden = true
            ELabel.text = exp
            answeredRight += 1
        } else if AnswerNumber == 1 {
            buttonTwo.backgroundColor = UIColor.cyanColor()
            NextButton.hidden = true
            IncorrectButton.hidden = false
            ELabel.text = exp
            answeredWrong += 1
        } else if AnswerNumber == 0 {
            buttonOne.backgroundColor = UIColor.cyanColor()
            NextButton.hidden = true
            IncorrectButton.hidden = false
            ELabel.text = exp
            answeredWrong += 1
        } else if AnswerNumber == 3 {
            buttonFour.backgroundColor = UIColor.cyanColor()
            NextButton.hidden = true
            IncorrectButton.hidden = false
            ELabel.text = exp
            answeredWrong += 1
        }
        
    }
    
    
  
    
    @IBAction func ButtonFourTapped(sender: AnyObject) {
        
        buttonOne.enabled = false
        buttonTwo.enabled = false
        buttonThree.enabled = false
        buttonFour.enabled = false
        
        buttonOne.alpha = 0.41
        buttonTwo.alpha = 0.41
        buttonThree.alpha = 0.41
        buttonFour.alpha = 0.41
        
        if AnswerNumber == 3 {
            buttonFour.backgroundColor = UIColor.cyanColor()
            NextButton.hidden = false
            IncorrectButton.hidden = true
            ELabel.text = exp
            answeredRight += 1
        } else if AnswerNumber == 1 {
            buttonTwo.backgroundColor = UIColor.cyanColor()
            NextButton.hidden = true
            IncorrectButton.hidden = false
            ELabel.text = exp
            answeredWrong += 1
        } else if AnswerNumber == 2 {
            buttonThree.backgroundColor = UIColor.cyanColor()
            NextButton.hidden = true
            IncorrectButton.hidden = false
            ELabel.text = exp
            answeredWrong += 1
        } else if AnswerNumber == 0 {
            buttonOne.backgroundColor = UIColor.cyanColor()
            NextButton.hidden = true
            IncorrectButton.hidden = false
            ELabel.text = exp
            answeredWrong += 1
        }
        
    }
    
    
    
   
    @IBAction func NextButtonTapped(sender: AnyObject) {
        
        PickQuestion()
        NextButton.hidden = true
        IncorrectButton.hidden = true
        ELabel.text = "Please select an answer choice"
        
        buttonOne.enabled = true
        buttonTwo.enabled = true
        buttonThree.enabled = true
        buttonFour.enabled = true
        
        buttonOne.backgroundColor = lgray
        buttonTwo.backgroundColor = lgray
        buttonThree.backgroundColor = lgray
        buttonFour.backgroundColor = lgray
        buttonOne.alpha = 1
        buttonTwo.alpha = 1
        buttonThree.alpha = 1
        buttonFour.alpha = 1
        
    }
    
    
    
   
    @IBAction func IncorrectButtonTapped(sender: AnyObject) {
        
        PickQuestion()
        NextButton.hidden = true
        IncorrectButton.hidden = true
        ELabel.text = "Please select an answer choice"
        
        buttonOne.enabled = true
        buttonTwo.enabled = true
        buttonThree.enabled = true
        buttonFour.enabled = true
        
        buttonOne.backgroundColor = lgray
        buttonTwo.backgroundColor = lgray
        buttonThree.backgroundColor = lgray
        buttonFour.backgroundColor = lgray
        buttonOne.alpha = 1
        buttonTwo.alpha = 1
        buttonThree.alpha = 1
        buttonFour.alpha = 1
        
    }
    
    
    
    
   
    @IBAction func QuitButtonTapped(sender: AnyObject) {
        
        resourceLABEL.text = "Are you sure you want to quit?"
        
        YesQuitButton.hidden = false
        NoDontQuitButton.hidden = false
        resourceLABEL.hidden = false
        
        QLabel.hidden = true
        buttonOne.hidden = true
        buttonTwo.hidden = true
        buttonThree.hidden = true
        buttonFour.hidden = true
        QuitButton.hidden = true
        SupportButton.hidden = true
        statsButton.hidden = true
        
        SupportButton.enabled = false
        QuitButton.enabled = false
        NextButton.enabled = false
        IncorrectButton.enabled = false
        statsButton.enabled = false
        
    }
    
    
   
    @IBAction func NoDontQuitButtonTapped(sender: AnyObject) {
        
        YesQuitButton.hidden = true
        NoDontQuitButton.hidden = true
        resourceLABEL.hidden = true
        
        QLabel.hidden = false
        buttonOne.hidden = false
        buttonTwo.hidden = false
        buttonThree.hidden = false
        buttonFour.hidden = false
        QuitButton.hidden = false
        SupportButton.hidden = false
        statsButton.hidden = false
        
        SupportButton.enabled = true
        QuitButton.enabled = true
        NextButton.enabled = true
        IncorrectButton.enabled = true
        statsButton.enabled = true
    }
   
    @IBAction func statsButtonTapped(sender: AnyObject) {
        
        let tot = answeredRight + answeredWrong
        
        let answeredRightString = String(answeredRight)
        
        let totString = String(tot)
        
        let AW = Double(answeredWrong)
        let AR = Double(answeredRight)
        let percentage : Double = (AR / (AR + AW)) * 100.00
        let x = Double(round(10*percentage)/10)
        let percentString = String(x)
        
        let statsAlertController = UIAlertController(title: "Stats", message:"So far you've answerd " + answeredRightString + " out of " + totString + " questions, which is " + percentString + "%\n\n\n\n You've spent " + minutesString + " minutes and " + secoString + " seconds, averaging " + secondsPerQuestion() + " seconds per question.", preferredStyle: UIAlertControllerStyle.Alert)
        self.presentViewController(statsAlertController, animated: true, completion: nil)
        
        statsAlertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default,handler: nil))
        
    }
    
    
    
    @IBAction func SupportButtonTapped(sender: AnyObject) {
        
        func rateUs() {
            if let url = NSURL(string: "http://www.apple.com/itunes/") {
                UIApplication.sharedApplication().openURL(url)
            }
        }
        
        
        let supportAlertController = UIAlertController(title: "Support", message:
            "Are you enjoying our app? Please rate us in the app store!\n\n Else, if you know of ways we can make our app better, please send us feedback so we could improve the experience for you!\n\nThanx!\nThe App team", preferredStyle: UIAlertControllerStyle.Alert)
        self.presentViewController(supportAlertController, animated: true, completion: nil)
        
        
        supportAlertController.addAction(UIAlertAction(title: "Rate Us", style: .Default, handler: { (alertAction) -> Void in
            rateUs()
        }))
        
        supportAlertController.addAction(UIAlertAction(title: "Send Feedback", style: .Default, handler: { (alertAction) -> Void in
            self.sendEmail()
        }))
        
        supportAlertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default,handler: nil))
    }
    
    func sendEmail() {
        
        if (MFMailComposeViewController.canSendMail()) {
            
            let emailTitle = "CPA Prep Feedback"
            let messageBody = "Hello,\n\n I'd like to provide the following feedback about the CPA Prep application:"
            let toRecipients = ["volo_lipu@yahoo.com"]
            
            let mc:MFMailComposeViewController = MFMailComposeViewController()
            
            mc.mailComposeDelegate = self
            
            mc.setSubject(emailTitle)
            mc.setMessageBody(messageBody, isHTML: false)
            mc.setToRecipients(toRecipients)
            
            self.presentViewController(mc, animated: true, completion: nil)
            
        } else {
            print("No email found")
            
            // create an alert message that will advise that the email cannot be sent
            let alertEmailController = UIAlertController(title: "Can't Send Email", message:
                "Cannot send the message. Please make sure that your email account is set up on this device and verify that you are connected to the internet", preferredStyle: UIAlertControllerStyle.Alert)
            self.presentViewController(alertEmailController, animated: true, completion: nil)
            
            alertEmailController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default,handler: nil))
            
        }
    }
    
    
    func mailComposeController(controller: MFMailComposeViewController, didFinishWithResult result: MFMailComposeResult, error: NSError?) {
        
        switch result.rawValue {
        case MFMailComposeResultCancelled.rawValue: print("Mail Cancelled")
        case MFMailComposeResultFailed.rawValue: print("Mail Failed")
        case MFMailComposeResultSaved.rawValue: print("Mail Saved")
        case MFMailComposeResultSent.rawValue: print("Mail Sent")
        default:
            break
            
        }
        
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }
}