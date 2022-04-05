//
//  ViewController.swift
//  Alert
//
//  Created by 김예린 on 2022/03/30.
//

import UIKit

class ViewController: UIViewController {
    let imgOn = UIImage(named: "lamp-on.png") // 켜진 전구 이미지
    let imgOff = UIImage(named: "lamp-off.png") // 꺼진 전구 이미지
    let imgRemove = UIImage(named: "lamp-remove.png") // 제거된 전구 이미지의 상수
    
    var isLampOn = true // 전구 상태를 나타내는 변수(켜진 상태는 true, 꺼진 상태는 false)
    
    @IBOutlet var lampImg: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        lampImg.image = imgOn // 앱 실행 시 켜진 전구 이미지가 나타남
    }

    @IBAction func btnLampOn(_ sender: UIButton) {
        if (isLampOn==true) { // 전구가 켜져 있을 경우, 전구가 켜져 있다고 알려 주는 얼럿을 실행함
            let lampOnAlert = UIAlertController(title: "경고", message: "현재 on 상태입니다", preferredStyle: UIAlertController.Style.alert)
            let onAction = UIAlertAction(title: "네, 알겠습니다.", style: UIAlertAction.Style.default, handler: nil)
            
            lampOnAlert.addAction(onAction)
            
            present(lampOnAlert, animated: true, completion: nil)
        } else { // 전구가 켜져 있지 않을 경우, 전구를 켬
            lampImg.image = imgOn
            isLampOn = true
        }
    }
    @IBAction func btnLampOff(_ sender: UIButton) {
        if isLampOn { // 전구가 켜져 있을 경우, 끌 것인지 묻는 얼럿을 실행함
            let lampOffAlert = UIAlertController(title: "램프 끄기", message: "램프를 끄시겠습니까?", preferredStyle: UIAlertController.Style.alert)
            let offAction = UIAlertAction(title: "네", style: UIAlertAction.Style.default, handler: {
                // 익명 함수(클로저)
                ACTION in self.lampImg.image = self.imgOff
                self.isLampOn = false
            })
            let cancelAction = UIAlertAction(title: "아니오", style: UIAlertAction.Style.default, handler: nil)
            
            lampOffAlert.addAction(offAction)
            lampOffAlert.addAction(cancelAction)
            
            present(lampOffAlert, animated: true, completion: nil)
        }
    }
    
    // 전구를 제거할 것인지 묻고 '켜기', '끄기', '제거'의 세 가지 동작 중에서 선택해 실행
    @IBAction func btnLampRemove(_ sender: UIButton) {
        let lampRemoveAlert = UIAlertController(title: "램프 제거", message: "램프를 제거하시겠습니까?", preferredStyle: UIAlertController.Style.alert)
        let offAction = UIAlertAction(title: "아니오, 끕니다(off).", style: UIAlertAction.Style.default, handler: {
            ACTION in self.lampImg.image = self.imgOff
            self.isLampOn = false
        })
        let onAction = UIAlertAction(title: "아니오, 켭니다(on).", style: UIAlertAction.Style.default) {
            ACTION in self.lampImg.image = self.imgOn
            self.isLampOn = true
        }
        let removeAction = UIAlertAction(title: "네, 제거합니다.", style: UIAlertAction.Style.destructive, handler: {
            ACTION in self.lampImg.image = self.imgRemove
            self.isLampOn = false
        })
        
        lampRemoveAlert.addAction(offAction)
        lampRemoveAlert.addAction(onAction)
        lampRemoveAlert.addAction(removeAction)
        
        present(lampRemoveAlert, animated: true, completion: nil)
    }
}
