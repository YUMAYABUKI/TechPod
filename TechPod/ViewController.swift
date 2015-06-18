//
//  ViewController.swift
//  TechPod
//
//  Created by 矢吹祐真 on 2015/06/18.
//  Copyright (c) 2015年 矢吹祐真. All rights reserved.
//

import UIKit
import AVFoundation


class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var table: UITableView!
    
    var songNameArray = [String]()

    var fileNameArray = [String]()
    var imageNameArray = [String]()
    var audioPlayer : AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        table.dataSource = self
        
        songNameArray = ["カノン","エリーゼのために","g線上のアリア"]
        
        imageNameArray = ["Pachelbel.jpg","Beethoven.jpg","Bach.jpg"]
        
        fileNameArray = ["cannon","elise","aria"]
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell") as! UITableViewCell
        
        cell.textLabel?.text = songNameArray[indexPath.row]
        
        
        cell.imageView?.image = UIImage(named: imageNameArray[indexPath.row])
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        NSLog("%dが選ばれた", songNameArray[indexPath.row])
        let audioPath = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource(fileNameArray[indexPath.row], ofType: "mp3")!)
        audioPlayer.prepareToPlay()
        
        audioPlayer.play()
    }
}


