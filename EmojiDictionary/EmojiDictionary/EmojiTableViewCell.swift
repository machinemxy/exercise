//
//  EmojiTableViewCell.swift
//  EmojiDictionary
//
//  Created by 马学渊 on 2018/02/18.
//  Copyright © 2018年 Ma Xueyuan. All rights reserved.
//

import UIKit

class EmojiTableViewCell: UITableViewCell {
	@IBOutlet weak var symbolLabel: UILabel!
	@IBOutlet weak var nameLabel: UILabel!
	@IBOutlet weak var descriptionLabel: UILabel!
	
	func update(with emoji: Emoji) {
		symbolLabel.text = emoji.symbol
		nameLabel.text = emoji.name
		descriptionLabel.text = emoji.description
	}
	
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
