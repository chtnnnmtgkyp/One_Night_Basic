//
//  OtherView.swift
//  One_Night
//
//  Created by bui manh tri on 7/11/16.
//  Copyright © 2016 TriBM. All rights reserved.
//

import UIKit
import RealmSwift

class OtherView: UIView {

    var view:UIView!
    
    @IBOutlet var btnLoneWolf: UIButton!
    
    @IBOutlet var btnMoveYourCard: UIButton!
    
    @IBOutlet var btnExpertMode: UIButton!
    
    @IBOutlet var btnVerboseDoppelganger: UIButton!
    
    
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
        let allPeople = realm.objects(LoneWolf)
        if allPeople.count == 0 {
            self.addValue()
        }else{
            self.updateValue()
            self.updateValue2()
            self.updateValue3()
            self.updateValue4()
        }
        addSubview(view)
    }
    
    func addValue(){
        let lonewolf = LoneWolf()
        let moveyourcard = MoveYourCard()
        let expertmode = ExpertMode()
        let verbosedoppelganger = VerboseDoppelganger()
        lonewolf.countClick = 0
        moveyourcard.countClick = 0
        expertmode.countClick = 0
        verbosedoppelganger.countClick = 0
        let realm = try! Realm()
        try! realm.write{
            realm.add(expertmode, update: true)
            realm.add(lonewolf, update: true)
            realm.add(moveyourcard, update: true)
            realm.add(verbosedoppelganger, update: true)
        }
        self.layoutIfNeeded()
        self.btnLoneWolf.layer.cornerRadius = self.btnLoneWolf.frame.size.height/4
        self.btnLoneWolf.layer.masksToBounds = true
        self.btnLoneWolf.layer.borderWidth = 1.5
        self.btnLoneWolf.layer.borderColor = UIColor.whiteColor().CGColor
        
        self.btnMoveYourCard.layer.cornerRadius = self.btnMoveYourCard.frame.size.height/4
        self.btnMoveYourCard.layer.masksToBounds = true
        self.btnMoveYourCard.layer.borderWidth = 1.5
        self.btnMoveYourCard.layer.borderColor = UIColor.whiteColor().CGColor
        
        self.btnExpertMode.layer.cornerRadius = self.btnExpertMode.frame.size.height/4
        self.btnExpertMode.layer.masksToBounds = true
        self.btnExpertMode.layer.borderWidth = 1.5
        self.btnExpertMode.layer.borderColor = UIColor.whiteColor().CGColor
        
        self.btnVerboseDoppelganger.layer.cornerRadius = self.btnVerboseDoppelganger.frame.size.height/4
        self.btnVerboseDoppelganger.layer.masksToBounds = true
        self.btnVerboseDoppelganger.layer.borderWidth = 1.5
        self.btnVerboseDoppelganger.layer.borderColor = UIColor.whiteColor().CGColor
        
    }
    
    func updateValue(){
        let realm = try! Realm()
        let allPeople = realm.objects(LoneWolf)
        try! realm.write{
            for person in allPeople{
                print("Added \(person.countClick) to Realm")
                if(person.countClick % 2 == 0){
                    self.btnLoneWolf.layer.borderWidth = 1.5
                    self.btnLoneWolf.layer.borderColor = UIColor.whiteColor().CGColor
                    self.btnLoneWolf.layer.cornerRadius = self.btnLoneWolf.frame.size.height/4
                    self.btnLoneWolf.layer.masksToBounds = true
                }else{
                    self.btnLoneWolf.layer.borderWidth = 1.5
                    self.btnLoneWolf.layer.borderColor = UIColor.blackColor().CGColor
                    self.btnLoneWolf.layer.cornerRadius = self.btnLoneWolf.frame.size.height/4
                    self.btnLoneWolf.layer.masksToBounds = true
                }
            }
        }
        
    }
    
    func updateValue2(){
        let realm = try! Realm()
        let allPeople = realm.objects(MoveYourCard)
        try! realm.write{
            for person in allPeople{
                print("Added \(person.countClick) to Realm")
                if(person.countClick % 2 == 0){
                    self.btnMoveYourCard.layer.borderWidth = 1.5
                    self.btnMoveYourCard.layer.borderColor = UIColor.whiteColor().CGColor
                    self.btnMoveYourCard.layer.cornerRadius = self.btnMoveYourCard.frame.size.height/4
                    self.btnMoveYourCard.layer.masksToBounds = true
                }else{
                    self.btnMoveYourCard.layer.borderWidth = 1.5
                    self.btnMoveYourCard.layer.borderColor = UIColor.blackColor().CGColor
                    self.btnMoveYourCard.layer.cornerRadius = self.btnMoveYourCard.frame.size.height/4
                    self.btnMoveYourCard.layer.masksToBounds = true
                }
            }
        }
        
    }
    
    func updateValue3(){
        let realm = try! Realm()
        let allPeople = realm.objects(ExpertMode)
        try! realm.write{
            for person in allPeople{
                print("Added \(person.countClick) to Realm")
                if(person.countClick % 2 == 0){
                    self.btnExpertMode.layer.borderWidth = 1.5
                    self.btnExpertMode.layer.borderColor = UIColor.whiteColor().CGColor
                    self.btnExpertMode.layer.cornerRadius = self.btnExpertMode.frame.size.height/4
                    self.btnExpertMode.layer.masksToBounds = true
                }else{
                    self.btnExpertMode.layer.borderWidth = 1.5
                    self.btnExpertMode.layer.borderColor = UIColor.blackColor().CGColor
                    self.btnExpertMode.layer.cornerRadius = self.btnExpertMode.frame.size.height/4
                    self.btnExpertMode.layer.masksToBounds = true
                }
            }
        }
    }
    
    func updateValue4(){
        let realm = try! Realm()
        let allPeople = realm.objects(VerboseDoppelganger)
        try! realm.write{
            for person in allPeople{
                print("Added \(person.countClick) to Realm")
                if(person.countClick % 2 == 0){
                    self.btnVerboseDoppelganger.layer.borderWidth = 1.5
                    self.btnVerboseDoppelganger.layer.borderColor = UIColor.whiteColor().CGColor
                    self.btnVerboseDoppelganger.layer.cornerRadius = self.btnVerboseDoppelganger.frame.size.height/4
                    self.btnVerboseDoppelganger.layer.masksToBounds = true
                }else{
                    self.btnVerboseDoppelganger.layer.borderWidth = 1.5
                    self.btnVerboseDoppelganger.layer.borderColor = UIColor.blackColor().CGColor
                    self.btnVerboseDoppelganger.layer.cornerRadius = self.btnVerboseDoppelganger.frame.size.height/4
                    self.btnVerboseDoppelganger.layer.masksToBounds = true
                }
            }
        }
        
    }
    
    func loadViewFromNib() -> UIView {
        let bundle = NSBundle(forClass:self.dynamicType)
        let nib = UINib(nibName: "OtherView", bundle:bundle)
        let view = nib.instantiateWithOwner(self, options: nil)[0] as! UIView
        return view
    }
    
    @IBAction func clickLoneWolf(sender: AnyObject) {
        let realm = try! Realm()
        let lonewolf = realm.objects(LoneWolf)
        try! realm.write{
            for person in lonewolf{
                person.countClick += 1
                print("Added \(person.countClick) to Realm")
                if(person.countClick % 2 == 0){
                    self.btnLoneWolf.layer.borderWidth = 1.5
                    self.btnLoneWolf.layer.borderColor = UIColor.whiteColor().CGColor
                }else{
                    self.btnLoneWolf.layer.borderWidth = 1.5
                    self.btnLoneWolf.layer.borderColor = UIColor.blackColor().CGColor
                }
            }
        }
    }
    
    @IBAction func clickMoveYourCard(sender: AnyObject) {
        let realm = try! Realm()
        let move = realm.objects(MoveYourCard)
        try! realm.write{
            for person in move{
                person.countClick += 1
                print("Added \(person.countClick) to Realm")
                if(person.countClick % 2 == 0){
                    self.btnMoveYourCard.layer.borderWidth = 1.5
                    self.btnMoveYourCard.layer.borderColor = UIColor.whiteColor().CGColor
                }else{
                    self.btnMoveYourCard.layer.borderWidth = 1.5
                    self.btnMoveYourCard.layer.borderColor = UIColor.blackColor().CGColor
                }
            }
        }
    }
    
    @IBAction func clickExpertMode(sender: AnyObject) {
        let realm = try! Realm()
        let expert = realm.objects(ExpertMode)
        try! realm.write{
            for person in expert{
                person.countClick += 1
                print("Added \(person.countClick) to Realm")
                if(person.countClick % 2 == 0){
                    self.btnExpertMode.layer.borderWidth = 1.5
                    self.btnExpertMode.layer.borderColor = UIColor.whiteColor().CGColor
                }else{
                    self.btnExpertMode.layer.borderWidth = 1.5
                    self.btnExpertMode.layer.borderColor = UIColor.blackColor().CGColor
                }
            }
        }
    }
    
    @IBAction func clickVerboseDoppelganger(sender: AnyObject) {
        let realm = try! Realm()
        let verbose = realm.objects(VerboseDoppelganger)
        try! realm.write{
            for person in verbose{
                person.countClick += 1
                print("Added \(person.countClick) to Realm")
                if(person.countClick % 2 == 0){
                    self.btnVerboseDoppelganger.layer.borderWidth = 1.5
                    self.btnVerboseDoppelganger.layer.borderColor = UIColor.whiteColor().CGColor
                }else{
                    self.btnVerboseDoppelganger.layer.borderWidth = 1.5
                    self.btnVerboseDoppelganger.layer.borderColor = UIColor.blackColor().CGColor
                }
            }
        }
    }
    

}
