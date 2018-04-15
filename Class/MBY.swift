//
//  MBY.swift
//  MBY
//
//  Created by yassir ramdani on 15/04/2018.
//  Copyright © 2018 yassir ramdani. All rights reserved.
//

import UIKit

enum Positions {
    case BL, BR, TL, TR
}
enum directions {
    case btm, top
}

class MBY : UIButton {
    
    var size : Double = 54
    var t : Double = 3/4
    var options : [MBYO?] = []
    var isOpen : Bool = false
    let direction :directions
    
    
    
    
    init(position:Positions, image:UIImage){
        var sx ,sy :Double
        switch position {
        case .BR:
            sx = 22
            sy = Double(UIScreen.main.bounds.height - 22) - size
            self.direction = .top
        case .BL:
            sx = Double(UIScreen.main.bounds.width - 22) - size
            sy = Double(UIScreen.main.bounds.height - 22) - size
            self.direction = .top
        case .TR:
            sx = Double(UIScreen.main.bounds.width - 22) - size
            sy = 22
            self.direction = .btm
        case .TL:
            sx = 22
            sy = 22
            self.direction = .btm
            
        }
        
        super.init(frame: CGRect(x: sx,
                                 y: sy,
                                 width: size,
                                 height: size))
        
        
        // Customization :
        backgroundColor = UIColor.rgba(r:12, g:36, b:97, a:1.0)
        layer.cornerRadius = CGFloat(size/2)
        setImage(image.withRenderingMode(.alwaysTemplate), for: .normal)
        imageEdgeInsets = UIEdgeInsetsMake(8, 8, 8, 8)
        tintColor = .white
        addTarget(self, action:#selector(show) , for: .touchUpInside)
    }
    
    
    @objc func show(){
        guard !isOpen else {
            isOpen = false
            hide()
            return
        }
        isOpen = true
        
        var i=0
        UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.2, options: .curveEaseIn, animations: {
            
            for btn in self.options{
                
                btn!.isHidden = false
                
                if(self.direction == .top){
                    btn?.frame =   CGRect(     x: Double(self.frame.midX) - self.size * self.t / 2,
                                               y: Double(self.frame.midY) - self.size * (Double(i)+1.5)  ,
                                               width:  self.size * self.t,
                                               height: self.size * self.t )
                }else{
                    btn?.frame =   CGRect(     x: Double(self.frame.midX) - self.size * self.t / 2,
                                               y: Double(self.frame.midY) + self.size * (Double(i) + 0.75)  ,
                                               width:  self.size * self.t,
                                               height: self.size * self.t )
                }
                i += 1
                
            }
            
            
        }) { (Finished) in
            
        }
        
    }
    func hide(){
        var i = options.count
        
        UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0.2, options: .curveEaseOut, animations: {
            
            for btn in self.options{
                btn?.isHighlighted = false
                
                
                btn?.frame =   CGRect(     x: Double(self.frame.midX) - self.size * self.t / 2,
                                           y: Double(self.frame.midY) - self.size * self.t / 2  ,
                                           width:  self.size * self.t,
                                           height: self.size * self.t )
                i -= 1
                
            }
        }) { (Finished) in
            
            for btn in self.options{
                btn!.isHidden = true
            }
            
        }
        
    }
    func addMBYO(image : UIImage,  action: @escaping () -> Void){
        let btn = MBYO(frame: CGRect(     x: Double(frame.midX) - size * t / 2,
                                          y: Double(frame.midY) - size * t / 2  ,
                                          width:  size * t,
                                          height: size * t ))
        btn.responsable = self
        btn.image = image
        superview?.addSubview(btn)
        superview?.bringSubview(toFront: self)
        options.append(btn)
        btn.isHidden = true
        btn.action = action
        
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

class MBYO : UIButton {
    var responsable : MBY?
    var size : Double = 0
    var action : (()->Void)?
    var image : UIImage?{
        didSet{
            setImage(image!.withRenderingMode(.alwaysTemplate), for: .normal)
            imageView?.tintColor = .white
        }
    }
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        
        // Customization :
        backgroundColor = UIColor.rgba(r:74, g:105, b:189, a:1.0)
        clipsToBounds = true
        layer.cornerRadius = CGFloat(frame.size.width/2)
        imageEdgeInsets = UIEdgeInsetsMake(8, 8, 8, 8)
        
        
        
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        action!()
        responsable?.show()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

