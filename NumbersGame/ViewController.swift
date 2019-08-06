//
//  ViewController.swift
//  NumbersGame
//
//  Created by VERTEX24 on 2019/08/05.
//  Copyright © 2019 VERTEX24. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate,UITextViewDelegate {
    
    // 数字をランダムで出す
    var ansNum: Int = Int.random(in: 1...100)
    // 前に書かれた数字を表示する
    @IBOutlet weak var numberLabel: UILabel!
    // 数字を入力するとこ
    @IBOutlet weak var numTextField: UITextField!
    // 入力された数字の保存先
    var writtenText = ""
    // 過去の結果を表示する
    @IBOutlet weak var resultTextView: UITextView!
    // 何回目かをカウントする
    var counts:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // resultTextViewがUITextViewDelegateを使えるようにする
         resultTextView.delegate = self
        // numTextViewFieldがUITexteViewDelegateをつかえるようする
        self.numTextField.keyboardType = UIKeyboardType.numberPad
        numTextField.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

        // Dispose of any resources that can be recreated.
    }

    
    // ボタンの関数
    @IBAction func button(_ sender: UIButton) {
        // 入った数字をwrittenTextに保存
        if let writtenText = Int(numTextField.text!)  {
            // 1〜100までの数字か確認する
            if 0 < writtenText && writtenText < 101 {
                
                if writtenText > ansNum {
                    // 回数を1増やす
                    counts += 1
                    showAlert(message: "答えは\(writtenText)より小さい値です。")
                    numberLabel.text = "\(writtenText)"
                    resultTextView.text += "[\(counts)回目]答えは\(writtenText)より小さい値です。\n"
                }
                else if writtenText < ansNum {
                    // 回数を1増やす
                    counts += 1
                    showAlert(message: "答えは\(writtenText)より大きい値です。")
                    numberLabel.text = "\(writtenText)"
                    resultTextView.text += "[\(counts)回目]答えは\(writtenText)より大きい値です。\n"
                }
                else {
                    // 回数を1増やす
                    counts += 1
                    showAlert(message: "\(counts)回目で正解しました。\n 数字をリセットします。")
                    numberLabel.text = "\(writtenText)"
                    resultTextView.text += "[\(counts)回目]答えは\(writtenText)です。\n"
                    resetNum()
                    counts = 0
                }
            }
            else {
                showAlert(message: "エラー \n 「1〜100」までの数字を入力してください。")
            }
        }
            else {
                showAlert(message: "エラー \n 「1〜100」までの数字を入力してください。")
            }
        }
        
        
    // アラートを表示する
    func showAlert(message: String){
        // アラートの作成
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        // アラートのアクション(ボタン部分の定義)
        let close = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        // 作成したalertに閉じるボタンを追加
        alert.addAction(close)
        // アラートを表示
        present(alert, animated: true, completion: nil)
    }
    
    // ランダム関数のリセット
    func resetNum(){
        ansNum = Int.random(in: 1...100)
    }
    
}

