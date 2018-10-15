ALTER DATABASE dnakitare CHARACTER SET utf8 COLLATE utf8_unicode_ci;

DROP TABLE IF EXISTS articleTag;
DROP TABLE IF EXISTS article;
DROP TABLE IF EXISTS tag;
DROP TABLE IF EXISTS author;

CREATE TABLE author(
	authorId BINARY(16) NOT NULL,
	authorAvatarUrl VARCHAR(255),
	authorActivationToken CHAR(32),
	authorEmail VARCHAR(128) NOT NULL,
	authorHash CHAR(96) NOT NULL,
	authorUsername VARCHAR(32) NOT NULL,
	UNIQUE(authorEmail),
	UNIQUE(authorUsername),
	INDEX(authorEmail),
	PRIMARY KEY(authorId)
);

CREATE TABLE tag(
	tagId BINARY(16) NOT NULL,
	tagName VARCHAR(32) NOT NULL,
	PRIMARY KEY(tagId)
);

CREATE TABLE article(
	articleId BINARY(16) NOT NULL,
	articleAuthorId BINARY(16) NOT NULL,
	articleContent TEXT NOT NULL,
	articleDate DATETIME(6) NOT NULL,

	INDEX(articleAuthorId),
	FOREIGN KEY(articleAuthorId) REFERENCES author(authorId),
	PRIMARY KEY(articleId)
);

CREATE TABLE articleTag(
	articleTagArticleId CHAR (16) NOT NULL,
	articleTagTagId BINARY (16) NOT NULL,
	INDEX (articleTagArticleId),
	INDEX (articleTagTagId),
	FOREIGN KEY (articleTagArticleId) REFERENCES article(articleId),
	FOREIGN KEY (articleTagTagId) REFERENCES tag(tagId),
	PRIMARY KEY (articleTagArticleId, articleTagTagId)
);