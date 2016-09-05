//
//  StopbackgroundView.swift
//  One_Night
//
//  Created by bui manh tri on 8/23/16.
//  Copyright © 2016 TriBM. All rights reserved.
//

import UIKit

class StopbackgroundView: UIView {

    @IBOutlet var btnStop: UIButton!
    
    var view:UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    func setup(){
        view = loadViewFromNib()
        view.frame = bounds
        view.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
        
        self.btnStop.layer.cornerRadius = self.btnStop.frame.size.height/4
        self.btnStop.layer.masksToBounds = true
        self.btnStop.layer.borderWidth = 1.7
        self.btnStop.layer.borderColor = UIColor.whiteColor().CGColor
        addSubview(view)
    }
    
    func loadViewFromNib() -> UIView {
        let bundle = NSBundle(forClass:self.dynamicType)
        let nib = UINib(nibName: "StopbackgroundView", bundle:bundle)
        let view = nib.instantiateWithOwner(self, options: nil)[0] as! UIView
        return view
    }

}
