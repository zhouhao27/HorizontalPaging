//
//  ScrollOverlay.swift
//  ScrollView
//
//  Created by Zhou Hao on 08/11/16.
//  Copyright © 2016年 Zhou Hao. All rights reserved.
//

import UIKit

class ScrollOverlay: UIView {

    var scrollView : UIScrollView?
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        return scrollView
    }

}
