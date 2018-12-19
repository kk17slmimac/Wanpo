//
//  FinishViewController.swift
//  Wanpo
//
//  Created by 久保田慧 on 2018/12/15.
//  Copyright © 2018年 KeiKubota. All rights reserved.
//

import UIKit

class FinishViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var commentTextView: UITextView!
    
    
    @IBOutlet weak var placeholderTextField: UITextField!
    
    @IBAction func handleLibraryButton(_ sender: Any) {
        //ライブラリ(カメラロール)を指定してピッカーを開く
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
            let pickerController = UIImagePickerController()
            pickerController.delegate = self
            pickerController.sourceType = .photoLibrary
            self.present(pickerController, animated: true, completion: nil)
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

    }
    
    
    //textviewがフォーカスされたら、Labelを非表示
    func textViewShouldBeginEditing(textView: UITextView) -> Bool
    {
        self.placeholderTextField.isHidden = true
        return true
    }
    
    //textviewからフォーカスが外れて、TextViewが空だったらLabelを再び表示
    func textViewDidEndEditing(textView: UITextView) {
        
        if(textView.text.isEmpty){
            self.placeholderTextField.isHidden = false
        }
    }

    

}
