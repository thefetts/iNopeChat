extension String {
    func upTo(i: Int) -> String {
        let offset = i > endIndex.encodedOffset ? self.count : i
        let end = self.index(startIndex, offsetBy: offset)
        return String(self[startIndex..<end])
    }
}
