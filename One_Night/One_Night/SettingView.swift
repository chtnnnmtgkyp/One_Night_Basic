//
//  SettingView.swift
//  One_Night
//
//  Created by bui manh tri on 7/10/16.
//  Copyright © 2016 TriBM. All rights reserved.
//

import UIKit
import RealmSwift

class SettingView: UIView {
    
    var i:Int = 0
    @IBOutlet var btnEditNarration: UIButton!
    var view:UIView!
    
    @IBOutlet var btnEditGameTimer: UIButton!
    
    @IBOutlet var btnEditRoleTimer: UIButton!
    
    @IBOutlet var btnEditOther: UIButton!
    
    @IBOutlet var btnLayoutNarration: UIButton!
    
    @IBOutlet var btnLayoutGameTimer: UIButton!
    
    @IBOutlet var btnLayoutRoleTimer: UIButton!
    
    @IBOutlet var btnLayoutOther: UIButton!
    
    @IBOutlet var lblTimeRoles: UILabel!
    
    @IBOutlet var lblX2: UILabel!
    
    @IBOutlet var lblGameTimer: UILabel!
    
    @IBOutlet var lbl1mins: UILabel!
    
    @IBOutlet var lbl30seconds: UILabel!
    
    var Viewxx:ViewController = ViewController()
    
    @IBOutlet var lblVol: UILabel!
    
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
        
        self.btnEditNarration.layer.cornerRadius = self.btnEditNarration.frame.size.height/3
        self.btnEditNarration.layer.masksToBounds = true
        self.btnEditNarration.layer.borderWidth = 1.7
        
        let realm = try! Realm()
        let allPeople = realm.objects(NarrationButton)
        let allPeople1 = realm.objects(ChangeTimeRoles)
        let allPeople2 = realm.objects(TimeRolesButton)
        let allPeople3 = realm.objects(VolumeBackGround)
        let allPeople4 = realm.objects(GameTimerClick)
        let allPeople5 = realm.objects(GameTimer)
        let allPeople6 = realm.objects(GameTimer1)
        let allPeople7 = realm.objects(GameTimer30)
        
        for person in allPeople4 {
            if person.countClick % 2 == 0{
                self.btnLayoutGameTimer.layer.borderWidth = 1.7
                self.btnLayoutGameTimer.layer.borderColor = UIColor.whiteColor().CGColor
            }else{
                self.btnLayoutGameTimer.layer.borderWidth = 1.7
                self.btnLayoutGameTimer.layer.borderColor = UIColor.blackColor().CGColor
            }
        }
        
        for person in allPeople2{
            if person.countClick % 2 == 0{
                self.lblX2.text = ",X2"
            }else{
                self.lblX2.text = ""
            }
        }
        
        for person in allPeople1{
            self.lblTimeRoles.text = "\(String(person.Seconds)) seconds"
            
        }
        
        for person in allPeople3{
            self.lblVol.text = "Male, Vol \(person.Volume)"
            
        }
        
        for person in allPeople5{
            self.lblGameTimer.text = "\(String(person.Minutes)) mins"
        }
        
        for person in allPeople6{
            if person.countClick % 2 == 0{
                self.lbl1mins.text = "1mins"
            }else{
                self.lbl1mins.text = ""
            }
        }
        
        for person in allPeople7{
            if person.countClick % 2 == 0{
                self.lbl30seconds.text = "30secs"
            }else{
                self.lbl30seconds.text = ""
            }
        }
        
        if allPeople.count == 0 {
            self.addValue()
        }else{
            self.updateValue()
            self.updateValue2()
            self.updateValue3()
            self.updateValue4()
        }
        //self.queryPeople()
        self.btnEditGameTimer.layer.cornerRadius = self.btnEditGameTimer.frame.size.height/3
        self.btnEditGameTimer.layer.masksToBounds = true
        self.btnEditGameTimer.layer.borderWidth = 1.7
        
        self.btnEditRoleTimer.layer.cornerRadius = self.btnEditRoleTimer.frame.size.height/3
        self.btnEditRoleTimer.layer.masksToBounds = true
        self.btnEditRoleTimer.layer.borderWidth = 1.7
        
        self.btnEditGameTimer.layer.cornerRadius = self.btnEditGameTimer.frame.size.height/3
        self.btnEditGameTimer.layer.masksToBounds = true
        self.btnEditGameTimer.layer.borderWidth = 1.7
        
        self.btnEditOther.layer.cornerRadius = self.btnEditOther.frame.size.height/3
        self.btnEditOther.layer.masksToBounds = true
        self.btnEditOther.layer.borderWidth = 1.7
        
