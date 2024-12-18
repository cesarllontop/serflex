USE [BDSIGAC6]
GO

/****** Object:  Table [dbo].[SFAMA817]    Script Date: 23/10/2024 08:22:16 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[SFAMA817](
	[FA817NORD] [varchar](6) NOT NULL,
	[FA817NITE] [varchar](2) NOT NULL,
	[FA817CT00] [varchar](4) NOT NULL,
	[FA817NMCT] [varchar](4) NOT NULL,
	[FA817ITCL] [varchar](20) NOT NULL,
	[FA817CBAR] [varchar](20) NOT NULL,
	[FA817CUPC] [varchar](12) NOT NULL,
	[FA817PETI] [decimal](7, 2) NOT NULL,
	[FA817PESO] [decimal](7, 3) NOT NULL,
	[FA817CSKU] [varchar](20) NOT NULL,
	[FA817USUA] [varchar](15) NOT NULL,
	[FA817FEAC] [datetime] NOT NULL,
 CONSTRAINT [PK_SFAMA817] PRIMARY KEY CLUSTERED 
(
	[FA817NORD] ASC,
	[FA817NITE] ASC,
	[FA817CT00] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[SFAMA817] ADD  CONSTRAINT [DF_SFAMA817_FA817NORD]  DEFAULT ('') FOR [FA817NORD]
GO

ALTER TABLE [dbo].[SFAMA817] ADD  CONSTRAINT [DF_SFAMA817_FA817NITE]  DEFAULT ('') FOR [FA817NITE]
GO

ALTER TABLE [dbo].[SFAMA817] ADD  CONSTRAINT [DF_Table_1_FA817TALL]  DEFAULT ('') FOR [FA817CT00]
GO

ALTER TABLE [dbo].[SFAMA817] ADD  CONSTRAINT [DF_SFAMA817_FA817NMCT]  DEFAULT ('') FOR [FA817NMCT]
GO

ALTER TABLE [dbo].[SFAMA817] ADD  CONSTRAINT [DF_SFAMA817_FA817ITCL]  DEFAULT ('') FOR [FA817ITCL]
GO

ALTER TABLE [dbo].[SFAMA817] ADD  CONSTRAINT [DF_SFAMA817_FA817CBAR]  DEFAULT ('') FOR [FA817CBAR]
GO

ALTER TABLE [dbo].[SFAMA817] ADD  CONSTRAINT [DF_SFAMA817_FA817CUPC]  DEFAULT ('') FOR [FA817CUPC]
GO

ALTER TABLE [dbo].[SFAMA817] ADD  CONSTRAINT [DF_Table_1_FA816PETI]  DEFAULT ((0.00)) FOR [FA817PETI]
GO

ALTER TABLE [dbo].[SFAMA817] ADD  CONSTRAINT [DF_SFAMA817_FA817PESO]  DEFAULT ((0.00)) FOR [FA817PESO]
GO

ALTER TABLE [dbo].[SFAMA817] ADD  CONSTRAINT [DF_SFAMA817_FA817CSKU]  DEFAULT ('') FOR [FA817CSKU]
GO

ALTER TABLE [dbo].[SFAMA817] ADD  CONSTRAINT [DF_SFAMA817_FA817USUA]  DEFAULT ('') FOR [FA817USUA]
GO

ALTER TABLE [dbo].[SFAMA817] ADD  CONSTRAINT [DF_SFAMA817_FA817FEAC]  DEFAULT (getdate()) FOR [FA817FEAC]
GO

