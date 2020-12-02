//
//  Emoji.swift
//  EmojiDictionary
//
//  Created by 马学渊 on 2018/02/08.
//  Copyright © 2018年 Ma Xueyuan. All rights reserved.
//

import Foundation

class Emoji: Codable {
	var symbol: String
	var name: String
	var description: String
	var usage: String
	
	init(symbol: String, name: String, description: String, usage: String) {
		self.symbol = symbol
		self.name = name
		self.description = description
		self.usage = usage
	}
}
