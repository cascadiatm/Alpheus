import Foundation

public class GDELTDate {

	private static let formatter: DateFormatter = {
		let df = DateFormatter()
		df.locale = Locale(identifier: "en_US_POSIX")
		df.dateFormat = "yyyyMMddhhmmss"
		df.timeZone = TimeZone(secondsFromGMT: 0)
		return df
	}()

	public var date: Date

	public init(_ date: String) {
		self.date = GDELTDate.formatter.date(from: date) ?? Date() 
	}

}
