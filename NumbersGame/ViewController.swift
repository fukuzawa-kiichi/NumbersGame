//
//  ViewController.swift
//  NumbersGame
//
//  Created by VERTEX24 on 2019/08/05.
//  Copyright © 2019 VERTEX24. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // 前に書かれた数字を表示する
    @IBOutlet weak var numberLabel: UILabel!
    // 数字を入力するとこ
    @IBOutlet weak var numTextField: UITextField!
    // 過去の結果を表示する
    @IBOutlet weak var resultTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // ボタンの関数
    @IBAction func button(_ sender: UIButton) {
    }
    
}

