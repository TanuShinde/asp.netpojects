create database UserRegistrationDB

CREATE TABLE [dbo].[UserRegistration](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[Contact] [varchar](50) NULL,
	[Gender] [varchar](10) NULL,
	[Address] [varchar](250) NULL,
	[Username] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
 CONSTRAINT [PK_UserRegistration] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]


create proc UserAddOrEdit
@UserID int,
@FirstName varchar(50),
@LastName varchar(50),
@Contact varchar(50),
@Gender varchar(10),
@Address varchar(250),
@Username varchar(50),
@Password varchar(50)
AS
	IF @UserID = 0
	BEGIN
		INSERT INTO UserRegistration (FirstName,LastName,Contact,Gender,Address,Username,Password)
		VALUES (@FirstName,@LastName,@Contact,@Gender,@Address,@Username,@Password)
	END
	ELSE
	BEGIN
		UPDATE UserRegistration
		SET
			FirstName = @FirstName,
			LastName = @LastName,
			Contact = @Contact,
			Gender = @Gender,
			Address = @Address,
			Username=@Username,
			Password = @Password
		WHERE UserID = @UserID
	END
	
<--2nd->
	
Create PROC UserViewByID
@UserID int
AS
	SELECT *
	FROM UserRegistration
	WHERE UserID = @UserID