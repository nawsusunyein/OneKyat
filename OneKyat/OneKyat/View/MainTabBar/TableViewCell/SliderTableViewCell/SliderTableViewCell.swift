//
//  SliderTableViewCell.swift
//  OneKyat
//
//  Created by Naw Su Su Nyein on 1/29/22.
//

import UIKit

class SliderTableViewCell: UITableViewCell, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var pageControl: UIPageControl!
    
    @IBOutlet weak var bannerImageView: UIImageView!
    
    var banner: [String] = [String]()
    
    var imageFrame = CGRect.zero
    
    var index = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setSliderImages(banner : [String]){
        self.banner = banner
        pageControl.addTarget(self, action: #selector(self.changePage(sender:)), for: UIControl.Event.valueChanged)
        self.setTimer()
        configurePageControl()
        setupImageOnScrollView()

    }
    
    func setupImageOnScrollView() {
       
        for index in 0..<banner.count {
            //set image frame size
            self.imageFrame = CGRect(x: UIScreen.main.bounds.size.width * CGFloat(index), y: 0, width: self.contentView.frame.width, height: 150)
            
            //create image view to add in scrollview for slider
            let imgView = UIImageView(frame: self.imageFrame)
            imgView.image = UIImage(named: banner[index])
            imgView.contentMode = .scaleToFill
            
         
            //add image view in scroll view
            self.scrollView.addSubview(imgView)
        }

        //set scroll view width and height
        scrollView.contentSize = CGSize(width: (UIScreen.main.bounds.size.width * CGFloat(self.banner.count)), height: scrollView.frame.size.height)
        scrollView.delegate = self
    }
    
    
    //Define page control attributes
    func configurePageControl() {
        self.pageControl.currentPage = 0
        self.pageControl.numberOfPages = banner.count
        self.pageControl.tintColor = UIColor.red
        self.pageControl.pageIndicatorTintColor = UIColor.black
        self.pageControl.currentPageIndicatorTintColor = ButtonColor.LoginButton.enabledColor
    }
    
    
    //Change image according to user taps on pager control
    @objc func changePage(sender: AnyObject) -> () {
        let x = CGFloat(pageControl.currentPage) * scrollView.frame.size.width
        scrollView.setContentOffset(CGPoint(x:x, y:0), animated: true)
    }
    
    
    //Get page number when user scroll in scrollview without using page control
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageNumber = ceil(scrollView.contentOffset.x / scrollView.frame.size.width)
        pageControl.currentPage = Int(pageNumber)
    }
    
    //Set timer
    func setTimer(){
        Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(self.update), userInfo: nil, repeats: true)
    }
    
    
    @objc func update()  {
       index += 1
        if(index > 6){
           index = 0
          
        }
        pageControl.currentPage = index
        let x = CGFloat(index) * scrollView.frame.size.width
        scrollView.setContentOffset(CGPoint(x:x, y:0), animated: true)
    }
}
