# Watpago
간단한 생활표현을 영어나 프랑스어로 검색할 수 있는 애플워치용 번역앱  

- watchOS용 WatchKit 적용  
- 한국어 -> 영어, 프랑스어 번역 기능 구현  

- 네이버 파파고 API 사용  
https://developers.naver.com/products/papago/nmt/nmt.md  
네이버 파파고 API는 한국어(ko)-영어(en), 한국어(ko)-일본어(ja), 한국어(ko)-중국어 간체(zh-CN), 한국어(ko)-중국어 번체(zh-TW), 한국어(ko)-스페인어(es), 한국어(ko)-프랑스어(fr), 한국어(ko)-러시아어(ru), 한국어(ko)-베트남어(vi), 한국어(ko)-태국어(th), 한국어(ko)-인도네시아어(id), 한국어(ko)-독일어(de), 한국어(ko)-이탈리아어(it), 중국어 간체(zh-CN) - 중국어 번체(zh-TW), 중국어 간체(zh-CN) - 일본어(ja), 중국어 번체(zh-TW) - 일본어(ja), 영어(en)-일본어(ja), 영어(en)-중국어 간체(zh-CN), 영어(en)-중국어 번체(zh-TW), 영어(en)-프랑스어(fr)를 지원합니다.  

- - -
## UI

![](https://github.com/KKANG00/Watpago/blob/main/ScreenShots2.png)

WKInterfaceLabel, WKInterfaceTextField, WKInterfacePicker

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
1. User Default: 기본 언어설정, 사용할 언어 선택 => 설정화면 추가필요  
2. ~~읽어주기 기능 (발음)~~  
AVFoundation 사용  
3. 언어감지 추가로 다국어 번역 지원  
4. ~~번역가능 언어 추가~~  
(한국어 -> 영어, 일본어, 중국어, 스페인어, 중국어 간체, 스페인어, 프랑스어, 러시아어, 태국어, 인도네시아어, 독일어, 이탈리아어)  

### 에러처리(+에러화면)
1. api 통신 실패시  
2. 입력이 너무 긴경우 등등  

### 기타
1. English 밑에짤리는거 수정  
2. ~~show me 버튼 한번 눌리고 비활~~  
3. 앱이름  
4. 앱 아이콘    
5. API 사용량  
 
