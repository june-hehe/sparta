//
//  UIViewController+Alert.swift
//  MemoListPlease
//
//  Created by DJ S on 2023/08/11.
//

import UIKit

extension UIViewController {
    func alert(title: String = "알림", message: String) {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            // title: 경고창의 제목, message: 경고창에 표시할 메시지, preferredStyle: 경고창의 스타일 Alert View 또는 Action Sheet 사용
            
            let okAction = UIAlertAction(title: "확인", style: .default, handler: nil)
            // title: 버튼 이름, style: 버튼의 스타일(기본), handler: 버튼 클릭시 실행할 코드
            
            // 생성한 버튼을 alertController에 추가해야함
            alert.addAction(okAction)
            
            // 경고창을 화면에 표시
            present(alert, animated: true, completion: nil)
        }
}
