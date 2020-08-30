import Foundation

extension String{
    //hàm cắt khoảng trắng đầu, khoảng trắng cuối và cho tất cả thành chữ thường
    var lowercaseAndTrimSpace: String{
        return self.lowercased().trimmingCharacters(in: .whitespaces)
    }
}
