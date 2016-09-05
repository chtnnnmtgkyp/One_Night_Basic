//
//  ViewSettingContain.swift
//  One_Night
//
//  Created by bui manh tri on 7/28/16.
//  Copyright © 2016 TriBM. All rights reserved.
//

import UIKit
import RealmSwift

class ViewSettingContain: UIView {

    @IBOutlet var btnGameTimer: UIButton!
    
    var view:UIView!
    
    @IBOutlet var btnPlay: UIButton!
    
    @IBOutlet var btnSetting: UIButton!
    
    
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
        let realm1 = try! Realm()
        let gametimer = realm1.objects(GameTimerClick)
        for person in gametimer{
            if person.countClick % 2 == 0{
                self.btnGameTimer.layer.cornerRadius = 5
                self.btnGameTimer.layer.masksToBounds = true
                self.btnGameTimer.layer.borderWidth = 1.7
                self.btnGameTimer.layer.borderColor = UIColor.whiteColor().CGColor
                self.btnGameTimer.backgroundColor = UIColor.darkTextColor()
                self.btnGameTimer.setTitleColor(UIColor.whiteColor(), forState:.Normal)
                self.btnGameTimer.alpha = 0.9
            }
            else{
                self.btnGameTimer.layer.cornerRadius = 5
                self.btnGameTimer.layer.masksToBounds = true
                self.btnGameTimer.backgroundColor = UIColor.whiteColor()
                self.btnGameTimer.alpha = 0.2
                self.btnGameTimer.setTitleColor(UIColor.blackColor(), forState:.Normal)
            }
        }
        self.btnPlay.layer.cornerRadius = self.btnPlay.frame.size.height/2
        self.btnPlay.layer.masksToBounds = true
        self.btnPlay.layer.borderWidth = 1.7
        self.btnPlay.layer.borderColor = UIColor.whiteColor().CGColor
        
        self.btnSetting.layer.cornerRadius = self.btnPlay.frame.size.height/2
        self.btnSetting.layer.masksToBounds = true
        self.btnSetting.layer.borderWidth = 1.7
        self.btnSetting.layer.borderColor = UIColor.whiteColor().CGColor
        
        self.btnGameTimer.layer.cornerRadius = 5
        self.btnGameTimer.layer.masksToBounds = true
        self.btnGameTimer.layer.borderWidth = 1.7
        self.btnGameTimer.layer.borderColor = UIColor.whiteColor().CGColor
        addSubview(view)
    }
    
    func loadViewFromNib() -> UIView {
        let bundle = NSBundle(forClass:self.dynamicType)
        let nib = UINib(nibName: "ViewSettingContain", bundle:bundle)
        let view = nib.instantiateWithOwner(self, options: nil)[0] as! UIView
        return view
    }

    @IBAction func btnClickGameTimer(sender: AnyObject) {
        let realm1 = try! Realm()
        let gametimer = realm1.objects(GameTimerClick)
        try! realm1.write{
            for person in gametimer{
                person.countClick += 1
                if person.countClick % 2 == 0{
                    self.btnGameTimer.layer.cornerRadius = 5
                    self.btnGameTimer.layer.masksToBounds = true
                    self.btnGameTimer.layer.borderWidth = 1.7
                    self.btnGameTimer.layer.borderColor = UIColor.whiteColor().CGColor
                    self.btnGameTimer.backgroundColor = UIColor.darkTextColor()
                    self.btnGameTimer.setTitleColor(UIColor.whiteColor(), forState:.Normal)
                    self.btnGameTimer.alpha = 0.9
                }
                else{
                    self.btnGameTimer.layer.cornerRadius = 5
                    self.btnGameTimer.layer.masksToBounds = true
                    self.btnGameTimer.backgroundColor = UIColor.whiteColor()
                    self.btnGameTimer.alpha = 0.2
                    self.btnGameTimer.setTitleColor(UIColor.blackColor(), forState:.Normal)
                }
            }
        }
    }
    
}
