# POPCO Infrastructure

POPCO 프로젝트의 Docker 기반 인프라 설정 및 실행 환경을 관리하는 레포지토리입니다.

## 🏗️ 서비스 구성

- **popco-admin**: 관리자 API 서버 (Spring Boot, Port: 8081)
- **popco-client**: 클라이언트 API 서버 (Spring Boot, Port: 8082)
- **nginx**: 프론트엔드 웹 서버 (Port: 80)
- **mysql**: 데이터베이스 (Port: 3306)
- **redis**: 캐시 서버 (Port: 6379)

## 🚀 빠른 시작

### 1. 사전 준비
- Docker Desktop 설치

### 2. 프로젝트 클론 : (Infra, Admin, Client, Front, AI(나중에 추가)) 모두 다 각각의 프로젝트로 클론 하셔야합니다.
```bash
git clone https://github.com/Eureka-final-popco/Popco-Infra.git
cd Popco-Infra
```
![image](https://github.com/user-attachments/assets/c9e6afdd-15ce-4f7f-a3a4-f0ff6c4a9e30)

popco/
![image](https://github.com/user-attachments/assets/ba5ee928-63d3-42f9-a184-c3808a777c0c)

popco 폴더 안에 모든 프로젝트가 각각 클론 되어있어야합니다!!

### 3. 환경 설정
```bash
# .env 파일 생성 (팀 Discord 에서 실제 값 확인)
- .gitignore 처리되어 있습니다. 팀 디코 - 자료방에 올려두겠습니다.

# application-local.properties 및 application-secret.properties 작성
- gitignore 처리되어 있습니다. 팀 디코 - 자료방에 올려두겠습니다.
```

### 4. 서비스 실행
```bash
# 모든 서비스 빌드 및 실행
docker-compose up --build

# 백그라운드 실행
docker-compose up --build -d
```

### 5. 접속 확인
- **프론트엔드**: http://localhost
- **Admin API**: http://localhost:8081
- **Client API**: http://localhost:8082

## 📁 폴더 구조

```
popco-infra/
├── docker-compose.yml          # 로컬 개발용 Docker 설정
├── docker-compose-deploy.yml   # 배포용 Docker 설정
├── .env                        # 환경변수 (Git 제외)
├── mysql/
│   └── init/                  # MySQL 초기화 스크립트
├── config/
│   └── exporter.cnf          # MySQL 모니터링 설정
└── README.md                 # 이 파일
```

## 🔧 주요 명령어

### 서비스 관리
```bash
# 서비스 시작 
docker-compose up --build

# 서비스 중지
docker-compose down

# 특정 서비스만 재시작
docker-compose up --build popco-admin

# 서비스 상태 확인
docker-compose ps
```

## 🔄 개발 워크플로우

### 코드 변경 시
1. 각 서버 프로젝트에서 코드 수정
2. infra 폴더에서 해당 서비스 재빌드
```bash
# Admin 서버 변경 시
docker-compose up --build popco-admin

# Client 서버 변경 시  
docker-compose up --build popco-client
```

### 전체 재시작
```bash
docker-compose down
docker-compose up --build -d
```

## 🌐 각 서버 레포지토리

- **Admin Server**: https://github.com/Eureka-final-popco/Popco-Admin.git
- **Client Server**: https://github.com/Eureka-final-popco/Popco-Client.git
- **Frontend**: https://github.com/Eureka-final-popco/Popco-Front.git
- **AI Server**: https://github.com/your-org/popco-ai (추후 추가 예정)

## 🐛 문제 해결

### 포트 충돌 오류
```bash
# 사용 중인 포트 확인
netstat -tulpn | grep :3306
netstat -tulpn | grep :8080

# 기존 프로세스 종료 후 재시작
docker-compose down
docker-compose up --build
```

### 데이터베이스 연결 오류
1. MySQL 컨테이너 상태 확인: `docker-compose ps`
2. MySQL 로그 확인: `docker-compose logs mysql`
3. 환경변수 확인: `.env` 파일의 DB 설정 점검

## 📋 환경변수 설명

| 변수명 | 설명 | 예시값 |
|--------|------|--------|
| `MYSQL_ROOT_PASSWORD` | MySQL root 비밀번호 | 00000000 | <- 실제 비번 아닙니다.
| `MYSQL_DATABASE` | 기본 데이터베이스명 | popco_db |
| `MYSQL_USER` | 애플리케이션 DB 사용자 | popco_user |
| `MYSQL_PASSWORD` | 애플리케이션 DB 비밀번호 | 00000000 |
| `DB_HOST` | DB 호스트 (Docker 서비스명) | popco-mysql |
| `SPRING_PROFILES_ACTIVE` | Spring 프로파일 | docker |

## 👥 팀 협업

### 새로운 팀원 온보딩
1. 이 레포지토리 클론
2. 각 서버 레포지토리 클론 (별도 폴더에)
3. `.env` 파일 설정 (Discord 에서 실제 값 확인)
4. `docker-compose up --build` 실행
5. 브라우저에서 http://localhost/도커포트 접속 확인

### 변경사항 배포
1. 각 서버에서 개발 완료
2. Docker Hub에 이미지 푸시
3. `docker-compose-deploy.yml` 사용하여 배포

## 📞 지원

문제가 발생하면 팀 Discord 채널에서 도움을 요청해주세요!

---

**POPCO Development Team** 🚀
