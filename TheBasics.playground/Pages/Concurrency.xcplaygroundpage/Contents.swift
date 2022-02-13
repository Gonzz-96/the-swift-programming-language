import Foundation

struct Photo {
    var name: String
    var path: String
}

func downloadPhoto(path: String) async -> Photo {
    return Photo(name: "me.jpg", path: "/users/Gonz/")
}

func listPhotos(inGallery name: String) async -> [String] {
    let result = ["me.jps", "dog.jpg"] // some asynchronous networking code
    
    return result
}

func show(photo: Photo) { }

func someAsyncFunc() async {
    let photoNames = await listPhotos(inGallery: "My Life")
    let sortedNames = photoNames.sorted()
    let name = sortedNames[0]
    let photo = await downloadPhoto(path: name)
    show(photo: photo)
}

// asynchronous sequence
func randomAsync() async throws {
    let handle = FileHandle.standardInput
    for try await line in handle.bytes.lines {
        print(line)
    }
}

func downloadInSequence() async -> [Photo] {
    let firstPhoto = await downloadPhoto(path: "1.jpg")
    let secondPhoto = await downloadPhoto(path: "2.jpg")
    let thirdPhoto = await downloadPhoto(path: "3.jpg")

    return [firstPhoto, secondPhoto, thirdPhoto]
    
}
