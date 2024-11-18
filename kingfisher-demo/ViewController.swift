import UIKit
import Kingfisher


class ViewController: UIViewController {
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.register(SampleCell.self, forCellReuseIdentifier: "SampleCell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.rowHeight = 80
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
}


extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SampleCell", for: indexPath) as! SampleCell
        cell.sampleLabel.text = "Index \(indexPath.row)"
        
        let urlPrefix = "https://raw.githubusercontent.com/onevcat/Kingfisher-TestImages/master/DemoAppImage/Loading/kingfisher"
        let url = URL(string: "\(urlPrefix)-\(indexPath.row + 1).jpg")
        
        cell.sampleImageView.kf.indicatorType = .activity
        
        let roundCorner = RoundCornerImageProcessor(radius: .widthFraction(0.5), roundingCorners: [.topLeft, .bottomRight])
        let pngSerializer = FormatIndicatedCacheSerializer.png
        cell.sampleImageView.kf.setImage(
            with: url,
            options: [.processor(roundCorner), .cacheSerializer(pngSerializer)]
        )
        cell.sampleImageView.backgroundColor = .clear
        return cell
    }
}
