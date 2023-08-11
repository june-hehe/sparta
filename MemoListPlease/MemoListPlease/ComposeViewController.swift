//
//  ComposeViewController.swift
//  MemoListPlease
//
//  Created by DJ S on 2023/08/11.
//

import UIKit

class ComposeViewController: UIViewController {
    
    var editTarget: Memo?

    
    @IBOutlet weak var memoTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let memo = editTarget {
            navigationItem.title = "메모 편집"
            memoTextView.text = memo.content
        } else {
            navigationItem.title = "새 메모"
            memoTextView.text = ""
        }

    }
    

    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        
    }
    
    
    @IBAction func save(_ sender: Any) {
        guard let memo = memoTextView.text,
              memo.count > 0 else {
            alert(message: "메모를 입력하세요")
            return
        }
        let newMemo = Memo(content: memo)
        Memo.dummyMemoList.append(newMemo)
        NotificationCenter.default.post(name: ComposeViewController.newMemoDidInsert, object: nil)
                // Notification은 특정객체에게 바로 전달되지 못함, Center를 통해 전달됨
        dismiss(animated: true, completion: nil)
        
    }

    
}

extension ComposeViewController {
    static let newMemoDidInsert = Notification.Name(rawValue: "newMemoDidInsert")
}
