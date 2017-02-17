//
//  SNSViewController.swift
//  Instagram_Clone
//
//  Created by Yasuaki K on 2017/02/17.
//  Copyright © 2017年 Yasuaki Kitaoka. All rights reserved.
//

import UIKit
import Social

class SNSViewController: UIViewController {
    
    var endImage:UIImage = UIImage()
    
    @IBOutlet weak var endImageView: UIImageView!
    @IBOutlet weak var textView: UITextView!
    
    var myComposeView : SLComposeViewController!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if(textView.isFirstResponder){
            textView.resignFirstResponder()
        }
    }
    @IBAction func save(_ sender: Any) {
        
        UIImageWriteToSavedPhotosAlbum(endImageView.image!, self, nil, nil)
    
        let alertController = UIAlertController(title: "保存が完了しました",
                                                message: "OKを押してください。",
                                                preferredStyle: .actionSheet)
        
        
        let okAction:UIAlertAction = UIAlertAction(title: "OK",
                                                   style: UIAlertActionStyle.default,
                                                   handler:{
                                                    (action:UIAlertAction!) -> Void in
                                     
                                                    
        })
        
        alertController.addAction(okAction)
    present(alertController, animated: true, completion: nil)

    
    }

    @IBAction func share(_ sender: Any) {
        
        let alertController = UIAlertController(title: "SNSへ投稿",
                                                message: "投稿する場所を選択してください。",
                                                preferredStyle: .actionSheet)
        
        let cancelAction:UIAlertAction = UIAlertAction(title: "Cancel",
                                                       style: UIAlertActionStyle.cancel,
                                                       handler:{
                                                        (action:UIAlertAction!) -> Void in
                                                        print("Cancel")
        })
        
        
        let defaultAction1:UIAlertAction = UIAlertAction(title: "Twitter",
                                                         style: UIAlertActionStyle.default,
                                                         handler:{
                                                            (action:UIAlertAction!) -> Void in
                                                            self.postTwitter()
                                                            
                                                            
                                                            
        })
        
        let defaultAction2:UIAlertAction = UIAlertAction(title: "Facebook",
                                                         style: UIAlertActionStyle.default,
                                                         handler:{
                                                            (action:UIAlertAction!) -> Void in
                                                            self.postFacebook()
                                                            
                                                            
                                                            
        })
        
        let defaultAction3:UIAlertAction = UIAlertAction(title: "LINE",
                                                         style: UIAlertActionStyle.default,
                                                         handler:{
                                                            (action:UIAlertAction!) -> Void in
                                                            self.postLINE()
                                                            
                                                            
                                                            
        })
        
        
        
        alertController.addAction(defaultAction1)
        alertController.addAction(defaultAction2)
        alertController.addAction(defaultAction3)
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true, completion: nil)
        
    }
    
    func postTwitter(){
        
        myComposeView = SLComposeViewController(forServiceType: SLServiceTypeTwitter)
        
        myComposeView.setInitialText(textView.text)
        
        myComposeView.add(endImageView.image)
        
        self.present(myComposeView, animated: true, completion: nil)
        
    }
    
    func postFacebook(){
        
        myComposeView = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
        
        myComposeView.setInitialText(textView.text)
        
        myComposeView.add(endImageView.image)
        
        self.present(myComposeView, animated: true, completion: nil)
        
    }
    
    func postLINE(){
        
           let pastBoard: UIPasteboard = UIPasteboard.general
            
            pastBoard.setData(UIImageJPEGRepresentation(endImageView.image!, 0.75)!, forPasteboardType: "public.png")
            
            let lineUrlString: String = String(format: "line://msg/image/%@", pastBoard.name as CVarArg)
            
            UIApplication.shared.open(NSURL(string: lineUrlString)! as URL)
   
        
            UIApplication.shared.open(NSURL(string: lineUrlString)! as URL)
            
        
        
    }
    
    @IBAction func back(_ sender: Any) {
        
        let alertController = UIAlertController(title: "本文は破棄されてしまいます。",
                                                message: "よろしいですか",
                                                preferredStyle: .actionSheet)
        
        let cancelAction:UIAlertAction = UIAlertAction(title: "Cancel",
                                                       style: UIAlertActionStyle.cancel,
                                                       handler:{
                                                        (action:UIAlertAction!) -> Void in
                                                        print("Cancel")
        })
        
        let okAction:UIAlertAction = UIAlertAction(title: "OK",
                                                         style: UIAlertActionStyle.default,
                                                         handler:{
                                                            (action:UIAlertAction!) -> Void in
                                                            self.navigationController?.popViewController(animated: true)
                                                           
        })
        
        alertController.addAction(cancelAction)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
        
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
      
    }
  }
