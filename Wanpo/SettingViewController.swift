//
//  SettingViewController.swift
//  Wanpo
//
//  Created by 久保田慧 on 2018/12/15.
//  Copyright © 2018年 KeiKubota. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {
    
    @IBOutlet weak var pickerView: UIPickerView!
    
    let dataList = [
        "ミニチュアダックス","チワワ","ポメラニアン","ゴールデンレトリーバー","ブルドッグ"
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Delegate設定
        pickerView.delegate = self
        pickerView.dataSource = self
        
        
    }
    
    // UIPickerViewの列の数
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // UIPickerViewの行数、リストの数
    func pickerView(_ pickerView: UIPickerView,
                    numberOfRowsInComponent component: Int) -> Int {
        return dataList.count
    }
    
    // UIPickerViewの最初の表示
    func pickerView(_ pickerView: UIPickerView,
                    titleForRow row: Int,
                    forComponent component: Int) -> String? {
        
        return dataList[row]
    }
    
    // UIPickerViewのRowが選択された時の挙動
    func pickerView(_ pickerView: UIPickerView,
                    didSelectRow row: Int,
                    inComponent component: Int) {
        
        
    }
    
}
