# CameraAVFoundation
W repozytorium znajduje się klasa służąca do osbługi kamery, którą należy wykorzystać do realizacji zadania. Klasa implemntuje protokół CameraManagerProtocol zawierający metody klasowe. Dzięki temu bez konieczności tworzenia obiektu możemy operować na kamerze, wykonując na niej różne operacje:
## Utworzenie podglądu z kamery telefonu
```swift
static func generateCameraPreview(previewSize size: CGSize, completion: (sessionPreviewView: UIView?) -> ())
```
Metoda ta wykonuję się asynchronicznie, dlatego jednym z parametrów jest closure completion. Zwraca on nam widok z kamery.  Otrzymany obiekt typu UIView, który nawiasem mówiąc jest opcjonalny, należy dodać do głównego widoku kontrollera. Można to zrobić następująco:

```swift
 let screenFrame = UIScreen.mainScreen().bounds
 let previewDimension = CGSize(width: CGRectGetWidth(screenFrame), height: CGRectGetHeight(screenFrame))
        
  CameraManager.generateCameraPreview(previewSize: previewDimension) { [unowned self] sessionPreview in
      guard let preview = sessionPreview else { return }
      self.view.addSubview(preview)
  }
```

## Przełączanie się między przednią i tylnią kamerą
```swift
static func switchCamera(completion: (sessionPreviewView: UIView?) -> ())
```
Do tego celu należy wykorzystać metodę, która również zwraca nam w closure widok z kamery. Tutaj jednak musimy zadbać o to żeby usunąć poprzedni podgląd i zastąpić go widokiem z przeciwnej kamery. Podpowiedź: przechowywać aktualny widok z kamery jako zmienną w klasie kontrolera. Dzięki temu można go łatwo usunąć z struktury widoku za pomocą
```swift
view.removeSubview(cameraPreview)
```
Do wywoływania tej metody użyjmy akcji przycisku!
## Obsługa flasha
```swift
static func toggleFlashMode(bool: Bool)
```
Ta metoda klasy CameraManager umożliwia włączenie lampy aparatu. W parametrze należy zdecydować czy chcemu ją włączyć lub wyłączyć. Równiez i w tym przypadku warto w jakiś sposób przechowywać w kontrollerze aktualny stan lampy błyskowej. Tym bardziej w tym przypadku ponieważ przycisk będzie zmieniał kolor!
## Zdjęcie
```swift
static func takePhoto(completion: (UIImage?) -> ())
```
Ostatnia metoda, ale najważniejsza ponieważ zwraca nam zdjęcie. Również metoda asynchroniczna wymagająca closure. 

