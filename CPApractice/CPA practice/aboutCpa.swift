//
//  aboutCpa.swift
//  CPA practice
//
//  Created by Volodymyr Lipunov on 11/27/15.
//  Copyright © 2015 Lippy Design. All rights reserved.
//

import Foundation
import UIKit
import MessageUI

class aboutCpa : UIViewController, MFMailComposeViewControllerDelegate {
    
    @IBOutlet weak var aboutAudButton: UIButton!
    
    @IBOutlet weak var aboutBecButton: UIButton!
    
    @IBOutlet weak var aboutFarButton: UIButton!
    
    @IBOutlet weak var aboutRegButton: UIButton!
    
    @IBOutlet weak var nearbyButton: UIButton!
    
    @IBOutlet weak var backButton: UIButton!
    
    @IBOutlet weak var aboutCpaView: UITextView!
    
    @IBOutlet weak var descriptionView: UITextView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        
        backButton.hidden = true
        descriptionView.hidden = true
        
        aboutAudButton.layer.masksToBounds = true
        aboutAudButton.layer.cornerRadius = 10
        aboutBecButton.layer.masksToBounds = true
        aboutBecButton.layer.cornerRadius = 10
        aboutFarButton.layer.masksToBounds = true
        aboutFarButton.layer.cornerRadius = 10
        aboutRegButton.layer.masksToBounds = true
        aboutRegButton.layer.cornerRadius = 10
        nearbyButton.layer.masksToBounds = true
        nearbyButton.layer.cornerRadius = 10
        backButton.layer.masksToBounds = true
        backButton.layer.cornerRadius = 10

        aboutCpaView.text = "The Certified Public Accountant (CPA) Examination is the examination that a candidate passes in order to qualify for a Certified Public Accountant (CPA) License in any of the 55 U.S. jurisdictions.\n\nCPAs are the only licensed accounting professionals. CPA licenses are issued by state boards of accountancy"
        aboutCpaView.editable = false
        aboutCpaView.selectable = false
        descriptionView.selectable = false
        descriptionView.editable = false
    }
    
    @IBAction func aboutAudTapped(sender: AnyObject) {
        descriptionView.editable = true
        descriptionView.selectable = true
        descriptionView.hidden = false
        backButton.hidden = false
        aboutCpaView.hidden = true
        aboutAudButton.hidden = true
        aboutBecButton.hidden = true
        aboutFarButton.hidden = true
        aboutRegButton.hidden = true
        nearbyButton.hidden = true
        titleLabel.text = "AUD"
        descriptionView.text = "1. Planning the engagement\n\n2. Internal controls\n\n3. Obtain and document information\n\n4. Review engagement and evaluate information\n\n5. Prepare communications\n\n\n\nFormat: 3 multiple choice testlets, combined for 90 questions (60%), 7 short task-based simulations (40%)\n\nTime allotted: 4 hours"
        descriptionView.selectable = false
        descriptionView.editable = false
    }
    
    @IBAction func aboutBecTapped(sender: AnyObject) {
        descriptionView.editable = true
        descriptionView.selectable = true
        descriptionView.hidden = false
        backButton.hidden = false
        aboutCpaView.hidden = true
        aboutAudButton.hidden = true
        aboutBecButton.hidden = true
        aboutFarButton.hidden = true
        aboutRegButton.hidden = true
        nearbyButton.hidden = true
        titleLabel.text = "BEC"
        descriptionView.text = "1. Business structure\n\n2. Economic concepts\n\n 3. Financial management\n\n4. Information technology\n\n5. Planning and measurement\n\n\n\nFormat: 3 multiple choice testlets, combined for 72 questions (85%), 3 written simulations (15%)\n\nTime allotted: 3 hours"
        descriptionView.selectable = false
        descriptionView.editable = false
    }
    
    @IBAction func aboutFarTapped(sender: AnyObject) {
        descriptionView.editable = true
        descriptionView.selectable = true
        descriptionView.hidden = false
        backButton.hidden = false
        aboutCpaView.hidden = true
        aboutAudButton.hidden = true
        aboutBecButton.hidden = true
        aboutFarButton.hidden = true
        aboutRegButton.hidden = true
        nearbyButton.hidden = true
        titleLabel.text = "FAR"
        descriptionView.text = "1. Concepts and standards for financial statements\n\n2. Typical items in financial statements\n\n3. Specific types of transactions and events\n\n4. Accounting and reporting for governmental entities\n\n5. Accounting and reporting for nongovernmental and not-for-profit organizations\n\n\n\nFormat: 3 multiple choice testlets, combined for 90 questions (60%), 7 short task-based simulations (40%)\n\nTime allotted: 4 hours"
        descriptionView.selectable = false
        descriptionView.editable = false
    }
    
    @IBAction func aboutRegTapped(sender: AnyObject) {
        descriptionView.editable = true
        descriptionView.selectable = true
        
        descriptionView.hidden = false
        backButton.hidden = false
        aboutCpaView.hidden = true
        aboutAudButton.hidden = true
        aboutBecButton.hidden = true
        aboutFarButton.hidden = true
        aboutRegButton.hidden = true
        nearbyButton.hidden = true
        titleLabel.text = "REG"
        descriptionView.text = "1. Ethics and professional responsibility\n\n2. Business law\n\n3. Federal tax procedures and accounting issues\n\n4. Federal taxation of property transactions\n\n5. Federal taxation--individuals\n\n6. Federal taxation--entities\n\n\n\nFormat: 3 multiple choice testlets, combined for 72 questions (60%), 6 short task-based simulations (40%)\n\nTime allotted: 3 hours"
        descriptionView.selectable = false
        descriptionView.editable = false
    }
    
    @IBAction func backButtonTapped(sender: AnyObject) {
        
        descriptionView.hidden = true
        backButton.hidden = true
        aboutCpaView.hidden = false
        aboutAudButton.hidden = false
        aboutBecButton.hidden = false
        aboutFarButton.hidden = false
        aboutRegButton.hidden = false
        nearbyButton.hidden = false
        titleLabel.text = "About CPA"
        aboutCpaView.text = "The Certified Public Accountant (CPA) Examination is the examination that a candidate passes in order to qualify for a Certified Public Accountant (CPA) License in any of the 55 U.S. jurisdictions.\n\nCPAs are the only licensed accounting professionals. CPA licenses are issued by state boards of accountancy"
        descriptionView.selectable = false
        descriptionView.editable = false
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
