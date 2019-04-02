//
//  CommentPostTableViewCell.swift
//  UnitBeanTestIOs
//
//  Created by Admin on 01.04.2019.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

class CommentPostTableViewCell: UITableViewCell, NibLoadable {
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    @IBOutlet weak var avatarView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        avatarView.clipsToBounds = true
        avatarView.round()
    }
}
