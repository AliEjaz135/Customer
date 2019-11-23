//
//  ViewController.swift
//  Images and Text
//
//  Created by admin on 11/16/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit
import Alamofire
import SDWebImage
import SwiftyJSON

class ViewController: UIViewController {
  var stateArray = [stateModel]()
  
  
  @IBOutlet weak var statesTableView: UITableView!
  

  override func viewDidLoad() {
    super.viewDidLoad()
    
    statesTableView.delegate = self
    statesTableView.dataSource = self
    requestConnection()
    // Do any additional setup after loading the view.
  }
  
  private func requestConnection() {
    let url = "https://apis.officedoor.ai/office/state_list/"
    Alamofire.request(url, method: .get).responseJSON { (response) in
      switch response.result {
        
      case .success:
        let myRes = try? JSON(data: response.data!)
        let dataArray = myRes!
        
        for i in dataArray.arrayValue
        {
          let state = i["state"].stringValue
          let image = i["icon_image_android"].stringValue
          
          let stateInstance = stateModel(state: state, image: image)
          self.stateArray.append(stateInstance)
        }
        
        self.statesTableView.reloadData()
        break
        
      case .failure:
        
        print("Print Error")
        break
      }
      
    }
  }
  


}


extension ViewController: UITableViewDelegate, UITableViewDataSource{
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
    return stateArray.count
    
  }
  

 func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
   
   let cell = tableView.dequeueReusableCell(withIdentifier: "statesTableViewCell") as! statesTableViewCell
  let dataArray = stateArray[indexPath.row]
        cell.stateNameLbl.text = dataArray.state
  let url = dataArray.image
//   print(url, "url")
  cell.myImageView.sd_setImage(with: URL(string: url!), placeholderImage: UIImage(named: "icons8-christmas-star-50"))
// var url = dataArray.image!
//
//  cell.stateImageView.sd_setImage(with: URL(string: url), placeholderImage: UIImage(named: "icons8-christmas-star-50"))
    
 
    return cell
    
  }

}

