CREATE TABLE "Movie" (
	"m_id"	INTEGER		NOT NULL,
	"m_type"	VARCHAR(20)		NULL,
	"m_name"	VARCHAR(20)		NOT NULL,
	"start_year"	DATE		NULL,
	"end_year"	DATE		NULL,
	"runtimes"	INTEGER		NOT NULL,
	"is_adult"	BOOLEAN		NULL,
	"m_rating"	INTEGER		NOT NULL,
	"votes"	INTEGER		NOT NULL
);

COMMENT ON COLUMN "Movie"."m_id" IS '영화 ID';

COMMENT ON COLUMN "Movie"."m_type" IS '영화 유형';

COMMENT ON COLUMN "Movie"."m_name" IS '영화 제목';

COMMENT ON COLUMN "Movie"."start_year" IS '출시 년도';

COMMENT ON COLUMN "Movie"."end_year" IS '종료 년도';

COMMENT ON COLUMN "Movie"."runtimes" IS '러닝타임';

COMMENT ON COLUMN "Movie"."is_adult" IS '성인영화여부';

COMMENT ON COLUMN "Movie"."m_rating" IS '평점';

COMMENT ON COLUMN "Movie"."votes" IS '투표수';

CREATE TABLE "Genre" (
	"g_id"	INTEGER		NOT NULL,
	"g_name"	VARCHAR(20)		NOT NULL
);

COMMENT ON COLUMN "Genre"."g_id" IS '장르 ID';

COMMENT ON COLUMN "Genre"."g_name" IS '장르명';

CREATE TABLE "Customer" (
	"c_id"	INTEGER		NOT NULL,
	"c_name"	VARCHAR(20)		NOT NULL,
	"email"	VARCHAR(40)		NOT NULL,
	"pwd"	VARCHAR(20)		NOT NULL,
	"gender"	CHAR(1)		NULL,
	"p_num"	INTEGER		NOT NULL
);

COMMENT ON COLUMN "Customer"."c_id" IS '소비자 ID';

COMMENT ON COLUMN "Customer"."c_name" IS '소비자 이름';

COMMENT ON COLUMN "Customer"."email" IS '이메일 주소';

COMMENT ON COLUMN "Customer"."pwd" IS '비밀번호';

COMMENT ON COLUMN "Customer"."gender" IS '성별';

COMMENT ON COLUMN "Customer"."p_num" IS '휴대폰 번호';

CREATE TABLE "Participant" (
	"p_id"	INTEGER		NOT NULL,
	"p_name"	VARCHAR(30)		NOT NULL,
	"major_work"	VARCHAR(20)		NULL
);

COMMENT ON COLUMN "Participant"."p_id" IS '영화 참여자 ID';

COMMENT ON COLUMN "Participant"."p_name" IS '영화 참여자 이름';

COMMENT ON COLUMN "Participant"."major_work" IS '대표 작품';

CREATE TABLE "Comment_to" (
	"c_id"	INTEGER		NOT NULL,
	"m_id"	INTEGER		NOT NULL,
	"rating"	INTEGER		NOT NULL,
	"comment"	TEXT		NOT NULL,
	"write_date"	DATE		NOT NULL
);

COMMENT ON COLUMN "Comment_to"."c_id" IS '소비자 ID';

COMMENT ON COLUMN "Comment_to"."m_id" IS '영화 ID';

COMMENT ON COLUMN "Comment_to"."rating" IS '평점';

COMMENT ON COLUMN "Comment_to"."comment" IS '코멘트 내용';

COMMENT ON COLUMN "Comment_to"."write_date" IS '평점을 남긴 날짜';

CREATE TABLE "Watch" (
	"w_id"	INTEGER		NOT NULL,
	"c_id"	INTEGER		NOT NULL,
	"m_id"	INTEGER		NOT NULL,
	"watch_date"	DATE		NOT NULL,
	"pause_time"	TIMESTAMP		NOT NULL
);

COMMENT ON COLUMN "Watch"."w_id" IS '시청 기록 ID';

COMMENT ON COLUMN "Watch"."c_id" IS '소비자 ID';

COMMENT ON COLUMN "Watch"."m_id" IS '영화 ID';

COMMENT ON COLUMN "Watch"."watch_date" IS '시청한 날짜';

COMMENT ON COLUMN "Watch"."pause_time" IS '중단 시점';

CREATE TABLE "Profession" (
	"pr_id"	INTEGER		NOT NULL,
	"pr_name"	VARCHAR(20)		NOT NULL
);

COMMENT ON COLUMN "Profession"."pr_id" IS '직업 ID';

COMMENT ON COLUMN "Profession"."pr_name" IS '직업 이름';

CREATE TABLE "Participate" (
	"p_id"	INTEGER		NOT NULL,
	"m_id"	INTEGER		NOT NULL,
	"role"	VARCHAR(20)		NULL,
	"casting"	VARCHAR(20)		NULL
);

COMMENT ON COLUMN "Participate"."p_id" IS '영화 참여자 ID';

COMMENT ON COLUMN "Participate"."m_id" IS '영화 ID';

COMMENT ON COLUMN "Participate"."role" IS '역할';

COMMENT ON COLUMN "Participate"."casting" IS '배역';

CREATE TABLE "Prefer" (
	"c_id"	INTEGER		NOT NULL,
	"g_id"	INTEGER		NOT NULL
);

COMMENT ON COLUMN "Prefer"."c_id" IS '소비자 ID';

COMMENT ON COLUMN "Prefer"."g_id" IS '장르 ID';

