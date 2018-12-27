//
//  HomeViewController.swift
//  Wanpo
//
//  Created by 久保田慧 on 2018/12/15.
//  Copyright © 2018年 KeiKubota. All rights reserved.
//

import UIKit
import ESTabBarController
import RealmSwift


class HomeViewController: UIViewController {
    @IBOutlet weak var dateLabel: UILabel!
    
    //Realmインスタンスを取得する
    let realm = try! Realm()
    
    //DB内のタスクが格納されるリスト
    //日付近い順でソート：降順
    //以降内容をアップデートするとリスト内は自動的に更新される。
    var taskArray = try! Realm().objects(DbInfo.self).sorted(byKeyPath: "date", ascending: false)
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dateLabel.text = getDateString()
        
    }
    
    //本日日付を取得
    func getDateString() -> String{
        let date = NSDate()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        let dateStr = formatter.string(from: date as Date)
        
        formatter.locale = NSLocale(localeIdentifier: "ja_JP") as Locale?
        formatter.dateFormat = DateFormatter.dateFormat(fromTemplate: "EEEEE", options: 0, locale: Locale.current)
        let weekStr = formatter.string(from: date as Date)
        return dateStr + "(" + weekStr + ")"
    }
    
    //初期の登録画面で登録された情報を、Realmから取得して設置
    func setInfo(){
        
        
        
    }
    
    //画面遷移のメソッド
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //編集画面に情報を渡す
        let editViewController: EditViewController = segue.destination as! EditViewController
        let dbInfo = DbInfo()
        dbInfo.date = Date()
        
        let allTasks = realm.objects(DbInfo.self)
        if allTasks.count != 0 {
            dbInfo.id = allTasks.max(ofProperty: "id")! + 1
        }
        editViewController.dbInfo = dbInfo
        
    }//end prepare
    
}
