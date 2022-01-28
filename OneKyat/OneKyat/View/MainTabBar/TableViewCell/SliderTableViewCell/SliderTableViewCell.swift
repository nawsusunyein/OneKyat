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
    
    var flowers: [String] = ["rose1","rose2","rose3"]
    var imageFrame = CGRect.zero
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setSliderValues(){
       
        pageControl.numberOfPages = flowers.count
            setupScreens()

            scrollView.delegate = self
    }
    
    func setupScreens() {
        for index in 0..<flowers.count {
            // 1.
            self.frame.origin.x = scrollView.frame.size.width * CGFloat(index)
            self.frame.size = scrollView.frame.size
            
            // 2.
            let imgView = UIImageView(frame: self.frame)
            imgView.image = UIImage(named: flowers[index])

            self.scrollView.addSubview(imgView)
        }

        // 3.
        scrollView.contentSize = CGSize(width: (scrollView.frame.size.width * CGFloat(flowers.count)), height: scrollView.frame.size.height)
        scrollView.delegate = self
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageNumber = scrollView.contentOffset.x / scrollView.frame.size.width
        pageControl.currentPage = Int(pageNumber)
    }
}
