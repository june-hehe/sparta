//
//  DetailViewController.swift
//  MemoTest1
//
//  Created by DJ S on 2023/08/10.
//

import UIKit

class DetailViewController: UIViewController {

    var memo: Memo?
    
    
    @IBOutlet weak var memoTableView: UITableView!
    
    
    let formatter: DateFormatter = {
        let f = DateFormatter()
        f.dateStyle = .long
        f.timeStyle = .short
        f.locale = Locale(identifier: "Ko_kr")
        return f
    }()
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination.children.first as?
            ComposeViewController {
            vc.editTarget = memo
        }
    }
    
    var token: NSObjectProtocol?
    
    deinit {
        if let token = token {
            NotificationCenter.default.removeObserver(token)
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        token = NotificationCenter.default.addObserver(forName: ComposeViewController.memoDidChange, object: nil, queue: OperationQueue.main, using: { [weak self] (noti) in
            self?.memoTableView.reloadData()
        })
        // Do any additional setup after loading the view.
    }
    

    @IBAction func deleteMemo(_ sender: Any) {
        let alert = UIAlertController(title: "삭제 확인", message: "메모를 삭제할까요?", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "삭제", style: .destructive) { [weak self] (action) in
            DataManager.shared.deleteMemo(self?.memo)
            self?.navigationController?.popViewController(animated: true)
        }
        alert.addAction(okAction)
        
        let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        alert.addAction(cancelAction)
        
        present(alert, animated: true, completion: nil)
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension DetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "memoCell", for: indexPath)
            
            cell.textLabel?.text = memo?.content
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "dateCell", for: indexPath)
            
            cell.textLabel?.text = formatter.string(for: memo?.insertDate)
            return cell
        default:
            fatalError()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2 // content, insertDate    }
        // 테이블뷰가 표시할 셀 갯수를 물어볼때의 메소드 }

        // 테이블뷰가 어떤 셀을 표시할지 물어볼때의 메소드
    }
}
/*
 테이블 뷰에서 "memoCell"이라는 식별자를 가진 셀을 재사용하여, 주어진 위치(indexPath)에 해당하는 셀 객체를 반환합니다. 이로써 테이블 뷰에서 스크롤되면서 새로운 데이터를 보여줄 때 셀을 효율적으로 재사용하는 구조
 */

