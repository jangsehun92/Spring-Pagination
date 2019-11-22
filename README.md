# Pagination
Spring에서 게시물 페이징 처리

참고한 글 : <https://okky.kr/article/282819>

* 페이징이란?
  * 게시글을 한번에 다보여주는 것이 아닌 원하는 만큼만 보여주기 위한 방법
  
  ![board_pagination](https://user-images.githubusercontent.com/55639153/69460168-ccd5e400-0db6-11ea-83b8-f385c5ac906c.jpeg)
> > -css는 부트스트랩을 사용


 * 과정
1. 사용자가 서버에 요청(페이지 요청)

       http://localhost/articles?page=2

2. controller 에서 page값을 받아 게시글 리스트를 가져오는 service 호출

**controller**

![pageRequest](https://user-images.githubusercontent.com/55639153/69297977-dd1f7f00-0c4f-11ea-84bc-95d17ad0d6e9.jpeg)

3. service 에서 dao를 통해 DB 조회 후 pagination 객체와 게시글List를 return

**service**

![boardService](https://user-images.githubusercontent.com/55639153/69297978-dee94280-0c4f-11ea-857b-1e5b745e55f2.jpeg)

**dao**

![boardRepository](https://user-images.githubusercontent.com/55639153/69297979-e01a6f80-0c4f-11ea-86c1-692363c606a0.jpeg)

**boardMapper.xml**

![boardMapper](https://user-images.githubusercontent.com/55639153/69298212-8bc3bf80-0c50-11ea-88cf-b891d8f38adc.jpeg)

4. controller 에서 model에 객체를 담아 사용자에게 전달(view리턴)

* * *

## Spring과 DB연결(Oracle11g)
* fom.xml에 OracleDB를 사용하기 위한 디펜던시 추가

![fom xml-oracleDependency](https://user-images.githubusercontent.com/55639153/69061314-39ba4880-0a5c-11ea-8969-4f0d17da2a05.jpeg)

![fom xml-oracleDependency2](https://user-images.githubusercontent.com/55639153/69061318-3b840c00-0a5c-11ea-9283-be53222bba52.jpeg)

* resources > properties & sqls 

![resources properties sqls](https://user-images.githubusercontent.com/55639153/69061324-3d4dcf80-0a5c-11ea-8013-4e5a1f20a718.jpeg)

* src > main > webapp > WEB-INF > spring > sqls

![spring sqls](https://user-images.githubusercontent.com/55639153/69061326-3fb02980-0a5c-11ea-8456-b00d4278196f.jpeg)

* config.xml 에서 사용할 DTO와 MAPPER 위치 설정

      <?xml version="1.0" encoding="UTF-8"?>
      <!DOCTYPE configuration PUBLIC "-//mybatis.org//DTD Config 3.0//EN" "http://mybatis.org/dtd/mybatis-3-config.dtd" >
      <configuration>

        <!-- 패키지.domain클래스 까지 입력 -->
        <typeAliases>
          <!-- <typeAlias type="jsh.project.pagination.board.dto.Article" alias="Article"/>  -->
        </typeAliases>

        <!-- mapper의 위치를 잡아준다. -->
        <mappers>
          <!-- 게시판 관련 -->
          <mapper resource="/sqls/board/board.xml"/>
        </mappers>

      </configuration>

* root-context.xml DB 관련 bean 설정

      <bean class="org.springframework.beans.factory.config.PropertyPlaceholderConfigurer">
         <property name="locations">
          <list>
            <value>classpath:properties/db.properties</value>
          </list>
        </property>
      </bean>

      <!-- dataSource -->
      <bean id="dataSource" class="org.apache.commons.dbcp.BasicDataSource">
        <property name="driverClassName" value="${driver}" />
        <property name="url" value="${url}" />
        <property name="username" value="${username}" />
        <property name="password" value="${password}" />
        <property name="defaultAutoCommit" value="false" />
      </bean>

      <!-- @Transactional annotation을 사용해주기 위한 bean 설정 -->
      <bean id="transactionManager" class="org.springframework.jdbc.datasource.DataSourceTransactionManager">
        <property name="dataSource" ref="dataSource" />
      </bean>

      <tx:annotation-driven />

      <bean id="sqlSession" class="org.mybatis.spring.SqlSessionFactoryBean">
        <property name="dataSource" ref="dataSource" />
        <property name="configLocation" value="WEB-INF/spring/sqls/config.xml" />
      </bean>

      <!-- session.open & session.close 를 알아서 해줄것임 -->
      <bean id="sqlSessionTemplate" class="org.mybatis.spring.SqlSessionTemplate">
        <constructor-arg ref="sqlSession" />
      </bean>

