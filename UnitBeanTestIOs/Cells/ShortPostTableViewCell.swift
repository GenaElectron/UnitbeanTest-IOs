//
//  ShortPostTableViewCell.swift
//  UnitBeanTestIOs
//
//  Created by Admin on 29.03.2019.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

class ShortPostTableViewCell: UITableViewCell, NibLoadable {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var commentIcon: UIButton!
    @IBOutlet weak var commentLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        containerView.smallRound()
        containerView.addShadow()
        self.backgroundColor = UIColor.MainColor.LightGray
    }
}

