# MBY : MaterialButton animated 
![Made for iOS](https://camo.githubusercontent.com/ddc1660447efc2bda6f2dee04e2072d62b090e14/68747470733a2f2f696d672e736869656c64732e696f2f636f636f61706f64732f702f4c6971756964466c6f6174696e67416374696f6e427574746f6e2e7376673f7374796c653d666c6174)

MBY is an action button component inspired from [material design](https://material.io/guidelines/components/buttons-floating-action-button.html#buttons-floating-action-button-behavior).


## Preview :
[![Demo MLB](https://github.com/yassram/MBY/blob/master/output2.gif)](https://youtu.be/xOpI6BSocoU)


## Usage :
You have to add MBY.swift to your project.

#### To create a new MBY button : 
``` Swift
     let btn = MBY(position: .BR, image:UIImage(named:"settings")!)       // init a new MBY
     
     view.addSubview(btn)                                                 // add btn to your view
```

##### You can use 4 possible positions : 
  * .BR for Bottom Right
  * .BL for Bottom Left
  * .TR for Top Right    
  * .TL for Top Left  
      
      
#### To add options to your MBY button : 
``` Swift

      btn.addMBYO(image: UIImage(named:"imagename")!,action:{
        
          // actions to perform on option's button tap 
        
          print("Tap detected")
       
       })
        
       // you can add as many options as you want. 
``` 
