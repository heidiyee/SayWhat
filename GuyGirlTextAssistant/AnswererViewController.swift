//
//  AnswererViewController.swift
//  GuyGirlTextAssistant
//
//  Created by Work on 11/18/15.
//
//

import UIKit
import Parse

class AnswererViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var question: PFObject?
    
    var answers = ["Lorem ipsum dolor sit amet, consectetur adipiscing elit.", "Donec a diam lectus.", "Sed sit amet ipsum mauris.", "Maecenas congue ligula ac quam viverra nec consectetur ante hendrerit."]
    
    @IBOutlet weak var answersTableView: UITableView!
    @IBOutlet weak var phraseTextField: UITextField!
    @IBOutlet weak var phraseElementsContainer: UIView!

    class func identifier() -> String {
        return "AnswererViewController"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.answersTableView.dataSource = self
        self.answersTableView.delegate = self
        self.answersTableView.estimatedRowHeight = 44
        self.answersTableView.rowHeight = UITableViewAutomaticDimension
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor(white: 0.9, alpha: 1.0).CGColor, UIColor.whiteColor().CGColor]
        //        gradientLayer.colors = [UIColor(white: 0.3, alpha: 1.0).CGColor, UIColor(white: 0.2, alpha: 1.0).CGColor]
        gradientLayer.frame = self.view.bounds
        self.view.layer.insertSublayer(gradientLayer, atIndex: 0)
        
        self.answersTableView.registerNib(UINib(nibName: LeftSpeechBubbleTableViewCell.identifier(), bundle: nil), forCellReuseIdentifier: LeftSpeechBubbleTableViewCell.identifier())
        self.answersTableView.registerNib(UINib(nibName: RightSpeechBubbleTableViewCell.identifier(), bundle: nil), forCellReuseIdentifier: RightSpeechBubbleTableViewCell.identifier())
        
        self.phraseElementsContainer.backgroundColor = UIColor.clearColor()
        
        //        let lightBlurView = UIVisualEffectView(effect: UIBlurEffect(style: UIBlurEffectStyle.Light))
        //        lightBlurView.frame = self.phraseElementsContainer.bounds
        //        self.phraseElementsContainer.backgroundColor = UIColor.clearColor()
        //        self.phraseElementsContainer.insertSubview(lightBlurView, atIndex: 0)
        // OR
        //        self.phraseElementsContainer.backgroundColor = UIColor.whiteColor()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return CustomTransition(duration: 2.0)
    }
    
    // MARK: Text field actions
    
    @IBAction func textFieldDidEndOnExit(textField: UITextField) {
        if let phraseText = textField.text {
            self.answers.append(phraseText)
            self.answersTableView.reloadData()
            //            let matchesInTextMessage = KeyWordFinder.searchForAllPatterns(phraseText)
            //            self.answers = AnswerRetriever.answersforText(matchesInTextMessage)
            //            self.answersTableView.reloadData()
        }
    }
    
    // MARK: Table view data source
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return answers.count
    }
    
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        SpeechBubbleTableViewCellAnimator.animate(cell)
        cell.backgroundColor = UIColor.clearColor()
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //        let cell = self.answersTableView.dequeueReusableCellWithIdentifier(LeftSpeechBubbleTableViewCell.identifier()) as! LeftSpeechBubbleTableViewCell
        //        cell.configureWithColor(UIColor.whiteColor(), text: answers[indexPath.row], cornerRadius: self.cornerRadius)
        //        return cell
        
        if indexPath.row == 0 {
            let cell = self.answersTableView.dequeueReusableCellWithIdentifier(LeftSpeechBubbleTableViewCell.identifier()) as! LeftSpeechBubbleTableViewCell
            cell.configureWithColor(UIColor(white: 0.85, alpha: 1), text: answers[indexPath.row], cornerRadius: kSpeechBubbleCornerRadius)
            return cell
        }
        let cell = self.answersTableView.dequeueReusableCellWithIdentifier(RightSpeechBubbleTableViewCell.identifier()) as! RightSpeechBubbleTableViewCell
        cell.configureWithColor(UIColor(white: 0.5, alpha: 1), text: answers[indexPath.row], cornerRadius: kSpeechBubbleCornerRadius)
        return cell
    }
}

