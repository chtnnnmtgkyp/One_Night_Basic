//
//  GameTimerView.swift
//  One_Night
//
//  Created by bui manh tri on 7/11/16.
//  Copyright © 2016 TriBM. All rights reserved.
//

import UIKit
import RealmSwift

class GameTimerView: UIView {

    @IBOutlet var btnOneMinute: UIButton!
    
    @IBOutlet var btn30Seconds: UIButton!
    
    @IBOutlet var btnUpMinute: UIButton!
    
    @IBOutlet var btnDownMinute: UIButton!
    
    @IBOutlet var lblMinute: UILabel!
    
    
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
        let allPeople = realm.objects(GameTimer)
        if allPeople.count == 0 {
            self.addValue()
        }else{
            self.updateValue()
            self.updateValue2()
            self.updateValue3()
        }
        addSubview(view)
    }
    
    func loadViewFromNib() -> UIView {
        let bundle = NSBundle(forClass:self.dynamicType)
        let nib = UINib(nibName: "GameTimerView", bundle:bundle)
        let view = nib.instantiateWithOwner(self, options: nil)[0] as! UIView
        return view
    }
    
    func addValue(){
        let minutes = GameTimer()
        let game1 = GameTimer1()
        let game30 = GameTimer30()
        minutes.Minutes = 5
        game1.countClick = 0
        game30.countClick = 0
        let realm = try! Realm()
        try! realm.write{
            realm.add(minutes, update: true)
            realm.add(game1, update: true)
            realm.add(game30, update: true)
        }
        self.btnOneMinute.layer.cornerRadius = self.btnOneMinute.frame.size.height/3
        self.btnOneMinute.layer.masksToBounds = true
        self.btnOneMinute.layer.borderWidth = 1.7
        self.btnOneMinute.layer.borderColor = UIColor.whiteColor().CGColor
        
        self.btn30Seconds.layer.cornerRadius = self.btn30Seconds.frame.size.height/3
        self.btn30Seconds.layer.masksToBounds = true
        self.btn30Seconds.layer.borderWidth = 1.7
        self.btn30Seconds.layer.borderColor = UIColor.whiteColor().CGColor
    
    }
    
    func updateValue(){
        let realm = try! Realm()
        let allPeople = realm.objects(GameTimer1)
        try! realm.write{
            for person in allPeople{
                print("Added \(person.countClick) to Realm")
                if(person.countClick % 2 == 0){
                    self.btnOneMinute.layer.cornerRadius = self.btnOneMinute.frame.size.height/3
                    self.btnOneMinute.layer.masksToBounds = true
                    self.btnOneMinute.layer.borderWidth = 1.7
                    self.btnOneMinute.layer.borderColor = UIColor.whiteColor().CGColor
                }else{
                    self.btnOneMinute.layer.cornerRadius = self.btnOneMinute.frame.size.height/3
                    self.btnOneMinute.layer.masksToBounds = true
                    self.btnOneMinute.layer.borderWidth = 1.7
                    self.btnOneMinute.layer.borderColor = UIColor.blackColor().CGColor
                }
            }
        }
        
    }
    
    func updateValue2(){
        let realm = try! Realm()
        let allPeople = realm.objects(GameTimer30)
        try! realm.write{
            for person in allPeople{
                print("Added \(person.countClick) to Realm")
                if(person.countClick % 2 == 0){
                    self.btn30Seconds.layer.cornerRadius = self.btn30Seconds.frame.size.height/3
                    self.btn30Seconds.layer.masksToBounds = true
                    self.btn30Seconds.layer.borderWidth = 1.7
                    self.btn30Seconds.layer.borderColor = UIColor.whiteColor().CGColor
                }else{
                    self.btn30Seconds.layer.cornerRadius = self.btn30Seconds.frame.size.height/3
                    self.btn30Seconds.layer.masksToBounds = true
                    self.btn30Seconds.layer.borderWidth = 1.7
                    self.btn30Seconds.layer.borderColor = UIColor.blackColor().CGColor
                }
            }
        }
        
    }

    func updateValue3(){
        let realm = try! Realm()
        let allPeople = realm.objects(GameTimer)
        try! realm.write{
            for person in allPeople{
                self.lblMinute.text = String(person.Minutes)
            }
        }
    }
    
    @IBAction func Up(sender: AnyObject) {
        let realm1 = try! Realm()
        let minutes = realm1.objects(GameTimer)
        try! realm1.write{
            for person in minutes{
                person.Minutes += 1
                if person.Minutes > 30{
                    person.Minutes = 30
                    return
                }
                self.lblMinute.text = String(person.Minutes)
                print(person.Minutes)
            }
        }
    }
    
    @IBAction func Down(sender: AnyObject) {
        let realm1 = try! Realm()
        let minutes = realm1.objects(GameTimer)
        try! realm1.write{
            for person in minutes{
                person.Minutes -= 1
                if person.Minutes < 1{
                    person.Minutes = 1
                    return
                }
                self.lblMinute.text = String(person.Minutes)
                print(person.Minutes)
            }
        }
    }

    @IBAction func click1(sender: AnyObject) {
        let realm = try! Realm()
        let gameTimer1 = realm.objects(GameTimer1)
        try! realm.write{
            for person in gameTimer1{
                person.countClick += 1
                print("Added \(person.countClick) to Realm")
                if(person.countClick % 2 == 0){
                    self.btnOneMinute.layer.borderWidth = 1.7
                    self.btnOneMinute.layer.borderColor = UIColor.whiteColor().CGColor
                }else{
                    self.btnOneMinute.layer.borderWidth = 1.7
                    self.btnOneMinute.layer.borderColor = UIColor.blackColor().CGColor
                }
            }
        }
    }
    
    @IBAction func click30(sender: AnyObject) {
        let realm = try! Realm()
        let gameTimer30 = realm.objects(GameTimer30)
        try! realm.write{
            for person in gameTimer30{
                person.countClick += 1
                print("Added \(person.countClick) to Realm")
                if(person.countClick % 2 == 0){
                    self.btn30Seconds.layer.borderWidth = 1.7
                    self.btn30Seconds.layer.borderColor = UIColor.whiteColor().CGColor
                }else{
                    self.btn30Seconds.layer.borderWidth = 1.7
                    self.btn30Seconds.layer.borderColor = UIColor.blackColor().CGColor
                }
            }
        }
    }
    
    
    
}
