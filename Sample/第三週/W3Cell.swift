//
//  W3Cell.swift
//  Sample
//
//  Created by 梁雅軒 on 2018/6/13.
//  Copyright © 2018年 梁雅軒. All rights reserved.
//

import UIKit
import SDWebImage
class W3Cell: UITableViewCell {

    @IBOutlet weak var lblMessage: UILabel!
    @IBOutlet weak var imgvPhoto: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func setInfo(info:Pokemon) {
        lblMessage.text = info.name
        imgvPhoto.sd_setImage(with: URL(string: info.path))
    }
    
}
