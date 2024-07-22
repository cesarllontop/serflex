USE [BDSIGAC6]
GO

/****** Object:  Table [dbo].[SFAMA816]    Script Date: 26/06/2024 16:54:19 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[SFAMA816](
	[FA816NORD] [char](6) NOT NULL,
	[FA816NITE] [char](2) NOT NULL,
	[FA816ITCL] [char](20) NOT NULL,
	[FA816MARC] [char](2) NOT NULL,
	[FA816ESPA] [char](30) NOT NULL,
	[FA816CDES] [char](3) NOT NULL,
	[FA816CDCO] [char](3) NOT NULL,
	[FA816CDTA] [char](2) NOT NULL,
	[FA816FEMP] [char](3) NOT NULL,
	[FA816CBAR] [char](20) NOT NULL,
	[FA816CUPC] [char](12) NOT NULL,
	[FA816PETI] [decimal](7, 2) NOT NULL,
	[FA816CP01] [int] NOT NULL,
	[FA816CP02] [int] NOT NULL,
	[FA816CP03] [int] NOT NULL,
	[FA816CP04] [int] NOT NULL,
	[FA816CP05] [int] NOT NULL,
	[FA816CP06] [int] NOT NULL,
	[FA816CP07] [int] NOT NULL,
	[FA816CP08] [int] NOT NULL,
	[FA816CP09] [int] NOT NULL,
	[FA816CP10] [int] NOT NULL,
	[FA816CP11] [int] NOT NULL,
	[FA816CP12] [int] NOT NULL,
	[FA816CP13] [int] NOT NULL,
	[FA816PRUN] [decimal](10, 4) NOT NULL,
	[FA816IMPO] [decimal](17, 2) NOT NULL,
	[FA816CCOR] [int] NOT NULL,
	[FA816CADE] [int] NOT NULL,
	[FA816PESO] [decimal](7, 2) NOT NULL,
	[FA816CPTO] [int] NOT NULL,
	[FA816CLAS] [bit] NOT NULL,
	[FA816CDCJ] [char](2) NOT NULL,
	[FA816PC01] [int] NOT NULL,
	[FA816PC02] [int] NOT NULL,
	[FA816PC03] [int] NOT NULL,
	[FA816PC04] [int] NOT NULL,
	[FA816PC05] [int] NOT NULL,
	[FA816PC06] [int] NOT NULL,
	[FA816PC07] [int] NOT NULL,
	[FA816PC08] [int] NOT NULL,
	[FA816PC09] [int] NOT NULL,
	[FA816PC10] [int] NOT NULL,
	[FA816PC11] [int] NOT NULL,
	[FA816PC12] [int] NOT NULL,
	[FA816PC13] [int] NOT NULL,
	[FA816DESC] [varchar](50) NOT NULL,
	[FA816CDAR] [char](11) NOT NULL,
 CONSTRAINT [PK_SFAMA816] PRIMARY KEY CLUSTERED 
(
	[FA816NORD] ASC,
	[FA816NITE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[SFAMA816] ADD  CONSTRAINT [DF_SFAMA816_FA816ITCL]  DEFAULT ('') FOR [FA816ITCL]
GO

ALTER TABLE [dbo].[SFAMA816] ADD  CONSTRAINT [DF_SFAMA816_FA816MARC]  DEFAULT ('') FOR [FA816MARC]
GO

ALTER TABLE [dbo].[SFAMA816] ADD  CONSTRAINT [DF_SFAMA816_FA816ESPA]  DEFAULT ('') FOR [FA816ESPA]
GO

ALTER TABLE [dbo].[SFAMA816] ADD  CONSTRAINT [DF_SFAMA816_FA816CDES]  DEFAULT ('') FOR [FA816CDES]
GO

ALTER TABLE [dbo].[SFAMA816] ADD  CONSTRAINT [DF_SFAMA816_FA816COLO]  DEFAULT ('') FOR [FA816CDCO]
GO

ALTER TABLE [dbo].[SFAMA816] ADD  CONSTRAINT [DF_SFAMA816_FA816CDTA]  DEFAULT ('') FOR [FA816CDTA]
GO

ALTER TABLE [dbo].[SFAMA816] ADD  CONSTRAINT [DF_SFAMA816_FA816FEMP]  DEFAULT ('NIU') FOR [FA816FEMP]
GO

ALTER TABLE [dbo].[SFAMA816] ADD  CONSTRAINT [DF_SFAMA816_FA816CBAR]  DEFAULT ('') FOR [FA816CBAR]
GO

ALTER TABLE [dbo].[SFAMA816] ADD  CONSTRAINT [DF_SFAMA816_FA816CUPC]  DEFAULT ('') FOR [FA816CUPC]
GO

ALTER TABLE [dbo].[SFAMA816] ADD  CONSTRAINT [DF_SFAMA816_FA816PETI]  DEFAULT ((0.00)) FOR [FA816PETI]
GO

ALTER TABLE [dbo].[SFAMA816] ADD  CONSTRAINT [DF_SFAMA816_FA816CT01]  DEFAULT ((0)) FOR [FA816CP01]
GO

ALTER TABLE [dbo].[SFAMA816] ADD  CONSTRAINT [DF_SFAMA816_FA816CT02]  DEFAULT ((0)) FOR [FA816CP02]
GO

ALTER TABLE [dbo].[SFAMA816] ADD  CONSTRAINT [DF_SFAMA816_FA816CT03]  DEFAULT ((0)) FOR [FA816CP03]
GO

ALTER TABLE [dbo].[SFAMA816] ADD  CONSTRAINT [DF_SFAMA816_FA816CT04]  DEFAULT ((0)) FOR [FA816CP04]
GO

ALTER TABLE [dbo].[SFAMA816] ADD  CONSTRAINT [DF_SFAMA816_FA816CT05]  DEFAULT ((0)) FOR [FA816CP05]
GO

ALTER TABLE [dbo].[SFAMA816] ADD  CONSTRAINT [DF_SFAMA816_FA816CT06]  DEFAULT ((0)) FOR [FA816CP06]
GO

ALTER TABLE [dbo].[SFAMA816] ADD  CONSTRAINT [DF_SFAMA816_FA816CT07]  DEFAULT ((0)) FOR [FA816CP07]
GO

ALTER TABLE [dbo].[SFAMA816] ADD  CONSTRAINT [DF_SFAMA816_FA816CT08]  DEFAULT ((0)) FOR [FA816CP08]
GO

ALTER TABLE [dbo].[SFAMA816] ADD  CONSTRAINT [DF_SFAMA816_FA816CT09]  DEFAULT ((0)) FOR [FA816CP09]
GO

ALTER TABLE [dbo].[SFAMA816] ADD  CONSTRAINT [DF_SFAMA816_FA816CT10]  DEFAULT ((0)) FOR [FA816CP10]
GO

ALTER TABLE [dbo].[SFAMA816] ADD  CONSTRAINT [DF_SFAMA816_FA816CT11]  DEFAULT ((0)) FOR [FA816CP11]
GO

ALTER TABLE [dbo].[SFAMA816] ADD  CONSTRAINT [DF_SFAMA816_FA816CT12]  DEFAULT ((0)) FOR [FA816CP12]
GO

ALTER TABLE [dbo].[SFAMA816] ADD  CONSTRAINT [DF_SFAMA816_FA816CT13]  DEFAULT ((0)) FOR [FA816CP13]
GO

ALTER TABLE [dbo].[SFAMA816] ADD  CONSTRAINT [DF_SFAMA816_FA816PRUN]  DEFAULT ((0.00)) FOR [FA816PRUN]
GO

ALTER TABLE [dbo].[SFAMA816] ADD  CONSTRAINT [DF_SFAMA816_FA816IMPO]  DEFAULT ((0.00)) FOR [FA816IMPO]
GO

ALTER TABLE [dbo].[SFAMA816] ADD  CONSTRAINT [DF_SFAMA816_FA816CCOR]  DEFAULT ((0)) FOR [FA816CCOR]
GO

ALTER TABLE [dbo].[SFAMA816] ADD  CONSTRAINT [DF_SFAMA816_FA816CADE]  DEFAULT ((0)) FOR [FA816CADE]
GO

ALTER TABLE [dbo].[SFAMA816] ADD  CONSTRAINT [DF_SFAMA816_FA816PESO]  DEFAULT ((0.00)) FOR [FA816PESO]
GO

ALTER TABLE [dbo].[SFAMA816] ADD  CONSTRAINT [DF_SFAMA816_FA816CPTO]  DEFAULT ((0)) FOR [FA816CPTO]
GO

ALTER TABLE [dbo].[SFAMA816] ADD  CONSTRAINT [DF_SFAMA816_FA816CLAS]  DEFAULT ((0)) FOR [FA816CLAS]
GO

ALTER TABLE [dbo].[SFAMA816] ADD  CONSTRAINT [DF_SFAMA816_FA816CDCJ]  DEFAULT ('') FOR [FA816CDCJ]
GO

ALTER TABLE [dbo].[SFAMA816] ADD  DEFAULT ((0)) FOR [FA816PC01]
GO

ALTER TABLE [dbo].[SFAMA816] ADD  DEFAULT ((0)) FOR [FA816PC02]
GO

ALTER TABLE [dbo].[SFAMA816] ADD  DEFAULT ((0)) FOR [FA816PC03]
GO

ALTER TABLE [dbo].[SFAMA816] ADD  DEFAULT ((0)) FOR [FA816PC04]
GO

ALTER TABLE [dbo].[SFAMA816] ADD  DEFAULT ((0)) FOR [FA816PC05]
GO

ALTER TABLE [dbo].[SFAMA816] ADD  DEFAULT ((0)) FOR [FA816PC06]
GO

ALTER TABLE [dbo].[SFAMA816] ADD  DEFAULT ((0)) FOR [FA816PC07]
GO

ALTER TABLE [dbo].[SFAMA816] ADD  DEFAULT ((0)) FOR [FA816PC08]
GO

ALTER TABLE [dbo].[SFAMA816] ADD  DEFAULT ((0)) FOR [FA816PC09]
GO

ALTER TABLE [dbo].[SFAMA816] ADD  DEFAULT ((0)) FOR [FA816PC10]
GO

ALTER TABLE [dbo].[SFAMA816] ADD  DEFAULT ((0)) FOR [FA816PC11]
GO

ALTER TABLE [dbo].[SFAMA816] ADD  DEFAULT ((0)) FOR [FA816PC12]
GO

ALTER TABLE [dbo].[SFAMA816] ADD  DEFAULT ((0)) FOR [FA816PC13]
GO

ALTER TABLE [dbo].[SFAMA816] ADD  CONSTRAINT [DF_SFAMA816_FA816DESC]  DEFAULT ('') FOR [FA816DESC]
GO

ALTER TABLE [dbo].[SFAMA816] ADD  CONSTRAINT [DF_SFAMA816_FA816CDAR]  DEFAULT ('') FOR [FA816CDAR]
GO
