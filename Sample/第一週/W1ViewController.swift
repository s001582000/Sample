//
//  W1ViewController.swift
//  Sample
//
//  Created by 梁雅軒 on 2018/6/13.
//  Copyright © 2018年 梁雅軒. All rights reserved.
//

import UIKit

class W1ViewController: UIViewController {
    //與IB介面連動Outlet
    @IBOutlet weak var tfHeight: UITextField!
    @IBOutlet weak var tfWeight: UITextField!
    @IBOutlet weak var btnResult: UIButton!
    @IBOutlet weak var lblResult: UILabel!
    
    //程式起始
    override func viewDidLoad() {
        super.viewDidLoad()
        // UITextField 預設文字
        tfHeight.placeholder = "身高"
        tfWeight.placeholder = "體重"

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //與IB介面連動Action
    @IBAction func btnOnClick(_ sender: UIButton) {
        //透過guard let 解包
        guard let h = tfHeight.text else {
            return
        }
        
        guard let w = tfWeight.text else {
            return
        }
        
        //透過if let 解包 強制轉型
        if let hValue = Float(h) {
            if let wValue = Float(w){
                let hPow = pow(hValue/100, hValue/100)
                let value = wValue / hPow
                lblResult.text = "\(value)"
            }
        }
        
        //鍵盤縮下
        self.view.endEditing(true)
        
    }
    


}
