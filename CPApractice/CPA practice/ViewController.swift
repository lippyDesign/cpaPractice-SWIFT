//
//  ViewController.swift
//  CPA practice
//
//  Created by Volodymyr Lipunov on 11/26/15.
//  Copyright © 2015 Lippy Design. All rights reserved.
//

import UIKit
import MessageUI

class ViewController: UIViewController, MFMailComposeViewControllerDelegate {
    
    @IBOutlet weak var audButton: UIButton!
    
    @IBOutlet weak var becButton: UIButton!

    @IBOutlet weak var farButton: UIButton!
    
    @IBOutlet weak var regButton: UIButton!
    
    @IBOutlet weak var aboutCpaButton: UIButton!
    
    override func viewDidLoad() {
        
        audButton.layer.masksToBounds = true
        audButton.layer.cornerRadius = 10
        becButton.layer.masksToBounds = true
        becButton.layer.cornerRadius = 10
        farButton.layer.masksToBounds = true
        farButton.layer.cornerRadius = 10
        regButton.layer.masksToBounds = true
        regButton.layer.cornerRadius = 10
        aboutCpaButton.layer.masksToBounds = true
        aboutCpaButton.layer.cornerRadius = 10
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func supportButtonTapped(sender: AnyObject) {
        
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

