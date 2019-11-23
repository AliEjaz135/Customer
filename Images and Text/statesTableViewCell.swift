//
//  statesTableViewCell.swift
//  Images and Text
//
//  Created by admin on 11/16/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

class statesTableViewCell: UITableViewCell {
  
  
  @IBOutlet weak var myImageView: UIImageView!
  
  @IBOutlet weak var stateNameLbl: UILabel!
  
  override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
