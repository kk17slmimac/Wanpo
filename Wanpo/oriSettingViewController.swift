////  SettingViewController.swift
////  Wanpo
////
////  Created by 久保田慧 on 2018/12/15.
////  Copyright © 2018年 KeiKubota. All rights reserved.
//
///*
// 【SettingViewControllerの役割】
// 初回の登録画面
//
//
// */
//
//
//
//
//
//import UIKit
////【質問】Realmのインポートができない。
////import RealmSwift
//
//
//class SettingViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {
//
//    @IBOutlet weak var pickerView: UIPickerView!
//
//
//    //名前、性別、犬種、足の長さをプロパティで持つ。
//    let dogName: String!
//    let gender: String!
//    let dogBreed: String!
//    let legLength: Int!
//    //Realm
//    var dbInfo: DbInfo!
//
//
//
//
//
//    //犬種のpickerView用
//    let dataList = [
//        "ミニチュアダックス","チワワ","ポメラニアン","ゴールデンレトリーバー","ブルドッグ"
//    ]
//
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // Delegate設定
//        pickerView.delegate = self
//        pickerView.dataSource = self
//
//        //背景をタップしたらdissmissKeyboardメソッドを呼ぶように設定する
//        let tapGesture: UITapGestureRecognizer = UITapGestureRecognizer(target:self.action: #selector(dismissKeyboard))
//        self.view.addGestureRecognizer(tapGesture)
//
//        //DBに保存されている情報を予め入力しておく
//        dogNameTextField.text = dbInfo.dogName
//        dogBreedPickerView.text = dbInfo.dogBreed
//        dogGenderTextField.text = dbInfo.dogGender
//        legLengthTextField.text = dbINfo.legLength
//    }//end viewDidLoad()
//
//
//    @objc func dismissKeyboard(){
//        //キーボードを閉じる
//        view.endEditing(true)
//
//    }
//
//
//
//
//
//    // UIPickerViewの列の数
//    func numberOfComponents(in pickerView: UIPickerView) -> Int {
//        return 1
//    }
//
//    // UIPickerViewの行数、リストの数
//    func pickerView(_ pickerView: UIPickerView,
//                    numberOfRowsInComponent component: Int) -> Int {
//        return dataList.count
//    }
//
//    // UIPickerViewの最初の表示
//    func pickerView(_ pickerView: UIPickerView,
//                    titleForRow row: Int,
//                    forComponent component: Int) -> String? {
//
//        return dataList[row]
//    }
//
//    // UIPickerViewのRowが選択された時の挙動
//    func pickerView(_ pickerView: UIPickerView,
//                    didSelectRow row: Int,
//                    inComponent component: Int) {
//
//
//    }
//
//
//    //入力されたプロパティを取得
//    func getProperty(){
//
//        self.dogName = self.dogNameTextField.text
//        self.gender = self.genderTextField.text
//
//
//        //textFieldの足の長さが空欄の時
//        if self.letLengthTextField.isEmpty{
//            //pickerViewの犬種をkeyに登録されている足の長さをRealmで取得
//
//
//
//        }else{
//            //textFieldに入力されている場合
//
//            //文字列で足の長さを取得
//            var stringLegLength = self.legLengthTextField.text
//            //文字列で取得したものを数値に変換
//            var intLegLength = Int(stringLegLength)
//            //数値に変換したものをプロパティに入れる
//            self.legLength = intLeglength
//
//
//        }
//    }
//
//
//
//
//    @IBAction func homeButton(_ sender: Any) {
//        //画面遷移の際に呼ばれるのはprepare(for:sender:)
//        override func prepare(for segue: UIstoryboardSegue, sender:Any?){
//            let homeViewController:HomeViewController = segue.destination as! HomeViewController
//        }
//
//
//
//        @IBAction func modifyButton(_ sender: Any) {
//
//            //保存ボタンを押した際にgetPropertyでプロパティに値を入れて、それをRealmに保存する。
//
//            //プロパティの値を取得
//            getProperty()
//
//
//            //プライマリーキーに+1をして新しいものを作成
//
//            let dbInfo = Dbinfo()
//            dbInfo.date = Date()
//
//            let allDbInfo = realm.objectst(dbInfo.self)
//            if allDbInfo.count !== 0{
//                allDbInfo.id = allDbInfo.max(ofProperty: "id")!+1
//            }
//
//            homeViewController.task = dbInfo
//
//
//            try! realm.write{
//
//                self.realm.delete(self.taskArray[indexPath.row])
//                tableview.deleteRows(at: [indexPath], with: .fade)
//
//            }
//        }
//
//    }
//
//
//
//
//
//}//end Class
//
//
