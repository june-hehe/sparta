//
//  Model.swift
//  MemoListPlease
//
//  Created by DJ S on 2023/08/11.
//

import Foundation

class Memo {
    var content: String
    var insertDate: Date
    
    init(content: String) {
        self.content = content
        insertDate = Date()
    }
    static var dummyMemoList = [
        Memo(content: "더미메모1"),
        Memo(content: "더미메모2")
    
    ]
}
