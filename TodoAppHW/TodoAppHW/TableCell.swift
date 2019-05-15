//
//  TableCell.swift
//  TodoAppHW
//
//  Created by Adam Tremarche on 5/14/19.
//  Copyright © 2019 Adam Tremarche. All rights reserved.
//

import UIKit

//test checkbox protocol
protocol CheckedOrUnchecked {
    func checkOrUnchecked (isChecked: Bool, index: Int)
}

//delete task protocol
protocol DeleteTask {
    func deleteTask (index: Int)
}

class TableCell: UITableViewCell {
    
    var delegateCheck: CheckedOrUnchecked?
    var delegateDelete: DeleteTask?
    var ip: Int?
    var tasksArray: [Task]?

    @IBOutlet weak var checkBoxOutlet: UIButton!
    @IBOutlet weak var TaskLabelOutlet: UILabel!
    
    @IBAction func checkBoxAction(_ sender: Any) {
        if tasksArray![ip!].checked {
            delegateCheck?.checkOrUnchecked(isChecked: false, index: ip!)
        } else {
            delegateCheck?.checkOrUnchecked(isChecked: true, index: ip!)
        }
    }
    
    @IBAction func deleteButtonAction(_ sender: Any) {
        delegateDelete?.deleteTask(index: ip!)
    }
    
   
    
}
