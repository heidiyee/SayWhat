//
//  AnswerTableViewCell.swift
//  GuyGirlTextAssistant
//
//  Created by Work on 11/17/15.
//
//

import UIKit

class AnswerTableViewCell: UITableViewCell {

    @IBOutlet weak var textParentView: UIView!
    @IBOutlet weak var answerTextLabel: UILabel!
    
    class func identifier() -> String {
        return "AnswerTableViewCell"
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
