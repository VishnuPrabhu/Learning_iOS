//
//  CustomTCVViewController.swift
//  ReusableFramework
//
//  Created by Vishnu Prabhu Rama Chandran on 26/11/23.
//

import Foundation
import UIKit

public class CustomTCVViewController : UIViewController, UITableViewDataSource {
    
    private let data = [Quote](
        arrayLiteral: Quote(quote: "You don't have to be great to start, but you have to start to be great.", author: "Zig Ziglar", image: UIImage(systemName: "quote.opening")!)
    )
    
    @IBOutlet private weak var tableView: UITableView!
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.register(CustomTVCell.self, forCellReuseIdentifier: "cell1")
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell1") as! CustomTVCell
        cell.quote = data[indexPath.row]
        return cell
    }
}
