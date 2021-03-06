/****** Object:  Schema [setup]    Script Date: 11.9.2017 10:30:16 ******/
CREATE SCHEMA [setup]
GO
/****** Object:  UserDefinedFunction [setup].[ConvertIdentifiers]    Script Date: 11.9.2017 10:30:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE FUNCTION [setup].[ConvertIdentifiers]
(
	@InputIdentifier nvarchar(max),
	@ConvertIdentifiers nvarchar(128),
	@ReplacementCharacter nvarchar(1)
)
RETURNS nvarchar(max)
AS
BEGIN
	DECLARE
		@i int,
		@CharacterToBeReplaced nvarchar(1),
		@FinalIdentifier nvarchar(max)
	
	SET @i = 0
	SET @CharacterToBeReplaced = N''
	SET @FinalIdentifier = @InputIdentifier
	
	WHILE @i <= LEN(@ConvertIdentifiers)
	BEGIN
		SET @i = @i + 1
		SET @CharacterToBeReplaced = SUBSTRING(@ConvertIdentifiers, @i, 1)
		SET @FinalIdentifier = REPLACE(@FinalIdentifier, @CharacterToBeReplaced, @ReplacementCharacter)
	END
	
	RETURN @FinalIdentifier
END





GO
/****** Object:  Table [setup].[Company]    Script Date: 11.9.2017 10:30:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [setup].[Company](
	[CompanyID] [smallint] IDENTITY(1,1) NOT NULL,
	[DataSourceID] [tinyint] NOT NULL,
	[CompanyCode] [nvarchar](50) NULL,
	[CompanyName] [nvarchar](50) NOT NULL,
	[CountryCode] [nvarchar](20) NOT NULL,
	[CountryName] [nvarchar](50) NOT NULL,
	[LocalCurrency] [nvarchar](20) NOT NULL,
	[AdditionalCurrency] [nvarchar](20) NULL,
	[WebClientURL] [nvarchar](100) NULL,
 CONSTRAINT [PK_Company] PRIMARY KEY CLUSTERED 
(
	[CompanyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [setup].[Cube]    Script Date: 11.9.2017 10:30:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [setup].[Cube](
	[CubeID] [int] IDENTITY(1,1) NOT NULL,
	[CubeName] [nvarchar](100) NOT NULL,
	[Bought] [bit] NOT NULL,
	[Active] [bit] NOT NULL,
	[ManualRelationSetup] [bit] NOT NULL,
	[StandardCube] [bit] NOT NULL,
 CONSTRAINT [PK_Cube] PRIMARY KEY CLUSTERED 
(
	[CubeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [setup].[CubeCalcMeasure]    Script Date: 11.9.2017 10:30:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [setup].[CubeCalcMeasure](
	[CubeCalcMeasureID] [int] IDENTITY(1,1) NOT NULL,
	[CubeID] [int] NOT NULL,
	[MeasureName] [nvarchar](100) NOT NULL,
	[Active] [bit] NOT NULL,
	[ActiveWithoutStateTableOnly] [bit] NOT NULL,
	[OrderGroup] [int] NOT NULL,
	[DefinedByFormula] [nvarchar](max) NOT NULL,
	[DefinedByPostFormula] [nvarchar](max) NOT NULL,
	[NonEmptyBehaviorMeasureList] [nvarchar](max) NOT NULL,
	[FormatString] [nvarchar](100) NOT NULL,
	[VisibleMeasure] [bit] NOT NULL,
	[GenerateToDateMembers] [bit] NOT NULL,
	[GenerateToDateSumMembers] [bit] NOT NULL,
	[GenerateInitialMembers] [bit] NOT NULL,
	[ToDateSourceName] [nvarchar](100) NOT NULL,
	[ToDateNullForAllDate] [bit] NOT NULL,
	[GenerateYTDMembers] [bit] NOT NULL,
	[GeneratePrevYearMembers] [bit] NOT NULL,
	[TimeCompDerivedFromFormula] [bit] NOT NULL,
	[GenerateMinMaxMembers] [bit] NOT NULL,
	[GenerateMinMaxToDateMembers] [bit] NOT NULL,
	[GenerateMinMaxYTDMembers] [bit] NOT NULL,
	[GenerateMinMaxPrevYearMembers] [bit] NOT NULL,
	[IsSaldo] [bit] NOT NULL,
	[AggFnIsAggregate] [bit] NOT NULL,
	[MeasureGroup] [nvarchar](100) NOT NULL,
	[DisplayFolder] [nvarchar](max) NOT NULL,
	[Comment] [nvarchar](500) NOT NULL,
	[DateTimeUpdated] [datetime] NULL,
	[IsNamedSet] [bit] NOT NULL,
	[NamedSetType] [bit] NOT NULL,
	[Description] [nvarchar](3000) NOT NULL,
 CONSTRAINT [PK_CubeCalcMeasure] PRIMARY KEY CLUSTERED 
(
	[CubeCalcMeasureID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [setup].[CubeCalcMeasureAM]    Script Date: 11.9.2017 10:30:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [setup].[CubeCalcMeasureAM](
	[CubeCalcMeasureID] [int] IDENTITY(1,1) NOT NULL,
	[CubeID] [int] NOT NULL,
	[MeasureName] [nvarchar](100) NOT NULL,
	[Active] [bit] NOT NULL,
	[ActiveWithoutStateTableOnly] [bit] NOT NULL,
	[OrderGroup] [int] NOT NULL,
	[DefinedByFormula] [nvarchar](max) NOT NULL,
	[DefinedByPostFormula] [nvarchar](max) NOT NULL,
	[NonEmptyBehaviorMeasureList] [nvarchar](max) NOT NULL,
	[FormatString] [nvarchar](100) NOT NULL,
	[VisibleMeasure] [bit] NOT NULL,
	[GenerateToDateMembers] [bit] NOT NULL,
	[GenerateToDateSumMembers] [bit] NOT NULL,
	[GenerateInitialMembers] [bit] NOT NULL,
	[ToDateSourceName] [nvarchar](100) NOT NULL,
	[ToDateNullForAllDate] [bit] NOT NULL,
	[GenerateYTDMembers] [bit] NOT NULL,
	[GeneratePrevYearMembers] [bit] NOT NULL,
	[TimeCompDerivedFromFormula] [bit] NOT NULL,
	[GenerateMinMaxMembers] [bit] NOT NULL,
	[GenerateMinMaxToDateMembers] [bit] NOT NULL,
	[GenerateMinMaxYTDMembers] [bit] NOT NULL,
	[GenerateMinMaxPrevYearMembers] [bit] NOT NULL,
	[IsSaldo] [bit] NOT NULL,
	[AggFnIsAggregate] [bit] NOT NULL,
	[MeasureGroup] [nvarchar](100) NOT NULL,
	[DisplayFolder] [nvarchar](max) NOT NULL,
	[Comment] [nvarchar](500) NOT NULL,
	[DateTimeUpdated] [datetime] NULL,
	[IsNamedSet] [bit] NOT NULL,
	[NamedSetType] [bit] NOT NULL,
	[Description] [nvarchar](max) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [setup].[CubeCalcMeasureTranslation]    Script Date: 11.9.2017 10:30:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [setup].[CubeCalcMeasureTranslation](
	[CubeCalcMeasureID] [int] NOT NULL,
	[LanguageID] [smallint] NOT NULL,
	[DisplayFolderTranslation] [nvarchar](max) NOT NULL,
	[MeasureNameTranslation] [nvarchar](100) NOT NULL,
	[SmallFirstChar] [bit] NULL,
	[DerivedCalcMeasureTypeID] [smallint] NOT NULL,
	[DescriptionTranslation] [nvarchar](3000) NOT NULL,
 CONSTRAINT [PK_CubeCalcMeasureTranslation] PRIMARY KEY CLUSTERED 
(
	[CubeCalcMeasureID] ASC,
	[LanguageID] ASC,
	[DerivedCalcMeasureTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [setup].[CubeCalcMeasureTranslationAM]    Script Date: 11.9.2017 10:30:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [setup].[CubeCalcMeasureTranslationAM](
	[CubeCalcMeasureID] [int] NOT NULL,
	[LanguageID] [smallint] NOT NULL,
	[DisplayFolderTranslation] [nvarchar](max) NOT NULL,
	[MeasureNameTranslation] [nvarchar](100) NOT NULL,
	[SmallFirstChar] [bit] NULL,
	[DerivedCalcMeasureTypeID] [smallint] NOT NULL,
	[DescriptionTranslation] [nvarchar](max) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [setup].[CubeDataXML]    Script Date: 11.9.2017 10:30:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [setup].[CubeDataXML](
	[CubeName] [nvarchar](50) NOT NULL,
	[XMLData] [xml] NOT NULL,
 CONSTRAINT [PK_CubeDataXML] PRIMARY KEY CLUSTERED 
(
	[CubeName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [setup].[DataSource]    Script Date: 11.9.2017 10:30:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [setup].[DataSource](
	[DataSourceID] [tinyint] IDENTITY(1,1) NOT NULL,
	[ServerName] [nvarchar](128) NOT NULL,
	[DatabaseName] [nvarchar](128) NOT NULL,
	[Version] [nvarchar](128) NOT NULL,
	[CodePage] [smallint] NOT NULL,
	[WebClientURL] [nvarchar](150) NULL,
	[NAVNameChangedCharacters] [nvarchar](128) NOT NULL,
	[NAVNameReplacementCharacter] [nvarchar](1) NOT NULL,
	[DataVersionID] [tinyint] NOT NULL,
	[NullableMissingFields] [bit] NOT NULL,
 CONSTRAINT [PK_DataSource] PRIMARY KEY CLUSTERED 
(
	[DataSourceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [setup].[DataSourceColumn]    Script Date: 11.9.2017 10:30:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [setup].[DataSourceColumn](
	[DataSourceColumnID] [int] IDENTITY(1,1) NOT NULL,
	[DataSourceTableID] [int] NOT NULL,
	[ColumnID] [int] NULL,
	[ColumnNameSource] [nvarchar](128) NOT NULL,
	[ColumnNameSql] [nvarchar](128) NOT NULL,
	[ColumnNameStage] [nvarchar](128) NOT NULL,
	[ColumnType] [nvarchar](128) NOT NULL,
	[ExistsInDataSource] [bit] NOT NULL,
	[IsPartOfPrimaryKey] [bit] NOT NULL,
	[Active] [bit] NOT NULL,
	[LongerTextField] [bit] NULL,
	[NAVType] [nvarchar](30) NULL,
	[NAVLen] [int] NULL,
	[NAVOptionString] [nvarchar](1000) NULL,
	[NAVRelationTableID] [int] NULL,
	[NAVRelationColumnID] [int] NULL,
 CONSTRAINT [PK_DataSourceColumn] PRIMARY KEY CLUSTERED 
(
	[DataSourceColumnID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [setup].[DataSourceColumnTranslation]    Script Date: 11.9.2017 10:30:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [setup].[DataSourceColumnTranslation](
	[DataSourceColumnTranslationID] [int] IDENTITY(1,1) NOT NULL,
	[DataSourceTableID] [int] NOT NULL,
	[DataSourceColumnID] [int] NOT NULL,
	[LanguageID] [smallint] NOT NULL,
	[ColumnCaption] [nvarchar](1000) NULL,
	[OptionCaption] [nvarchar](1000) NULL,
 CONSTRAINT [PK_DataSourceColumnTranslation] PRIMARY KEY CLUSTERED 
(
	[DataSourceColumnTranslationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [setup].[DataSourceTable]    Script Date: 11.9.2017 10:30:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [setup].[DataSourceTable](
	[DataSourceTableID] [int] IDENTITY(1,1) NOT NULL,
	[DataSourceID] [tinyint] NOT NULL,
	[TableID] [int] NULL,
	[TableNameSource] [nvarchar](128) NOT NULL,
	[TableNameSql] [nvarchar](128) NOT NULL,
	[TableNameStage] [nvarchar](128) NOT NULL,
	[TableType] [tinyint] NOT NULL,
	[ExistsInDataSource] [bit] NOT NULL,
	[GroupOfLoading] [int] NULL,
	[IncrementalUpdate] [bit] NOT NULL,
	[IncrementalUpdateField] [int] NULL,
 CONSTRAINT [PK_DataSourceTable] PRIMARY KEY CLUSTERED 
(
	[DataSourceTableID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [setup].[DataVersion]    Script Date: 11.9.2017 10:30:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [setup].[DataVersion](
	[DataVersionID] [tinyint] NOT NULL,
	[LiveData] [bit] NOT NULL,
	[ArchiveData] [bit] NOT NULL,
	[UpdateData] [bit] NOT NULL,
 CONSTRAINT [PK_DataVersion] PRIMARY KEY CLUSTERED 
(
	[DataVersionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [setup].[DataVersionTable]    Script Date: 11.9.2017 10:30:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [setup].[DataVersionTable](
	[DimFactID] [int] NOT NULL,
	[DataVersionID] [tinyint] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [setup].[DerivedCalcMeasureType]    Script Date: 11.9.2017 10:30:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [setup].[DerivedCalcMeasureType](
	[DerivedCalcMeasureTypeID] [smallint] NOT NULL,
	[DerivedCalcMeasureName] [nvarchar](100) NOT NULL,
	[Comment] [nvarchar](max) NOT NULL,
	[PreDescription] [nvarchar](100) NOT NULL,
	[PostDescription] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_DerivedCalcMeasureType] PRIMARY KEY CLUSTERED 
(
	[DerivedCalcMeasureTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [setup].[DerivedCalcMeasureTypeTranslation]    Script Date: 11.9.2017 10:30:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [setup].[DerivedCalcMeasureTypeTranslation](
	[DerivedCalcMeasureTypeID] [smallint] NOT NULL,
	[LanguageID] [smallint] NOT NULL,
	[DisplayFolderTranslation] [nvarchar](max) NOT NULL,
	[MeasureNamePreTranslation] [nvarchar](20) NOT NULL,
	[MeasureNamePostTranslation] [nvarchar](20) NOT NULL,
	[Comment] [nvarchar](max) NOT NULL,
	[DescriptionPreTranslation] [nvarchar](100) NOT NULL,
	[DescriptionPostTranslation] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_DerivedCalcMeasureTypeTranslation] PRIMARY KEY CLUSTERED 
(
	[DerivedCalcMeasureTypeID] ASC,
	[LanguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [setup].[Dimension]    Script Date: 11.9.2017 10:30:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [setup].[Dimension](
	[CompanyID] [smallint] NOT NULL,
	[DimensionID] [tinyint] NULL,
	[DimensionCode] [nvarchar](20) NOT NULL,
	[DimensionType] [int] NULL,
 CONSTRAINT [PK_GlobalDimension] PRIMARY KEY CLUSTERED 
(
	[CompanyID] ASC,
	[DimensionCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [setup].[DimFact]    Script Date: 11.9.2017 10:30:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [setup].[DimFact](
	[DimFactID] [int] IDENTITY(1,1) NOT NULL,
	[Type] [nvarchar](10) NULL,
	[Name] [nvarchar](50) NULL,
	[GroupOfFilling] [int] NULL,
	[StandardFilling] [bit] NOT NULL,
	[FillingComment] [nvarchar](1000) NULL,
	[SourceViewSchema] [nvarchar](128) NOT NULL,
	[SourceViewName] [nvarchar](128) NOT NULL,
	[ACYAllowed] [bit] NOT NULL,
	[ACYDateID] [nvarchar](128) NOT NULL,
	[MergeOnList] [nvarchar](max) NOT NULL,
	[NAVTableID] [int] NULL,
	[OptionColumnID] [int] NULL,
 CONSTRAINT [PK_Dimfact] PRIMARY KEY CLUSTERED 
(
	[DimFactID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [setup].[DimFactIndex]    Script Date: 11.9.2017 10:30:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [setup].[DimFactIndex](
	[DimFactIndexID] [int] IDENTITY(1,1) NOT NULL,
	[DimFactID] [int] NOT NULL,
	[Active] [bit] NOT NULL,
	[IndexNameEnd] [nvarchar](128) NOT NULL,
	[UniqueIndex] [bit] NOT NULL,
	[IndexColumnsList] [nvarchar](max) NOT NULL,
	[IncludeColumnsList] [nvarchar](max) NOT NULL,
	[FilterDefinition] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_DimFactIndex] PRIMARY KEY CLUSTERED 
(
	[DimFactIndexID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [setup].[FactForeignKey]    Script Date: 11.9.2017 10:30:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [setup].[FactForeignKey](
	[FactForeignKeyID] [int] IDENTITY(1,1) NOT NULL,
	[DimFactID] [int] NOT NULL,
	[Active] [bit] NOT NULL,
	[FKNameEnd] [nvarchar](128) NOT NULL,
	[FKColumnList] [nvarchar](max) NOT NULL,
	[RefTableName] [nvarchar](128) NOT NULL,
	[RefColumnList] [nvarchar](max) NOT NULL,
	[RefTableSchema] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_FactForeignKey] PRIMARY KEY CLUSTERED 
(
	[FactForeignKeyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [setup].[IncrementalUpdate]    Script Date: 11.9.2017 10:30:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [setup].[IncrementalUpdate](
	[TableName] [nvarchar](50) NOT NULL,
	[IncrementalUpdate] [bit] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [setup].[Instance]    Script Date: 11.9.2017 10:30:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [setup].[Instance](
	[InstanceID] [int] IDENTITY(1,1) NOT NULL,
	[StartYear] [nvarchar](4) NOT NULL,
	[NumberOfYears] [int] NOT NULL,
	[Language] [nvarchar](8) NOT NULL,
	[LanguageCode] [nvarchar](10) NOT NULL,
	[BatchID] [int] NOT NULL,
	[ReceivablesStartDate] [date] NULL,
	[IncrementalUpdate] [int] NULL,
	[Partition1LimitDateID] [int] NULL,
	[Partition2LimitDateID] [int] NULL,
	[IncrementalUpdateDWH] [int] NULL,
	[FiscalYearMonthStart] [int] NOT NULL,
	[BreakingPoint] [time](7) NULL,
	[MaxStateDate] [datetime] NULL,
	[MaxStateDateID] [int] NULL,
	[MaxStateMonthID] [int] NULL,
	[MaxInventoryStateDate] [datetime] NULL,
	[MaxInventoryStateDateID] [int] NULL,
	[MaxInventoryStateMonthID] [int] NULL,
	[StageDate] [datetime] NULL,
	[CharactersRemovedFromDwhNames] [nvarchar](128) NOT NULL,
	[SuspendedIncrementalUpdate] [bit] NOT NULL,
	[SuspendedIncrementalUpdateDWH] [bit] NOT NULL,
	[LoadMaxStageRowCount] [int] NULL,
	[OLAPProjectPath] [nvarchar](max) NULL,
	[OLAPProjectFile] [nvarchar](max) NULL,
	[ACYMeasureNameEnd] [nvarchar](max) NULL,
	[TimeCompMeasureNameEnd] [nvarchar](max) NULL,
	[DocLanguageID] [smallint] NULL,
	[DocCompanyLogo] [image] NULL,
	[CreateTimeCompDescription] [bit] NOT NULL,
 CONSTRAINT [PK_Instance] PRIMARY KEY CLUSTERED 
(
	[InstanceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [setup].[Language]    Script Date: 11.9.2017 10:30:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [setup].[Language](
	[LanguageID] [smallint] NOT NULL,
	[LanguageName] [nvarchar](100) NOT NULL,
	[SmallFirstChar] [bit] NOT NULL,
 CONSTRAINT [PK_Language] PRIMARY KEY CLUSTERED 
(
	[LanguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [setup].[Log]    Script Date: 11.9.2017 10:30:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [setup].[Log](
	[LogID] [int] IDENTITY(1,1) NOT NULL,
	[BatchID] [int] NOT NULL,
	[StoredProcedureName] [nvarchar](100) NOT NULL,
	[LogStartDate] [datetime] NOT NULL,
	[LogEndDate] [datetime] NOT NULL,
	[Duration] [int] NOT NULL,
	[RowCount] [int] NOT NULL,
	[Status] [int] NOT NULL,
	[StatusDesc] [nvarchar](max) NOT NULL,
	[GroupOfFilling] [int] NULL,
	[UserName] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_Log] PRIMARY KEY CLUSTERED 
(
	[LogID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [setup].[ProjectCube]    Script Date: 11.9.2017 10:30:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [setup].[ProjectCube](
	[CubeID] [nvarchar](200) NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[Visible] [bit] NOT NULL,
	[DocUsage] [bit] NOT NULL,
 CONSTRAINT [PK_ProjectCube] PRIMARY KEY CLUSTERED 
(
	[CubeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [setup].[ProjectCube_Dim]    Script Date: 11.9.2017 10:30:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [setup].[ProjectCube_Dim](
	[CubeID] [nvarchar](200) NOT NULL,
	[CubeDimID] [nvarchar](200) NOT NULL,
	[DimID] [nvarchar](200) NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[Visible] [bit] NOT NULL,
	[DocUsage] [bit] NOT NULL,
 CONSTRAINT [PK_ProjectCube_Dim] PRIMARY KEY CLUSTERED 
(
	[CubeID] ASC,
	[CubeDimID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [setup].[ProjectCube_DimUsage]    Script Date: 11.9.2017 10:30:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [setup].[ProjectCube_DimUsage](
	[CubeID] [nvarchar](200) NOT NULL,
	[MeasureGroupID] [nvarchar](200) NOT NULL,
	[CubeDimID] [nvarchar](200) NOT NULL,
	[RelationShipType] [nvarchar](200) NOT NULL,
	[DocUsage] [bit] NOT NULL,
 CONSTRAINT [PK_ProjectCube_DimUsage] PRIMARY KEY CLUSTERED 
(
	[CubeID] ASC,
	[MeasureGroupID] ASC,
	[CubeDimID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [setup].[ProjectCube_Measure]    Script Date: 11.9.2017 10:30:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [setup].[ProjectCube_Measure](
	[CubeID] [nvarchar](200) NOT NULL,
	[MeasureID] [nvarchar](200) NOT NULL,
	[MeasureGroupID] [nvarchar](200) NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[DisplayFolder] [nvarchar](max) NOT NULL,
	[Visible] [bit] NOT NULL,
	[IsCalculated] [bit] NOT NULL,
	[IsACY] [bit] NOT NULL,
	[IsTimeComp] [bit] NOT NULL,
	[DocUsage] [bit] NOT NULL,
	[SourceTable] [nvarchar](128) NOT NULL,
	[SourceColumn] [nvarchar](128) NOT NULL,
	[AggregateFunction] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_ProjectCube_Measure] PRIMARY KEY CLUSTERED 
(
	[CubeID] ASC,
	[MeasureID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [setup].[ProjectCube_MeasureGroup]    Script Date: 11.9.2017 10:30:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [setup].[ProjectCube_MeasureGroup](
	[CubeID] [nvarchar](200) NOT NULL,
	[MeasureGroupID] [nvarchar](200) NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[DocUsage] [bit] NOT NULL,
 CONSTRAINT [PK_ProjectCube_MeasureGroup] PRIMARY KEY CLUSTERED 
(
	[CubeID] ASC,
	[MeasureGroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [setup].[ProjectCube_Set]    Script Date: 11.9.2017 10:30:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [setup].[ProjectCube_Set](
	[CubeID] [nvarchar](200) NOT NULL,
	[SetID] [nvarchar](200) NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[IsDynamic] [bit] NOT NULL,
	[DocUsage] [bit] NOT NULL,
	[Visible] [bit] NOT NULL,
 CONSTRAINT [PK_ProjectCube_Set] PRIMARY KEY CLUSTERED 
(
	[CubeID] ASC,
	[SetID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [setup].[ProjectCubeMeasure]    Script Date: 11.9.2017 10:30:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [setup].[ProjectCubeMeasure](
	[CubeName] [nvarchar](100) NOT NULL,
	[MeasureName] [nvarchar](100) NOT NULL,
	[IsCalculated] [bit] NOT NULL,
	[MeasureGroup] [nvarchar](100) NOT NULL,
	[DisplayFolder] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_ProjectCubeMeasure] PRIMARY KEY CLUSTERED 
(
	[CubeName] ASC,
	[MeasureName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [setup].[ProjectCubeMeasureGroup]    Script Date: 11.9.2017 10:30:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [setup].[ProjectCubeMeasureGroup](
	[CubeName] [nvarchar](100) NOT NULL,
	[MeasureGroupID] [nvarchar](100) NOT NULL,
	[MeasureGroupName] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_ProjectCubeMeasureGroup] PRIMARY KEY CLUSTERED 
(
	[CubeName] ASC,
	[MeasureGroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [setup].[ProjectCubeMeasureTranslation]    Script Date: 11.9.2017 10:30:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [setup].[ProjectCubeMeasureTranslation](
	[CubeName] [nvarchar](100) NOT NULL,
	[MeasureName] [nvarchar](100) NOT NULL,
	[LanguageID] [smallint] NOT NULL,
	[MeasureNameTranslation] [nvarchar](100) NOT NULL,
	[DisplayFolderTranslation] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_ProjectCubeMeasureTranslation] PRIMARY KEY CLUSTERED 
(
	[CubeName] ASC,
	[MeasureName] ASC,
	[LanguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [setup].[ProjectCubeTranslation]    Script Date: 11.9.2017 10:30:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [setup].[ProjectCubeTranslation](
	[CubeName] [nvarchar](100) NOT NULL,
	[LanguageID] [smallint] NOT NULL,
 CONSTRAINT [PK_ProjectCubeTranslation] PRIMARY KEY CLUSTERED 
(
	[CubeName] ASC,
	[LanguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [setup].[ProjectDataXML]    Script Date: 11.9.2017 10:30:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [setup].[ProjectDataXML](
	[FileType] [nvarchar](20) NOT NULL,
	[FileName] [nvarchar](200) NOT NULL,
	[XMLData] [xml] NOT NULL,
 CONSTRAINT [PK_ProjectDataXML] PRIMARY KEY CLUSTERED 
(
	[FileType] ASC,
	[FileName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [setup].[ProjectDim]    Script Date: 11.9.2017 10:30:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [setup].[ProjectDim](
	[DimID] [nvarchar](200) NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[DocUsage] [bit] NOT NULL,
 CONSTRAINT [PK_ProjectDim] PRIMARY KEY CLUSTERED 
(
	[DimID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [setup].[ProjectDim_Attribute]    Script Date: 11.9.2017 10:30:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [setup].[ProjectDim_Attribute](
	[DimID] [nvarchar](200) NOT NULL,
	[AttributeID] [nvarchar](200) NOT NULL,
	[SourceAttributeID] [nvarchar](200) NULL,
	[Name] [nvarchar](200) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[DisplayFolder] [nvarchar](max) NOT NULL,
	[HierarchyEnabled] [bit] NOT NULL,
	[HierarchyVisible] [bit] NOT NULL,
	[DocUsage] [bit] NOT NULL,
	[SourceKeyTable] [nvarchar](128) NOT NULL,
	[SourceKeyColumn] [nvarchar](128) NOT NULL,
	[SourceNameTable] [nvarchar](128) NOT NULL,
	[SourceNameColumn] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_ProjectDim_Attribute] PRIMARY KEY CLUSTERED 
(
	[DimID] ASC,
	[AttributeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [setup].[ProjectDim_AttributeRelationship]    Script Date: 11.9.2017 10:30:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [setup].[ProjectDim_AttributeRelationship](
	[DimID] [nvarchar](200) NOT NULL,
	[SourceAttributeID] [nvarchar](200) NOT NULL,
	[AttributeID] [nvarchar](200) NOT NULL,
	[DocUsage] [bit] NOT NULL,
 CONSTRAINT [PK_ProjectDim_AttributeRelationship] PRIMARY KEY CLUSTERED 
(
	[DimID] ASC,
	[SourceAttributeID] ASC,
	[AttributeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [setup].[ProjectDim_Hierarchy]    Script Date: 11.9.2017 10:30:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [setup].[ProjectDim_Hierarchy](
	[DimID] [nvarchar](200) NOT NULL,
	[HierarchyID] [nvarchar](200) NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[DisplayFolder] [nvarchar](max) NOT NULL,
	[DocUsage] [bit] NOT NULL,
 CONSTRAINT [PK_ProjectDim_Hierarchy] PRIMARY KEY CLUSTERED 
(
	[DimID] ASC,
	[HierarchyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [setup].[ProjectDim_HierarchyLevel]    Script Date: 11.9.2017 10:30:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [setup].[ProjectDim_HierarchyLevel](
	[DimID] [nvarchar](200) NOT NULL,
	[HierarchyID] [nvarchar](200) NOT NULL,
	[HierarchyLevelNo] [smallint] NOT NULL,
	[AttributeID] [nvarchar](200) NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[DocUsage] [bit] NOT NULL,
 CONSTRAINT [PK_ProjectDim_HierarchyLevel] PRIMARY KEY CLUSTERED 
(
	[DimID] ASC,
	[HierarchyID] ASC,
	[HierarchyLevelNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [setup].[ProjectLanguage]    Script Date: 11.9.2017 10:30:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [setup].[ProjectLanguage](
	[ObjectType] [nvarchar](20) NOT NULL,
	[ObjectID] [nvarchar](200) NOT NULL,
	[LanguageID] [smallint] NOT NULL,
 CONSTRAINT [PK_ProjectLanguage] PRIMARY KEY CLUSTERED 
(
	[ObjectType] ASC,
	[ObjectID] ASC,
	[LanguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [setup].[ProjectPartTranslation]    Script Date: 11.9.2017 10:30:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [setup].[ProjectPartTranslation](
	[ObjectType] [nvarchar](20) NOT NULL,
	[ObjectID] [nvarchar](200) NOT NULL,
	[ObjectPartType] [nvarchar](50) NOT NULL,
	[ObjectPartID] [nvarchar](200) NOT NULL,
	[ObjectPartNo] [smallint] NOT NULL,
	[LanguageID] [smallint] NOT NULL,
	[NameTranslation] [nvarchar](200) NOT NULL,
	[DescriptionTranslation] [nvarchar](max) NOT NULL,
	[DisplayFolderTranslation] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_ProjectPartTranslation] PRIMARY KEY CLUSTERED 
(
	[ObjectType] ASC,
	[ObjectID] ASC,
	[ObjectPartType] ASC,
	[ObjectPartID] ASC,
	[ObjectPartNo] ASC,
	[LanguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [setup].[RelationCube_DimFact]    Script Date: 11.9.2017 10:30:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [setup].[RelationCube_DimFact](
	[CubeID] [int] NOT NULL,
	[DimFactID] [int] NOT NULL,
 CONSTRAINT [PK_RelationCube_DimFact] PRIMARY KEY NONCLUSTERED 
(
	[CubeID] ASC,
	[DimFactID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [setup].[RelationStage_DimFact]    Script Date: 11.9.2017 10:30:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [setup].[RelationStage_DimFact](
	[StageTableID] [int] NOT NULL,
	[DimFactID] [int] NOT NULL,
 CONSTRAINT [PK_RelationStage_DimFactID] PRIMARY KEY NONCLUSTERED 
(
	[StageTableID] ASC,
	[DimFactID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [setup].[StageTableIndex]    Script Date: 11.9.2017 10:30:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [setup].[StageTableIndex](
	[StageTableIndexID] [int] IDENTITY(1,1) NOT NULL,
	[StageTableName] [nvarchar](128) NOT NULL,
	[IndexNameEnd] [nvarchar](128) NOT NULL,
	[Active] [bit] NOT NULL,
	[UniqueIndex] [bit] NOT NULL,
	[ClusteredIndex] [bit] NOT NULL,
	[IncrementalUpdateTableNameList] [nvarchar](max) NULL,
	[IndexColumnsList] [nvarchar](max) NOT NULL,
	[IncludeColumnsList] [nvarchar](max) NULL,
 CONSTRAINT [PK_StageTableIndex] PRIMARY KEY CLUSTERED 
(
	[StageTableIndexID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [setup].[Translation]    Script Date: 11.9.2017 10:30:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [setup].[Translation](
	[TranslationID] [int] IDENTITY(1,1) NOT NULL,
	[TableID] [int] NOT NULL,
	[ColumnID] [int] NOT NULL,
	[OptionID] [tinyint] NOT NULL,
	[LanguageID] [smallint] NOT NULL,
	[Description] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_Translation] PRIMARY KEY CLUSTERED 
(
	[TranslationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [setup].[v_ProjectCube_Dim_Doc]    Script Date: 11.9.2017 10:30:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [setup].[v_ProjectCube_Dim_Doc] AS
SELECT
	a.[CubeID],
	a.[DimID],
	a.[CubeDimID],
	[CubeDimName] = ISNULL(NULLIF(t.[NameTranslation], ''), a.[Name]),
	[CubeDimOriginalName] = a.[Name],
	[CubeDimDescription] = ISNULL(NULLIF(t.[DescriptionTranslation], ''), a.[Description])
FROM
	[setup].[ProjectCube_Dim] a
	INNER JOIN [setup].[Instance] i ON 1=1
	LEFT OUTER JOIN [setup].[ProjectPartTranslation] t ON
		t.[LanguageID] = ISNULL(i.[DocLanguageID], 1029) AND
		t.[ObjectType] = 'cube' AND
		t.[ObjectID] = a.[CubeID] AND
		t.[ObjectPartType] = 'CubeDim' AND
		t.[ObjectPartID] = a.[CubeDimID] AND
		t.[ObjectPartNo] = 0
WHERE a.[DocUsage] = 1
--ORDER BY [CubeID], [CubeDimName]

GO
/****** Object:  View [setup].[v_ProjectCube_MeasureGroup_Doc]    Script Date: 11.9.2017 10:30:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [setup].[v_ProjectCube_MeasureGroup_Doc] AS
SELECT
	a.[CubeID],
	a.[MeasureGroupID],
	[MeasureGroupName] = ISNULL(NULLIF(t.[NameTranslation], ''), a.[Name]),
	[MeasureGroupOriginalName] = a.[Name],
	[MeasureGroupDescription] = ISNULL(NULLIF(t.[DescriptionTranslation], ''), a.[Description])
FROM
	[setup].[ProjectCube_MeasureGroup] a
	INNER JOIN [setup].[Instance] i ON 1=1
	LEFT OUTER JOIN [setup].[ProjectPartTranslation] t ON
		t.[LanguageID] = ISNULL(i.[DocLanguageID], 1029) AND
		t.[ObjectType] = 'cube' AND
		t.[ObjectID] = a.[CubeID] AND
		t.[ObjectPartType] = 'CubeMeasureGroup' AND
		t.[ObjectPartID] = a.[MeasureGroupID] AND
		t.[ObjectPartNo] = 0
WHERE a.[DocUsage] = 1
--ORDER BY [MeasureGroupName]

GO
/****** Object:  View [setup].[v_ProjectCube_DimUsage_Doc]    Script Date: 11.9.2017 10:30:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [setup].[v_ProjectCube_DimUsage_Doc] AS
SELECT
	a.[CubeID],
	cd.[DimID],
	a.[CubeDimID],
	[CubeDimTitle] = cd.[CubeDimName],
	[CubeDimOriginalName] = cd.[CubeDimOriginalName],
	[CubeDimDesc] = cd.[CubeDimDescription],
	[MeasureGroupTitle] = mg.[MeasureGroupName],
	[MeasureGroupOriginalName] = mg.[MeasureGroupOriginalName],
	[RelationShipCardinality] = CASE WHEN a.[RelationShipType] = 'ManyToMany' THEN 2 ELSE 1 END	-- 1 - m:1,	2 - m:n
FROM
	[setup].[ProjectCube_DimUsage] a
	INNER JOIN [setup].[v_ProjectCube_Dim_Doc] cd ON
		cd.[CubeID] = a.[CubeID] AND cd.[CubeDimID] = a.[CubeDimID]
	INNER JOIN [setup].[v_ProjectCube_MeasureGroup_Doc] mg ON
		mg.[CubeID] = a.[CubeID] AND
		mg.[MeasureGroupID] = a.[MeasureGroupID]
WHERE a.[DocUsage] = 1 AND a.[RelationShipType] > ''

GO
/****** Object:  View [setup].[v_ProjectDim_Attribute_Doc]    Script Date: 11.9.2017 10:30:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [setup].[v_ProjectDim_Attribute_Doc] AS
SELECT
	a.[DimID],
	a.[AttributeID],
	a.[HierarchyEnabled],
	a.[HierarchyVisible],
	[AttributeName] = ISNULL(NULLIF(t.[NameTranslation], ''), a.[Name]),
	[AttributeOriginalName] = a.[Name],
	[AttributeDescription] = ISNULL(NULLIF(t.[DescriptionTranslation], ''), a.[Description]),
	a.[SourceKeyTable],
	a.[SourceKeyColumn],
	a.[SourceNameTable],
	a.[SourceNameColumn]
FROM
	[setup].[ProjectDim_Attribute] a
	INNER JOIN [setup].[Instance] i ON 1=1
	LEFT OUTER JOIN [setup].[ProjectPartTranslation] t ON
		t.[LanguageID] = ISNULL(i.[DocLanguageID], 1029) AND
		t.[ObjectType] = 'dim' AND
		t.[ObjectID] = a.[DimID] AND
		t.[ObjectPartType] = 'DimAttribute' AND
		t.[ObjectPartID] = a.[AttributeID] AND
		t.[ObjectPartNo] = 0
WHERE a.[DocUsage] = 1

GO
/****** Object:  View [setup].[v_ProjectDim_Doc]    Script Date: 11.9.2017 10:30:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [setup].[v_ProjectDim_Doc] AS
SELECT
	a.[DimID],
	[DimType] = CASE WHEN a.[DimID] = '' THEN 2 ELSE 1 END,	-- 1 Existing, 2 NonExisting
	[DimName] =  CASE WHEN a.[DimID] = '' THEN ' ' ELSE '' END + ISNULL(NULLIF(t.[NameTranslation], ''), a.[Name]),
	[DimOriginalName] = a.[Name],
	[DimTitle] = ISNULL(ISNULL(NULLIF(t0.[NameTranslation] + ' ', ''), a0.[Name] + ' '), '') + CASE WHEN a.[DimID] = '' THEN '' ELSE ISNULL(NULLIF(t.[NameTranslation], ''), a.[Name]) END,
	[DimDescription] = ISNULL(NULLIF(t.[DescriptionTranslation], ''), a.[Description])
FROM
	[setup].[ProjectDim] a
	INNER JOIN [setup].[Instance] i ON 1=1
	LEFT OUTER JOIN [setup].[ProjectPartTranslation] t ON
		t.[LanguageID] = ISNULL(i.[DocLanguageID], 1029) AND
		t.[ObjectType] = 'dim' AND
		t.[ObjectID] = a.[DimID] AND
		t.[ObjectPartType] = 'Dim' AND
		t.[ObjectPartID] = a.[DimID] AND
		t.[ObjectPartNo] = 0
	LEFT OUTER JOIN [setup].[ProjectDim] a0 ON
		a0.[DimID] = ''
	LEFT OUTER JOIN [setup].[ProjectPartTranslation] t0 ON
		t0.[LanguageID] = ISNULL(i.[DocLanguageID], 1029) AND
		t0.[ObjectType] = 'dim' AND
		t0.[ObjectID] = '' AND
		t0.[ObjectPartType] = 'Dim' AND
		t0.[ObjectPartID] = '' AND
		t0.[ObjectPartNo] = 0
WHERE a.[DocUsage] = 1
--ORDER BY [DimType] DESC, [DimName]

GO
/****** Object:  View [setup].[v_ProjectDim_AttributeHieararchy_Doc]    Script Date: 11.9.2017 10:30:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [setup].[v_ProjectDim_AttributeHieararchy_Doc] AS
SELECT
	a.[DimID],
	h.[HierarchyID],
	[HierarchyType] =	-- 0 - real hierarchy w/o DisplayFolder, 1 - real hierarchy with DisplayFolder, 2 - Other fields
		CASE WHEN ISNULL(NULLIF(ht.[DisplayFolderTranslation], ''), h.[DisplayFolder]) = ''
			THEN  0
			ELSE  1
		END,
	[DisplayFolder] =
		CASE WHEN ISNULL(NULLIF(ht.[DisplayFolderTranslation], ''), h.[DisplayFolder]) = ''
			THEN  d.[DimName]
			ELSE  ISNULL(NULLIF(ht.[DisplayFolderTranslation], ''), h.[DisplayFolder])
		END,
	[HierarchyName] = ISNULL(NULLIF(ht.[NameTranslation], ''), h.[Name]),
	[HierarchyOriginalName] = h.[Name],
	[HierarchyDescription] = ISNULL(NULLIF(ht.[DescriptionTranslation], ''), h.[Description]),
	a.[HierarchyLevelNo],
	s.[AttributeID],
	[HierarchyLevelName] = ISNULL(NULLIF(t.[NameTranslation], ''), a.[Name]),
	[HierarchyLevelOriginalName] = a.[Name],
	[HierarchyLevelDescription] = ISNULL(NULLIF(ISNULL(NULLIF(t.[DescriptionTranslation], ''), a.[Description]), ''),  s.[AttributeDescription])
	--[PropertyID] = a.[AttributeID],
	--[SourceAttributeID] = sa.[AttributeID],
	--[SourceAttributeName] = ISNULL(NULLIF(st.[NameTranslation], ''), sa.[Name]),
	--[PropertyName] = ISNULL(NULLIF(t.[NameTranslation], ''), a.[Name]),
	--[PropertyDescription] = ISNULL(NULLIF(t.[DescriptionTranslation], ''), a.[Description])
FROM
	[setup].[ProjectDim_HierarchyLevel] a
	INNER JOIN [setup].[Instance] i ON 1=1
	LEFT OUTER JOIN [setup].[ProjectPartTranslation] t ON
		t.[LanguageID] = ISNULL(i.[DocLanguageID], 1029) AND
		t.[ObjectType] = 'dim' AND
		t.[ObjectID] = a.[DimID] AND
		t.[ObjectPartType] = 'DimHierarchyLevel' AND
		t.[ObjectPartID] = a.[HierarchyID] AND
		t.[ObjectPartNo] = a.[HierarchyLevelNo]

	INNER JOIN [setup].[v_ProjectDim_Doc] d ON
		d.[DimID] = a.[DimID]
	INNER JOIN [setup].[ProjectDim_Hierarchy] h ON
		h.[DimID] = a.[DimID] AND h.[HierarchyID] = a.[HierarchyID] AND
		h.[DocUsage] = 1
	LEFT OUTER JOIN [setup].[ProjectPartTranslation] ht ON
		ht.[LanguageID] = ISNULL(i.[DocLanguageID], 1029) AND
		ht.[ObjectType] = 'dim' AND
		ht.[ObjectID] = h.[DimID] AND
		ht.[ObjectPartType] = 'DimHierarchy' AND
		ht.[ObjectPartID] = h.[HierarchyID] AND
		ht.[ObjectPartNo] = 0

	INNER JOIN [setup].[v_ProjectDim_Attribute_Doc] s ON	--source attribute
		s.[DimID] = a.[DimID] AND
		s.[AttributeID] = a.[AttributeID]
WHERE
	a.[DocUsage] = 1
--ORDER BY [DimID], [HierarchyType], [DisplayFolder], [HierarchyName], [HierarchyLevelNo]

UNION ALL	-- Attribute displayed w/o hierarchy

SELECT
	a.[DimID],
	[HierarchyID] = '',
	[HierarchyType] = CASE WHEN h.[DimID] IS NULL THEN 0 ELSE 2 END,
	[DisplayFolder] = CASE WHEN h.[DimID] IS NULL THEN d.[DimName] ELSE ISNULL(NULLIF(t.[DisplayFolderTranslation], ''), 'More fields') END,
	[HierarchyName] = '',
	[HierarchyOriginalName] = '',
	[HierarchyDescription] = '',
	[HierarchyLevelNo] = 0,
	a.[AttributeID],
	[HierarchyLevelName] = a.[AttributeName],
	[HierarchyLevelOriginalName] = a.[AttributeOriginalName],
	[HierarchyLevelDescription] = a.[AttributeDescription]
FROM
	[setup].[v_ProjectDim_Attribute_Doc] a
	INNER JOIN [setup].[Instance] i ON 1=1
	LEFT OUTER JOIN [setup].[ProjectPartTranslation] t ON
		t.[LanguageID] = ISNULL(i.[DocLanguageID], 1029) AND
		t.[ObjectType] = 'dim' AND
		t.[ObjectID] = '' AND
		t.[ObjectPartType] = 'DimAttribute' AND
		t.[ObjectPartID] = '' AND
		t.[ObjectPartNo] = 0
	INNER JOIN [setup].[v_ProjectDim_Doc] d ON
		d.[DimID] = a.[DimID]
	LEFT OUTER JOIN (SELECT [DimID] FROM [setup].[ProjectDim_Hierarchy] GROUP BY [DimID]) h ON
		h.[DimID] = a.[DimID]

WHERE
	a.[HierarchyEnabled] = 1 AND
	a.[HierarchyVisible] = 1

GO
/****** Object:  View [setup].[v_ProjectCube_Doc]    Script Date: 11.9.2017 10:30:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [setup].[v_ProjectCube_Doc] AS
SELECT
	a.[CubeID],
	[CubeType] = CASE WHEN a.[CubeID] = '' THEN 2 WHEN c.[StandardCube] = 1 THEN 1 ELSE 0 END,	-- 0 NonStandard, 1 Standard, 2 NonExisting
	[CubeName] = CASE WHEN a.[CubeID] = '' THEN ' ' ELSE '' END + ISNULL(NULLIF(t.[NameTranslation], ''), a.[Name]),
	[CubeOriginalName] = a.[Name],
	[CubeTitle] = ISNULL(ISNULL(NULLIF(t0.[NameTranslation] + ' ', ''), a0.[Name] + ' '), '') + CASE WHEN a.[CubeID] = '' THEN '' ELSE ISNULL(NULLIF(t.[NameTranslation], ''), a.[Name]) END,
	[CubeDescription] = ISNULL(NULLIF(t.[DescriptionTranslation], ''), a.[Description]),
	[ACYUsed] = (SELECT SIGN(COUNT(*)) FROM [setup].[ProjectCube_Measure] x WHERE x.[IsACY] = 1 AND  x.[Visible] = 1 AND x.[CubeID] = a.[CubeID]),
	[TimeCompUsed] = (SELECT SIGN(COUNT(*)) FROM [setup].[ProjectCube_Measure] x WHERE x.[IsTimeComp] = 1 AND  x.[Visible] = 1 AND x.[CubeID] = a.[CubeID])
FROM
	[setup].[ProjectCube] a
	INNER JOIN [setup].[Instance] i ON 1=1
	LEFT OUTER JOIN [setup].[ProjectPartTranslation] t ON
		t.[LanguageID] = ISNULL(i.[DocLanguageID], 1029) AND
		t.[ObjectType] = 'cube' AND
		t.[ObjectID] = a.[CubeID] AND
		t.[ObjectPartType] = 'Cube' AND
		t.[ObjectPartID] = a.[CubeID] AND
		t.[ObjectPartNo] = 0
	LEFT OUTER JOIN [setup].[Cube] c ON
		c.[CubeName] = a.[Name]
	LEFT OUTER JOIN [setup].[ProjectCube] a0 ON
		a0.[CubeID] = ''
	LEFT OUTER JOIN [setup].[ProjectPartTranslation] t0 ON
		t0.[LanguageID] = ISNULL(i.[DocLanguageID], 1029) AND
		t0.[ObjectType] = 'cube' AND
		t0.[ObjectID] = '' AND
		t0.[ObjectPartType] = 'Cube' AND
		t0.[ObjectPartID] = '' AND
		t0.[ObjectPartNo] = 0
WHERE a.[DocUsage] = 1
--ORDER BY [CubeType] DESC, [CubeName]

GO
/****** Object:  View [setup].[v_ProjectDim_Cubes_Doc]    Script Date: 11.9.2017 10:30:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [setup].[v_ProjectDim_Cubes_Doc] AS
SELECT
	d.[DimID],
	d.[DimName],
	d.[DimOriginalName],
	c.[CubeID],
	c.[CubeName],
	c.[CubeOriginalName],
	c.[CubeType],
	[RelationShipType] = CASE WHEN a.[DimID] IS NULL THEN 0 ELSE 1 END
FROM
	[setup].[v_ProjectDim_Doc] d 
	INNER JOIN [setup].[v_ProjectCube_Doc] c ON 1 = 1
	LEFT OUTER JOIN 
	(SELECT DISTINCT [CubeID], [DimID] FROM [setup].[v_ProjectCube_DimUsage_Doc]) a ON
		d.[DimID] = a.[DimID] AND
		c.[CubeID] = a.[CubeID]
WHERE d.[DimID] > '' AND c.[CubeID] > '' OR d.[DimID] = '' AND c.[CubeID] = ''
--ORDER BY [DimName]

GO
/****** Object:  View [setup].[v_ProjectCube_Measure_Doc]    Script Date: 11.9.2017 10:30:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [setup].[v_ProjectCube_Measure_Doc] AS
SELECT
	a.[CubeID],
	a.[MeasureGroupID],
	[MeasureGroupType] = CASE WHEN mg.[MeasureGroupName] IS NULL THEN 0 ELSE 1 END,
	[MeasureGroupName] = ISNULL(mg.[MeasureGroupName], 'Hodnoty'), -- jeste se asi upravi (pridat preklady)
	[MeasureGroupOriginalName] = ISNULL(mg.[MeasureGroupOriginalName], ''),
	[MeasureGroupDescription] = ISNULL(mg.[MeasureGroupDescription], ''),
	a.[MeasureID],
	a.[IsCalculated],
	[MeasureName] = ISNULL(NULLIF(t.[NameTranslation], ''), a.[Name]),
	[MeasureOriginalName] = a.[Name],
	[MeasureDescription] = ISNULL(NULLIF(t.[DescriptionTranslation], ''), a.[Description]),
	[MeasureDisplayFolder] = ISNULL(NULLIF(t.[DisplayFolderTranslation], ''), a.[DisplayFolder]),
	a.[SourceTable],
	a.[SourceColumn],
	a.[AggregateFunction]
FROM
	[setup].[ProjectCube_Measure] a
	INNER JOIN [setup].[Instance] i ON 1=1
	LEFT OUTER JOIN [setup].[v_ProjectCube_MeasureGroup_Doc] mg ON
		mg.[CubeID] = a.[CubeID] AND
		mg.[MeasureGroupID] = a.[MeasureGroupID]
	LEFT OUTER JOIN [setup].[ProjectPartTranslation] t ON
		t.[LanguageID] = ISNULL(i.[DocLanguageID], 1029) AND
		t.[ObjectType] = 'cube' AND
		t.[ObjectID] = a.[CubeID] AND
		t.[ObjectPartType] = 'CubeMeasure' AND
		t.[ObjectPartID] = a.[MeasureID] AND
		t.[ObjectPartNo] = 0
WHERE a.[DocUsage] = 1
-- ORDER BY [MeasureGroupType] DESC, [MeasureGroupName], [MeasureDisplayFolder], [MeasureName]

GO
/****** Object:  View [setup].[v_CubeCalcMeasureDescriptions]    Script Date: 11.9.2017 10:30:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [setup].[v_CubeCalcMeasureDescriptions] AS
WITH CalcDesc
	([CubeName],
	[OrderGroup],
	[NamedSetType],
	[MeasureName],
	[CalcMeasureID],
	[DerivedTypeID],
	[DerivedName],
	[Description],
	[PreTranslation],
	[PostTranslation],
	[PreDescription],
	[PostDescription],
	[CzechOriginalName],
	[SmallFirstChar],
	[CzechName],
	[CzechDescription],
	[CreateTimeCompDescription]
	) AS
	(SELECT
		c.[CubeName],
		a.[OrderGroup],
		a.[NamedSetType],
		a.[MeasureName],
		a.[CubeCalcMeasureID],
		t.[DerivedCalcMeasureTypeID],
		[DerivedName] =
			CASE t.[DerivedCalcMeasureTypeID]
				WHEN 0		THEN a.[MeasureName]
				WHEN 1		THEN a.[MeasureName] + N' sum'
				WHEN 100	THEN a.[MeasureName] + N' to Date'
				WHEN 101	THEN a.[MeasureName] + N' to Date sum'
				WHEN 150	THEN N'Initial ' + a.[MeasureName]
				WHEN 160	THEN N'Initial ' + a.[MeasureName] + N' to Date'
				WHEN 210	THEN a.[MeasureName] + N' YTD'
				WHEN 220	THEN a.[MeasureName] + N' Y-1'
				WHEN 221	THEN a.[MeasureName] + N' Change Y-1'
				WHEN 222	THEN a.[MeasureName] + N' index Y-1'
				WHEN 230	THEN a.[MeasureName] + N' YTD Y-1'
				WHEN 231	THEN a.[MeasureName] + N' Change YTD Y-1'
				WHEN 232	THEN a.[MeasureName] + N' index YTD Y-1'
				WHEN 300	THEN N'Min ' + a.[MeasureName] + N' in Time Span'
				WHEN 305	THEN N'Min ' + a.[MeasureName] + N' in Time Span to Date'
				WHEN 310	THEN N'Min ' + a.[MeasureName] + N' in Time Span YTD'
				WHEN 320	THEN N'Min ' + a.[MeasureName] + N' in Time Span Y-1'
				WHEN 321	THEN N'Min ' + a.[MeasureName] + N' in Time Span Change Y-1'
				WHEN 322	THEN N'Min ' + a.[MeasureName] + N' in Time Span index Y-1'
				WHEN 330	THEN N'Min ' + a.[MeasureName] + N' in Time Span YTD Y-1'
				WHEN 331	THEN N'Min ' + a.[MeasureName] + N' in Time Span Change YTD Y-1'
				WHEN 332	THEN N'Min ' + a.[MeasureName] + N' in Time Span index YTD Y-1'
				WHEN 400	THEN N'Max ' + a.[MeasureName] + N' in Time Span'
				WHEN 405	THEN N'Max ' + a.[MeasureName] + N' in Time Span to Date'
				WHEN 410	THEN N'Max ' + a.[MeasureName] + N' in Time Span YTD'
				WHEN 420	THEN N'Max ' + a.[MeasureName] + N' in Time Span Y-1'
				WHEN 421	THEN N'Max ' + a.[MeasureName] + N' in Time Span Change Y-1'
				WHEN 422	THEN N'Max ' + a.[MeasureName] + N' in Time Span index Y-1'
				WHEN 430	THEN N'Max ' + a.[MeasureName] + N' in Time Span YTD Y-1'
				WHEN 431	THEN N'Max ' + a.[MeasureName] + N' in Time Span Change YTD Y-1'
				WHEN 432	THEN N'Max ' + a.[MeasureName] + N' in Time Span index YTD Y-1'
			END,
		RTRIM([setup].[ConvertIdentifiers](a.[Description], '	
', ' ')),	-- TAB and NewLine replacing by space
		tt1029.[MeasureNamePreTranslation],
		tt1029.[MeasureNamePostTranslation],
		t.[PreDescription],
		t.[PostDescription],
		ISNULL(t10290.[MeasureNameTranslation], ''),
		ISNULL(t10290.[SmallFirstChar], 1),
		ISNULL(t1029.[MeasureNameTranslation], ''),
		RTRIM([setup].[ConvertIdentifiers](ISNULL(t1029.[DescriptionTranslation], ''), '	
', ' ')),	-- TAB and NewLine replacing by space
		i.[CreateTimeCompDescription]
	FROM
		[setup].[CubeCalcMeasure] a
		INNER JOIN [setup].[Instance] i ON 1 = 1
		INNER JOIN [setup].[Cube] c ON
			c.[CubeID] = a.[CubeID]
		INNER JOIN [setup].[DerivedCalcMeasureType] t ON
			t.[DerivedCalcMeasureTypeID] = 0 AND a.[DefinedByFormula] > '' OR
			a.[IsNamedSet] = 0 AND
			(
				(t.[DerivedCalcMeasureTypeID] = 0	AND a.[GenerateToDateMembers] = 1 AND NOT (a.[TimeCompDerivedFromFormula] = 1 AND a.[ToDateSourceName] = '' OR NOT(a.[ToDateSourceName] > '' AND a.[IsSaldo] = 1 AND a.[DefinedByFormula]  = ''))) OR
				(t.[DerivedCalcMeasureTypeID] = 1	AND a.[GenerateToDateMembers] = 1 AND a.[GenerateToDateSumMembers] = 1 AND (a.[ToDateSourceName] > '' AND a.[IsSaldo] = 1 AND a.[DefinedByFormula]  = '')) OR
				(t.[DerivedCalcMeasureTypeID] = 100	AND a.[GenerateToDateMembers] = 1 AND (a.[TimeCompDerivedFromFormula] = 1 AND a.[ToDateSourceName] = '' OR NOT(a.[ToDateSourceName] > '' AND a.[IsSaldo] = 1 AND a.[DefinedByFormula]  = ''))) OR
				(t.[DerivedCalcMeasureTypeID] = 101	AND a.[GenerateToDateMembers] = 1 AND a.[GenerateToDateSumMembers] = 1 AND NOT(a.[ToDateSourceName] > '' AND a.[IsSaldo] = 1 AND a.[DefinedByFormula]  = '')) OR
				(t.[DerivedCalcMeasureTypeID] = 150	AND a.[GenerateInitialMembers] = 1 AND (a.[GenerateToDateMembers] = 0 OR a.[ToDateSourceName] > '' AND a.[IsSaldo] = 1 AND a.[DefinedByFormula]  = '')) OR
				(t.[DerivedCalcMeasureTypeID] = 160	AND a.[GenerateInitialMembers] = 1 AND NOT (a.[GenerateToDateMembers] = 0 OR a.[ToDateSourceName] > '' AND a.[IsSaldo] = 1 AND a.[DefinedByFormula]  = '')) OR
				(t.[DerivedCalcMeasureTypeID] = 210	AND a.[GenerateYTDMembers] = 1) OR
				(t.[DerivedCalcMeasureTypeID] IN (220, 221, 222)	AND a.[GeneratePrevYearMembers] = 1) OR
				(t.[DerivedCalcMeasureTypeID] IN (230, 231, 232)	AND a.[GenerateYTDMembers] = 1 AND a.[GeneratePrevYearMembers] = 1) OR
				(t.[DerivedCalcMeasureTypeID] IN (300, 400)	AND a.[GenerateMinMaxMembers] = 1) OR
				(t.[DerivedCalcMeasureTypeID] IN (305, 405)	AND a.[GenerateMinMaxMembers] = 1 AND a.[GenerateMinMaxToDateMembers] = 1) OR
				(t.[DerivedCalcMeasureTypeID] IN (310, 410)	AND a.[GenerateMinMaxMembers] = 1 AND a.[GenerateMinMaxYTDMembers] = 1) OR
				(t.[DerivedCalcMeasureTypeID] IN (320, 321, 322, 420, 421, 422)	AND a.[GenerateMinMaxMembers] = 1 AND a.[GenerateMinMaxPrevYearMembers] = 1) OR
				(t.[DerivedCalcMeasureTypeID] IN (330, 331, 332, 430, 431, 432)	AND a.[GenerateMinMaxMembers] = 1 AND a.[GenerateMinMaxYTDMembers] = 1 AND a.[GenerateMinMaxPrevYearMembers] = 1)
			)
		LEFT OUTER JOIN [setup].[DerivedCalcMeasureTypeTranslation] tt1029 ON
			tt1029.[DerivedCalcMeasureTypeID] =t.DerivedCalcMeasureTypeID AND
			tt1029.[LanguageID] = 1029
		LEFT OUTER JOIN [setup].[CubeCalcMeasureTranslation] t1029 ON
			t1029.[LanguageID] = 1029 AND
			t1029.[CubeCalcMeasureID] = a.[CubeCalcMeasureID] AND
			t1029.[DerivedCalcMeasureTypeID] = t.[DerivedCalcMeasureTypeID]
		LEFT OUTER JOIN [setup].[CubeCalcMeasureTranslation] t10290 ON
			t10290.[LanguageID] = 1029 AND
			t10290.[CubeCalcMeasureID] = a.[CubeCalcMeasureID] AND
			t10290.[DerivedCalcMeasureTypeID] = 0
	WHERE
		a.[VisibleMeasure] = 1 AND
		a.[Active] = 1 AND
		RIGHT(a.[MeasureName], 4) <> ' ACY' AND					-- AditionalCurrency
		NOT t.DerivedCalcMeasureTypeID % 100 BETWEEN 10 AND 32	-- TimeComp
	)
SELECT
	a.[CubeName],
	a.[OrderGroup],
	[CalculationType] = CASE WHEN a.[NamedSetType] = 0 THEN 'Measure' ELSE 'Set' END,
	a.[CalcMeasureID],
	[OriginalName] = a.[MeasureName],
	a.[DerivedTypeID],
	a.[DerivedName],
	[OriginalDescription] = a.[Description],
	[GeneratedDescription] =
		CASE WHEN  (a.[CreateTimeCompDescription] = 0 AND (a.[DerivedTypeID] % 100 BETWEEN 10 AND 32)) OR a.[Description] = ''
			 THEN ''
			 ELSE a.[PreDescription] + CASE WHEN  a.[PreDescription] > '' AND a.[SmallFirstChar] = 1 THEN LOWER(SUBSTRING(a.[Description], 1, 1)) + SUBSTRING(a.[Description], 2, LEN(a.[Description])) ELSE a.[Description] END + a.[PostDescription] 
		END,
	[CzechOriginalName] = CASE WHEN a.[CzechOriginalName] = '' OR a.[NamedSetType] = 1 THEN a.[MeasureName] ELSE a.[CzechOriginalName] END,
	[CzechName] =
	CASE
		WHEN a.[NamedSetType] = 1 THEN a.[MeasureName]
		WHEN a.[CzechName] > '' THEN a.[CzechName]
		WHEN a.[CzechOriginalName] > '' THEN a.[PreTranslation] + CASE WHEN  a.[PreTranslation] > '' AND a.[SmallFirstChar] = 1 THEN LOWER(SUBSTRING(a.[CzechOriginalName], 1, 1)) + SUBSTRING(a.[CzechOriginalName], 2, LEN(a.[CzechOriginalName])) ELSE a.[CzechOriginalName] END + a.[PostTranslation] 
		ELSE a.[MeasureName]
	END,
	a.[CzechDescription]
FROM
	CalcDesc a

GO
/****** Object:  View [setup].[v_DataSourceTablesColumns]    Script Date: 11.9.2017 10:30:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [setup].[v_DataSourceTablesColumns] AS
SELECT
	b.TableID,
	b.TableNameSource,
	a.ColumnID,
	a.ColumnNameSource,
	a.ColumnNameSql,
	a.ColumnNameStage,
	a.ColumnType,
	a.ExistsInDataSource,
	a.IsPartOfPrimaryKey,
	a.Active,
	a.LongerTextField
FROM
	setup.DataSourceColumn a
	INNER JOIN setup.DataSourceTable b ON
		b.DataSourceTableID = a.DataSourceTableID


GO
/****** Object:  View [setup].[v_DefaultDimensionValue]    Script Date: 11.9.2017 10:30:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE VIEW [setup].[v_DefaultDimensionValue] AS
SELECT
	[ColumnType] = 'date',
	[ColumnValue] = '19000101'
UNION
SELECT
	[ColumnType] = 'datetime',
	[ColumnValue] = '19000101'
UNION
SELECT
	[ColumnType] = 'decimal',
	[ColumnValue] = '0' 
UNION
SELECT
	[ColumnType] = 'int',
	[ColumnValue] = '-1' 
UNION
SELECT
	[ColumnType] = 'smallint',
	[ColumnValue] = '-1' 
UNION
SELECT
	[ColumnType] = 'tinyint',
	[ColumnValue] = '0' 
UNION
SELECT
	[ColumnType] = 'bigint',
	[ColumnValue] = '-1'
UNION
SELECT
	[ColumnType] = 'varchar',
	[ColumnValue] = 'N/A'
UNION
SELECT
	[ColumnType] = 'nvarchar',
	[ColumnValue] = 'N/A'
UNION
SELECT
	[ColumnType] = 'numeric',
	[ColumnValue] = '0'
UNION
SELECT
	[ColumnType] = 'image',
	[ColumnValue] = 'NULL'
UNION
SELECT
	[ColumnType] = 'nchar',
	[ColumnValue] = 'N/A'







GO
/****** Object:  View [setup].[v_DocCube]    Script Date: 11.9.2017 10:30:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [setup].[v_DocCube] AS
SELECT
	a.[CubeID],
	[CubeType] = CASE WHEN a.[CubeID] = '' THEN 2 WHEN c.[StandardCube] = 1 THEN 1 ELSE 0 END,	-- 0 NonStandard, 1 Standard, 2 NonExisting
	[CubeName] = ISNULL(NULLIF(t.[NameTranslation], ''), a.[Name]),
	[CubeDescription] = ISNULL(NULLIF(t.[DescriptionTranslation], ''), a.[Description])
FROM
	[setup].[ProjectCube] a
	INNER JOIN [setup].[Instance] i ON 1=1
	LEFT OUTER JOIN [setup].[ProjectPartTranslation] t ON
		t.[LanguageID] = ISNULL(i.[DocLanguageID], 1029) AND
		t.[ObjectType] = 'cube' AND
		t.[ObjectID] = a.[CubeID] AND
		t.[ObjectPartType] = 'Cube' AND
		t.[ObjectPartID] = a.[CubeID]
	LEFT OUTER JOIN [setup].[Cube] c ON
		c.[CubeName] = a.[Name]
WHERE a.[DocUsage] = 1
--ORDER BY [CubeType] DESC, [CubeName]

GO
/****** Object:  View [setup].[v_Log]    Script Date: 11.9.2017 10:30:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [setup].[v_Log] AS
SELECT TOP 1000
	a.LogID,
	a.BatchID,
	a.StoredProcedureName,
	a.LogStartDate,
	a.LogEndDate,
	a.Duration,
	a.[RowCount],
	a.[Status],
	a.StatusDesc
FROM
	setup.[Log] a
ORDER BY
	LogID DESC


GO
/****** Object:  View [setup].[v_ProjectCube_Set_Doc]    Script Date: 11.9.2017 10:30:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [setup].[v_ProjectCube_Set_Doc] AS
SELECT
	a.[CubeID],
	a.[SetID],
	a.[IsDynamic],
	--[SetName] = ISNULL(NULLIF(t.[NameTranslation], ''), a.[Name]),
	[SetName] = a.[Name],
	[SetOriginalName] = a.[Name],
	[SetDescription] = ISNULL(NULLIF(t.[DescriptionTranslation], ''), a.[Description])
FROM
	[setup].[ProjectCube_Set] a
	INNER JOIN [setup].[Instance] i ON 1=1
	LEFT OUTER JOIN [setup].[ProjectPartTranslation] t ON
		t.[LanguageID] = ISNULL(i.[DocLanguageID], 1029) AND
		t.[ObjectType] = 'cube' AND
		t.[ObjectID] = a.[CubeID] AND
		t.[ObjectPartType] = 'CubeSet' AND
		t.[ObjectPartID] = a.[SetID] AND
		t.[ObjectPartNo] = 0
WHERE a.[DocUsage] = 1
-- ORDER BY [SetName]

GO
/****** Object:  View [setup].[v_ProjectDim_AttributeProperties_Doc]    Script Date: 11.9.2017 10:30:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [setup].[v_ProjectDim_AttributeProperties_Doc] AS
SELECT
	a.[DimID],
	[PropertyID] = a.[AttributeID],
	[SourceAttributeID] = sa.[AttributeID],
	[SourceAttributeName] = ISNULL(NULLIF(st.[NameTranslation], ''), sa.[Name]),
	[SourceAttributeOriginalName] = sa.[Name],
	[PropertyName] = ISNULL(NULLIF(t.[NameTranslation], ''), a.[Name]),
	[PropertyOriginalName] = a.[Name],
	[PropertyDescription] = ISNULL(NULLIF(t.[DescriptionTranslation], ''), a.[Description])
FROM
	[setup].[ProjectDim_Attribute] a
	INNER JOIN [setup].[Instance] i ON 1=1
	LEFT OUTER JOIN [setup].[ProjectPartTranslation] t ON
		t.[LanguageID] = ISNULL(i.[DocLanguageID], 1029) AND
		t.[ObjectType] = 'dim' AND
		t.[ObjectID] = a.[DimID] AND
		t.[ObjectPartType] = 'DimAttribute' AND
		t.[ObjectPartID] = a.[AttributeID] AND
		t.[ObjectPartNo] = 0
	INNER JOIN [setup].[ProjectDim_AttributeRelationship] r ON
		r.[DimID] = a.[DimID] AND r.[AttributeID] = a.[AttributeID]
	INNER JOIN [setup].[ProjectDim_Attribute] sa ON	-- Source Attribute
		sa.[DimID] = r.[DimID] AND
		sa.[AttributeID] = r.[SourceAttributeID] AND
		sa.[DocUsage] = 1 AND
		sa.[HierarchyEnabled] = 1
	LEFT OUTER JOIN [setup].[ProjectPartTranslation] st ON
		st.[LanguageID] = ISNULL(i.[DocLanguageID], 1029) AND
		st.[ObjectType] = 'dim' AND
		st.[ObjectID] = a.[DimID] AND
		st.[ObjectPartType] = 'DimAttribute' AND
		st.[ObjectPartID] = sa.[AttributeID] AND
		st.[ObjectPartNo] = 0
WHERE a.[DocUsage] = 1 AND a.[HierarchyEnabled] = 0 AND a.[HierarchyVisible] = 1
-- ORDER BY [SourceAttributeName], [PropertyName]

GO
/****** Object:  View [setup].[v_Unused_DimFact]    Script Date: 11.9.2017 10:30:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [setup].[v_Unused_DimFact] AS
SELECT 
	a.[DimFactID],
	a.[Name],
	b.[CubeID]
FROM 
	[setup].[DimFact] a
LEFT OUTER JOIN [setup].[RelationCube_DimFact] b ON
	b.[DimFactID] = a.[DimFactID]
WHERE [CubeID] IS NULL



GO
ALTER TABLE [setup].[Company] ADD  DEFAULT ('CZ') FOR [CountryCode]
GO
ALTER TABLE [setup].[Company] ADD  DEFAULT ('Česká republika') FOR [CountryName]
GO
ALTER TABLE [setup].[Company] ADD  DEFAULT ('CZK') FOR [LocalCurrency]
GO
ALTER TABLE [setup].[Company] ADD  DEFAULT ('EUR') FOR [AdditionalCurrency]
GO
ALTER TABLE [setup].[Cube] ADD  DEFAULT ((1)) FOR [Bought]
GO
ALTER TABLE [setup].[Cube] ADD  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [setup].[Cube] ADD  DEFAULT ((0)) FOR [ManualRelationSetup]
GO
ALTER TABLE [setup].[CubeCalcMeasure] ADD  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [setup].[CubeCalcMeasure] ADD  DEFAULT ((0)) FOR [ActiveWithoutStateTableOnly]
GO
ALTER TABLE [setup].[CubeCalcMeasure] ADD  DEFAULT ((0)) FOR [OrderGroup]
GO
ALTER TABLE [setup].[CubeCalcMeasure] ADD  DEFAULT ('') FOR [DefinedByFormula]
GO
ALTER TABLE [setup].[CubeCalcMeasure] ADD  DEFAULT ('') FOR [DefinedByPostFormula]
GO
ALTER TABLE [setup].[CubeCalcMeasure] ADD  DEFAULT ('') FOR [NonEmptyBehaviorMeasureList]
GO
ALTER TABLE [setup].[CubeCalcMeasure] ADD  DEFAULT ('#,#.00') FOR [FormatString]
GO
ALTER TABLE [setup].[CubeCalcMeasure] ADD  DEFAULT ((1)) FOR [VisibleMeasure]
GO
ALTER TABLE [setup].[CubeCalcMeasure] ADD  DEFAULT ((0)) FOR [GenerateToDateMembers]
GO
ALTER TABLE [setup].[CubeCalcMeasure] ADD  DEFAULT ((0)) FOR [GenerateToDateSumMembers]
GO
ALTER TABLE [setup].[CubeCalcMeasure] ADD  DEFAULT ((0)) FOR [GenerateInitialMembers]
GO
ALTER TABLE [setup].[CubeCalcMeasure] ADD  DEFAULT ('') FOR [ToDateSourceName]
GO
ALTER TABLE [setup].[CubeCalcMeasure] ADD  DEFAULT ((0)) FOR [ToDateNullForAllDate]
GO
ALTER TABLE [setup].[CubeCalcMeasure] ADD  DEFAULT ((0)) FOR [GenerateYTDMembers]
GO
ALTER TABLE [setup].[CubeCalcMeasure] ADD  DEFAULT ((0)) FOR [GeneratePrevYearMembers]
GO
ALTER TABLE [setup].[CubeCalcMeasure] ADD  DEFAULT ((0)) FOR [TimeCompDerivedFromFormula]
GO
ALTER TABLE [setup].[CubeCalcMeasure] ADD  DEFAULT ((0)) FOR [GenerateMinMaxMembers]
GO
ALTER TABLE [setup].[CubeCalcMeasure] ADD  DEFAULT ((0)) FOR [GenerateMinMaxToDateMembers]
GO
ALTER TABLE [setup].[CubeCalcMeasure] ADD  DEFAULT ((0)) FOR [GenerateMinMaxYTDMembers]
GO
ALTER TABLE [setup].[CubeCalcMeasure] ADD  DEFAULT ((0)) FOR [GenerateMinMaxPrevYearMembers]
GO
ALTER TABLE [setup].[CubeCalcMeasure] ADD  DEFAULT ((0)) FOR [IsSaldo]
GO
ALTER TABLE [setup].[CubeCalcMeasure] ADD  DEFAULT ((0)) FOR [AggFnIsAggregate]
GO
ALTER TABLE [setup].[CubeCalcMeasure] ADD  DEFAULT ('') FOR [MeasureGroup]
GO
ALTER TABLE [setup].[CubeCalcMeasure] ADD  DEFAULT ('') FOR [DisplayFolder]
GO
ALTER TABLE [setup].[CubeCalcMeasure] ADD  DEFAULT ('') FOR [Comment]
GO
ALTER TABLE [setup].[CubeCalcMeasure] ADD  DEFAULT ((0)) FOR [IsNamedSet]
GO
ALTER TABLE [setup].[CubeCalcMeasure] ADD  DEFAULT ((0)) FOR [NamedSetType]
GO
ALTER TABLE [setup].[CubeCalcMeasure] ADD  DEFAULT ('') FOR [Description]
GO
ALTER TABLE [setup].[CubeCalcMeasureTranslation] ADD  DEFAULT ((0)) FOR [DerivedCalcMeasureTypeID]
GO
ALTER TABLE [setup].[CubeCalcMeasureTranslation] ADD  DEFAULT ('') FOR [DescriptionTranslation]
GO
ALTER TABLE [setup].[DataSource] ADD  DEFAULT ('."\/''%][') FOR [NAVNameChangedCharacters]
GO
ALTER TABLE [setup].[DataSource] ADD  DEFAULT ('_') FOR [NAVNameReplacementCharacter]
GO
ALTER TABLE [setup].[DataSource] ADD  CONSTRAINT [NullableMissingFields_Default]  DEFAULT ((0)) FOR [NullableMissingFields]
GO
ALTER TABLE [setup].[DataSourceTable] ADD  CONSTRAINT [DF_DataSourceTable_IncrementalUpdate]  DEFAULT ((0)) FOR [IncrementalUpdate]
GO
ALTER TABLE [setup].[DerivedCalcMeasureType] ADD  DEFAULT ('') FOR [Comment]
GO
ALTER TABLE [setup].[DerivedCalcMeasureType] ADD  DEFAULT ('') FOR [PreDescription]
GO
ALTER TABLE [setup].[DerivedCalcMeasureType] ADD  DEFAULT ('') FOR [PostDescription]
GO
ALTER TABLE [setup].[DerivedCalcMeasureTypeTranslation] ADD  DEFAULT ('') FOR [DisplayFolderTranslation]
GO
ALTER TABLE [setup].[DerivedCalcMeasureTypeTranslation] ADD  DEFAULT ('') FOR [MeasureNamePreTranslation]
GO
ALTER TABLE [setup].[DerivedCalcMeasureTypeTranslation] ADD  DEFAULT ('') FOR [MeasureNamePostTranslation]
GO
ALTER TABLE [setup].[DerivedCalcMeasureTypeTranslation] ADD  DEFAULT ('') FOR [Comment]
GO
ALTER TABLE [setup].[DerivedCalcMeasureTypeTranslation] ADD  DEFAULT ('') FOR [DescriptionPreTranslation]
GO
ALTER TABLE [setup].[DerivedCalcMeasureTypeTranslation] ADD  DEFAULT ('') FOR [DescriptionPostTranslation]
GO
ALTER TABLE [setup].[DimFact] ADD  DEFAULT ((1)) FOR [StandardFilling]
GO
ALTER TABLE [setup].[DimFact] ADD  DEFAULT ('') FOR [SourceViewSchema]
GO
ALTER TABLE [setup].[DimFact] ADD  DEFAULT ('') FOR [SourceViewName]
GO
ALTER TABLE [setup].[DimFact] ADD  DEFAULT ((0)) FOR [ACYAllowed]
GO
ALTER TABLE [setup].[DimFact] ADD  DEFAULT ('') FOR [ACYDateID]
GO
ALTER TABLE [setup].[DimFact] ADD  DEFAULT ('') FOR [MergeOnList]
GO
ALTER TABLE [setup].[DimFactIndex] ADD  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [setup].[DimFactIndex] ADD  DEFAULT ('01') FOR [IndexNameEnd]
GO
ALTER TABLE [setup].[DimFactIndex] ADD  DEFAULT ((1)) FOR [UniqueIndex]
GO
ALTER TABLE [setup].[DimFactIndex] ADD  DEFAULT ('') FOR [IncludeColumnsList]
GO
ALTER TABLE [setup].[DimFactIndex] ADD  DEFAULT ('') FOR [FilterDefinition]
GO
ALTER TABLE [setup].[FactForeignKey] ADD  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [setup].[FactForeignKey] ADD  DEFAULT ('dwh') FOR [RefTableSchema]
GO
ALTER TABLE [setup].[Instance] ADD  CONSTRAINT [FiscalYearMonthStart]  DEFAULT ((1)) FOR [FiscalYearMonthStart]
GO
ALTER TABLE [setup].[Instance] ADD  DEFAULT ('."\/''%][ _ ()') FOR [CharactersRemovedFromDwhNames]
GO
ALTER TABLE [setup].[Instance] ADD  DEFAULT ((0)) FOR [SuspendedIncrementalUpdate]
GO
ALTER TABLE [setup].[Instance] ADD  DEFAULT ((0)) FOR [SuspendedIncrementalUpdateDWH]
GO
ALTER TABLE [setup].[Instance] ADD  DEFAULT ((0)) FOR [CreateTimeCompDescription]
GO
ALTER TABLE [setup].[Language] ADD  DEFAULT ((0)) FOR [SmallFirstChar]
GO
ALTER TABLE [setup].[ProjectCube] ADD  DEFAULT ((1)) FOR [DocUsage]
GO
ALTER TABLE [setup].[ProjectCube_Dim] ADD  DEFAULT ((1)) FOR [DocUsage]
GO
ALTER TABLE [setup].[ProjectCube_DimUsage] ADD  DEFAULT ((1)) FOR [DocUsage]
GO
ALTER TABLE [setup].[ProjectCube_Measure] ADD  DEFAULT ((1)) FOR [DocUsage]
GO
ALTER TABLE [setup].[ProjectCube_Measure] ADD  DEFAULT ('') FOR [AggregateFunction]
GO
ALTER TABLE [setup].[ProjectCube_MeasureGroup] ADD  DEFAULT ((1)) FOR [DocUsage]
GO
ALTER TABLE [setup].[ProjectCube_Set] ADD  DEFAULT ((1)) FOR [DocUsage]
GO
ALTER TABLE [setup].[ProjectCube_Set] ADD  DEFAULT ((1)) FOR [Visible]
GO
ALTER TABLE [setup].[ProjectDim] ADD  DEFAULT ((1)) FOR [DocUsage]
GO
ALTER TABLE [setup].[ProjectDim_Attribute] ADD  DEFAULT ((1)) FOR [DocUsage]
GO
ALTER TABLE [setup].[ProjectDim_AttributeRelationship] ADD  DEFAULT ((1)) FOR [DocUsage]
GO
ALTER TABLE [setup].[ProjectDim_Hierarchy] ADD  DEFAULT ((1)) FOR [DocUsage]
GO
ALTER TABLE [setup].[ProjectDim_HierarchyLevel] ADD  DEFAULT ((1)) FOR [DocUsage]
GO
ALTER TABLE [setup].[ProjectPartTranslation] ADD  DEFAULT ((0)) FOR [ObjectPartNo]
GO
ALTER TABLE [setup].[Company]  WITH CHECK ADD  CONSTRAINT [FK_Company_DataSourceID] FOREIGN KEY([DataSourceID])
REFERENCES [setup].[DataSource] ([DataSourceID])
GO
ALTER TABLE [setup].[Company] CHECK CONSTRAINT [FK_Company_DataSourceID]
GO
ALTER TABLE [setup].[CubeCalcMeasure]  WITH CHECK ADD  CONSTRAINT [FK_CubeCalcMeasure_Cube] FOREIGN KEY([CubeID])
REFERENCES [setup].[Cube] ([CubeID])
GO
ALTER TABLE [setup].[CubeCalcMeasure] CHECK CONSTRAINT [FK_CubeCalcMeasure_Cube]
GO
ALTER TABLE [setup].[CubeCalcMeasureTranslation]  WITH CHECK ADD  CONSTRAINT [FK_CubeCalcMeasureTranslation_CubeCalcMeasure] FOREIGN KEY([CubeCalcMeasureID])
REFERENCES [setup].[CubeCalcMeasure] ([CubeCalcMeasureID])
GO
ALTER TABLE [setup].[CubeCalcMeasureTranslation] CHECK CONSTRAINT [FK_CubeCalcMeasureTranslation_CubeCalcMeasure]
GO
ALTER TABLE [setup].[CubeCalcMeasureTranslation]  WITH CHECK ADD  CONSTRAINT [FK_CubeCalcMeasureTranslation_DerivedCalcMeasureType] FOREIGN KEY([DerivedCalcMeasureTypeID])
REFERENCES [setup].[DerivedCalcMeasureType] ([DerivedCalcMeasureTypeID])
GO
ALTER TABLE [setup].[CubeCalcMeasureTranslation] CHECK CONSTRAINT [FK_CubeCalcMeasureTranslation_DerivedCalcMeasureType]
GO
ALTER TABLE [setup].[CubeCalcMeasureTranslation]  WITH CHECK ADD  CONSTRAINT [FK_CubeCalcMeasureTranslation_Language] FOREIGN KEY([LanguageID])
REFERENCES [setup].[Language] ([LanguageID])
GO
ALTER TABLE [setup].[CubeCalcMeasureTranslation] CHECK CONSTRAINT [FK_CubeCalcMeasureTranslation_Language]
GO
ALTER TABLE [setup].[DataSource]  WITH CHECK ADD  CONSTRAINT [FK_DataSource_DataVersion] FOREIGN KEY([DataVersionID])
REFERENCES [setup].[DataVersion] ([DataVersionID])
GO
ALTER TABLE [setup].[DataSource] CHECK CONSTRAINT [FK_DataSource_DataVersion]
GO
ALTER TABLE [setup].[DataSourceColumn]  WITH CHECK ADD  CONSTRAINT [FK_DataSourceColumn_DataSourceTableID] FOREIGN KEY([DataSourceTableID])
REFERENCES [setup].[DataSourceTable] ([DataSourceTableID])
GO
ALTER TABLE [setup].[DataSourceColumn] CHECK CONSTRAINT [FK_DataSourceColumn_DataSourceTableID]
GO
ALTER TABLE [setup].[DataSourceColumnTranslation]  WITH CHECK ADD  CONSTRAINT [FK_DataSourceColumnTranslation_DataSourceColumnID] FOREIGN KEY([DataSourceColumnID])
REFERENCES [setup].[DataSourceColumn] ([DataSourceColumnID])
GO
ALTER TABLE [setup].[DataSourceColumnTranslation] CHECK CONSTRAINT [FK_DataSourceColumnTranslation_DataSourceColumnID]
GO
ALTER TABLE [setup].[DataSourceColumnTranslation]  WITH CHECK ADD  CONSTRAINT [FK_DataSourceColumnTranslation_DataSourceTableID] FOREIGN KEY([DataSourceTableID])
REFERENCES [setup].[DataSourceTable] ([DataSourceTableID])
GO
ALTER TABLE [setup].[DataSourceColumnTranslation] CHECK CONSTRAINT [FK_DataSourceColumnTranslation_DataSourceTableID]
GO
ALTER TABLE [setup].[DataSourceTable]  WITH CHECK ADD  CONSTRAINT [FK_DataSourceTable_DataSourceID] FOREIGN KEY([DataSourceID])
REFERENCES [setup].[DataSource] ([DataSourceID])
GO
ALTER TABLE [setup].[DataSourceTable] CHECK CONSTRAINT [FK_DataSourceTable_DataSourceID]
GO
ALTER TABLE [setup].[DataVersionTable]  WITH CHECK ADD  CONSTRAINT [FK_DataVersionTable_DataVersion] FOREIGN KEY([DataVersionID])
REFERENCES [setup].[DataVersion] ([DataVersionID])
GO
ALTER TABLE [setup].[DataVersionTable] CHECK CONSTRAINT [FK_DataVersionTable_DataVersion]
GO
ALTER TABLE [setup].[DataVersionTable]  WITH CHECK ADD  CONSTRAINT [FK_DataVersionTable_DimFact] FOREIGN KEY([DimFactID])
REFERENCES [setup].[DimFact] ([DimFactID])
GO
ALTER TABLE [setup].[DataVersionTable] CHECK CONSTRAINT [FK_DataVersionTable_DimFact]
GO
ALTER TABLE [setup].[DerivedCalcMeasureTypeTranslation]  WITH CHECK ADD  CONSTRAINT [FK_DerivedCalcMeasureTypeTranslation_DerivedCalcMeasureType] FOREIGN KEY([DerivedCalcMeasureTypeID])
REFERENCES [setup].[DerivedCalcMeasureType] ([DerivedCalcMeasureTypeID])
GO
ALTER TABLE [setup].[DerivedCalcMeasureTypeTranslation] CHECK CONSTRAINT [FK_DerivedCalcMeasureTypeTranslation_DerivedCalcMeasureType]
GO
ALTER TABLE [setup].[DerivedCalcMeasureTypeTranslation]  WITH CHECK ADD  CONSTRAINT [FK_DerivedCalcMeasureTypeTranslation_Language] FOREIGN KEY([LanguageID])
REFERENCES [setup].[Language] ([LanguageID])
GO
ALTER TABLE [setup].[DerivedCalcMeasureTypeTranslation] CHECK CONSTRAINT [FK_DerivedCalcMeasureTypeTranslation_Language]
GO
ALTER TABLE [setup].[Dimension]  WITH CHECK ADD  CONSTRAINT [FK_GlobalDimension_CompanyID] FOREIGN KEY([CompanyID])
REFERENCES [setup].[Company] ([CompanyID])
GO
ALTER TABLE [setup].[Dimension] CHECK CONSTRAINT [FK_GlobalDimension_CompanyID]
GO
ALTER TABLE [setup].[DimFactIndex]  WITH CHECK ADD  CONSTRAINT [FK_DimFactIndex_DimFact] FOREIGN KEY([DimFactID])
REFERENCES [setup].[DimFact] ([DimFactID])
GO
ALTER TABLE [setup].[DimFactIndex] CHECK CONSTRAINT [FK_DimFactIndex_DimFact]
GO
ALTER TABLE [setup].[FactForeignKey]  WITH CHECK ADD  CONSTRAINT [FK_FactForeignKey_DimFact] FOREIGN KEY([DimFactID])
REFERENCES [setup].[DimFact] ([DimFactID])
GO
ALTER TABLE [setup].[FactForeignKey] CHECK CONSTRAINT [FK_FactForeignKey_DimFact]
GO
ALTER TABLE [setup].[RelationCube_DimFact]  WITH CHECK ADD  CONSTRAINT [FK_RelationCube_DimFact_CubeID] FOREIGN KEY([CubeID])
REFERENCES [setup].[Cube] ([CubeID])
GO
ALTER TABLE [setup].[RelationCube_DimFact] CHECK CONSTRAINT [FK_RelationCube_DimFact_CubeID]
GO
ALTER TABLE [setup].[RelationCube_DimFact]  WITH CHECK ADD  CONSTRAINT [FK_RelationCube_DimFact_DimFactID] FOREIGN KEY([DimFactID])
REFERENCES [setup].[DimFact] ([DimFactID])
GO
ALTER TABLE [setup].[RelationCube_DimFact] CHECK CONSTRAINT [FK_RelationCube_DimFact_DimFactID]
GO
ALTER TABLE [setup].[RelationStage_DimFact]  WITH CHECK ADD  CONSTRAINT [FK_RelationStage_DimFact_DimFactID] FOREIGN KEY([DimFactID])
REFERENCES [setup].[DimFact] ([DimFactID])
GO
ALTER TABLE [setup].[RelationStage_DimFact] CHECK CONSTRAINT [FK_RelationStage_DimFact_DimFactID]
GO
ALTER TABLE [setup].[Translation]  WITH CHECK ADD  CONSTRAINT [FK_setup_Translation_Language] FOREIGN KEY([LanguageID])
REFERENCES [setup].[Language] ([LanguageID])
GO
ALTER TABLE [setup].[Translation] CHECK CONSTRAINT [FK_setup_Translation_Language]
GO
/****** Object:  StoredProcedure [setup].[AddToDataSourceTables]    Script Date: 11.9.2017 10:30:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [setup].[AddToDataSourceTables]
	@TableList nvarchar(max) = NULL

AS
	DECLARE
		-- DataSource variables
		@DataSourceID int,
		@ServerName nvarchar(128),
		@ServerNamePrefix nvarchar (132), -- empty string OR [ServerName].
		@DatabaseName nvarchar(128),
		@CodePage int,
		@NAVNameChangedCharacters nvarchar(128),
		@NAVNameReplacementCharacter nvarchar(1),
		@CompanyName nvarchar(128),	-- First CompanyCode from DataSource (in alphabetical order)
		-- DataSourceTable variables
		@DataSourceTableID int,
		@DataSourceTableIDText nvarchar(20),
		@TableID int,
		@TableIDText nvarchar(20),
		@TableNameSource nvarchar(128),
		@TableNameSql nvarchar(128),
		@TableNameStage nvarchar(128),
		@TableType tinyint,
		@ExistsInDataSource bit,
		@FullTableNameSql nvarchar(128),	--TableNameSql wirh eventuell CompanyName

		@ExecString nvarchar(max),
		@ParmDefinition nvarchar(max),

		@NAVFieldTablesExists int,
		@InsertedColumnsCount int,
		@UpdatedColumnsCount int
	
	SET NOCOUNT ON

	DECLARE DataSourceCursor CURSOR FOR
		SELECT
			a.[DataSourceID],
			a.[ServerName],
			a.[DatabaseName],
			a.[CodePage],
			a.[NAVNameChangedCharacters],
			a.[NAVNameReplacementCharacter]
		FROM
			[setup].[DataSource] a
	
	OPEN DataSourceCursor
	FETCH NEXT FROM DataSourceCursor INTO @DataSourceID, @ServerName, @DatabaseName, @CodePage, @NAVNameChangedCharacters, @NAVNameReplacementCharacter

	-- Loop through DataSources BEGIN
	WHILE @@FETCH_STATUS = 0 
	BEGIN
		-- Loop through NAV Tables
		IF UPPER(@ServerName) <> @@SERVERNAME AND UPPER(@ServerName) <> ''
			SET @ServerNamePrefix = @ServerName + N'.'
		ELSE
			SET @ServerNamePrefix = ''

		SET @ExecString =
				N'SET @TableCount = 
				(SELECT COUNT(*)
				FROM ' + @ServerNamePrefix + @DatabaseName + N'.INFORMATION_SCHEMA.TABLES
				WHERE
					TABLE_SCHEMA = ''dbo'' AND
					TABLE_NAME IN (''NAV Field'',  ''NAV Field Translation'') AND
					TABLE_TYPE = ''BASE TABLE''
				)'
		SET @ParmDefinition = N'@TableCount int OUTPUT';  
		EXEC sp_executesql	@ExecString, @ParmDefinition, @TableCount=@NAVFieldTablesExists OUTPUT	--SET @NAVFieldTablesExists
		IF @NAVFieldTablesExists = 2 SET @NAVFieldTablesExists = 1 ELSE SET @NAVFieldTablesExists = 0

		SET @CompanyName = ISNULL((SELECT MIN(c.CompanyCode) FROM setup.Company c WHERE c.DataSourceID = @DataSourceID), '')
		SET @ExecString = N'
		DECLARE TableCursor CURSOR FOR
			SELECT
				[TableID] = a.[ID],
				[TableNameSource] = a.[Name]
			FROM ' + @ServerNamePrefix + @DatabaseName + N'.[dbo].[Object] a
			WHERE a.[Type] = 1'
		IF @TableList IS NOT NULL
			SET @ExecString = @ExecString + N' AND [ID] IN (' + @TableList + ')'
		SET @ExecString = @ExecString + N' ORDER BY a.[ID]'

		--PRINT @ExecString
		EXEC sp_executesql	@stmt = @ExecString	--DECLARE TableCursor
		OPEN TableCursor
		FETCH NEXT FROM TableCursor INTO @TableID, @TableNameSource

		-- Loop through Tables BEGIN
		WHILE @@FETCH_STATUS = 0 
		BEGIN
			SET @TableIDText = CONVERT(nvarchar(20), @TableID)
			SET @TableNameSql = setup.ConvertIdentifiers(@TableNameSource, @NAVNameChangedCharacters, @NAVNameReplacementCharacter)
			SET @TableNameStage = @TableNameSql
			SET @ExecString =
				N'SET @ExistsInDataSourceOUT = 
				(SELECT COUNT(*)
				FROM ' + @ServerNamePrefix + @DatabaseName + N'.INFORMATION_SCHEMA.TABLES
				WHERE
					TABLE_SCHEMA = ''dbo'' AND
					TABLE_NAME collate DATABASE_DEFAULT = ''' + @TableNameSql + N''' collate DATABASE_DEFAULT AND
					TABLE_TYPE = ''BASE TABLE''
				)'
			SET @ParmDefinition = N'@ExistsInDataSourceOUT int OUTPUT';  
			EXEC sp_executesql	@ExecString, @ParmDefinition, @ExistsInDataSourceOUT=@ExistsInDataSource OUTPUT	--SET @ExistsInDataSource
			IF @ExistsInDataSource = 1	--common NAV table
			BEGIN
				SET @FullTableNameSql = @TableNameSql
				SET @TableType = 0
			END
			ELSE
			BEGIN
				SET @FullTableNameSql = @CompanyName + N'$' + @TableNameSql
				SET @TableType = 1
				SET @ExecString =
					N'SET @ExistsInDataSourceOUT = 
					(SELECT COUNT(*)
					FROM ' + @ServerNamePrefix + @DatabaseName + N'.INFORMATION_SCHEMA.TABLES
					WHERE
						TABLE_SCHEMA = ''dbo'' AND
						TABLE_NAME collate DATABASE_DEFAULT = ''' + @FullTableNameSql + N''' collate DATABASE_DEFAULT AND
						TABLE_TYPE = ''BASE TABLE''
					)'
			SET @ParmDefinition = N'@ExistsInDataSourceOUT int OUTPUT';  
			EXEC sp_executesql	@ExecString, @ParmDefinition, @ExistsInDataSourceOUT=@ExistsInDataSource OUTPUT	--SET @ExistsInDataSource
			END
			IF @ExistsInDataSource = 1	-- only existing table is processed
			BEGIN

				SET @DataSourceTableID = (SELECT a.DataSourceTableID FROM [setup].[DataSourceTable] a WHERE a.DataSourceID = @DataSourceID AND a.TableNameSource = @TableNameSource)			
				IF @DataSourceTableID IS NULL SET @DataSourceTableID = (SELECT a.DataSourceTableID FROM [setup].[DataSourceTable] a WHERE a.DataSourceID = @DataSourceID AND a.TableID = @TableID)
				IF @DataSourceTableID IS NULL	-- New Table
				BEGIN
					INSERT INTO [setup].[DataSourceTable]
						([DataSourceID]
						,[TableID]
						,[TableNameSource]
						,[TableNameSql]
						,[TableNameStage]
						,[TableType]
						,[ExistsInDataSource]
						,[IncrementalUpdate]
						)
					VALUES
						(@DataSourceID
						,@TableID
						,@TableNameSource
						,@TableNameSql
						,@TableNameStage
						,@TableType
						,@ExistsInDataSource
						,0
						)
					SET @DataSourceTableID = (SELECT a.DataSourceTableID FROM [setup].[DataSourceTable] a WHERE a.DataSourceID = @DataSourceID AND a.TableID = @TableID)
				END
				SET @DataSourceTableIDText = CONVERT(nvarchar(20), @DataSourceTableID)
				--PRINT @TableID PRINT @TableNameSource PRINT	@TableNameSql PRINT @TableNameStage PRINT @TableType PRINT @ExistsInDataSource PRINT @FullTableNameSql PRINT @DataSourceTableID
				SET @ExecString = N'
					INSERT INTO [setup].[DataSourceColumn]
						([DataSourceTableID]
						,[ColumnNameSource]
						,[ColumnNameSql]
						,[ColumnNameStage]
						,[ColumnType]
						,[ExistsInDataSource]
						,[IsPartOfPrimaryKey]
						,[Active]
						)
					SELECT
						[DataSourceTableID] = ' + @DataSourceTableIDText + N'
						,[ColumnNameSource] = a.COLUMN_NAME
						,[ColumnNameSql] = a.COLUMN_NAME
						,[ColumnNameStage] = a.COLUMN_NAME
						,[ColumnType] = a.DATA_TYPE +
							CASE
								WHEN UPPER(a.DATA_TYPE) IN (''CHAR'', ''NCHAR'', ''VARCHAR'', ''NVARCHAR'') THEN ISNULL(''(''+ CASE WHEN a.CHARACTER_MAXIMUM_LENGTH = -1 THEN ''max'' ELSE CONVERT(nvarchar, a.CHARACTER_MAXIMUM_LENGTH) END + '')'', '''' )
								WHEN UPPER(a.DATA_TYPE) = ''DECIMAL'' THEN ''('' + CONVERT(nvarchar, a.NUMERIC_PRECISION) + '','' + CONVERT(nvarchar, a.NUMERIC_SCALE) + '')''
								ELSE ''''
							END
						,[ExistsInDataSource] = 1
						,[IsPartOfPrimaryKey] = CASE WHEN ku.COLUMN_NAME IS NULL THEN 0 ELSE 1 END
						,Active = 0
					FROM ' + @ServerNamePrefix + @DatabaseName + N'.INFORMATION_SCHEMA.COLUMNS a
						LEFT OUTER JOIN ' + @ServerNamePrefix + @DatabaseName + N'.INFORMATION_SCHEMA.TABLE_CONSTRAINTS tc ON
							tc.CONSTRAINT_TYPE = ''PRIMARY KEY'' AND
							tc.TABLE_SCHEMA = a.TABLE_SCHEMA AND
							tc.TABLE_NAME = a.TABLE_NAME
						LEFT OUTER JOIN ' + @ServerNamePrefix + @DatabaseName + N'.INFORMATION_SCHEMA.KEY_COLUMN_USAGE ku ON
							ku.TABLE_SCHEMA = tc.TABLE_SCHEMA AND
							ku.TABLE_NAME = tc.TABLE_NAME AND
							ku.CONSTRAINT_NAME = tc.CONSTRAINT_NAME AND
							ku.COLUMN_NAME = a.COLUMN_NAME
  						LEFT OUTER JOIN	[setup].[DataSourceColumn] dsc ON
							dsc.[DataSourceTableID] = ' + @DataSourceTableIDText + N' AND
							dsc.[ColumnNameSql] collate DATABASE_DEFAULT = a.COLUMN_NAME collate DATABASE_DEFAULT
					WHERE
						a.TABLE_NAME collate DATABASE_DEFAULT = ''' + @FullTableNameSql + N''' collate DATABASE_DEFAULT AND
						a.TABLE_SCHEMA = ''dbo'' AND
						dsc.[DataSourceColumnID] IS NULL
					ORDER BY
						a.ORDINAL_POSITION'

				--PRINT @ExecString
				EXEC sp_executesql	@stmt = @ExecString	--INSERT INTO setup.DataSourceColumn
				SET @InsertedColumnsCount = @@ROWCOUNT

				IF @NAVFieldTablesExists = 1
				BEGIN
					SET @ExecString = N'
					UPDATE [setup].[DataSourceColumn] SET
						[ColumnID] = f.[FieldNo],
						[ColumnNameSource] = ISNULL(f.[FieldName], c.[ColumnNameSource]),
						[NAVType] = f.[Type],
						[NAVLen] = f.[Len],
						[NAVOptionString] = f.[OptionString] + f.[OptionString2],
						[NAVRelationTableID] = f.[Relation TableNo],
						[NAVRelationColumnID] = f.[Relation FieldNo]
					FROM [setup].[DataSourceColumn] c
					INNER JOIN [setup].[DataSourceTable] t ON
						t.DataSourceTableID = c.DataSourceTableID AND
						t.TableID = ' + @TableIDText + N'
					LEFT OUTER JOIN ' + @ServerNamePrefix + @DatabaseName + N'.[dbo].[NAV Field] f ON
						f.TableNo = ' + @TableIDText + N' AND
						setup.ConvertIdentifiers(f.FieldName, ''' + REPLACE(@NAVNameChangedCharacters, '''', '''''') + N''', ''' + @NAVNameReplacementCharacter + N''') collate DATABASE_DEFAULT = c.ColumnNameSql collate DATABASE_DEFAULT'
					--PRINT @ExecString
					EXEC sp_executesql	@stmt = @ExecString	--INSERT INTO setup.DataSourceColumn
					SET @UpdatedColumnsCount = @@ROWCOUNT

					SET @ExecString = N'DELETE FROM [setup].[DataSourceColumnTranslation] WHERE [DataSourceTableID] = ' + @DataSourceTableIDText
					EXEC sp_executesql	@stmt = @ExecString
					SET @ExecString = N'
					INSERT INTO [setup].[DataSourceColumnTranslation]
						([DataSourceTableID],
						[DataSourceColumnID],
						[LanguageID],
						[ColumnCaption],
						[OptionCaption]
						)
					SELECT  
						' + @DataSourceTableIDText + N',
						c.[DataSourceColumnID],
						t.[Windows Language ID],
						t.[Caption] + t.[Caption2],
						t.[OptionCaption] + t.[OptionCaption2]
						FROM ' + @ServerNamePrefix + @DatabaseName + N'.[dbo].[NAV Field Translation] t
						INNER JOIN [setup].[DataSourceColumn] c ON
							c.[DataSourceTableID] = ' + @DataSourceTableIDText + N' AND
							c.[ColumnID] = t.[FieldNo]
						WHERE t.[TableNo] = ' + @TableIDText 
					--PRINT @ExecString
					EXEC sp_executesql	@stmt = @ExecString	--INSERT INTO setup.DataSourceColumnTranslation
				END
				ELSE SET @UpdatedColumnsCount = 0

				PRINT 'From T' + @TableIDText + ' ' +  @ServerNamePrefix + @DatabaseName + '.[dbo].[' + @FullTableNameSql + ']: ' +
					CONVERT(nvarchar(20), @InsertedColumnsCount) + ' columns added, ' +
					CONVERT(nvarchar(20), @UpdatedColumnsCount) + ' columns updated'

			END

			FETCH NEXT FROM TableCursor INTO @TableID, @TableNameSource
		END
		-- Loop through Tables END
		CLOSE TableCursor
		DEALLOCATE TableCursor

		FETCH NEXT FROM DataSourceCursor INTO @DataSourceID, @ServerName, @DatabaseName, @CodePage, @NAVNameChangedCharacters, @NAVNameReplacementCharacter
	END
	-- Loop through DataSources END
	CLOSE DataSourceCursor
	DEALLOCATE DataSourceCursor
	SET NOCOUNT OFF



GO
/****** Object:  StoredProcedure [setup].[CompressTables]    Script Date: 11.9.2017 10:30:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [setup].[CompressTables] AS
ALTER TABLE dwh.dim_DocumentBankAccount REBUILD PARTITION = ALL WITH (DATA_COMPRESSION = PAGE)
ALTER TABLE dwh.dim_DocumentGL REBUILD PARTITION = ALL WITH (DATA_COMPRESSION = PAGE)
ALTER TABLE dwh.dim_DocumentInventory REBUILD PARTITION = ALL WITH (DATA_COMPRESSION = PAGE)
ALTER TABLE dwh.dim_DocumentPayables REBUILD PARTITION = ALL WITH (DATA_COMPRESSION = PAGE)
ALTER TABLE dwh.dim_DocumentPurchase REBUILD PARTITION = ALL WITH (DATA_COMPRESSION = PAGE)
ALTER TABLE dwh.dim_DocumentReceivables REBUILD PARTITION = ALL WITH (DATA_COMPRESSION = PAGE)
ALTER TABLE dwh.dim_DocumentSales REBUILD PARTITION = ALL WITH (DATA_COMPRESSION = PAGE)

ALTER TABLE [dwh].[fact_AccountSchedule] REBUILD PARTITION = ALL WITH (DATA_COMPRESSION = PAGE)
ALTER TABLE dwh.fact_BankAccEntry REBUILD PARTITION = ALL WITH (DATA_COMPRESSION = PAGE)
ALTER TABLE dwh.fact_GLBudgetEntry REBUILD PARTITION = ALL WITH (DATA_COMPRESSION = PAGE)
ALTER TABLE dwh.fact_GLEntry REBUILD PARTITION = ALL WITH (DATA_COMPRESSION = PAGE)
ALTER TABLE dwh.fact_Inventory REBUILD PARTITION = ALL WITH (DATA_COMPRESSION = PAGE)
ALTER TABLE dwh.fact_InventoryState REBUILD PARTITION = ALL WITH (DATA_COMPRESSION = PAGE)
ALTER TABLE dwh.fact_Payables REBUILD PARTITION = ALL WITH (DATA_COMPRESSION = PAGE)
ALTER TABLE dwh.fact_PayablesState REBUILD PARTITION = ALL WITH (DATA_COMPRESSION = PAGE)
ALTER TABLE dwh.fact_Receivables REBUILD PARTITION = ALL WITH (DATA_COMPRESSION = PAGE)
ALTER TABLE dwh.fact_ReceivablesState REBUILD PARTITION = ALL WITH (DATA_COMPRESSION = PAGE)
ALTER TABLE dwh.fact_Sales REBUILD PARTITION = ALL WITH (DATA_COMPRESSION = PAGE)

ALTER TABLE stage.[Bank Account Ledger Entry] REBUILD PARTITION = ALL WITH (DATA_COMPRESSION = PAGE)
ALTER TABLE stage.[Cust_ Ledger Entry] REBUILD PARTITION = ALL WITH (DATA_COMPRESSION = PAGE)
ALTER TABLE stage.[Detailed Cust_ Ledg_ Entry] REBUILD PARTITION = ALL WITH (DATA_COMPRESSION = PAGE)
ALTER TABLE stage.[Detailed Vendor Ledg_ Entry] REBUILD PARTITION = ALL WITH (DATA_COMPRESSION = PAGE)
ALTER TABLE stage.[Document Dimension] REBUILD PARTITION = ALL WITH (DATA_COMPRESSION = PAGE)
ALTER TABLE stage.[FA Ledger Entry] REBUILD PARTITION = ALL WITH (DATA_COMPRESSION = PAGE)
ALTER TABLE stage.[G_L Budget Entry] REBUILD PARTITION = ALL WITH (DATA_COMPRESSION = PAGE)
ALTER TABLE stage.[G_L Entry] REBUILD PARTITION = ALL WITH (DATA_COMPRESSION = PAGE)
ALTER TABLE stage.[Item Budget Entry] REBUILD PARTITION = ALL WITH (DATA_COMPRESSION = PAGE)
ALTER TABLE stage.[Item Ledger Entry] REBUILD PARTITION = ALL WITH (DATA_COMPRESSION = PAGE)
ALTER TABLE stage.[Ledger Entry Dimension] REBUILD PARTITION = ALL WITH (DATA_COMPRESSION = PAGE)
ALTER TABLE stage.[Maintenance Ledger Entry] REBUILD PARTITION = ALL WITH (DATA_COMPRESSION = PAGE)
ALTER TABLE stage.[Posted Document Dimension] REBUILD PARTITION = ALL WITH (DATA_COMPRESSION = PAGE)
ALTER TABLE stage.[Purch_ Cr_ Memo Hdr_] REBUILD PARTITION = ALL WITH (DATA_COMPRESSION = PAGE)
ALTER TABLE stage.[Purch_ Cr_ Memo Line] REBUILD PARTITION = ALL WITH (DATA_COMPRESSION = PAGE)
ALTER TABLE stage.[Purch_ Inv_ Header] REBUILD PARTITION = ALL WITH (DATA_COMPRESSION = PAGE)
ALTER TABLE stage.[Purch_ Inv_ Line] REBUILD PARTITION = ALL WITH (DATA_COMPRESSION = PAGE)
ALTER TABLE stage.[Purch_ Rcpt_ Header] REBUILD PARTITION = ALL WITH (DATA_COMPRESSION = PAGE)
ALTER TABLE stage.[Purch_ Rcpt_ Line] REBUILD PARTITION = ALL WITH (DATA_COMPRESSION = PAGE)
ALTER TABLE stage.[Purchase Header] REBUILD PARTITION = ALL WITH (DATA_COMPRESSION = PAGE)
ALTER TABLE stage.[Purchase Line] REBUILD PARTITION = ALL WITH (DATA_COMPRESSION = PAGE)
ALTER TABLE stage.[Res_ Capacity Entry] REBUILD PARTITION = ALL WITH (DATA_COMPRESSION = PAGE)
ALTER TABLE stage.[Return Receipt Header] REBUILD PARTITION = ALL WITH (DATA_COMPRESSION = PAGE)
ALTER TABLE stage.[Return Receipt Line] REBUILD PARTITION = ALL WITH (DATA_COMPRESSION = PAGE)
ALTER TABLE stage.[Return Shipment Header] REBUILD PARTITION = ALL WITH (DATA_COMPRESSION = PAGE)
ALTER TABLE stage.[Return Shipment Line] REBUILD PARTITION = ALL WITH (DATA_COMPRESSION = PAGE)
ALTER TABLE stage.[Sales Cr_Memo Header] REBUILD PARTITION = ALL WITH (DATA_COMPRESSION = PAGE)
ALTER TABLE stage.[Sales Cr_Memo Line] REBUILD PARTITION = ALL WITH (DATA_COMPRESSION = PAGE)
ALTER TABLE stage.[Sales Header] REBUILD PARTITION = ALL WITH (DATA_COMPRESSION = PAGE)
ALTER TABLE stage.[Sales Invoice Header] REBUILD PARTITION = ALL WITH (DATA_COMPRESSION = PAGE)
ALTER TABLE stage.[Sales Invoice Line] REBUILD PARTITION = ALL WITH (DATA_COMPRESSION = PAGE)
ALTER TABLE stage.[Sales Line] REBUILD PARTITION = ALL WITH (DATA_COMPRESSION = PAGE)
ALTER TABLE stage.[Sales Shipment Header] REBUILD PARTITION = ALL WITH (DATA_COMPRESSION = PAGE)
ALTER TABLE stage.[Sales Shipment Line] REBUILD PARTITION = ALL WITH (DATA_COMPRESSION = PAGE)
ALTER TABLE stage.[Value Entry] REBUILD PARTITION = ALL WITH (DATA_COMPRESSION = PAGE)
ALTER TABLE stage.[Vendor Ledger Entry] REBUILD PARTITION = ALL WITH (DATA_COMPRESSION = PAGE)



GO
/****** Object:  StoredProcedure [setup].[DeleteCompany]    Script Date: 11.9.2017 10:30:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [setup].[DeleteCompany]
	@CompanyID int
AS

DELETE
	setup.Dimension
WHERE
	CompanyID = @CompanyID

DELETE
	setup.Company
WHERE
	CompanyID = @CompanyID




GO
/****** Object:  StoredProcedure [setup].[DeleteCubeCalcMeasure]    Script Date: 11.9.2017 10:30:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [setup].[DeleteCubeCalcMeasure]
	@CubeName nvarchar(50),			-- CubeName from setup.Cube
	@IsNamedSet bit = 0,			-- 0 - only CalcMeasures deletion
									-- 1 - only NamedSets    deletion
	@MeasureNameList nvarchar(max),	-- comma separated list with deleted Measures
	@DeleteAllCalcMeasures bit = 0	-- Value 1 - delete All CalcMembers or NamedSets for Cube (irrespectivle of @MeasureNameList)
AS
	DECLARE
		@CubeID int,
		@MeasureName nvarchar(max),
		@MeasureID int,
		@i int

	SET @CubeID = ( SELECT [CubeID] FROM [setup].[Cube] WHERE [CubeName] = @CubeName )
	SET @MeasureNameList = [help].[RemoveWhiteCharactersFromList] (ISNULL(@MeasureNameList, ''))
	SET @DeleteAllCalcMeasures = ISNULL(@DeleteAllCalcMeasures, 0)
	IF @CubeID IS NULL
		PRINT 'Parameter @CubeName is invalid'
	ELSE IF @IsNamedSet NOT IN (0, 1)
		PRINT 'Parameter @IsNamedSet is invalid'
	ELSE IF @MeasureNameList = '' AND @DeleteAllCalcMeasures = 0
		PRINT 'Parameter @MeasureNameList is invalid'
	ELSE
	BEGIN
		SET NOCOUNT ON
		IF @DeleteAllCalcMeasures = 1
		BEGIN
			SET @MeasureNameList = ''
			DECLARE MeasureCursor CURSOR FOR
				SELECT [MeasureName]
				FROM [setup].[CubeCalcMeasure]
				WHERE [CubeID] = @CubeID AND [IsNamedSet] = @IsNamedSet
				ORDER BY [OrderGroup], [MeasureName]
			OPEN MeasureCursor
			FETCH NEXT FROM MeasureCursor INTO @MeasureName
			WHILE @@FETCH_STATUS = 0 
			BEGIN
				SET @MeasureNameList = @MeasureNameList + @MeasureName + ','
				FETCH NEXT FROM MeasureCursor INTO @MeasureName
			END
			CLOSE MeasureCursor
			DEALLOCATE MeasureCursor
			IF @MeasureNameList = '' SET @MeasureNameList = ','
		END
		ELSE
			SET @MeasureNameList = @MeasureNameList + ','
		SET @i = CHARINDEX(',', @MeasureNameList)
		WHILE @i > 0
		BEGIN
			SET @MeasureName = LEFT(@MeasureNameList, @i - 1)
			SET @MeasureNameList = SUBSTRING(@MeasureNameList, @i + 1, LEN(@MeasureNameList))
			SET @i = CHARINDEX(',', @MeasureNameList)
			IF @MeasureName > ''
			BEGIN
				SET @MeasureID = ( SELECT [CubeCalcMeasureID] FROM [setup].[CubeCalcMeasure] a WHERE [CubeID] = @CubeID AND [MeasureName] = @MeasureName AND [IsNamedSet] = @IsNamedSet )
				IF @MeasureID IS NULL
					PRINT N'Cube: [' + @CubeName + N'],  ' + CASE WHEN @IsNamedSet = 0 THEN  N'CalcMeasure: [' ELSE 'NamedSet: [' END + @MeasureName + N']  NOT FOUND'
				ELSE
				BEGIN
					DELETE FROM [setup].[CubeCalcMeasureTranslation] WHERE [CubeCalcMeasureID] = @MeasureID
					DELETE FROM [setup].[CubeCalcMeasure] WHERE [CubeCalcMeasureID] = @MeasureID
					PRINT N'Cube: [' + @CubeName + N'],  ' + CASE WHEN @IsNamedSet = 0 THEN  N'CalcMeasure: [' ELSE 'NamedSet: [' END + @MeasureName + N']  deleted'
				END
			END
		END		
	END


GO
/****** Object:  StoredProcedure [setup].[DisplayDimFactMetadata]    Script Date: 11.9.2017 10:30:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [setup].[DisplayDimFactMetadata]
	@DimFactTableName nvarchar(128),	-- e.g. 'dim_Item' or 'fact_Sales'
	@Type nvarchar(20) = NULL			-- 'Dimension' or 'Fact'
										-- Default 'Dimension' for dim_table or 'Fact' for fact_table

AS
	DECLARE @DimFactID int
	SELECT * FROM [setup].[DimFact] a WHERE a.[Name] = @DimFactTableName AND a.[Type] = ISNULL(@Type, a.[Type])
	SET @Type = ISNULL(@Type, CASE LEFT(@DimFactTableName, 4) WHEN 'dim_' THEN 'Dimension' WHEN 'fact' THEN 'Fact' ELSE NULL END) 
	IF @Type NOT IN ('Dimension', 'Fact') SELECT Error = N'Begin of @DimFactTableName is not ''dim_'' or ''fact_'' or @Type is not ''Dimension'' or ''Fact'' ' ELSE
	BEGIN
		SET @DimFactID = (SELECT [DimFactID] FROM [setup].[DimFact] a WHERE a.[Name] = @DimFactTableName AND a.[Type] = @Type)
		IF @DimFactID IS NULL SELECT Error = N'Unknown table ''' + @DimFactTableName + ''' with type ''' + @Type + ''''
		ELSE
		BEGIN
			SELECT DISTINCT [TableType] = @Type, [TableName] = @DimFactTableName, a.DimFactID, dst.*
				FROM [setup].[RelationStage_DimFact] a
					INNER JOIN [setup].[DataSourceTable] dst ON dst.[TableID] = a.[StageTableID]
					INNER JOIN [setup].[DataSource] ds ON ds.[DataSourceID]  = dst.[DataSourceID]
				WHERE a.[DimFactID] = @DimFactID
				ORDER BY dst.[TableID],dst.[TableNameSource], dst.[TableNameStage]  
			SELECT DISTINCT [TableType] = @Type, [TableName] = @DimFactTableName, a.DimFactID, c.*
				FROM [setup].[RelationCube_DimFact] a
					INNER JOIN [setup].[Cube] c ON c.[CubeID] = a.[CubeID]
				WHERE a.[DimFactID] = @DimFactID
				ORDER BY c.[CubeID]
			SELECT [TableType] = @Type, [TableName] = @DimFactTableName, a.* FROM [setup].[DimFactIndex] a
				WHERE a.[DimFactID] = @DimFactID
			SELECT [TableType] = @Type, [TableName] = @DimFactTableName, a.* FROM [setup].[FactForeignKey] a
				WHERE a.[DimFactID] = @DimFactID
			
			SELECT [Procedure] = '[dwh].[' + a.[name] + ']', [Exist] = CASE WHEN p.[name] IS NULL THEN 'No' ELSE 'Yes' END
			FROM
			(SELECT [name] = 'CreateConstraint_' + @DimFactTableName UNION ALL SELECT 'Fill_' + @DimFactTableName) a
			LEFT OUTER JOIN sys.schemas s ON s.[name] = 'dwh' 
			LEFT OUTER JOIN sys.procedures p ON p.[name] = a.[name] AND p.[schema_id] = s.[schema_id]
		END
	END

GO
/****** Object:  StoredProcedure [setup].[FillDimFactIndex]    Script Date: 11.9.2017 10:30:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [setup].[FillDimFactIndex] AS
DECLARE
	@DimFactID int,
	@IndexName nvarchar(128),
	@UniqueIndex bit,
	@IndexColumn nvarchar(128),
	@IncludeColumn nvarchar(128),
	@FilterDefinition nvarchar(max),

	@DimFactIDOld int = -999,
	@IndexNameOld nvarchar(128) = '',
	@UniqueIndexOld bit = NULL,
	@FilterDefinitionOld nvarchar(max),
	@IndexColumnsList nvarchar(max),
	@IncludeColumnsList nvarchar(max)

TRUNCATE TABLE [setup].[DimFactIndex]

DECLARE IndexColumnCursor CURSOR READ_ONLY FOR
SELECT
	df.DimFactID,
	i.[name],
	i.is_unique,
	IndexColumnName = IIF(ic.is_included_column = 0, c.[name], ''),
	IncludeColumnName = IIF(ic.is_included_column = 1, c.[name], ''),
	FilterDefinition = ISNULL(i.filter_definition, '')

 FROM sys.indexes i
	INNER JOIN setup.DimFact df ON
		OBJECT_ID('dwh.' + df.[Name]) = i.object_id
	INNER JOIN sys.index_columns ic ON
		ic.object_id = i.object_id AND
		ic.index_id = i.index_id
	INNER JOIN sys.columns c ON
		c.object_id = i.object_id AND
	c.column_id = ic.column_id

WHERE i.[type] = 2 AND
	i.[is_disabled] = 0

ORDER BY 
	df.DimFactID, i.[name], ic.index_column_id

OPEN IndexColumnCursor 
FETCH NEXT FROM IndexColumnCursor INTO 	@DimFactID, @IndexName, @UniqueIndex, @IndexColumn, @IncludeColumn, @FilterDefinition

WHILE @@FETCH_STATUS = 0
BEGIN
	IF @DimFactIDOld <> @DimFactID OR @IndexName <> @IndexNameOld
	BEGIN
		IF @UniqueIndexOld IS NOT NULL
			INSERT INTO [setup].[DimFactIndex] ( [DimFactID], [IndexNameEnd], [UniqueIndex], [IndexColumnsList], [IncludeColumnsList], [FilterDefinition] )
			VALUES ( @DimFactIDOld, RIGHT(@IndexNameOld, 2), @UniqueIndexOld, @IndexColumnsList, @IncludeColumnsList, @FilterDefinitionOld)
		SET @DimFactIDOld = @DimFactID
		SET @IndexNameOld = @IndexName
		SET @UniqueIndexOld = @UniqueIndex
		SET @FilterDefinitionOld = @FilterDefinition
		SET @IndexColumnsList = ''
		SET @IncludeColumnsList = ''
	END
	IF @IndexColumn > ''
		SET @IndexColumnsList = @IndexColumnsList + IIF(@IndexColumnsList > '', ', ', '') + @IndexColumn
	IF @IncludeColumn > ''
		SET @IncludeColumnsList = @IncludeColumnsList + IIF(@IncludeColumnsList > '', ', ', '') + @IncludeColumn
	FETCH NEXT FROM IndexColumnCursor INTO 	@DimFactID, @IndexName, @UniqueIndex, @IndexColumn, @IncludeColumn, @FilterDefinition
END

CLOSE IndexColumnCursor
DEALLOCATE IndexColumnCursor

IF @UniqueIndexOld IS NOT NULL
	INSERT INTO [setup].[DimFactIndex] ( [DimFactID], [IndexNameEnd], [UniqueIndex], [IndexColumnsList], [IncludeColumnsList], [FilterDefinition] )
	VALUES ( @DimFactIDOld, RIGHT(@IndexNameOld, 2), @UniqueIndexOld, @IndexColumnsList, @IncludeColumnsList, @FilterDefinitionOld )


GO
/****** Object:  StoredProcedure [setup].[FillFactForeignKey]    Script Date: 11.9.2017 10:30:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [setup].[FillFactForeignKey] AS
TRUNCATE TABLE [setup].[FactForeignKey]
INSERT INTO [setup].[FactForeignKey]
	([DimFactID],
	[FKNameEnd],
	[FKColumnList],
	[RefTableSchema],
	[RefTableName],
	[RefColumnList]
	)

SELECT
	df.DimFactID 
	,CONSTRAINT_NAME_END = RIGHT(KCU1.CONSTRAINT_NAME, LEN(KCU1.CONSTRAINT_NAME) - LEN(KCU1.TABLE_NAME) - 4)
    ,KCU1.COLUMN_NAME AS FK_COLUMN_NAME 
	,KCU2.TABLE_SCHEMA AS REFERENCED_TABLE_SCHEMA
    ,KCU2.TABLE_NAME AS REFERENCED_TABLE_NAME 
    ,KCU2.COLUMN_NAME AS REFERENCED_COLUMN_NAME 
FROM
	INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS AS RC 
	INNER JOIN INFORMATION_SCHEMA.KEY_COLUMN_USAGE AS KCU1 
		ON KCU1.CONSTRAINT_CATALOG = RC.CONSTRAINT_CATALOG  
		AND KCU1.CONSTRAINT_SCHEMA = RC.CONSTRAINT_SCHEMA 
		AND KCU1.CONSTRAINT_NAME = RC.CONSTRAINT_NAME 
	INNER JOIN INFORMATION_SCHEMA.KEY_COLUMN_USAGE AS KCU2 
		ON KCU2.CONSTRAINT_CATALOG = RC.UNIQUE_CONSTRAINT_CATALOG  
		AND KCU2.CONSTRAINT_SCHEMA = RC.UNIQUE_CONSTRAINT_SCHEMA 
		AND KCU2.CONSTRAINT_NAME = RC.UNIQUE_CONSTRAINT_NAME 
		AND KCU2.ORDINAL_POSITION = KCU1.ORDINAL_POSITION
	INNER JOIN setup.DimFact df ON
		df.[Name] = KCU1.TABLE_NAME AND
		df.[Type] = 'Fact' AND
		KCU1.TABLE_SCHEMA = 'dwh'
ORDER BY 
	df.DimFactID, KCU1.CONSTRAINT_NAME

GO
/****** Object:  StoredProcedure [setup].[ChangeStageToNAV2009]    Script Date: 11.9.2017 10:30:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [setup].[ChangeStageToNAV2009] AS

UPDATE a SET
--SELECT
	TableNameSql = 'Country_Region'
FROM
	setup.DataSourceTable a
WHERE
	a.TableNameStage = 'Country_Region'

UPDATE a SET
--SELECT
	ColumnNameSql = 'Country_Region Code'
FROM
	setup.DataSourceColumn a
	INNER JOIN setup.DataSourceTable b ON
		b.DataSourceTableID = a.DataSourceTableID AND
		b.TableNameSql = 'Location'
WHERE
	a.ColumnNameStage = 'Country_Region Code'

UPDATE a SET
--SELECT
	ColumnNameSql = 'Country_Region Code'
FROM
	setup.DataSourceColumn a
	INNER JOIN setup.DataSourceTable b ON
		b.DataSourceTableID = a.DataSourceTableID AND
		b.TableNameSql = 'Customer'
WHERE
	a.ColumnNameStage = 'Country_Region Code'

UPDATE a SET
--SELECT
	ColumnNameSql = 'Country_Region Code'
FROM
	setup.DataSourceColumn a
	INNER JOIN setup.DataSourceTable b ON
		b.DataSourceTableID = a.DataSourceTableID AND
		b.TableNameSql = 'Vendor'
WHERE
	a.ColumnNameStage = 'Country_Region Code'

UPDATE a SET
--SELECT
	ColumnNameSql = 'Country_Region Code'
FROM
	setup.DataSourceColumn a
	INNER JOIN setup.DataSourceTable b ON
		b.DataSourceTableID = a.DataSourceTableID AND
		b.TableNameSql = 'Bank Account'
WHERE
	a.ColumnNameStage = 'Country_Region Code'

UPDATE a SET
--SELECT
	ColumnNameSql = 'Item Disc_ Group (Sales)'
FROM
	setup.DataSourceColumn a
	INNER JOIN setup.DataSourceTable b ON
		b.DataSourceTableID = a.DataSourceTableID AND
		b.TableNameSql = 'Item'
WHERE
	a.ColumnNameStage = 'Item Disc_ Group'


GO
/****** Object:  StoredProcedure [setup].[ChangeStageToNAV2013]    Script Date: 11.9.2017 10:30:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [setup].[ChangeStageToNAV2013] AS

EXEC dbo.DropObject '[stage].[Document Dimension]', 'T'
EXEC dbo.DropObject '[stage].[G_L Budget Dimension]', 'T'
EXEC dbo.DropObject '[stage].[Ledger Entry Dimension]', 'T'
EXEC dbo.DropObject '[stage].[Posted Document Dimension]', 'T'

UPDATE a SET
	Active = 0
FROM
	setup.DataSourceColumn a
	INNER JOIN setup.DataSourceTable b ON
		b.DataSourceTableID = a.DataSourceTableID AND
		b.TableNameSource IN ('Ledger Entry Dimension', 'Posted Document Dimension', 'Document Dimension', 'G/L Budget Dimension')
WHERE
	a.Active = 1

UPDATE a SET
	Active = 0
FROM
	setup.DataSourceColumn a
	INNER JOIN setup.DataSourceTable b ON
		b.DataSourceTableID = a.DataSourceTableID AND
		b.TableNameSource = ('Item')
WHERE
	a.ColumnNameSource = 'Reorder Cycle' AND
	a.Active = 1


UPDATE a SET
	Active = 0
FROM
	setup.DataSourceColumn a
	INNER JOIN setup.DataSourceTable b ON
		b.DataSourceTableID = a.DataSourceTableID AND
		b.TableNameSource = ('Analysis View')
WHERE
	a.ColumnNameSource = 'G_L Account Filter' AND
	a.Active = 1

UPDATE a SET
	ColumnType = 'nvarchar(50)'
FROM
	setup.DataSourceColumn a
	INNER JOIN setup.DataSourceTable b ON
		b.DataSourceTableID = a.DataSourceTableID AND
		b.TableNameSource = ('Fixed Asset')
WHERE
	a.ColumnNameSource = 'Description' AND
	a.Active = 1

INSERT setup.DataSourceColumn (
	DataSourceTableID, 
	ColumnID, 
	ColumnNameSource, 
	ColumnNameSql, 
	ColumnNameStage, 
	ColumnType, 
	ExistsInDataSource, 
	IsPartOfPrimaryKey, 
	Active, 
	LongerTextField
)
SELECT
	DataSourceTableID, 
	ColumnID = NULL, 
	ColumnNameSource = 'Dimension Set ID',
	ColumnNameSql = 'Dimension Set ID', 
	ColumnNameStage = 'Dimension Set ID', 
	ColumnType = 'int', 
	ExistsInDataSource = 1, 
	IsPartOfPrimaryKey = 0, 
	Active = 1, 
	LongerTextField = 0
FROM
	setup.DataSourceTable a
WHERE
	TableID IN (
		17,
		21,
		25,
		32,
		36,
		37,
		38,
		39,
		96,
		110,
		111,
		112,
		113,
		114,
		115,
		120,
		121,
		122,
		123,
		124,
		125,
		271,
		5405,
		5406,
		5407,
		5601,
		5625,
		5802,
		5832,
		6650,
		6651,
		6660,
		6661,
		7134
	)

INSERT [setup].[DataSourceTable] (
	DataSourceID, 
	TableID, 
	TableNameSource, 
	TableNameSql, 
	TableNameStage, 
	TableType, 
	ExistsInDataSource
)
SELECT
	DataSourceID = a.DataSourceID, 
	TableID = 480, 
	TableNameSource = 'Dimension Set Entry', 
	TableNameSql = 'Dimension Set Entry', 
	TableNameStage = 'Dimension Set Entry', 
	TableType = 0, 
	ExistsInDataSource = 1
FROM
	setup.DataSource a


INSERT setup.DataSourceColumn (
	DataSourceTableID, 
	ColumnID, 
	ColumnNameSource, 
	ColumnNameSql, 
	ColumnNameStage, 
	ColumnType, 
	ExistsInDataSource, 
	IsPartOfPrimaryKey, 
	Active, 
	LongerTextField
)
SELECT
	DataSourceTableID, 
	ColumnID = NULL, 
	ColumnNameSource = b.ColumnName,
	ColumnNameSql = b.ColumnName, 
	ColumnNameStage = b.ColumnName, 
	ColumnType = b.ColumnType, 
	ExistsInDataSource = 1, 
	IsPartOfPrimaryKey = 0, 
	Active = 1, 
	LongerTextField = 0
FROM
	setup.DataSourceTable a
	CROSS JOIN (
		SELECT
			ColumnType = 'nvarchar(20)',
			ColumnName = 'Dimension Code'
		UNION ALL
		SELECT
			ColumnType = 'int',
			ColumnName = 'Dimension Set ID'
		UNION ALL
		SELECT
			ColumnType = 'nvarchar(20)',
			ColumnName = 'Dimension Value Code'
		UNION ALL
		SELECT
			ColumnType = 'int',
			ColumnName = 'Dimension Value ID'
	) b
WHERE
	a.TableID = 480



GO
/****** Object:  StoredProcedure [setup].[ChangeStageToNAV2017]    Script Date: 11.9.2017 10:30:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [setup].[ChangeStageToNAV2017] AS

UPDATE a SET
	a.Active = 0
FROM
	setup.DataSourceColumn a
	INNER JOIN setup.DataSourceTable b ON
		b.DataSourceTableID = a.DataSourceTableID
WHERE
	(
		b.TableNameSource = 'Item' AND
		a.ColumnNameSource = 'Picture'
	)
	--OR()

GO
/****** Object:  StoredProcedure [setup].[CheckDWHFieldLength]    Script Date: 11.9.2017 10:30:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [setup].[CheckDWHFieldLength]
	@TableNameList nvarchar(max) = NULL
	AS
	DECLARE
		@First int,
		@Object_id int,
		@TableName nvarchar(128),
		@ViewSchema nvarchar(128),
		@ViewName nvarchar(128),
		@ColumnName nvarchar(128),
		@TableDataType nvarchar(128),
		@TableCharacterMaximumLength int,
		@TableNumericPrecision int,
		@TableNumericScale int,
		@SourceDataType nvarchar(128),
		@SourceCharacterMaximumLength int,
		@SourceNumericPrecision int,
		@SourceNumericScale int,
		@ExecString nvarchar(max)

	SET @TableNameList = [help].[RemoveWhiteCharactersFromList] (ISNULL(@TableNameList, ''))
	SET @TableNameList = '''' + REPLACE(@TableNameList, ',', ''',''') + ''''

	SET @ExecString = N'
	DECLARE TableCursor CURSOR READ_ONLY FOR
		WITH
		StageView (name) AS
			(SELECT v.name
			FROM sys.views v
			INNER JOIN sys.schemas s ON
				s.schema_id = v.schema_id AND
				s.name = ''stage''
			),
		 DwhView (name) AS
			(SELECT v.name
			FROM sys.views v
			INNER JOIN sys.schemas s ON
				s.schema_id = v.schema_id AND
				s.name = ''dwh''
			)
		SELECT
			t.object_id,
			TableName = t.name,
			ViewSchema = IIF(dv.name IS NULL, IIF(sv.name IS NULL, NULL, ''stage''), ''dwh''),
			ViewName = ISNULL(dv.name, sv.name)
		FROM 
			sys.tables t
			INNER JOIN sys.schemas s ON
				s.schema_id = t.schema_id AND
				s.name = ''dwh''
			LEFT OUTER JOIN	StageView sv ON
				sv.name = ''v_'' + t.name
			LEFT OUTER JOIN	DwhView dv ON
				dv.name = ''v_'' + t.name'
		+ IIF(@TableNameList = '''''', '', N'
		WHERE t.name IN (' + @TableNameList + ')') + N'
		ORDER BY TableName'
	--PRINT @ExecString
	 EXEC sp_executesql	@stmt = @ExecString	--DECLARE FactTablesCursor
	OPEN TableCursor
	FETCH NEXT FROM TableCursor INTO @object_id, @TableName, @ViewSchema, @ViewName
	SET @First = 1
	WHILE @@FETCH_STATUS = 0 
	BEGIN
		IF @ViewName IS NULL
		BEGIN
			IF @First = 1
			BEGIN
				PRINT '
NON TESTED Table(s):'
				SET @First = 0
			END
			PRINT '    [dwh].[' + @TableName + ']'
		END
		FETCH NEXT FROM TableCursor INTO @object_id, @TableName, @ViewSchema, @ViewName
	END
	CLOSE TableCursor

	OPEN TableCursor
	FETCH NEXT FROM TableCursor INTO @object_id, @TableName, @ViewSchema, @ViewName
	SET @First = 1
	WHILE @@FETCH_STATUS = 0 
	BEGIN
		IF @ViewName IS NOT NULL
		BEGIN
			IF @First = 1
			BEGIN
				PRINT '
TESTED Table(s):'
				SET @First = 0
			END
						PRINT '    [' + @ViewSchema + '].[' + @ViewName + ']  ->  [dwh].[' + @TableName + ']'
			DECLARE ColumnCursor CURSOR READ_ONLY FOR
				SELECT
					tc.COLUMN_NAME,
					tc.DATA_TYPE,
					tc.CHARACTER_MAXIMUM_LENGTH,
					tc.NUMERIC_PRECISION,
					tc.NUMERIC_SCALE,
					DATA_TYPE = ISNULL(vc.DATA_TYPE, vca.DATA_TYPE),
					CHARACTER_MAXIMUM_LENGTH = CASE WHEN vc.DATA_TYPE IS NULL THEN vca.CHARACTER_MAXIMUM_LENGTH ELSE vc.CHARACTER_MAXIMUM_LENGTH END,
					NUMERIC_PRECISION = CASE WHEN vc.DATA_TYPE IS NULL THEN vca.NUMERIC_PRECISION ELSE vc.NUMERIC_PRECISION END,
					NUMERIC_SCALE = CASE WHEN vc.DATA_TYPE IS NULL THEN vca.NUMERIC_SCALE ELSE vc.NUMERIC_SCALE END
				FROM
					INFORMATION_SCHEMA.COLUMNS tc
					INNER JOIN sys.columns sc ON
						sc.object_id = @Object_id AND
						sc.name = tc.COLUMN_NAME AND
						sc.is_identity = 0	AND			-- column with IDENTITY not tested 
						sc.name <> 'DateTimeCreated'	-- DateTimeCreated column not tested
					LEFT OUTER JOIN INFORMATION_SCHEMA.COLUMNS vc ON
						vc.TABLE_SCHEMA = @ViewSchema AND
						vc.TABLE_NAME = @ViewName AND
						vc.COLUMN_NAME = tc.COLUMN_NAME
					LEFT OUTER JOIN INFORMATION_SCHEMA.COLUMNS vca ON
						vca.TABLE_SCHEMA = @ViewSchema AND
						vca.TABLE_NAME = @ViewName AND
						vca.COLUMN_NAME + 'ACY' = tc.COLUMN_NAME
				WHERE
					tc.TABLE_SCHEMA = 'dwh' AND
					tc.TABLE_NAME = @TableName
				ORDER BY tc.ORDINAL_POSITION

			OPEN ColumnCursor
			FETCH NEXT FROM ColumnCursor INTO @ColumnName, @TableDataType, @TableCharacterMaximumLength, @TableNumericPrecision, @TableNumericScale, @SourceDataType, @SourceCharacterMaximumLength, @SourceNumericPrecision, @SourceNumericScale
			WHILE @@FETCH_STATUS = 0 
			BEGIN
				IF @SourceDataType IS NULL
					PRINT  '        [' + @ColumnName + ']  NOT TESTED'
				ELSE IF @TableCharacterMaximumLength < @SourceCharacterMaximumLength
					PRINT '        [' + @ColumnName + ']  '	  +	@SourceDataType + '(' + CAST(@SourceCharacterMaximumLength AS nvarchar(10))
													+ ') -> ' +	@TableDataType + '(' + CAST(@TableCharacterMaximumLength AS nvarchar(10)) + ')'
				ELSE IF @TableNumericPrecision < @SourceNumericPrecision OR @TableNumericScale < @SourceNumericScale
					PRINT '        [' + @ColumnName + ']  '   +	@SourceDataType + IIF(CHARINDEX('int', @SourceDataType) > 0, '', '(' + CAST(@SourceNumericPrecision AS nvarchar(10)) + ',' + CAST(@SourceNumericScale AS nvarchar(10)) + ')')
													+ ' -> '  +	@TableDataType + IIF(CHARINDEX('int', @TableDataType) > 0, '', '(' + CAST(@TableNumericPrecision AS nvarchar(10)) + ',' + CAST(@TableNumericScale AS nvarchar(10)) + ')')
				FETCH NEXT FROM ColumnCursor INTO @ColumnName, @TableDataType, @TableCharacterMaximumLength, @TableNumericPrecision, @TableNumericScale, @SourceDataType, @SourceCharacterMaximumLength, @SourceNumericPrecision, @SourceNumericScale
			END
			CLOSE ColumnCursor
			DEALLOCATE ColumnCursor
		END

		FETCH NEXT FROM TableCursor INTO @object_id, @TableName, @ViewSchema, @ViewName
	END

	CLOSE TableCursor
	DEALLOCATE TableCursor


GO
/****** Object:  StoredProcedure [setup].[CheckLengthFieldOLAP]    Script Date: 11.9.2017 10:30:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [setup].[CheckLengthFieldOLAP] 
@CubeName nvarchar(max) = NULL
AS
	DECLARE
	@CubeID int,
	@CubeNameList nvarchar(max),
	@ExecString nvarchar(max),
	@StoredProcedureName nvarchar(max),
	@LogStartDate datetime,
	@LogEndDate datetime,
	@RowCount int

	IF OBJECT_ID('tempdb.dbo.#XMLFile', 'U') IS NULL
		CREATE TABLE #XMLFile(
			XMLData XML
		)

	IF @CubeName IS NOT NULL
	SET @ExecString = @ExecString + ' WHERE CubeName IN (' + '''' + @CubeName + '''' +')'

	EXEC sp_executesql @ExecString


	--Cube Cursor

	SET @ExecString = N'
	DECLARE CubeCursor CURSOR FOR
		SELECT 
			CubeID,
			CubeName
		FROM 
			setup.[Cube]
		WHERE 
			ManualRelationSetup = 0'

	IF @CubeName IS NOT NULL
	SET @ExecString = @ExecString + ' AND CubeName IN (' + '''' + @CubeName + '''' +')'

	EXEC sp_executesql @ExecString

	SET @ExecString = N''

	OPEN CubeCursor
	SET NOCOUNT ON

	-- Loop through XML definition of cubes
	FETCH NEXT FROM CubeCursor INTO @CubeID, @CubeNameList

	WHILE @@FETCH_STATUS = 0 
	BEGIN
		SET @ExecString = N'
		INSERT INTO #XMLFile
		SELECT XMLData
		FROM setup.CubeDataXML
		WHERE CubeName =' + '''' +  @CubeNameList + ''''

		EXEC sp_executesql @ExecString

			SELECT DISTINCT
			@CubeNameList AS CubeName,
			N1.C.value('(./*:CubeDimensionID[1])','nvarchar(max)') as CubeDimension,
			N2.C.value('(./*:AttributeID[1])','nvarchar(max)') as CubeAtrribute,
			N3.C.value('(./*:DataType[1])','nvarchar(max)') as DataType,
			N3.C.value('(./*:DataSize[1])','nvarchar(max)') as DataSize,
			REPLACE(N4.C.value('(./*:TableID[1])','nvarchar(max)'),'dwh_', '') as TableDWH,
			N4.C.value('(./*:ColumnID[1])','nvarchar(max)') as TableColumnDWH,
			a.DATA_TYPE,
			a.CHARACTER_MAXIMUM_LENGTH	
			FROM #XMLFile
			CROSS APPLY XMLData.nodes('/*:Cube/*:MeasureGroups/*:MeasureGroup/*:Dimensions/*:Dimension') N1(C)
			CROSS APPLY N1.C.nodes('./*:Attributes/*:Attribute') N2(C)
			CROSS APPLY N2.C.nodes('./*:KeyColumns/*:KeyColumn') N3(C)
			CROSS APPLY N3.C.nodes('./*:Source') N4(C)
			LEFT OUTER JOIN INFORMATION_SCHEMA.COLUMNS a
			ON a.TABLE_NAME=REPLACE(N4.C.value('(./*:TableID[1])','nvarchar(max)'),'dwh_', '') AND
			a.COLUMN_NAME=N4.C.value('(./*:ColumnID[1])','nvarchar(max)') 
			WHERE N3.C.value('(./*:DataType[1])','nvarchar(max)') = 'WChar' AND
			a.DATA_TYPE LIKE '%varchar%' AND
			N3.C.value('(./*:DataSize[1])','nvarchar(max)') < a.CHARACTER_MAXIMUM_LENGTH

		DELETE  FROM #XMLFile

		FETCH NEXT FROM CubeCursor INTO @CubeID, @CubeNameList
	END
	CLOSE CubeCursor
	DEALLOCATE CubeCursor

	IF OBJECT_ID('tempdb.dbo.#XMLFile', 'U') IS NOT NULL
		DROP TABLE #XMLFile


	SET @RowCount = @@ROWCOUNT
	SET @StoredProcedureName = OBJECT_NAME(@@PROCID)
	SET @LogEndDate = GETDATE()
	EXEC setup.InsertLog @StoredProcedureName, @LogStartDate, @LogEndDate, @RowCount, 0, 'Success'
GO
/****** Object:  StoredProcedure [setup].[IncrementalUpdateReset]    Script Date: 11.9.2017 10:30:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [setup].[IncrementalUpdateReset] AS
	DECLARE
		@StoredProcedureName nvarchar(max),
		@LogStartDate datetime,
		@LogEndDate datetime,
		@RowCount int
	SET @LogStartDate = GETDATE()

	UPDATE [setup].[Instance] SET [IncrementalUpdate] = 1, [SuspendedIncrementalUpdate] = 0 WHERE [SuspendedIncrementalUpdate] = 1
	UPDATE [setup].[Instance] SET [IncrementalUpdateDWH] = 1, [SuspendedIncrementalUpdateDWH] = 0 WHERE [SuspendedIncrementalUpdateDWH] = 1

	SET @RowCount = 0
	SET @StoredProcedureName = OBJECT_NAME(@@PROCID)
	SET @LogEndDate = GETDATE()
	EXEC setup.InsertLog @StoredProcedureName, @LogStartDate, @LogEndDate, @RowCount, 0, 'Success' --, @GroupOfFilling


GO
/****** Object:  StoredProcedure [setup].[IncrementalUpdateSuspend]    Script Date: 11.9.2017 10:30:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [setup].[IncrementalUpdateSuspend] AS
	DECLARE
		@StoredProcedureName nvarchar(max),
		@LogStartDate datetime,
		@LogEndDate datetime,
		@RowCount int
	SET @LogStartDate = GETDATE()

	UPDATE [setup].[Instance] SET [SuspendedIncrementalUpdate] = 1, [IncrementalUpdate] = 0 WHERE [IncrementalUpdate] = 1
	UPDATE [setup].[Instance] SET [SuspendedIncrementalUpdateDWH] = 1, [IncrementalUpdateDWH] = 0 WHERE [IncrementalUpdateDWH] = 1

	SET @RowCount = 0
	SET @StoredProcedureName = OBJECT_NAME(@@PROCID)
	SET @LogEndDate = GETDATE()
	EXEC setup.InsertLog @StoredProcedureName, @LogStartDate, @LogEndDate, @RowCount, 0, 'Success' --, @GroupOfFilling


GO
/****** Object:  StoredProcedure [setup].[Init_dim_All]    Script Date: 11.9.2017 10:30:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE PROCEDURE [setup].[Init_dim_All] AS
	DECLARE
		@DimName nvarchar(128),
		@ExecString nvarchar(max)

	DECLARE
		DimTablesCursor CURSOR READ_ONLY FOR
			SELECT
				DimName = SUBSTRING(t.TABLE_NAME, 5, 128) 
			FROM INFORMATION_SCHEMA.TABLES t
			INNER JOIN INFORMATION_SCHEMA.COLUMNS ci ON
				ci.TABLE_SCHEMA = t.TABLE_SCHEMA AND ci.TABLE_NAME = t.TABLE_NAME AND ci.COLUMN_NAME = SUBSTRING(t.TABLE_NAME, 5, 128) + 'ID'
			WHERE
				t.TABLE_SCHEMA = 'dwh' AND LEFT(t.TABLE_NAME, 4) = 'dim_' AND
				--t.TABLE_NAME NOT IN ('dim_Company', 'dim_DelayedDays', 'dim_DetailedEntryType', 'dim_DueAnalysis', 'dim_PlannedDueAnalysis')
				t.TABLE_NAME NOT IN ('dim_Company', 'dim_DelayedDays', 'dim_DetailedEntryType')
			ORDER BY t.TABLE_NAME
			
	OPEN DimTablesCursor
	FETCH NEXT FROM DimTablesCursor INTO @DimName
	WHILE @@FETCH_STATUS = 0
	BEGIN
			SET @ExecString = N'EXEC setup.InitDimension ''dim_' + @DimName + ''', ''dwh'''
			--PRINT @ExecString
			EXEC sp_executesql @stmt = @ExecString
		FETCH NEXT FROM DimTablesCursor INTO @DimName
	END
	CLOSE DimTablesCursor
	DEALLOCATE DimTablesCursor

	UPDATE dwh.dim_DueAnalysis SET
		[DueDays] = 99999
	WHERE [DueAnalysisID] = 0

	UPDATE dwh.dim_PlannedDueAnalysis SET
		[DueDays] = 99999
	WHERE [PlannedDueAnalysisID] = 0

	UPDATE dwh.dim_ServiceItem SET
		[InstallationDateCode] = NULL,
		[LastServiceDateCode] = NULL
	WHERE [ServiceItemID] = 0
	
	UPDATE dwh.dim_ServiceOrder	SET
		[OrderDateCode] = NULL,
		[PostingDateCode] = NULL,
		[StartingDateCode] = NULL,
		[FinishingDateCode] = NULL
	WHERE [ServiceOrderID] = 0




GO
/****** Object:  StoredProcedure [setup].[InitDatasourceCompany]    Script Date: 11.9.2017 10:30:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [setup].[InitDatasourceCompany] AS

TRUNCATE TABLE setup.Dimension

--EXEC setup.CreateStage 2000000006
--EXEC setup.LoadStage 2000000006

--INSERT setup.Company (
--	DataSourceID,
--	CompanyCode,
--	CompanyName,
--	CountryCode,
--	CountryName,
--	LocalCurrency,
--	AdditionalCurrency
--)
--SELECT
	
--FROM
--	stage.Company a

EXEC stage.CreateStage 348
EXEC stage.LoadStage 348

INSERT setup.Dimension(
	CompanyID,
	DimensionID,
	DimensionCode,
	DimensionType
)
SELECT
	a.CompanyID,
	DimensionID = NULL,
	a.Code,
	DimensionType = NULL
FROM
	stage.Dimension a


GO
/****** Object:  StoredProcedure [setup].[InitDimension]    Script Date: 11.9.2017 10:30:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [setup].[InitDimension]
	@TableName nvarchar(128),
	@Schema nvarchar(128)
	--@Identity tinyint = 1	--deleted 2016/01/09
AS
	DECLARE
		@ColumnName nvarchar(128),
		@DataType nvarchar(128),
		@OrdinalPosition int,
		@StringInsertInto nvarchar(max),
		@StringInsertValue nvarchar(max),
		@ColumnValue nvarchar(128),
		@ObjectID int,
		@Identity int,
		@ExecString nvarchar(max)
	
	SET @ObjectID =
		(SELECT t.object_id
		FROM
			sys.tables t
			INNER JOIN sys.schemas s ON
				s.schema_id = t.schema_id AND
				s.name = @Schema
		WHERE t.name = @TableName
		)
	IF @ObjectID IS NULL
		PRINT 'Table [' + @Schema + '].[' + @TableName + ']  not found'
	ELSE
	BEGIN
	SET @Identity = (SELECT COUNT(*) FROM sys.columns c WHERE c.object_id = @ObjectID AND c.is_identity = 1)
	DECLARE TableCursor CURSOR FOR
		SELECT
			a.COLUMN_NAME,
			a.DATA_TYPE,
			a.ORDINAL_POSITION
		FROM
			INFORMATION_SCHEMA.COLUMNS a
		WHERE
			a.TABLE_NAME = @TableName AND
			a.TABLE_SCHEMA = @Schema
		ORDER BY
			a.ORDINAL_POSITION
	
	OPEN TableCursor
	FETCH NEXT FROM TableCursor INTO @ColumnName, @DataType, @OrdinalPosition
	
	SET @StringInsertInto = N'INSERT INTO ' + @Schema + N'.[' + @TableName + N'] ('
	SET @StringInsertValue = N'VALUES ('
	
	WHILE @@FETCH_STATUS = 0
	BEGIN
		SET @StringInsertInto = @StringInsertInto + QUOTENAME(@ColumnName) + N','
		SET @ColumnValue = (SELECT ColumnValue FROM setup.v_DefaultDimensionValue WHERE ColumnType = @DataType)
		
		IF @OrdinalPosition = 1 
			SET @StringInsertValue = @StringInsertValue + N' 0,'
		ELSE IF @ColumnName = N'CompanyID'
			SET @StringInsertValue = @StringInsertValue + N' 0,'
		ELSE IF @ColumnName = N'BasicSettingID'
			SET @StringInsertValue = @StringInsertValue + N' 0,'
		ELSE
			BEGIN
				IF @DataType IN ('decimal', 'numeric', 'int', 'smallint', 'tinyint')
					SET @StringInsertValue = @StringInsertValue + N' ' + @ColumnValue + N','
				ELSE
					SET @StringInsertValue = @StringInsertValue + N' ''' + @ColumnValue + N''','
			END
		
		FETCH NEXT FROM TableCursor INTO @ColumnName, @DataType, @OrdinalPosition
	END
	
	CLOSE TableCursor
	DEALLOCATE TableCursor
	
	SET @StringInsertInto = SUBSTRING(@StringInsertInto, 1, LEN(@StringInsertInto) - 1) + ')'
	SET @StringInsertValue = SUBSTRING(@StringInsertValue, 1, LEN(@StringInsertValue) - 1) + ')'
	SET @ExecString = N''
	
	IF @Identity > 0 
		SET @ExecString = N'SET IDENTITY_INSERT ' + @Schema + N'.[' + @TableName + N'] ON '
	
	SET @ExecString = @ExecString + @StringInsertInto + N' '
	SET @ExecString = @ExecString + @StringInsertValue + N' '
	
	IF @Identity > 0
		SET @ExecString = @ExecString + N'SET IDENTITY_INSERT ' + @Schema + N'.[' + @TableName + N'] OFF'
	
	--PRINT @ExecString
	EXEC sp_executesql
		@stmt = @ExecString 

	END


GO
/****** Object:  StoredProcedure [setup].[InitDimFact_NAVTableID_OptionColumnID]    Script Date: 11.9.2017 10:30:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
ALTER TABLE [setup].[DimFact] ADD
	[NAVTableID] int NULL,
	[OptionColumnID] int NULL
GO
*/

CREATE PROCEDURE [setup].[InitDimFact_NAVTableID_OptionColumnID]
AS

UPDATE [setup].[DimFact] SET [NAVTableID] = 85, [OptionColumnID] = NULL WHERE [Type] = 'Dimension' AND [Name] = 'dim_AccountSchedule'
UPDATE [setup].[DimFact] SET [NAVTableID] = 0, [OptionColumnID] = 5 WHERE [Type] = 'Dimension' AND [Name] = 'dim_AfterLastConsumption'
UPDATE [setup].[DimFact] SET [NAVTableID] = 0, [OptionColumnID] = 4 WHERE [Type] = 'Dimension' AND [Name] = 'dim_AfterLastSale'
UPDATE [setup].[DimFact] SET [NAVTableID] = 270, [OptionColumnID] = NULL WHERE [Type] = 'Dimension' AND [Name] = 'dim_BankAccount'
UPDATE [setup].[DimFact] SET [NAVTableID] = NULL, [OptionColumnID] = NULL WHERE [Type] = 'Dimension' AND [Name] = 'dim_Batch'
UPDATE [setup].[DimFact] SET [NAVTableID] = 5071, [OptionColumnID] = NULL WHERE [Type] = 'Dimension' AND [Name] = 'dim_Campaign'
UPDATE [setup].[DimFact] SET [NAVTableID] = 5073, [OptionColumnID] = NULL WHERE [Type] = 'Dimension' AND [Name] = 'dim_CampaignStatus'
UPDATE [setup].[DimFact] SET [NAVTableID] = NULL, [OptionColumnID] = NULL WHERE [Type] = 'Dimension' AND [Name] = 'dim_CFSource'
UPDATE [setup].[DimFact] SET [NAVTableID] = NULL, [OptionColumnID] = NULL WHERE [Type] = 'Dimension' AND [Name] = 'dim_Company'
UPDATE [setup].[DimFact] SET [NAVTableID] = 5050, [OptionColumnID] = NULL WHERE [Type] = 'Dimension' AND [Name] = 'dim_Contact'
UPDATE [setup].[DimFact] SET [NAVTableID] = 4, [OptionColumnID] = NULL WHERE [Type] = 'Dimension' AND [Name] = 'dim_Currency'
UPDATE [setup].[DimFact] SET [NAVTableID] = 18, [OptionColumnID] = NULL WHERE [Type] = 'Dimension' AND [Name] = 'dim_Customer'
UPDATE [setup].[DimFact] SET [NAVTableID] = 92, [OptionColumnID] = NULL WHERE [Type] = 'Dimension' AND [Name] = 'dim_CustomerPostingGroup'
UPDATE [setup].[DimFact] SET [NAVTableID] = NULL, [OptionColumnID] = NULL WHERE [Type] = 'Dimension' AND [Name] = 'dim_Date'
UPDATE [setup].[DimFact] SET [NAVTableID] = 111, [OptionColumnID] = 1 WHERE [Type] = 'Dimension' AND [Name] = 'dim_DelayedDays'
UPDATE [setup].[DimFact] SET [NAVTableID] = 5611, [OptionColumnID] = NULL WHERE [Type] = 'Dimension' AND [Name] = 'dim_DepreciationBook'
UPDATE [setup].[DimFact] SET [NAVTableID] = 379, [OptionColumnID] = 3 WHERE [Type] = 'Dimension' AND [Name] = 'dim_DetailedEntryType'
UPDATE [setup].[DimFact] SET [NAVTableID] = 349, [OptionColumnID] = NULL WHERE [Type] = 'Dimension' AND [Name] = 'dim_Dimension1'
UPDATE [setup].[DimFact] SET [NAVTableID] = 349, [OptionColumnID] = NULL WHERE [Type] = 'Dimension' AND [Name] = 'dim_Dimension2'
UPDATE [setup].[DimFact] SET [NAVTableID] = 349, [OptionColumnID] = NULL WHERE [Type] = 'Dimension' AND [Name] = 'dim_Dimension3'
UPDATE [setup].[DimFact] SET [NAVTableID] = 349, [OptionColumnID] = NULL WHERE [Type] = 'Dimension' AND [Name] = 'dim_Dimension4'
UPDATE [setup].[DimFact] SET [NAVTableID] = 349, [OptionColumnID] = NULL WHERE [Type] = 'Dimension' AND [Name] = 'dim_Dimension5'
UPDATE [setup].[DimFact] SET [NAVTableID] = 349, [OptionColumnID] = NULL WHERE [Type] = 'Dimension' AND [Name] = 'dim_Dimension6'
UPDATE [setup].[DimFact] SET [NAVTableID] = 349, [OptionColumnID] = NULL WHERE [Type] = 'Dimension' AND [Name] = 'dim_Dimension7'
UPDATE [setup].[DimFact] SET [NAVTableID] = 349, [OptionColumnID] = NULL WHERE [Type] = 'Dimension' AND [Name] = 'dim_Dimension8'
UPDATE [setup].[DimFact] SET [NAVTableID] = 271, [OptionColumnID] = NULL WHERE [Type] = 'Dimension' AND [Name] = 'dim_DocumentBankAccount'
UPDATE [setup].[DimFact] SET [NAVTableID] = 5601, [OptionColumnID] = NULL WHERE [Type] = 'Dimension' AND [Name] = 'dim_DocumentFA'
UPDATE [setup].[DimFact] SET [NAVTableID] = 17, [OptionColumnID] = NULL WHERE [Type] = 'Dimension' AND [Name] = 'dim_DocumentGL'
UPDATE [setup].[DimFact] SET [NAVTableID] = 32, [OptionColumnID] = NULL WHERE [Type] = 'Dimension' AND [Name] = 'dim_DocumentInventory'
UPDATE [setup].[DimFact] SET [NAVTableID] = 5625, [OptionColumnID] = NULL WHERE [Type] = 'Dimension' AND [Name] = 'dim_DocumentMaintenance'
UPDATE [setup].[DimFact] SET [NAVTableID] = 36, [OptionColumnID] = NULL WHERE [Type] = 'Dimension' AND [Name] = 'dim_DocumentOrder'
UPDATE [setup].[DimFact] SET [NAVTableID] = 25, [OptionColumnID] = NULL WHERE [Type] = 'Dimension' AND [Name] = 'dim_DocumentPayables'
UPDATE [setup].[DimFact] SET [NAVTableID] = 120, [OptionColumnID] = NULL WHERE [Type] = 'Dimension' AND [Name] = 'dim_DocumentPurchase'
UPDATE [setup].[DimFact] SET [NAVTableID] = 38, [OptionColumnID] = NULL WHERE [Type] = 'Dimension' AND [Name] = 'dim_DocumentPurchaseOrder'
UPDATE [setup].[DimFact] SET [NAVTableID] = 21, [OptionColumnID] = NULL WHERE [Type] = 'Dimension' AND [Name] = 'dim_DocumentReceivables'
UPDATE [setup].[DimFact] SET [NAVTableID] = 110, [OptionColumnID] = NULL WHERE [Type] = 'Dimension' AND [Name] = 'dim_DocumentSales'
UPDATE [setup].[DimFact] SET [NAVTableID] = 5907, [OptionColumnID] = NULL WHERE [Type] = 'Dimension' AND [Name] = 'dim_DocumentService'
UPDATE [setup].[DimFact] SET [NAVTableID] = 0, [OptionColumnID] = 1 WHERE [Type] = 'Dimension' AND [Name] = 'dim_DueAnalysis'
UPDATE [setup].[DimFact] SET [NAVTableID] = 5200, [OptionColumnID] = NULL WHERE [Type] = 'Dimension' AND [Name] = 'dim_Employee'
UPDATE [setup].[DimFact] SET [NAVTableID] = 5601, [OptionColumnID] = 12 WHERE [Type] = 'Dimension' AND [Name] = 'dim_FAPostingCategory'
UPDATE [setup].[DimFact] SET [NAVTableID] = 5601, [OptionColumnID] = 13 WHERE [Type] = 'Dimension' AND [Name] = 'dim_FAPostingType'
UPDATE [setup].[DimFact] SET [NAVTableID] = 5915, [OptionColumnID] = NULL WHERE [Type] = 'Dimension' AND [Name] = 'dim_Fault'
UPDATE [setup].[DimFact] SET [NAVTableID] = 5917, [OptionColumnID] = NULL WHERE [Type] = 'Dimension' AND [Name] = 'dim_FaultReason'
UPDATE [setup].[DimFact] SET [NAVTableID] = 5600, [OptionColumnID] = NULL WHERE [Type] = 'Dimension' AND [Name] = 'dim_FixedAsset'
UPDATE [setup].[DimFact] SET [NAVTableID] = 250, [OptionColumnID] = NULL WHERE [Type] = 'Dimension' AND [Name] = 'dim_GenBusinessPostingGroup'
UPDATE [setup].[DimFact] SET [NAVTableID] = 251, [OptionColumnID] = NULL WHERE [Type] = 'Dimension' AND [Name] = 'dim_GenProductPostingGroup'
UPDATE [setup].[DimFact] SET [NAVTableID] = 15, [OptionColumnID] = NULL WHERE [Type] = 'Dimension' AND [Name] = 'dim_GLAccount'
UPDATE [setup].[DimFact] SET [NAVTableID] = 95, [OptionColumnID] = NULL WHERE [Type] = 'Dimension' AND [Name] = 'dim_GLBudgetName'
UPDATE [setup].[DimFact] SET [NAVTableID] = NULL, [OptionColumnID] = NULL WHERE [Type] = 'Dimension' AND [Name] = 'dim_GroupOfFilling'
UPDATE [setup].[DimFact] SET [NAVTableID] = 5057, [OptionColumnID] = NULL WHERE [Type] = 'Dimension' AND [Name] = 'dim_IndustryGroup'
UPDATE [setup].[DimFact] SET [NAVTableID] = 5064, [OptionColumnID] = NULL WHERE [Type] = 'Dimension' AND [Name] = 'dim_InteractionTemplate'
UPDATE [setup].[DimFact] SET [NAVTableID] = 94, [OptionColumnID] = NULL WHERE [Type] = 'Dimension' AND [Name] = 'dim_InventoryPostingGroup'
UPDATE [setup].[DimFact] SET [NAVTableID] = 27, [OptionColumnID] = NULL WHERE [Type] = 'Dimension' AND [Name] = 'dim_Item'
UPDATE [setup].[DimFact] SET [NAVTableID] = 5800, [OptionColumnID] = NULL WHERE [Type] = 'Dimension' AND [Name] = 'dim_ItemCharge'
UPDATE [setup].[DimFact] SET [NAVTableID] = 32, [OptionColumnID] = 4 WHERE [Type] = 'Dimension' AND [Name] = 'dim_ItemLedgerEntryType'
UPDATE [setup].[DimFact] SET [NAVTableID] = 167, [OptionColumnID] = NULL WHERE [Type] = 'Dimension' AND [Name] = 'dim_Job'
UPDATE [setup].[DimFact] SET [NAVTableID] = 14, [OptionColumnID] = NULL WHERE [Type] = 'Dimension' AND [Name] = 'dim_Location'
UPDATE [setup].[DimFact] SET [NAVTableID] = 99000758, [OptionColumnID] = NULL WHERE [Type] = 'Dimension' AND [Name] = 'dim_MachineCenter'
UPDATE [setup].[DimFact] SET [NAVTableID] = 5055, [OptionColumnID] = NULL WHERE [Type] = 'Dimension' AND [Name] = 'dim_MailingGroup'
UPDATE [setup].[DimFact] SET [NAVTableID] = 5626, [OptionColumnID] = NULL WHERE [Type] = 'Dimension' AND [Name] = 'dim_Maintenance'
UPDATE [setup].[DimFact] SET [NAVTableID] = 5092, [OptionColumnID] = NULL WHERE [Type] = 'Dimension' AND [Name] = 'dim_Opportunity'
UPDATE [setup].[DimFact] SET [NAVTableID] = 0, [OptionColumnID] = 1 WHERE [Type] = 'Dimension' AND [Name] = 'dim_PlannedDueAnalysis'
UPDATE [setup].[DimFact] SET [NAVTableID] = 99000771, [OptionColumnID] = NULL WHERE [Type] = 'Dimension' AND [Name] = 'dim_ProductionBOMHeader'
UPDATE [setup].[DimFact] SET [NAVTableID] = 5405, [OptionColumnID] = NULL WHERE [Type] = 'Dimension' AND [Name] = 'dim_ProductionOrder'
UPDATE [setup].[DimFact] SET [NAVTableID] = 7132, [OptionColumnID] = NULL WHERE [Type] = 'Dimension' AND [Name] = 'dim_PurchaseBudget'
UPDATE [setup].[DimFact] SET [NAVTableID] = 231, [OptionColumnID] = NULL WHERE [Type] = 'Dimension' AND [Name] = 'dim_ReasonCode'
UPDATE [setup].[DimFact] SET [NAVTableID] = 5919, [OptionColumnID] = NULL WHERE [Type] = 'Dimension' AND [Name] = 'dim_Resolution'
UPDATE [setup].[DimFact] SET [NAVTableID] = 156, [OptionColumnID] = NULL WHERE [Type] = 'Dimension' AND [Name] = 'dim_Resource'
UPDATE [setup].[DimFact] SET [NAVTableID] = 152, [OptionColumnID] = NULL WHERE [Type] = 'Dimension' AND [Name] = 'dim_ResourceGroup'
UPDATE [setup].[DimFact] SET [NAVTableID] = 99000763, [OptionColumnID] = NULL WHERE [Type] = 'Dimension' AND [Name] = 'dim_RoutingHeader'
UPDATE [setup].[DimFact] SET [NAVTableID] = 7132, [OptionColumnID] = NULL WHERE [Type] = 'Dimension' AND [Name] = 'dim_SalesBudget'
UPDATE [setup].[DimFact] SET [NAVTableID] = 13, [OptionColumnID] = NULL WHERE [Type] = 'Dimension' AND [Name] = 'dim_SalesPerson'
UPDATE [setup].[DimFact] SET [NAVTableID] = 37, [OptionColumnID] = 5 WHERE [Type] = 'Dimension' AND [Name] = 'dim_SalesPurchaseType'
UPDATE [setup].[DimFact] SET [NAVTableID] = 99000762, [OptionColumnID] = NULL WHERE [Type] = 'Dimension' AND [Name] = 'dim_Scrap'
UPDATE [setup].[DimFact] SET [NAVTableID] = 5965, [OptionColumnID] = NULL WHERE [Type] = 'Dimension' AND [Name] = 'dim_ServiceContract'
UPDATE [setup].[DimFact] SET [NAVTableID] = 5905, [OptionColumnID] = NULL WHERE [Type] = 'Dimension' AND [Name] = 'dim_ServiceCost'
UPDATE [setup].[DimFact] SET [NAVTableID] = 5940, [OptionColumnID] = NULL WHERE [Type] = 'Dimension' AND [Name] = 'dim_ServiceItem'
UPDATE [setup].[DimFact] SET [NAVTableID] = 5907, [OptionColumnID] = 24 WHERE [Type] = 'Dimension' AND [Name] = 'dim_ServiceLedgerEntryType'
UPDATE [setup].[DimFact] SET [NAVTableID] = 5990, [OptionColumnID] = NULL WHERE [Type] = 'Dimension' AND [Name] = 'dim_ServiceOrder'
UPDATE [setup].[DimFact] SET [NAVTableID] = 5957, [OptionColumnID] = NULL WHERE [Type] = 'Dimension' AND [Name] = 'dim_ServiceZone'
UPDATE [setup].[DimFact] SET [NAVTableID] = 230, [OptionColumnID] = NULL WHERE [Type] = 'Dimension' AND [Name] = 'dim_SourceCode'
UPDATE [setup].[DimFact] SET [NAVTableID] = NULL, [OptionColumnID] = NULL WHERE [Type] = 'Dimension' AND [Name] = 'dim_Status'
UPDATE [setup].[DimFact] SET [NAVTableID] = 0, [OptionColumnID] = 6 WHERE [Type] = 'Dimension' AND [Name] = 'dim_StockState'
UPDATE [setup].[DimFact] SET [NAVTableID] = 99000761, [OptionColumnID] = NULL WHERE [Type] = 'Dimension' AND [Name] = 'dim_Stop'
UPDATE [setup].[DimFact] SET [NAVTableID] = NULL, [OptionColumnID] = NULL WHERE [Type] = 'Dimension' AND [Name] = 'dim_StoredProcedure'
UPDATE [setup].[DimFact] SET [NAVTableID] = NULL, [OptionColumnID] = NULL WHERE [Type] = 'Dimension' AND [Name] = 'dim_Time'
UPDATE [setup].[DimFact] SET [NAVTableID] = 5080, [OptionColumnID] = NULL WHERE [Type] = 'Dimension' AND [Name] = 'dim_ToDo'
UPDATE [setup].[DimFact] SET [NAVTableID] = 204, [OptionColumnID] = NULL WHERE [Type] = 'Dimension' AND [Name] = 'dim_UnitofMeasure'
UPDATE [setup].[DimFact] SET [NAVTableID] = NULL, [OptionColumnID] = NULL WHERE [Type] = 'Dimension' AND [Name] = 'dim_User'
UPDATE [setup].[DimFact] SET [NAVTableID] = 23, [OptionColumnID] = NULL WHERE [Type] = 'Dimension' AND [Name] = 'dim_Vendor'
UPDATE [setup].[DimFact] SET [NAVTableID] = 93, [OptionColumnID] = NULL WHERE [Type] = 'Dimension' AND [Name] = 'dim_VendorPostingGroup'
UPDATE [setup].[DimFact] SET [NAVTableID] = 99000754, [OptionColumnID] = NULL WHERE [Type] = 'Dimension' AND [Name] = 'dim_WorkCenter'
UPDATE [setup].[DimFact] SET [NAVTableID] = 99000750, [OptionColumnID] = NULL WHERE [Type] = 'Dimension' AND [Name] = 'dim_WorkShift'
UPDATE [setup].[DimFact] SET [NAVTableID] = 200, [OptionColumnID] = NULL WHERE [Type] = 'Dimension' AND [Name] = 'dim_WorkType'

UPDATE [setup].[DimFact] SET [NAVTableID] = 85 WHERE [Type] = 'Fact' AND [Name] = 'fact_AccountSchedule'
UPDATE [setup].[DimFact] SET [NAVTableID] = 271 WHERE [Type] = 'Fact' AND [Name] = 'fact_BankAccEntry'
UPDATE [setup].[DimFact] SET [NAVTableID] = 271 WHERE [Type] = 'Fact' AND [Name] = 'fact_BankAccState'
UPDATE [setup].[DimFact] SET [NAVTableID] = 271 WHERE [Type] = 'Fact' AND [Name] = 'fact_CFBankAccState'
UPDATE [setup].[DimFact] SET [NAVTableID] = 96 WHERE [Type] = 'Fact' AND [Name] = 'fact_CFBudget'
UPDATE [setup].[DimFact] SET [NAVTableID] = 21 WHERE [Type] = 'Fact' AND [Name] = 'fact_CFCustLedgerEntry'
UPDATE [setup].[DimFact] SET [NAVTableID] = 25 WHERE [Type] = 'Fact' AND [Name] = 'fact_CFVendLedgerEntry'
UPDATE [setup].[DimFact] SET [NAVTableID] = 5407 WHERE [Type] = 'Fact' AND [Name] = 'fact_Component'
UPDATE [setup].[DimFact] SET [NAVTableID] = 5601 WHERE [Type] = 'Fact' AND [Name] = 'fact_FALedgerEntry'
UPDATE [setup].[DimFact] SET [NAVTableID] = 5601 WHERE [Type] = 'Fact' AND [Name] = 'fact_FAMonthState'
UPDATE [setup].[DimFact] SET [NAVTableID] = 5601 WHERE [Type] = 'Fact' AND [Name] = 'fact_FAMonthValueState'
UPDATE [setup].[DimFact] SET [NAVTableID] = 5601 WHERE [Type] = 'Fact' AND [Name] = 'fact_FAState'
UPDATE [setup].[DimFact] SET [NAVTableID] = 96 WHERE [Type] = 'Fact' AND [Name] = 'fact_GLBudgetEntry'
UPDATE [setup].[DimFact] SET [NAVTableID] = 17 WHERE [Type] = 'Fact' AND [Name] = 'fact_GLEntry'
UPDATE [setup].[DimFact] SET [NAVTableID] = 5058 WHERE [Type] = 'Fact' AND [Name] = 'fact_IndustryGroup'
UPDATE [setup].[DimFact] SET [NAVTableID] = 5065 WHERE [Type] = 'Fact' AND [Name] = 'fact_Interaction'
UPDATE [setup].[DimFact] SET [NAVTableID] = 32 WHERE [Type] = 'Fact' AND [Name] = 'fact_Inventory'
UPDATE [setup].[DimFact] SET [NAVTableID] = 32 WHERE [Type] = 'Fact' AND [Name] = 'fact_InventoryState'
UPDATE [setup].[DimFact] SET [NAVTableID] = 32 WHERE [Type] = 'Fact' AND [Name] = 'fact_ItemLedgerEntryManufacturing'
UPDATE [setup].[DimFact] SET [NAVTableID] = 169 WHERE [Type] = 'Fact' AND [Name] = 'fact_JobLedgerEntry'
UPDATE [setup].[DimFact] SET [NAVTableID] = 1003 WHERE [Type] = 'Fact' AND [Name] = 'fact_JobPlanningLine'
UPDATE [setup].[DimFact] SET [NAVTableID] = 5056 WHERE [Type] = 'Fact' AND [Name] = 'fact_MailingGroup'
UPDATE [setup].[DimFact] SET [NAVTableID] = 5625 WHERE [Type] = 'Fact' AND [Name] = 'fact_MaintenanceLedgerEntry'
UPDATE [setup].[DimFact] SET [NAVTableID] = 5409 WHERE [Type] = 'Fact' AND [Name] = 'fact_Manufacturing'
UPDATE [setup].[DimFact] SET [NAVTableID] = 5832 WHERE [Type] = 'Fact' AND [Name] = 'fact_ManufacturingCapacityEntry'
UPDATE [setup].[DimFact] SET [NAVTableID] = 5092 WHERE [Type] = 'Fact' AND [Name] = 'fact_Opportunity'
UPDATE [setup].[DimFact] SET [NAVTableID] = 25 WHERE [Type] = 'Fact' AND [Name] = 'fact_Payables'
UPDATE [setup].[DimFact] SET [NAVTableID] = 25 WHERE [Type] = 'Fact' AND [Name] = 'fact_PayablesState'
UPDATE [setup].[DimFact] SET [NAVTableID] = 32 WHERE [Type] = 'Fact' AND [Name] = 'fact_Purchase'
UPDATE [setup].[DimFact] SET [NAVTableID] = 7134 WHERE [Type] = 'Fact' AND [Name] = 'fact_PurchaseBudget'
UPDATE [setup].[DimFact] SET [NAVTableID] = 39 WHERE [Type] = 'Fact' AND [Name] = 'fact_PurchaseOrder'
UPDATE [setup].[DimFact] SET [NAVTableID] = 121 WHERE [Type] = 'Fact' AND [Name] = 'fact_PurchaseReceiptLine'
UPDATE [setup].[DimFact] SET [NAVTableID] = 21 WHERE [Type] = 'Fact' AND [Name] = 'fact_Receivables'
UPDATE [setup].[DimFact] SET [NAVTableID] = 21 WHERE [Type] = 'Fact' AND [Name] = 'fact_ReceivablesState'
UPDATE [setup].[DimFact] SET [NAVTableID] = 160 WHERE [Type] = 'Fact' AND [Name] = 'fact_ResCapacityEntry'
UPDATE [setup].[DimFact] SET [NAVTableID] = 32 WHERE [Type] = 'Fact' AND [Name] = 'fact_Sales'
UPDATE [setup].[DimFact] SET [NAVTableID] = 7134 WHERE [Type] = 'Fact' AND [Name] = 'fact_SalesBudget'
UPDATE [setup].[DimFact] SET [NAVTableID] = 37 WHERE [Type] = 'Fact' AND [Name] = 'fact_SalesOrder'
UPDATE [setup].[DimFact] SET [NAVTableID] = 111 WHERE [Type] = 'Fact' AND [Name] = 'fact_SalesShipmentLine'
UPDATE [setup].[DimFact] SET [NAVTableID] = 5907 WHERE [Type] = 'Fact' AND [Name] = 'fact_ServiceLedgerEntry'
UPDATE [setup].[DimFact] SET [NAVTableID] = 5990 WHERE [Type] = 'Fact' AND [Name] = 'fact_ServiceShipmentHeader'
UPDATE [setup].[DimFact] SET [NAVTableID] = 5989 WHERE [Type] = 'Fact' AND [Name] = 'fact_ServiceShipmentItemLine'
UPDATE [setup].[DimFact] SET [NAVTableID] = 5950 WHERE [Type] = 'Fact' AND [Name] = 'fact_ServiceZOrderAllocation'
UPDATE [setup].[DimFact] SET [NAVTableID] = 5080 WHERE [Type] = 'Fact' AND [Name] = 'fact_ToDo'
UPDATE [setup].[DimFact] SET [NAVTableID] = NULL WHERE [Type] = 'Fact' AND [Name] = 'fact_Update'
UPDATE [setup].[DimFact] SET [NAVTableID] = NULL WHERE [Type] = 'Fact' AND [Name] = 'fact_UpdateDateTime'
UPDATE [setup].[DimFact] SET [NAVTableID] = 5802 WHERE [Type] = 'Fact' AND [Name] = 'fact_ValueEntryManufacturing'


GO
/****** Object:  StoredProcedure [setup].[InitInstace 1]    Script Date: 11.9.2017 10:30:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [setup].[InitInstace 1] AS

EXEC stage.CreateStage NULL
EXEC setup.Truncate_dim_All
EXEC setup.Init_dim_All

TRUNCATE TABLE setup.[Log]
TRUNCATE TABLE help.Currency
TRUNCATE TABLE [help].[AccountSchedule]
TRUNCATE TABLE [help].[AccountScheduleColumnFilter]
TRUNCATE TABLE [help].[AccountScheduleLine]
TRUNCATE TABLE [help].[AccountScheduleSSRS]
TRUNCATE TABLE [help].[DimensionSetID]
TRUNCATE TABLE [help].[GLAccount]
TRUNCATE TABLE [help].[CashFlowAccount]



GO
/****** Object:  StoredProcedure [setup].[InitInstace 2]    Script Date: 11.9.2017 10:30:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [setup].[InitInstace 2] AS

print 'Nastavit setup.Datasource'
print ''
print 'Nastavit setup.Company'
print 'Vymazat přebytečné společnosti setup.DeleteCompany'


GO
/****** Object:  StoredProcedure [setup].[InitInstace 3]    Script Date: 11.9.2017 10:30:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [setup].[InitInstace 3] AS

EXEC setup.InitDatasourceCompany
EXEC setup.SetupDimension
EXEC stage.CheckSourceDatabase


GO
/****** Object:  StoredProcedure [setup].[InitInstace 4]    Script Date: 11.9.2017 10:30:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [setup].[InitInstace 4] AS

print 'Nastavit setup.Dimension'


GO
/****** Object:  StoredProcedure [setup].[InitInstance 9 Check]    Script Date: 11.9.2017 10:30:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [setup].[InitInstance 9 Check] AS
PRINT '
EXEC [setup].[CheckDWHFieldLength]		-- indikace potenciálního přetečení při plnění dim- a fact-tabulek porovnáním zdrojových view a cílových dwh tabulek'
PRINT '
EXEC [setup].[CheckLengthFieldOLAP]		-- indikace potenciálního přetečení při procesování dimenzí v OLAP
										-- před spuštěním musí být procedurou [setup].[Update_setup_CubeDataXML] naplněna tabulka setup.CubeDataXML'

GO
/****** Object:  StoredProcedure [setup].[InsertLog]    Script Date: 11.9.2017 10:30:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [setup].[InsertLog]
	@StoredProcedureName nvarchar(100),
	@LogStartDate datetime = NULL,
	@LogEndDate datetime = NULL,
	@RowCount int = 0,
	@Status int,
	@StatusDesc nvarchar(max),
	@GroupOfFilling int = NULL
AS
	DECLARE
		@BatchID int,
		@StoredProcedureWithSchemaName nvarchar(100)
	
	SELECT @BatchID = (SELECT a.BatchID FROM setup.Instance a)
	SELECT @StoredProcedureWithSchemaName = b.name + '.' + a.name FROM sys.objects a INNER JOIN sys.schemas b ON a.schema_id = b.schema_id WHERE a.type = 'P' AND a.name LIKE @StoredProcedureName
	
	INSERT INTO setup.Log
	(
		BatchID,
		StoredProcedureName,
		LogStartDate,
		LogEndDate,
		Duration,
		[RowCount],
		[Status],
		StatusDesc,
		UserName,
		GroupOfFilling
	)
	VALUES
	(
		@BatchID,
		ISNULL(@StoredProcedureWithSchemaName, @StoredProcedureName),
		ISNULL(@LogStartDate, GETDATE()),
		ISNULL(@LogEndDate, GETDATE()),
		DATEDIFF(ss, ISNULL(@LogStartDate, GETDATE()), ISNULL(@LogEndDate, GETDATE())),
		@RowCount,
		@Status,
		@StatusDesc,
		SUSER_NAME(),
		@GroupOfFilling 
	)



GO
/****** Object:  StoredProcedure [setup].[ReNAVDataSourceTables]    Script Date: 11.9.2017 10:30:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [setup].[ReNAVDataSourceTables]
	@RefreshBySourceName bit = 0,
	@RefreshBySourceID bit = 0,
	@RefreshNonActiveStageName bit = 0,
	@RefreshActiveStageName int = 0,
	@DataSourceList nvarchar(max) = NULL,
	@TableList nvarchar(max) = NULL

AS
	DECLARE
		-- DataSource variables
		@DataSourceID int,
		@ServerName nvarchar(128),
		@ServerNamePrefix nvarchar (132), -- empty string OR [ServerName].
		@DatabaseName nvarchar(128),
		@CodePage int,
		@NAVNameChangedCharacters nvarchar(128),
		@NAVNameReplacementCharacter nvarchar(1),
		@CompanyName nvarchar(128),	-- First CompanyCode from DataSource (in alphabetical order)
		-- DataSourceTable variables
		@DataSourceTableID int,
		@TableID int,
		@TableNameSource nvarchar(128),
		@TableNameSql nvarchar(128),
		@TableNameStage nvarchar(128),
		@OriginalTableNameStage nvarchar(128),
		@StageTableExists bit,
		--@TableType tinyint,
		--@ExistsInDataSource bit,
		--@FullTableNameSql nvarchar(128),	--TableNameSql wirh eventuell CompanyName

		@ExecString nvarchar(max),
		@ParmDefinition nvarchar(max)  

		
	
	SET	@ExecString = N'
	DECLARE DataSourceCursor CURSOR FOR
		SELECT
			a.[DataSourceID],
			a.[ServerName],
			a.[DatabaseName],
			a.[CodePage],
			a.[NAVNameChangedCharacters],
			a.[NAVNameReplacementCharacter]
		FROM
			[setup].[DataSource] a'
	IF @DataSourceList IS NOT NULL	SET @ExecString = @ExecString + N'
		WHERE
			a.[DataSourceID] IN (' + @DataSourceList + N')'
	SET @ExecString = @ExecString + N'
		ORDER BY a.[DataSourceID]'
	
	--PRINT @ExecString
	EXEC sp_executesql	@stmt = @ExecString	--DECLARE DataSourceCursor
	OPEN DataSourceCursor
	FETCH NEXT FROM DataSourceCursor INTO @DataSourceID, @ServerName, @DatabaseName, @CodePage, @NAVNameChangedCharacters, @NAVNameReplacementCharacter

	-- Loop through DataSources BEGIN
	WHILE @@FETCH_STATUS = 0 
	BEGIN
		-- Loop through NAV Tables
		IF UPPER(@ServerName) <> @@SERVERNAME AND UPPER(@ServerName) <> ''
			SET @ServerNamePrefix = @ServerName + N'.'
		ELSE
			SET @ServerNamePrefix = ''
		SET @CompanyName = (SELECT MIN(c.CompanyCode) FROM setup.Company c WHERE c.DataSourceID = @DataSourceID)
		SET @ExecString = N'
		DECLARE TableCursor CURSOR FOR
			SELECT
				[TableID] = a.[ID],
				[TableNameSource] = a.[Name]
			FROM ' + @ServerNamePrefix + @DatabaseName + N'.[dbo].[Object] a
			WHERE a.[Type] = 0'
		IF @TableList IS NOT NULL
			SET @ExecString = @ExecString + N' AND [ID] IN (' + @TableList + ')'
		SET @ExecString = @ExecString + N' ORDER BY a.[ID]'

		--PRINT @ExecString
		EXEC sp_executesql	@stmt = @ExecString	--DECLARE TableCursor
		OPEN TableCursor
		FETCH NEXT FROM TableCursor INTO @TableID, @TableNameSource

		-- Loop through Tables BEGIN
		WHILE @@FETCH_STATUS = 0 
		BEGIN
			SET @TableNameSql = setup.ConvertIdentifiers(@TableNameSource, @NAVNameChangedCharacters, @NAVNameReplacementCharacter)
			SET @TableNameStage = @TableNameSql
			IF @RefreshBySourceName = 1
			BEGIN
				SET @DataSourceTableID = 
					(SELECT a.DataSourceTableID
					FROM [setup].[DataSourceTable] a
					WHERE
						a.DataSourceID = @DataSourceID AND
						a.TableNameSource = @TableNameSource AND
						(a.TableNameSql <> @TableNameSql OR a.TableID <> @TableID OR (a.TableNameStage <> @TableNameStage AND (@RefreshNonActiveStageName > 0 OR @RefreshActiveStageName > 0)))
					)
				IF @DataSourceTableID IS NOT NULL
				BEGIN
					SET @OriginalTableNameStage = (SELECT a.TableNameStage FROM [setup].[DataSourceTable] a WHERE a.DataSourceTableID = @DataSourceTableID)
					SET @StageTableExists = (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'stage' AND TABLE_NAME = @OriginalTableNameStage AND TABLE_TYPE = 'BASE TABLE')
					IF @RefreshActiveStageName > 0 AND @StageTableExists = 1 AND @OriginalTableNameStage <> @TableNameStage
						PRINT 'Rename stage table [' + @OriginalTableNameStage + '] -> [' + @TableNameStage + ']'
					IF @RefreshActiveStageName < 2	--if > 1 then only print warning without update
					BEGIN
						IF	(@RefreshActiveStageName = 0 AND @StageTableExists = 1)	OR	-- active StageName noupdate
							(@RefreshNonActiveStageName = 0 AND @StageTableExists = 0)	-- nonactive StageName noupdate
								SET @TableNameStage = @OriginalTableNameStage
						UPDATE [setup].[DataSourceTable]
						SET	[TableID] = @TableID,
							[TableNameSql] = @TableNameSql,
							[TableNameStage] = @TableNameStage
						WHERE DataSourceTableID = @DataSourceTableID AND
							([TableID] <> @TableID OR [TableNameSql] <> @TableNameSql OR [TableNameStage] <> @TableNameStage)
					END
				END
			END

			IF @RefreshBySourceID = 1
			BEGIN
				SET @DataSourceTableID = 
					(SELECT a.DataSourceTableID
					FROM [setup].[DataSourceTable] a
					WHERE
						a.DataSourceID = @DataSourceID AND
						a.TableID = @TableID AND
						(a.TableNameSql <> @TableNameSql OR a.TableNameSource <> @TableNameSource OR (a.TableNameStage <> @TableNameStage AND (@RefreshNonActiveStageName > 0 OR @RefreshActiveStageName > 0)))
					)
				IF @DataSourceTableID IS NOT NULL
				BEGIN
					SET @OriginalTableNameStage = (SELECT a.TableNameStage FROM [setup].[DataSourceTable] a WHERE a.DataSourceTableID = @DataSourceTableID)
					SET @StageTableExists = (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'stage' AND TABLE_NAME = @OriginalTableNameStage AND TABLE_TYPE = 'BASE TABLE')
					IF @RefreshActiveStageName > 0 AND @StageTableExists = 1 AND @OriginalTableNameStage <> @TableNameStage
						PRINT 'Rename stage table [' + @OriginalTableNameStage + '] -> [' + @TableNameStage + ']'
					IF @RefreshActiveStageName < 2	--if > 1 then only print warning without update
					BEGIN
						IF	(@RefreshActiveStageName = 0 AND @StageTableExists = 1)	OR	-- active StageName noupdate
							(@RefreshNonActiveStageName = 0 AND @StageTableExists = 0)	-- nonactive StageName noupdate
								SET @TableNameStage = @OriginalTableNameStage
						UPDATE [setup].[DataSourceTable]
						SET	[TableNameSource] = @TableNameSource,
							[TableNameSql] = @TableNameSql,
							[TableNameStage] = @TableNameStage
						WHERE DataSourceTableID = @DataSourceTableID AND
							([TableNameSource] <> @TableNameSource OR [TableNameSql] <> @TableNameSql OR [TableNameStage] <> @TableNameStage)
					END
				END
			END

			FETCH NEXT FROM TableCursor INTO @TableID, @TableNameSource
		END
		-- Loop through Tables END
		CLOSE TableCursor
		DEALLOCATE TableCursor

		FETCH NEXT FROM DataSourceCursor INTO @DataSourceID, @ServerName, @DatabaseName, @CodePage, @NAVNameChangedCharacters, @NAVNameReplacementCharacter
	END
	-- Loop through DataSources END
	CLOSE DataSourceCursor
	DEALLOCATE DataSourceCursor


GO
/****** Object:  StoredProcedure [setup].[ReTypeToDataSourceTables]    Script Date: 11.9.2017 10:30:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [setup].[ReTypeToDataSourceTables]
	@TableList nvarchar(max) = NULL

AS
	DECLARE
		-- DataSource variables
		@DataSourceID int,
		@ServerName nvarchar(128),
		@ServerNamePrefix nvarchar (132), -- empty string OR [ServerName].
		@DatabaseName nvarchar(128),
		@CodePage int,
		@NAVNameChangedCharacters nvarchar(128),
		@NAVNameReplacementCharacter nvarchar(1),
		@CompanyName nvarchar(128),	-- First CompanyCode from DataSource (in alphabetical order)
		-- DataSourceTable variables
		@DataSourceTableID int,
		@DataSourceTableIDText nvarchar(20),
		@TableID int,
		@TableIDText nvarchar(20),
		@TableNameSource nvarchar(128),
		@TableNameSql nvarchar(128),
		@TableNameStage nvarchar(128),
		@TableType tinyint,
		@ExistsInDataSource bit,
		@FullTableNameSql nvarchar(128),	--TableNameSql wirh eventuell CompanyName

		@ExecString nvarchar(max),
		@ParmDefinition nvarchar(max),

		@NAVFieldTablesExists int,
		@InsertedColumnsCount int,
		@UpdatedColumnsCount int
	
	SET NOCOUNT ON

	DECLARE DataSourceCursor CURSOR FOR
		SELECT
			a.[DataSourceID],
			a.[ServerName],
			a.[DatabaseName],
			a.[CodePage],
			a.[NAVNameChangedCharacters],
			a.[NAVNameReplacementCharacter]
		FROM
			[setup].[DataSource] a
	
	OPEN DataSourceCursor
	FETCH NEXT FROM DataSourceCursor INTO @DataSourceID, @ServerName, @DatabaseName, @CodePage, @NAVNameChangedCharacters, @NAVNameReplacementCharacter

	-- Loop through DataSources BEGIN
	WHILE @@FETCH_STATUS = 0 
	BEGIN
		-- Loop through NAV Tables
		IF UPPER(@ServerName) <> @@SERVERNAME AND UPPER(@ServerName) <> ''
			SET @ServerNamePrefix = @ServerName + N'.'
		ELSE
			SET @ServerNamePrefix = ''

		SET @ExecString =
				N'SET @TableCount = 
				(SELECT COUNT(*)
				FROM ' + @ServerNamePrefix + @DatabaseName + N'.INFORMATION_SCHEMA.TABLES
				WHERE
					TABLE_SCHEMA = ''dbo'' AND
					TABLE_NAME IN (''NAV Field'',  ''NAV Field Translation'') AND
					TABLE_TYPE = ''BASE TABLE''
				)'
		SET @ParmDefinition = N'@TableCount int OUTPUT';  
		EXEC sp_executesql	@ExecString, @ParmDefinition, @TableCount=@NAVFieldTablesExists OUTPUT	--SET @NAVFieldTablesExists
		IF @NAVFieldTablesExists = 2 SET @NAVFieldTablesExists = 1 ELSE SET @NAVFieldTablesExists = 0

		SET @CompanyName = ISNULL((SELECT MIN(c.CompanyCode) FROM setup.Company c WHERE c.DataSourceID = @DataSourceID), '')
		SET @ExecString = N'
		DECLARE TableCursor CURSOR FOR
			SELECT
				[TableID] = a.[ID],
				[TableNameSource] = a.[Name]
			FROM ' + @ServerNamePrefix + @DatabaseName + N'.[dbo].[Object] a
			WHERE a.[Type] = 1'
		IF @TableList IS NOT NULL
			SET @ExecString = @ExecString + N' AND [ID] IN (' + @TableList + ')'
		SET @ExecString = @ExecString + N' ORDER BY a.[ID]'

		--PRINT @ExecString
		EXEC sp_executesql	@stmt = @ExecString	--DECLARE TableCursor
		OPEN TableCursor
		FETCH NEXT FROM TableCursor INTO @TableID, @TableNameSource

		-- Loop through Tables BEGIN
		WHILE @@FETCH_STATUS = 0 
		BEGIN
			SET @TableIDText = CONVERT(nvarchar(20), @TableID)
			SET @TableNameSql = setup.ConvertIdentifiers(@TableNameSource, @NAVNameChangedCharacters, @NAVNameReplacementCharacter)
			SET @TableNameStage = @TableNameSql
			SET @ExecString =
				N'SET @ExistsInDataSourceOUT = 
				(SELECT COUNT(*)
				FROM ' + @ServerNamePrefix + @DatabaseName + N'.INFORMATION_SCHEMA.TABLES
				WHERE
					TABLE_SCHEMA = ''dbo'' AND
					TABLE_NAME collate DATABASE_DEFAULT = ''' + @TableNameSql + N''' collate DATABASE_DEFAULT AND
					TABLE_TYPE = ''BASE TABLE''
				)'
			SET @ParmDefinition = N'@ExistsInDataSourceOUT int OUTPUT';  
			EXEC sp_executesql	@ExecString, @ParmDefinition, @ExistsInDataSourceOUT=@ExistsInDataSource OUTPUT	--SET @ExistsInDataSource
			IF @ExistsInDataSource = 1	--common NAV table
			BEGIN
				SET @FullTableNameSql = @TableNameSql
				SET @TableType = 0
			END
			ELSE
			BEGIN
				SET @FullTableNameSql = @CompanyName + N'$' + @TableNameSql
				SET @TableType = 1
				SET @ExecString =
					N'SET @ExistsInDataSourceOUT = 
					(SELECT COUNT(*)
					FROM ' + @ServerNamePrefix + @DatabaseName + N'.INFORMATION_SCHEMA.TABLES
					WHERE
						TABLE_SCHEMA = ''dbo'' AND
						TABLE_NAME collate DATABASE_DEFAULT = ''' + @FullTableNameSql + N''' collate DATABASE_DEFAULT AND
						TABLE_TYPE = ''BASE TABLE''
					)'
			SET @ParmDefinition = N'@ExistsInDataSourceOUT int OUTPUT';  
			EXEC sp_executesql	@ExecString, @ParmDefinition, @ExistsInDataSourceOUT=@ExistsInDataSource OUTPUT	--SET @ExistsInDataSource
			END
			IF @ExistsInDataSource = 1	-- only existing table is processed
			BEGIN

				SET @DataSourceTableID = (SELECT a.DataSourceTableID FROM [setup].[DataSourceTable] a WHERE a.DataSourceID = @DataSourceID AND a.TableNameSource = @TableNameSource)			
				IF @DataSourceTableID IS NULL SET @DataSourceTableID = (SELECT a.DataSourceTableID FROM [setup].[DataSourceTable] a WHERE a.DataSourceID = @DataSourceID AND a.TableID = @TableID)
				IF @DataSourceTableID IS NOT NULL
					UPDATE [setup].[DataSourceTable] SET [TableType] = @TableType WHERE DataSourceTableID = @DataSourceTableID
			END

			FETCH NEXT FROM TableCursor INTO @TableID, @TableNameSource
		END
		-- Loop through Tables END
		CLOSE TableCursor
		DEALLOCATE TableCursor

		FETCH NEXT FROM DataSourceCursor INTO @DataSourceID, @ServerName, @DatabaseName, @CodePage, @NAVNameChangedCharacters, @NAVNameReplacementCharacter
	END
	-- Loop through DataSources END
	CLOSE DataSourceCursor
	DEALLOCATE DataSourceCursor
	SET NOCOUNT OFF



GO
/****** Object:  StoredProcedure [setup].[SetFiscalYearMonthStart]    Script Date: 11.9.2017 10:30:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/******
	Procedure updates FiscalYearMonthStart column of setup.Instance table.
	New value of column is defined in parameter of procedure.
******/

CREATE PROCEDURE [setup].[SetFiscalYearMonthStart]
	@FiscalYearMonthStart int
AS

UPDATE 
	setup.Instance
SET 
	FiscalYearMonthStart = @FiscalYearMonthStart


GO
/****** Object:  StoredProcedure [setup].[SetupDimension]    Script Date: 11.9.2017 10:30:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/******
	Procedure truncates setup.Dimension table and then insert new data from stage.Dimension table.
******/

CREATE PROCEDURE [setup].[SetupDimension] AS
TRUNCATE TABLE setup.Dimension

INSERT setup.Dimension (
	CompanyID,
	DimensionCode
)
SELECT
	a.CompanyID,
	a.Code
FROM
	stage.Dimension a


GO
/****** Object:  StoredProcedure [setup].[SetupUpdateOptions]    Script Date: 11.9.2017 10:30:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/******
	Procedure updates IncrementalUpdate and IncrementalUpdateDWH columns of setup.Instance table. 
	New values of these columns are defined in parameters of procedure.
******/

CREATE PROCEDURE [setup].[SetupUpdateOptions]
	@IncrementalUpdate int,
	@IncrementalUpdateDWH int

AS

UPDATE [setup].[Instance] SET
	[IncrementalUpdate] = @IncrementalUpdate,
	[IncrementalUpdateDWH] = @IncrementalUpdateDWH



GO
/****** Object:  StoredProcedure [setup].[Truncate_dim_All]    Script Date: 11.9.2017 10:30:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/******
	Procedure truncates all dim tables (tables that begin with "dim_").
	In the first step procedure drop constraint in fact tables (execute dwh.DropConstraint_fact_All).
	In the second step procedure delete data from fact tables (execute dwh.Delete_fact_All).
	Then dim tables are truncated.
******/

CREATE PROCEDURE [setup].[Truncate_dim_All] AS
	DECLARE
		@DimName nvarchar(128),
		@ExecString nvarchar(max)

	DECLARE
		DimTablesCursor CURSOR READ_ONLY FOR
			SELECT
				DimName = t.TABLE_NAME 
			FROM INFORMATION_SCHEMA.TABLES t
			WHERE t.TABLE_SCHEMA = 'dwh' AND LEFT(t.TABLE_NAME, 4) = 'dim_' AND t.TABLE_NAME NOT IN ('dim_DetailedEntryType')
			ORDER BY t.TABLE_NAME
			
	EXEC [dwh].[DropConstraint_fact_All]
	EXEC [dwh].[Delete_fact_All]
			
	OPEN DimTablesCursor
	FETCH NEXT FROM DimTablesCursor INTO @DimName
	WHILE @@FETCH_STATUS = 0
	BEGIN
			SET @ExecString = N'TRUNCATE TABLE [dwh].[' + @DimName + ']'
			--PRINT @ExecString
			EXEC sp_executesql @stmt = @ExecString
		FETCH NEXT FROM DimTablesCursor INTO @DimName
	END
	CLOSE DimTablesCursor
	DEALLOCATE DimTablesCursor
	
	EXEC [dwh].[CreateConstraint_fact_All]
	


GO
/****** Object:  StoredProcedure [setup].[Update_setup_Cube]    Script Date: 11.9.2017 10:30:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [setup].[Update_setup_Cube] AS
	DECLARE
		@StoredProcedureName nvarchar(max),
		@LogStartDate datetime,
		@LogEndDate datetime,
		@RowCount int

	MERGE [setup].[Cube] AS a
    USING (
		SELECT 
			convert(nvarchar(max),[CubeName]) 
		FROM 
			--NAV3_ACproBI_NAV linkovaný server k OLAP serveru
			--V budoucnu je potřeba parametrizace, doplnit pole do setup.DataSource - OLAP Database Name,
			--kde bude název linkovaného servru
			OPENQUERY(NAV3_ACproBI_NAV,
				'SELECT 
					CUBE_CAPTION AS CubeName
				FROM 
					$system.MDSchema_Cubes
				WHERE 
					([CUBE_SOURCE] = 1)') 
		) AS b (
			[CubeName]
		)
    ON (a.[CubeName] = b.[CubeName] 
    )
    WHEN MATCHED AND a.[CubeName] <> b.[CubeName] THEN 
        UPDATE SET		
			a.[CubeName] = b.[CubeName]
	WHEN NOT MATCHED BY TARGET THEN	
	    INSERT (
			[CubeName]
		)
	    VALUES (
			b.[CubeName]
		)
	WHEN NOT MATCHED BY SOURCE THEN
	DELETE ;

	SET @RowCount = @@ROWCOUNT
	SET @StoredProcedureName = OBJECT_NAME(@@PROCID)
	SET @LogEndDate = GETDATE()
	EXEC setup.InsertLog @StoredProcedureName, @LogStartDate, @LogEndDate, @RowCount, 0, 'Success'










GO
/****** Object:  StoredProcedure [setup].[Update_setup_CubeDataXML]    Script Date: 11.9.2017 10:30:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/******
	Procedure deletes and inserts data into setup.CubeDataXML table.
	Inserting data are XML files of cubes (.cube files) of OLAP project. 
	Path to OLAP project is defined in OLAPProjectPath column of setup.Instance table.
	Currently SQL Server does not have permissions to read these files.
	It means that procedeure fails and only deletes data from setup.CubeDataXML table.
******/

CREATE PROCEDURE [setup].[Update_setup_CubeDataXML] AS
	DECLARE
		@CubeName nvarchar(max),
		@Path nvarchar(max), 
		@ExecString nvarchar(max),
		@StoredProcedureName nvarchar(max),
		@LogStartDate datetime,
		@LogEndDate datetime,
		@RowCount int

	DELETE FROM setup.CubeDataXML

	SET @ExecString = N'
	DECLARE CubeCursor CURSOR FOR
		SELECT 
			CubeName
		FROM 
			setup.[Cube]'

	EXEC sp_executesql @ExecString
		
	OPEN CubeCursor
	SET NOCOUNT ON

	-- Loop through Cube files
	FETCH NEXT FROM CubeCursor INTO @CubeName

	WHILE @@FETCH_STATUS = 0 
	BEGIN
		--Path to XML cube file
		SET @Path = '''' + (SELECT OLAPProjectPath FROM setup.Instance) + '\' + @CubeName + '.cube'''

		SET @ExecString = N'
		INSERT INTO setup.CubeDataXML (CubeName, XMLData)
		SELECT 
			' + '''' + @CubeName + '''' + ' ,
			CONVERT(XML, BulkColumn) AS BulkColumn
		FROM OPENROWSET(BULK ' + @Path + ' , SINGLE_BLOB) AS x;'

		EXEC sp_executesql @ExecString

		PRINT(@CubeName + ' insterted')

		FETCH NEXT FROM CubeCursor INTO @CubeName
	END
	CLOSE CubeCursor
	DEALLOCATE CubeCursor

	SET @RowCount = @@ROWCOUNT
	SET @StoredProcedureName = OBJECT_NAME(@@PROCID)
	SET @LogEndDate = GETDATE()
	EXEC setup.InsertLog @StoredProcedureName, @LogStartDate, @LogEndDate, @RowCount, 0, 'Success'











GO
/****** Object:  StoredProcedure [setup].[Update_setup_DimFact]    Script Date: 11.9.2017 10:30:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/******
	Procedure updates Type and Name columns in setup.DimFact table.
	Procedure extracts names of dimension and fact tables from sys.tables.
******/
CREATE PROCEDURE [setup].[Update_setup_DimFact] AS
	DECLARE
		@StoredProcedureName nvarchar(max),
		@LogStartDate datetime,
		@LogEndDate datetime,
		@RowCount int

	MERGE setup.DimFact AS a
    USING (
		SELECT
			[Type] = CASE 
				WHEN SUBSTRING(b.name,1,4) = 'dim_' THEN 'Dimension'
				WHEN SUBSTRING(b.name,1,5) = 'fact_' THEN 'Fact'
				ELSE 'Unknown'
			END,
			b.[name]
		FROM
			sys.tables b
		WHERE 
			SCHEMA_NAME(schema_id) = 'dwh'
		) AS c (
			[Type],
			[Name]
		)
    ON (a.[Name] = c.[Name] 
    )
    WHEN MATCHED AND a.[Name] <> c.[Name]  OR a.[Type] <> c.[Type] THEN 
        UPDATE SET		
			a.[Type] = c.[Type],
			a.[Name] = c.[Name]
	WHEN NOT MATCHED BY TARGET THEN	
	    INSERT (
			[Type],
			[Name]
		)
	    VALUES (
			c.[Type],
			c.[Name]
		)
	WHEN NOT MATCHED BY SOURCE THEN
	DELETE ;	

	SET @RowCount = @@ROWCOUNT
	SET @StoredProcedureName = OBJECT_NAME(@@PROCID)
	SET @LogEndDate = GETDATE()
	EXEC setup.InsertLog @StoredProcedureName, @LogStartDate, @LogEndDate, @RowCount, 0, 'Success'









GO
/****** Object:  StoredProcedure [setup].[Update_setup_ProjectCubeData]    Script Date: 11.9.2017 10:30:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [setup].[Update_setup_ProjectCubeData] 
AS
	DECLARE
	@CubeNameList nvarchar(max),
	@ExecString nvarchar(max),
	@StoredProcedureName nvarchar(max),
	@LogStartDate datetime,
	@LogEndDate datetime,
	@RowCount int

	IF OBJECT_ID('tempdb.dbo.#XMLFile', 'U') IS NULL
		CREATE TABLE #XMLFile(
			XMLData XML
		)

	DELETE FROM [setup].[ProjectCube]
	WHERE CubeID <> ''

	DELETE FROM [setup].[ProjectCube_MeasureGroup]
	WHERE CubeID <> ''

	DELETE FROM [setup].[ProjectCube_Measure]
	WHERE CubeID <> ''

	DELETE FROM [setup].[ProjectCube_Dim]
	WHERE CubeID <> ''

	DELETE FROM [setup].[ProjectCube_DimUsage]
	WHERE CubeID <> ''

	DELETE FROM [setup].[ProjectCube_Set]
	WHERE CubeID <> ''

	DELETE FROM [setup].[ProjectLanguage]
	WHERE 
		ObjectType = 'cube' AND
		ObjectID <> ''

	DELETE FROM [setup].[ProjectPartTranslation]
	WHERE 
		ObjectType = 'cube' AND
		ObjectID <> ''

	--Cube Cursor

	DECLARE CubeCursor CURSOR FOR
		SELECT 
			FileName
		FROM 
			setup.ProjectDataXML
		WHERE 
			FileType ='cube' 

	OPEN CubeCursor
	SET NOCOUNT ON

	-- Loop through XML definition of cubes
	FETCH NEXT FROM CubeCursor INTO @CubeNameList

	WHILE @@FETCH_STATUS = 0 
	BEGIN
		SET @ExecString = N'
		INSERT INTO #XMLFile
		SELECT XMLData
		FROM setup.ProjectDataXML
		WHERE FileName =' + '''' +  @CubeNameList + ''''

		EXEC sp_executesql @ExecString

		--Insert data into ProjectCube table

		INSERT INTO [setup].[ProjectCube] (CubeID, Name, Description, Visible)
			SELECT DISTINCT
				N1.C.value('(./*:ID[1])','nvarchar(max)') as CubeID,
				N1.C.value('(./*:Name[1])','nvarchar(max)') as CubeName,
				ISNULL(N1.C.value('(./*:Description[1])','nvarchar(max)'),'') as Description,
				ISNULL(N1.C.value('(./*:Visible[1])','bit'),'1') as Visible				
			FROM #XMLFile
				CROSS APPLY XMLData.nodes('/*:Cube') N1(C)

		--Insert data into ProjectCube_MeasureGroup

		INSERT INTO [setup].[ProjectCube_MeasureGroup] (CubeID, MeasureGroupID, Name, Description)
			SELECT DISTINCT
				N2.C.value('(./*:ID[1])','nvarchar(max)') as CubeID,
				N3.C.value('(./*:ID[1])','nvarchar(max)') as MeasureGroupID,
				N3.C.value('(./*:Name[1])','nvarchar(max)') as Name,
				ISNULL(N3.C.value('(./*:Description[1])','nvarchar(max)'),'') as Description				
			FROM #XMLFile
				CROSS APPLY XMLData.nodes('/*:Cube') N2(C)
				CROSS APPLY N2.C.nodes('./*:MeasureGroups/*:MeasureGroup') N3(C)

		--Insert data into ProjectCube_Measure

		INSERT INTO [setup].[ProjectCube_Measure] (CubeID, MeasureID, MeasureGroupID, Name, Description, DisplayFolder, Visible, IsCalculated, IsACY, IsTimeComp, SourceTable, SourceColumn, AggregateFunction)
			SELECT DISTINCT
				N4.C.value('(./*:ID[1])','nvarchar(max)') as CubeID,
				N6.C.value('(./*:ID[1])','nvarchar(max)') as MeasureID,
				ISNULL(N5.C.value('(./*:ID[1])','nvarchar(max)'),'') as MeasureGroupID,
				N6.C.value('(./*:Name[1])','nvarchar(max)') as Name,
				ISNULL(N6.C.value('(./*:Description[1])','nvarchar(max)'),'') as Description,
				ISNULL(N6.C.value('(./*:DisplayFolder[1])','nvarchar(max)'),'') as DisplayFolder,
				ISNULL(N6.C.value('(./*:Visible[1])','bit'),'1') as Visible,
				IsCalculated = 0,
				IsACY = 0,
				IsTimeComp = 0,
				ISNULL(RIGHT(N7.C.value('(./*:TableID[1])','nvarchar(max)'), LEN(N7.C.value('(./*:TableID[1])','nvarchar(max)')) - 4),'') as SourceTable,
				ISNULL(N7.C.value('(./*:ColumnID[1])','nvarchar(max)'),'') as SourceColumn,
				ISNULL(N6.C.value('(./*:AggregateFunction[1])','nvarchar(max)'),'Sum') as AggregateFunction
			FROM #XMLFile
				CROSS APPLY XMLData.nodes('/*:Cube') N4(C)
				CROSS APPLY N4.C.nodes('./*:MeasureGroups/*:MeasureGroup') N5(C)
			    CROSS APPLY N5.C.nodes('./*:Measures/*:Measure') N6(C)
				CROSS APPLY N6.C.nodes('./*:Source/*:Source') N7(C)
			UNION ALL
			SELECT DISTINCT
				N8.C.value('(./*:ID[1])','nvarchar(max)') as CubeID,
				CONCAT(' ',(REPLACE(REPLACE(N9.C.value('(./*:CalculationReference[1])','nvarchar(max)'), '[Measures].[', ''), ']' , ''))) as MeasureID,
				ISNULL(N9.C.value('(./*:AssociatedMeasureGroupID[1])','nvarchar(max)'),'') as MeasureGroupID,
				REPLACE(REPLACE(N9.C.value('(./*:CalculationReference[1])','nvarchar(max)'), '[Measures].[', ''), ']' , '') as Name,
				ISNULL(N9.C.value('(./*:Description[1])','nvarchar(max)'),'') as Description,
				ISNULL(N9.C.value('(./*:DisplayFolder[1])','nvarchar(max)'),'') as DisplayFolder,
				Visible = 
					CASE
						WHEN
							N9.C.value('(./*:CalculationReference[1])','nvarchar(max)') LIKE 'h%'
							THEN 0
						ELSE 1
					END,
				IsCalculated = 1,
				IsACY = 0,
				IsTimeComp = 0,
				SourceTable = '',
				SourceColumn = '',
				AggregateFunction = ''
			FROM #XMLFile
				CROSS APPLY XMLData.nodes('/*:Cube') N8(C)
				CROSS APPLY N8.C.nodes('./*:MdxScripts/*:MdxScript/*:CalculationProperties/*:CalculationProperty') N9(C)
			WHERE
				N9.C.value('(./*:CalculationType[1])','nvarchar(max)') not like 'Set'

		--Insert data into ProjectCube_Dim

		INSERT INTO [setup].[ProjectCube_Dim] (CubeID, CubeDimID, DimID, Name, Description, Visible)
			SELECT DISTINCT
				N10.C.value('(./*:ID[1])','nvarchar(max)') as CubeID,
				N11.C.value('(./*:ID[1])','nvarchar(max)') as CubeDimID,
				N11.C.value('(./*:DimensionID[1])','nvarchar(max)') as DimID,
				N11.C.value('(./*:Name[1])','nvarchar(max)') as Name,
				ISNULL(N11.C.value('(./*:Description[1])','nvarchar(max)'),'') as Description,
				ISNULL(N11.C.value('(./*:Visible[1])','bit'),'1') as Visible					
			FROM #XMLFile
				CROSS APPLY XMLData.nodes('/*:Cube') N10(C)
				CROSS APPLY N10.C.nodes('./*:Dimensions/*:Dimension') N11(C)		
				
		--Insert data into ProjectCube_DimUsage

		INSERT INTO [setup].[ProjectCube_DimUsage] (CubeID, MeasureGroupID, CubeDimID, RelationShipType)
			SELECT DISTINCT
				N12.C.value('(./*:ID[1])','nvarchar(max)') as CubeID,
				N13.C.value('(./*:ID[1])','nvarchar(max)') as MeasureGroupID,
				N14.C.value('(./*:CubeDimensionID[1])','nvarchar(max)') as CubeDimID,
				LEFT(N14.C.value('(./@xsi:type)[1]','nvarchar(max)'),LEN(N14.C.value('(./@xsi:type)[1]','nvarchar(max)'))-21) as RelationShipType				
			FROM #XMLFile
				CROSS APPLY XMLData.nodes('/*:Cube') N12(C)
				CROSS APPLY N12.C.nodes('./*:MeasureGroups/*:MeasureGroup') N13(C)	
				CROSS APPLY N13.C.nodes('./*:Dimensions/*:Dimension') N14(C)	
				
		--Insert data into ProjectCube_Set
		INSERT INTO [setup].[ProjectCube_Set] (CubeID, SetID, Name, Description, IsDynamic)
			SELECT DISTINCT
				N15.C.value('(./*:ID[1])','nvarchar(max)') as CubeID,
				N16.C.value('(./*:CalculationReference[1])','nvarchar(max)') as SetID,
				N16.C.value('(./*:CalculationReference[1])','nvarchar(max)') as Name,
				ISNULL(N16.C.value('(./*:Description[1])','nvarchar(max)'),'') as Description,
				IsDynamic = 0			
			FROM #XMLFile
				CROSS APPLY XMLData.nodes('/*:Cube') N15(C)
				CROSS APPLY N15.C.nodes('./*:MdxScripts/*:MdxScript/*:CalculationProperties/*:CalculationProperty') N16(C)	
			WHERE
				N16.C.value('(./*:CalculationType[1])','nvarchar(max)') like 'Set'

		--Insert data into ProjectLanguage
		INSERT INTO [setup].[ProjectLanguage] (ObjectType, ObjectID, LanguageID)
			SELECT DISTINCT 
				ObjectType,
				CubeID,
				LanguageID
			FROM (
				SELECT DISTINCT
					ObjectType = 'cube',
					N17.C.value('(./*:ID[1])','nvarchar(max)') as CubeID,
					N18.C.value('(./*:Language[1])','nvarchar(max)') as LanguageID					
				FROM #XMLFile
					CROSS APPLY XMLData.nodes('/*:Cube') N17(C)
					CROSS APPLY N17.C.nodes('./*:Translations/*:Translation') N18(C)
				UNION ALL
					SELECT DISTINCT
						ObjectType = 'cube',
						N19.C.value('(./*:ID[1])','nvarchar(max)') as ObjectID,
						N20.C.value('(./*:Language[1])','nvarchar(max)') as LanguageID	
					FROM #XMLFile
						CROSS APPLY XMLData.nodes('/*:Cube') N19(C)
						CROSS APPLY N19.C.nodes('./*:Dimensions/*:Dimension/*:Translations/*:Translation') N20(C)
				UNION ALL
					SELECT DISTINCT
						ObjectType = 'cube',
						N21.C.value('(./*:ID[1])','nvarchar(max)') as ObjectID,
						N22.C.value('(./*:Language[1])','nvarchar(max)') as LanguageID	
					FROM #XMLFile
						CROSS APPLY XMLData.nodes('/*:Cube') N21(C)
						CROSS APPLY N21.C.nodes('./*:MeasureGroups/*:MeasureGroup/*:Translations/*:Translation') N22(C)
				UNION ALL
					SELECT DISTINCT
						ObjectType = 'cube',
						N23.C.value('(./*:ID[1])','nvarchar(max)') as ObjectID,
						N24.C.value('(./*:Language[1])','nvarchar(max)') as LanguageID	
					FROM #XMLFile
						CROSS APPLY XMLData.nodes('/*:Cube') N23(C)
						CROSS APPLY N23.C.nodes('./*:MeasureGroups/*:MeasureGroup/*:Measures/*:Measure/*:Translations/*:Translation') N24(C)
				UNION ALL
					SELECT DISTINCT
						ObjectType = 'cube',
						N25.C.value('(./*:ID[1])','nvarchar(max)') as ObjectID,
						N26.C.value('(./*:Language[1])','nvarchar(max)') as LanguageID	
					FROM #XMLFile
						CROSS APPLY XMLData.nodes('/*:Cube') N25(C)
						CROSS APPLY N25.C.nodes('./*:MdxScripts/*:MdxScript/*:CalculationProperties/*:CalculationProperty/*:Translations/*:Translation') N26(C) 
				) as tmp

		--Insert data into ProjectPartTranslation
		INSERT INTO [setup].[ProjectPartTranslation] (ObjectType, ObjectID, ObjectPartType, ObjectPartID, LanguageID, NameTranslation, DescriptionTranslation, DisplayFolderTranslation)
			SELECT DISTINCT 
				ObjectType,
				ObjectID,
				ObjectPartType,
				ObjectPartID,
				LanguageID,
				NameTranslation,
				DescriptionTranslation,
				DisplayFolderTranslation
			FROM (
				SELECT DISTINCT
					ObjectType = 'cube',
					N27.C.value('(./*:ID[1])','nvarchar(max)') as ObjectID,
					ObjectPartType = 'Cube',
					N27.C.value('(./*:ID[1])','nvarchar(max)') as ObjectPartID,
					N28.C.value('(./*:Language[1])','nvarchar(max)') as LanguageID,
					ISNULL(N28.C.value('(./*:Caption[1])','nvarchar(max)'),'') as NameTranslation,
					ISNULL(N28.C.value('(./*:Description[1])','nvarchar(max)'),'') as DescriptionTranslation,
					DisplayFolderTranslation = ''			
				FROM #XMLFile
					CROSS APPLY XMLData.nodes('/*:Cube') N27(C)
					CROSS APPLY N27.C.nodes('./*:Translations/*:Translation') N28(C)
				UNION ALL
					SELECT DISTINCT
						ObjectType = 'cube',
						N29.C.value('(./*:ID[1])','nvarchar(max)') as ObjectID,
						ObjectPartType = 'CubeDim',
						N30.C.value('(./*:ID[1])','nvarchar(max)') as ObjectPartID,
						N31.C.value('(./*:Language[1])','nvarchar(max)') as LanguageID,
						ISNULL(N31.C.value('(./*:Caption[1])','nvarchar(max)'),'') as NameTranslation,
						ISNULL(N31.C.value('(./*:Description[1])','nvarchar(max)'),'') as DescriptionTranslation,
						DisplayFolderTranslation = ''	
					FROM #XMLFile
						CROSS APPLY XMLData.nodes('/*:Cube') N29(C)
						CROSS APPLY N29.C.nodes('./*:Dimensions/*:Dimension') N30(C)
						CROSS APPLY N30.C.nodes('./*:Translations/*:Translation') N31(C)
				UNION ALL
					SELECT DISTINCT
						ObjectType = 'cube',
						N32.C.value('(./*:ID[1])','nvarchar(max)') as ObjectID,
						ObjectPartType = 'CubeMeasureGroup',
						N33.C.value('(./*:ID[1])','nvarchar(max)') as ObjectPartID,
						N34.C.value('(./*:Language[1])','nvarchar(max)') as LanguageID,
						ISNULL(N34.C.value('(./*:Caption[1])','nvarchar(max)'),'') as NameTranslation,
						ISNULL(N34.C.value('(./*:Description[1])','nvarchar(max)'),'') as DescriptionTranslation,
						DisplayFolderTranslation = ''	
					FROM #XMLFile
						CROSS APPLY XMLData.nodes('/*:Cube') N32(C)
						CROSS APPLY N32.C.nodes('./*:MeasureGroups/*:MeasureGroup') N33(C)
						CROSS APPLY N33.C.nodes('./*:Translations/*:Translation') N34(C)
				UNION ALL
					SELECT DISTINCT
						ObjectType = 'cube',
						N35.C.value('(./*:ID[1])','nvarchar(max)') as ObjectID,
						ObjectPartType = 'CubeMeasure',
						N36.C.value('(./*:ID[1])','nvarchar(max)') as ObjectPartID,
						N37.C.value('(./*:Language[1])','nvarchar(max)') as LanguageID,
						ISNULL(N37.C.value('(./*:Caption[1])','nvarchar(max)'),'') as NameTranslation,
						ISNULL(N37.C.value('(./*:Description[1])','nvarchar(max)'),'') as DescriptionTranslation,
						ISNULL(N37.C.value('(./*:DisplayFolder[1])','nvarchar(max)'),'') as DisplayFolderTranslation
					FROM #XMLFile
						CROSS APPLY XMLData.nodes('/*:Cube') N35(C)
						CROSS APPLY N35.C.nodes('./*:MeasureGroups/*:MeasureGroup/*:Measures/*:Measure') N36(C)
						CROSS APPLY N36.C.nodes('./*:Translations/*:Translation') N37(C)
				UNION ALL
					SELECT DISTINCT
						ObjectType = 'cube',
						N38.C.value('(./*:ID[1])','nvarchar(max)') as ObjectID,
						ObjectPartType = 'CubeMeasure',
						CONCAT(' ',REPLACE(REPLACE(N39.C.value('(./*:CalculationReference[1])','nvarchar(max)'), '[Measures].[', ''), ']' , '')) as ObjectPartID,
						N40.C.value('(./*:Language[1])','nvarchar(max)') as LanguageID,
						ISNULL(N40.C.value('(./*:Caption[1])','nvarchar(max)'),'') as NameTranslation,
						ISNULL(N40.C.value('(./*:Description[1])','nvarchar(max)'),'') as DescriptionTranslation,
						ISNULL(N40.C.value('(./*:DisplayFolder[1])','nvarchar(max)'),'') as DisplayFolderTranslation
					FROM #XMLFile
						CROSS APPLY XMLData.nodes('/*:Cube') N38(C)
						CROSS APPLY N38.C.nodes('./*:MdxScripts/*:MdxScript/*:CalculationProperties/*:CalculationProperty') N39(C)
						CROSS APPLY N39.C.nodes('./*:Translations/*:Translation') N40(C) 
					WHERE
						N39.C.value('(./*:CalculationType[1])','nvarchar(max)') not like 'Set'
				UNION ALL
					SELECT DISTINCT
						ObjectType = 'cube',
						N41.C.value('(./*:ID[1])','nvarchar(max)') as ObjectID,
						ObjectPartType = 'CubeSet',
						REPLACE(REPLACE(N42.C.value('(./*:CalculationReference[1])','nvarchar(max)'), '[Measures].[', ''), ']' , '') as ObjectPartID,
						N43.C.value('(./*:Language[1])','nvarchar(max)') as LanguageID,
						ISNULL(N43.C.value('(./*:Caption[1])','nvarchar(max)'),'') as NameTranslation,
						ISNULL(N43.C.value('(./*:Description[1])','nvarchar(max)'),'') as DescriptionTranslation,
						ISNULL(N43.C.value('(./*:DisplayFolder[1])','nvarchar(max)'),'') as DisplayFolderTranslation
					FROM #XMLFile
						CROSS APPLY XMLData.nodes('/*:Cube') N41(C)
						CROSS APPLY N41.C.nodes('./*:MdxScripts/*:MdxScript/*:CalculationProperties/*:CalculationProperty') N42(C)
						CROSS APPLY N42.C.nodes('./*:Translations/*:Translation') N43(C) 
					WHERE
						N42.C.value('(./*:CalculationType[1])','nvarchar(max)') like 'Set'
				) as tmp

		DELETE FROM #XMLFile

		FETCH NEXT FROM CubeCursor INTO @CubeNameList
	END
	CLOSE CubeCursor
	DEALLOCATE CubeCursor

	IF OBJECT_ID('tempdb.dbo.#XMLFile', 'U') IS NOT NULL
		DROP TABLE #XMLFile

	SET @RowCount = @@ROWCOUNT
	SET @StoredProcedureName = OBJECT_NAME(@@PROCID)
	SET @LogEndDate = GETDATE()
	EXEC setup.InsertLog @StoredProcedureName, @LogStartDate, @LogEndDate, @RowCount, 0, 'Success'


GO
/****** Object:  StoredProcedure [setup].[Update_setup_ProjectCubeMeasure]    Script Date: 11.9.2017 10:30:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/******
	Procedure deletes and then inserts data into ProjectCubeMeasure, ProjectCubeMeasureTranslations and ProjectCubeTranslation.
	Data are extracted from xml definition of cubes. These definitions are located in XMLData column of setup.CubeDataXML table.
	Parameter of procedure allows to choose subset of cubes, for which are data updated.
******/

CREATE PROCEDURE [setup].[Update_setup_ProjectCubeMeasure] 
@CubeNameList nvarchar(max) = NULL
AS
	DECLARE
	@CubeID int,
	@CubeName nvarchar(max),
	@ExecString nvarchar(max),
	@StoredProcedureName nvarchar(max),
	@LogStartDate datetime,
	@LogEndDate datetime,
	@RowCount int

	IF OBJECT_ID('tempdb.dbo.#XMLFile', 'U') IS NULL
		CREATE TABLE #XMLFile(
			XMLData XML
		)

	SET @ExecString = N'
	DELETE FROM [setup].[ProjectCubeMeasure]'

	IF @CubeNameList IS NOT NULL
	SET @ExecString = @ExecString + ' WHERE CubeName IN (' + '''' + @CubeNameList + '''' +')'

	EXEC sp_executesql @ExecString
	
	PRINT('ProjectCubeMeasure deleted')

	SET @ExecString = N'
	DELETE FROM [setup].[ProjectCubeMeasureTranslation]'

	IF @CubeNameList IS NOT NULL
	SET @ExecString = @ExecString + ' WHERE CubeName IN (' + '''' + @CubeNameList + '''' +')'

	EXEC sp_executesql @ExecString
	
	PRINT('ProjectCubeMeasureTranslation deleted')

	SET @ExecString = N'
	DELETE FROM [setup].[ProjectCubeTranslation]'

	IF @CubeNameList IS NOT NULL
	SET @ExecString = @ExecString + ' WHERE CubeName IN (' + '''' + @CubeNameList + '''' +')'

	EXEC sp_executesql @ExecString

	PRINT('ProjectCubeTranslation deleted')

	SET @ExecString = N'
	DELETE FROM [setup].[ProjectCubeMeasureGroup]'

	IF @CubeNameList IS NOT NULL
	SET @ExecString = @ExecString + ' WHERE CubeName IN (' + '''' + @CubeNameList + '''' +')'

	EXEC sp_executesql @ExecString

	PRINT('ProjectCubeMeasureGroup deleted')

	--Cube Cursor

	SET @ExecString = N'
	DECLARE CubeCursor CURSOR FOR
		SELECT 
			CubeID,
			CubeName
		FROM 
			setup.[Cube]'

	IF @CubeNameList IS NOT NULL
	SET @ExecString = @ExecString + ' WHERE CubeName IN (' + '''' + @CubeNameList + '''' +')'

	EXEC sp_executesql @ExecString

	SET @ExecString = N''

	OPEN CubeCursor
	SET NOCOUNT ON

	-- Loop through XML definition of cubes
	FETCH NEXT FROM CubeCursor INTO @CubeID, @CubeName

	WHILE @@FETCH_STATUS = 0 
	BEGIN
		SET @ExecString = N'
		INSERT INTO #XMLFile
		SELECT XMLData
		FROM setup.CubeDataXML
		WHERE CubeName =' + '''' +  @CubeName + ''''

		EXEC sp_executesql @ExecString

		PRINT('ProjectCubeMeasure inserting') 
		INSERT INTO [setup].[ProjectCubeMeasure]
			SELECT DISTINCT
				@CubeName AS CubeName,
				N2.C.value('(./*:Name[1])','nvarchar(max)') as MeasureName,
				IsCalculated = 0,
				ISNULL(N1.C.value('(./*:ID[1])','nvarchar(max)'), ''),
				ISNULL(N2.C.value('(./*:DisplayFolder[1])','nvarchar(max)'),'') as DisplayFolder		
			FROM #XMLFile
				CROSS APPLY XMLData.nodes('/*:Cube/*:MeasureGroups/*:MeasureGroup') N1(C)
				CROSS APPLY N1.C.nodes('./*:Measures/*:Measure') N2(C)
			UNION ALL
				SELECT DISTINCT
					@CubeName AS CubeName,
					REPLACE(REPLACE(N3.C.value('(./*:CalculationReference[1])','nvarchar(max)'), '[Measures].[', ''), ']' , '') as MeasureName,
					IsCalculated = 1,
					ISNULL(N3.C.value('(./*:AssociatedMeasureGroupID[1])','nvarchar(max)'),''),
					ISNULL(N3.C.value('(./*:DisplayFolder[1])','nvarchar(max)'),'') as DisplayFolder		
				FROM #XMLFile 
				CROSS APPLY XMLData.nodes('/*:Cube/*:MdxScripts/*:MdxScript/*:CalculationProperties/*:CalculationProperty') N3(C)

		PRINT('ProjectCubeMeasure inserted') 

		PRINT('ProjectCubeMeasureTranslation inserting') 
		
		INSERT INTO [setup].[ProjectCubeMeasureTranslation]
			SELECT DISTINCT
				@CubeName AS CubeName,
				N5.C.value('(./*:Name[1])','nvarchar(max)') as MeasureName,
				N6.C.value('(./*:Language[1])','nvarchar(max)') as LanguageID,
				ISNULL(N6.C.value('(./*:Caption[1])','nvarchar(max)'),'') as MeasureNameTranslation,
				ISNULL(N6.C.value('(./*:DisplayFolder[1])','nvarchar(max)'),'') as DisplayFolderTranslation		
			FROM #XMLFile
				CROSS APPLY XMLData.nodes('/*:Cube/*:MeasureGroups/*:MeasureGroup') N4(C)
				CROSS APPLY N4.C.nodes('./*:Measures/*:Measure') N5(C)
				CROSS APPLY N5.C.nodes('./*:Translations/*:Translation') N6(C)
			UNION ALL
				SELECT DISTINCT
					@CubeName AS CubeName,
					REPLACE(REPLACE(N7.C.value('(./*:CalculationReference[1])','nvarchar(max)'), '[Measures].[', ''), ']' , '') as MeasureName,
					N8.C.value('(./*:Language[1])','nvarchar(max)') as LanguageID,
					ISNULL(N8.C.value('(./*:Caption[1])','nvarchar(max)'),'') as MeasureNameTranslation,
					ISNULL(N8.C.value('(./*:DisplayFolder[1])','nvarchar(max)'),'') as DisplayFolderTranslation	
				FROM #XMLFile 
				CROSS APPLY XMLData.nodes('/*:Cube/*:MdxScripts/*:MdxScript/*:CalculationProperties/*:CalculationProperty') N7(C)
				CROSS APPLY N7.C.nodes('./*:Translations/*:Translation') N8(C)

		PRINT('ProjectCubeMeasureTranslation inserted')
		
		PRINT('ProjectCubeTranslation inserting')  

		INSERT INTO [setup].[ProjectCubeTranslation]
			SELECT DISTINCT
				@CubeName AS CubeName,
				N9.C.value('(./*:Language[1])','nvarchar(max)') as LanguageID	
			FROM #XMLFile
			CROSS APPLY XMLData.nodes('/*:Cube/*:Translations/*:Translation') N9(C)	

		PRINT('ProjectCubeTranslation inserted') 

		INSERT INTO [setup].[ProjectCubeMeasureGroup]
			SELECT DISTINCT
				@CubeName AS CubeName,
				N10.C.value('(./*:ID[1])','nvarchar(max)') AS MeasureGroupID, 
				N10.C.value('(./*:Name[1])','nvarchar(max)') AS MeasureGroupName 	
			FROM #XMLFile
				CROSS APPLY XMLData.nodes('/*:Cube/*:MeasureGroups/*:MeasureGroup') N10(C)

		PRINT('ProjectCubeMeasureGroup inserted') 

		DELETE  FROM #XMLFile

		FETCH NEXT FROM CubeCursor INTO @CubeID, @CubeName
	END
	CLOSE CubeCursor
	DEALLOCATE CubeCursor

	IF OBJECT_ID('tempdb.dbo.#XMLFile', 'U') IS NOT NULL
		DROP TABLE #XMLFile

	SET @RowCount = @@ROWCOUNT
	SET @StoredProcedureName = OBJECT_NAME(@@PROCID)
	SET @LogEndDate = GETDATE()
	EXEC setup.InsertLog @StoredProcedureName, @LogStartDate, @LogEndDate, @RowCount, 0, 'Success'

GO
/****** Object:  StoredProcedure [setup].[Update_setup_ProjectData_All]    Script Date: 11.9.2017 10:30:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [setup].[Update_setup_ProjectData_All]
	@UpdateProjectDataXML bit = 0
AS
	IF @UpdateProjectDataXML = 1 EXEC [setup].[Update_setup_ProjectDataXML]
	EXEC [setup].[Update_setup_ProjectDimData]
	EXEC [setup].[Update_setup_ProjectCubeData]
	EXEC [setup].[Update_setup_ProjectDocUsage]

GO
/****** Object:  StoredProcedure [setup].[Update_setup_ProjectDataXML]    Script Date: 11.9.2017 10:30:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [setup].[Update_setup_ProjectDataXML] AS
	DECLARE
		@CubeNameList nvarchar(max),
		@DimensionNameList nvarchar(max),
		@Path nvarchar(max), 
		@ExecString nvarchar(max),
		@StoredProcedureName nvarchar(max),
		@LogStartDate datetime,
		@LogEndDate datetime,
		@RowCount int

		BEGIN TRY
			BEGIN TRANSACTION

				DELETE FROM setup.ProjectDataXML

				SET @Path = '''' + (SELECT OLAPProjectPath FROM setup.Instance) + '\' + (SELECT OLAPProjectFile FROM setup.Instance) + ''''
				SET @ExecString = N'
					INSERT INTO setup.ProjectDataXML (FileType, FileName, XMLData)
					SELECT 
						''dwproj'',
						' + '''' + (SELECT OLAPProjectFile FROM setup.Instance) + '''' + ' ,
						CONVERT(XML, BulkColumn) AS BulkColumn
					FROM OPENROWSET(BULK ' + @Path + ' , SINGLE_BLOB) AS x;'

				EXEC sp_executesql @ExecString

				IF OBJECT_ID('tempdb.dbo.#XMLFile', 'U') IS NULL
					CREATE TABLE #XMLFile(
						XMLData XML
					)

				SET @ExecString = N'
					INSERT INTO #XMLFile
					SELECT XMLData
					FROM setup.ProjectDataXML
					WHERE FileName =' + '''' +  (SELECT OLAPProjectFile FROM setup.Instance) + ''''

					EXEC sp_executesql @ExecString
	
				DECLARE CubeCursor CURSOR FOR
					SELECT DISTINCT
							SUBSTRING(N1.C.value('(./*:FullPath[1])','nvarchar(max)'),1,LEN(N1.C.value('(./*:FullPath[1])','nvarchar(max)'))-5) as CubeName
						FROM #XMLFile
							CROSS APPLY XMLData.nodes('/*:Project/*:Cubes/*:ProjectItem') N1(C)
		
				OPEN CubeCursor
				SET NOCOUNT ON

				-- Loop for import Cube files
				FETCH NEXT FROM CubeCursor INTO @CubeNameList

				WHILE @@FETCH_STATUS = 0 
				BEGIN
					--Path to XML Cube file
					SET @Path = '''' + (SELECT OLAPProjectPath FROM setup.Instance) + '\' + @CubeNameList + '.cube'''

					SET @ExecString = N'
					INSERT INTO setup.ProjectDataXML (FileType, FileName, XMLData)
					SELECT 
						''cube'',
						' + '''' + @CubeNameList + '''' + ' ,
						CONVERT(XML, BulkColumn) AS BulkColumn
					FROM OPENROWSET(BULK ' + @Path + ' , SINGLE_BLOB) AS x;'

					EXEC sp_executesql @ExecString

					PRINT(@CubeNameList + ' insterted')

					FETCH NEXT FROM CubeCursor INTO @CubeNameList
				END
				CLOSE CubeCursor
				DEALLOCATE CubeCursor

	
				DECLARE DimensionCursor CURSOR FOR
					SELECT DISTINCT
							SUBSTRING(N2.C.value('(./*:FullPath[1])','nvarchar(max)'),1,LEN(N2.C.value('(./*:FullPath[1])','nvarchar(max)'))-4) as DimensionName
						FROM #XMLFile
							CROSS APPLY XMLData.nodes('/*:Project/*:Dimensions/*:ProjectItem') N2(C)
		
		
				OPEN DimensionCursor
				SET NOCOUNT ON

				-- Loop for import Dimension files
				FETCH NEXT FROM DimensionCursor INTO @DimensionNameList

				WHILE @@FETCH_STATUS = 0 
				BEGIN
					--Path to XML Dimension file
					SET @Path = '''' + (SELECT OLAPProjectPath FROM setup.Instance) + '\' + @DimensionNameList + '.dim'''

					SET @ExecString = N'
					INSERT INTO setup.ProjectDataXML (FileType, FileName, XMLData)
					SELECT 
						''dim'',
						' + '''' + @DimensionNameList + '''' + ' ,
						CONVERT(XML, BulkColumn) AS BulkColumn
					FROM OPENROWSET(BULK ' + @Path + ' , SINGLE_BLOB) AS x;'

					EXEC sp_executesql @ExecString

					PRINT(@DimensionNameList + ' insterted')

					FETCH NEXT FROM DimensionCursor INTO @DimensionNameList
				END
				CLOSE DimensionCursor
				DEALLOCATE DimensionCursor

				IF OBJECT_ID('tempdb.dbo.#XMLFile', 'U') IS NOT NULL
				DROP TABLE #XMLFile

			COMMIT TRANSACTION
		END TRY

		BEGIN CATCH
			DECLARE @ErrorMessage nvarchar(max);
			DECLARE @ErrorSeverity int;
			DECLARE @ErrorState int;

			SELECT
				@ErrorMessage = ERROR_MESSAGE(),
				@ErrorSeverity = ERROR_SEVERITY(),
				@ErrorState = ERROR_STATE()

			RAISERROR (
				@ErrorMessage, 
                @ErrorSeverity, 
                @ErrorState )

			PRINT ('The file ' + '''' + @Path + '''' + 'could not be opened. The file does not exists or you do not have appropriate permissions.')

			ROLLBACK TRANSACTION
		END CATCH

	SET @RowCount = @@ROWCOUNT
	SET @StoredProcedureName = OBJECT_NAME(@@PROCID)
	SET @LogEndDate = GETDATE()
	EXEC setup.InsertLog @StoredProcedureName, @LogStartDate, @LogEndDate, @RowCount, 0, 'Success'


GO
/****** Object:  StoredProcedure [setup].[Update_setup_ProjectDimData]    Script Date: 11.9.2017 10:30:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [setup].[Update_setup_ProjectDimData] 
AS
	DECLARE
	@DimNameList nvarchar(max),
	@ExecString nvarchar(max),
	@StoredProcedureName nvarchar(max),
	@LogStartDate datetime,
	@LogEndDate datetime,
	@RowCount int

	IF OBJECT_ID('tempdb.dbo.#XMLFile', 'U') IS NULL
		CREATE TABLE #XMLFile(
			XMLData XML
		)

	DELETE FROM [setup].[ProjectDim]
	WHERE DimID <> ''

	DELETE FROM [setup].[ProjectDim_Hierarchy]
	WHERE DimID <> ''

	DELETE FROM [setup].[ProjectDim_HierarchyLevel]
	WHERE DimID <> ''

	DELETE FROM [setup].[ProjectDim_Attribute]
	WHERE DimID <> ''

	DELETE FROM [setup].[ProjectDim_AttributeRelationship]
	WHERE DimID <> ''

	DELETE FROM [setup].[ProjectLanguage]
	WHERE 
		ObjectType = 'dim' AND
		ObjectID <> ''

	DELETE FROM [setup].[ProjectPartTranslation]
	WHERE 
		ObjectType = 'dim' AND
		ObjectID <> ''

	--Dimension Cursor

	DECLARE DimensionCursor CURSOR FOR
		SELECT 
			FileName
		FROM 
			setup.ProjectDataXML
		WHERE 
			FileType ='dim' 

	OPEN DimensionCursor
	SET NOCOUNT ON

	-- Loop through XML definition of dimension
	FETCH NEXT FROM DimensionCursor INTO @DimNameList

	WHILE @@FETCH_STATUS = 0 
	BEGIN
		SET @ExecString = N'
		INSERT INTO #XMLFile
		SELECT XMLData
		FROM setup.ProjectDataXML
		WHERE FileName =' + '''' +  @DimNameList + ''''

		EXEC sp_executesql @ExecString

		--Insert data into ProjectDim table

		INSERT INTO [setup].[ProjectDim] (DimID, Name, Description)
			SELECT DISTINCT
				N1.C.value('(./*:ID[1])','nvarchar(max)') as DimID,
				N1.C.value('(./*:Name[1])','nvarchar(max)') as Name,
				ISNULL(N1.C.value('(./*:Description[1])','nvarchar(max)'),'') as Description				
			FROM #XMLFile
				CROSS APPLY XMLData.nodes('/*:Dimension') N1(C)

		--Insert data into ProjectDim_Hierarchy

		INSERT INTO [setup].[ProjectDim_Hierarchy] (DimID, HierarchyID, Name, Description, DisplayFolder)
			SELECT DISTINCT
				N2.C.value('(./*:ID[1])','nvarchar(max)') as DimID,
				N3.C.value('(./*:ID[1])','nvarchar(max)') as HierarchyID,
				N3.C.value('(./*:Name[1])','nvarchar(max)') as Name,
				ISNULL(N3.C.value('(./*:Description[1])','nvarchar(max)'),'') as Description,
				ISNULL(N3.C.value('(./*:DisplayFolder[1])','nvarchar(max)'),'') as DisplayFolder				
			FROM #XMLFile
				CROSS APPLY XMLData.nodes('/*:Dimension') N2(C)
				CROSS APPLY N2.C.nodes('./*:Hierarchies/*:Hierarchy') N3(C)

		--Insert data into ProjectDim_HierarchyLevel

		INSERT INTO [setup].[ProjectDim_HierarchyLevel] (DimID, HierarchyID, HierarchyLevelNo, AttributeID, Name, Description)
			SELECT
				N4.C.value('(./*:ID[1])','nvarchar(max)') as DimID,
				N5.C.value('(./*:ID[1])','nvarchar(max)') as HierarchyID,
				ROW_NUMBER() OVER(PARTITION BY N5.C.value('(./*:ID[1])','nvarchar(max)') ORDER BY (SELECT NULL)) as HierarchyLevelNo,
				N6.C.value('(./*:SourceAttributeID[1])','nvarchar(max)') as AttributeID,
				N6.C.value('(./*:Name[1])','nvarchar(max)') as Name,
				ISNULL(N6.C.value('(./*:Description[1])','nvarchar(max)'),'') as Description
			FROM #XMLFile
				CROSS APPLY XMLData.nodes('/*:Dimension') N4(C)
				CROSS APPLY N4.C.nodes('./*:Hierarchies/*:Hierarchy') N5(C)
			    CROSS APPLY N5.C.nodes('./*:Levels/*:Level') N6(C)		
		
		--Insert data into ProjectDim_AttributeRelationship

		INSERT INTO [setup].[ProjectDim_AttributeRelationship] (DimID, SourceAttributeID, AttributeID)
		SELECT DISTINCT
				N7.C.value('(./*:ID[1])','nvarchar(max)') as DimID,
				N8.C.value('(./*:ID[1])','nvarchar(max)') as SourceAttributeID,
				N9.C.value('(./*:AttributeID[1])','nvarchar(max)') as AttributeID					
			FROM #XMLFile
				CROSS APPLY XMLData.nodes('/*:Dimension') N7(C)
				CROSS APPLY N7.C.nodes('./*:Attributes/*:Attribute') N8(C)
				CROSS APPLY N8.C.nodes('./*:AttributeRelationships/*:AttributeRelationship') N9(C)

		--Insert data into ProjectDim_Attribute

		INSERT INTO [setup].[ProjectDim_Attribute] (DimID, AttributeID, Name, Description, DisplayFolder, HierarchyEnabled, HierarchyVisible, SourceKeyTable, SourceKeyColumn, SourceNameTable, SourceNameColumn)
			SELECT DISTINCT
				N10.C.value('(./*:ID[1])','nvarchar(max)') as DimID,
				N11.C.value('(./*:ID[1])','nvarchar(max)') as AttributeID,
				N11.C.value('(./*:Name[1])','nvarchar(max)') as Name,
				ISNULL(N11.C.value('(./*:Description[1])','nvarchar(max)'),'') as Description,
				ISNULL(N11.C.value('(./*:AttributeHierarchyDisplayFolder[1])','nvarchar(max)'),'') as DisplayFolder,
				ISNULL(N11.C.value('(./*:AttributeHierarchyEnabled[1])','bit'),1) as HierarchyEnabled,
				ISNULL(N11.C.value('(./*:AttributeHierarchyVisible[1])','bit'),1) as HierarchyVisible,
				N12.C.value('(./*:TableID[1])','nvarchar(max)') as SourceKeyTable,
				N12.C.value('(./*:ColumnID[1])','nvarchar(max)') as SourceKeyColumn,
				N13.C.value('(./*:TableID[1])','nvarchar(max)') as SourceNameTable,
				N13.C.value('(./*:ColumnID[1])','nvarchar(max)') as SourceNameColumn		
			FROM #XMLFile
				CROSS APPLY XMLData.nodes('/*:Dimension') N10(C)
				CROSS APPLY N10.C.nodes('./*:Attributes/*:Attribute') N11(C)
				CROSS APPLY N11.C.nodes('./*:KeyColumns/*:KeyColumn[1]/*:Source') N12(C)
				CROSS APPLY N11.C.nodes('./*:NameColumn/*:Source') N13(C)

		--Insert data into ProjectLanguage

		INSERT INTO [setup].[ProjectLanguage] (ObjectType, ObjectID, LanguageID)
			SELECT DISTINCT 
				ObjectType,
				CubeID,
				LanguageID
			FROM (
				SELECT DISTINCT
					ObjectType = 'dim',
					N14.C.value('(./*:ID[1])','nvarchar(max)') as CubeID,
					N15.C.value('(./*:Language[1])','nvarchar(max)') as LanguageID					
				FROM #XMLFile
					CROSS APPLY XMLData.nodes('/*:Dimension') N14(C)
					CROSS APPLY N14.C.nodes('./*:Translations/*:Translation') N15(C)
				UNION ALL
					SELECT DISTINCT
						ObjectType = 'dim',
						N16.C.value('(./*:ID[1])','nvarchar(max)') as ObjectID,
						N17.C.value('(./*:Language[1])','nvarchar(max)') as LanguageID	
					FROM #XMLFile
						CROSS APPLY XMLData.nodes('/*:Dimension') N16(C)
						CROSS APPLY N16.C.nodes('./*:Attributes/*:Attribute/*:Translations/*:Translation') N17(C)
				UNION ALL
					SELECT DISTINCT
						ObjectType = 'dim',
						N18.C.value('(./*:ID[1])','nvarchar(max)') as ObjectID,
						N19.C.value('(./*:Language[1])','nvarchar(max)') as LanguageID	
					FROM #XMLFile
						CROSS APPLY XMLData.nodes('/*:Dimension') N18(C)
						CROSS APPLY N18.C.nodes('./*:Hierarchies/*:Hierarchy/*:Translations/*:Translation') N19(C)
				UNION ALL
					SELECT DISTINCT
						ObjectType = 'dim',
						N20.C.value('(./*:ID[1])','nvarchar(max)') as ObjectID,
						N21.C.value('(./*:Language[1])','nvarchar(max)') as LanguageID	
					FROM #XMLFile
						CROSS APPLY XMLData.nodes('/*:Dimension') N20(C)
						CROSS APPLY N20.C.nodes('./*:Hierarchies/*:Hierarchy/*:Levels/*:Level/*:Translations/*:Translation') N21(C)				
			) as tmp

		--Insert data into ProjectPartTranslation
		
		INSERT INTO [setup].[ProjectPartTranslation] (ObjectType, ObjectID, ObjectPartType, ObjectPartID, ObjectPartNo, LanguageID, NameTranslation, DescriptionTranslation, DisplayFolderTranslation)
			SELECT DISTINCT 
				ObjectType,
				ObjectID,
				ObjectPartType,
				ObjectPartID,
				ObjectPartNo,
				LanguageID,
				NameTranslation,
				DescriptionTranslation,
				DisplayFolderTranslation
			FROM (
				SELECT DISTINCT
					ObjectType = 'dim',
					N22.C.value('(./*:ID[1])','nvarchar(max)') as ObjectID,
					ObjectPartType = 'Dim',
					N22.C.value('(./*:ID[1])','nvarchar(max)') as ObjectPartID,
					ObjectPartNo = 0,
					N23.C.value('(./*:Language[1])','nvarchar(max)') as LanguageID,
					ISNULL(N23.C.value('(./*:Caption[1])','nvarchar(max)'),'') as NameTranslation,
					ISNULL(N23.C.value('(./*:Description[1])','nvarchar(max)'),'') as DescriptionTranslation,
					DisplayFolderTranslation = ''			
				FROM #XMLFile
					CROSS APPLY XMLData.nodes('/*:Dimension') N22(C)
					CROSS APPLY N22.C.nodes('./*:Translations/*:Translation') N23(C)
				UNION ALL
					SELECT DISTINCT
						ObjectType = 'dim',
						N24.C.value('(./*:ID[1])','nvarchar(max)') as ObjectID,
						ObjectPartType = 'DimAttribute',
						N25.C.value('(./*:ID[1])','nvarchar(max)') as ObjectPartID,
						ObjectPartNo = 0,
						N26.C.value('(./*:Language[1])','nvarchar(max)') as LanguageID,
						ISNULL(N26.C.value('(./*:Caption[1])','nvarchar(max)'),'') as NameTranslation,
						ISNULL(N26.C.value('(./*:Description[1])','nvarchar(max)'),'') as DescriptionTranslation,
						ISNULL(N26.C.value('(./*:DisplayFolder[1])','nvarchar(max)'),'') as DisplayFolderTranslation	
					FROM #XMLFile
						CROSS APPLY XMLData.nodes('/*:Dimension') N24(C)
						CROSS APPLY N24.C.nodes('./*:Attributes/*:Attribute') N25(C)
						CROSS APPLY N25.C.nodes('./*:Translations/*:Translation') N26(C)
				UNION ALL
					SELECT DISTINCT
						ObjectType = 'dim',
						N27.C.value('(./*:ID[1])','nvarchar(max)') as ObjectID,
						ObjectPartType = 'DimHierarchy',
						N28.C.value('(./*:ID[1])','nvarchar(max)') as ObjectPartID,
						ObjectPartNo = 0,
						N29.C.value('(./*:Language[1])','nvarchar(max)') as LanguageID,
						ISNULL(N29.C.value('(./*:Caption[1])','nvarchar(max)'),'') as NameTranslation,
						ISNULL(N29.C.value('(./*:Description[1])','nvarchar(max)'),'') as DescriptionTranslation,
						ISNULL(N29.C.value('(./*:DisplayFolder[1])','nvarchar(max)'),'') as DisplayFolderTranslation	
					FROM #XMLFile
						CROSS APPLY XMLData.nodes('/*:Dimension') N27(C)
						CROSS APPLY N27.C.nodes('./*:Hierarchies/*:Hierarchy') N28(C)
						CROSS APPLY N28.C.nodes('./*:Translations/*:Translation') N29(C)
				UNION ALL
					SELECT DISTINCT
						ObjectType = 'dim',
						N30.C.value('(./*:ID[1])','nvarchar(max)') as ObjectID,
						ObjectPartType = 'DimHierarchyLevel',
						N31.C.value('(./*:ID[1])','nvarchar(max)') as ObjectPartID,
					    a.HierarchyLevelNo as ObjectPartNo,
						N33.C.value('(./*:Language[1])','nvarchar(max)') as LanguageID,
						ISNULL(N33.C.value('(./*:Caption[1])','nvarchar(max)'),'') as NameTranslation,
						ISNULL(N33.C.value('(./*:Description[1])','nvarchar(max)'),'') as DescriptionTranslation,
						DisplayFolderTranslation = ''
					FROM #XMLFile
						CROSS APPLY XMLData.nodes('/*:Dimension') N30(C)
						CROSS APPLY N30.C.nodes('./*:Hierarchies/*:Hierarchy') N31(C)
						CROSS APPLY N31.C.nodes('./*:Levels/*:Level') N32(C)
						CROSS APPLY N32.C.nodes('./*:Translations/*:Translation') N33(C)
						LEFT OUTER JOIN ProjectDim_HierarchyLevel a
						ON a.DimID = N30.C.value('(./*:ID[1])','nvarchar(max)') AND
						 a.HierarchyID = N31.C.value('(./*:ID[1])','nvarchar(max)') AND 
						 a.AttributeID = N32.C.value('(./*:SourceAttributeID[1])','nvarchar(max)')
				) as tmp		

		DELETE FROM #XMLFile

		FETCH NEXT FROM DimensionCursor INTO @DimNameList
	END
	CLOSE DimensionCursor
	DEALLOCATE DimensionCursor

	IF OBJECT_ID('tempdb.dbo.#XMLFile', 'U') IS NOT NULL
		DROP TABLE #XMLFile


	SET @RowCount = @@ROWCOUNT
	SET @StoredProcedureName = OBJECT_NAME(@@PROCID)
	SET @LogEndDate = GETDATE()
	EXEC setup.InsertLog @StoredProcedureName, @LogStartDate, @LogEndDate, @RowCount, 0, 'Success'




GO
/****** Object:  StoredProcedure [setup].[Update_setup_ProjectDocUsage]    Script Date: 11.9.2017 10:30:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [setup].[Update_setup_ProjectDocUsage]
AS
	
	-- DOCASNE RESENI BEG
	UPDATE [setup].[ProjectCube_Measure] SET [Name] = LTRIM([Name])
	UPDATE [setup].[ProjectCube_Set] SET [IsDynamic] = 1 WHERE [CubeID] > ''
	UPDATE [setup].[ProjectCube_Measure] SET [Visible] = CASE WHEN LEFT(LTRIM([Name]), 1) = 'h' OR LEFT(LTRIM([Name]), 9) = 'Initial h' THEN 0 ELSE 1 END WHERE [CubeID] > '' AND [IsCalculated] = 1
	-- DOCASNE RESENI END
	
	DECLARE
		@ExecString nvarchar(max),
		@ACYMeasureNameEnd nvarchar(max),
		@TCMeasureNameEnd nvarchar(max)
	UPDATE [setup].[ProjectCube_Measure] SET [IsACY] = 0, [IsTimeComp] = 0, [DocUsage] = 0
	SELECT @ACYMeasureNameEnd = NULLIF(RTRIM([ACYMeasureNameEnd]), ''), @TCMeasureNameEnd =  NULLIF(RTRIM([TimeCompMeasureNameEnd]), '') FROM [setup].[Instance]
	SET @ACYMeasureNameEnd = REPLACE(REPLACE(@ACYMeasureNameEnd, '_', '[_]'), '^', '[^]')	-- Wildcard % [ ] for OLAP Name restricted
	SET @ACYMeasureNameEnd = '[Name] LIKE ''%' + REPLACE(@ACYMeasureNameEnd, ',', ''' OR [Name] LIKE ''%') + ''''
	IF @ACYMeasureNameEnd IS NOT NULL
	BEGIN
		SET @ExecString = 'UPDATE [setup].[ProjectCube_Measure] SET [IsACY] = 1 WHERE ' + @ACYMeasureNameEnd
		EXEC sp_executesql	@stmt = @ExecString
	END
	SET @TCMeasureNameEnd = REPLACE(REPLACE(@TCMeasureNameEnd, '_', '[_]'), '^', '[^]')
	SET @TCMeasureNameEnd = '[Name] LIKE ''%' + REPLACE(@TCMeasureNameEnd, ',', ''' OR [Name] LIKE ''%') + ''''
	IF @TCMeasureNameEnd IS NOT NULL
	BEGIN
		SET @ExecString = 'UPDATE [setup].[ProjectCube_Measure] SET [IsTimeComp] = 1 WHERE ' + @TCMeasureNameEnd
		EXEC sp_executesql	@stmt = @ExecString
	END
	UPDATE [setup].[ProjectCube_Measure] SET [DocUsage] = 1
	WHERE
		[Visible] = 1 AND ( [CubeID] = '' OR [IsACY] = 0 AND ([IsTimeComp] = 0 OR RIGHT([Name], 14) = ' different Y-1')) AND
		( SELECT COUNT(*) FROM [setup].[ProjectCube] a WHERE a.[Visible] = 1 AND [setup].[ProjectCube_Measure].[CubeID] = a.[CubeID] ) > 0

	UPDATE [setup].[ProjectCube_MeasureGroup] SET [DocUsage] = 0
	UPDATE [setup].[ProjectCube_MeasureGroup] SET [DocUsage] = 1
	WHERE
		( SELECT COUNT(*) FROM [setup].[ProjectCube_Measure] a WHERE a.[DocUsage] = 1 AND [setup].[ProjectCube_MeasureGroup].[CubeID] = a.[CubeID] AND [setup].[ProjectCube_MeasureGroup].[MeasureGroupID] = a.[MeasureGroupID] ) > 0 AND
		( SELECT COUNT(*) FROM [setup].[ProjectCube] a WHERE a.[Visible] = 1 AND [setup].[ProjectCube_MeasureGroup].[CubeID] = a.[CubeID] ) > 0

	UPDATE [setup].[ProjectCube] SET [DocUsage] = 0
	UPDATE [setup].[ProjectCube] SET [DocUsage] = 1
	WHERE
		( SELECT COUNT(*) FROM [setup].[ProjectCube_MeasureGroup] a WHERE a.[DocUsage] = 1 AND [setup].[ProjectCube].[CubeID] = a.[CubeID] ) > 0

	UPDATE [setup].[ProjectCube_Set] SET [DocUsage] = 0
	UPDATE [setup].[ProjectCube_Set] SET [DocUsage] = 1
	WHERE
		[Visible] = 1 AND 
		( SELECT COUNT(*) FROM [setup].[ProjectCube] a WHERE a.[DocUsage] = 1 AND [setup].[ProjectCube_Set].[CubeID] = a.[CubeID] ) > 0

	UPDATE [setup].[ProjectCube_Dim] SET [DocUsage] = 0
	UPDATE [setup].[ProjectCube_Dim] SET [DocUsage] = 1
	WHERE
		[Visible] = 1 AND 
		( SELECT COUNT(*) FROM [setup].[ProjectCube] a WHERE a.[DocUsage] = 1 AND [setup].[ProjectCube_Dim].[CubeID] = a.[CubeID] ) > 0

	UPDATE [setup].[ProjectCube_DimUsage] SET [DocUsage] = 0
	UPDATE [setup].[ProjectCube_DimUsage] SET [DocUsage] = 1
	WHERE
		[RelationShipType] > '' AND
		( SELECT COUNT(*) FROM [setup].[ProjectCube_Dim] a WHERE a.[DocUsage] = 1 AND [setup].[ProjectCube_DimUsage].[CubeID] = a.[CubeID] AND [setup].[ProjectCube_DimUsage].[CubeDimID] = a.[CubeDimID] ) > 0

	UPDATE [setup].[ProjectDim] SET [DocUsage] = 0
	UPDATE [setup].[ProjectDim] SET [DocUsage] = 1
	WHERE
		( SELECT COUNT(*) FROM [setup].[ProjectCube_Dim] a WHERE a.[DocUsage] = 1 AND [setup].[ProjectDim].[DimID] = a.[DimID] ) > 0

	UPDATE [setup].[ProjectDim_Hierarchy] SET [DocUsage] = 0
	UPDATE [setup].[ProjectDim_Hierarchy] SET [DocUsage] = 1
	WHERE
		( SELECT COUNT(*) FROM [setup].[ProjectDim] a WHERE a.[DocUsage] = 1 AND [setup].[ProjectDim_Hierarchy].[DimID] = a.[DimID] ) > 0
	
	UPDATE [setup].[ProjectDim_HierarchyLevel] SET [DocUsage] = 0
	UPDATE [setup].[ProjectDim_HierarchyLevel] SET [DocUsage] = 1
	WHERE
		( SELECT COUNT(*) FROM [setup].[ProjectDim] a WHERE a.[DocUsage] = 1 AND [setup].[ProjectDim_HierarchyLevel].[DimID] = a.[DimID] ) > 0

	UPDATE [setup].[ProjectDim_Attribute] SET [DocUsage] = 0
	UPDATE [setup].[ProjectDim_Attribute] SET [DocUsage] = 1
	WHERE
		[HierarchyEnabled] = 1 AND	--attribute
		( SELECT COUNT(*) FROM [setup].[ProjectDim] a WHERE a.[DocUsage] = 1 AND [setup].[ProjectDim_Attribute].[DimID] = a.[DimID] ) > 0 AND
		( [HierarchyVisible] = 1  OR  ( SELECT COUNT(*) FROM [setup].[ProjectDim_HierarchyLevel] a WHERE [setup].[ProjectDim_Attribute].[DimID] = a.[DimID] AND [setup].[ProjectDim_Attribute].[AttributeID] = a.[AttributeID] ) > 0 )
	UPDATE [setup].[ProjectDim_Attribute] SET [DocUsage] = 1
	WHERE
		[HierarchyEnabled] = 0 AND	--property
		[HierarchyVisible] = 1 AND
		( SELECT COUNT(*)
			FROM [setup].[ProjectDim_AttributeRelationship] r
			INNER JOIN [setup].[ProjectDim_Attribute] a ON
			a.[DimID] = r.[DimID] AND a.[AttributeID] = r.[SourceAttributeID]
			WHERE r.[DimID] = [setup].[ProjectDim_Attribute].[DimID] AND r.[AttributeID] = [setup].[ProjectDim_Attribute].[AttributeID] AND a.[DocUsage] = 1 AND a.[HierarchyEnabled] = 1
		) > 0
	
	UPDATE [setup].[ProjectDim_AttributeRelationship] SET [DocUsage] = 0
	UPDATE [setup].[ProjectDim_AttributeRelationship] SET [DocUsage] = 1
	WHERE
		( SELECT COUNT(*) FROM [setup].[ProjectDim_Attribute] a WHERE a.[DocUsage] = 1 AND [setup].[ProjectDim_AttributeRelationship].[DimID] = a.[DimID] AND [setup].[ProjectDim_AttributeRelationship].[AttributeID] = a.[AttributeID] ) > 0 AND
		( SELECT COUNT(*) FROM [setup].[ProjectDim_Attribute] a WHERE a.[DocUsage] = 1 AND [setup].[ProjectDim_AttributeRelationship].[DimID] = a.[DimID] AND [setup].[ProjectDim_AttributeRelationship].[SourceAttributeID] = a.[AttributeID] ) > 0


GO
/****** Object:  StoredProcedure [setup].[Update_setup_RelationCube_DimFact]    Script Date: 11.9.2017 10:30:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/****** 
Procedure deletes and insert data into setup.RelationCube_DimFact table.
Procedure aims to listing relations between cubes of OLAP project and dim/fact tables.
Data are extracted from xml definition of cubes. 
These definitions are located in XMLData column of setup.ProjectDataXML table.
******/

CREATE PROCEDURE [setup].[Update_setup_RelationCube_DimFact] 
AS
	DECLARE
	@CubeID int,
	@CubeName nvarchar(max),
	@ExecString nvarchar(max),
	@StoredProcedureName nvarchar(max),
	@LogStartDate datetime,
	@LogEndDate datetime,
	@RowCount int

	DELETE b
	FROM setup.[Cube] a
	LEFT OUTER JOIN [RelationCube_DimFact] b 
	ON b.CubeID=a.CubeID
	WHERE a.ManualRelationSetup = 0

	IF OBJECT_ID('tempdb.dbo.#XMLFile', 'U') IS NULL
		CREATE TABLE #XMLFile(
			XMLData XML
		)

	DECLARE CubeCursor CURSOR FOR
		SELECT 
			CubeID,
			CubeName
		FROM 
			setup.[Cube]
		WHERE 
			ManualRelationSetup = 0

	OPEN CubeCursor
	SET NOCOUNT ON

	-- Loop through XML definition of cubes
	FETCH NEXT FROM CubeCursor INTO @CubeID, @CubeName

	WHILE @@FETCH_STATUS = 0 
	BEGIN
		SET @ExecString = N'
		INSERT INTO #XMLFile
		SELECT XMLData
		FROM setup.ProjectDataXML
		WHERE FileName =' + '''' +  @CubeName + ''''
		
		EXEC sp_executesql @ExecString

		INSERT INTO [RelationCube_DimFact] (CubeID, DimFactID)
		SELECT DISTINCT
			@CubeID AS CubeID,
			b.DimFactID
		FROM #XMLFile a
		CROSS APPLY XMLData.nodes('/*:Cube/*:Annotations/*:Annotation/*:Value/*:dds/*:ddscontrol/*:layoutobject/*:ddsxmlobj/*:property') N(C)
		LEFT OUTER JOIN DimFact b
		ON SUBSTRING(N.C.value('(@value)[1]', 'nvarchar(max)'),5,LEN(N.C.value('(@value)[1]', 'nvarchar(max)'))) = b.Name
		WHERE 
			--Only dim and fact tables
			LEFT(N.C.value('(@value)[1]', 'nvarchar(max)'),5) = 'dwh_d' OR 
			LEFT(N.C.value('(@value)[1]', 'nvarchar(max)'),5) = 'dwh_f'

		DELETE FROM #XMLFile

		FETCH NEXT FROM CubeCursor INTO @CubeID, @CubeName
	END
	CLOSE CubeCursor
	DEALLOCATE CubeCursor

	IF OBJECT_ID('tempdb.dbo.#XMLFile', 'U') IS NOT NULL
		DROP TABLE #XMLFile


	SET @RowCount = @@ROWCOUNT
	SET @StoredProcedureName = OBJECT_NAME(@@PROCID)
	SET @LogEndDate = GETDATE()
	EXEC setup.InsertLog @StoredProcedureName, @LogStartDate, @LogEndDate, @RowCount, 0, 'Success'











GO
/****** Object:  StoredProcedure [setup].[Update_setup_RelationStage_DimFact]    Script Date: 11.9.2017 10:30:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/******
Procedure deletes and insert data into setup.RelationStage_DimFact table.
Procedure aims to listing relations between dim/fact tables and stage tables.
Data are extracted from dependencies in Fill_ procedures.
Parameter of procedure allows to choose subset of dim/fact tables, for which are relations extracted.
******/

CREATE PROCEDURE [setup].[Update_setup_RelationStage_DimFact]
		@DimFactNameList nvarchar(max) = NULL
AS
	DECLARE
		@StoredProcedureName nvarchar(max),
		@LogStartDate datetime,
		@LogEndDate datetime,
		@RowCount int,
		@DimFactID int,
		@TableName nvarchar(50),
		@TableType nvarchar(10),
		@ExecString  nvarchar(max)
		
	SET @LogStartDate = GETDATE()
	SET @DimFactNameList = [help].[RemoveWhiteCharactersFromList] (@DimFactNameList)
	SET @DimFactNameList = '''' + REPLACE(@DimFactNameList, ',', ''',''') + ''''

	IF @DimFactNameList IS NULL DELETE FROM [setup].[RelationStage_DimFact]
	PRINT ''

	SET @ExecString = N'
	DECLARE TableCursor CURSOR FOR
		SELECT 
			a.[DimFactID],
			RTRIM(a.[Name]),
			RTRIM(a.[Type])
		FROM 
			[setup].[DimFact] a' +
	IIF(@DimFactNameList IS NULL, '', N'
		WHERE a.[Name] IN (' + @DimFactNameList + N')') + N'
		ORDER BY a.[Type], a.[Name]'
	EXEC sp_executesql	@stmt = @ExecString	--DECLARE TableCursor
	OPEN TableCursor
	SET NOCOUNT ON

	-- Loop through DimFact tables
	FETCH NEXT FROM TableCursor INTO @DimFactID, @TableName, @TableType
	
	WHILE @@FETCH_STATUS = 0 
	BEGIN
		IF @DimFactNameList IS NOT NULL
			DELETE FROM [setup].[RelationStage_DimFact] 
			WHERE [DimFactID] = @DimFactID;
		WITH DepTree (referenced_id, referenced_name, referenced_schema_name, referenced_type, referencing_id, referencing_name, referencing_schema_name, referencing_type, NestLevel)
		AS 
		(
			SELECT 
				o.[object_id] AS referenced_id, 
				o.name AS referenced_name,
				o.referenced_schema_name AS referenced_schema_name,
				o.type AS referenced_type,
				o.[object_id] AS referencing_id, 
				o.name AS referencing_name,
				o.referenced_schema_name AS referencing_schema_name,
				o.type AS referencing_type,
				0 AS NestLevel
			FROM  
				(				
					SELECT 
						--SCHEMA_NAME(s.schema_id) + '.' + s.name as SchemaWithName, 
						s.name,
						o.type,
						s.object_id, 
						SCHEMA_NAME(s.schema_id) as referenced_schema_name
						
					FROM 
						sys.procedures s
						INNER JOIN sys.objects o ON
							o.object_id = s.object_id
					WHERE
						SCHEMA_NAME(s.schema_id) = 'dwh') o 
			WHERE 
				o.name = 'Fill_' + @TableName
				   
			UNION ALL

			SELECT  
				d1.referenced_id AS referenced_id,  
				OBJECT_NAME( d1.referenced_id) AS referenced_name,
				d1.referenced_schema_name AS referenced_schema_name,
				o.type AS referenced_type,
				d1.referencing_id AS referencing_id, 
				OBJECT_NAME( d1.referencing_id) AS referencing_name,
				r.referenced_schema_name AS referencing_schema_name,
				r.referenced_type AS referencing_type,
				r.NestLevel + 1 AS NestLevel
			FROM 
				sys.sql_expression_dependencies d1
				INNER JOIN sys.objects o ON
					o.object_id = d1.referenced_id
				INNER JOIN DepTree r ON 
					r.referenced_id = d1.referencing_id
			WHERE
				(d1.referenced_schema_name = 'stage' OR 
				 d1.referenced_schema_name = 'help' AND
					(o.type <> 'U' OR r.referenced_schema_name <> 'help' OR  OBJECT_NAME(d1.referencing_id) <> 'Fill' + o.name) OR
				 d1.referenced_schema_name = 'dwh' AND
					-- excluded, when dwh.fill procedure depend on target dwh.table
					(o.type <> 'U' OR r.referenced_schema_name <> 'dwh' OR r.referenced_type <> 'P' OR OBJECT_NAME(d1.referencing_id) <> 'Fill_' + o.name) AND
					-- excluded, when stage view depend (by IncrementalUpdate) on dwh.table
					(r.referenced_type <> 'V' OR  r.referenced_schema_name <> 'stage' OR o.Type <> 'U') AND
					-- view dwh.xxxStateDate excluded
					(RIGHT(OBJECT_NAME( d1.referenced_id), 9) <> 'StateDate')			  
				) AND
				-- records with the same referenced and referencing object excluded
				d1.referenced_id <> d1.referencing_id AND
				r.NestLevel <= 15

			UNION ALL

			SELECT  
				d1.referencing_id AS referenced_id,  
				OBJECT_NAME(d1.referencing_id) AS referenced_name,
				s.name AS referenced_schema_name,
				o.type AS referenced_type,
				d1.referenced_id AS referencing_id, 
				OBJECT_NAME( d1.referenced_id) AS referencing_name, 
				r.referenced_schema_name AS referencing_schema_name,
				r.referenced_type AS referencing_type,
				r.NestLevel + 1 AS NestLevel
			FROM 
				sys.sql_expression_dependencies d1
				INNER JOIN sys.objects o ON
					o.object_id = d1.referencing_id AND
					o.type = 'P'
				INNER JOIN sys.schemas s ON
					s.schema_id = o.schema_id AND
					s.name = d1.referenced_schema_name AND
					(s.name = 'dwh' AND o.name = 'Fill_' + OBJECT_NAME( d1.referenced_id) OR
					 s.name = 'help' AND o.name = 'Fill' + OBJECT_NAME( d1.referenced_id)
					)
					
				INNER JOIN DepTree r ON 
					r.referenced_id = d1.referenced_id AND
					r.referenced_type = 'U'
			WHERE 
				r.NestLevel <= 15

			UNION ALL

			SELECT  
				o.object_id AS referenced_id,  
				o.name AS referenced_name,
				s.name AS referenced_schema_name,
				o.type AS referenced_type,
				r.referenced_id AS referencing_id, 
				r.referenced_name AS referencing_name, 
				r.referenced_schema_name AS referencing_schema_name,
				r.referenced_type AS referencing_type,
				r.NestLevel + 1 AS NestLevel
			FROM 
				DepTree r
				INNER JOIN sys.objects o ON
					CHARINDEX('AccountSchedule', o.name) > 0  AND
					o.name <> 'FillAccountSchedule' AND
					o.type = 'P'
				INNER JOIN sys.schemas s ON
					s.schema_id = o.schema_id AND
					s.name = 'help'
			WHERE 
				r.referenced_name = 'AccountSchedule' AND
				r.referenced_schema_name = 'help' AND
				r.NestLevel <= 15
		)
		INSERT INTO [setup].[RelationStage_DimFact] (StageTableID, DimFactID)

		SELECT DISTINCT 
			b.TableID,			
			@DimFactID						
		FROM 
			DepTree a 
			INNER JOIN setup.DataSourceTable b ON
			b.TableNameStage = a.referenced_name	
		WHERE
			a.referenced_schema_name = 'stage' AND
			referenced_type = 'U'

		UNION

		SELECT DISTINCT 
			dst.[TableID],			
			df.[DimFactID]
		FROM 
			[setup].[DimFact] df
			INNER JOIN [setup].[DataSourceTable] dst ON
				dst.[TableNameStage] = 'Currency'
		WHERE
			df.[ACYAllowed] = 1 AND
			df.[Type] = 'Fact' AND
			df.[DimFactID] = @DimFactID

		--OPTION (MAXRECURSION 1000)
		PRINT @TableType + REPLICATE(' ',  10 - LEN(@TableType)) + ': ' + @TableName + REPLICATE(' ', 51 - LEN(@TableName)) + REPLICATE(' ', 5 - LEN(CAST(@@ROWCOUNT AS nvarchar(5)))) + CAST(@@ROWCOUNT AS nvarchar(5)) + ' row(s) affected'

		FETCH NEXT FROM TableCursor INTO @DimFactID, @TableName, @TableType
	END

	CLOSE TableCursor
	DEALLOCATE TableCursor	

	SET NOCOUNT OFF
	SET @RowCount = 0
	SET @StoredProcedureName = OBJECT_NAME(@@PROCID)
	SET @LogEndDate = GETDATE()
	EXEC setup.InsertLog @StoredProcedureName, @LogStartDate, @LogEndDate, @RowCount, 0, 'Success'




GO
/****** Object:  StoredProcedure [setup].[UpdateCubeCalcMeasure]    Script Date: 11.9.2017 10:30:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [setup].[UpdateCubeCalcMeasure]
	@CubeName nvarchar(50),				-- CubeNMame from setup.Cube
	@MeasureNameList nvarchar(max),		-- List with inserted or updated measures
	@Active bit = NULL,
	@ActiveWithoutStateTableOnly bit = NULL,
	@OrderGroup int = NULL,
	@DefinedByFormula nvarchar(max) = NULL,
	@DefinedByPostFormula nvarchar(max) = NULL,
	@NonEmptyBehaviorMeasureList nvarchar(max) = NULL,
	@FormatString nvarchar(100) = NULL,
	@VisibleMeasure bit = NULL,
	@GenerateToDateMembers bit = NULL,
	@GenerateToDateSumMembers bit = NULL,
	@GenerateInitialMembers bit = NULL,
	@ToDateSourceName nvarchar(100) = NULL,
	@ToDateNullForAllDate bit = NULL,
	@GenerateYTDMembers bit = NULL,
	@GeneratePrevYearMembers bit = NULL,
	@TimeCompDerivedFromFormula bit = NULL,
	@GenerateMinMaxMembers bit = NULL,
	@GenerateMinMaxToDateMembers bit = NULL,
	@GenerateMinMaxYTDMembers bit = NULL,
	@GenerateMinMaxPrevYearMembers bit = NULL,
	@IsSaldo bit = NULL,
	@AggFnIsAggregate bit = NULL,
	@MeasureExists bit = NULL,	-- 1 - execute only for existing (NonCalculated from [setup].[ProjectCubeMeasure] or Calculated from [setup].[CubeCalcMeasure]) measure
								-- 0 - execute only for nonexisting measure
	-- CalcMember Properties
	@MeasureGroup nvarchar(100) = NULL,
	@DisplayFolder nvarchar(max) = NULL,
	@Description nvarchar(3000) = NULL,
	-- Calc Member Translations
	@MeasureNameENU nvarchar(100) = NULL,
	@MeasureNameCSY nvarchar(100) = NULL,
	@MeasureNameSKY nvarchar(100) = NULL,
	@MeasureNameDEU nvarchar(100) = NULL,
	@DisplayFolderENU nvarchar(max) = NULL,
	@DisplayFolderCSY nvarchar(max) = NULL,
	@DisplayFolderSKY nvarchar(max) = NULL,
	@DisplayFolderDEU nvarchar(max) = NULL,
	@DescriptionENU nvarchar(3000) = NULL,
	@DescriptionCSY nvarchar(3000) = NULL,
	@DescriptionSKY nvarchar(3000) = NULL,
	@DescriptionDEU nvarchar(3000) = NULL,
	@SmallFirstCharENU bit = NULL,
	@SmallFirstCharCSY bit = NULL,
	@SmallFirstCharSKY bit = NULL,
	@SmallFirstCharDEU bit = NULL,
	@DerivedTypeID int = 0,	-- used only for CubeCalcMeasureTranslation updating
	-- Comment (in MDX visible)
	@Comment nvarchar(500) = NULL
AS
	DECLARE
		@CubeID int,
		@ProjectCubeID nvarchar(200),
		@ProjectMeasureID nvarchar(200),
		@ExecString nvarchar(max),
		@ScriptAttributeList nvarchar(max) = N'',
		@Script_SELECT_List nvarchar(max) = N'',
		@Script_UPDATE_List nvarchar(max) = N'',
		@ScriptAttributeList1 nvarchar(max),
		@Script_SELECT_List1 nvarchar(max),
		@Script_UPDATE_List1 nvarchar(max),
		@MeasureName nvarchar(100),
		@MeasureGroup1 nvarchar(100),
		@DisplayFolder1 nvarchar(max),
		@Description1 nvarchar(max),
		@MeasureTranslateECSG1 nvarchar(max),
		@SmallFirstCharECSG1 nvarchar(max),
		@DisplayFolderTranslateECSG1 nvarchar(max),
		@Update bit,
		@NonCalculatedMeasure bit,
		@CubeCalcMeasureID int,
		@M_ENU nvarchar(100),
		@M_CSY nvarchar(100),
		@M_SKY nvarchar(100),
		@M_DEU nvarchar(100),
		@DF_ENU nvarchar(max),
		@DF_CSY nvarchar(max),
		@DF_SKY nvarchar(max),
		@DF_DEU nvarchar(max),
		@D_ENU nvarchar(max),
		@D_CSY nvarchar(max),
		@D_SKY nvarchar(max),
		@D_DEU nvarchar(max),
		@SF_ENU int,
		@SF_CSY int,
		@SF_SKY int,
		@SF_DEU int,
		@i int

	SET @CubeID = ( SELECT [CubeID] FROM [setup].[Cube] WHERE [CubeName] = @CubeName )
	SET @ProjectCubeID = ( SELECT [CubeID] FROM [setup].[ProjectCube] WHERE [Name] = @CubeName )
	SET @MeasureNameList = [help].[RemoveWhiteCharactersFromList](@MeasureNameList)
	IF @CubeID IS NULL PRINT 'Parameter @CubeName is invalid'
	ELSE IF NULLIF(@ProjectCubeID, '') IS NULL PRINT 'Cube @CubeName not exists in OLAP Project'
	ELSE IF NULLIF(@MeasureNameList, '') IS NULL PRINT 'Parameter @MeasureNameList is invalid'
	ELSE
	BEGIN
		IF @Active IS NOT NULL BEGIN
			SET @ScriptAttributeList = @ScriptAttributeList + N', [Active]'
			SET @Script_SELECT_List = @Script_SELECT_List + N', [Active] = ' + CONVERT(nvarchar(1), @Active)
			SET @Script_UPDATE_List = @Script_UPDATE_List + N', [Active] = b.[Active]'
		END
		IF @ActiveWithoutStateTableOnly IS NOT NULL	BEGIN
			SET @ScriptAttributeList = @ScriptAttributeList + N', [ActiveWithoutStateTableOnly]'
			SET @Script_SELECT_List = @Script_SELECT_List + N', [ActiveWithoutStateTableOnly] = ' + CONVERT(nvarchar(1), @ActiveWithoutStateTableOnly)
			SET @Script_UPDATE_List = @Script_UPDATE_List + N', [ActiveWithoutStateTableOnly] = b.[ActiveWithoutStateTableOnly]'
		END
		IF @OrderGroup IS NOT NULL BEGIN
			SET @ScriptAttributeList = @ScriptAttributeList + N', [OrderGroup]'
			SET @Script_SELECT_List = @Script_SELECT_List + N', [OrderGroup] = ' + CONVERT(nvarchar(10), @OrderGroup)
			SET @Script_UPDATE_List = @Script_UPDATE_List + N', [OrderGroup] = b.[OrderGroup]'
		END
		IF @DefinedByFormula IS NOT NULL BEGIN
			SET @ScriptAttributeList = @ScriptAttributeList + N', [DefinedByFormula]'
			SET @Script_SELECT_List = @Script_SELECT_List + N', [DefinedByFormula] = ''' + @DefinedByFormula + ''''
			SET @Script_UPDATE_List = @Script_UPDATE_List + N', [DefinedByFormula] = b.[DefinedByFormula]'
		END
		IF @DefinedByPostFormula IS NOT NULL BEGIN
			SET @ScriptAttributeList = @ScriptAttributeList + N', [DefinedByPostFormula]'
			SET @Script_SELECT_List = @Script_SELECT_List + N', [DefinedByPostFormula] = ''' + @DefinedByPostFormula + ''''
			SET @Script_UPDATE_List = @Script_UPDATE_List + N', [DefinedByPostFormula] = b.[DefinedByPostFormula]'
		END
		IF @NonEmptyBehaviorMeasureList IS NOT NULL BEGIN
			SET @ScriptAttributeList = @ScriptAttributeList + N', [NonEmptyBehaviorMeasureList]'
			SET @Script_SELECT_List = @Script_SELECT_List + N', [NonEmptyBehaviorMeasureList] = ''' + @NonEmptyBehaviorMeasureList + ''''
			SET @Script_UPDATE_List = @Script_UPDATE_List + N', [NonEmptyBehaviorMeasureList] = b.[NonEmptyBehaviorMeasureList]'
		END
		IF @FormatString IS NOT NULL BEGIN
			SET @ScriptAttributeList = @ScriptAttributeList + N', [FormatString]'
			SET @Script_SELECT_List = @Script_SELECT_List + N', [FormatString] = ''' + @FormatString + ''''
			SET @Script_UPDATE_List = @Script_UPDATE_List + N', [FormatString] = b.[FormatString]'
		END
		IF @VisibleMeasure IS NOT NULL BEGIN
			SET @ScriptAttributeList = @ScriptAttributeList + N', [VisibleMeasure]'
			SET @Script_SELECT_List = @Script_SELECT_List + N', [VisibleMeasure] = ' + CONVERT(nvarchar(1), @VisibleMeasure)
			SET @Script_UPDATE_List = @Script_UPDATE_List + N', [VisibleMeasure] = b.[VisibleMeasure]'
		END
		IF @GenerateToDateMembers IS NOT NULL BEGIN
			SET @ScriptAttributeList = @ScriptAttributeList + N', [GenerateToDateMembers]'
			SET @Script_SELECT_List = @Script_SELECT_List + N', [GenerateToDateMembers] = ' + CONVERT(nvarchar(1), @GenerateToDateMembers)
			SET @Script_UPDATE_List = @Script_UPDATE_List + N', [GenerateToDateMembers] = b.[GenerateToDateMembers]'
		END
		IF @GenerateToDateSumMembers IS NOT NULL BEGIN
			SET @ScriptAttributeList = @ScriptAttributeList + N', [GenerateToDateSumMembers]'
			SET @Script_SELECT_List = @Script_SELECT_List + N', [GenerateToDateSumMembers] = ' + CONVERT(nvarchar(1), @GenerateToDateSumMembers)
			SET @Script_UPDATE_List = @Script_UPDATE_List + N', [GenerateToDateSumMembers] = b.[GenerateToDateSumMembers]'
		END
		IF @GenerateInitialMembers IS NOT NULL BEGIN
			SET @ScriptAttributeList = @ScriptAttributeList + N', [GenerateInitialMembers]'
			SET @Script_SELECT_List = @Script_SELECT_List + N', [GenerateInitialMembers] = ' + CONVERT(nvarchar(1), @GenerateInitialMembers)
			SET @Script_UPDATE_List = @Script_UPDATE_List + N', [GenerateInitialMembers] = b.[GenerateInitialMembers]'
		END
		IF @ToDateSourceName IS NOT NULL BEGIN
			SET @ScriptAttributeList = @ScriptAttributeList + N', [ToDateSourceName]'
			SET @Script_SELECT_List = @Script_SELECT_List + N', [ToDateSourceName] = ''' + @ToDateSourceName + ''''
			SET @Script_UPDATE_List = @Script_UPDATE_List + N', [ToDateSourceName] = b.[ToDateSourceName]'
		END
		IF @ToDateNullForAllDate IS NOT NULL BEGIN
			SET @ScriptAttributeList = @ScriptAttributeList + N', [ToDateNullForAllDate]'
			SET @Script_SELECT_List = @Script_SELECT_List + N', [ToDateNullForAllDate] = ' + CONVERT(nvarchar(1), @ToDateNullForAllDate)
			SET @Script_UPDATE_List = @Script_UPDATE_List + N', [ToDateNullForAllDate] = b.[ToDateNullForAllDate]'
		END
		IF @GenerateYTDMembers IS NOT NULL BEGIN
			SET @ScriptAttributeList = @ScriptAttributeList + N', [GenerateYTDMembers]'
			SET @Script_SELECT_List = @Script_SELECT_List + N', [GenerateYTDMembers] = ' + CONVERT(nvarchar(1), @GenerateYTDMembers)
			SET @Script_UPDATE_List = @Script_UPDATE_List + N', [GenerateYTDMembers] = b.[GenerateYTDMembers]'
		END
		IF @GeneratePrevYearMembers IS NOT NULL BEGIN
			SET @ScriptAttributeList = @ScriptAttributeList + N', [GeneratePrevYearMembers]'
			SET @Script_SELECT_List = @Script_SELECT_List + N', [GeneratePrevYearMembers] = ' + CONVERT(nvarchar(1), @GeneratePrevYearMembers)
			SET @Script_UPDATE_List = @Script_UPDATE_List + N', [GeneratePrevYearMembers] = b.[GeneratePrevYearMembers]'
		END
		IF @TimeCompDerivedFromFormula IS NOT NULL BEGIN
			SET @ScriptAttributeList = @ScriptAttributeList + N', [TimeCompDerivedFromFormula]'
			SET @Script_SELECT_List = @Script_SELECT_List + N', [TimeCompDerivedFromFormula] = ' + CONVERT(nvarchar(1), @TimeCompDerivedFromFormula)
			SET @Script_UPDATE_List = @Script_UPDATE_List + N', [TimeCompDerivedFromFormula] = b.[TimeCompDerivedFromFormula]'
		END
		IF @GenerateMinMaxMembers IS NOT NULL BEGIN
			SET @ScriptAttributeList = @ScriptAttributeList + N', [GenerateMinMaxMembers]'
			SET @Script_SELECT_List = @Script_SELECT_List + N', [GenerateMinMaxMembers] = ' + CONVERT(nvarchar(1), @GenerateMinMaxMembers)
			SET @Script_UPDATE_List = @Script_UPDATE_List + N', [GenerateMinMaxMembers] = b.[GenerateMinMaxMembers]'
		END
		IF @GenerateMinMaxToDateMembers IS NOT NULL BEGIN
			SET @ScriptAttributeList = @ScriptAttributeList + N', [GenerateMinMaxToDateMembers]'
			SET @Script_SELECT_List = @Script_SELECT_List + N', [GenerateMinMaxToDateMembers] = ' + CONVERT(nvarchar(1), @GenerateMinMaxToDateMembers)
			SET @Script_UPDATE_List = @Script_UPDATE_List + N', [GenerateMinMaxToDateMembers] = b.[GenerateMinMaxToDateMembers]'
		END
		IF @GenerateMinMaxYTDMembers IS NOT NULL BEGIN
			SET @ScriptAttributeList = @ScriptAttributeList + N', [GenerateMinMaxYTDMembers]'
			SET @Script_SELECT_List = @Script_SELECT_List + N', [GenerateMinMaxYTDMembers] = ' + CONVERT(nvarchar(1), @GenerateMinMaxYTDMembers)
			SET @Script_UPDATE_List = @Script_UPDATE_List + N', [GenerateMinMaxYTDMembers] = b.[GenerateMinMaxYTDMembers]'
		END
		IF @GenerateMinMaxPrevYearMembers IS NOT NULL BEGIN
			SET @ScriptAttributeList = @ScriptAttributeList + N', [GenerateMinMaxPrevYearMembers]'
			SET @Script_SELECT_List = @Script_SELECT_List + N', [GenerateMinMaxPrevYearMembers] = ' + CONVERT(nvarchar(1), @GenerateMinMaxPrevYearMembers)
			SET @Script_UPDATE_List = @Script_UPDATE_List + N', [GenerateMinMaxPrevYearMembers] = b.[GenerateMinMaxPrevYearMembers]'
		END
		IF @IsSaldo IS NOT NULL BEGIN
			SET @ScriptAttributeList = @ScriptAttributeList + N', [IsSaldo]'
			SET @Script_SELECT_List = @Script_SELECT_List + N', [IsSaldo] = ' + CONVERT(nvarchar(1), @IsSaldo)
			SET @Script_UPDATE_List = @Script_UPDATE_List + N', [IsSaldo] = b.[IsSaldo]'
		END
		IF @AggFnIsAggregate IS NOT NULL BEGIN
			SET @ScriptAttributeList = @ScriptAttributeList + N', [AggFnIsAggregate]'
			SET @Script_SELECT_List = @Script_SELECT_List + N', [AggFnIsAggregate] = ' + CONVERT(nvarchar(1), @AggFnIsAggregate)
			SET @Script_UPDATE_List = @Script_UPDATE_List + N', [AggFnIsAggregate] = b.[AggFnIsAggregate]'
		END
		IF @Comment IS NOT NULL BEGIN
			SET @ScriptAttributeList = @ScriptAttributeList + N', [Comment]'
			SET @Script_SELECT_List = @Script_SELECT_List + N', [Comment] = ''' + @Comment + ''''
			SET @Script_UPDATE_List = @Script_UPDATE_List + N', [Comment] = b.[Comment]'
		END

		SET @MeasureNameList = @MeasureNameList + ','
		SET @i = CHARINDEX(',', @MeasureNameList)
		WHILE @i > 0
		BEGIN
			SET @MeasureName = LEFT(@MeasureNameList, @i - 1)
			SET @MeasureNameList = SUBSTRING(@MeasureNameList, @i + 1, LEN(@MeasureNameList))
			SET @i = CHARINDEX(',', @MeasureNameList)
			IF @MeasureName > ''
			BEGIN
				SET @MeasureGroup1 = @MeasureGroup
				IF @MeasureGroup1 IS NULL SET @MeasureGroup1 =
					(SELECT NULLIF(RTRIM(g.[Name]), '')
						FROM [setup].[ProjectCube_Measure] a
							INNER JOIN [setup].[ProjectCube_MeasureGroup] g ON g.[CubeID] = a.[CubeID] AND g.[MeasureGroupID] = a.[MeasureGroupID]
						WHERE a.[CubeID] = @ProjectCubeID AND a.[Name] = @MeasureName)
				SET @DisplayFolder1 = @DisplayFolder
				IF @DisplayFolder1 IS NULL SET @DisplayFolder1 = (SELECT NULLIF(RTRIM(a.[DisplayFolder]), '') FROM [setup].[ProjectCube_Measure] a WHERE a.[CubeID] = @ProjectCubeID AND a.[Name] = @MeasureName)
				SET @Description1 = @Description
				IF @Description1 IS NULL SET @Description1 = (SELECT NULLIF(RTRIM(a.[Description]), '') FROM [setup].[ProjectCube_Measure] a WHERE a.[CubeID] = @ProjectCubeID AND a.[Name] = @MeasureName)
				SET @CubeCalcMeasureID = (SELECT a.CubeCalcMeasureID FROM [setup].[CubeCalcMeasure] a WHERE a.[CubeID] = @CubeID AND a.[IsNamedSet] = 0 AND a.[MeasureName] = @MeasureName)
				SET @Update = CASE WHEN @CubeCalcMeasureID IS NULL THEN 0 ELSE 1 END
				SET @NonCalculatedMeasure = ISNULL((SELECT 1 FROM [setup].[ProjectCube_Measure] a WHERE a.[CubeID] = @ProjectCubeID AND a.[Name] = @MeasureName AND a.[IsCalculated] = 0), 0)
				IF @MeasureExists = 0 AND (@Update = 1 OR @NonCalculatedMeasure = 1)
					PRINT 'Measure [' + @MeasureName + '] exist, meatadata for this measure not updated'
				ELSE IF @MeasureExists = 1 AND (@Update = 0 AND @NonCalculatedMeasure = 0)
					PRINT 'Measure [' + @MeasureName + '] not exist, meatadata for this measure not inserted'
				ELSE
				BEGIN
					SET @ProjectMeasureID = (SELECT [MeasureID] FROM [setup].[ProjectCube_Measure] WHERE [CubeID] = @ProjectCubeID AND [Name] = @MeasureName)
					SELECT @M_ENU = NULL, @DF_ENU = NULL, @D_ENU = NULL, @SF_ENU = NULL
					SELECT @M_CSY = NULL, @DF_CSY = NULL, @D_CSY = NULL, @SF_CSY = NULL
					SELECT @M_SKY = NULL, @DF_SKY = NULL, @D_SKY = NULL, @SF_SKY = NULL
					SELECT @M_DEU = NULL, @DF_DEU = NULL, @D_DEU = NULL, @SF_DEU = NULL
					IF @Update = 0
					BEGIN
						SELECT
							@M_ENU = a.[NameTranslation],
							@DF_ENU = a.[DisplayFolderTranslation],
							@D_ENU = a.[DescriptionTranslation]
						FROM [setup].[ProjectPartTranslation] a
						WHERE  a.[ObjectType] = 'cube' AND a.[ObjectID] = @ProjectCubeID AND a.[ObjectPartType] = 'CubeMeasure' AND a.[ObjectPartID] = @ProjectMeasureID AND a.[ObjectPartNo] = 0 AND a.[LanguageID] = 1033
						IF ISNULL(@M_ENU, '') = '' SET @M_ENU = @MeasureName
						
						SELECT
							@M_CSY = a.[NameTranslation],
							@DF_CSY = a.[DisplayFolderTranslation],
							@D_CSY = a.[DescriptionTranslation]
						FROM [setup].[ProjectPartTranslation] a
						WHERE  a.[ObjectType] = 'cube' AND a.[ObjectID] = @ProjectCubeID AND a.[ObjectPartType] = 'CubeMeasure' AND a.[ObjectPartID] = @ProjectMeasureID AND a.[ObjectPartNo] = 0 AND a.[LanguageID] = 1029
						
						SELECT
							@M_SKY = a.[NameTranslation],
							@DF_SKY = a.[DisplayFolderTranslation],
							@D_SKY = a.[DescriptionTranslation]
						FROM [setup].[ProjectPartTranslation] a
						WHERE  a.[ObjectType] = 'cube' AND a.[ObjectID] = @ProjectCubeID AND a.[ObjectPartType] = 'CubeMeasure' AND a.[ObjectPartID] = @ProjectMeasureID AND a.[ObjectPartNo] = 0 AND a.[LanguageID] = 1051
						
						SELECT
							@M_DEU = a.[NameTranslation],
							@DF_DEU = a.[DisplayFolderTranslation],
							@D_DEU = a.[DescriptionTranslation]
						FROM [setup].[ProjectPartTranslation] a
						WHERE  a.[ObjectType] = 'cube' AND a.[ObjectID] = @ProjectCubeID AND a.[ObjectPartType] = 'CubeMeasure' AND a.[ObjectPartID] = @ProjectMeasureID AND a.[ObjectPartNo] = 0 AND a.[LanguageID] = 1031
				END
					ELSE
					BEGIN
						SELECT
							@M_ENU = a.[MeasureNameTranslation],
							@DF_ENU= a.[DisplayFolderTranslation],
							@D_ENU = a.[DescriptionTranslation],
							@SF_ENU = a.[SmallFirstChar]
						FROM [setup].[CubeCalcMeasureTranslation] a
						WHERE a.[CubeCalcMeasureID] = @CubeCalcMeasureID AND a.[DerivedCalcMeasureTypeID] = @DerivedTypeID AND a.[LanguageID] = 1033
						
						SELECT
							@M_CSY = a.[MeasureNameTranslation],
							@DF_CSY= a.[DisplayFolderTranslation],
							@D_CSY = a.[DescriptionTranslation],
							@SF_CSY = a.[SmallFirstChar]
						FROM [setup].[CubeCalcMeasureTranslation] a
						WHERE a.[CubeCalcMeasureID] = @CubeCalcMeasureID AND a.[DerivedCalcMeasureTypeID] = @DerivedTypeID AND a.[LanguageID] = 1029

						SELECT
							@M_SKY = a.[MeasureNameTranslation],
							@DF_SKY= a.[DisplayFolderTranslation],
							@D_SKY = a.[DescriptionTranslation],
							@SF_SKY = a.[SmallFirstChar]
						FROM [setup].[CubeCalcMeasureTranslation] a
						WHERE a.[CubeCalcMeasureID] = @CubeCalcMeasureID AND a.[DerivedCalcMeasureTypeID] = @DerivedTypeID AND a.[LanguageID] = 1051
						
						SELECT
							@M_DEU = a.[MeasureNameTranslation],
							@DF_DEU= a.[DisplayFolderTranslation],
							@D_DEU = a.[DescriptionTranslation],
							@SF_DEU = a.[SmallFirstChar]
						FROM [setup].[CubeCalcMeasureTranslation] a
						WHERE a.[CubeCalcMeasureID] = @CubeCalcMeasureID AND a.[DerivedCalcMeasureTypeID] = @DerivedTypeID AND a.[LanguageID] = 1031
					END

					SET @M_ENU  = ISNULL(@MeasureNameENU,   ISNULL(@M_ENU,  ''))
					SET @M_CSY  = ISNULL(@MeasureNameCSY,   ISNULL(@M_CSY,  ''))
					SET @M_SKY  = ISNULL(@MeasureNameSKY,   ISNULL(@M_SKY,  ''))
					SET @M_DEU  = ISNULL(@MeasureNameDEU,   ISNULL(@M_DEU,  ''))
					SET @DF_ENU = ISNULL(@DisplayFolderENU, ISNULL(@DF_ENU, ''))
					SET @DF_CSY = ISNULL(@DisplayFolderCSY, ISNULL(@DF_CSY, ''))
					SET @DF_SKY = ISNULL(@DisplayFolderSKY, ISNULL(@DF_SKY, ''))
					SET @DF_DEU = ISNULL(@DisplayFolderDEU, ISNULL(@DF_DEU, ''))
					SET @D_ENU  = ISNULL(@DescriptionENU,   ISNULL(@D_ENU,  ''))
					SET @D_CSY  = ISNULL(@DescriptionCSY,   ISNULL(@D_CSY,  ''))
					SET @D_SKY  = ISNULL(@DescriptionSKY,   ISNULL(@D_SKY,  ''))
					SET @D_DEU  = ISNULL(@DescriptionDEU,   ISNULL(@D_DEU,  ''))
					IF @SmallFirstCharENU IS NOT NULL SET @SF_ENU = CASE WHEN @SmallFirstCharENU IN (0, 1) THEN @SmallFirstCharENU ELSE NULL END
					IF @SmallFirstCharCSY IS NOT NULL SET @SF_CSY = CASE WHEN @SmallFirstCharCSY IN (0, 1) THEN @SmallFirstCharCSY ELSE NULL END
					IF @SmallFirstCharSKY IS NOT NULL SET @SF_SKY = CASE WHEN @SmallFirstCharSKY IN (0, 1) THEN @SmallFirstCharSKY ELSE NULL END
					IF @SmallFirstCharDEU IS NOT NULL SET @SF_DEU = CASE WHEN @SmallFirstCharDEU IN (0, 1) THEN @SmallFirstCharDEU ELSE NULL END

					SET @ScriptAttributeList1 = ''
					SET @Script_SELECT_List1 = ''
					SET @Script_UPDATE_List1 = ''
					IF @MeasureGroup1 IS NOT NULL BEGIN
						SET @ScriptAttributeList1 = @ScriptAttributeList1 + N', [MeasureGroup]'
						SET @Script_SELECT_List1 = @Script_SELECT_List1 + N', [MeasureGroup] = ''' + @MeasureGroup1 + ''''
						IF @MeasureGroup IS NOT NULL
							SET @Script_UPDATE_List1 = @Script_UPDATE_List1 + N', [MeasureGroup] = b.[MeasureGroup]'
					END
					IF @DisplayFolder1 IS NOT NULL BEGIN
						SET @ScriptAttributeList1 = @ScriptAttributeList1 + N', [DisplayFolder]'
						SET @Script_SELECT_List1 = @Script_SELECT_List1 + N', [DisplayFolder] = ''' + @DisplayFolder1 + ''''
						IF @DisplayFolder IS NOT NULL
							SET @Script_UPDATE_List1 = @Script_UPDATE_List1 + N', [DisplayFolder] = b.[DisplayFolder]'
					END
					IF @Description1 IS NOT NULL BEGIN
						SET @ScriptAttributeList1 = @ScriptAttributeList1 + N', [Description]'
						SET @Script_SELECT_List1 = @Script_SELECT_List1 + N', [Description] = ''' + @Description1 + ''''
						IF @Description IS NOT NULL
							SET @Script_UPDATE_List1 = @Script_UPDATE_List1 + N', [Description] = b.[Description]'
					END

					SET @ExecString = N'
MERGE [setup].[CubeCalcMeasure] AS a
USING (
	SELECT [CubeID] = ' + CONVERT(nvarchar(10), @CubeID) + N', [MeasureName] = ''' + @MeasureName + '''' + @Script_SELECT_List + @Script_SELECT_List1 + N'
	) AS b ( [CubeID], [MeasureName]' + @ScriptAttributeList + @ScriptAttributeList1 + N' )
ON ( a.[CubeID] = b.[CubeID] AND a.[MeasureName] = b.[MeasureName] AND a.[IsNamedSet] = 0)
WHEN MATCHED THEN 
	UPDATE SET [DateTimeUpdated] = GETDATE()' + @Script_UPDATE_List + @Script_UPDATE_List1 + N'
WHEN NOT MATCHED THEN 
	INSERT ( [CubeID], [MeasureName], [IsNamedSet], [DateTimeUpdated]' + @ScriptAttributeList + @ScriptAttributeList1 + N' )
	VALUES ( [CubeID], [MeasureName], 0, GETDATE()' + @ScriptAttributeList + @ScriptAttributeList1 + N' )
;'	
					-- PRINT @ExecString
					EXEC sp_executesql	@stmt = @ExecString
				
					SET @CubeCalcMeasureID = (SELECT a.CubeCalcMeasureID FROM [setup].[CubeCalcMeasure] a WHERE a.[CubeID] = @CubeID AND a.[IsNamedSet] = 0 AND a.[MeasureName] = @MeasureName)
					IF @Update = 1 DELETE FROM [setup].[CubeCalcMeasureTranslation] WHERE [CubeCalcMeasureID] = @CubeCalcMeasureID AND [LanguageID] IN (1029, 1031, 1033, 1051) AND [DerivedCalcMeasureTypeID] = @DerivedTypeID
					IF @M_ENU > '' OR @DF_ENU > '' OR @D_ENU > '' OR @SF_ENU IS NOT NULL
						INSERT INTO [setup].[CubeCalcMeasureTranslation] ( [CubeCalcMeasureID], [LanguageID], [DerivedCalcMeasureTypeID], [MeasureNameTranslation], [DisplayFolderTranslation], [DescriptionTranslation], [SmallFirstChar] )
						VALUES ( @CubeCalcMeasureID, 1033, @DerivedTypeID, @M_ENU, @DF_ENU, @D_ENU, @SF_ENU )
					IF @M_CSY > '' OR @DF_CSY > '' OR @D_CSY > '' OR @SF_CSY IS NOT NULL
						INSERT INTO [setup].[CubeCalcMeasureTranslation] ( [CubeCalcMeasureID], [LanguageID], [DerivedCalcMeasureTypeID], [MeasureNameTranslation], [DisplayFolderTranslation], [DescriptionTranslation], [SmallFirstChar] )
						VALUES ( @CubeCalcMeasureID, 1029, @DerivedTypeID, @M_CSY, @DF_CSY, @D_CSY, @SF_CSY )
					IF @M_SKY > '' OR @DF_SKY > '' OR @D_SKY > '' OR @SF_SKY IS NOT NULL
						INSERT INTO [setup].[CubeCalcMeasureTranslation] ( [CubeCalcMeasureID], [LanguageID], [DerivedCalcMeasureTypeID], [MeasureNameTranslation], [DisplayFolderTranslation], [DescriptionTranslation], [SmallFirstChar] )
						VALUES ( @CubeCalcMeasureID, 1051, @DerivedTypeID, @M_SKY, @DF_SKY, @D_SKY, @SF_SKY )
					IF @M_DEU > '' OR @DF_DEU > '' OR @D_DEU > '' OR @SF_DEU IS NOT NULL
						INSERT INTO [setup].[CubeCalcMeasureTranslation] ( [CubeCalcMeasureID], [LanguageID], [DerivedCalcMeasureTypeID], [MeasureNameTranslation], [DisplayFolderTranslation], [DescriptionTranslation], [SmallFirstChar] )
						VALUES ( @CubeCalcMeasureID, 1031, @DerivedTypeID, @M_DEU, @DF_DEU, @D_DEU, @SF_DEU )

				END
			END
		END
	END




GO
/****** Object:  StoredProcedure [setup].[UpdateCubeNamedSet]    Script Date: 11.9.2017 10:30:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [setup].[UpdateCubeNamedSet]
	@CubeName nvarchar(50),				-- CubeNMame from setup.Cube
	@NamedSetList nvarchar(max),		-- List with inserted or updated NamedSets
	@Active bit = NULL,
	@ActiveWithoutStateTableOnly bit = NULL,
	@OrderGroup int = NULL,
	@DefinedByFormula nvarchar(max) = NULL,
	@DefinedByPostFormula nvarchar(max) = NULL,
	--@NonEmptyBehaviorMeasureList nvarchar(max) = NULL,
	--@FormatString nvarchar(100) = NULL,
	@VisibleNamedSet bit = NULL,
	--@GenerateToDateMembers bit = NULL,
	--@GenerateToDateSumMembers bit = NULL,
	--@GenerateInitialMembers bit = NULL,
	--@ToDateSourceName nvarchar(100) = NULL,
	--@ToDateNullForAllDate bit = NULL,
	--@GenerateYTDMembers bit = NULL,
	--@GeneratePrevYearMembers bit = NULL,
	--@TimeCompDerivedFromFormula bit = NULL,
	--@GenerateMinMaxMembers bit = NULL,
	--@GenerateMinMaxToDateMembers bit = NULL,
	--@GenerateMinMaxYTDMembers bit = NULL,
	--@GenerateMinMaxPrevYearMembers bit = NULL,
	--@IsSaldo bit = NULL,
	--@AggFnIsAggregate bit = NULL,
	@NamedSetExists bit = NULL,	-- 1 - execute only for existing NamedSet (from [setup].[CubeCalcMeasure]) 
								-- 0 - execute only for nonexisting NamedSet
	-- CalcMember Properties
	--@MeasureGroup nvarchar(100) = NULL,
	--@DisplayFolder nvarchar(max) = NULL,
	@NamedSetType bit = NULL,
	@Description nvarchar(max) = NULL,
	-- Calc Member Translations
	@NamedSetNameENU nvarchar(100) = NULL,
	@NamedSetNameCSY nvarchar(100) = NULL,
	@NamedSetNameSKY nvarchar(100) = NULL,
	@NamedSetNameDEU nvarchar(100) = NULL,
	@DescriptionENU nvarchar(max) = NULL,
	@DescriptionCSY nvarchar(max) = NULL,
	@DescriptionSKY nvarchar(max) = NULL,
	@DescriptionDEU nvarchar(max) = NULL,
	-- Comment (in MDX visible)
	@Comment nvarchar(500) = NULL
AS
	DECLARE
		@CubeID int,
		@ProjectCubeID nvarchar(200),
		@ProjectNamedSetID nvarchar(200),
		@ExecString nvarchar(max),
		@ScriptAttributeList nvarchar(max) = N'',
		@Script_SELECT_List nvarchar(max) = N'',
		@Script_UPDATE_List nvarchar(max) = N'',
		@ScriptAttributeList1 nvarchar(max),
		@Script_SELECT_List1 nvarchar(max),
		@Script_UPDATE_List1 nvarchar(max),
		@NamedSet nvarchar(100),
		@Description1 nvarchar(max),
		@MeasureTranslateECSG1 nvarchar(max),
		@SmallFirstCharECSG1 nvarchar(max),
		@DisplayFolderTranslateECSG1 nvarchar(max),
		@Update bit,
		@NonCalculatedMeasure bit,
		@CubeNamedSetID int,
		@M_ENU nvarchar(100),
		@M_CSY nvarchar(100),
		@M_SKY nvarchar(100),
		@M_DEU nvarchar(100),
		@D_ENU nvarchar(max),
		@D_CSY nvarchar(max),
		@D_SKY nvarchar(max),
		@D_DEU nvarchar(max),
		@i int

	SET @CubeID = ( SELECT [CubeID] FROM [setup].[Cube] WHERE [CubeName] = @CubeName )
	SET @ProjectCubeID = ( SELECT [CubeID] FROM [setup].[ProjectCube] WHERE [Name] = @CubeName )
	SET @NamedSetList = [help].[RemoveWhiteCharactersFromList](@NamedSetList)
	IF @CubeID IS NULL PRINT 'Parameter @CubeName is invalid'
	ELSE IF NULLIF(@ProjectCubeID, '') IS NULL PRINT 'Cube @CubeNAm,e not exists in OLAP Project'
	ELSE IF NULLIF(@NamedSetList, '') IS NULL PRINT 'Parameter @NamedSetList is invalid'
	ELSE
	BEGIN
		IF @Active IS NOT NULL BEGIN
			SET @ScriptAttributeList = @ScriptAttributeList + N', [Active]'
			SET @Script_SELECT_List = @Script_SELECT_List + N', [Active] = ' + CONVERT(nvarchar(1), @Active)
			SET @Script_UPDATE_List = @Script_UPDATE_List + N', [Active] = b.[Active]'
		END
		IF @ActiveWithoutStateTableOnly IS NOT NULL	BEGIN
			SET @ScriptAttributeList = @ScriptAttributeList + N', [ActiveWithoutStateTableOnly]'
			SET @Script_SELECT_List = @Script_SELECT_List + N', [ActiveWithoutStateTableOnly] = ' + CONVERT(nvarchar(1), @ActiveWithoutStateTableOnly)
			SET @Script_UPDATE_List = @Script_UPDATE_List + N', [ActiveWithoutStateTableOnly] = b.[ActiveWithoutStateTableOnly]'
		END
		IF @OrderGroup IS NOT NULL BEGIN
			SET @ScriptAttributeList = @ScriptAttributeList + N', [OrderGroup]'
			SET @Script_SELECT_List = @Script_SELECT_List + N', [OrderGroup] = ' + CONVERT(nvarchar(10), @OrderGroup)
			SET @Script_UPDATE_List = @Script_UPDATE_List + N', [OrderGroup] = b.[OrderGroup]'
		END
		IF @DefinedByFormula IS NOT NULL BEGIN
			SET @ScriptAttributeList = @ScriptAttributeList + N', [DefinedByFormula]'
			SET @Script_SELECT_List = @Script_SELECT_List + N', [DefinedByFormula] = ''' + @DefinedByFormula + ''''
			SET @Script_UPDATE_List = @Script_UPDATE_List + N', [DefinedByFormula] = b.[DefinedByFormula]'
		END
		IF @DefinedByPostFormula IS NOT NULL BEGIN
			SET @ScriptAttributeList = @ScriptAttributeList + N', [DefinedByPostFormula]'
			SET @Script_SELECT_List = @Script_SELECT_List + N', [DefinedByPostFormula] = ''' + @DefinedByPostFormula + ''''
			SET @Script_UPDATE_List = @Script_UPDATE_List + N', [DefinedByPostFormula] = b.[DefinedByPostFormula]'
		END
		IF @VisibleNamedSet IS NOT NULL BEGIN
			SET @ScriptAttributeList = @ScriptAttributeList + N', [VisibleMeasure]'
			SET @Script_SELECT_List = @Script_SELECT_List + N', [VisibleMeasure] =  ' + CONVERT(nvarchar(10), @VisibleNamedSet)
			SET @Script_UPDATE_List = @Script_UPDATE_List + N', [VisibleMeasure] = b.[VisibleMeasure]'
		END
		IF @NamedSetType IS NOT NULL BEGIN
			SET @ScriptAttributeList = @ScriptAttributeList + N', [NamedSetType]'
			SET @Script_SELECT_List = @Script_SELECT_List + N', [NamedSetType] =  ' + CONVERT(nvarchar(10), @NamedSetType)
			SET @Script_UPDATE_List = @Script_UPDATE_List + N', [NamedSetType] = b.[NamedSetType]'
		END
		IF @Comment IS NOT NULL BEGIN
			SET @ScriptAttributeList = @ScriptAttributeList + N', [Comment]'
			SET @Script_SELECT_List = @Script_SELECT_List + N', [Comment] = ''' + @Comment + ''''
			SET @Script_UPDATE_List = @Script_UPDATE_List + N', [Comment] = b.[Comment]'
		END

		SET @NamedSetList = @NamedSetList + ','
		SET @i = CHARINDEX(',', @NamedSetList)
		WHILE @i > 0
		BEGIN
			SET @NamedSet = LEFT(@NamedSetList, @i - 1)
			SET @NamedSetList = SUBSTRING(@NamedSetList, @i + 1, LEN(@NamedSetList))
			SET @i = CHARINDEX(',', @NamedSetList)
			IF @NamedSet > ''
			BEGIN
				SET @Description1 = @Description
				IF @Description1 IS NULL SET @Description1 = (SELECT NULLIF(RTRIM(a.[Description]), '') FROM [setup].[ProjectCube_Measure] a WHERE a.[CubeID] = @ProjectCubeID AND a.[Name] = @NamedSet)
				SET @CubeNamedSetID = (SELECT a.CubeCalcMeasureID FROM [setup].[CubeCalcMeasure] a WHERE a.[CubeID] = @CubeID AND a.[IsNamedSet] = 1 AND a.[MeasureName] = @NamedSet)
				SET @Update = CASE WHEN @CubeNamedSetID IS NULL THEN 0 ELSE 1 END
				SET @NonCalculatedMeasure = ISNULL((SELECT 1 FROM [setup].[ProjectCube_Measure] a WHERE a.[CubeID] = @ProjectCubeID AND a.[Name] = @NamedSet AND a.[IsCalculated] = 0), 0)
				IF @NamedSetExists = 0 AND (@Update = 1 OR @NonCalculatedMeasure = 1)
					PRINT 'Measure [' + @NamedSet + '] exist, meatadata for this measure not updated'
				ELSE IF @NamedSetExists = 1 AND (@Update = 0 AND @NonCalculatedMeasure = 0)
					PRINT 'Measure [' + @NamedSet + '] not exist, meatadata for this measure not inserted'
				ELSE
				BEGIN
					SET @ProjectNamedSetID = (SELECT [SetID] FROM [setup].[ProjectCube_Set] WHERE [CubeID] = @ProjectCubeID AND [Name] = @NamedSet)
					SELECT @M_ENU = NULL, @D_ENU = NULL
					SELECT @M_CSY = NULL, @D_CSY = NULL
					SELECT @M_SKY = NULL, @D_SKY = NULL
					SELECT @M_DEU = NULL, @D_DEU = NULL
					IF @Update = 0
					BEGIN
						SELECT
							@M_ENU = a.[NameTranslation],
							@D_ENU = a.[DescriptionTranslation]
						FROM [setup].[ProjectPartTranslation] a
						WHERE  a.[ObjectType] = 'cube' AND a.[ObjectID] = @ProjectCubeID AND a.[ObjectPartType] = 'CubeSet' AND a.[ObjectPartID] = @ProjectNamedSetID AND a.[ObjectPartNo] = 0 AND a.[LanguageID] = 1033
						-- IF ISNULL(@M_ENU, '') = '' SET @M_ENU = @NamedSet
						
						SELECT
							@M_CSY = a.[NameTranslation],
							@D_CSY = a.[DescriptionTranslation]
						FROM [setup].[ProjectPartTranslation] a
						WHERE  a.[ObjectType] = 'cube' AND a.[ObjectID] = @ProjectCubeID AND a.[ObjectPartType] = 'CubeSet' AND a.[ObjectPartID] = @ProjectNamedSetID AND a.[ObjectPartNo] = 0 AND a.[LanguageID] = 1029
						
						SELECT
							@M_SKY = a.[NameTranslation],
							@D_SKY = a.[DescriptionTranslation]
						FROM [setup].[ProjectPartTranslation] a
						WHERE  a.[ObjectType] = 'cube' AND a.[ObjectID] = @ProjectCubeID AND a.[ObjectPartType] = 'CubeSet' AND a.[ObjectPartID] = @ProjectNamedSetID AND a.[ObjectPartNo] = 0 AND a.[LanguageID] = 1051
						
						SELECT
							@M_DEU = a.[NameTranslation],
							@D_DEU = a.[DescriptionTranslation]
						FROM [setup].[ProjectPartTranslation] a
						WHERE  a.[ObjectType] = 'cube' AND a.[ObjectID] = @ProjectCubeID AND a.[ObjectPartType] = 'CubeSet' AND a.[ObjectPartID] = @ProjectNamedSetID AND a.[ObjectPartNo] = 0 AND a.[LanguageID] = 1031
				END
					ELSE
					BEGIN
						SELECT
							@M_ENU = a.[MeasureNameTranslation],
							@D_ENU = a.[DescriptionTranslation]
						FROM [setup].[CubeCalcMeasureTranslation] a
						WHERE a.[CubeCalcMeasureID] = @CubeNamedSetID AND a.[DerivedCalcMeasureTypeID] = 0 AND a.[LanguageID] = 1033
						
						SELECT
							@M_CSY = a.[MeasureNameTranslation],
							@D_CSY = a.[DescriptionTranslation]
						FROM [setup].[CubeCalcMeasureTranslation] a
						WHERE a.[CubeCalcMeasureID] = @CubeNamedSetID AND a.[DerivedCalcMeasureTypeID] = 0 AND a.[LanguageID] = 1029

						SELECT
							@M_SKY = a.[MeasureNameTranslation],
							@D_SKY = a.[DescriptionTranslation]
						FROM [setup].[CubeCalcMeasureTranslation] a
						WHERE a.[CubeCalcMeasureID] = @CubeNamedSetID AND a.[DerivedCalcMeasureTypeID] = 0 AND a.[LanguageID] = 1051
						
						SELECT
							@M_DEU = a.[MeasureNameTranslation],
							@D_DEU = a.[DescriptionTranslation]
						FROM [setup].[CubeCalcMeasureTranslation] a
						WHERE a.[CubeCalcMeasureID] = @CubeNamedSetID AND a.[DerivedCalcMeasureTypeID] = 0 AND a.[LanguageID] = 1031
					END

					SET @M_ENU  = ISNULL(@NamedSetNameENU,   ISNULL(@M_ENU,  ''))
					SET @M_CSY  = ISNULL(@NamedSetNameCSY,   ISNULL(@M_CSY,  ''))
					SET @M_SKY  = ISNULL(@NamedSetNameSKY,   ISNULL(@M_SKY,  ''))
					SET @M_DEU  = ISNULL(@NamedSetNameDEU,   ISNULL(@M_DEU,  ''))
					SET @D_ENU  = ISNULL(@DescriptionENU,   ISNULL(@D_ENU,  ''))
					SET @D_CSY  = ISNULL(@DescriptionCSY,   ISNULL(@D_CSY,  ''))
					SET @D_SKY  = ISNULL(@DescriptionSKY,   ISNULL(@D_SKY,  ''))
					SET @D_DEU  = ISNULL(@DescriptionDEU,   ISNULL(@D_DEU,  ''))

					SET @ScriptAttributeList1 = ''
					SET @Script_SELECT_List1 = ''
					SET @Script_UPDATE_List1 = ''

					IF @Description1 IS NOT NULL BEGIN
						SET @ScriptAttributeList1 = @ScriptAttributeList1 + N', [Description]'
						SET @Script_SELECT_List1 = @Script_SELECT_List1 + N', [Description] = ''' + @Description1 + ''''
						IF @Description IS NOT NULL
							SET @Script_UPDATE_List1 = @Script_UPDATE_List1 + N', [Description] = b.[Description]'
					END

					SET @ExecString = N'
MERGE [setup].[CubeCalcMeasure] AS a
USING (
	SELECT [CubeID] = ' + CONVERT(nvarchar(10), @CubeID) + N', [MeasureName] = ''' + @NamedSet + '''' + @Script_SELECT_List + @Script_SELECT_List1 + N'
	) AS b ( [CubeID], [MeasureName]' + @ScriptAttributeList + @ScriptAttributeList1 + N' )
ON ( a.[CubeID] = b.[CubeID] AND a.[MeasureName] = b.[MeasureName] AND a.[IsNamedSet] = 1)
WHEN MATCHED THEN 
	UPDATE SET [DateTimeUpdated] = GETDATE()' + @Script_UPDATE_List + @Script_UPDATE_List1 + N'
WHEN NOT MATCHED THEN 
	INSERT ( [CubeID], [MeasureName], [IsNamedSet], [DateTimeUpdated]' + @ScriptAttributeList + @ScriptAttributeList1 + N' )
	VALUES ( [CubeID], [MeasureName], 1, GETDATE()' + @ScriptAttributeList + @ScriptAttributeList1 + N' )
;'	
					-- PRINT @ExecString
					EXEC sp_executesql	@stmt = @ExecString
				
					SET @CubeNamedSetID = (SELECT a.CubeCalcMeasureID FROM [setup].[CubeCalcMeasure] a WHERE a.[CubeID] = @CubeID AND a.[IsNamedSet] = 1 AND a.[MeasureName] = @NamedSet)
					IF @Update = 1 DELETE FROM [setup].[CubeCalcMeasureTranslation] WHERE [CubeCalcMeasureID] = @CubeNamedSetID AND [LanguageID] IN (1029, 1031, 1033, 1051) AND [DerivedCalcMeasureTypeID] = 0
					IF @M_ENU > '' OR @D_ENU > ''
						INSERT INTO [setup].[CubeCalcMeasureTranslation] ( [CubeCalcMeasureID], [LanguageID], [DerivedCalcMeasureTypeID], [MeasureNameTranslation], [DisplayFolderTranslation], [DescriptionTranslation], [SmallFirstChar] )
						VALUES ( @CubeNamedSetID, 1033, 0, @M_ENU, '', @D_ENU, NULL )
					IF @M_CSY > '' OR @D_CSY > ''
						INSERT INTO [setup].[CubeCalcMeasureTranslation] ( [CubeCalcMeasureID], [LanguageID], [DerivedCalcMeasureTypeID], [MeasureNameTranslation], [DisplayFolderTranslation], [DescriptionTranslation], [SmallFirstChar] )
						VALUES ( @CubeNamedSetID, 1029, 0, @M_CSY, '', @D_CSY, NULL )
					IF @M_SKY > '' OR @D_SKY > ''
						INSERT INTO [setup].[CubeCalcMeasureTranslation] ( [CubeCalcMeasureID], [LanguageID], [DerivedCalcMeasureTypeID], [MeasureNameTranslation], [DisplayFolderTranslation], [DescriptionTranslation], [SmallFirstChar] )
						VALUES ( @CubeNamedSetID, 1051, 0, @M_SKY, '', @D_SKY, NULL )
					IF @M_DEU > '' OR @D_DEU > ''
						INSERT INTO [setup].[CubeCalcMeasureTranslation] ( [CubeCalcMeasureID], [LanguageID], [DerivedCalcMeasureTypeID], [MeasureNameTranslation], [DisplayFolderTranslation], [DescriptionTranslation], [SmallFirstChar] )
						VALUES ( @CubeNamedSetID, 1031, 0, @M_DEU, '', @D_DEU, NULL )

				END
			END
		END
	END


GO
