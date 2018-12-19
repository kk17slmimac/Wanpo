//
//  ViewController.swift
//  Wanpo
//
//  Created by 久保田慧 on 2018/12/15.
//  Copyright © 2018年 KeiKubota. All rights reserved.
//

import UIKit
import ESTabBarController

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTab()

            }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
//        //起動時に挿絵を見たらホーム画面に遷移
//        let HomeViewController = self.storyboard?.instantiateViewController(withIdentifier: "Home")
//        //モーダルで表示 ホーム画面なので特にいらない？
//        self.present(HomeViewController!, animated: true, completion: nil)
        
//        setupTab()

        
        
    }
    
    func setupTab() {
        
        // 画像のファイル名を指定してESTabBarControllerを作成する
        let tabBarController: ESTabBarController! = ESTabBarController(tabIconNames: ["home", "sanpo", "calendar"])
        
        // 背景色、選択時の色を設定する
        tabBarController.selectedColor = UIColor(red: 1.0, green: 0.44, blue: 0.11, alpha: 1)
        tabBarController.buttonsBackgroundColor = UIColor(red: 0.96, green: 0.91, blue: 0.87, alpha: 1)
        tabBarController.selectionIndicatorHeight = 3
        
        // 作成したESTabBarControllerを親のViewController（＝self）に追加する
        addChild(tabBarController)
        //        addChildViewController(tabBarController)
        
        let tabBarView = tabBarController.view!
        tabBarView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tabBarView)
        let safeArea = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            tabBarView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            tabBarView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
            tabBarView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            tabBarView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            ])
        tabBarController.didMove(toParent: self)
        //        tabBarController.didMove(toParentViewController: self)
        
        // タブをタップした時に表示するViewControllerを設定する
        let homeViewController = storyboard?.instantiateViewController(withIdentifier: "Home")
        let monthlyViewController = storyboard?.instantiateViewController(withIdentifier: "Monthly")
        
        tabBarController.setSelectedIndex(0, animated: true)
        tabBarController.setView(homeViewController, at: 0)
        tabBarController.setView(monthlyViewController, at: 2)
        
        // 真ん中のタブはボタンとして扱う
        tabBarController.highlightButton(at: 1)
        tabBarController.setAction({
            // ボタンが押されたらImageViewControllerをモーダルで表示する
            let imageViewController = self.storyboard?.instantiateViewController(withIdentifier: "Start")
            self.present(imageViewController!, animated: true, completion: nil)
        }, at: 1)
    }
    


}

