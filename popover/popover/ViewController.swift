//
//  ViewController.swift
//  popover
//
//  Created by 唐三彩 on 2017/4/21.
//  Copyright © 2017年 唐三彩. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPopoverPresentationControllerDelegate {

    @IBOutlet weak var button: UIButton!
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "popover" {
            let vc = segue.destination
            vc.modalPresentationStyle = .popover
            //箭头所指区域
            vc.popoverPresentationController?.sourceView = button
            vc.popoverPresentationController?.sourceRect = button.bounds
            //        vc.popoverPresentationController?.barButtonItem = self.navigationItem.rightBarButtonItem;
            //箭头方向
            vc.popoverPresentationController?.permittedArrowDirections = .up
            //设置代理
            vc.popoverPresentationController?.delegate = self
            //弹出窗口大小
            vc.preferredContentSize = CGSize(width: 200, height: 300)
        }
        
    }
    
    //iPhone下默认是overFullScreen，需要手动设置为none，否则，是普通的present全屏显示，没有弹窗效果。iPad不需要
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }
    
}



extension ViewController {
    
    @IBAction func show(_ sender: UIBarButtonItem) {
        if  let vc = storyboard?.instantiateViewController(withIdentifier: "popoverView"){
            vc.modalPresentationStyle = .popover
            //箭头所指区域
            vc.popoverPresentationController?.barButtonItem = sender
            //箭头方向
            vc.popoverPresentationController?.permittedArrowDirections = .up
            //设置代理
            vc.popoverPresentationController?.delegate = self
            //弹出窗口大小
            vc.preferredContentSize = CGSize(width: 200, height: 300)
            
            
            present(vc, animated: true, completion: nil)
        }
          
        
//        performSegue(withIdentifier: "itempopover", sender: sender)
    }
    
}
