//
//  ViewController.swift
//  ScrollView
//
//  Created by Zhou Hao on 08/11/16.
//  Copyright © 2016年 Zhou Hao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var overlay: ScrollOverlay!
    @IBOutlet weak var scrollView: UIScrollView!

    var colors = [
        UIColor.blue,
        UIColor.green,
        UIColor.orange,
        UIColor.magenta
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.scrollView.clipsToBounds = false
        self.overlay.scrollView = self.scrollView
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let w : CGFloat = 150.0
        let h : CGFloat = 150.0
        let scrollViewWidth = self.scrollView.frame.width
        
        var i = 0
        for color in colors {
            
            let x = (scrollViewWidth - w) / 2 + CGFloat(i) * scrollViewWidth
            let y = self.scrollView.frame.height / 2 - h / 2
            
            let view = UIView(frame: CGRect(x:x,y:y,width:w,height:h))
            view.backgroundColor = color
            self.scrollView.addSubview(view)
            i += 1
        }
        self.scrollView.contentSize = CGSize(width: CGFloat(colors.count)*scrollViewWidth, height: self.scrollView.frame.height)
    }


}