CREATE TABLE "Classify" (
	"m_id"	INTEGER		NOT NULL,
	"g_id"	INTEGER		NOT NULL
);

COMMENT ON COLUMN "Classify"."m_id" IS '영화 ID';

COMMENT ON COLUMN "Classify"."g_id" IS '장르 ID';

CREATE TABLE "Work" (
	"p_id"	INTEGER		NOT NULL,
	"pr_id"	INTEGER		NOT NULL
);

COMMENT ON COLUMN "Work"."p_id" IS '영화 참여자 ID';

COMMENT ON COLUMN "Work"."pr_id" IS '직업 ID';

ALTER TABLE "Movie" ADD CONSTRAINT "PK_MOVIE" PRIMARY KEY (
	"m_id"
);

ALTER TABLE "Genre" ADD CONSTRAINT "PK_GENRE" PRIMARY KEY (
	"g_id"
);

ALTER TABLE "Customer" ADD CONSTRAINT "PK_CUSTOMER" PRIMARY KEY (
	"c_id"
);

ALTER TABLE "Participant" ADD CONSTRAINT "PK_PARTICIPANT" PRIMARY KEY (
	"p_id"
);

ALTER TABLE "Comment_to" ADD CONSTRAINT "PK_COMMENT_TO" PRIMARY KEY (
	"c_id",
	"m_id"
);

ALTER TABLE "Watch" ADD CONSTRAINT "PK_WATCH" PRIMARY KEY (
	"w_id",
	"c_id",
	"m_id"
);

ALTER TABLE "Profession" ADD CONSTRAINT "PK_PROFESSION" PRIMARY KEY (
	"pr_id"
);

ALTER TABLE "Participate" ADD CONSTRAINT "PK_PARTICIPATE" PRIMARY KEY (
	"p_id",
	"m_id"
);

ALTER TABLE "Prefer" ADD CONSTRAINT "PK_PREFER" PRIMARY KEY (
	"c_id",
	"g_id"
);

ALTER TABLE "Classify" ADD CONSTRAINT "PK_CLASSIFY" PRIMARY KEY (
	"m_id",
	"g_id"
);

ALTER TABLE "Work" ADD CONSTRAINT "PK_WORK" PRIMARY KEY (
	"p_id",
	"pr_id"
);

ALTER TABLE "Comment_to" ADD CONSTRAINT "FK_Customer_TO_Comment_to_1" FOREIGN KEY (
	"c_id"
)
REFERENCES "Customer" (
	"c_id"
);

ALTER TABLE "Comment_to" ADD CONSTRAINT "FK_Movie_TO_Comment_to_1" FOREIGN KEY (
	"m_id"
)
REFERENCES "Movie" (
	"m_id"
);

ALTER TABLE "Watch" ADD CONSTRAINT "FK_Customer_TO_Watch_1" FOREIGN KEY (
	"c_id"
)
REFERENCES "Customer" (
	"c_id"
);

ALTER TABLE "Watch" ADD CONSTRAINT "FK_Movie_TO_Watch_1" FOREIGN KEY (
	"m_id"
)
REFERENCES "Movie" (
	"m_id"
);

ALTER TABLE "Participate" ADD CONSTRAINT "FK_Participant_TO_Participate_1" FOREIGN KEY (
	"p_id"
)
REFERENCES "Participant" (
	"p_id"
);

ALTER TABLE "Participate" ADD CONSTRAINT "FK_Movie_TO_Participate_1" FOREIGN KEY (
	"m_id"
)
REFERENCES "Movie" (
	"m_id"
);

ALTER TABLE "Prefer" ADD CONSTRAINT "FK_Customer_TO_Prefer_1" FOREIGN KEY (
	"c_id"
)
REFERENCES "Customer" (
	"c_id"
);

ALTER TABLE "Prefer" ADD CONSTRAINT "FK_Genre_TO_Prefer_1" FOREIGN KEY (
	"g_id"
)
REFERENCES "Genre" (
	"g_id"
);

ALTER TABLE "Classify" ADD CONSTRAINT "FK_Movie_TO_Classify_1" FOREIGN KEY (
	"m_id"
)
REFERENCES "Movie" (
	"m_id"
);

ALTER TABLE "Classify" ADD CONSTRAINT "FK_Genre_TO_Classify_1" FOREIGN KEY (
	"g_id"
)
REFERENCES "Genre" (
	"g_id"
);

ALTER TABLE "Work" ADD CONSTRAINT "FK_Participant_TO_Work_1" FOREIGN KEY (
	"p_id"
)
REFERENCES "Participant" (
	"p_id"
);

ALTER TABLE "Work" ADD CONSTRAINT "FK_Profession_TO_Work_1" FOREIGN KEY (
	"pr_id"
)
REFERENCES "Profession" (
	"pr_id"
);

ALTER TABLE "Comment_to"
ADD CONSTRAINT fk_customer
FOREIGN KEY (c_id)
REFERENCES "Customer" (c_id)
ON DELETE CASCADE;

CREATE OR REPLACE FUNCTION ensure_three_genres()
RETURNS TRIGGER AS $$
BEGIN
    IF (SELECT COUNT(*) FROM "Prefer" WHERE c_id = NEW.c_id) <> 3 THEN
        RAISE EXCEPTION '각 Customer는 반드시 3개의 선호 장르를 가져야 합니다.';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER check_three_genres
BEFORE INSERT OR UPDATE ON "Prefer"
FOR EACH ROW
EXECUTE FUNCTION ensure_three_genres();