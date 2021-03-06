# Watpago
간단한 생활표현을 외국어로 검색할 수 있는 애플워치용 번역앱  

- watchOS용 WatchKit 적용  
- 한국어 -> 영어, 프랑스어 번역 가능  
- **한국어 -> 일본어, 중국어, 스페인어, 중국어 간체, 스페인어, 러시아어, 태국어, 인도네시아어, 독일어, 이탈리아어 추가**  
- **발음 읽어주기 Speak 기능**  
- **사용 언어 선택, 볼륨 조절 기능 추가**  

- 네이버 파파고 API 사용  
https://developers.naver.com/products/papago/nmt/nmt.md  

- - -
## UI

![](https://github.com/KKANG00/Watpago/blob/main/ScreenShots2.png)
![](https://github.com/KKANG00/Watpago/blob/main/ScreenShots3.png)

WKInterfaceLabel, WKInterfaceTextField, WKInterfacePicker, WKInterfaceTable, WKInterfaceSlider  

## Troubleshotting  
api request에 대한 response를 받기 전에 화면이 넘어가는 Networking 비동기 처리 이슈  

- Delegate Protocol 구현  
```
protocol ApiCallerDelegate {  
    func sendTranslatedText(_ resultText: String)  
}  
```

- AskPageController 내의 delegate 함수  
api response를 받았을 때 delegate 함수를 실행하여 번역결과 전달 및 내부에서 화면 전환  

## TODO
### 기능추가
1. ~~User Default: 기본 언어설정, 사용할 언어 선택 => 설정화면 추가필요~~  
2. ~~읽어주기 기능 (발음)~~  
**AVFoundation 사용**  
3. 언어감지 api 추가로 입력 텍스트 다국어 지원  
4. ~~번역가능 언어 추가~~  
**(한국어 -> 영어, 일본어, 중국어, 스페인어, 중국어 간체, 스페인어, 프랑스어, 러시아어, 태국어, 인도네시아어, 독일어, 이탈리아어)**  

### 에러처리(+에러화면)
1. 네트워크 통신 실패시  
2. 입력이 너무 긴경우  

### 기타
1. Picker title 밑에 잘리는부분 수정  
2. ~~show me 버튼 한번 눌리고 비활성화~~  
3. 앱이름  
4. 앱 아이콘    
5. API 사용량  
6. ~~Save 버튼 눌리고 확인효과 or 화면 전환 필요~~  
7. ~~설정 창 변경 시 자동 저장되도록 변경~~  
