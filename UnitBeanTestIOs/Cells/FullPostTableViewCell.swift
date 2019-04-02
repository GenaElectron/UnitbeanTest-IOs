//
//  FullPostTableViewCell.swift
//  UnitBeanTestIOs
//
//  Created by Admin on 01.04.2019.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

class FullPostTableViewCell: UITableViewCell, NibLoadable {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }
}
