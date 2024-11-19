import UIKit

class SampleCell: UITableViewCell {
    let sampleImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(sampleImageView)
        
        // Констрейны для изображения
        NSLayoutConstraint.activate([
            sampleImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            sampleImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            sampleImageView.widthAnchor.constraint(equalToConstant: 60),
            sampleImageView.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
