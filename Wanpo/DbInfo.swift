//
//  DbInfo.swift
//  Wanpo
//
//  Created by 久保田慧 on 2018/12/25.
//  Copyright © 2018年 KeiKubota. All rights reserved.
//

import RealmSwift
class DbInfo: Object{
    //管理用 ID プライマリーキー
    @objc dynamic var id = 0
    //名前
    @objc dynamic var dogName = ""
    //性別
    @objc dynamic var gender = ""
    //犬種
    @objc dynamic var dogBreed = ""
    //足の長さ
    @objc dynamic var legLength = 0
    //日時
//    @objc dynamic var date = Date()
    
    /*
     idをプライマリーキーとして設定
     */
    override static func primaryKey() -> String? {
        return "id"
    }
    
    
    
}
