//
//  SecondViewController.swift
//  ScrollView
//
//  Created by Zhou Hao on 08/11/16.
//  Copyright © 2016年 Zhou Hao. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    
    let w : CGFloat = 150.0
    let h : CGFloat = 150.0
    let padding : CGFloat = 50.0

    var colors = [
        UIColor.blue,
        UIColor.green,
        UIColor.orange,
        UIColor.magenta
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.scrollView.delegate = self
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let scrollViewWidth = self.scrollView.frame.width
        
        var i = 0
        for color in colors {
            
            let x = (scrollViewWidth - w) / 2 + CGFloat(i) * (padding + w)
            let y = self.scrollView.frame.height / 2 - h / 2
            
            let view = UIView(frame: CGRect(x:x,y:y,width:w,height:h))
            view.backgroundColor = color
            self.scrollView.addSubview(view)
            
            i += 1
        }
        
        let contentW = (scrollViewWidth - w)/2 + CGFloat(colors.count)*(padding + w)
        self.scrollView.contentSize = CGSize(width: contentW, height: self.scrollView.frame.height)

    }

    func scrollViewWillBeginDecelerating(_ scrollView: UIScrollView) {
        
        setContentOffset(scrollView: scrollView)
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        
        guard !decelerate else {
            return
        }
        
        setContentOffset(scrollView: scrollView)
    }
    
    func setContentOffset(scrollView: UIScrollView) {
        
        let scrollViewWidth = scrollView.frame.width
        
        let numOfItems = self.colors.count
        let stopOver = (scrollView.contentSize.width - (scrollViewWidth - w)/2) / CGFloat(numOfItems)
        let x = round(scrollView.contentOffset.x / stopOver) * stopOver
        
        guard x >= 0 && x <= scrollView.contentSize.width else {
            return
        }
        
        scrollView.setContentOffset(CGPoint(x:x, y:scrollView.contentOffset.y), animated: true)
    }
    
}
