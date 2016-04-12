//
//  regStudy.swift
//  CPA practice
//
//  Created by Volodymyr Lipunov on 11/27/15.
//  Copyright © 2015 Lippy Design. All rights reserved.
//

import Foundation
import UIKit
import MessageUI

struct Question {
    var Question : String!
    var Answers : [String]!
    var Answer : Int!
    var Explanation: String!
}

class regStudy : UIViewController, MFMailComposeViewControllerDelegate {
    
    
    @IBOutlet weak var resourceLabel: UILabel!
    
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
        resourceLabel.hidden = true
        
        buttonOne.backgroundColor = lgray
        buttonTwo.backgroundColor = lgray
        buttonThree.backgroundColor = lgray
        buttonFour.backgroundColor = lgray

        Questions = [
            
            Question(Question: "Which of the following should be used in computing the basis of a partner’s interest acquired from another partner?\n\n1. Cash paid by transferee to transferor\n2. Transferee's share of partnership liabilities", Answers: ["Only 2","Only 1","Neither 1 nor 2","Both 1 and 2"], Answer: 3, Explanation: "We need explanation for this one"),
            Question(Question: "Which of the following items is tangible personal property?", Answers: ["Stock Certificate","Note payable","Promissory Note","Hardware"], Answer: 3, Explanation: "Tangible property can be touched, and seen. The remaining answers are all intangible property. Their value is not seen."),
            Question(Question: "John is the grantor of a trust over which he has retained discretionary power to receive income. Anastasia, John's mother, receives all taxable income from the trust unless John exercises the discretionary power. To whom is the income (earned by the trust) is taxable?", Answers: ["To the trust to the extent it remains in the trust","To John because he has retained discretionary power","To Anastasia as the beneficiary of the trust","To both in proportion to the distributions paid to them from the trust"], Answer: 1, Explanation: "If a grantor retains discretionary power, then, the income from the trust is taxed to the grantor, whether or not the grantor receives the income."),
            Question(Question: "Trees associated with land are considered what type of property?", Answers: ["Real property","Tangible property","Personal property","Section 1231 property"], Answer: 0, Explanation: "Trees are considered real property as they are permanently attached to the land and are closely associated with the use of the land."),
            Question(Question: "What’s the waiting period between the registration and the filing date?", Answers: ["30 days","45 days","60 days","20 days"], Answer: 3, Explanation: "The waiting period is 20 days. During that time a company cannot sell the stock. Oral offers are allowed however. After 20 days, the securities can be sold on an open market."),
            Question(Question: "Which form does a company file if the CFO resigns?", Answers: ["10-K","10-Q","8-K","6-K"], Answer: 2, Explanation: "8-K must be filled 4 days after any major corporate event. These changes are typically: merger information, changes in corporate control, and sale of major business lines."),
            Question(Question: "Corp Nexus is being audited by United LLP in connection with attaining a loan form Oakland Bank. If United LLP commits negligence and Nexus defaults on the loan, which party can sue United LLP?", Answers: ["Oakland Bank’s customers","Oakland Bank","Both A and B","Neither A or B"], Answer: 1, Explanation: "Since the bank's customers aren’t using United LLP’s audit report, they cannot sue. However, the Bank is relying on United’s audit report, therefore the bank can sue for negligence."),
            Question(Question: "In order to continue working at a law firm, Andy had to take several classes in regards to patent law. Where can Andy take the deduction for the classes?", Answers: ["As an adjustment to income, deductible from gross income","As an itemized deduction","As a credit","As either A or B"], Answer: 1, Explanation: "The classes can be deducted as a 2% miscellaneous deduction before AGI, because they are required to keep Andy's job. Since Andy took only a few classes, he is not considered to be in pursuit of a four-year degree, therefore the classes cannot be deducted elsewhere. If the employer reimburses Andy for these expenses, they are not deductible."),
            Question(Question: "A corporation decides to change from a calendar year to a fiscal year. What document would govern this particular action?", Answers: ["Proxy statement","A corporate agreement","Bylaws","Form 1120"], Answer: 2, Explanation: "The bylaws spell out the tax filing year, the record of where the corporate books are held, description of the rights and power of all the directors and offices, and their compensation.  A proxy statement is a statement that’s filed in advance for shareholder votes. Form 1120 is federal corporate form."),
            Question(Question: "A client has left ABC Accountants and started as a new client in the firm XYZ Accountants. XYZ asked for the wokrpapers associated with the basis calculation of partnership interest. Does ABC have an obligation to provide those workpapers to XYZ?", Answers: ["Yes, they belong to the client","Yes, when information is requested with prior year's returns, an accounting firm must provide information","No, because ABC owns the workpapers","No, because the client owns the workpapers and must decide"], Answer: 2, Explanation: "Workpapers belong to the accountant that prepares them, they do not belong to the client. They can be shown to a prospective purchaser of the CPA firm, under a subpoena, or to defend a lawsuit against the client."),
            Question(Question: "A business owner, Joel, wants to create his own business. He does not want to be personally liable for the business. How should he incorporate?", Answers: ["LLC","Joint Venture","Sole proprietorship","Either A or B"], Answer: 0, Explanation: "Joel should register his business as Limited Liability Company. It will limit his liability to the assets of the company."),
            Question(Question: "When a partner dies, who is entitled to his/her share of income from the partnership?", Answers: ["Partners heir's","The remaining partners in the partnerships","Surviving spouse of the partner","A and C"], Answer: 2, Explanation: "When a partner dies, the surviving spouse inherits the rights to his/her partnership profits."),
            Question(Question: "Where are foreign taxes deductible on an individual tax return (form 1040)?", Answers: ["On schedule A, as foreign income tax","As a credit on page 2 on form 1040","Can be either  A or B","Neither one"], Answer: 2, Explanation: "Foreign taxes can be either a deduction or taken as a credit. Credit produces a better outcome for the taxpayer but the taxpayer has an option of using either one."),
            Question(Question: "Which allowable deduction can be claimed in arriving at an individual's adjusted gross income?", Answers: ["Investment interest expense","Foreign taxes paid","Alimony payment","Unreimbursed business expense for a government employee"], Answer: 2, Explanation: "Alimony and separate maintenance payments are income to the recipient and deductible from gross income by the payor (to arrive at AGI). The remaining deductions in the question are itemized deductions taken on schedule A."),
            Question(Question: "Arya Corporation owns 25% of Valco Corporation. Arya recieved $100,000 of dividends on the Valco stock. What is Arya's dividends Recieved deduction?", Answers: ["$80,000","$70,000","$100,000","$75,000"], Answer: 0, Explanation: "Arya owns 20 to 80% of Valco, therefore the deduction is 80%. If Arya held less than 20%, the deduction would be 70%, or if Arya held between 80 and 100%, the deduction would be 100%"),
            Question(Question: "Can a minor act as an agent?", Answers: ["No, minor is under age and therefore cannot be an agent","Yes, since the agent need not have a capacity","Yes, but only if the power of attorney is signed by someone who is 18 years old or older","No, since a minor doesn’t have a capacity"], Answer: 1, Explanation: "Only the principal must be competent, therefore minors can be agents."),
            Question(Question: "Arya, an accrual-basis calendar-year C corp, has $5,000 of unexpired charitable contributions carryover from Year 1. Arya’s Year 2 income was $500,000. Arya made a donation of $55,000 in Year 2. What is the maximum allowable deduction that Arya may take as a charitable contribution of its Year 2?", Answers: ["$5,000","$50,000","$55,000","$8000"], Answer: 1, Explanation: "The maximum allowable deduction that Arya Corp. may take as a charitable contribution is 10% of $500,000 because corporations are only allowed to take up to 10% of their taxable income. $10,000 will be carried over to Year 3"),
            Question(Question: "In which type of bankruptcy a trustee is not required?", Answers: ["Chapter 7","Chapter 11","Chapter 13","Chapter 15"], Answer: 1, Explanation: "A trustee is not required in Chapter 11 bankruptcy."),
            Question(Question: "What did securities act of 1933 establish?", Answers: ["Established that investors have sufficient information on which to make an informed decision","Guaranteed the accuracy of information filed with SEC","Established New York stock exchange","Established OPEC"], Answer: 0, Explanation: "The securities act of 1933 established that investors have sufficient information on which to make an informed investment decision. It does not guarantee the accuracy of the information, just that the information is available."),
            Question(Question: "What is the first part of the registration statement called?", Answers: ["Disclosure","Management Analysis & Discussion","The Prospectus","Shelf Registration"], Answer: 2, Explanation: "The first part of the registration is called The Prospectus. It summarizes important information that’s described in greater detail in Part II."),
            Question(Question: "The registration statement must contain a description of information regarding certain shareholders. What are the requirements for disclosure?", Answers: ["Name of the CFO and CEO","Shareholders owning 50% or more","Shareholders owning 10% or more", "Inside traders"], Answer: 2, Explanation: "The registration statement must contain names and addresses of any shareholders holding 10% or more of the company’s shares."),
            Question(Question: "Under which offering under regulation D may a corporation be allowed to advertise?", Answers: ["B and C","Rule 505","Rule 506", "Neither B or C"], Answer: 3, Explanation: "The corporation may not advertise under rule 505 or rule 506. Rule 504 does allow companies to solicit or advertise their securities to the public and to sell securities under some exceptions."),
            Question(Question: "What can a foreign corporation do in a state where it is not registered?", Answers: ["Conduct business dealings","Participate in a lawsuit","Sell its services", "Neither of the answers above"], Answer: 1, Explanation: "A foreign corporation can participate in a lawsuit, as it does not constitute transacting in actual business activity in most states. They can do business when they register with the state and receive a certificate of authority."),
            Question(Question: "What is meant by the term 'corporate bylaws'?", Answers: ["A code of conduct for corporate officers","Tax laws written for corporations","It contains the number of shares authorized to be issued", "Bylaws are rules for running a corporation"], Answer: 3, Explanation: "Corporate bylaws are internal rules that govern daily operations of a corporation.  They include: the names of the officers, names of board of directors, committees, as well as how meetings are conducted and the separate duties of each officer.  Corporate bylaws are filed after the articles of incorporation; The articles of incorporation contain information regarding the number of shares authorized."),
            Question(Question: "John is a sole owner of a corporation, Stepa. He often forgets to pay his bills on time and decided to use Stepa’s bank account to pay his bills. Three years later the company is sued. John argues that his assets are protected, however the courts may not see it the same way based on what concept?", Answers: ["Negligence","Commitment of a fraud","Piercing of corporate veil", "Statue of frauds"], Answer: 2, Explanation: "John has commingled corporate and personal assets and therefore a “corporate veil” that shields shareholders of a corporation has been pierced and he can be personally liable in a law suit."),
            Question(Question: "Can a foreign corporation transact businesses in another state?", Answers: ["Yes, but it has to register with that state and obtain a Certificate of Authority","No, a foreign corporation cannot do any kind of business unless it incorporates in the US","Yes, it can, as long as it stays a corporation", "Yes, but it must register with the Treasurer"], Answer: 0, Explanation: "A foreign corporation has to register (by filing for a Certificate of Authority) with a state that it’s going to do business in."),
            Question(Question: "An agency contract must be in writing under what circumstance?", Answers: ["When purchasing land","When buying a tangible asset","When signing a contract for 6 months or longer", "Never, an agency contract is always verbal"], Answer: 0, Explanation: "An agency contract must be in writing if real estate is bought or sold, and when an employment agreement is longer than one year."),
            Question(Question: "Alex, Bobby, and Charles are in a general partnership. Alex owns 10%, Bobby 20% and Charles 70%. Who has the most rights to manage the partnership?", Answers: ["Alex","Bobby","Charles", "Their rights are equal"], Answer: 3, Explanation: "If there isn’t a specific exception clause in the partnership's agreement, all partners have an equal right to participate, regardless of their ownership percentage."),
            Question(Question: "Bob assigned 25% of interest in a partnership to his daughter Luis. Luis wants to inspect the books and records of the partnership. Will the partnership allow her to do that?", Answers: ["Yes, she has interest in the partnership","No, her interest doesn’t provide her with those rights","No, an assignee cannot ever do that", "Yes, but she must first ask for managing partner’s approval"], Answer: 1, Explanation: "Luis only has the assignment of interest, she is not a partner. In order for her to get these rights, she must ask for consent of ALL partners and become a partner herself."),
            Question(Question: "Luis defaulted on one of her loans. As a result, the creditors took out a charge order against her 25% ownership of the ABC partnership. Does ABC partnership have to dissolve?", Answers: ["Yes, because 25% of ownership left their partnership","Yes, because now the creditors have rights to take ABC’s assets","No, because the creditors have become assignees", "No, but the partners must prove this in court"], Answer: 2, Explanation: "Creditor only has rights to the income and distributions, he or she is not a partner and cannot change the partnerships business."),
            Question(Question: "XYZ partnership is being dissolved. The partnership has acquired debt, a loan from outside creditors, partner loan, and payable owed for its inventory. Who must be paid first?", Answers: ["The payable for inventory","The outside creditors","The partner with a loan to the partnership", "The partners get paid first then the creditors"], Answer: 0, Explanation: "This is a trick question. The inventory and assets are typically sold first and the payables are settled. Then the outside creditors will get paid, then the partners with a loan to the partnership. The partners will get paid last."),
            Question(Question: "What are the advantages of being in an LLP instead of general partnership when a partner is a limited partner?", Answers: ["LLP is less costly","General partnership requires filing of a document with the state","LLP makes the partner liable to the extent of his or her contributions", "In an LLP the partners are liable to the extent of their personal assets"], Answer: 2, Explanation: "Typically, the partners in an LLP are not liable for the debts of the LLP and their personal assets are protected.  Please note that circumstances are different if a partner acted negligently or committed a fraud. Generally, the set up of an LLP is costly and a document must be filed with the state, which takes more time."),
            Question(Question: "What is the main difference between an LLC and  an LLP?", Answers: ["An LLC is a separate entity from its members","Unlike an LLC, an LLP provides limited liability","LLP can have corporations as owners", "LLC is a non-profit organization, while LLP is for profit"], Answer: 0, Explanation: "An LLC is a company and is therefore a separate entity, distinct from its members. It can be sued and can own assets under its name. An LLP cannot have corporations as owners. Both, LLP and LLC, provide limited liability to its owners."),
            Question(Question: "What document does LLC file with the state to incorporate?", Answers: ["Registration statement","Articles of organization","Prospectus", "Company agreement"], Answer: 1, Explanation: "An LLC files articles of organization, where it writes out all of the important information regarding its business and member information."),
            Question(Question: "Sally, Gabe and Alex are all members in an LLC. Sally owns 25%, Gabe owns 15% and Alex owns 60%. It is a manager-managed LLC, and Gabe is the manager of the LLC. Who has the most votes in the LLC?", Answers: ["The members have equal amount of votes","Alex has the most votes","Sally has the most votes", "Gabe has the most votes, because he is the manger of the LLC"], Answer: 1, Explanation: "Alex has the most votes. In LLC, voting is proportional to ownership, regardless of who manages the LLC."),
            Question(Question: "What is the expensing threshold for expensing a single item under Notice 2015-82 in 2016 tax year?", Answers: ["$500","$2,500","$600", "$1,000"], Answer: 1, Explanation: "The new rules (2016) raised the threshold to $2,500 from $500 to reduce the administrative burden placed on small businesses."),
            Question(Question: "What is the main difference between S corporation and C corporation?", Answers: ["S corporation can have up to 150 shareholders","C corporation passes its profits to the shareholders without paying corporate tax","S corporation allows to have nonresident aliens as shareholders", "C corporation must pay taxes at its own level"], Answer: 3, Explanation: "A C corporation pays its own corporate tax. The shareholders only pay the tax when a C corporation distributes profits in the forms of dividends. S corporation is limited to 100 shareholders and they cannot be foreign nationals in most cases."),
            Question(Question: "John is thinking of incorporating, which entity would protect his liability the most?", Answers: ["Corporation","Sole proprietorship","Limited Partnership", "General Partnership"], Answer: 0, Explanation: "Corporation would give him the best liability protection, as shareholders are not liable for actions of their company unless a corporate veil has been pierced."),
            Question(Question: "Joe was negligent at work and he hurt his right foot. Is he entitled to worker’s compensation?", Answers: ["No, he was negligent and therefore cannot be paid","Yes, negligence does not eliminate coverage","No, unless Joe is a member of a union.", "Yes, but only if his employer has coverage"], Answer: 1, Explanation: "Negligence does not eliminate coverage and the employer is required to pay."),
            Question(Question: "When does an instrument become negotiable?", Answers: ["When it is not signed by the maker","It can never be negotiable, all instrument are non-negotiable","An instrument is always negotiable", "An instrument is payable on demand if it states no time for payment"], Answer: 3, Explanation: "An instrument is payable on demand if it states no time for payment and does not have any limiting conditions."),
            Question(Question: "When does a company file a registration statement?", Answers: ["When it plans to go public", "When it wants to relocate to another state", "When it wants to conduct business with the federal government", "When a company presents a civil lawsuit against another company"], Answer: 0, Explanation: "A company files a registration statement with SEC before public offering."),
            Question(Question: "What term is used to describe a security that was issued by a corporation and then re-purchased back?", Answers: ["Common Stock","Treasury Stock","Outstanding Stock", "Authorized stock"], Answer: 1, Explanation: "Re-purchased shares of stock are called 'treasury stock.' Please note that typically treasury stock does not have voting rights."),
            Question(Question: "What set of voting rules is more advantageous to a stock holder, if he/she has a minority interest in the corporation and the vote is being cast for the Board of Directors?", Answers: ["Proxy vote","Cumulative vote","Preferred stock", "Common vote"], Answer: 1, Explanation: "Typically one vote is granted for each stock. However, a stock may be granted cumulative voting rights for directors, which means that a shareholder gets a vote for each board seat. If there are 5 board members and a shareholder holds 100 shares of stock, he/she casts 500 votes."),
            Question(Question: "Who is exempt from paying the FICA tax?", Answers: ["Police Officers","Part-time employees","Self-employed individuals with profits of less than $400 per year", "No one is exempt "], Answer: 2, Explanation: "While police officers don't typically pay the social security portion of FICA tax, they are liable for medicare. All self employed income with taxable income of $400 are exempt."),
            Question(Question: "Are social security disability benefits taxable?", Answers: ["No, unless taxpayer's annual income is greater than $25,000","Yes, but only up to $25,000","No, they are never taxable", "Yes, taxable regardless of the ammount recieved"], Answer: 0, Explanation: " No, unless the recipients income exceeds $25,000 if filling single, and $32,000 if the filing status is married filing jointly."),
            Question(Question: "When does a company file a registration statement?", Answers: ["When it plans to go public","When it wants to relocate to another state", "When it wants to conduct business with the federal government", "When a company presents a civil lawsuit against another company"], Answer: 0, Explanation: "A company files a registration statement with SEC before public offering."),
            Question(Question: "Which form does a registered corporation file annually?", Answers: ["10-K", "10-Q", "5-K", "10-A"], Answer: 0, Explanation: "10-K is filed annually to provide financial statements to the public and shareholders. 10-Q is filed quarterly for the same reason. Private companies do not file these forms"),
            Question(Question: "In which type of business entity is the entire ownership interest most easily transferable?", Answers: ["LLC", "Corporation", "Partnership", "Trust"], Answer: 1, Explanation: "A corporation is a legally separate entity distinct from its shareholders. A simple sale of the stock transfers the interest. The remaining answers require consent of other partners and aditional documents."),
            Question(Question: "John's Corp. bought equipment in 2014 for $50,000. MACRS 5, 7, and 10 year property depreciation is as follows: 20%, 14.29%, and 10%. What is the amount of depreciation for 2014 tax year?", Answers: ["$10,000","$7,145", "$25,000", "$50,000"], Answer: 3, Explanation: "John can expense the whole $50,000. Under Sec. 179 of the IRC, the taxpayer may elect to expense up to $500,000 of tangible personal property placed in service during the year in 2014. Both new and used properties qualify"),
            Question(Question: "Arya, a C corporation is thinking of converting to an S corporation. How many shareholders must consent to this change to be treated as an S corporation?", Answers: ["50%", "10%", "51%", "100%"], Answer: 3, Explanation: "All shareholders must give consent to be treated as an S corporation. However, remember that to terminate the S corporation status, only a majority share is needed."),
            Question(Question: "Who can be a shareholder in an S corp?", Answers: ["Partnership", "Foreign trust", "Corporation", "501(c)(3) tax exempt corp"], Answer: 3, Explanation: "Shareholders must be U.S. citizens or residents and must be natural persons, so corporations and partnerships are ineligible. However, certain trusts, estates, and tax-exempt corporations, notably 501(c)(3) corporations, are allowed to be shareholders."),
            Question(Question: "What is worker’s compensation and is it taxable?", Answers: ["Federal unemployment program, nontaxable", "Private retirement fund, taxable", "State-ran program, nontaxable", "None of these"], Answer: 2, Explanation: "Workers compensation is typically a state-ran (can be private in some cases) program paid by employers for employees who were injured on the job. Worker’s compensation is non-taxable for federal purposes. "),
            Question(Question: "How much must an individual deposit into a bank for that bank to create Currently Transaction Report under BSA? ", Answers: ["$1,000", "$10,000", "$100,000", "50,000"], Answer: 2, Explanation: "The Bank Secrecy Act (BSA) is an act (aimed to prevent money laundering) that requires all banks to submit a report of all transaction over $10,000 to the U.S. government."),
            Question(Question: "Ann has a foreign bank account in China. During the year her highest balance in her foreign accountwas $9,000 when translated to U.S. dollars. Does she have an FBAR requirement?", Answers: ["Yes, because the balance is higher than $5,000", "Yes, all foreign bank accounts regardless of threshold need to be filed", "No, because the balance is lower than $100,000", "No, because the balance is lower than $10,000"], Answer: 3, Explanation: "Foreign Bank and Financial Accounts (FBAR) must be filed if the aggregate valuea of the foreign accounts exceed $10,000. This doesn’t only apply to financial accounts, but also signature authority foreign accounts."),
            Question(Question: "Alex and Nick formed a partnership A&N, as equal partners by contributing different assets. Alex contributed land with a basis of $40,000 and FMV of $60,000. Nick contributed $40,000 cash. The land that was contributed is subject to $15,000 mortgage that was assumed by A&N. What is Alex's basis in the partnership? ", Answers: ["$11,000", "$12,375", "$22,000", "$10,890"], Answer: 0, Explanation: "$32,500. The basis is computed as follows: adjusted basis of the land (40,000) less the mortgage assumed by the other partner ($15,000 x 50% = $7,500.)"),
            Question(Question: "Sonny, Sal and Lex are in a partnership where the profits are shared equally. Their basis in the partnership are as follows: $10,000, $15,000 and $15,000. The partnership incurred loss of $33,000. What is Sal's allocation of the loss?", Answers: ["$40,000", "$60,000", "$45,000", "$32,500"], Answer: 0, Explanation: "Absent any other provision in the partnership agreement. The losses are allocated in the same manner as profits. Therefore, $33,000 * 0.333333 = 11,000."),
            Question(Question: "Which of the following terms best describes the relationship between a corporation and the accounting firm it hires to audit its financial statements?", Answers: ["Employer and principal", "Employee and employer", "Agent and principal", "Employer and independent contractor"], Answer: 3, Explanation: "The auditing firm must be independent of its client, the auditing firm is not an employee and is an independent contractor."),
            Question(Question: "Under the Sales Article of the UCC, absent specific terms, when will risk of loss pass to the buyer?", Answers: ["When the contract is signed", "When the goods are tendered to the buyer", "When the contract is executed", "When the goods are delivered to the first carrier for transmission to the buyer."], Answer: 3, Explanation: " Under the Sales Article of the UCC, absent any agreement to the contrary, risk of loss passes to the buyer when the goods are delivered to the carrier."),
            Question(Question: "In 2002, as a result of fraud committed by corporations such as Enron and WorldCom, Congress had passed a law that created an oversight board and established more stringent controls of auditing firms. What was the name of that act?", Answers: ["Clayton Act", "PCAOB", "Sarbanes-Oxley Act", "Dodd-Frank Act"], Answer: 2, Explanation: "The act is called Sarbanes-Oxley Act of 2002. It established the PCAOB, registered public accounting firms and established more stringent rules relating to the preparation of audit reports."),
            Question(Question: "Unused general business credits can be:", Answers: ["Carried back one year and carried forward ten years", "Carried back one year and carried forward 20 years", "Carried back two years and carried forward 20 years", "Carried back two years and carried forward ten years"], Answer: 1, Explanation: "Business credits can be carried back one year or carried forward 20 years."),
            Question(Question: "Robert has been assessed by the IRS to pay $10,000. Robert decided to litigate the matter and is now in the U.S. Tax Court. Did he pay the $10,000 before going to court?", Answers: ["Yes, he has to pay the $10,000 and can later claim the money from the IRS", "Yes, because the ammount is greater than $5,000", "No, because the ammount is smaller than $100,000", "No, the Tax Court is the only form in which taxpayers may litigate without having paid the disputed tax."], Answer: 3, Explanation: "No payment is required while the matter is litigated in the U.S. Tax Court. There is no limitation on the dollar amount owed."),
            Question(Question: "What happens if a taxpayer and the IRS cannot reach a solution due to a disagreement regarding a tax matter through an administrative process with the IRS?", Answers: ["The matter is settled with U.S. Federal Court of Appeals", "The matter is settled with U.S. Tax Court", "The taxpayer can sue the IRS", "IRS has the final word, the dispute processes cannot be appealed"], Answer: 1, Explanation: "The first step (that can be initiated by either a taxpayer or the IRS) is to settle it in the U.S. Tax Court. The appellate courts are used if the matter is continued to be litigated, after a ruling in the Tax Court"),
            Question(Question: "What types of penalties can IRS assess?", Answers: ["Failure-to-File Penalty", "Failure-to-Pay Penalty", "Penalty for Substantial Understatement of Tax", "All of the above"], Answer: 3, Explanation: "All of the above can be assessed by the IRS."),
            Question(Question: "Which of the following is not deductible when itemizing?", Answers: ["State income tax", "Alcohol tax", "Property tax", "Neither of these are itemized deductions "], Answer: 1, Explanation: "Alcohol tax is likely a tax that's remitted during purchase and is not an itemized deduction. The remaining taxes are deductible on Schedule A, as itemized deductions."),
            Question(Question: "Maria filed 1040-EZ in 2015. Her employer withheld $3,000 for state taxes. Maria received $3,000 refund for state taxes. How much of the refund is taxable?", Answers: ["$0", "$1,000", "$3,000", "$6,000"], Answer: 0, Explanation: "Since Maria took a standard deduction, the refund is not taxable"),
            Question(Question: "Anna is supported entirely by her three sons Joe, James, and Nick who provide for her support in the following proportions:\n Joe: 15%, James: 35%, Nick: 50% Assuming a multiple support declaration exists, which of the brothers may claim his mother as a dependent?", Answers: ["Joe", "James", "Nick", "Any of them"], Answer: 3, Explanation: "Although no one provides more than 50 percent of Anna's support, a qualifying pool of individuals provide over 50 percent of Anna's support. Any one of them, who provides more than 10 percent, may claim Anna assuming a multiple support agreement is filed."),
            Question(Question: "Max borrows $150,000 to purchase a new fishing boat. The loan is secured by her personal residence. The debt on the residence is $250,000 and the FMV of the home is $450,000. Interest on what total amount is deductible by Max?", Answers: ["$350,000", "$250,000", "$400,000", "$100,000"], Answer: 0, Explanation: "Interest on $250,000 of acquisition indebtedness and $100,000 of home equity indebtedness (100,000+250,000=350,000). The home equity indebtedness is the lesser of home equity of $250,000 or $100,000."),
            Question(Question: "Vlad pays $20,000 in tax deductible property taxes. His marginal tax rate is 25%, effective tax rate is 20% and average rate is 22%. Vlad itemizes his deductions, what are the tax savings from paying the property tax?", Answers: ["$20,000", "$4,400", "$5,000", "$4,000"], Answer: 2, Explanation: "The tax benefit of a deduction is calculated by multiplying tax rate by the deduction (20,000x.25=$5,000)"),
            Question(Question: "Which of the following is allowed when computing AMTI for individuals?", Answers: ["Standard deduction", "Charitable contributions", "State taxes", "None of the above answers apply"], Answer: 1, Explanation: "AMTI allows charity deduction, standard deduction is not part of it and state taxes are added back for alternative minimum taxable income."),
            Question(Question: "Business gift deductions are limited to what amount (per individual, each year)?", Answers: ["$500", "$100", "$50", "$1,000"], Answer: 2, Explanation: "$50 is the business gift limit."),
            Question(Question: "In 2015 tax year, John was entitled to receive a certain amount of money for his compensation. He estimated the amount at $5,000. In 2016, however, he discovered that the amount was $7,000. What should John do?", Answers: ["Amend 2015 tax return", "Included $2,000 difference as other income in 2016 tax return", "Include $2,000 as a capital gain carryover in 2016 tax return", "Nothing, his reasonable estimate was close to what he received"], Answer: 1, Explanation: "If John estimated his income with reasonable accuracy, which is the key in this question, and later receives the income in the following year, he can include the difference in that year."),
            Question(Question: "When can a tax preparer accept contingency fees on behalf of a client under Treasury Circular 230?", Answers: ["When preparing an income tax return for a client", "There is no limitation on contingency fees", "A tax preparer cannot accept contingency under any circumstances", "$When representing a client in the tax court"], Answer: 3, Explanation: "A preparer cannot charge a client a continent fee based on the outcome of services provide. Contingency is allowed during tax examination in a court, as well as referral fees to obtain clients."),
            Question(Question: "Joe is a tax accountant. He billed $800 to Matt for his services. Matt paid Joe $400 and built a table for Joe’s office to settle his bill. Joe decided to sell the table for $300. What amount should be included in Joe’s taxes?", Answers: ["$700", "$0", "$400", "$800"], Answer: 0, Explanation: "Joe has to recognize the cash received for services and the FMV of the table received.(400+300=700)"),
             Question(Question: "Joe has a business and carries inventory. He spent $100 on warehousing costs, $200 on quality control, $300 on freight-in and $500 on research and development. What costs are expensed?", Answers: ["$100", "$0", "$500", "$800"], Answer: 2, Explanation: "All the costs mentioned except for research and development can be capitalized."),
            Question(Question: "Xander decided to sell his personal residence. He had his home for 7 years and lived in it for the past 2 years. He bought it for $200,000, had improvements of $50,000 and sold the home for $500,000. What is the amount of must Xander recognize?", Answers: ["$0", "$250,000", "$500,000", "$1,000"], Answer: 0, Explanation: "The taxpayer may include up to $250,000 of gain on the sale of the principal property if he lived in it for the last 2 years of ownership and owned it for at least 5 years. Therefore (500K-200K-50K=250K, 250K can be excluded based on the fact, and the gain recognized is 0.)"),
            Question(Question: "Sam exchanged commercial real estate that he owned for other commercial real estate and additional $100,000. FMV of property give up is 500K, basis is 350K and the property received by Sam is $400K FMV. What amount of gain must be recognized?", Answers: ["$0", "$100,000", "$400,000", "$150,000"], Answer: 1, Explanation: "The gain recognized is the lesser of “gain realized” or the amount of “boot” received. The gain realized calculation: 400K+100K = 500K, 500K -350K = 150K is gain realized, “boot” is the cash received (100K), it’s less than 150K and therefore only 100K is recognized."),
            Question(Question: "Alternative valuation date of an estate return is how many months after the decedent’s death?", Answers: ["12", "6", "3", "9"], Answer: 1, Explanation: "Alternative valuation is 6 months after the death of the decedent or the earlier date of sale or distribution"),
            Question(Question: "Jon died 12/12/15 and his assets require him to file an estate tax return. When is it due?", Answers: ["04/12/16", "05/12/16", "08/12/16", "12/12/16"], Answer: 2, Explanation: "The estate tax return is due 9 months from the date of death."),
            Question(Question: "Jon died 12/12/15 and his assets require him to file an estate tax return, however his executor decided that they need more time and got an extension. When is the return due?", Answers: ["10/12/16", "11/12/16", "12/12/16", "02/12/17"], Answer: 3, Explanation: "The estate tax return can be extended by 6 months from the date of due date, which is 9 months from death. 6 month extension would make the due date be 02/12/2017."),
            Question(Question: "Which of the following is a section 1231 asset?", Answers: ["Treasury stock", "Real estate used in business", "Accounts receivable", "Stock certificate"], Answer: 1, Explanation: "Section 1231 assets are real estate and depreciable assets used in a trade or business."),
            Question(Question: "Adjusted gross income is used in calculating limits on the following deductions EXCEPT?", Answers: ["Casualty losses", "Charity", "Medical expenses", "Mortgage interest expense"], Answer: 3, Explanation: "Mortgage interest expense does not have adjusted gross income limitation. There is a $1 million limit on the mortgage, but there are no phase out limitations."),
            Question(Question: "Anna receives $10,000 scholarship to attend college. Her expenses for tuition and books are $7,000. How much must she include in her taxable income?", Answers: ["$10,000", "$7,000", "$3,000", "0"], Answer: 2, Explanation: "To be considered tax free, the money has to go towards tuition, fees and related books. $7,000 is non-taxable while the remaining $3,000 is taxable."),
            Question(Question: "Arya Corp. has incurred $10,000 of research and development costs? How much can be capitalized in the first year? The company’s prototype is half-way finished.", Answers: ["0", "$2,500", "$5,000", "$10,000"], Answer: 0, Explanation: "For tax purposes R&D costs are expensed and not capitalized."),
            Question(Question: "Sam has 1/3 interest in the profits of SML partnership. SML’s ordinary income for the 2015 calendar year is $60,000, after a $5,000 deduction for a guaranteed payment made to Sam. No distributions were made. What is the total amount that Sam must include as taxable income in his 2015 tax return from SML?", Answers: ["$5,000", "$10,000", "$20,000", "$25,000"], Answer: 3, Explanation: "Sam must include 1/3 of partnership income and his guaranteed payment. Therefore (60,000/3+5,000)=$25,000."),
            Question(Question: "All are deductions to arrive to adjusted gross income EXCEPT:", Answers: ["Capital loss", "Property taxes", "Business expenses", "Alimony payments"], Answer: 1, Explanation: "Property taxes are schedule A, itemized deduction expense. Business expense is part of income and part of AGI, so is capital loss up to $3,000. Alimony payments are a direct deduction."),
            Question(Question: "Under 2015 tax rules, how long must an investment be held from the date of purchase to receive a long-term gain treatment?", Answers: ["1 year", "2 years", "6 months", "18 months"], Answer: 0, Explanation: "An investment recieves a long-term gain treatment after one year."),
            Question(Question: "Vladimir exchanges equipment with a basis of $50,000 and FMV of $60,000 for a similar equipment with a value of $54,000 plus $6,000 cash. What is the basis of the new machine?", Answers: ["$6,000", "$50,000", "$54,000", "$60,000"], Answer: 1, Explanation: "In a like-kind exchange the basis of the property given up plus any gain recognized, minus boot received. The basis is (50,000 + 6000 gain - 6000 boot.) The gain is calculated as the lesser of the realized gain of $10K or 6K received as boot."),
            Question(Question: "Maria gifts her child API stock with a basis of $30,000 and a FMV of $20,000. The child subsequently sells the stock for $25,000. What is the child's recognized gain or loss, if any?", Answers: ["$5,000 gain", "$5,000 loss", "0", "$15,000 gain"], Answer: 2, Explanation: "The FMV at the date of gift is lower than the basis and the sales price is between FMV and basis, no gain or loss is recognized in this situation."),
            Question(Question: "Under 2015 tax law, how much can a taxpayer deduct for interest paid on qualified education loan?", Answers: ["No limit", "10% of interest paid", "$2,000", "$2,500"], Answer: 3, Explanation: "The maximum amount is $2,500, there is also an AGI limitation of $80,000 for single taxpayer and $160,000 if MFJ"),
            Question(Question: "Last year Alex rented her apartment out for 12 days and received $2,000 for rent. Her water & garbage for the month were $100 and mortgage $1200. How much does she report as taxable income for rent?", Answers: ["0", "$700", "$1,480", "$2,000"], Answer: 0, Explanation: "Alex rented her home for less than 15 days out of the year, the rental income is non-taxable."),
            Question(Question: "Jon and Alice, a married couple, bought a home for $100,000. They lived in it for 6 years. They spent $50,000 on improvements. They sold their home for $500,000 and paid $25,000 in real estate commissions. How much gain do Jon and Alice need to recognize on their joint tax return?", Answers: ["$500,000", "$325,000", "$75,000", "0"], Answer: 3, Explanation: "Since Jon and Alice are married and had owned and lived in the home at least 2 years. All of the gain of $325,000 is excluded up to $500,000. Note, if this was not their primary home the income would be taxable."),
            Question(Question: "Matrix Co. is C corp, purchased $600,000 in goodwill assets from another business. To get to book income Matrix has $25,000 for federal income tax expense, and $20,000 in impairment expense of goodwill which amounts to $150,000 in 2015. What is Matrix’s taxable income in 2015?", Answers: ["$150,000", "$155,000", "$170,000", "$195,000"], Answer: 1, Explanation: "Taxable income is calculated as follows: 150,000+20,000+25,000= $195,000. Then we must figure out amortization of goodwill for tax purposes (15 years) and therefore 600,000/15=$40,000. Then, 195,000-40,000=$155,000."),
            Question(Question: "Nick’s Corp. had incurred $10,000 of organizational costs to set up the business in 2015 on 01/01/2015. How much is deductible in his 2015 tax return?", Answers: ["0", "$5,000", "$5,333", "$10,000"], Answer: 2, Explanation: "The first $5,000 is tax deductible and the remaining $5,000 must be capitalized and amortized over 15 years. (5,000/15=$333) Therefore 5,000+333=$5,333."),

            
            
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
            
            resourceLabel.hidden = false
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
            
            resourceLabel.text = ("You've just finished Regulation (REG) practice test.\n\n\nYou answered correctly " + RightAnswer + " out of " + QuestionsTotal + " questions, which is " + percentString + " %.\n\n\nYou spent " + minutesString + " minutes and " + secoString + " seconds, averaging " + secondsPerQuestion() + " seconds per question.")
            
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
    
        resourceLabel.text = "Are you sure you want to quit?"
        
        YesQuitButton.hidden = false
        NoDontQuitButton.hidden = false
        resourceLabel.hidden = false
        
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
        resourceLabel.hidden = true
        
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
