//
//  EventsViewController.swift
//  EventsApp
//
//  Created by Cognizant Technology Solutions # 2 on 09/01/19.
//  Copyright © 2019 Cognizant Technology Solutions # 2. All rights reserved.
//

import UIKit
import Moya
import SnapKit

class EventsViewController: UIViewController {
    
    @IBOutlet weak var eventSearch: UISearchBar!
    @IBOutlet weak var eventsCollectionView: UICollectionView!
    override func viewDidLoad() {
        
        super.viewDidLoad()
        configureCollectionView()
    }
    
    func configureCollectionView()
    {
        eventSearch.isHidden = true
        eventsCollectionView.snp.makeConstraints {
            make in
            make.top.equalTo(self.view.snp.top).offset(40)
            make.left.right.bottom.equalTo(self.view)
        }
        let collectionViewLayout = eventsCollectionView.collectionViewLayout as? UICollectionViewFlowLayout
        
        collectionViewLayout?.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        collectionViewLayout?.invalidateLayout()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension EventsViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "eventsCell", for: indexPath) as! EventCollectionViewCell
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
       return CGSize(width: collectionView.bounds.width - 20, height: collectionView.bounds.height/5)
        
    }
    
}
