# Watpago
간단한 생활표현을 영어나 프랑스어로 검색할 수 있는 애플워치용 번역앱  

- watchOS용 WatchKit 적용  
- 한국어 -> 영어, 프랑스어 번역 기능 구현  

- 네이버 파파고 API 사용  
https://developers.naver.com/products/papago/nmt/nmt.md  
네이버 파파고 API는 한국어(ko)-영어(en), 한국어(ko)-일본어(ja), 한국어(ko)-중국어 간체(zh-CN), 한국어(ko)-중국어 번체(zh-TW), 한국어(ko)-스페인어(es), 한국어(ko)-프랑스어(fr), 한국어(ko)-러시아어(ru), 한국어(ko)-베트남어(vi), 한국어(ko)-태국어(th), 한국어(ko)-인도네시아어(id), 한국어(ko)-독일어(de), 한국어(ko)-이탈리아어(it), 중국어 간체(zh-CN) - 중국어 번체(zh-TW), 중국어 간체(zh-CN) - 일본어(ja), 중국어 번체(zh-TW) - 일본어(ja), 영어(en)-일본어(ja), 영어(en)-중국어 간체(zh-CN), 영어(en)-중국어 번체(zh-TW), 영어(en)-프랑스어(fr)를 지원합니다.  

- - -
## UI

![](https://github.com/KKANG00/Watpago/blob/main/ScreenShots.png)

WKInterfaceLabel, WKInterfaceTextField, WKInterfacePicker 사용  

### WKInterfaceTextField
TextField 터치 시 입력을 받을 수 있는 기능이 실행되고  
입력이 끝남과 동시에 실행되는 IBAction으로 변화되는 값을 캐치할 수 있다.  

### WKInterfacePicker
DataSource로 WKPickerItem 리스트를 만들어 setItems 함수로 설정해야한다.  
List(기본 텍스트), Stack(이미지 스택), Sequence(이미지 애니메이션) 3가지 style을 지원한다.  
WKInterfaceTextField와 동일하게 IBAction을 만들어 변화되는 값을 캐치할 수 있다.  

### 화면전환
presentController(withName: String, context: Any?)  
-> 새로운 single interface controller를 띄워준다.  
pushController(withName: String, context: Any?)  
-> 새로운 interface controller를 스택으로 쌓는다.  
popToRootController()  
-> 위에 쌓여있는 모든 controller를 제거하고 Root controller로 돌아간다.  

## Troubleshotting
- Networking  
api request에 대한 response를 받기 전에 화면이 넘어가는 비동기 처리 이슈  

### Delegate Protocol 구현
protocol ApiCallerDelegate {  
    func sendTranslatedText(_ resultText: String)  
}  

### AskPageController 내의 delegate 함수  
response를 받았을 때 실행되는 sendTranslatedText 함수를 구현해 내부에서 화면 전환  

### pushController는 main Thread 사용  
에러메세지 pushController called from queue other than main. This is not supported and may fail in the future.  
UI에 관여하는 pushController 메소드 또한 main Thread에서 실행되어야함  
DispatchQueue.main.async {  
    self.pushController(withName: "resultPage", context: (self.descriptionText, self.translatedText))  
}  
