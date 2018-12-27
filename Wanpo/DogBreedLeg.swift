//
//  DogBreedLeg.swift
//  Wanpo
//
//  Created by 久保田慧 on 2018/12/26.
//  Copyright © 2018年 KeiKubota. All rights reserved.
//
//犬の足の長さだけを管理するDB

import RealmSwift

class DogBreedLeg: Object {
    
    //管理用ID
    @objc dynamic var id = 0
    
    //犬種
    @objc dynamic var dogBreed = ""
    //足の長さ
    @objc dynamic var legLength = 0
    
    
    /*
     idをプライマリーキーとして設定
     */
    override static func primaryKey() -> String? {
        return "id"
}
    
}


