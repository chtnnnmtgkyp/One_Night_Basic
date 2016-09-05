//
//  RoleTimerView.swift
//  One_Night
//
//  Created by bui manh tri on 7/11/16.
//  Copyright © 2016 TriBM. All rights reserved.
//

import UIKit
import RealmSwift

class RoleTimerView: UIView {

    
    @IBOutlet var complexRoles: UIButton!
    
    @IBOutlet var upSeconds: UIButton!
    
    @IBOutlet var downSeconds: UIButton!
    
    @IBOutlet var lblSeconds: UILabel!
    
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
        let realm = try! Realm()
        let allPeople = realm.objects(TimeRoles)
        if allPeople.count == 0 {
            self.addValue()
        }else{
            self.updateValue()
            self.updateValue2()
        }
        addSubview(view)
    }
    
    func loadViewFromNib() -> UIView {
        let bundle = NSBundle(forClass:self.dynamicType)
        let nib = UINib(nibName: "RoleTimerView", bundle:bundle)
        let view = nib.instantiateWithOwner(self, options: nil)[0] as! UIView
        return view
    }
    
    func addValue(){
        let seconds = TimeRoles()
        let timeRoles = TimeRolesButton()
        seconds.changeValue = 0
        seconds.Seconds = 10
        timeRoles.changeValue = 0
        timeRoles.countClick = 0
        let realm = try! Realm()
        try! realm.write{
            realm.add(seconds, update: true)
            realm.add(timeRoles, update: true)
            print("Added \(seconds.changeValue) to Realm")
            print("aaa")
        }
        
        self.complexRoles.layer.cornerRadius = self.complexRoles.frame.size.height/3
        self.complexRoles.layer.masksToBounds = true
        self.complexRoles.layer.borderWidth = 1.7
        self.complexRoles.layer.borderColor = UIColor.whiteColor().CGColor

    }
    
    
    
    func updateValue(){
        let realm = try! Realm()
        let allPeople = realm.objects(TimeRolesButton)
        try! realm.write{
            for person in allPeople{
                print("Added \(person.countClick) to Realm")
                if(person.countClick % 2 == 0){
                    self.complexRoles.layer.cornerRadius = self.complexRoles.frame.size.height/3
                    self.complexRoles.layer.masksToBounds = true
                    self.complexRoles.layer.borderWidth = 1.7
                    self.complexRoles.layer.borderColor = UIColor.whiteColor().CGColor
                }else{
                    self.complexRoles.layer.cornerRadius = self.complexRoles.frame.size.height/3
                    self.complexRoles.layer.masksToBounds = true
                    self.complexRoles.layer.borderWidth = 1.7
                    self.complexRoles.layer.borderColor = UIColor.blackColor().CGColor
                }
            }
        }
        
    }
    
    func updateValue2(){
        let realm = try! Realm()
        let allPeople = realm.objects(TimeRoles)
        try! realm.write{
            for person in allPeople{
                print("Added \(person.Seconds) to Realm")
                self.lblSeconds.text = String(person.Seconds)
            }
        }
    }
    
    @IBAction func UpSeconds(sender: AnyObject) {
        let realm1 = try! Realm()
        let seconds = realm1.objects(TimeRoles)
        try! realm1.write{
            for person in seconds{
                person.Seconds += 1
                if person.Seconds > 30{
                    person.Seconds = 30
                    return
                }
                self.lblSeconds.text = String(person.Seconds)
                print(person.Seconds)
            }
        }
    }
    
    
    @IBAction func DownSeconds(sender: AnyObject) {
        let realm1 = try! Realm()
        let seconds = realm1.objects(TimeRoles)
        try! realm1.write{
            for person in seconds{
                person.Seconds -= 1
                if person.Seconds < 0{
                    person.Seconds = 0
                    return
                }
                self.lblSeconds.text = String(person.Seconds)
                print(person.Seconds)
            }
        }
    }
    
    @IBAction func RolesTime(sender: AnyObject) {
        let realm = try! Realm()
        let timeroles = realm.objects(TimeRolesButton)
        try! realm.write{
            for person in timeroles{
                person.countClick += 1
                print("Added \(person.countClick) to Realm")
                if(person.countClick % 2 == 0){
                    self.complexRoles.layer.borderWidth = 1.7
                    self.complexRoles.layer.borderColor = UIColor.whiteColor().CGColor
                }else{
                    self.complexRoles.layer.borderWidth = 1.7
                    self.complexRoles.layer.borderColor = UIColor.blackColor().CGColor
                }
            }
        }
    }
    

}
