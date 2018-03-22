//
//  Visitor.swift
//  WeiBoCoding
//
//  Created by wu on 2018/2/9.
//  Copyright © 2018年 wu. All rights reserved.
//

import UIKit

class Visitor: UIView {

    @IBOutlet weak var aboutImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var LoginBtn: UIButton!
    @IBOutlet weak var RegisterBtn: UIButton!
    
    @IBOutlet weak var iconImgView: UIImageView!
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    override init(frame: CGRect) {
        super.init(frame: frame)
        Visitor.xibCreatVisitor()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        Visitor.xibCreatVisitor()
    }
    
    class func xibCreatVisitor()->Visitor{
        
        return  Bundle.main.loadNibNamed("Visitor", owner: nil, options: nil)?.last as! Visitor 
    }

}

extension Visitor{
    //MARK: - 对外提供的修改图片和标题的方法
     func changeContentView(aboutImageViewName: String?, title : String){
        
        guard let name = aboutImageViewName else {
            //没有设置图标，首页
            backImageStartAnimation()
            return
        }
        //不是首页
        aboutImageView.isHidden = true
        titleLabel.text = title
        iconImgView.image = UIImage.init(named: name)
        
    }
    
    func backImageStartAnimation(){
   //1. 创建动画
    let anim = CABasicAnimation(keyPath: "transform.rotation")
    //2.设置动画属性
    anim.toValue = Double(2) * M_PI
    anim.duration = 5.0
    anim.repeatCount = MAXFLOAT
    anim.isRemovedOnCompletion = false
    aboutImageView.layer.add(anim, forKey: nil)
        
    }
}
