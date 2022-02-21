//
//  ViewController.swift
//  oderMenu
//
//  Created by Chu Go-Go on 2022/2/18.
//

import UIKit
import Foundation
class ViewController: UIViewController {
    
    @IBOutlet weak var infoTV: UITextView!
    @IBOutlet weak var totalLB: UILabel!
    @IBOutlet weak var menuIV: UIImageView!
    @IBOutlet var setCountLB: [UILabel]!
    var allMenu = [Menu(name: "炭烤雞排味噌烏龍麵鍋定食", price: 360, image: "炭烤雞排味噌烏龍麵鍋定食", info: "來自名古屋的在地美食，使用原汁原味的日本大戶屋特製味噌醬，以燉煮的方式將每一個食材濃郁的呈現，加入半熟的雞蛋，讓口感更圓潤順口。"), Menu(name: "炭烤牛排定食", price: 490, image: "炭烤牛排定食", info:"大戶屋採用美國肋眼牛肉，油花豐富且分布均勻、彷如大理石紋，肉質鮮嫩多汁，是喜愛牛排的老饕首選。經由碳烤後展現豐富的美味層次，搭配大戶屋特製牛排醬汁食用，更能品嘗到更多層次的美味。"), Menu(name: "炭烤鹽麴松阪豬定食", price: 420, image: "炭烤鹽麴松阪豬定食", info: "一隻豬只有兩塊松阪豬，是整頭豬最珍貴的「松阪豬」，以鹽麴醃漬，取代食鹽，更具健康概念，烤過的油花分布均勻，有一點油脂卻不油膩，吃起來外酥內軟、Q彈爽脆。"), Menu(name: "醬煮龍虎斑定食", price: 470, image: "醬煮龍虎斑定食", info: "天和鮮物的龍虎斑漁場位於水質純淨無汙染的澎湖西嶼鄉外海，以高成本的海上箱網方式養殖，再通過重重嚴格的檢驗才能端上大戶屋的餐桌。大戶屋就是要帶給您安全安心健康又美味的餐點，以日式醬汁燉煮，讓龍虎斑的甜度鮮明飽足，食用時再搭配蔥絲與薑絲讓魚肉更加爽口。"), Menu(name: " 炭烤黃金鯧定食", price: 410, image: " 炭烤黃金鯧定食", info: "天和鮮物澎湖產地直送，肉質細緻中帶紮實，肉量飽足多汁，利用日式調製工法，不添加多餘的調味料，完美呈現黃金鯧的原汁原味。"), Menu(name: "炸腰內肉排定食", price: 330, image: "炸腰內肉排定食", info: "腰內肉有『豬肉的菲力』之稱，口感鮮甜軟嫩，搭配大戶屋特選麵包粉，麵衣酥脆且將食材鮮味完整保留，讓您一口一口的停不下來。"), Menu(name: "炭烤雞肉什蔬和風咖哩蓋飯", price: 320, image: "炭烤雞肉什蔬和風咖哩蓋飯", info: "獨特和風咖哩，口味溫潤順口，搭配鮮嫩的炭烤雞肉及10種蔬菜，美味又健康。") ,Menu(name: "極上和牛壽喜燒定食", price: 400, image: "極上和牛壽喜燒定食", info: "採用頂級和牛肉片，油脂豐富入口即化，肉片吸附野菜的甜味與關東風味醬汁，特調醬汁鮮甜美味，滿嘴滿足的滋味") ]
//    看每一個菜單的內容
    var menuIndex = 0
//    判斷顯示菜單內容
    var showMenu = 0
//    判斷菜色價錢
    var setCount = 0
//    計算儲存價錢
    var allPrice = 0
//    把錢存在Array裡
    var savePrice = [0,0,0,0,0,0,0,0]
//    判斷點幾道菜
    var set = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
//    顯示菜單
    @IBAction func menuInfo(_ sender: UIButton) {
//        按一下會+1
        showMenu += 1
//        每道菜的Array用sender.tag來判定
        menuIndex = sender.tag
//        菜單介紹的文字，就直接從相應對的菜色顯示出來。
        infoTV.text! = "\(allMenu[menuIndex].info)\n售價：\(allMenu[menuIndex].price)"
//        顯示相應對的圖片
        menuIV.image = UIImage(named: allMenu[menuIndex].image)
//        點到圖片就會顯示菜色介紹
        if showMenu == 1 {
        infoTV.isHidden = false
            menuIV.isHidden = false
            showMenu += 1
//            當showMenu>1之後就會歸零
        }else {
            infoTV.isHidden = true
            menuIV.isHidden = true
            showMenu = 0
        }
//        print("菜單\(menuIndex)")
    }
    @IBAction func setCountStepper(_ sender: UIStepper) {
//        stepper也是用一樣的方式
        set = sender.tag
//        計算點了幾份
        allMenu[set].setCount = Int(sender.value)
//        份數的Label我也是拉成[]但是把他們丟進去時要按照順序
        setCountLB[set].text = "\(allMenu[set].setCount)"
//        把計算好的金額丟到前面做的Array裡面儲存這串得意思是
//        [第幾道] = 幾份*金額沒有跑的就會是[360,0,0]
        savePrice[set] = allMenu[set].setCount * allMenu[set].price
//        跑計算的算式
        countPrice()
        print(savePrice)
        print("數量\(allMenu[set].setCount)")
        print("價錢\(allMenu[set].price)")
        print("總金額\(allPrice)")
        print("套餐錢\(savePrice)")
    }
    @IBAction func sentOder(_ sender: Any) {
//        建立一個alert來確認你點的金額
        let alert = UIAlertController(title: "確認您的金額", message: "總共金額是\(allPrice)！", preferredStyle: .alert)
//        建立確認
        let yesAlert = UIAlertAction(title: "確定", style: .default)
//        建立取消
        let canelAlert = UIAlertAction(title: "取消", style: .default)
//        把確認跟取消加到Alert裡面
        alert.addAction(canelAlert)
        alert.addAction(yesAlert)
//        顯示出來
        present(alert, animated: true, completion: nil)
    }
    @IBAction func clickClear(_ sender: UIButton) {
//      建立一個UIAlertController來提醒你確定要清空
        let alert = UIAlertController(title: "清除餐點", message: "確定要清除嗎？", preferredStyle: .alert)
//        如果按確定的話他就會跑到clearAll()裡面
        let yesAlert = UIAlertAction(title: "確定", style: .default){ _ in
            self.clearAll()
        }
//        按否就沒事
        let canelAlert = UIAlertAction(title: "取消", style: .default)
        alert.addAction(canelAlert)
        alert.addAction(yesAlert)
        present(alert, animated: true, completion: nil)
    }
    
    func countPrice(){
//        把先前計算的歸零
        allPrice = 0
//        先建立一個金錢屬性的NumberFormatter()
        let formatter = NumberFormatter()
//        選擇你要呈現的樣字
        formatter.numberStyle = .currencyISOCode
//        選擇你要的幣值
        formatter.locale = Locale(identifier: "zh_TW")
//        計算菜色的金額
        for price in savePrice {
//            因為一開始有歸零了，所以計算不會重疊
            allPrice += price
//            print(price)
//            print("迴圈裡\(allPrice)")
        }
//        總金額的Label會顯示你的金額
            totalLB.text = (formatter.string(from: NSNumber(value: allPrice)))
    }
    func clearAll(){
         menuIndex = 0
         showMenu = 0
         setCount = 0
         allPrice = 0
         savePrice = [0,0,0,0,0,0,0,0]
         set = 0
        setCountLB[0].text = "0"
        setCountLB[1].text = "0"
        setCountLB[2].text = "0"
        setCountLB[3].text = "0"
        setCountLB[4].text = "0"
        setCountLB[5].text = "0"
        setCountLB[6].text = "0"
        setCountLB[7].text = "0"
        totalLB.text = "0"
    }
}

