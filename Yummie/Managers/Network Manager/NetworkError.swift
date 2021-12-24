import Foundation

enum NetworkError: LocalizedError {
    case errorDecoding
    case unknownError
    case invalidUrl
    case serverError(String)
    
    var errorDescription: String? {
        switch self {
            case .errorDecoding:
                return "Response could not be decoded!!"
            case .unknownError:
                return "I have No idea what went wrong!!"
            case .invalidUrl:
                return "Invalid URL!!"
            case .serverError(let error):
                return error
        }
    }
}
