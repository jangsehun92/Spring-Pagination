# Pagination
Spring에서 게시물 페이징 처리

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
