//
//  RestaurantTableViewController.swift
//  UITableController
//
//  Created by jerry on 16/9/9.
//  Copyright © 2016年 jerry. All rights reserved.
//

import UIKit

class RestaurantTableViewController: UITableViewController {
    
    var 餐馆 = ["咖啡胡同","霍米","茶.家","罗伊斯咖啡","贝蒂生蚝","福奇餐馆","啊波画室","伯克街面包坊","黑氏巧克力","惠灵顿雪梨","北州","布鲁克林塔菲","格雷厄姆大街肉","华夫饼&沃夫","五叶","眼光咖啡","忏悔","巴拉菲娜","多尼西亚","皇家橡树","泰咖啡"]
    
    
    var 餐馆图片 = ["cafedeadend.jpg", "homei.jpg", "teakha.jpg", "cafeloisl.jpg", "petiteoyster.jpg", "forkeerestaurant.jpg", "posatelier.jpg", "bourkestreetbakery.jpg", "haighschocolate.jpg", "palominoespresso.jpg", "upstate.jpg", "traif.jpg", "grahamavenuemeats.jpg", "wafflewolf.jpg", "fiveleaves.jpg", "cafelore.jpg", "confessional.jpg", "barrafina.jpg", "donostia.jpg", "royaloak.jpg", "thaicafe.jpg"]
    
    var 餐馆地点 = ["⾹港", "⾹港", "香港", "香港", "香港", "香港", "⾹港", "悉尼", "悉尼", "悉尼", "纽约", "纽约", "纽约", "纽约", "纽约", "纽约", "纽约", "伦敦", "伦敦", "伦敦", "伦敦"]
    
    var 餐馆类型 = ["咖啡 & 茶店","咖啡", "茶屋", "奥地利式 & 休闲饮料","法式", "⾯包房", "⾯包房", "巧克力", "咖啡", "美式 & 海鲜", "美式", "美式","早餐 & 早午餐", "法式 & 茶", "咖啡 & 茶", "拉丁美式", "西班牙式", "西班牙式", "西班牙式", "英式", "泰式"]
    
    var 去过的餐厅 = [Bool](count: 21, repeatedValue: false)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 餐馆.count
    }
    
    //定义cell初始化
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //这个cell是循环使用(dequeueReusableCellWithIdentifier)，譬如界面最多显示十个这样的cell，cell将会循环使用这十个，节省内存
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)as! CustomTableViewCell
        //让自定义cell的label和image对应数组相应的变量
        cell.RestaurantName.text = 餐馆[indexPath.row]
        cell.RestaurantImage.image = UIImage(named: 餐馆图片[indexPath.row])
        //圆角
        cell.RestaurantImage.layer.cornerRadius = 30
//      cell.RestaurantImage.layer.cornerRadius = cell.RestaurantImage.frame.size.width/2
        cell.RestaurantImage.clipsToBounds = true
        cell.location.text = 餐馆地点[indexPath.row]
        cell.RestaurantType.text = 餐馆类型[indexPath.row]
        //这个是标记，我来过的标记，等于收藏星星
        cell.女神.image = UIImage(named: "1.jpg")
        cell.女神.hidden = true
        if 去过的餐厅[indexPath.row]{
            cell.女神.hidden = false
        }else{
            cell.女神.hidden = true
        }
    
        return cell
    }
    //点击选中cell发生
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let alert = UIAlertController(title: "亲，你选择了我", message: "消息", preferredStyle: .ActionSheet)
        let cancleAtion = UIAlertAction(title: "返回", style: .Cancel, handler: nil)
        //闭包
        let 拨打行为的处理 = {(action:UIAlertAction!)->Void in
            let 提示消息 = UIAlertController(title: "无服务", message: "对不起，你所拨打的号码暂时无法接通", preferredStyle: .Alert)
            提示消息.addAction(UIAlertAction(title: "好", style: .Cancel, handler: nil))
                self.presentViewController(提示消息, animated: true, completion: nil)
        }
        
        
        let 拨打行为 = UIAlertAction(title: "拨打020-87933908-\(indexPath.row)", style: .Default, handler: 拨打行为的处理)
        alert.addAction(拨打行为)
//      简易写法（不用初始化）  alert.addAction(UIAlertAction(title: "拨打020-87933908-\(indexPath.row)", style: .Default, handler: 拨打行为的处理))
        alert.addAction(cancleAtion)
        let  我来过闭包 = {(action:UIAlertAction)->Void in
//        让选中行(去过的餐厅)标记为true
            self.去过的餐厅[indexPath.row] = true
            self.tableView.reloadData()
        }
        let 我来过 = UIAlertAction(title: "我来过", style: .Default, handler: 我来过闭包)
        alert.addAction(我来过)
        self.presentViewController(alert, animated: true, completion: nil)
    }
    override func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
        
        let 分享行为 = UITableViewRowAction(style: .Default, title: "分享") { (Action, IndexPath) -> Void in
            
        
            let 分享 = UIAlertController(title: "分享", message: "请问你需要分享到", preferredStyle: .ActionSheet)
            let 腾讯企鹅 = UIAlertAction(title: "QQ", style: .Default, handler: nil)
            let 微信朋友圈 = UIAlertAction(title: "微信", style: .Default, handler: nil)
            let 支付宝 = UIAlertAction(title: "支付宝", style: .Default, handler: nil)
            let 返回 = UIAlertAction(title: "返回", style: .Cancel, handler: nil)
            分享.addAction(返回)
            分享.addAction(腾讯企鹅)
            分享.addAction(微信朋友圈)
            分享.addAction(支付宝)
            self.presentViewController(分享, animated: true, completion: nil)
        }
        
            let 删除行为 = UITableViewRowAction(style: .Default, title: "删除", handler: { (Action, IndexPath) -> Void in
                
                self.餐馆.removeAtIndex(indexPath.row)
                self.餐馆地点.removeAtIndex(indexPath.row)
                self.餐馆图片.removeAtIndex(indexPath.row)
                self.餐馆类型.removeAtIndex(indexPath.row)
                self.去过的餐厅.removeAtIndex(indexPath.row)
                //删除响应行并有动作效果（缩合）
                tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
            })
         分享行为.backgroundColor = UIColor.purpleColor()
        
            return [分享行为,删除行为]
        }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */


    // Override to support editing the table view.
//    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
//        if editingStyle == .Delete {
////             Delete the row from the data source
//            餐馆.removeAtIndex(indexPath.row)
//            餐馆地点.removeAtIndex(indexPath.row)
//            餐馆图片.removeAtIndex(indexPath.row)
//            餐馆类型.removeAtIndex(indexPath.row)
//            去过的餐厅.removeAtIndex(indexPath.row)
//            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
//        } else if editingStyle == .Insert {
//             Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
//        }
    }


    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