        addSubview(view)
    }
    
    func addValue(){
        let narration = NarrationButton()
        let roletimer = TimeRolesButtonSetting()
        narration.countClick = 0
        narration.changeValue = 0
        roletimer.countClick = 0
        roletimer.changeValue = 0
        let realm = try! Realm()
        try! realm.write{
            realm.add(narration, update: true)
            realm.add(roletimer, update: true)
            
        }
        self.btnLayoutNarration.layer.borderWidth = 1.7
        self.btnLayoutNarration.layer.borderColor = UIColor.whiteColor().CGColor
        self.btnLayoutRoleTimer.layer.borderWidth = 1.7
        self.btnLayoutRoleTimer.layer.borderColor = UIColor.whiteColor().CGColor
        self.btnLayoutGameTimer.layer.borderWidth = 1.7
        self.btnLayoutGameTimer.layer.borderColor = UIColor.whiteColor().CGColor
        self.btnLayoutOther.layer.borderWidth = 1.7
        self.btnLayoutOther.layer.borderColor = UIColor.whiteColor().CGColor
    }
    
    func updateValue(){
        let realm = try! Realm()
        let allPeople = realm.objects(NarrationButton)
        try! realm.write{
            for person in allPeople{
                print("Added \(person.countClick) to Realm")
                if(person.countClick % 2 == 0){
                    self.btnLayoutNarration.layer.borderWidth = 1.7
                    self.btnLayoutNarration.layer.borderColor = UIColor.whiteColor().CGColor
                    self.btnLayoutNarration.alpha = 1
                }else{
                    self.btnLayoutNarration.layer.borderWidth = 1.7
                    self.btnLayoutNarration.layer.borderColor = UIColor.blackColor().CGColor
                    self.btnLayoutNarration.alpha = 0.6
                }
            }
        }
    }
    
    func updateValue2(){
        let realm = try! Realm()
        let allPeople = realm.objects(TimeRolesButtonSetting)
        try! realm.write{
            for person in allPeople{
                print("Added \(person.countClick) to Realm")
                if(person.countClick % 2 == 0){
                    self.btnLayoutRoleTimer.layer.borderWidth = 1.7
                    self.btnLayoutRoleTimer.layer.borderColor = UIColor.whiteColor().CGColor
                    self.btnLayoutRoleTimer.alpha = 1
                }else{
                    self.btnLayoutRoleTimer.layer.borderWidth = 1.7
                    self.btnLayoutRoleTimer.layer.borderColor = UIColor.blackColor().CGColor
                    self.btnLayoutRoleTimer.alpha = 0.6
                }
            }
        }
    }
    
    func updateValue4(){
        let realm = try! Realm()
        let allPeople = realm.objects(GameTimerClick)
        try! realm.write{
            for person in allPeople{
                print("Added \(person.countClick) to Realm")
                if(person.countClick % 2 == 0){
                    self.btnLayoutGameTimer.layer.borderWidth = 1.7
                    self.btnLayoutGameTimer.layer.borderColor = UIColor.whiteColor().CGColor
                    self.btnLayoutGameTimer.alpha = 1
                }else{
                    self.btnLayoutGameTimer.layer.borderWidth = 1.7
                    self.btnLayoutGameTimer.layer.borderColor = UIColor.blackColor().CGColor
                    self.btnLayoutGameTimer.alpha = 0.6
                }
            }
        }
    }
    
    func updateValue3(){
        self.btnLayoutOther.layer.borderWidth = 1.7
        self.btnLayoutOther.layer.borderColor = UIColor.whiteColor().CGColor
    }
    
    func loadViewFromNib() -> UIView {
        let bundle = NSBundle(forClass:self.dynamicType)
        let nib = UINib(nibName: "SettingView", bundle:bundle)
        let view = nib.instantiateWithOwner(self, options: nil)[0] as! UIView
        return view
    }
    
    @IBAction func ClickNarration(sender: AnyObject) {
        let realm = try! Realm()
        let allPeople = realm.objects(NarrationButton)
        try! realm.write{
            for person in allPeople{
                person.countClick += 1
                print("Added \(person.countClick) to Realm")
                if(person.countClick % 2 == 0){
                    self.btnLayoutNarration.layer.borderWidth = 1.7
                    self.btnLayoutNarration.layer.borderColor = UIColor.whiteColor().CGColor
                    self.btnLayoutNarration.alpha = 1
                }else{
                    self.btnLayoutNarration.layer.borderWidth = 1.7
                    self.btnLayoutNarration.layer.borderColor = UIColor.blackColor().CGColor
                    self.btnLayoutNarration.alpha = 0.6
                }
            }
        }
        
    }
    
    
    @IBAction func clickRoleTimer(sender: AnyObject) {
        let realm = try! Realm()
        let allPeople = realm.objects(TimeRolesButtonSetting)
        try! realm.write{
            for person in allPeople{
                person.countClick += 1
                print("Added \(person.countClick) to Realm")
                if(person.countClick % 2 == 0){
                    self.btnLayoutRoleTimer.layer.borderWidth = 1.7
                    self.btnLayoutRoleTimer.layer.borderColor = UIColor.whiteColor().CGColor
                    self.btnLayoutRoleTimer.alpha = 1
                }else{
                    self.btnLayoutRoleTimer.layer.borderWidth = 1.7
                    self.btnLayoutRoleTimer.layer.borderColor = UIColor.blackColor().CGColor
                    self.btnLayoutRoleTimer.alpha = 0.6
                }
            }
        }
    }
  
    @IBAction func clickGameTimer(sender: AnyObject) {
        let realm = try! Realm()
        let allPeople = realm.objects(GameTimerClick)
        try! realm.write{
            for person in allPeople{
                person.countClick += 1
                print("Added \(person.countClick) to Realm")
                if(person.countClick % 2 == 0){
                    self.btnLayoutGameTimer.layer.borderWidth = 1.7
                    self.btnLayoutGameTimer.layer.borderColor = UIColor.whiteColor().CGColor
                    self.btnLayoutGameTimer.alpha = 1
                }else{
                    self.btnLayoutGameTimer.layer.borderWidth = 1.7
                    self.btnLayoutGameTimer.layer.borderColor = UIColor.blackColor().CGColor
                    self.btnLayoutGameTimer.alpha = 0.6
                }
            }
        }
    }
    
}
