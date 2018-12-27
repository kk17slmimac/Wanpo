//
//  EditViewController.swift
//  Wanpo
//
//  Created by 久保田慧 on 2018/12/25.
//  Copyright © 2018年 KeiKubota. All rights reserved.
//

/*
 【EditViewController(編集画面)】
 実装したい機能
 ①HomeViewControllerから値を取得し、デフォルトでセットする。
 ②犬種はpickerViewで設定できる様にする。
 ③足の長さの項目は、手で入力するか、pickerViewで選択された犬種と連動して表示するか(サンプル値)、ARメジャーを使用して値を取得する。
 ④性別に関してはラジオボタンの様に選択
 ⑤全ての編集が終わったらRealmに保存、ポップアップで「修正が完了しました」と表示しHomeViewControllerに画面遷移
 */



import UIKit
import RealmSwift

class EditViewController: UIViewController {
    @IBOutlet weak var dogNameTextField: UITextField!
    @IBOutlet weak var legLengthTextField: UITextField!
    
    
    var dbInfo: DbInfo!
    var realm = try! Realm()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //HomeViewControllerから渡された情報を元に、Realmから登録済み情報を取得
        
        //取得した情報をTextFieldに表示
        
        
        //背景をタップしたらdissmissKeyBoardメソッドをt呼ぶように設定する
        let tapGesture: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action:#selector(dissmissKeyBoard))
        self.view.addGestureRecognizer(tapGesture)
        
        setInfo()
        
        
        
    }//end viewDidLoad
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        
    }
    
    
    //入力欄に値を設定するメソッド
    func setInfo(){
        
        
        
    }
    
    //修正ボタンを押した際に入力欄の値を取得しするメソッド
    func modifyButton(){
        //入力欄の値を取得してRealmに保存する
        try! realm.write {
            self.dbInfo.dogName = self.dogNameTextField.text!
            //Int型に変換が必要
//            self.dbInfo.legLength = Int(self.legLengthTextField.text!)
            
        }
        
    }
    
    
    //ARメジャーを呼び出すメソッド
    
    //キーボードを閉じる
    @objc func dissmissKeyBoard(){
        view.endEditing(true)
    }
    
    
    
    
    
}
