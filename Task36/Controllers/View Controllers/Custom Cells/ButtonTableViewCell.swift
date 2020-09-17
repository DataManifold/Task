//
//  ButtonTableViewCell.swift
//  Task36
//
//  Created by Shean Bjoralt on 9/17/20.
//  Copyright © 2020 Shean Bjoralt. All rights reserved.
//

import UIKit

protocol ButtonTableViewCellDelegate: AnyObject {
    func buttonCellButtonTapped(_ sender: ButtonTableViewCell)
}

class ButtonTableViewCell: UITableViewCell {
    
    //MARK: - Outlets
    
    @IBOutlet weak var primaryLabel: UILabel!
    @IBOutlet weak var completeButton: UIButton!
    
    //MARK: - Properties
    
    var delegate: ButtonTableViewCellDelegate?
    
    //MARK: - Lifecycle Functions
    
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//    }
//
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }
    
    func updateButton(_ isComplete: Bool) {
        let imageName = isComplete ? "complete" : "incomplete"
        completeButton.setImage(UIImage(named: imageName), for: .normal)
    }
    
    func update(withTask task: Task) {
        primaryLabel.text = task.name
//        timestampLabel.text = "Task is due on: \(task.due!.stringValue())"
        updateButton(task.isComplete)
    }
    
    @IBAction func buttonTapped(_ sender: Any) {
        
    }
}
