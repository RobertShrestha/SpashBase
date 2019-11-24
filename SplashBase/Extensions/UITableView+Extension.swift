//
//  UITableView+Extension.swift
//  SplashBase
//
//  Created by Robert Shrestha on 11/23/19.
//  Copyright © 2019 robert. All rights reserved.
//

import UIKit

extension UITableView{
    func dequeueResuableCell<Cell: UITableViewCell>(forIndexPath indexPath:IndexPath) -> Cell {
        guard let cell = self.dequeueReusableCell(withIdentifier: Cell.resuseID, for: indexPath) as? Cell else { fatalError("Fatal error for cell at \(indexPath)")
            
        }
        return cell
    }
}
protocol Resuable {}
extension UITableViewCell:Resuable {}

extension Resuable where Self: UITableViewCell{
    static var resuseID:String{
        return String(describing: self)
    }
}


extension UICollectionViewCell:Resuable {}

extension Resuable where Self:UICollectionViewCell{
    static var resuseID:String{
        return String(describing: self)
    }
}

extension UICollectionView{
    func dequeueResuableCell<Cell: UICollectionViewCell>(forIndexPath indexPath:IndexPath) -> Cell {
        guard let cell = self.dequeueReusableCell(withReuseIdentifier: Cell.resuseID, for: indexPath) as? Cell else { fatalError("Fatal error for cell at \(indexPath)")
            
        }
        return cell
    }
}


