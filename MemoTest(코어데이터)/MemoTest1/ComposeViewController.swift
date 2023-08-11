//
//  ComposeViewController.swift
//  MemoTest1
//
//  Created by DJ S on 2023/08/10.
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
        
        // Do any additional setup after loading the view.
    }
    

    
    
    @IBAction func cancelButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func saveButton(_ sender: Any) {
        
        guard let memo = memoTextView.text,
              memo.count > 0 else {
            //텍스트가 입력되지 않았을시 경고창 띄우기
            alert(message: "메모를 입력하세요")
            // 코드가 지저분해지므로 다른곳에서 작성하여 호출
            
            return
        }
        if let target = editTarget {
            target.content = memo
            DataManager.shared.saveContext()
            NotificationCenter.default.post(name: ComposeViewController.memoDidChange, object: nil)
                    // Notification은 특정객체에게 바로 전달되지 못함, Center를 통해 전달됨
        } else {
            DataManager.shared.addNewMemo(memo)
            NotificationCenter.default.post(name: ComposeViewController.newMemoDidInsert, object: nil)
                    // Notification은 특정객체에게 바로 전달되지 못함, Center를 통해 전달됨
        }
//        let newMemo = Memo(content: memo)
//        Memo.dummyMemoList.append(newMemo)
        
        dismiss(animated: true, completion: nil)
    }
    
    

}

extension ComposeViewController {
    static let newMemoDidInsert = Notification.Name(rawValue: "newMemoDidInsert")
    static let memoDidChange = Notification.Name(rawValue: "memoDidChange")
}
