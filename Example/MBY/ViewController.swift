//
//  ViewController.swift
//  MBY
//
//  Created by yassir ramdani on 15/04/2018.
//  Copyright © 2018 yassir ramdani. All rights reserved.
//

import UIKit
extension UIColor{
    static func rgba(r:Int, g: Int, b : Int, a:Float) -> UIColor{
        return UIColor(red: CGFloat(r)/255, green: CGFloat(g)/255, blue: CGFloat(b)/255, alpha: CGFloat(a))
    }
}
class ViewController: UIViewController {
    
    let btn = MBY(position: .BR, image:UIImage(named:"settings")!)

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view.backgroundColor = UIColor.rgba(r: 30, g: 55, b: 153, a: 1)
        
        

        view.addSubview(btn)
        

        btn.addMBYO(image: UIImage(named:"pen")!,action:{
            print("new")
        })
        btn.addMBYO(image: UIImage(named:"download")!,action:{
            print("download")
        })
        btn.addMBYO(image: UIImage(named:"pin")!,action:{
            print("location")
        })
        btn.addMBYO(image: UIImage(named:"user")!,action:{
            print("user")
        })


        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    
}

