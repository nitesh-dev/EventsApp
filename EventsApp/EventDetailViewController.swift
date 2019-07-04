//
//  EventDetailViewController.swift
//  EventsApp
//
//  Created by Cognizant Technology Solutions # 2 on 09/01/19.
//  Copyright © 2019 Cognizant Technology Solutions # 2. All rights reserved.
//

import UIKit

class EventDetailViewController: UIViewController {

    private let scrollView = UIScrollView()
    private let newsDescriptionText = UILabel()
    private let imageView = UIImageView()
    let imageContainer = UIView()
    let textBackingView = UIView()
    private var previousStatusBarHidden = false
    
    let frontView = UIView()
    private let titleLabel = UILabel()
    private let dateLabel = UILabel()
    private let expLabel = UILabel()
    //MARK: — Scroll View Delegate
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if previousStatusBarHidden != shouldHideStatusBar {
            UIView.animate(withDuration: 0.2, animations: {
                self.setNeedsStatusBarAppearanceUpdate()
            })
            previousStatusBarHidden = shouldHideStatusBar
        }
    }
    //MARK: — Status Bar Appearance
    override var preferredStatusBarUpdateAnimation: UIStatusBarAnimation {
        return .slide
    }
    override var prefersStatusBarHidden: Bool {
        return shouldHideStatusBar
    }
    private var shouldHideStatusBar: Bool {
        let frame = textBackingView.convert(textBackingView.bounds, to: nil)
        return frame.minY < view.safeAreaInsets.top
    }
    
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        viewSettings()
        
        scrollView.scrollIndicatorInsets = view.safeAreaInsets
        scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: view.safeAreaInsets.bottom, right: 0)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //view.backgroundColor = .gray
        scrollView.contentInsetAdjustmentBehavior = .never
        
        imageView.addSubview(frontView)
        
        newsDescriptionText.textColor = .black
        newsDescriptionText.numberOfLines = 0
        newsDescriptionText.font = UIFont(name: "Montserrat-Thin", size: 16)
        let text =  """
                    Lorem ipsum dolor sit amet, in alia adhuc aperiri nam. Movet scripta tractatos cu eum, sale commodo meliore ea eam, per commodo atomorum ea. Unum graeci iriure nec an, ea sit habeo movet electram. Id eius assum persius pro, id cum falli accusam. Has eu fierent partiendo, doming expetenda interesset cu mel, tempor possit vocent in nam. Iusto tollit ad duo, est at vidit vivendo liberavisse, vide munere nonumy sed ex.
                            
                    Quod possit expetendis id qui, consequat vituperata ad eam. Per cu elit latine vivendum. Ei sit nullam aliquam, an ferri epicuri quo. Ex vim tibique accumsan erroribus. In per libris verear adipiscing. Purto aliquid lobortis ea quo, ea utinam oportere qui.
                    """
        
        let attributedString: NSMutableAttributedString
        attributedString = NSMutableAttributedString(string: text + text + text)
        
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 4
        attributedString.addAttribute(NSAttributedStringKey.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, attributedString.length))
        
        newsDescriptionText.attributedText = attributedString
        
        let textContainer = UIView()
        textContainer.backgroundColor = .white
        textBackingView.backgroundColor = .white
        
        view.addSubview(scrollView)
        
        textBackingView.clipsToBounds = true
        scrollView.addSubview(textBackingView)
        textBackingView.addSubview(textContainer)
        
        
        imageContainer.backgroundColor = .darkGray
        scrollView.addSubview(imageContainer)
        scrollView.addSubview(imageView)
        textContainer.addSubview(newsDescriptionText)
        
        imageContainer.snp.makeConstraints {
            make in
            make.top.equalTo(scrollView)
            make.left.right.equalTo(view)
            make.height.equalTo(imageContainer.snp.width).multipliedBy(1.05)
        }
        
        frontView.snp.makeConstraints{
            make in
            make.top.equalTo(imageView)
            make.left.right.equalTo(imageView)
            make.bottom.equalTo(imageView)
        }
        frontView.isUserInteractionEnabled = true
        imageView.isUserInteractionEnabled = true
        imageContainer.isUserInteractionEnabled = true
        
        textBackingView.snp.makeConstraints {
            make in
            make.top.equalTo(imageContainer)
            make.bottom.equalTo(view)
            make.left.right.equalTo(view)
        }
        
        scrollView.snp.makeConstraints {
            make in
            make.edges.equalTo(view)
        }
        
        imageView.snp.makeConstraints {
            make in
            make.left.right.equalTo(imageContainer)
            make.top.equalTo(view).priority(.high)
            make.height.greaterThanOrEqualTo(imageContainer.snp.height).priority(.required)
            make.bottom.equalTo(imageContainer.snp.bottom)
        }
        
        textContainer.snp.makeConstraints {
            make in
            make.top.equalTo(imageView.snp.bottom)
            make.left.right.equalTo(view)
            make.bottom.equalTo(scrollView)
        }
        
        newsDescriptionText.snp.makeConstraints {
            make in
            make.edges.equalTo(textContainer).inset(10)
        }
       
        
        frontView.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        imageView.image = #imageLiteral(resourceName: "pexels-photo-374074")
        imageView.contentMode = UIViewContentMode.scaleAspectFill
        imageView.clipsToBounds = true
        
    }
    
   
    func viewSettings()
    {
        titleLabel.textColor = UIColor.white
        titleLabel.numberOfLines = 0
        titleLabel.lineBreakMode = .byWordWrapping
        titleLabel.text = "iOS Challenge"
        titleLabel.font = UIFont(name: "Avenir-Next", size: 20)
        titleLabel.textAlignment = .left
        titleLabel.adjustsFontSizeToFitWidth = true
        
        frontView.addSubview(titleLabel)
        
        dateLabel.textColor = UIColor.white
        dateLabel.text = "10 Lacs"
        let font = UIFont(name: "Avenir-Next", size: 40)
        dateLabel.font = font
        
        expLabel.textColor = UIColor.white
        expLabel.text = "8 Years"
        let font1 = UIFont(name: "Monteserrat-Thin", size: 40)
        expLabel.font = font1
        
        frontView.addSubview(dateLabel)
        frontView.addSubview(expLabel)
        
        dateLabel.snp.makeConstraints {
            make in
            make.left.equalTo(imageContainer).offset(10)
            make.bottom.equalTo(imageContainer).offset(-10)
        }
        expLabel.snp.makeConstraints {
            make in
            make.left.equalTo(imageContainer).offset(10)
            make.bottom.equalTo(dateLabel).offset(-40)
            make.right.equalTo(imageContainer).offset(-10)
        }
        titleLabel.snp.makeConstraints {
            make in
            make.left.equalTo(imageContainer).offset(10)
            make.bottom.equalTo(expLabel).offset(-40)
            make.right.equalTo(imageContainer).offset(-10)
        }
        
    }
}
extension UIButton
{
    func addBlurEffect()
    {
        let blurEffect = UIBlurEffect(style: .dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = self.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        blurEffectView.isUserInteractionEnabled = false
        self.insertSubview(blurEffectView, at: 0)
        if let imageView = self.imageView{
            self.bringSubview(toFront: imageView)
        }
    }

}
