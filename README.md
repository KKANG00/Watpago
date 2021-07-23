# Watpago
간단히 만들어보는 애플워치용 번역앱  

watchOS용 WatchKit 적용  
네이버 파파고 API 사용 예정  

한국어 -> 영어, 프랑스어 번역 기능  

## UI

![](https://github.com/KKANG00/iOSStudy/blob/main/Watpago/ScreenShots.png)

WKInterfaceLabel, WKInterfaceTextField, WKInterfacePicker 사용  

### WKInterfaceTextField
TextField 터치 시 입력을 받을 수 있는 기능이 실행되고  
입력이 끝남과 동시에 실행되는 IBAction으로 변화되는 값을 캐치할 수 있다.  

### WKInterfacePicker
DataSource로 WKPickerItem 리스트를 만들어 setItems 함수로 설정해야한다.  
List(기본 텍스트), Stack(이미지 스택), Sequence(이미지 애니메이션) 3가지 style을 지원한다.  
WKInterfaceTextField와 동일하게 IBAction을 만들어 변화되는 값을 캐치할 수 있다.  

### 화면전환
presentController(withName: <#T##String#>, context: <#T##Any?#>)  
-> 새로운 single interface controller를 띄워준다.  
pushController(withName: <#T##String#>, context: <#T##Any?#>)  
-> 새로운 interface controller를 스택으로 쌓는다.  
popToRootController()  
-> 위에 쌓여있는 모든 controller를 제거하고 Root controller로 돌아간다.  
