//
//  DoppelgangerView.swift
//  One_Night
//
//  Created by bui manh tri on 7/15/16.
//  Copyright © 2016 TriBM. All rights reserved.
//

import UIKit

class DoppelgangerView: UIView {
    
    @IBOutlet var lblText: UILabel!
    
//    @IBOutlet var Star1: UIImageView!
//    
//    @IBOutlet var Small1: UIImageView!
//    
//    @IBOutlet var Small2: UIImageView!
//    
//    @IBOutlet var Star2: UIImageView!
//    
//    @IBOutlet var Small3: UIImageView!
//    
//    @IBOutlet var Small4: UIImageView!
    
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
        self.lblText.lineBreakMode = NSLineBreakMode.ByWordWrapping
        self.lblText.numberOfLines = 7
//        UIView.animateWithDuration(2, delay: 0, options: [.Repeat, .Autoreverse], animations: { () -> Void in
//            self.Star1.frame.origin.y += 100
//            }, completion: { finished in
//                
//                UIView.animateWithDuration(2, delay: 0, options: [.Repeat, .Autoreverse], animations: { () -> Void in
//                    self.Star1.frame.origin.y -= 100
//                    }, completion: nil)
//        })
//        UIView.animateWithDuration(2, delay: 0.1, options: [.Repeat, .Autoreverse], animations: { () -> Void in
//            self.Small1.frame.origin.y += 100
//            self.Small1.alpha = 0
//            }, completion: { finished in
//                
//                UIView.animateWithDuration(2, delay: 0, options: [.Repeat, .Autoreverse], animations: { () -> Void in
//                    self.Small1.frame.origin.y -= 100
//                    self.Small1.alpha = 1
//                    }, completion: nil)
//        })
//        UIView.animateWithDuration(2, delay: 0.2, options: [.Repeat, .Autoreverse], animations: { () -> Void in
//            self.Small2.frame.origin.y += 100
//            self.Small2.alpha = 0
//            }, completion: { finished in
//                
//                UIView.animateWithDuration(2, delay: 0, options: [.Repeat, .Autoreverse], animations: { () -> Void in
//                    self.Small2.frame.origin.y -= 100
//                    self.Small2.alpha = 1
//                    }, completion: nil)
//        })
//        
//        UIView.animateWithDuration(2, delay: 1, options: [.Repeat, .Autoreverse], animations: { () -> Void in
//            self.Star2.frame.origin.y += 100
//            }, completion: { finished in
//                
//                UIView.animateWithDuration(2, delay: 0, options: [.Repeat, .Autoreverse], animations: { () -> Void in
//                    self.Star2.frame.origin.y -= 100
//                    }, completion: nil)
//        })
//        UIView.animateWithDuration(2, delay: 1.1, options: [.Repeat, .Autoreverse], animations: { () -> Void in
//            self.Small3.frame.origin.y += 100
//            self.Small3.alpha = 0
//            }, completion: { finished in
//                
//                UIView.animateWithDuration(2, delay: 0, options: [.Repeat, .Autoreverse], animations: { () -> Void in
//                    self.Small3.frame.origin.y -= 100
//                    self.Small3.alpha = 1
//                    }, completion: nil)
//        })
//        UIView.animateWithDuration(2, delay: 1.2, options: [.Repeat, .Autoreverse], animations: { () -> Void in
//            self.Small4.frame.origin.y += 100
//            self.Small4.alpha = 0
//            }, completion: { finished in
//                
//                UIView.animateWithDuration(2, delay: 0, options: [.Repeat, .Autoreverse], animations: { () -> Void in
//                    self.Small4.frame.origin.y -= 100
//                    self.Small4.alpha = 1
//                    }, completion: nil)
//        })
        addSubview(view)
    }
    
    func loadViewFromNib() -> UIView {
        let bundle = NSBundle(forClass:self.dynamicType)
        let nib = UINib(nibName: "DoppelgangerView", bundle:bundle)
        let view = nib.instantiateWithOwner(self, options: nil)[0] as! UIView
        return view
    }
    
    
    
}
