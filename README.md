# Cardoc

## 프로젝트 실행

아래의 경로에서 프로젝트 파일을 실행하고 빌드해주세요
```
Cardoc/Cardoc/Cardoc.xcworkspace
```
iPhone 12 이전 시뮬레이터에서 사용하는 것을 권장드립니다.

## 사용스택
- Rxswift, Rxcocoa, RxGesture, Alamofire, Kingfisher, MarkdownView


### 앱 구조
<details>
  <summary>앱 구조 상세 보기</summary>
 <div markdown="앱 구조">
 
 |<img src="https://user-images.githubusercontent.com/69951890/141674016-d5b6b597-7eab-41fb-87b7-4d56b3619bb0.png" width="540" height="400">|
 |:---:|
 |**앱 구조**|
   
 - MVVM + Coordinator 패턴
 - Storyboard + RxSwift 구현
 
</div>
</details>

### 유저 검색화면
<details>
 <summary>유저 검색화면 상세 보기</summary>
<div markdown="유저 검색화면">
  
|<img src="https://user-images.githubusercontent.com/69951890/141673342-09b29623-b7b1-44b8-bb61-d92d17f13619.gif" width="270">|
|:---:|
|**유저 검색 화면**|
  
- 검색창에 user 이름 검색
- 검색결과는 30개 단위로 페이징 처리

</div>
</details>

### 유저 상세화면
<details>
 <summary>유저 상세화면 상세 보기</summary>
<div markdown="유저 상세화면">
  
|<img src="https://user-images.githubusercontent.com/69951890/141673647-e6eaa91d-ae30-41a2-920b-1eb3cec70c34.gif" width="270">|
|:---:|
|**유저 상세 화면**|

- Repository List 중 하나를 선택하면 레포 상세화면으로 이동한다.
- 아바타 이미지 및 유저이름을 터치하면 유저 링크를 웹에서 연다.

</div>
</details>  
  
### 레포 상세화면
<details>
 <summary>레포 상세화면 상세 보기</summary>
<div markdown="레포 상세화면">
  
|<img src="https://user-images.githubusercontent.com/69951890/141673795-5f2e37d3-56c8-4afc-a488-32071088398f.gif" width="270">|
|:---:|
|**레포 상세화면**|
  
- Repository 링크를 터치하면 Repository를 웹에서 연다.
- Readme.md 파일이 존재하면 화면에 markdown 형식으로 출력한다.

</div>
</details>  
  
### 웹뷰 이동화면
<details>
 <summary>웹뷰 이동화면 상세 보기</summary>
<div markdown="웹뷰 이동화면">
  
|<img src="https://user-images.githubusercontent.com/69951890/141673839-b7ae7ff0-0a06-451b-8266-4d5d1c7c544d.gif" width="270">|
|:---:|
|**웹뷰 이동화면**|  

</div>
</details>
