# Pagination
Spring에서 게시물 페이징 처리

참고한 글 : <https://okky.kr/article/282819>

* 페이징이란?
  * 게시글을 한번에 다보여주는 것이 아닌 원하는 만큼만 보여주기 위한 방법
  
  ![board_pagination](https://user-images.githubusercontent.com/55639153/69460168-ccd5e400-0db6-11ea-83b8-f385c5ac906c.jpeg)
>  css는 부트스트랩을 사용

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>


 * 과정
1. 사용자가 서버에 요청(페이지 요청)

       http://localhost/articles?page=2

2. controller 에서 page값을 받아 게시글 리스트를 가져오는 service 호출

**- controller**

![pageRequest](https://user-images.githubusercontent.com/55639153/69297977-dd1f7f00-0c4f-11ea-84bc-95d17ad0d6e9.jpeg)

3. service 에서 dao를 통해 DB 조회 후 pagination 객체와 게시글List를 return

**- service**

![boardService](https://user-images.githubusercontent.com/55639153/69297978-dee94280-0c4f-11ea-857b-1e5b745e55f2.jpeg)

**- dao**

![boardRepository](https://user-images.githubusercontent.com/55639153/69297979-e01a6f80-0c4f-11ea-86c1-692363c606a0.jpeg)

**- boardMapper.xml**

![boardMapper](https://user-images.githubusercontent.com/55639153/69298212-8bc3bf80-0c50-11ea-88cf-b891d8f38adc.jpeg)

4. controller 에서 model에 객체를 담아 사용자에게 전달(view리턴)

* * *

## Spring과 DB연결(Oracle11g)

* OracleDB : https://github.com/jangsehun92/SpringOracleDB
