-- ------------------------------------------------------------------------------------------
-- Copyright AspDotNetStorefront.com, 1995-2010.  All Rights Reserved.
-- http://www.aspdotnetstorefront.com
-- For details on this license please visit  the product homepage at the URL above.
-- THE ABOVE NOTICE MUST REMAIN INTACT.
-- ------------------------------------------------------------------------------------------

CREATE TABLE [dbo].[Affiliate](
    [AffiliateID] [int] IDENTITY(10050,1) NOT NULL,
    [AffiliateGUID] [uniqueidentifier] NOT NULL CONSTRAINT DF_Affiliate_AffiliateGUID DEFAULT(newid()),
    [EMail] [nvarchar](100) NULL,
    [Password] [nvarchar](250) NULL, 
    [SaltKey] int NOT NULL CONSTRAINT DF_Affiliate_SaltKey DEFAULT((0)),
    [DateOfBirth] [datetime] NULL,
    [Gender] [nvarchar](1) NULL,
    [Notes] [text] NULL,
    [IsOnline] [tinyint] NULL CONSTRAINT DF_Affiliate_IsOnline DEFAULT((0)),
    [FirstName] [nvarchar](100) NULL,
    [LastName] [nvarchar](100) NULL,
    [Name] [nvarchar](100) NULL,
    [Company] [nvarchar](100) NULL,
    [Address1] [nvarchar](100) NULL,
    [Address2] [nvarchar](100) NULL,
    [Suite] [nvarchar](50) NULL,
    [City] [nvarchar](100) NULL,
    [State] [nvarchar](100) NULL,
    [Zip] [nvarchar](10) NULL,
    [Country] [nvarchar](100) NULL,
    [Phone] [nvarchar](25) NULL,
    [WebSiteName] [nvarchar](100) NULL,
    [WebSiteDescription] [ntext] NULL,
    [URL] [ntext] NULL,
    [TrackingOnly] [tinyint] NOT NULL CONSTRAINT DF_Affiliate_TrackingOnly DEFAULT((0)),
    [DefaultSkinID] [int] NOT NULL CONSTRAINT DF_Affiliate_DefaultSkinID DEFAULT((1)),
    [ParentAffiliateID] [int] NOT NULL CONSTRAINT DF_Affiliate_ParentAffiliateID DEFAULT((0)),
    [DisplayOrder] [int] NOT NULL CONSTRAINT DF_Affiliate_DisplayOrder DEFAULT((1)),
    [ExtensionData] [ntext] NULL,
    [SEName] [nvarchar](100) NULL,
    [SETitle] [ntext] NULL,
    [SENoScript] [ntext] NULL,
    [SEAltText] [ntext] NULL,
    [SEKeywords] [ntext] NULL,
    [SEDescription] [ntext] NULL,
    [Published] [tinyint] NOT NULL CONSTRAINT DF_Affiliate_Published DEFAULT((1)),
    [Wholesale] [tinyint] NOT NULL CONSTRAINT DF_Affiliate_Wholesale DEFAULT((0)),
    [Deleted] [tinyint] NOT NULL CONSTRAINT DF_Affiliate_Deleted DEFAULT((0)),
    [CreatedOn] [datetime] NOT NULL CONSTRAINT DF_Affiliate_CreatedOn DEFAULT(getdate()),
    [SkinID] int NOT NULL CONSTRAINT DF_Affiliate_SkinID DEFAULT(0),
    [TemplateName] nvarchar(50) NOT NULL CONSTRAINT DF_Affiliate_TemplateName DEFAULT(''),
    CONSTRAINT [PK_Affiliate] PRIMARY KEY CLUSTERED 
    (
        [AffiliateID] ASC
    )
)


GO


CREATE TABLE [dbo].[AffiliateActivity](
    [AffiliateActivityID] [int] IDENTITY(1,1) NOT NULL,
    [AffiliateActivityGUID] [uniqueidentifier] NOT NULL CONSTRAINT DF_AffiliateActivity_AffiliateActivityGUID DEFAULT(newid()),
    [AffiliateID] [int] NOT NULL,
    [AffiliateActivityReasonID] [int] NOT NULL,
    [Amount] [money] NULL,
    [CardID] [nvarchar](100) NULL,
    [OrderNumber] [int] NULL,
    [Notes] [ntext] NULL,
    [ActivityDate] [datetime] NOT NULL CONSTRAINT DF_AffiliateActivity_ActivityDate DEFAULT(getdate()),
    [ExtensionData] [ntext] NULL,
    [CreatedOn] [datetime] NOT NULL CONSTRAINT DF_AffiliateActivity_CreatedOn DEFAULT(getdate()),
    CONSTRAINT [PK_AffiliateActivity] PRIMARY KEY CLUSTERED 
    (
        [AffiliateActivityID] ASC
    )
)



GO


CREATE TABLE [dbo].[AffiliateActivityReason](
    [AffiliateActivityReasonID] [int] IDENTITY(1,1) NOT NULL,
    [AffiliateActivityReasonGUID] [uniqueidentifier] NOT NULL CONSTRAINT DF_AffiliateActivityReason_AffiliateActivityReasonGUID DEFAULT(newid()),
    [Name] [nvarchar](400) NOT NULL,
    [CreatedOn] [datetime] NOT NULL CONSTRAINT DF_AffiliateActivityReason_CreatedOn DEFAULT(getdate()),
    CONSTRAINT [PK_AffiliateAccountActivityReason] PRIMARY KEY CLUSTERED 
    (
        [AffiliateActivityReasonID] ASC
    )
)


GO


CREATE TABLE [dbo].[DocumentAffiliate](
    [DocumentID] [int] NOT NULL,
    [AffiliateID] [int] NOT NULL,
    [CreatedOn] [datetime] NOT NULL CONSTRAINT DF_DocumentAffiliate_CreatedOn DEFAULT(getdate()),
    CONSTRAINT [PK_DocumentAffiliate] PRIMARY KEY CLUSTERED 
    (
        [DocumentID] ASC,
        [AffiliateID] ASC
    )
)


GO


CREATE TABLE [dbo].[AffiliateCommissions](
    [RowGUID] [uniqueidentifier] NOT NULL CONSTRAINT DF_AffiliateCommissions_RowGUID DEFAULT(newid()),
    [LowValue] [money] NULL CONSTRAINT DF_AffiliateCommissions_LowValue DEFAULT((0)),
    [HighValue] [money] NULL CONSTRAINT DF_AffiliateCommissions_HighValue DEFAULT((9999.99)),
    [Commission] [money] NULL CONSTRAINT DF_AffiliateCommissions_Commission DEFAULT((0.0)),
    [ExtensionData] [ntext] NULL,
    [CreatedOn] [datetime] NOT NULL CONSTRAINT DF_AffiliateCommissions_CreatedOn DEFAULT(getdate())
)


GO



CREATE TABLE [dbo].[Partner](
    [PartnerID] [int] IDENTITY(1,1) NOT NULL,
    [PartnerGUID] [uniqueidentifier] NOT NULL CONSTRAINT DF_Partner_PartnerGUID DEFAULT(newid()),
    [Name] [nvarchar](400) NOT NULL,
    [Summary] [ntext] NULL,
    [Address1] [nvarchar](100) NULL,
    [Address2] [nvarchar](100) NULL,
    [Suite] [nvarchar](25) NULL,
    [City] [nvarchar](100) NULL,
    [State] [nvarchar](100) NULL,
    [ZipCode] [nvarchar](10) NULL,
    [Country] [nvarchar](100) NULL,
    [Phone] [nvarchar](25) NULL,
    [FAX] [nvarchar](25) NULL,
    [URL] [nvarchar](255) NULL,
    [Email] [nvarchar](100) NULL,
    [LinkToSite] [tinyint] NOT NULL CONSTRAINT DF_Partner_LinkToSite DEFAULT((0)),
    [LinkInNewWindow] [tinyint] NOT NULL CONSTRAINT DF_Partner_LinkInNewWindow DEFAULT((1)),
    [Specialty] [ntext] NULL,
    [Instructors] [ntext] NULL,
    [Schedule] [ntext] NULL,
    [Testimonials] [ntext] NULL,
    [DisplayOrder] [int] NOT NULL CONSTRAINT DF_Partner_DisplayOrder DEFAULT((1)),
    [Published] [tinyint] NOT NULL CONSTRAINT DF_Partner_Published DEFAULT((1)),
    [Wholesale] [tinyint] NOT NULL CONSTRAINT DF_Partner_Wholesale DEFAULT((0)),
    [ExtensionData] [ntext] NULL,
    [Deleted] [tinyint] NOT NULL CONSTRAINT DF_Partner_Deleted DEFAULT((0)),
    [CreatedOn] [datetime] NOT NULL CONSTRAINT DF_Partner_CreatedOn DEFAULT(getdate()),
    CONSTRAINT [PK_Partner] PRIMARY KEY CLUSTERED 
    (
        [PartnerID] ASC
    )
)


GO


CREATE TABLE [dbo].[CustomReport](
    [CustomReportID] [int] IDENTITY(1,1) NOT NULL,
    [CustomReportGUID] [uniqueidentifier] NOT NULL CONSTRAINT DF_CustomReport_CustomReportGUID DEFAULT (newid()),
    [Name] [nvarchar](400) NOT NULL,
    [Description] [ntext] NULL,
    [SQLCommand] [ntext] NULL,
    [CreatedOn] [datetime] NOT NULL CONSTRAINT DF_CustomReport_CreatedOn DEFAULT (getdate()),
     CONSTRAINT [PK_CustomReport] PRIMARY KEY CLUSTERED 
    (
        [CustomReportID] ASC
    )
)


GO


CREATE TABLE [dbo].[DocumentLibrary](
    [DocumentID] [int] NOT NULL,
    [LibraryID] [int] NOT NULL,
    [DisplayOrder] [int] NOT NULL CONSTRAINT DF_DocumentLibrary_DisplayOrder DEFAULT((1)),
    [CreatedOn] [datetime] NOT NULL CONSTRAINT DF_DocumentLibrary_CreatedOn DEFAULT(getdate()),
    CONSTRAINT [PK_DocumentLibrary] PRIMARY KEY CLUSTERED 
    (
        [DocumentID] ASC,
        [LibraryID] ASC
    )
)


GO


CREATE TABLE [dbo].[DocumentType](
    [DocumentTypeID] [int] IDENTITY(1,1) NOT NULL,
    [DocumentTypeGUID] [uniqueidentifier] NOT NULL CONSTRAINT DF_DocumentType_DocumentTypeGUID DEFAULT(newid()),
    [Name] [nvarchar](400) NOT NULL,
    [DisplayOrder] [int] NOT NULL CONSTRAINT DF_DocumentType_DisplayOrder DEFAULT((1)),
    [CreatedOn] [datetime] NOT NULL CONSTRAINT DF_DocumentType_CreatedOn DEFAULT(getdate()),
    CONSTRAINT [PK_DocumentType] PRIMARY KEY CLUSTERED 
    (
        [DocumentTypeID] ASC
    )
)


GO


CREATE TABLE [dbo].[FAQ](
    [FAQID] [int] IDENTITY(1,1) NOT NULL,
    [FAQGUID] [uniqueidentifier] NOT NULL CONSTRAINT DF_FAQ_FAQGUID DEFAULT(newid()),
    [QText] [ntext] NULL,
    [AText] [ntext] NULL,
    [Published] [tinyint] NOT NULL CONSTRAINT DF_FAQ_Published DEFAULT((1)),
    [Wholesale] [tinyint] NOT NULL CONSTRAINT DF_FAQ_Wholesale DEFAULT((0)),
    [ExtensionData] [ntext] NULL,
    [Deleted] [tinyint] NOT NULL CONSTRAINT DF_FAQ_Deleted DEFAULT((0)),
    [CreatedOn] [datetime] NOT NULL CONSTRAINT DF_FAQ_CreatedOn DEFAULT(getdate()),
    CONSTRAINT [PK_FAQ] PRIMARY KEY CLUSTERED 
    (
        [FAQID] ASC
    )
)


GO


CREATE TABLE [dbo].[Feed](
    [FeedID] [int] IDENTITY(1,1) NOT NULL,
    [FeedGUID] [uniqueidentifier] NOT NULL CONSTRAINT DF_Feed_FeedGUID DEFAULT(newid()), 
	[StoreID] INT NOT NULL CONSTRAINT DF_Feed_StoreID DEFAULT(1),
    [Name] [nvarchar](100) NULL,
    [DisplayOrder] [int] NOT NULL CONSTRAINT DF_Feed_DisplayOrder DEFAULT((1)),
    [XmlPackage] [nvarchar](100) NULL,
    [CanAutoFTP] [tinyint] NOT NULL CONSTRAINT DF_Feed_CanAutoFTP DEFAULT((0)),
    [FTPUsername] [nvarchar](100) NULL,
    [FTPPassword] [nvarchar](100) NULL,   -- NOT hashed or encrypted, it is not a critical password of any kind!
    [FTPServer] [nvarchar](100) NULL,
    [FTPPort] int NULL,
    [FTPFilename] [nvarchar](1000) NULL,
    [ExtensionData] [ntext] NULL,
    [CreatedOn] [datetime] NOT NULL CONSTRAINT DF_Feed_CreatedOn DEFAULT(getdate()),
    CONSTRAINT [PK_Feed] PRIMARY KEY CLUSTERED 
    (
        [FeedID] ASC
    )
)


GO


CREATE TABLE [dbo].[Gallery](
    [GalleryID] [int] IDENTITY(1,1) NOT NULL,
    [GalleryGUID] [uniqueidentifier] NOT NULL CONSTRAINT DF_Gallery_GalleryGUID DEFAULT(newid()),
    [Name] [nvarchar](400) NOT NULL,
    [DirName] [nvarchar](100) NOT NULL,
    [Description] [ntext] NULL,
    [DisplayOrder] [int] NOT NULL CONSTRAINT DF_Gallery_DisplayOrder DEFAULT((1)),
    [ExtensionData] [ntext] NULL,
    [Deleted] [tinyint] NOT NULL CONSTRAINT DF_Gallery_Deleted DEFAULT((0)),
    [CreatedOn] [datetime] NOT NULL CONSTRAINT DF_Gallery_CreatedOn DEFAULT(getdate()),
    CONSTRAINT [PK_Gallery] PRIMARY KEY CLUSTERED 
    (
        [GalleryID] ASC
    )
)



GO


CREATE TABLE [dbo].[Library](
    [LibraryID] [int] IDENTITY(1,1) NOT NULL,
    [LibraryGUID] [uniqueidentifier] NOT NULL CONSTRAINT DF_Library_LibraryGUID DEFAULT(newid()),
    [Name] [nvarchar](400) NOT NULL,
    [Summary] [ntext] NULL,
    [Description] [ntext] NULL,
    [SEName] [nvarchar](100) NULL,
    [SETitle] [ntext] NULL,
    [SENoScript] [ntext] NULL,
    [SEAltText] [ntext] NULL,
    [SEKeywords] [ntext] NULL,
    [SEDescription] [ntext] NULL,
    [DisplayPrefix] [ntext] NULL,
    [XmlPackage] [nvarchar](100) NULL,
    [ParentLibraryID] [int] NOT NULL CONSTRAINT DF_Library_ParentLibraryID DEFAULT((0)),
    [ColWidth] [int] NOT NULL CONSTRAINT DF_Library_ColWidth DEFAULT((4)),
    [SortByLooks] [tinyint] NOT NULL CONSTRAINT DF_Library_SortByLooks DEFAULT((0)),
    [DisplayOrder] [int] NOT NULL CONSTRAINT DF_Library_DisplayOrder DEFAULT((1)),
    [RelatedCategories] [ntext] NULL,
    [RelatedSections] [ntext] NULL,
    [QuantityDiscountID] [int] NULL,
    [RelatedManufacturers] [ntext] NULL,
    [RelatedProducts] [ntext] NULL,
    [Published] [tinyint] NOT NULL CONSTRAINT DF_Library_Published DEFAULT((1)),
    [Wholesale] [tinyint] NOT NULL CONSTRAINT DF_Library_Wholesale DEFAULT((0)),
    [ExtensionData] [ntext] NULL,
    [ContentsBGColor] [nvarchar](10) NULL,
    [PageBGColor] [nvarchar](10) NULL,
    [GraphicsColor] [nvarchar](20) NULL,
    [ImageFilenameOverride] [ntext] NULL,
    [IsImport] [tinyint] NOT NULL CONSTRAINT DF_Library_IsImport DEFAULT((0)),
    [Deleted] [tinyint] NOT NULL CONSTRAINT DF_Library_Deleted DEFAULT((0)),
    [CreatedOn] [datetime] NOT NULL CONSTRAINT DF_Library_CreatedOn DEFAULT(getdate()),
    [PageSize] [int] NOT NULL CONSTRAINT DF_Library_PageSize DEFAULT((20)),
    [SkinID] int NOT NULL CONSTRAINT DF_Library_SkinID DEFAULT(0),
    [TemplateName] nvarchar(50) NOT NULL CONSTRAINT DF_Library_TemplateName DEFAULT(''),
    CONSTRAINT [PK_Library] PRIMARY KEY CLUSTERED 
    (
        [LibraryID] ASC
    )
)



GO


CREATE TABLE [dbo].[News](
    [NewsID] [int] IDENTITY(1,1) NOT NULL,
    [NewsGUID] [uniqueidentifier] NOT NULL CONSTRAINT DF_News_NewsGUID DEFAULT(newid()),
    [Headline] VARCHAR(MAX) NULL,
    [NewsCopy] [ntext] NULL,
    [ExpiresOn] [datetime] NOT NULL CONSTRAINT DF_News_ExpiresOn DEFAULT(dateadd(month,(1),getdate())),
    [Published] [tinyint] NOT NULL CONSTRAINT DF_News_Published DEFAULT((1)),
    [Wholesale] [tinyint] NOT NULL CONSTRAINT DF_News_Wholesale DEFAULT((0)),
    [ExtensionData] [ntext] NULL,
    [Deleted] [tinyint] NOT NULL CONSTRAINT DF_News_Deleted DEFAULT((0)),
    [CreatedOn] [datetime] NOT NULL CONSTRAINT DF_News_CreatedOn DEFAULT(getdate()),
    CONSTRAINT [PK_News] PRIMARY KEY CLUSTERED 
    (
        [NewsID] ASC
    )
)



GO


CREATE TABLE [dbo].[Topic](
    [TopicID] [int] IDENTITY(1,1) NOT NULL,
    [TopicGUID] [uniqueidentifier] NOT NULL CONSTRAINT DF_Topic_TopicGUID DEFAULT(newid()),
    [Name] [nvarchar](400) NOT NULL,
    [Title] [ntext] NULL,
    [Description] [ntext] NULL,
    [SETitle] [ntext] NULL,
    [SEDescription] [ntext] NULL,
    [SEKeywords] [ntext] NULL,
    [SENoScript] [ntext] NULL,
    [Password] [nvarchar](100) NULL,  -- NOT hashed or encrypted, it is not a critical password of any kind!
    [RequiresSubscription] [tinyint] NULL CONSTRAINT DF_Topic_RequiresSubscription DEFAULT((0)),
    [RequiresDisclaimer] [tinyint] NULL CONSTRAINT DF_Topic_RequiresDisclaimer DEFAULT((0)),
    [XmlPackage] [nvarchar](100) NULL,
    [ExtensionData] [ntext] NULL,
    [ShowInSiteMap] [tinyint] NOT NULL CONSTRAINT DF_Topic_ShowInSiteMap DEFAULT((1)),
    [SkinID] [int] NOT NULL CONSTRAINT DF_Topic_SiteID DEFAULT((0)),
    [ContentsBGColor] [nvarchar](10) NULL,
    [PageBGColor] [nvarchar](10) NULL,
    [GraphicsColor] [nvarchar](20) NULL,
    [HTMLOk] [tinyint] NOT NULL CONSTRAINT DF_Topic_HTMLOk DEFAULT((1)),
    [Deleted] [tinyint] NOT NULL CONSTRAINT DF_Topic_Deleted DEFAULT((0)),
    [DisplayOrder] [int] NOT NULL CONSTRAINT [DF_Topic_DisplayOrder]  DEFAULT ((1)),
    [CreatedOn] [datetime] NOT NULL CONSTRAINT DF_Topic_CreatedOn DEFAULT(getdate()),
    CONSTRAINT [PK_Topic] PRIMARY KEY CLUSTERED 
    (
        [TopicID] ASC
    )
)


GO


CREATE TABLE [dbo].[Address](
    [AddressID] [int] IDENTITY(1,1) NOT NULL,
    [AddressGUID] [uniqueidentifier] NOT NULL CONSTRAINT DF_Address_AddressGUID DEFAULT(newid()),
    [CustomerID] [int] NOT NULL,
    [NickName] [nvarchar](100) NULL,
    [FirstName] [nvarchar](100) NULL,
    [LastName] [nvarchar](100) NULL,
    [Company] [nvarchar](100) NULL,
    [Address1] [nvarchar](100) NULL,
    [Address2] [nvarchar](100) NULL,
    [Suite] [nvarchar](50) NULL,
    [City] [nvarchar](100) NULL,
    [State] [nvarchar](100) NULL,
    [Zip] [nvarchar](10) NULL,
    [Country] [nvarchar](100) NULL,
    [ResidenceType] [int] NOT NULL CONSTRAINT DF_Address_ResidenceType DEFAULT((0)),
    [Phone] [nvarchar](25) NULL,
    [Email] [nvarchar](100) NULL,
    [PaymentMethodLastUsed] [nvarchar](100) NULL,
    [CardType] [nvarchar](25) NULL,
    [CardName] [nvarchar](100) NULL,
    [CardNumber] [ntext] NULL,
    [CardExpirationMonth] [nvarchar](10) NULL,
    [CardExpirationYear] [nvarchar](10) NULL,
    [CardStartDate] [ntext] NULL, -- used by UK/EU customers
    [CardIssueNumber] [ntext] NULL, -- used by UK/EU customers
    [eCheckBankABACode] [ntext] NULL,
    [eCheckBankAccountNumber] [ntext] NULL,
    [eCheckBankAccountType] [ntext] NULL,
    [eCheckBankName] [ntext] NULL,
    [eCheckBankAccountName] [ntext] NULL,
    [PONumber] [nvarchar](50) NULL,
    [ExtensionData] [ntext] NULL,
    [Deleted] [tinyint] NOT NULL CONSTRAINT DF_Address_Deleted DEFAULT((0)),
    [CreatedOn] [datetime] NOT NULL CONSTRAINT DF_Address_CreatedOn DEFAULT(getdate()),
    [Crypt] [int] NOT NULL CONSTRAINT DF_Address_Crypt DEFAULT(1),
    CONSTRAINT [PK_Address] PRIMARY KEY CLUSTERED 
    (
        [AddressID] ASC
    )
)


GO


CREATE TABLE [dbo].[Customer](
    [CustomerID] [int] IDENTITY(1,1) NOT NULL,
    [CustomerGUID] [uniqueidentifier] ROWGUIDCOL  NOT NULL CONSTRAINT DF_Customer_CustomerGUID DEFAULT(newid()),
    [CustomerLevelID] [int] NOT NULL CONSTRAINT DF_Customer_CustomerLevelID DEFAULT((0)),
    [StoreID] INT NOT NULL CONSTRAINT DF_Customer_StoreID DEFAULT(1),
    [RegisterDate] [datetime] NOT NULL CONSTRAINT DF_Customer_RegisterDate DEFAULT(getdate()),
    [Email] [nvarchar](100) NOT NULL CONSTRAINT DF_Customer_Email DEFAULT(''),
    [Password] [nvarchar](250) CONSTRAINT DF_Customer_Password DEFAULT(''),
    [SaltKey] int NOT NULL CONSTRAINT DF_Customer_SaltKey DEFAULT((0)),
    [DateOfBirth] [datetime] NULL,
    [Gender] [nvarchar](1) NULL,
    [FirstName] [nvarchar](100) NULL,
    [LastName] [nvarchar](100) NULL,
    [Notes] [ntext] NULL,
    [SkinID] [int] NOT NULL CONSTRAINT DF_Customer_SiteID DEFAULT((1)),
    [Phone] [nvarchar](25) NULL,
    [FAX] [varchar](25) NULL,
    [AffiliateID] [int] NULL,
    [Referrer] [ntext] NULL,
    [CouponCode] [nvarchar](50) NULL,
    [OkToEmail] [tinyint] NOT NULL CONSTRAINT DF_Customer_OkToEmail DEFAULT((1)),
    [IsAdmin] [tinyint] NOT NULL CONSTRAINT DF_Customer_IsAdmin DEFAULT((0)),
    [BillingEqualsShipping] [tinyint] NOT NULL CONSTRAINT DF_Customer_BillingEqualsShipping DEFAULT((0)),
    [LastIPAddress] [varchar](40) NULL,
    [OrderNotes] [ntext] NULL,
    [SubscriptionExpiresOn] [datetime] NULL,
    [RTShipRequest] [ntext] NULL,
    [RTShipResponse] [ntext] NULL,
    [OrderOptions] [ntext] NULL,
    [LocaleSetting] [nvarchar](10) NOT NULL CONSTRAINT DF_Customer_LocaleSetting DEFAULT('en-US'),
    [MicroPayBalance] [money] NOT NULL CONSTRAINT DF_Customer_MicroPayBalance DEFAULT((0.0)),
    [RecurringShippingMethodID] [int] NOT NULL CONSTRAINT DF_Customer_RecurringShippingMethodID DEFAULT((1)),
    [RecurringShippingMethod] [ntext] ,
    [BillingAddressID] [int] NULL,
    [ShippingAddressID] [int] NULL,
    [GiftRegistryGUID] [uniqueidentifier] NOT NULL CONSTRAINT DF_Customer_GiftRegistryGUID DEFAULT(newid()),
    [GiftRegistryIsAnonymous] [tinyint] NOT NULL CONSTRAINT DF_Customer_GiftRegistryIsAnonymous DEFAULT((1)),
    [GiftRegistryAllowSearchByOthers] [tinyint] NOT NULL CONSTRAINT DF_Customer_GiftRegistryAllowSearchByOthers DEFAULT((1)),
    [GiftRegistryNickName] [nvarchar](100) NULL,
    [GiftRegistryHideShippingAddresses] [tinyint] NOT NULL CONSTRAINT DF_Customer_GiftRegistryHideShippingAddresses DEFAULT((1)),
    [CODCompanyCheckAllowed] [tinyint] NOT NULL CONSTRAINT DF_Customer_CODCompanyCheckAllowed DEFAULT((0)),
    [CODNet30Allowed] [tinyint] NOT NULL CONSTRAINT DF_Customer_CODNet30Allowed DEFAULT((0)),
    [ExtensionData] [ntext] NULL,
    [FinalizationData] [ntext] NULL,
    [Deleted] [tinyint] NOT NULL CONSTRAINT DF_Customer_Deleted DEFAULT((0)),
    [CreatedOn] [datetime] NOT NULL CONSTRAINT DF_Customer_CreatedOn DEFAULT(getdate()),
    [Over13Checked] [tinyint] NULL,
    [CurrencySetting] [nvarchar](10) NULL,
    [VATSetting] int NOT NULL CONSTRAINT DF_customer_VATSetting default(2), -- 1 = show prices inclusive of VAT, 2 = show prices exclusive of VAT
    [VATRegistrationID] [nvarchar](100) NOT NULL CONSTRAINT DF_customer_VATRegistrationID default(''),
    [StoreCCInDB] tinyint NOT NULL CONSTRAINT DF_customer_StoreCCInDB default(1),
    [IsRegistered] tinyint NOT NULL CONSTRAINT DF_customer_IsRegistered default(0),
    [LockedUntil] datetime NULL,
    [AdminCanViewCC] tinyint NOT NULL CONSTRAINT DF_customer_AdminCanViewCC default(1),
    [PwdChanged] datetime NOT NULL CONSTRAINT DF_customer_PwdChanged default(getdate()),
    [BadLoginCount] tinyint not null constraint DF_customer_BadLoginCount default(0),
    [LastBadLogin] datetime NULL,
    [Active] tinyint not null constraint DF_customer_Active default(1),
    [PwdChangeRequired] tinyint null,
    [RequestedPaymentMethod] nvarchar(100) null,
    [BuySafe] money  null,
    CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
    (
        [CustomerID] ASC
    )
)



GO


CREATE TABLE [dbo].[CustomerGiftRegistrySearches](
    [CustomerGiftRegistrySearchesID] [int] IDENTITY(1,1) NOT NULL,
    [CustomerGiftRegistrySearchesGUID] [uniqueidentifier] ROWGUIDCOL  NOT NULL CONSTRAINT DF_CustomerGiftRegistrySearches_CustomerGiftRegistrySearchesGUID DEFAULT(newid()),
    [CustomerID] [int] NOT NULL,
    [GiftRegistryGUID] [uniqueidentifier] NOT NULL,
    [CreatedOn] [datetime] NOT NULL CONSTRAINT DF_CustomerGiftRegistrySearches_CreatedOn DEFAULT(getdate()),
	CONSTRAINT [PK_CustomerGiftRegistrySearches] PRIMARY KEY CLUSTERED 
	(
		[CustomerGiftRegistrySearchesID] ASC
	)
)

GO


CREATE TABLE [dbo].[CustomerLevel](
    [CustomerLevelID] [int] IDENTITY(1,1) NOT NULL,
    [CustomerLevelGUID] [uniqueidentifier] NOT NULL CONSTRAINT DF_CustomerLevel_CustomerLevelGUID DEFAULT(newid()),
    [Name] [nvarchar](400) NOT NULL,
    [LevelDiscountPercent] [money] NOT NULL CONSTRAINT DF_CustomerLevel_LevelDiscountPercent DEFAULT((0.0)),
    [LevelDiscountAmount] [money] NOT NULL CONSTRAINT DF_CustomerLevel_LevelDiscountAmount DEFAULT((0.0)),
    [LevelHasFreeShipping] [tinyint] NOT NULL CONSTRAINT DF_CustomerLevel_LevelHasFreeShipping DEFAULT((0)),
    [LevelAllowsQuantityDiscounts] [tinyint] NOT NULL CONSTRAINT DF_CustomerLevel_LevelAllowsQuantityDiscounts DEFAULT((1)),
    [LevelHasNoTax] [tinyint] NOT NULL CONSTRAINT DF_CustomerLevel_LevelHasNoTax DEFAULT((0)),
    [LevelAllowsCoupons] [tinyint] NOT NULL CONSTRAINT DF_CustomerLevel_LevelAllowsCoupons DEFAULT((1)),
    [LevelDiscountsApplyToExtendedPrices] [tinyint] NOT NULL CONSTRAINT DF_CustomerLevel_LevelDiscountsApplyToExtendedPrices DEFAULT((0)),
    [LevelAllowsPO] [tinyint] NOT NULL CONSTRAINT DF_CustomerLevel_LevelAllowsPO DEFAULT((1)),
    [DisplayOrder] [int] NOT NULL CONSTRAINT DF_CustomerLevel_DisplayOrder DEFAULT((1)),
    [ParentCustomerLevelID] [int] NOT NULL CONSTRAINT DF_CustomerLevel_ParentCustomerLevelID DEFAULT((0)),
    [SEName] [nvarchar](100) NULL,
    [ExtensionData] [ntext] NULL,
    [Deleted] [tinyint] NOT NULL CONSTRAINT DF_CustomerLevel_Deleted DEFAULT((0)),
    [CreatedOn] [datetime] NOT NULL CONSTRAINT DF_CustomerLevel_CreatedOn DEFAULT(getdate()),
    [SkinID] int NOT NULL CONSTRAINT DF_CustomerLevel_SkinID DEFAULT(0),
    [TemplateName] nvarchar(50) NOT NULL CONSTRAINT DF_CustomerLevel_TemplateName DEFAULT(''),
    CONSTRAINT [PK_CustomerLevel] PRIMARY KEY CLUSTERED 
    (
        [CustomerLevelID] ASC
    )
)



GO


CREATE TABLE [dbo].[CustomerSession](
    [CustomerSessionID] [int] IDENTITY(1,1) NOT NULL,
    [CustomerID] [int] NOT NULL,
    [SessionName] [nvarchar](100) NOT NULL,
    [SessionValue] [ntext] NULL,
    [ipaddr] varchar(15) NULL, 
    [LastActivity] datetime NOT NULL CONSTRAINT DF_customersession_LastActivity default (getdate()),
    [LoggedOut] datetime NULL,
    [CustomerSessionGUID] uniqueidentifier NOT NULL CONSTRAINT DF_customersession_CustomerSessionGUID default(newid()),
    [CreatedOn] [datetime] NOT NULL CONSTRAINT DF_CustomerSession_CreatedOn DEFAULT(getdate()),
    [ExpiresOn] [datetime] NOT NULL CONSTRAINT DF_CustomerSession_ExpiresOn DEFAULT (dateadd(month,(1),getdate())),
    CONSTRAINT [PK_CustomerSession] PRIMARY KEY CLUSTERED 
    (
        [CustomerSessionID] ASC
    )
)


GO


CREATE TABLE [dbo].[LOG_CustomerEvent](
    [DBRecNo] [int] IDENTITY(1,1) NOT NULL,
    [CustomerID] [int] NULL,
    [EventID] [int] NULL,
    [Timestamp] [datetime] NULL,
    [Data] [nvarchar](100) NULL,
    CONSTRAINT [PK_LOG_CustomerEvents] PRIMARY KEY NONCLUSTERED 
    (
        [DBRecNo] ASC
    )
)


GO


CREATE TABLE [dbo].[SearchLog](
    [SearchTerm] [nvarchar](255) NULL,
    [CustomerID] [int] NOT NULL CONSTRAINT DF_SearchLog_CustomerID DEFAULT((0)),
    [CreatedOn] [datetime] NOT NULL CONSTRAINT DF_SearchLog_CreatedOn DEFAULT(getdate()),
    [LocaleSetting] [nvarchar](10) NOT NULL CONSTRAINT DF_SearchLog_LocaleSetting DEFAULT('en-US')
)



GO


CREATE TABLE [dbo].[Profile](
	[StoreID] [int] NULL,
	[ProfileID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NULL,
	[PropertyName] [varchar](50) NULL,
	[CustomerGUID] [uniqueidentifier] NULL,
	[PropertyValueString] [nvarchar](max) NULL,
	[UpdatedOn] [datetime] NULL,
	CONSTRAINT [PK_Profile] PRIMARY KEY CLUSTERED 
	(
		[ProfileID] ASC
	)
)



GO



CREATE PROCEDURE [dbo].[aspdnsf_getMailingList]
(
	@ListType tinyint,
		--	0 = Email Blast
		--	1 = NewsLetter
	@withOrdersOnly tinyint	= 0,
	@mailingSubject nvarchar(255) = ''
)
AS
BEGIN
SET NOCOUNT ON

/*SELECTING FROM THE CUSTOMER TABLE*/
IF (@ListType = 0) BEGIN

	/*RETRIEVE A LIST OF EMAIL ADDRESSES WHOM HAVE ALREADY RECEIVED THIS EMAIL*/
	DECLARE @EMailSentAlready TABLE (EMailAddress nvarchar(255))
	
	INSERT INTO @EMailSentAlready ([EMailAddress])	SELECT DISTINCT [ToEmail] 
													FROM [MailingMgrLog]
													WHERE (RTRIM(@mailingSubject) <> ''
														AND MONTH([SentOn]) = MONTH(GetDate())
														AND DAY([SentOn]) = DAY(GetDate())
														AND YEAR([SentOn]) = YEAR(GetDate())
														AND [Subject] = RTRIM(@mailingSubject))

	/*FIND ONLY UNIQUE EMAILS FROM THE CUSTOMER TABLE AND PERFORM FILTERING*/
	DECLARE @UniqueEMails TABLE	(EMailAddress nvarchar(255),
								 RecipientGuid UniqueIdentifier,
								 RecipientID int,
								 FirstName nvarchar(255),
								 LastName nvarchar(255))
	
	INSERT INTO @UniqueEMails 
	SELECT DISTINCT [EMail], null, null, null, null
		FROM [Customer]
		WHERE [OkToEmail] = 1
			AND [Deleted] = 0
			AND [Email] <> ''
			AND (@withOrdersOnly = 0 
					OR [CustomerID] IN (SELECT CustomerID FROM [Orders] WHERE [Deleted] = 0))
			AND [Email] NOT IN (Select [EMailAddress] FROM @EMailSentAlready)
			
	/*FILL THE REST OF THE DATA*/
	UPDATE @UniqueEMails SET	RecipientID =	(SELECT TOP 1 [CustomerID] FROM [Customer] WHERE [Email] = [EMailAddress]),
								RecipientGuid = (SELECT TOP 1 [CustomerGuid] FROM [Customer] WHERE [Email] = [EMailAddress]),
								FirstName =		(SELECT TOP 1 [FirstName] FROM [Customer] [c] WHERE [Email] = [EMailAddress]),
								LastName =		(SELECT TOP 1 [LastName] FROM [Customer] [c] WHERE [Email] = [EMailAddress])
													
	/*RETRIEVE REQUIRED DATA*/
	SELECT * FROM @UniqueEMails
	
	
END
/*RETRIEVING FROM THE NEWSLETTER TABLE*/
ELSE BEGIN
	SELECT	[ID]			AS RecipientID,
			[GUID]			AS RecipientGUID,
			[EMailAddress],
			[FirstName],
			[LastName]
	FROM [NewsletterMailList]
	WHERE [SubscriptionConfirmed] = 1
		AND	([UnsubscribedOn] IS NULL  OR [UnsubscribedOn] > GETDATE()) 
END

END
GO




CREATE PROCEDURE [dbo].[aspdnsf_insMailingMgrLog]
(
	@SentOn DateTime = null,
	@ToEmail nvarchar(255),
	@FromEmail nvarchar(255),
	@Subject nvarchar(255),
	@Body nvarchar(max)
)
AS
BEGIN
SET NOCOUNT ON

INSERT INTO [MailingMgrLog]	([SentOn],
							[ToEmail],
							[FromEmail],
							[Subject],
							[Body])
			VALUES	(@SentOn,
					@ToEmail,
					@FromEmail,
					@Subject,
					@Body)

END
GO


CREATE PROCEDURE [dbo].[aspdnsf_getAddressesByCustomer]
(
	@CustomerID int
)
AS
BEGIN
SET NOCOUNT ON
	SELECT	[AddressID],
			[CustomerID],
			[NickName],
			[FirstName], 
			[LastName],
			[Company], 
			[Address1], 
			[Address2], 
			[Suite], 
			[City], 
			[State], 
			[Zip], 
			[Country], 
			[ResidenceType], 
			[Phone], 
			[Email]
	FROM [Address]
	WHERE [CustomerID] = @CustomerID
		AND [Deleted] = 0
END
GO

CREATE PROCEDURE [dbo].[aspdnsf_delAddressByID]
(
	@AddressID int
)
AS
BEGIN
SET NOCOUNT ON
	DELETE FROM [Address]
	WHERE [AddressID] = @AddressID
END
GO

CREATE PROCEDURE [dbo].[aspdnsf_updAddress]
(
	@AddressID int,
	@NickName nvarchar(100) = null,
	@FirstName nvarchar(100) = null,
	@LastName nvarchar(100) = null,
	@Company nvarchar(100) = null,
	@Address1 nvarchar(100) = null,
	@Address2 nvarchar(100) = null,
	@Suite nvarchar(50) = null,
	@City nvarchar(100) = null,
	@State nvarchar(100) = null,
	@Zip nvarchar(100) = null,
	@Country nvarchar(100) = null,
	@ResidenceType int = null,
	@Phone nvarchar(25) = null,
	@Email nvarchar(25) = null
)
AS
BEGIN
SET NOCOUNT ON
UPDATE [Address]
SET
	[NickName]	= COALESCE(@NickName, [NickName]),
	[FirstName]	= COALESCE(@FirstName, [FirstName]),
	[LastName]	= COALESCE(@LastName, [LastName]),
	[Company]	= COALESCE(@Company, [Company]),
	[Address1]	= COALESCE(@Address1, [Address1]),
	[Address2]	= COALESCE(@Address2, [Address2]),
	[Suite]		= COALESCE(@Suite, [Suite]),
	[City]		= COALESCE(@City, [City]),
	[State]		= COALESCE(@State, [State]),
	[Zip]		= COALESCE(@Zip, [Zip]),
	[Country]	= COALESCE(@Country, [Country]),
	[ResidenceType] = COALESCE(@ResidenceType, [ResidenceType]),
	[Phone]		= COALESCE(@Phone, [Phone]),
	[Email]		= COALESCE(@Email, [Email])
WHERE [AddressID] = @AddressID
END
GO

CREATE PROCEDURE [dbo].[aspdnsf_insAddress]
(
	@CustomerID int,
	@NickName nvarchar(100)	= null,
	@FirstName nvarchar(100),
	@LastName nvarchar(100),
	@Company nvarchar(100)	= null,
	@Address1 nvarchar(100),
	@Address2 nvarchar(100)	= null,
	@Suite nvarchar(50)		= null,
	@City nvarchar(100),
	@State nvarchar(100),
	@Zip nvarchar(100),
	@Country nvarchar(100),
	@ResidenceType int		= null,
	@Phone nvarchar(25),
	@Email nvarchar(25)
)
AS
BEGIN
	INSERT INTO [Address]	([CustomerID],
				[NickName],
				[FirstName],
				[LastName],
				[Company],
				[Address1],
				[Address2],
				[Suite],
				[City],
				[State],
				[Zip],
				[Country],
				[ResidenceType],
				[Phone],
				[Email])
		VALUES	(@CustomerID,
			@NickName,
			@FirstName,
			@LastName,
			@Company,
			@Address1,
			@Address2,
			@Suite,
			@City,
			@State,
			@Zip,
			@Country,
			@ResidenceType,
			@Phone,
			@Email)
END
GO



CREATE PROCEDURE [dbo].[aspdnsf_getAffiliateList]
AS
BEGIN
	SET NOCOUNT ON
	SELECT AffiliateID, Name
	FROM Affiliate
	WHERE Deleted = 0 AND Published = 1
END
GO


CREATE PROCEDURE [dbo].[aspdnsf_getLocales]
AS
BEGIN
	SELECT LocaleSettingID, Name
	FROM LocaleSetting
END
GO


CREATE PROCEDURE [dbo].[aspdnsf_getFailedTransactionCount]
(
	@CustomerID int
)
AS
BEGIN
SET NOCOUNT ON
	SELECT COUNT(*) AS N
	FROM FailedTransaction
	WHERE CustomerID = @CustomerID
END
GO


CREATE PROCEDURE [dbo].[aspdnsf_delFailedTransactionsByCustomer]
(
	@CustomerID int
)
AS
BEGIN
SET NOCOUNT ON
	DELETE FROM FailedTransaction
	WHERE CustomerID = @CustomerID
END
GO


CREATE PROCEDURE [dbo].[aspdnsf_insRestrictedIP]
(
	@IPAddress nvarchar(25)
)
AS
BEGIN
SET NOCOUNT ON
	IF NOT EXISTS(SELECT IPAddress FROM RestrictedIP WHERE IPAddress = @IPAddress) BEGIN
		INSERT INTO RestrictedIP (IPAddress) VALUES(@IPAddress)
	END
END
GO


CREATE PROCEDURE [dbo].[aspdnsf_getIPIsRestricted]
(
	@IPAddress nvarchar(25)
)
AS
BEGIN
SET NOCOUNT ON
	SELECT COUNT(*) AS N FROM RestrictedIP
	WHERE IPAddress = @IPAddress
END
GO


CREATE PROCEDURE [dbo].[aspdnsf_delRestrictedIP]
(
	@IPAddress nvarchar(25)
)
AS
BEGIN
SET NOCOUNT ON
	DELETE FROM RestrictedIP
	WHERE IPAddress = @IPAddress
END
GO


CREATE PROCEDURE [dbo].[aspdnsf_getCustomerLevels]
AS
BEGIN
SET NOCOUNT ON
	SELECT Name, CustomerLevelID
	FROM CustomerLevel
	WHERE Deleted = 0
END
GO


CREATE PROCEDURE [dbo].[aspdnsf_SearchProductRatings]
    @SearchTerm		varchar(1000) = '',
    @FilthyOnly		tinyint = 0,
    @Days			int = 7,
	@StoreID		int = 1,
	@FilterByStore	tinyint = 0

AS
BEGIN
    SET NOCOUNT ON
    
	SELECT
		r.RatingID,
		r.CreatedOn,
		p.Name AS ProductName,
		r.ProductID,
		c.FirstName + ' ' + c.LastName + ' (' + CAST(r.CustomerID AS nvarchar(255)) + ')' AS FullName,
		r.Rating,
		r.Comments,
		r.FoundHelpful,
		r.FoundNotHelpful,
		CAST(r.IsFilthy as BIT) AS IsFilthy
	FROM Rating r
	JOIN Product p ON p.ProductID = r.ProductID
	JOIN Customer c ON c.CustomerID = r.CustomerID
	WHERE (@FilterByStore = 0 OR r.StoreID = @StoreID)
		AND (@FilthyOnly = 0 OR r.IsFilthy = 1)
		AND r.CreatedOn > DATEADD(day, (@Days * -1), GETDATE())
		AND ((@SearchTerm = '' OR r.Comments LIKE '%' + @SearchTerm + '%') 
			OR (@SearchTerm = '' OR CAST(r.ProductID as NVARCHAR(15)) LIKE '%' + @SearchTerm + '%'))
END
GO


CREATE PROCEDURE [dbo].[aspdnsf_updProductRating]
	@RatingID	int,
	@Rating		int,
	@Comments	nvarchar(max),
	@IsFilthy	bit
AS
BEGIN
	SET NOCOUNT ON
	UPDATE [dbo].[Rating]
	SET	[Rating]	= @Rating,
		[Comments]	= @Comments,
		[IsFilthy]	= CAST(@IsFilthy AS tinyint)
	WHERE [RatingID] = @RatingID
END
GO


CREATE PROCEDURE [dbo].[aspdnsf_delProductRating]
	@RatingID	int
AS
BEGIN
	SET NOCOUNT ON
	DELETE FROM [dbo].[Rating] WHERE [RatingID] = @RatingID
END
GO



CREATE PROCEDURE [dbo].[aspdnsf_updGridProductVariant]
(
	@variantID int,
	@name nvarchar(255) = NULL,
	@description nvarchar(max),
	@skuSuffix nvarchar(50) = NULL,
	@Price dec = NULL,
	@SalePrice dec = NULL,
	@Inventory int = NULL,
	@deleted tinyint = 0,
	@published tinyint = 1
)
AS
BEGIN
SET NOCOUNT ON

UPDATE [ProductVariant] SET
	[Name] = COALESCE(@name, [Name]),
	[Description] = COALESCE(@description, [Description]),
	[SKUSuffix] = COALESCE(@skuSuffix, [skuSuffix]),
	[Price] = COALESCE(@Price, [Price]),
	[SalePrice] = COALESCE(@SalePrice, [SalePrice]),
	[Inventory] = COALESCE(@Inventory,[Inventory]),
	[Deleted] = @deleted,
	[Published] = @published
WHERE [VariantID] = @VariantID

END
GO




CREATE PROCEDURE [dbo].[aspdnsf_getProductVariants]
(
	@FilterEntityType int = 0,
	@FilterEntityID int = 0,
	@Deleted tinyint = 0
)
AS
BEGIN
SET NOCOUNT ON

-- This can return huge result sets potentially
-- Dynamic SQL actually performs better in this scenario than static Sql would

DECLARE @sql nvarchar(max)
DECLARE @whereClause nvarchar(max)
DECLARE @finalSql nvarchar(max)

SELECT @FilterEntityID = ISNULL(@FilterEntityID, 0)
SELECT @FilterEntityType = ISNULL(@FilterEntityType, 0)

SET @sql = 'SELECT	[pv].[VariantID],
					[pv].[Name],
					[pv].[Description],
					[pv].[Price],
					[pv].[SalePrice],
					[pv].[SKUSuffix],
					[pv].[Published],
					[pv].[Inventory],
					[p].[TrackInventoryBySizeAndColor],
					[pv].[ProductID],
					[p].[Name] as ProductName
			FROM [ProductVariant] pv WITH (NOLOCK)
			JOIN [Product] p ON [pv].[ProductID] = [p].[ProductID]'

IF (@FilterEntityType = 1) BEGIN
	SET @whereClause = 'JOIN [ProductCategory] m ON [pv].[ProductID] = [m].[ProductID]
						WHERE [m].[CategoryID] =' + CAST(@FilterEntityID as nvarchar(12))
	END
ELSE IF (@FilterEntityType = 2) BEGIN
	SET @whereClause = 'JOIN [ProductSection] m ON [pv].[ProductID] = [m].[ProductID] 
						WHERE [m].[SectionID] =' + CAST(@FilterEntityID as nvarchar(12))
	END
ELSE IF (@FilterEntityType = 3) BEGIN
	SET @whereClause = 'JOIN [ProductManufacturer] m ON [pv].[ProductID] = [m].[ProductID]
						WHERE [m].[ManufacturerID] =' + CAST(@FilterEntityID as nvarchar(12))
	END
ELSE IF (@FilterEntityType = 4) BEGIN
	SET @whereClause = 'JOIN [ProductDistributor] m ON [pv].[ProductID] = [m].[ProductID] 
						WHERE [m].[DistributorID] =' + CAST(@FilterEntityID as nvarchar(12))
	END

IF (@Deleted = 0 AND @FilterEntityType = 0)
	SET @whereClause = ' WHERE [pv].[Deleted] = 0'
ELSE IF (@Deleted = 0 AND @FilterEntityType > 0)
	SET @whereClause = ISNULL(@whereClause, '') + ' AND [pv].[Deleted] = 0'

SET @finalSql = @sql + ' ' + ISNULL(@whereClause, '') + 'ORDER BY [pv].[ProductID] ASC'

exec sp_executesql @FinalSql
		
END
GO



CREATE PROCEDURE [dbo].[aspdnsf_GetEntityMenu] 
	@EntityType			int,
		-- 0 = Product
		-- 1 = ProductVariant
		-- 2 = Category
		-- 3 = Section/Department
		-- 4 = Manufacturer
		-- 5 = Distributor
		-- 6 = Genre
		-- 7 = Vector
	@ParentID			int =	0,
	@ParentEntityType	int =	0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	-- PRODUCTS
	IF @EntityType = 0 BEGIN
		DECLARE @ProductEntity table (ProductID int, EntityID int)
		
		-- Build a temporary table to hold the mappings
		IF @ParentEntityType = 2 BEGIN
			INSERT @ProductEntity
			SELECT ProductID, CategoryID FROM ProductCategory
				WHERE CategoryID = @ParentID
		END
		
		IF @ParentEntityType = 3 BEGIN
			INSERT @ProductEntity
				SELECT ProductID, SectionID FROM ProductSection
					WHERE SectionID = @ParentID
				
		END
		
		IF @ParentEntityType = 4 BEGIN
			INSERT @ProductEntity
				SELECT ProductID, ManufacturerID FROM ProductManufacturer
					WHERE ManufacturerID = @ParentID
		END
		
		IF @ParentEntityType = 5 BEGIN
			INSERT @ProductEntity
				SELECT ProductID, DistributorID FROM ProductDistributor
					WHERE DistributorID = @ParentID
		END
		
		IF @ParentEntityType = 6 BEGIN
			INSERT @ProductEntity
				SELECT ProductID, GenreID FROM ProductGenre
					WHERE GenreID = @ParentID
		END
		
		IF @ParentEntityType = 7 BEGIN
			INSERT @ProductEntity
				SELECT ProductID, VectorID FROM ProductVector
					WHERE VectorID = @ParentID
		END
		-- End build temp table
		
		-- Select the product info
		SELECT PE.ProductID as EntityID, P.Name as EntityName, P.Published
			FROM @ProductEntity PE 
			JOIN Product P on PE.ProductID = P.ProductID
			ORDER BY Name, Published
	END
		
	-- PRODUCT VARIANTS
	IF @EntityType = 1 BEGIN
		SELECT Name as EntityName, VariantID as EntityID, Published
			FROM ProductVariant
			WHERE ProductID = @ParentID
			ORDER BY DisplayOrder, Name, Published
	END
	
	-- CATEGORIES
	IF @EntityType = 2 BEGIN
		SELECT Name as EntityName, CategoryID as EntityID, Published
			FROM Category
			WHERE ParentCategoryID = @ParentID
			ORDER BY DisplayOrder, Name, Published
	END
	
	-- DEPARTMENTS
	IF @EntityType = 3 BEGIN
		SELECT Name as EntityName, SectionID as EntityID, Published
			FROM Section
			WHERE ParentSectionID = @ParentID
			ORDER BY DisplayOrder, Name, Published
	END
	
	-- MANUFACTURERS
	IF @EntityType = 4 BEGIN
		SELECT Name as EntityName, ManufacturerID as EntityID, Published
			FROM Manufacturer
			WHERE ParentManufacturerID = @ParentID
			ORDER BY DisplayOrder, Name, Published
	END
	
	-- DISTRIBUTORS
	IF @EntityType = 5 BEGIN
		SELECT Name as EntityName, DistributorID as EntityID, Published
			FROM Distributor
			WHERE ParentDistributorID = @ParentID
			ORDER BY DisplayOrder, Name, Published
	END
	
	-- GENRES
	IF @EntityType = 6 BEGIN
		SELECT Name as EntityName, GenreID as EntityID, Published
			FROM Genre
			WHERE ParentGenreID = @ParentID
			ORDER BY DisplayOrder, Name, Published
	END
	
	-- VECTORS
	IF @EntityType = 7 BEGIN
		SELECT Name as EntityName, VectorID as EntityID, Published
			FROM Vector
			WHERE ParentVectorID = @ParentID
			ORDER BY DisplayOrder, Name, Published
	END

END

GO

create proc [dbo].[aspdnsf_DropColumnWithDefaultConstraint]
  @TableName varchar(100), 
  @ColumnName varchar(100) 
  
AS
BEGIN
    DECLARE @def varchar(255), @cmd VARCHAR(1000)
    select @def = so.name 
    From dbo.sysobjects so with (nolock)
        join dbo.syscolumns sc with (nolock)
                on so.id = sc.cdefault 
                    and sc.id = object_id(@TableName) 
                    and sc.name = @ColumnName

    IF @@rowcount = 1
        exec ('ALTER TABLE dbo.' + @TableName + ' DROP CONSTRAINT ' + @def)

    exec ('ALTER TABLE dbo.' + @TableName + ' DROP COLUMN ' + @ColumnName)

END



GO


create proc dbo.aspdnsf_WSIUpdateMappings
    @xml text
  
AS
SET NOCOUNT ON

    create table #tmp (id int not null, displayorder int)
    DECLARE @pid varchar(50), @pem varchar(50), @xpath varchar(8000), @counter int, @cmd varchar(8000)
    DECLARE @hdoc int, @retcode int, @AutoCleanup bit

    EXEC @retcode = sp_xml_preparedocument @hdoc OUTPUT, @xml                        

    SELECT @AutoCleanup = case AutoCleanup when 'true' then 1 else 0 end
    FROM OPENXML(@hdoc, '/Mappings', 0) WITH (AutoCleanup varchar(5))

    set @counter = 1
    select @xpath = '/Mappings/Product[' + convert(varchar(10), @counter) + ']'

    SELECT top 1 @pid = id, @pem = EntityName
    FROM OPENXML(@hdoc, @xpath, 0) WITH (id varchar(10), EntityName varchar(50))

    while @@rowcount > 0 begin
        if @pem in ('category', 'section', 'manufacturer', 'distributor', 'affiliate', 'vector', 'genre') and isnumeric(@pid) = 1 begin
            select @xpath = @xpath + '/Entity'

            truncate table #tmp
            insert #tmp 
            SELECT *
            FROM OPENXML(@hdoc, @xpath, 0) WITH (id int, displayorder int)

            -- Update display order for existing mappings
            set @cmd = 'update dbo.product' + @pem + ' set displayorder = isnull(t.displayorder, pe.displayorder) from dbo.product' + @pem + ' pe with (nolock) join #tmp t on pe.Productid = ' + @pid + ' and pe.' + @pem + 'id = t.id'
            exec (@cmd)

            -- Insert new mappings
            set @cmd = 'insert dbo.product' + @pem + '(ProductID, ' + @pem + 'id, displayorder, createdon) select ' + @pid + ', id, displayorder, getdate() from #tmp where not exists (select * from dbo.product' + @pem + ' with (nolock) where ProductID = ' + @pid + ' and ' + @pem + 'id = #tmp.id)'
            exec (@cmd)

            -- if auto clenaup then remove mapping that are not in the imput xml document
            if @AutoCleanup = 1 begin
                set @cmd = 'delete dbo.product' + @pem + ' from dbo.product' + @pem + ' pe with (nolock) left join #tmp t on pe.productid = ' + @pid + ' and pe.categoryid = t.id where t.id is null'
                exec (@cmd)
            end 

            set @counter = @counter + 1
            select @xpath = '/Mappings/Product[' + convert(varchar(10), @counter) + ']'

            SELECT top 1 @pid = id, @pem = EntityName
            FROM OPENXML(@hdoc, @xpath, 0) WITH (id varchar(10), EntityName varchar(50))
        end
    end

    exec sp_xml_removedocument @hdoc

    drop table #tmp 


GO


CREATE PROCEDURE [dbo].[aspdnsf_PageQuery]
  @Select varchar(8000), 
  @OrderBy varchar(2000), 
  @PageNum int,
  @PageSize int,
  @StatsFirst int = 1
  
AS
SET NOCOUNT ON 

BEGIN

declare @ColList varchar(8000);
declare @Where varchar(8000);
declare @i int;  
declare @i2 int;
declare @tmp varchar(8000);
declare @dec varchar(8000);
declare @f varchar(100);
declare @d varchar(100);
declare @Symbol char(2);
declare @sTmp varchar(2000)
declare @SQL varchar(8000);
declare @Sort varchar(2000);

declare @StartRow int;
declare @EndRow int;
declare @Total int;

set @StartRow = ((@PageNum-1)* @PageSize)+1
set @EndRow = @StartRow + @PageSize - 1

--Print @Select


if ltrim(rtrim(@OrderBy))=''
begin
  Print @OrderBy
  set @i = charindex('order by',@Select)
  set @OrderBy = ltrim(rtrim(right(@Select,len(@Select)-@i-8)))
  Print @OrderBy
  set @Select = left(@Select,@i-1)
  Print @Select
end


create table #recCount(RecCount int)
exec('INSERT into #recCount (RecCount) select count(*) from ('+@Select+') a')
select @Total=RecCount from #recCount
drop table #recCount



set @Sort = @OrderBy + ', '
set @dec = ''
set @Where  = ''
set @SQL = ''

set @i = charindex(',' , @Sort)
while @i != 0
 begin
  set @tmp = left(@Sort,@i-1)
  set @i2 = charindex(' ', @tmp)

  set @f = case when @i2=0 then ltrim(rtrim(@tmp)) else ltrim(rtrim(left(@tmp,@i2-1))) end
  set @d = case when @i2=0 then '' else ltrim(rtrim(substring(@tmp,@i2+1,100))) end

  set @Sort = rtrim(ltrim(substring(@Sort,@i+1,100)))
  set @i = charindex(',', @Sort)
  set @symbol = case when @d = 'DESC' then '<' else '>' end + 
                case when @i=0 then '=' else '' end

  set @dec = @dec + 'declare @' + @f + ' sql_variant; '
  set @ColList = isnull(replace(replace(@colList,'>','='),'<','=') + ' and ','') +
                 @f + ' ' + @Symbol + ' @' + @f
  set @Where = @Where + ' OR (' + @ColList + ') '
  set @SQL = @SQL + ', @' + @f + '= ' + @f
 end

set @SQL = @dec + ' ' +
           'SELECT top ' + convert(varchar(10), @StartRow) + ' ' + substring(@SQL,3,7000) + ' from (' + @Select + ') a ORDER BY ' +
           @OrderBy + '; ' + 
           'select top ' + convert(varchar(10), 1 + @EndRow - @StartRow) + ' * from (' + @Select + ') a WHERE ' + 
           substring(@Where,4,7000) + ' ORDER BY ' + @OrderBy


IF @StatsFirst = 1 BEGIN
    SELECT @Total TotalRows, ceiling(@Total*1.0/@PageSize) Pages
    exec(@SQL)
END
ELSE BEGIN
    exec(@SQL)
    SELECT @Total TotalRows, ceiling(@Total*1.0/@PageSize) Pages
END

--PRINT @SQL
END



GO


create proc [dbo].[aspdnsf_DropAllNonPrimaryIndexes] 
  
as
BEGIN
declare @sql varchar(8000)
    SELECT  
        TABLE_NAME = OBJECT_NAME(i.id), 
        INDEX_NAME = i.name, 
        COLUMN_LIST = dbo.GetIndexColumns(OBJECT_NAME(i.id), i.id, i.indid), 
        IS_CLUSTERED = INDEXPROPERTY(i.id, i.name, 'IsClustered'), 
        IS_UNIQUE = INDEXPROPERTY(i.id, i.name, 'IsUnique'), 
        FILE_GROUP = g.GroupName 
    INTO #AllIndexes
    FROM 
        dbo.sysindexes i 
    INNER join dbo.sysfilegroups g 
    ON 
        i.groupid = g.groupid 
    WHERE 
        (i.indid BETWEEN 1 AND 254) 
        -- leave out AUTO_STATISTICS: 
        AND (i.Status & 64)=0 
        -- leave out system tables: 
        AND OBJECTPROPERTY(i.id, 'IsMsShipped') = 0 

    DECLARE @MyCursor CURSOR   

    SET @MyCursor = CURSOR FAST_FORWARD 
    FOR 
    SELECT  
        CASE WHEN T.TABLE_NAME IS NULL THEN 
            CASE WHEN IS_UNIQUE=1 THEN
                'ALTER TABLE [' + v.TABLE_NAME + '] DROP CONSTRAINT ' + INDEX_NAME
            ELSE
                'DROP INDEX [' + v.TABLE_NAME + '].[' + INDEX_NAME + ']' 
            END
        END 
    FROM 
        #AllIndexes v 
    LEFT OUTER join 
        INFORMATION_SCHEMA.TABLE_CONSTRAINTS T  
    ON 
        T.CONSTRAINT_NAME = v.INDEX_NAME 
        AND T.TABLE_NAME = v.TABLE_NAME  
        AND T.CONSTRAINT_TYPE = 'PRIMARY KEY' 
    where INDEX_Name like 'IX_%'
    ORDER BY 
        v.TABLE_NAME, 
        IS_CLUSTERED DESC

    OPEN @MyCursor 
    FETCH NEXT FROM @MyCursor 
    INTO @sql

       WHILE @@FETCH_STATUS = 0 
       BEGIN 
          exec(@sql)
          FETCH NEXT FROM @MyCursor 
          INTO @sql
       END 

    CLOSE @MyCursor 
    DEALLOCATE @MyCursor 

END



GO


create proc [dbo].[aspdnsf_ListAllIndexes] 
  
as
begin
    SELECT  
        TABLE_NAME = OBJECT_NAME(i.id), 
        INDEX_NAME = i.name, 
        COLUMN_LIST = dbo.GetIndexColumns(OBJECT_NAME(i.id), i.id, i.indid), 
        IS_CLUSTERED = INDEXPROPERTY(i.id, i.name, 'IsClustered'), 
        IS_UNIQUE = INDEXPROPERTY(i.id, i.name, 'IsUnique'), 
        FILE_GROUP = g.GroupName 
    INTO #AllIndexes
    FROM 
        dbo.sysindexes i 
    INNER join [dbo].
        dbo.sysfilegroups g 
    ON 
        i.groupid = g.groupid 
    WHERE 
        (i.indid BETWEEN 1 AND 254) 
        -- leave out AUTO_STATISTICS: 
        AND (i.Status & 64)=0 
        -- leave out system tables: 
        AND OBJECTPROPERTY(i.id, 'IsMsShipped') = 0 

    SELECT 
        v.*, 
        [PrimaryKey?] = CASE  
            WHEN T.TABLE_NAME IS NOT NULL THEN 1 
            ELSE 0 
        END 
    FROM 
        #AllIndexes v 
    LEFT OUTER join 
        INFORMATION_SCHEMA.TABLE_CONSTRAINTS T  
    ON 
        T.CONSTRAINT_NAME = v.INDEX_NAME 
        AND T.TABLE_NAME = v.TABLE_NAME  
        AND T.CONSTRAINT_TYPE = 'PRIMARY KEY'
    end


GO

create proc [dbo].[aspdnsf_ListAllNonPrimaryIndexes] 
  
as
begin
    SELECT  
        TABLE_NAME = OBJECT_NAME(i.id), 
        INDEX_NAME = i.name, 
        COLUMN_LIST = dbo.GetIndexColumns(OBJECT_NAME(i.id), i.id, i.indid), 
        IS_CLUSTERED = INDEXPROPERTY(i.id, i.name, 'IsClustered'), 
        IS_UNIQUE = INDEXPROPERTY(i.id, i.name, 'IsUnique'), 
        FILE_GROUP = g.GroupName 
    INTO #AllIndexes
    FROM 
        dbo.sysindexes i 
    INNER join [dbo].
        dbo.sysfilegroups g 
    ON 
        i.groupid = g.groupid 
    WHERE 
        (i.indid BETWEEN 1 AND 254) 
        -- leave out AUTO_STATISTICS: 
        AND (i.Status & 64)=0 
        -- leave out system tables: 
        AND OBJECTPROPERTY(i.id, 'IsMsShipped') = 0 

    SELECT 
        v.*, 
        [PrimaryKey?] = CASE  
            WHEN T.TABLE_NAME IS NOT NULL THEN 1 
            ELSE 0 
        END 
    FROM 
        #AllIndexes v 
    LEFT OUTER join 
        INFORMATION_SCHEMA.TABLE_CONSTRAINTS T  
    ON 
        T.CONSTRAINT_NAME = v.INDEX_NAME 
        AND T.TABLE_NAME = v.TABLE_NAME  
        AND T.CONSTRAINT_TYPE = 'PRIMARY KEY'
    where INDEX_Name like 'IX_%'
    order by Index_Name

END


GO

create proc [dbo].[aspdnsf_GenerateCreatesForAllIndexes] 
  
as
begin

    SELECT  
        TABLE_NAME = OBJECT_NAME(i.id), 
        INDEX_NAME = i.name, 
        COLUMN_LIST = dbo.GetIndexColumns(OBJECT_NAME(i.id), i.id, i.indid), 
        IS_CLUSTERED = INDEXPROPERTY(i.id, i.name, 'IsClustered'), 
        IS_UNIQUE = INDEXPROPERTY(i.id, i.name, 'IsUnique'), 
        FILE_GROUP = g.GroupName 
    INTO #AllIndexes
    FROM 
        dbo.sysindexes i 
    INNER join [dbo].
        dbo.sysfilegroups g 
    ON 
        i.groupid = g.groupid 
    WHERE 
        (i.indid BETWEEN 1 AND 254) 
        -- leave out AUTO_STATISTICS: 
        AND (i.Status & 64)=0 
        -- leave out system tables: 
        AND OBJECTPROPERTY(i.id, 'IsMsShipped') = 0 

    SELECT  
        CASE WHEN T.TABLE_NAME IS NULL THEN 
            'CREATE ' 
            + CASE IS_UNIQUE WHEN 1 THEN ' UNIQUE' ELSE '' END 
            + CASE IS_CLUSTERED WHEN 1 THEN ' CLUSTERED' ELSE '' END 
            + ' INDEX [' + INDEX_NAME + '] ON [' + v.TABLE_NAME + ']' 
            + ' (' + COLUMN_LIST + ') ON ' + FILE_GROUP 
        ELSE 
            'ALTER TABLE ['+T.TABLE_NAME+']' 
            +' ADD CONSTRAINT ['+INDEX_NAME+']' 
            +' PRIMARY KEY ' 
            + CASE IS_CLUSTERED WHEN 1 THEN ' CLUSTERED' ELSE '' END 
            + ' (' + COLUMN_LIST + ')' 
        END 
    FROM 
         v 
    LEFT OUTER join 
        INFORMATION_SCHEMA.TABLE_CONSTRAINTS T  
    ON 
        T.CONSTRAINT_NAME = v.INDEX_NAME 
        AND T.TABLE_NAME = v.TABLE_NAME  
        AND T.CONSTRAINT_TYPE = 'PRIMARY KEY' 
    where INDEX_Name like 'IX_%'
    ORDER BY 
        v.TABLE_NAME, 
        IS_CLUSTERED DESC


end



GO

/****** Object:  StoredProcedure [dbo].[aspdnsf_GetMobileEntities]    ******/
create proc [dbo].[aspdnsf_GetMobileEntities]
	@entitytype		int, -- 1 = category, 2 = section, 3 = manufacturer, 4 = distributor, 5= genre, 6 = vector  
	@entityid		int,
	@pagesize		int,
	@pagenum		int,
	@numpages		int output
 
 
AS  
BEGIN  
  
 SET NOCOUNT ON   
  
	IF @entityid is null
		set @entityid = 0
		
	IF @pagenum is null or @pagenum = 0
		set @pagenum = 1
	
    -- get page size  
    IF (@pagesize is null or @pagesize = 0) and @entityid > 0 BEGIN  
        IF @entitytype = 1  
            SELECT @pagesize = PageSize FROM dbo.Category with (nolock) WHERE categoryID = @entityid  
        ELSE IF @entitytype = 2  
            SELECT @pagesize = PageSize FROM dbo.Section with (nolock) WHERE sectionID = @entityid  
        ELSE IF @entitytype = 3  
            SELECT @pagesize = PageSize FROM dbo.Manufacturer with (nolock) WHERE manufacturerID = @entityid  
        ELSE IF @entitytype = 4 
            SELECT @pagesize = PageSize FROM dbo.Distributor with (nolock) WHERE distributorID = @entityid  
        ELSE IF @entitytype = 5   
            SELECT @pagesize = PageSize FROM dbo.Genre with (nolock) WHERE genreID = @entityid  
        ELSE IF @entitytype = 6  
            SELECT @pagesize = PageSize FROM dbo.Vector with (nolock) WHERE vectorID = @entityid  
        ELSE   
            SELECT @pagesize = convert(int, ConfigValue) FROM dbo.AppConfig with (nolock) WHERE [Name] = 'Default_CategoryPageSize'  
    END  
  
    IF @pagesize is null or @pagesize = 0  
        SET @pagesize = 20  

	declare @lowbounds	int
	set @lowbounds = @pagesize * (@pagenum - 1)
	
	declare @highbounds	int 
	set @highbounds = @pagesize * @pagenum
	
	DECLARE @entitycount int
	
	-- 1 = category, 2 = section, 3 = manufacturer, 4 = distributor, 5= genre, 6 = vector
	IF @entitytype = 1
		BEGIN
		SELECT @entitycount = COUNT(CategoryID) from dbo.Category with(NOLOCK) where ParentCategoryID = @entityid and Published=1 and Deleted=0
		SELECT CategoryID, Name, SEName FROM
			( select CategoryID,
				Name, 
				SEName, 
				ROW_NUMBER() OVER(ORDER BY DisplayOrder, Name, CategoryID) as RowNum
				from dbo.Category with(NOLOCK)
				where ParentCategoryID = @entityid and Published=1 and Deleted=0
			) ent
			WHERE RowNum > @lowbounds and RowNum <= @highbounds
		END
    ELSE IF @entitytype = 2  
		BEGIN
		SELECT @entitycount = COUNT(SectionID) from dbo.Section with(NOLOCK) where ParentSectionID = @entityid and Published=1 and Deleted=0
        SELECT SectionID, Name, SEName FROM
		( select SectionID,
			Name, 
			SEName,
			ROW_NUMBER() OVER(ORDER BY DisplayOrder, Name, SectionID) as RowNum
			from dbo.Section with(NOLOCK)
			where ParentSectionID = @entityid and Published=1 and Deleted=0
		) ent
		WHERE RowNum > @lowbounds and RowNum <= @highbounds
		END
    ELSE IF @entitytype = 3  
        BEGIN
		SELECT @entitycount = COUNT(ManufacturerID) from dbo.Manufacturer with(NOLOCK) where ParentManufacturerID = @entityid and Published=1 and Deleted=0
        SELECT ManufacturerID, Name, SEName FROM
		( select ManufacturerID,
			Name, 
			SEName,
			ROW_NUMBER() OVER(ORDER BY DisplayOrder, Name, ManufacturerID) as RowNum
			from dbo.Manufacturer with(NOLOCK)
			where ParentManufacturerID = @entityid and Published=1 and Deleted=0
		) ent
		WHERE RowNum > @lowbounds and RowNum <= @highbounds 
		END
    ELSE IF @entitytype = 4 
        BEGIN
		SELECT @entitycount = COUNT(DistributorID) from dbo.Distributor with(NOLOCK) where ParentDistributorID = @entityid and Published=1 and Deleted=0
        SELECT DistributorID, Name, SEName FROM
		( select DistributorID,
			Name, 
			SEName,
			ROW_NUMBER() OVER(ORDER BY DisplayOrder, Name, DistributorID) as RowNum
			from dbo.Distributor with(NOLOCK)
			where ParentDistributorID = @entityid and Published=1 and Deleted=0
		) ent
		WHERE RowNum > @lowbounds and RowNum <= @highbounds
		END
    ELSE IF @entitytype = 5   
        BEGIN
		SELECT @entitycount = COUNT(GenreID) from dbo.Genre with(NOLOCK) where ParentGenreID = @entityid and Published=1 and Deleted=0
        SELECT GenreID, Name, SEName FROM
		( select GenreID,
			Name, 
			SEName,
			ROW_NUMBER() OVER(ORDER BY DisplayOrder, Name, GenreID) as RowNum
			from dbo.Genre with(NOLOCK)
			where ParentGenreID = @entityid and Published=1 and Deleted=0
		) ent
		WHERE RowNum > @lowbounds and RowNum <= @highbounds
		END 
    ELSE IF @entitytype = 6  
        BEGIN
		SELECT @entitycount = COUNT(VectorID) from dbo.Vector with(NOLOCK) where ParentVectorID = @entityid and Published=1 and Deleted=0
        SELECT VectorID, Name, SEName FROM
		( select VectorID,
			Name, 
			SEName,
			ROW_NUMBER() OVER(ORDER BY DisplayOrder, Name, VectorID) as RowNum
			from dbo.Vector with(NOLOCK)
			where ParentVectorID = @entityid and Published=1 and Deleted=0
		) ent
		WHERE RowNum > @lowbounds and RowNum <= @highbounds
		END
	END  
	
set @numpages = case when (@entitycount % @pagesize = 0) then @entitycount / @pagesize else (@entitycount/@pagesize) + 1 end 
	
return @entitycount

GO

/****** Object:  StoredProcedure [dbo].[aspdnsf_RecurseMobileEntities]    ******/
create proc [dbo].[aspdnsf_RecurseMobileEntities]
	@entitytype		int, -- 1 = category, 2 = section, 3 = manufacturer, 4 = distributor, 5= genre, 6 = vector  
	@entityid		int

AS  
BEGIN  
  
 SET NOCOUNT ON   
  
	declare @parentid int
	select @parentid = ParentCategoryID from dbo.Category where CategoryID=@entityid
	
	CREATE TABLE #tmp
	(
		IDEN int identity,
		ID int,
		Name nvarchar(400),
		SEName nvarchar(100)
	)
	
		IF @entitytype = 1
				BEGIN
					insert #tmp (ID, Name, SEName)
						select CategoryID, 
							Name, 
							SEName 
						from dbo.Category with(NOLOCK) 
						where CategoryID=@entityid
						
					select @parentid = ParentCategoryID from dbo.Category with(NOLOCK) where CategoryID=@entityid

				END
			ELSE IF @entitytype = 2  
				BEGIN
					insert #tmp (ID, Name, SEName)
						select SectionID, 
							Name, 
							SEName 
						from dbo.Section with(NOLOCK) 
						where SectionID=@entityid
					
					select @parentid = ParentSectionID from dbo.Section with(NOLOCK) where SectionID=@entityid
				END
			ELSE IF @entitytype = 3  
				BEGIN
					insert #tmp (ID, Name, SEName)
						select ManufacturerID, 
							Name, 
							SEName 
						from dbo.Manufacturer with(NOLOCK) 
						where ManufacturerID=@entityid
						
						select @parentid = ParentManufacturerID from dbo.Manufacturer with(NOLOCK) where ManufacturerID=@entityid
				
				END
			ELSE IF @entitytype = 4 
				BEGIN
					insert #tmp (ID, Name, SEName)
						select DistributorID, 
							Name, 
							SEName 
						from dbo.Distributor with(NOLOCK) 
						where DistributorID=@entityid
						
						select @parentid = ParentDistributorID from dbo.Distributor with(NOLOCK) where DistributorID=@entityid
				
				END
			ELSE IF @entitytype = 5   
				BEGIN
					insert #tmp (ID, Name, SEName)
						select GenreID, 
							Name, 
							SEName 
						from dbo.Genre with(NOLOCK) 
						where GenreID=@entityid
						
						select @parentid = ParentGenreID from dbo.Genre with(NOLOCK) where GenreID=@entityid

				END 
			ELSE IF @entitytype = 6  
				BEGIN
					insert #tmp (ID, Name, SEName)
						select VectorID, 
							Name, 
							SEName 
						from dbo.Vector with(NOLOCK) 
						where VectorID=@entityid
						
						select @parentid = ParentVectorID from dbo.Vector with(NOLOCK) where VectorID=@entityid
				END
	
	
	while @parentid > 0
		begin
			-- 1 = category, 2 = section, 3 = manufacturer, 4 = distributor, 5= genre, 6 = vector
			IF @entitytype = 1
				BEGIN
					insert #tmp (ID, Name, SEName)
						select CategoryID, 
							Name, 
							SEName 
						from dbo.Category with(NOLOCK) 
						where CategoryID=@parentid
						
					select @entityid = CategoryID, 
						@parentid = ParentCategoryID
					from dbo.Category with(NOLOCK) where CategoryID=@parentid
				END
			ELSE IF @entitytype = 2  
				BEGIN
					insert #tmp (ID, Name, SEName)
						select SectionID, 
							Name, 
							SEName 
						from dbo.Section with(NOLOCK) 
						where SectionID=@parentid
						
					select @entityid = SectionID, 
						@parentid = ParentSectionID
					from dbo.Section with(NOLOCK) where SectionID=@parentid	
				END
			ELSE IF @entitytype = 3  
				BEGIN
					insert #tmp (ID, Name, SEName)
						select ManufacturerID, 
							Name, 
							SEName 
						from dbo.Manufacturer with(NOLOCK) 
						where ManufacturerID=@parentid
						
					select @entityid = ManufacturerID, 
						@parentid = ParentManufacturerID
					from dbo.Manufacturer with(NOLOCK) where ManufacturerID=@parentid
				END
			ELSE IF @entitytype = 4 
				BEGIN
					insert #tmp (ID, Name, SEName)
						select DistributorID, 
							Name, 
							SEName 
						from dbo.Distributor with(NOLOCK) 
						where DistributorID=@parentid
						
					select @entityid = DistributorID, 
						@parentid = ParentDistributorID
					from dbo.Distributor with(NOLOCK) where DistributorID=@parentid
				END
			ELSE IF @entitytype = 5   
				BEGIN
					insert #tmp (ID, Name, SEName)
						select GenreID, 
							Name, 
							SEName 
						from dbo.Genre with(NOLOCK) 
						where GenreID=@parentid
						
					select @entityid = GenreID, 
						@parentid = ParentGenreID
					from dbo.Genre with(NOLOCK) where GenreID=@parentid
				END 
			ELSE IF @entitytype = 6  
				BEGIN
					insert #tmp (ID, Name, SEName)
						select VectorID, 
							Name, 
							SEName 
						from dbo.Vector with(NOLOCK) 
						where VectorID=@parentid
						
					select @entityid = VectorID, 
						@parentid = ParentVectorID
					from dbo.Vector with(NOLOCK) where VectorID=@parentid
				END
			END
		END 

	select * from #tmp order by IDEN DESC

	drop table #tmp
	
GO

/****** Object:  StoredProcedure [dbo].[aspdnsf_GetProductsForMobileEntity]    ******/
CREATE proc [dbo].[aspdnsf_GetProductsForMobileEntity]
	@entitytype		int, -- 1 = category, 2 = section, 3 = manufacturer, 4 = distributor, 5= genre, 6 = vector  
	@entityid		int,
	@pagesize		int,
	@pagenum		int,
	@numpages		int output
 
 
AS  
BEGIN  
  
 SET NOCOUNT ON   
  
	IF @entityid is null
		set @entityid = 0
		
	IF @pagenum is null or @pagenum = 0
		set @pagenum = 1
	
    -- get page size  
    IF (@pagesize is null or @pagesize = 0) and @entityid > 0 BEGIN  
        IF @entitytype = 1  
            SELECT @pagesize = PageSize FROM dbo.Category with (nolock) WHERE categoryID = @entityid  
        ELSE IF @entitytype = 2  
            SELECT @pagesize = PageSize FROM dbo.Section with (nolock) WHERE sectionID = @entityid  
        ELSE IF @entitytype = 3  
            SELECT @pagesize = PageSize FROM dbo.Manufacturer with (nolock) WHERE manufacturerID = @entityid  
        ELSE IF @entitytype = 4 
            SELECT @pagesize = PageSize FROM dbo.Distributor with (nolock) WHERE distributorID = @entityid  
        ELSE IF @entitytype = 5   
            SELECT @pagesize = PageSize FROM dbo.Genre with (nolock) WHERE genreID = @entityid  
        ELSE IF @entitytype = 6  
            SELECT @pagesize = PageSize FROM dbo.Vector with (nolock) WHERE vectorID = @entityid  
        ELSE   
            SELECT @pagesize = convert(int, ConfigValue) FROM dbo.AppConfig with (nolock) WHERE [Name] = 'Default_CategoryPageSize'  
    END  
  
    IF @pagesize is null or @pagesize = 0  
        SET @pagesize = 5  

	declare @lowbounds	int
	set @lowbounds = @pagesize * (@pagenum - 1)
	
	declare @highbounds	int 
	set @highbounds = @pagesize * @pagenum
	
	DECLARE @productcount int
	
	-- 1 = category, 2 = section, 3 = manufacturer, 4 = distributor, 5= genre, 6 = vector
	IF @entitytype = 1
		BEGIN
		SELECT @productcount = COUNT(pc.ProductID) from dbo.ProductCategory pc with(NOLOCK) left join dbo.Product p with(NOLOCK) on p.ProductID = pc.ProductID where p.Published=1 and p.Deleted=0 and pc.CategoryID = @entityid
	
		SELECT ProductID, Name, SEName, Description, Price, SalePrice, SalesPrompt, VariantID, TaxClassID FROM
			( select p.ProductID,
				p.Name, 
				p.SEName,
				p.Description,
				pv.Price,
				pv.SalePrice,
				pv.VariantID,
				p.TaxClassID, 
				sp.Name as SalesPrompt,
				ROW_NUMBER() OVER(ORDER BY pc.DisplayOrder, p.Name, p.ProductID) as RowNum
				from dbo.Product p with(NOLOCK)
				left join dbo.ProductCategory pc with(NOLOCK) on pc.ProductID = p.ProductID
				left join dbo.ProductVariant pv with(NOLOCK) on pv.ProductID = p.ProductID
				left join dbo.SalesPrompt sp with(NOLOCK) on sp.SalesPromptID = p.SalesPromptID
				where p.Published=1 and p.Deleted=0 and pc.CategoryID = @entityid and pv.IsDefault=1
			) ent
			WHERE RowNum > @lowbounds and RowNum <= @highbounds
		END
    ELSE IF @entitytype = 2  
		BEGIN
		SELECT @productcount = COUNT(ps.ProductID) from dbo.ProductSection ps with(NOLOCK) left join dbo.Product p with(NOLOCK) on p.ProductID = ps.ProductID where p.Published=1 and p.Deleted=0 and ps.SectionID = @entityid
	
		SELECT ProductID, Name, SEName, Description, Price, SalePrice, SalesPrompt, VariantID, TaxClassID FROM
			( select p.ProductID,
				p.Name, 
				p.SEName,
				p.Description, 
				pv.Price,
				pv.SalePrice, 
				pv.VariantID,
				p.TaxClassID, 
				sp.Name as SalesPrompt,
				ROW_NUMBER() OVER(ORDER BY ps.DisplayOrder, p.Name, p.ProductID) as RowNum
				from dbo.Product p with(NOLOCK)
				left join dbo.ProductSection ps with(NOLOCK) on ps.ProductID = p.ProductID
				left join dbo.ProductVariant pv with(NOLOCK) on pv.ProductID = p.ProductID
				left join dbo.SalesPrompt sp with(NOLOCK) on sp.SalesPromptID = p.SalesPromptID
				where p.Published=1 and p.Deleted=0 and ps.SectionID = @entityid and pv.IsDefault=1
			) ent
			WHERE RowNum > @lowbounds and RowNum <= @highbounds
		END
    ELSE IF @entitytype = 3  
        BEGIN
		SELECT @productcount = COUNT(pm.ProductID) from dbo.ProductManufacturer pm with(NOLOCK) left join dbo.Product p with(NOLOCK) on p.ProductID = pm.ProductID where p.Published=1 and p.Deleted=0 and pm.ManufacturerID = @entityid
	
		SELECT ProductID, Name, SEName, Description, Price, SalePrice, SalesPrompt, VariantID, TaxClassID FROM
			( select p.ProductID,
				p.Name, 
				p.SEName,
				p.Description, 
				pv.Price,
				pv.SalePrice, 
				pv.VariantID,
				p.TaxClassID, 
				sp.Name as SalesPrompt,
				ROW_NUMBER() OVER(ORDER BY pm.DisplayOrder, p.Name, p.ProductID) as RowNum
				from dbo.Product p with(NOLOCK)
				left join dbo.ProductManufacturer pm with(NOLOCK) on pm.ProductID = p.ProductID
				left join dbo.ProductVariant pv with(NOLOCK) on pv.ProductID = p.ProductID
				left join dbo.SalesPrompt sp with(NOLOCK) on sp.SalesPromptID = p.SalesPromptID
				where p.Published=1 and p.Deleted=0 and pm.ManufacturerID = @entityid and pv.IsDefault=1
			) ent
			WHERE RowNum > @lowbounds and RowNum <= @highbounds
		END
    ELSE IF @entitytype = 4 
        BEGIN
		SELECT @productcount = COUNT(pd.ProductID) from dbo.ProductDistributor pd with(NOLOCK) left join dbo.Product p with(NOLOCK) on p.ProductID = pd.ProductID where p.Published=1 and p.Deleted=0 and pd.DistributorID = @entityid
	
		SELECT ProductID, Name, SEName, Description, Price, SalePrice, SalesPrompt, VariantID, TaxClassID FROM
			( select p.ProductID,
				p.Name, 
				p.SEName, 
				p.Description,
				pv.Price,
				pv.SalePrice, 
				pv.VariantID,
				p.TaxClassID, 
				sp.Name as SalesPrompt,
				ROW_NUMBER() OVER(ORDER BY pd.DisplayOrder, p.Name, p.ProductID) as RowNum
				from dbo.Product p with(NOLOCK)
				left join dbo.ProductDistributor pd with(NOLOCK) on pd.ProductID = p.ProductID
				left join dbo.ProductVariant pv with(NOLOCK) on pv.ProductID = p.ProductID
				left join dbo.SalesPrompt sp with(NOLOCK) on sp.SalesPromptID = p.SalesPromptID
				where p.Published=1 and p.Deleted=0 and pd.DistributorID = @entityid and pv.IsDefault=1
			) ent
			WHERE RowNum > @lowbounds and RowNum <= @highbounds
		END
    ELSE IF @entitytype = 5   
        BEGIN
		SELECT @productcount = COUNT(pg.ProductID) from dbo.ProductGenre pg with(NOLOCK) left join dbo.Product p with(NOLOCK) on p.ProductID = pg.ProductID where p.Published=1 and p.Deleted=0 and pg.GenreID = @entityid
	
		SELECT ProductID, Name, SEName, Description, Price, SalePrice, SalesPrompt, VariantID, TaxClassID FROM
			( select p.ProductID,
				p.Name, 
				p.SEName,
				p.Description, 
				pv.Price,
				pv.SalePrice, 
				pv.VariantID,
				p.TaxClassID, 
				sp.Name as SalesPrompt,
				ROW_NUMBER() OVER(ORDER BY pg.DisplayOrder, p.Name, p.ProductID) as RowNum
				from dbo.Product p with(NOLOCK)
				left join dbo.ProductGenre pg with(NOLOCK) on pg.ProductID = p.ProductID
				left join dbo.ProductVariant pv with(NOLOCK) on pv.ProductID = p.ProductID
				left join dbo.SalesPrompt sp with(NOLOCK) on sp.SalesPromptID = p.SalesPromptID
				where p.Published=1 and p.Deleted=0 and pg.GenreID = @entityid and pv.IsDefault=1
			) ent
			WHERE RowNum > @lowbounds and RowNum <= @highbounds
		END
    ELSE IF @entitytype = 6  
        BEGIN
		SELECT @productcount = COUNT(pv.ProductID) from dbo.ProductVector pv with(NOLOCK) left join dbo.Product p with(NOLOCK) on p.ProductID = pv.ProductID where p.Published=1 and p.Deleted=0 and pv.VectorID = @entityid
	
		SELECT ProductID, Name, SEName, Description, Price, SalePrice, SalesPrompt, VariantID, TaxClassID FROM
			( select p.ProductID,
				p.Name, 
				p.SEName,
				p.Description, 
				pv.Price,
				pv.SalePrice,
				pv.VariantID,
				p.TaxClassID, 
				sp.Name as SalesPrompt,
				ROW_NUMBER() OVER(ORDER BY pvc.DisplayOrder, p.Name, p.ProductID) as RowNum
				from dbo.Product p with(NOLOCK)
				left join dbo.ProductVector pvc with(NOLOCK) on pvc.ProductID = p.ProductID
				left join dbo.ProductVariant pv with(NOLOCK) on pv.ProductID = p.ProductID
				left join dbo.SalesPrompt sp with(NOLOCK) on sp.SalesPromptID = p.SalesPromptID
				where p.Published=1 and p.Deleted=0 and pvc.VectorID = @entityid and pv.IsDefault=1
			) ent
			WHERE RowNum > @lowbounds and RowNum <= @highbounds
		END
	END
	
set @numpages = case when (@productcount % @pagesize = 0) then @productcount / @pagesize else (@productcount/@pagesize) + 1 end 
	
return @productcount

GO

/****** Object:  StoredProcedure [dbo].[aspdnsf_GetProductCount]    ******/
CREATE proc [dbo].[aspdnsf_GetProductCount]
	@entitytype		int, -- 1 = category, 2 = section, 3 = manufacturer, 4 = distributor, 5= genre, 6 = vector  
	@entityid		int
 
 
AS  
BEGIN  
  
 SET NOCOUNT ON   
  
	IF @entityid is null
		set @entityid = 0
	
	DECLARE @productcount int
	
	-- 1 = category, 2 = section, 3 = manufacturer, 4 = distributor, 5= genre, 6 = vector
	IF @entitytype = 1
		SELECT @productcount = COUNT(pc.ProductID) from dbo.ProductCategory pc with(NOLOCK) left join dbo.Product p with(NOLOCK) on p.ProductID = pc.ProductID where p.Published=1 and p.Deleted=0 and pc.CategoryID = @entityid
    ELSE IF @entitytype = 2  
		SELECT @productcount = COUNT(ps.ProductID) from dbo.ProductSection ps with(NOLOCK) left join dbo.Product p with(NOLOCK) on p.ProductID = ps.ProductID where p.Published=1 and p.Deleted=0 and ps.SectionID = @entityid
    ELSE IF @entitytype = 3  
        SELECT @productcount = COUNT(pm.ProductID) from dbo.ProductManufacturer pm with(NOLOCK) left join dbo.Product p with(NOLOCK) on p.ProductID = pm.ProductID where p.Published=1 and p.Deleted=0 and pm.ManufacturerID = @entityid
    ELSE IF @entitytype = 4 
        SELECT @productcount = COUNT(pd.ProductID) from dbo.ProductDistributor pd with(NOLOCK) left join dbo.Product p with(NOLOCK) on p.ProductID = pd.ProductID where p.Published=1 and p.Deleted=0 and pd.DistributorID = @entityid
    ELSE IF @entitytype = 5   
        SELECT @productcount = COUNT(pg.ProductID) from dbo.ProductGenre pg with(NOLOCK) left join dbo.Product p with(NOLOCK) on p.ProductID = pg.ProductID where p.Published=1 and p.Deleted=0 and pg.GenreID = @entityid
    ELSE IF @entitytype = 6  
        SELECT @productcount = COUNT(pv.ProductID) from dbo.ProductVector pv with(NOLOCK) left join dbo.Product p with(NOLOCK) on p.ProductID = pv.ProductID where p.Published=1 and p.Deleted=0 and pv.VectorID = @entityid
	END

return @productcount

GO

CREATE TABLE [dbo].[MobileDevice](
	[MobileDeviceID] [int] IDENTITY(1,1) NOT NULL,
	[UserAgent] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_MobileDevice] PRIMARY KEY CLUSTERED 
(
	[MobileDeviceID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[MobileDevice] ON
INSERT [dbo].[MobileDevice] ([MobileDeviceID], [UserAgent], [Name]) VALUES (1, N'w3c', NULL)
INSERT [dbo].[MobileDevice] ([MobileDeviceID], [UserAgent], [Name]) VALUES (2, N'acs-', NULL)
INSERT [dbo].[MobileDevice] ([MobileDeviceID], [UserAgent], [Name]) VALUES (3, N'alav', NULL)
INSERT [dbo].[MobileDevice] ([MobileDeviceID], [UserAgent], [Name]) VALUES (4, N'alca', NULL)
INSERT [dbo].[MobileDevice] ([MobileDeviceID], [UserAgent], [Name]) VALUES (5, N'amoi', NULL)
INSERT [dbo].[MobileDevice] ([MobileDeviceID], [UserAgent], [Name]) VALUES (6, N'audi', NULL)
INSERT [dbo].[MobileDevice] ([MobileDeviceID], [UserAgent], [Name]) VALUES (7, N'avan', NULL)
INSERT [dbo].[MobileDevice] ([MobileDeviceID], [UserAgent], [Name]) VALUES (8, N'benq', NULL)
INSERT [dbo].[MobileDevice] ([MobileDeviceID], [UserAgent], [Name]) VALUES (9, N'bird', NULL)
INSERT [dbo].[MobileDevice] ([MobileDeviceID], [UserAgent], [Name]) VALUES (10, N'blac', NULL)
INSERT [dbo].[MobileDevice] ([MobileDeviceID], [UserAgent], [Name]) VALUES (11, N'blaz', NULL)
INSERT [dbo].[MobileDevice] ([MobileDeviceID], [UserAgent], [Name]) VALUES (12, N'brew', NULL)
INSERT [dbo].[MobileDevice] ([MobileDeviceID], [UserAgent], [Name]) VALUES (13, N'cell', NULL)
INSERT [dbo].[MobileDevice] ([MobileDeviceID], [UserAgent], [Name]) VALUES (14, N'cldc', NULL)
INSERT [dbo].[MobileDevice] ([MobileDeviceID], [UserAgent], [Name]) VALUES (15, N'cmd-', NULL)
INSERT [dbo].[MobileDevice] ([MobileDeviceID], [UserAgent], [Name]) VALUES (16, N'dang', NULL)
INSERT [dbo].[MobileDevice] ([MobileDeviceID], [UserAgent], [Name]) VALUES (17, N'doco', NULL)
INSERT [dbo].[MobileDevice] ([MobileDeviceID], [UserAgent], [Name]) VALUES (18, N'eric', NULL)
INSERT [dbo].[MobileDevice] ([MobileDeviceID], [UserAgent], [Name]) VALUES (19, N'hipt', NULL)
INSERT [dbo].[MobileDevice] ([MobileDeviceID], [UserAgent], [Name]) VALUES (20, N'inno', NULL)
INSERT [dbo].[MobileDevice] ([MobileDeviceID], [UserAgent], [Name]) VALUES (21, N'ipaq', NULL)
INSERT [dbo].[MobileDevice] ([MobileDeviceID], [UserAgent], [Name]) VALUES (22, N'java', NULL)
INSERT [dbo].[MobileDevice] ([MobileDeviceID], [UserAgent], [Name]) VALUES (23, N'jigs', NULL)
INSERT [dbo].[MobileDevice] ([MobileDeviceID], [UserAgent], [Name]) VALUES (24, N'kddi', NULL)
INSERT [dbo].[MobileDevice] ([MobileDeviceID], [UserAgent], [Name]) VALUES (25, N'keji', NULL)
INSERT [dbo].[MobileDevice] ([MobileDeviceID], [UserAgent], [Name]) VALUES (26, N'leno', NULL)
INSERT [dbo].[MobileDevice] ([MobileDeviceID], [UserAgent], [Name]) VALUES (27, N'lg-c', NULL)
INSERT [dbo].[MobileDevice] ([MobileDeviceID], [UserAgent], [Name]) VALUES (28, N'lg-d', NULL)
INSERT [dbo].[MobileDevice] ([MobileDeviceID], [UserAgent], [Name]) VALUES (29, N'lge-', NULL)
INSERT [dbo].[MobileDevice] ([MobileDeviceID], [UserAgent], [Name]) VALUES (30, N'maui', NULL)
INSERT [dbo].[MobileDevice] ([MobileDeviceID], [UserAgent], [Name]) VALUES (31, N'maxo', NULL)
INSERT [dbo].[MobileDevice] ([MobileDeviceID], [UserAgent], [Name]) VALUES (32, N'midp', NULL)
INSERT [dbo].[MobileDevice] ([MobileDeviceID], [UserAgent], [Name]) VALUES (33, N'mini', NULL)
INSERT [dbo].[MobileDevice] ([MobileDeviceID], [UserAgent], [Name]) VALUES (34, N'mits', NULL)
INSERT [dbo].[MobileDevice] ([MobileDeviceID], [UserAgent], [Name]) VALUES (35, N'mmef', NULL)
INSERT [dbo].[MobileDevice] ([MobileDeviceID], [UserAgent], [Name]) VALUES (36, N'mmp', NULL)
INSERT [dbo].[MobileDevice] ([MobileDeviceID], [UserAgent], [Name]) VALUES (37, N'mobi', NULL)
INSERT [dbo].[MobileDevice] ([MobileDeviceID], [UserAgent], [Name]) VALUES (38, N'mot-', NULL)
INSERT [dbo].[MobileDevice] ([MobileDeviceID], [UserAgent], [Name]) VALUES (39, N'moto', NULL)
INSERT [dbo].[MobileDevice] ([MobileDeviceID], [UserAgent], [Name]) VALUES (40, N'mwbp', NULL)
INSERT [dbo].[MobileDevice] ([MobileDeviceID], [UserAgent], [Name]) VALUES (41, N'nec-', NULL)
INSERT [dbo].[MobileDevice] ([MobileDeviceID], [UserAgent], [Name]) VALUES (42, N'newt', NULL)
INSERT [dbo].[MobileDevice] ([MobileDeviceID], [UserAgent], [Name]) VALUES (43, N'noki', NULL)
INSERT [dbo].[MobileDevice] ([MobileDeviceID], [UserAgent], [Name]) VALUES (44, N'oper', NULL)
INSERT [dbo].[MobileDevice] ([MobileDeviceID], [UserAgent], [Name]) VALUES (45, N'palm', NULL)
INSERT [dbo].[MobileDevice] ([MobileDeviceID], [UserAgent], [Name]) VALUES (46, N'pana', NULL)
INSERT [dbo].[MobileDevice] ([MobileDeviceID], [UserAgent], [Name]) VALUES (47, N'pant', NULL)
INSERT [dbo].[MobileDevice] ([MobileDeviceID], [UserAgent], [Name]) VALUES (48, N'pda', NULL)
INSERT [dbo].[MobileDevice] ([MobileDeviceID], [UserAgent], [Name]) VALUES (49, N'phil', NULL)
INSERT [dbo].[MobileDevice] ([MobileDeviceID], [UserAgent], [Name]) VALUES (50, N'phone', NULL)
INSERT [dbo].[MobileDevice] ([MobileDeviceID], [UserAgent], [Name]) VALUES (51, N'play', NULL)
INSERT [dbo].[MobileDevice] ([MobileDeviceID], [UserAgent], [Name]) VALUES (52, N'port', NULL)
INSERT [dbo].[MobileDevice] ([MobileDeviceID], [UserAgent], [Name]) VALUES (53, N'prox', NULL)
INSERT [dbo].[MobileDevice] ([MobileDeviceID], [UserAgent], [Name]) VALUES (54, N'qwap', NULL)
INSERT [dbo].[MobileDevice] ([MobileDeviceID], [UserAgent], [Name]) VALUES (55, N'sage', NULL)
INSERT [dbo].[MobileDevice] ([MobileDeviceID], [UserAgent], [Name]) VALUES (56, N'sams', NULL)
INSERT [dbo].[MobileDevice] ([MobileDeviceID], [UserAgent], [Name]) VALUES (57, N'sany', NULL)
INSERT [dbo].[MobileDevice] ([MobileDeviceID], [UserAgent], [Name]) VALUES (58, N'sch-', NULL)
INSERT [dbo].[MobileDevice] ([MobileDeviceID], [UserAgent], [Name]) VALUES (59, N'sec-', NULL)
INSERT [dbo].[MobileDevice] ([MobileDeviceID], [UserAgent], [Name]) VALUES (60, N'send', NULL)
INSERT [dbo].[MobileDevice] ([MobileDeviceID], [UserAgent], [Name]) VALUES (61, N'seri', NULL)
INSERT [dbo].[MobileDevice] ([MobileDeviceID], [UserAgent], [Name]) VALUES (62, N'sgh-', NULL)
INSERT [dbo].[MobileDevice] ([MobileDeviceID], [UserAgent], [Name]) VALUES (63, N'shar', NULL)
INSERT [dbo].[MobileDevice] ([MobileDeviceID], [UserAgent], [Name]) VALUES (64, N'sie-', NULL)
INSERT [dbo].[MobileDevice] ([MobileDeviceID], [UserAgent], [Name]) VALUES (65, N'siem', NULL)
INSERT [dbo].[MobileDevice] ([MobileDeviceID], [UserAgent], [Name]) VALUES (66, N'smal', NULL)
INSERT [dbo].[MobileDevice] ([MobileDeviceID], [UserAgent], [Name]) VALUES (67, N'smar', NULL)
INSERT [dbo].[MobileDevice] ([MobileDeviceID], [UserAgent], [Name]) VALUES (68, N'smartphone', NULL)
INSERT [dbo].[MobileDevice] ([MobileDeviceID], [UserAgent], [Name]) VALUES (69, N'sony', NULL)
INSERT [dbo].[MobileDevice] ([MobileDeviceID], [UserAgent], [Name]) VALUES (70, N'sph-', NULL)
INSERT [dbo].[MobileDevice] ([MobileDeviceID], [UserAgent], [Name]) VALUES (71, N'symb', NULL)
INSERT [dbo].[MobileDevice] ([MobileDeviceID], [UserAgent], [Name]) VALUES (72, N't-mo', NULL)
INSERT [dbo].[MobileDevice] ([MobileDeviceID], [UserAgent], [Name]) VALUES (73, N'teli', NULL)
INSERT [dbo].[MobileDevice] ([MobileDeviceID], [UserAgent], [Name]) VALUES (74, N'tim-', NULL)
INSERT [dbo].[MobileDevice] ([MobileDeviceID], [UserAgent], [Name]) VALUES (76, N'tsm-', NULL)
INSERT [dbo].[MobileDevice] ([MobileDeviceID], [UserAgent], [Name]) VALUES (77, N'up.browser', NULL)
INSERT [dbo].[MobileDevice] ([MobileDeviceID], [UserAgent], [Name]) VALUES (78, N'up.link', NULL)
INSERT [dbo].[MobileDevice] ([MobileDeviceID], [UserAgent], [Name]) VALUES (79, N'upg1', NULL)
INSERT [dbo].[MobileDevice] ([MobileDeviceID], [UserAgent], [Name]) VALUES (80, N'upsi', NULL)
INSERT [dbo].[MobileDevice] ([MobileDeviceID], [UserAgent], [Name]) VALUES (81, N'vk-v', NULL)
INSERT [dbo].[MobileDevice] ([MobileDeviceID], [UserAgent], [Name]) VALUES (82, N'voda', NULL)
INSERT [dbo].[MobileDevice] ([MobileDeviceID], [UserAgent], [Name]) VALUES (83, N'wap', NULL)
INSERT [dbo].[MobileDevice] ([MobileDeviceID], [UserAgent], [Name]) VALUES (84, N'wap-', NULL)
INSERT [dbo].[MobileDevice] ([MobileDeviceID], [UserAgent], [Name]) VALUES (85, N'wapa', NULL)
INSERT [dbo].[MobileDevice] ([MobileDeviceID], [UserAgent], [Name]) VALUES (86, N'wapi', NULL)
INSERT [dbo].[MobileDevice] ([MobileDeviceID], [UserAgent], [Name]) VALUES (87, N'wapp', NULL)
INSERT [dbo].[MobileDevice] ([MobileDeviceID], [UserAgent], [Name]) VALUES (88, N'wapr', NULL)
INSERT [dbo].[MobileDevice] ([MobileDeviceID], [UserAgent], [Name]) VALUES (89, N'webc', NULL)
INSERT [dbo].[MobileDevice] ([MobileDeviceID], [UserAgent], [Name]) VALUES (90, N'windows ce', NULL)
INSERT [dbo].[MobileDevice] ([MobileDeviceID], [UserAgent], [Name]) VALUES (91, N'winw', NULL)
INSERT [dbo].[MobileDevice] ([MobileDeviceID], [UserAgent], [Name]) VALUES (92, N'xda', NULL)
INSERT [dbo].[MobileDevice] ([MobileDeviceID], [UserAgent], [Name]) VALUES (93, N'xda-', NULL)
INSERT [dbo].[MobileDevice] ([MobileDeviceID], [UserAgent], [Name]) VALUES (94, N'iphone', NULL)
INSERT [dbo].[MobileDevice] ([MobileDeviceID], [UserAgent], [Name]) VALUES (95, N'blackberry', NULL)
SET IDENTITY_INSERT [dbo].[MobileDevice] OFF

GO


CREATE TABLE [dbo].[QuantityDiscountTable](
    [QuantityDiscountTableID] [int] IDENTITY(1,1) NOT NULL,
    [QuantityDiscountTableGUID] [uniqueidentifier] NULL,
    [QuantityDiscountID] [int] NULL,
    [LowQuantity] [int] NOT NULL,
    [HighQuantity] [int] NOT NULL,
    [DiscountPercent] [money] NOT NULL,
    [CreatedOn] [datetime] NOT NULL CONSTRAINT DF_QuantityDiscountTable_CreatedOn DEFAULT(getdate()),
    CONSTRAINT [PK_QuantityDiscountTable] PRIMARY KEY CLUSTERED 
    (
        [QuantityDiscountTableID] ASC
    )
)


GO


CREATE TABLE [dbo].[ExtendedPrice](
    [ExtendedPriceID] [int] IDENTITY(1,1) NOT NULL,
    [ExtendedPriceGUID] [uniqueidentifier] NOT NULL CONSTRAINT DF_ExtendedPrice_ExtendedPriceGUID DEFAULT (newid()),
    [VariantID] [int] NOT NULL,
    [CustomerLevelID] [int] NOT NULL CONSTRAINT DF_ExtendedPrice_CustomerLevelID DEFAULT ((0)),
    [Price] [money] NOT NULL CONSTRAINT DF_ExtendedPrice_Price DEFAULT ((0.0)),
    [ExtensionData] [ntext] NULL,
    [CreatedOn] [datetime] NOT NULL CONSTRAINT DF_ExtendedPrice_CreatedOn DEFAULT (getdate()),
    CONSTRAINT [PK_ExtendedPrice] PRIMARY KEY CLUSTERED 
    (
        [ExtendedPriceID] ASC
    )
)



GO


CREATE TABLE [dbo].[SalesPrompt](
    [SalesPromptID] [int] IDENTITY(1,1) NOT NULL,
    [SalesPromptGUID] [uniqueidentifier] NOT NULL CONSTRAINT DF_SalesPrompt_SalesPromptGUID DEFAULT(newid()),
    [Name] [nvarchar](400) NOT NULL,
    [ExtensionData] [ntext] NULL,
    [Deleted] [tinyint] NOT NULL CONSTRAINT DF_SalesPrompt_Deleted DEFAULT((0)),
    [CreatedOn] [datetime] NOT NULL CONSTRAINT DF_SalesPrompt_CreatedOn DEFAULT(getdate()),
    CONSTRAINT [PK_SalesPrompts] PRIMARY KEY CLUSTERED 
    (
        [SalesPromptID] ASC
    )
)



GO


CREATE TABLE [dbo].[QuantityDiscount](
    [QuantityDiscountID] [int] IDENTITY(1,1) NOT NULL,
    [QuantityDiscountGUID] [uniqueidentifier] NOT NULL CONSTRAINT DF_QuantityDiscount_QuantityDiscountGUID DEFAULT(newid()),
    [Name] [nvarchar](400) NOT NULL,
    [DisplayOrder] [int] NOT NULL CONSTRAINT DF_QuantityDiscount_DisplayOrder DEFAULT((1)),
    [ExtensionData] [ntext] NULL,
    [DiscountType] [tinyint] NOT NULL CONSTRAINT [DF_QuantityDiscount_DiscountType] DEFAULT ((0)),
    [CreatedOn] [datetime] NOT NULL CONSTRAINT DF_QuantityDiscount_CreatedOn DEFAULT(getdate()),
    CONSTRAINT [PK_QuantityDiscount] PRIMARY KEY CLUSTERED 
    (
        [QuantityDiscountID] 
    )
)



GO


CREATE TABLE [dbo].[Document](
    [DocumentID] [int] IDENTITY(1,1) NOT NULL,
    [DocumentGUID] [uniqueidentifier] NOT NULL CONSTRAINT DF_Document_DocumentGUID DEFAULT(newid()),
    [DocumentTypeID] [int] NULL CONSTRAINT DF_Document_DocumentTypeID DEFAULT((1)),
    [Name] [nvarchar](400) NOT NULL,
    [Summary] [ntext] NULL,
    [Description] [ntext] NULL,
    [MiscText] [ntext] NULL,
    [SEName] [nvarchar](150) NULL,
    [SEKeywords] [ntext] NULL,
    [SEDescription] [ntext] NULL,
    [SETitle] [ntext] NULL,
    [SENoScript] [ntext] NULL,
    [SEAltText] [ntext] NULL,
    [SpecTitle] [ntext] NULL,
    [IsFeatured] [tinyint] NOT NULL CONSTRAINT DF_Document_IsFeatured DEFAULT((0)),
    [RequiresRegistration] [tinyint] NOT NULL CONSTRAINT DF_Document_RequiresRegistration DEFAULT((0)),
    [Looks] [int] NOT NULL CONSTRAINT DF_Document_Looks DEFAULT((0)),
    [Notes] [ntext] NULL,
    [RelatedCategories] [ntext] NULL,
    [RelatedSections] [ntext] NULL,
    [RelatedManufacturers] [ntext] NULL,
    [RelatedProducts] [ntext] NULL,
    [Published] [tinyint] NOT NULL CONSTRAINT DF_Document_Published DEFAULT((1)),
    [Wholesale] [tinyint] NOT NULL CONSTRAINT DF_Document_Wholesale DEFAULT((0)),
    [ExtensionData] [ntext] NULL,
    [ContentsBGColor] [nvarchar](10) NULL,
    [PageBGColor] [nvarchar](10) NULL,
    [GraphicsColor] [nvarchar](20) NULL,
    [ImageFilenameOverride] [ntext] NULL,
    [XmlPackage] [nvarchar](100) NULL,
    [IsImport] [tinyint] NOT NULL CONSTRAINT DF_Document_IsImport DEFAULT((0)),
    [Deleted] [tinyint] NOT NULL CONSTRAINT DF_Document_Deleted DEFAULT((0)),
    [CreatedOn] [datetime] NOT NULL CONSTRAINT DF_Document_CreatedOn DEFAULT(getdate()),
    [PageSize] [int] NOT NULL CONSTRAINT DF_Document_PageSize DEFAULT((20)),
    CONSTRAINT [PK_Document] PRIMARY KEY CLUSTERED 
    (
        [DocumentID] ASC
    )
)



GO


CREATE TABLE [dbo].[DocumentCustomerLevel](
    [DocumentID] [int] NOT NULL,
    [CustomerLevelID] [int] NOT NULL,
    [CreatedOn] [datetime] NOT NULL CONSTRAINT DF_DocumentCustomerLevel_CreatedOn DEFAULT(getdate()),
    CONSTRAINT [PK_DocumentCustomerLevel] PRIMARY KEY CLUSTERED 
    (
        [DocumentID] ASC,
        [CustomerLevelID] ASC
    )
)



GO


CREATE FUNCTION dbo.ZeroFloor(@value decimal(15, 6))
RETURNS decimal(15, 6)
AS BEGIN
    IF @value < 0
        SET @value = 0
    RETURN @value 
END

GO


CREATE FUNCTION dbo.Split(@String ntext, @Delimiter char(1))
RETURNS @Results TABLE (Items nvarchar(4000))
AS
BEGIN
    DECLARE @STARTINDEX INT, @ENDINDEX INT, @STRINGLEN int, @LOOPSTRING NVARCHAR(4000)
    SET @STRINGLEN = DATALENGTH(ISNULL(@STRING, N''))/2
    SET @STARTINDEX = 1

    DECLARE @SLICE nvarchar(4000)
    DECLARE @SUBSTR nvarchar(4000)

    SET @SLICE  = N''

    WHILE @STARTINDEX < @STRINGLEN+1 BEGIN
        
        SET @SUBSTR = SUBSTRING(@STRING, @STARTINDEX, 1)

        IF @SUBSTR = @Delimiter BEGIN
            IF @SLICE != N''
                INSERT INTO @Results(Items) VALUES(@SLICE)
            SET @SLICE = N''
        END
        ELSE
            SET @SLICE = @SLICE+@SUBSTR

        SET @STARTINDEX = @STARTINDEX + 1
    END
    IF LEN(@SLICE) > 0
        INSERT INTO @Results(Items) VALUES(@SLICE)
    RETURN
END


GO


create function dbo.MakeSEName(@string varchar(8000))
RETURNS varchar(4000)
AS
BEGIN
    declare @charindex int, @newstring varchar(8000)

    set @string = replace(replace(replace(@string, ' ', '-'), '---', '-'), '--', '-')
        
    set @newstring = ''

    select @charindex = PATINDEX('%[^a-z0-9_-]%', @string)

    IF @charindex = len(@string)
        select @newstring = left(@string, @charindex-1)
        
    ELSE BEGIN
        select @newstring = @newstring + left(@string, @charindex-1), @string = substring(@string, @charindex+1, len(@string)-@charindex+1)
        WHILE PATINDEX('%[^a-z0-9_-]%', @string) > 0 BEGIN
            select @charindex = PATINDEX('%[^a-z0-9_-]%', @string)
            IF @charindex = len(@string)
                select @newstring = @newstring + left(@string, @charindex-1), @string = ''
            ELSE
                select @newstring = @newstring + left(@string, @charindex-1), @string = substring(@string, @charindex+1, len(@string)-@charindex+1)
        END
    END
    RETURN lower(@newstring)

END


GO



CREATE FUNCTION [dbo].[GetIndexColumnOrder] 
( 
    @object_id INT, 
    @index_id TINYINT, 
    @column_id TINYINT 
) 
RETURNS NVARCHAR(5) 
AS 
BEGIN 
    DECLARE @r NVARCHAR(5) 
    SELECT @r = CASE INDEXKEY_PROPERTY 
    ( 
        @object_id, 
        @index_id, 
        @column_id, 
        'IsDescending' 
    ) 
        WHEN 1 THEN N' DESC' 
        ELSE N'' 
    END 
    RETURN @r 
END 


GO


create function [dbo].[getSectionPath](@sectionID int)
    RETURNS nvarchar(4000)
AS
BEGIN
    DECLARE @Sectionpath nvarchar(4000), @SecID int, @SectionName nvarchar(400)
    SET @Sectionpath  = ''
    
    SELECT @SecID = ParentSectionID, @SectionName = Name From dbo.Section with (nolock) where SectionID = @sectionID 
    WHILE @@rowcount > 0 BEGIN
        SET @Sectionpath = '\' + @SectionName + @Sectionpath 
        SELECT @SecID = ParentSectionID, @SectionName = Name From dbo.Section with (nolock) where SectionID = @SecID 
    END
    
    RETURN @Sectionpath 
END



GO


CREATE function [dbo].[getCategoryPath](@categoryID int)
    RETURNS nvarchar(4000)
AS
BEGIN
    DECLARE @categorypath nvarchar(4000), @catID int, @catName nvarchar(400)
    SET @categorypath  = ''
    
    SELECT @catID = ParentCategoryID, @catName = Name From dbo.category with (nolock) where CategoryID = @categoryID 
    WHILE @@rowcount > 0 BEGIN
        SET @categorypath = '\' + @catName + @categorypath 
        SELECT @catID = ParentCategoryID, @catName = Name From dbo.category with (nolock) where CategoryID = @catID 
    END
    
    RETURN @categorypath 
END


GO


CREATE TABLE [dbo].[KitCart](
    [KitCartRecID] [int] IDENTITY(1,1) NOT NULL,
    [CustomerID] [int] NOT NULL,
    [ShoppingCartRecID] [int] NOT NULL CONSTRAINT DF_KitCart_ShoppingCartRecID DEFAULT((0)),
    [ProductID] [int] NOT NULL,
    [VariantID] [int] NOT NULL,
    [KitGroupID] [int] NOT NULL,
    [KitGroupTypeID] [int] NOT NULL,
    [KitItemID] [int] NOT NULL,
    [Quantity] [int] NOT NULL CONSTRAINT DF_KitCart_Quantity DEFAULT((1)),
    [CartType] [int] NOT NULL CONSTRAINT DF_KitCart_CartType DEFAULT((0)),
    [OriginalRecurringOrderNumber] [int] NULL,
    [TextOption] [ntext] NULL,
    [InventoryVariantID] [int] NULL,
    [InventoryVariantColor] [nvarchar] (100) NULL, -- must be in master store locale language, this is NOT a ml field!
    [InventoryVariantSize] [nvarchar] (100) NULL, -- must be in master store locale language, this is NOT a ml field!
    [ExtensionData] [ntext] NULL,
    [CreatedOn] [datetime] NOT NULL CONSTRAINT DF_KitCart_CreatedOn DEFAULT(getdate()),
    CONSTRAINT [PK_KitCart] PRIMARY KEY CLUSTERED 
    (
        [KitCartRecID] ASC
    )
)


GO


CREATE TABLE [dbo].[KitGroup](
    [KitGroupID] [int] IDENTITY(1,1) NOT NULL,
    [KitGroupGUID] [uniqueidentifier] NOT NULL CONSTRAINT DF_KitGroup_KitGroupGUID DEFAULT(newid()),
    [Name] [nvarchar](400) NOT NULL,
    [Description] [ntext] NULL,
    [Summary] [ntext] null,
    [ProductID] [int] NOT NULL,
    [DisplayOrder] [int] NOT NULL CONSTRAINT DF_KitGroup_DisplayOrder DEFAULT((1)),
    [KitGroupTypeID] [int] NOT NULL,
    [IsRequired] [tinyint] NOT NULL CONSTRAINT DF_KitGroup_IsRequired DEFAULT((0)),
    [ExtensionData] [ntext] NULL,
    [CreatedOn] [datetime] NOT NULL CONSTRAINT DF_KitGroup_CreatedOn DEFAULT(getdate()),
    [IsReadOnly] [tinyint] NOT NULL CONSTRAINT DF_KitItem_IsReadOnly DEFAULT(0),
    CONSTRAINT [PK_KitGroup] PRIMARY KEY CLUSTERED 
    (
        [KitGroupID] ASC
    )
)



GO



CREATE TABLE [dbo].[KitGroupType](
    [KitGroupTypeID] [int] IDENTITY(1,1) NOT NULL,
    [KitGroupTypeGUID] [uniqueidentifier] NOT NULL CONSTRAINT DF_KitGroupType_KitGroupTypeGUID DEFAULT(newid()),
    [Name] [nvarchar](400) NOT NULL,
    [DisplayOrder] [int] NOT NULL CONSTRAINT DF_KitGroupType_DisplayOrder DEFAULT((1)),
    [CreatedOn] [datetime] NOT NULL CONSTRAINT DF_KitGroupType_CreatedOn DEFAULT(getdate()),
    CONSTRAINT [PK_KitGroupType] PRIMARY KEY CLUSTERED 
    (
        [KitGroupTypeID] ASC
    )
)

GO


CREATE TABLE [dbo].[KitItem](
    [KitItemID] [int] IDENTITY(1,1) NOT NULL,
    [KitItemGUID] [uniqueidentifier] NOT NULL CONSTRAINT DF_KitItem_KitItemGUID DEFAULT(newid()),
    [KitGroupID] [int] NOT NULL,
    [Name] [nvarchar](400) NOT NULL,
    [Description] [ntext] NULL,
    [PriceDelta] [money] NOT NULL CONSTRAINT DF_KitItem_PriceDelta DEFAULT((0.0)),
    [WeightDelta] [money] NOT NULL CONSTRAINT DF_KitItem_WeightDelta DEFAULT(0.0),
    [IsDefault] [tinyint] NOT NULL CONSTRAINT DF_KitItem_IsDefault DEFAULT((0)),
    [DisplayOrder] [int] NOT NULL CONSTRAINT DF_KitItem_DisplayOrder DEFAULT((1)),
    [ExtensionData] [ntext] NULL,
    [TextOptionMaxLength] [int] NULL,
    [TextOptionWidth] [int] NULL,
    [TextOptionHeight] [int] NULL,
    [InventoryVariantID] [int] NULL,
    [InventoryQuantityDelta] [int] NOT NULL CONSTRAINT DF_KitItem_InventoryQuantityDelta DEFAULT(0),
    [InventoryVariantColor] [nvarchar] (100) NULL, -- must be in master store locale language, this is NOT a ml field!
    [InventoryVariantSize] [nvarchar] (100) NULL, -- must be in master store locale language, this is NOT a ml field!
    [CreatedOn] [datetime] NOT NULL CONSTRAINT DF_KitItem_CreatedOn DEFAULT(getdate()),
    CONSTRAINT [PK_KitItem] PRIMARY KEY CLUSTERED 
    (
        [KitItemID] ASC
    )
)



GO


CREATE TABLE [dbo].[Country](
    [CountryID] [int] IDENTITY(1,1) NOT NULL,
    [CountryGUID] [uniqueidentifier] NOT NULL CONSTRAINT DF_Country_CountryGUID DEFAULT(newid()),
    [Name] [nvarchar](100) NOT NULL,
    [TwoLetterISOCode] [nvarchar](2) NULL,
    [ThreeLetterISOCode] [nvarchar](3) NULL,
    [NumericISOCode] [nvarchar](3) NULL,
    [Published] [tinyint] NOT NULL CONSTRAINT DF_Country_Published DEFAULT((1)),
    [DisplayOrder] [int] NOT NULL CONSTRAINT DF_Country_DisplayOrder DEFAULT((1)),
    [ExtensionData] [ntext] NULL,
    [CreatedOn] [datetime] NOT NULL CONSTRAINT DF_Country_CreatedOn DEFAULT(getdate()),
	[PostalCodeRequired] [tinyint] NOT NULL CONSTRAINT DF_Country_PostalCodeRequired DEFAULT((1)),
	[PostalCodeRegex] [nvarchar] (4000) NULL,
	[PostalCodeExample] [nvarchar] (50) NULL,
    CONSTRAINT [PK_Country] PRIMARY KEY CLUSTERED 
    (
        [CountryID] ASC
    )
)


GO


CREATE TABLE [dbo].[State](
    [StateID] [int] IDENTITY(1,1) NOT NULL,
    [StateGUID] [uniqueidentifier] NOT NULL CONSTRAINT DF_State_StateGUID DEFAULT(newid()),
    [Name] [nvarchar](100) NOT NULL,
    [CountryID] [int] NULL,
    [Abbreviation] [nvarchar](5) NOT NULL,
    [Published] [tinyint] NOT NULL CONSTRAINT DF_State_Published DEFAULT((1)),
    [DisplayOrder] [int] NOT NULL CONSTRAINT DF_State_DisplayOrder DEFAULT((1)),
    [ExtensionData] [ntext] NULL,
    [CreatedOn] [datetime] NOT NULL CONSTRAINT DF_State_CreatedOn DEFAULT(getdate()),
    CONSTRAINT [PK_State] PRIMARY KEY CLUSTERED 
    (
        [StateID] ASC
    )
)


GO


CREATE TABLE [dbo].[Currency](
    [CurrencyID] [int] IDENTITY(1,1) NOT NULL,
    [CurrencyGUID] [uniqueidentifier] NOT NULL CONSTRAINT DF_Currency_CurrencyGUID DEFAULT(newid()),
    [Name] [nvarchar](100) NOT NULL,
    [CurrencyCode] [nvarchar](10) NOT NULL,
    [ExchangeRate] [money] NULL,
    [WasLiveRate] [tinyint] NOT NULL CONSTRAINT DF_Currency_WasLiveRate DEFAULT((0)),
    [DisplayLocaleFormat] [nvarchar](10) NULL,
    [Symbol] [nvarchar](10) NULL,
    [ExtensionData] [ntext] NULL,
    [Published] [tinyint] NOT NULL CONSTRAINT DF_Currency_Published DEFAULT((1)),
    [DisplayOrder] [int] NOT NULL CONSTRAINT DF_Currency_DisplayOrder DEFAULT((1)),
    [DisplaySpec] [nvarchar](20) NULL,
    [CreatedOn] [datetime] NOT NULL CONSTRAINT DF_Currency_CreatedOn DEFAULT(getdate()),
    [LastUpdated] [datetime] NOT NULL CONSTRAINT DF_Currency_LastUpdated DEFAULT (getdate()),
    CONSTRAINT [PK_Currency] PRIMARY KEY CLUSTERED 
    (
        [CurrencyID] ASC
    )
)
 

GO


CREATE TABLE [dbo].[LocaleSetting](
    [LocaleSettingID] [int] IDENTITY(1,1) NOT NULL,
    [LocaleSettingGUID] [uniqueidentifier] NOT NULL CONSTRAINT DF_LocaleSetting_LocaleSettingGUID DEFAULT(newid()),
    [Name] [nvarchar](10) NOT NULL,
    [Description] [nvarchar](255) NOT NULL,
    [DisplayOrder] [int] NOT NULL CONSTRAINT DF_LocaleSetting_DisplayOrder DEFAULT((1)),
    [CreatedOn] [datetime] NOT NULL CONSTRAINT DF_LocaleSetting_CreatedOn DEFAULT(getdate()),
    [DefaultCurrencyID] [int] NOT NULL CONSTRAINT DF_LocaleSetting_DefaultCurrencyID DEFAULT((1)),
    CONSTRAINT [PK_Locale] PRIMARY KEY CLUSTERED 
    (
        [LocaleSettingID] ASC
    )
)



GO


CREATE TABLE [dbo].[StringResource](
    [StringResourceID] [int] IDENTITY(1,1) NOT NULL,
    [StringResourceGUID] [uniqueidentifier] NOT NULL CONSTRAINT DF_StringResource_StringResourceGUID DEFAULT(newid()),
    [StoreID] INT NOT NULL CONSTRAINT DF__StoreID DEFAULT(1),
    [Name] [nvarchar](100) NOT NULL,
    [LocaleSetting] [nvarchar](10) NOT NULL,
    [ConfigValue] [nvarchar](2500) NULL,
    [Modified] [tinyint] NOT NULL CONSTRAINT DF_StringResource_Modified DEFAULT((0)), -- if one, that means the user edited this string in the admin site
    [CreatedOn] [datetime] NOT NULL CONSTRAINT DF_StringResource_CreatedOn DEFAULT(getdate()),
    CONSTRAINT [PK_StringResource] PRIMARY KEY CLUSTERED 
    (
        [StringResourceID] ASC
    )
)


GO


CREATE TABLE [dbo].[ProductLocaleSetting](
    [ProductID] [int] NOT NULL,
    [LocaleSettingID] [int] NOT NULL,
    [DisplayOrder] [int] NOT NULL CONSTRAINT DF_ProductLocaleSetting_DisplayOrder DEFAULT((1)),
    [CreatedOn] [datetime] NOT NULL CONSTRAINT DF_ProductLocaleSetting_CreatedOn DEFAULT(getdate()),
    CONSTRAINT [PK_ProductLocaleSetting] PRIMARY KEY CLUSTERED 
    (
        [ProductID] ASC,
        [LocaleSettingID] ASC
    )
)



GO


CREATE TABLE [dbo].[MailingMgrLog](
    [MailingMgrLogID] [int] IDENTITY(1,1) NOT NULL,
    [MailingMgrLogGUID] [uniqueidentifier] NOT NULL CONSTRAINT DF_MailingMgrLog_MailingMgrLogGUID DEFAULT(newid()),
    [SentOn] [datetime] NOT NULL CONSTRAINT DF_MailingMgrLog_SentOn DEFAULT(getdate()),
    [ToEmail] [nvarchar](100) NOT NULL,
    [FromEmail] [nvarchar](100) NOT NULL,
    [Subject] [nvarchar](255) NULL,
    [Body] [ntext] NULL,
    CONSTRAINT [PK_MailingMgrLog] PRIMARY KEY CLUSTERED 
    (
        [MailingMgrLogID] ASC
    )
)



GO


CREATE TABLE NewsletterMailList(
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[GUID] [uniqueidentifier] NULL CONSTRAINT [DF_Newsletter_NewGUID]  DEFAULT (newid()),
	[EMailAddress] [nvarchar](50),
	[FirstName] [nvarchar](30),
	[LastName] [nvarchar](30),
	[SubscriptionConfirmed] [bit] NULL CONSTRAINT [DF_Newsletter_Confirmed]  DEFAULT ((1)),
	[AddedOn] [datetime] NULL,
	[SubscribedOn] [datetime] NULL,
	[UnsubscribedOn] [datetime] NULL
	)


GO


CREATE TABLE Store(
	StoreID INT IDENTITY(1,1) NOT NULL,
	StoreGUID UNIQUEIDENTIFIER NOT NULL CONSTRAINT [DF_Store_StoreGUID]  DEFAULT (newid()),
	[ProductionURI] NVARCHAR(255) NULL,
	[StagingURI] NVARCHAR(255) NULL,
	[DevelopmentURI] NVARCHAR(255) NULL,
	[Name] NVARCHAR(400) NOT NULL,
	Summary NTEXT NULL,
	Description NTEXT NULL,
	Published TINYINT NOT NULL CONSTRAINT [DF_Store_Published]  DEFAULT ((0)),
	Deleted TINYINT NOT NULL CONSTRAINT [DF_Store_Deleted]  DEFAULT ((0)),
	SkinID INT NOT NULL CONSTRAINT [DF_Store_SkinID]  DEFAULT ((0)),
	IsDefault TINYINT NOT NULL CONSTRAINT [DF_Store_IsDefault]  DEFAULT ((0)),
	CreatedOn DATETIME NOT NULL CONSTRAINT [DF_Store_Created]  DEFAULT (GETDATE())
	CONSTRAINT [PK_Store] PRIMARY KEY CLUSTERED 
	(
		[StoreID] ASC
	)ON [PRIMARY]
)
GO

ALTER TABLE Store ADD CONSTRAINT [CHK_Store_HasURI] CHECK  ((NOT ([ProductionURI] IS NULL AND [StagingURI] IS NULL AND [DevelopmentURI] IS NULL)))


GO


CREATE TABLE [dbo].[CustomCart](
    [CustomCartRecID] [int] IDENTITY(1,1) NOT NULL,
    [CustomerID] [int] NOT NULL,
    [PackID] [int] NOT NULL,
    [ShoppingCartRecID] [int] NOT NULL CONSTRAINT DF_CustomCart_ShoppingCartRecID DEFAULT((0)),
    [ProductSKU] [nvarchar](100) NULL,
    [ProductWeight] [money] NOT NULL CONSTRAINT DF_CustomCart_ProductWeight DEFAULT((0.0)),
    [ProductID] [int] NOT NULL,
    [VariantID] [int] NOT NULL,
    [Quantity] [int] NOT NULL CONSTRAINT DF_CustomCart_Quantity DEFAULT((1)),
    [ChosenColor] [nvarchar](100) NULL,
    [ChosenColorSKUModifier] [nvarchar](100) NULL,
    [ChosenSize] [nvarchar](100) NULL,
    [ChosenSizeSKUModifier] [nvarchar](100) NULL,
    [CartType] [int] NOT NULL CONSTRAINT DF_CustomCart_CartType DEFAULT((0)),
    [OriginalRecurringOrderNumber] [int] NULL,
    [ExtensionData] [ntext] NULL,
    [CreatedOn] [datetime] NOT NULL CONSTRAINT DF_CustomCart_CreatedOn DEFAULT(getdate()),
    CONSTRAINT [PK_CustomCart] PRIMARY KEY CLUSTERED 
    (
        [CustomCartRecID] ASC
    )
)




GO


CREATE TABLE [dbo].[ShoppingCart](
    [ShoppingCartRecID] [int] IDENTITY(1,1) NOT NULL,
    [ShoppingCartRecGUID] [uniqueidentifier] NOT NULL CONSTRAINT DF_ShoppingCart_ShoppingCartRecGUID DEFAULT(newid()),
    [StoreID] INT NOT NULL CONSTRAINT DF_ShoppingCart_StoreID DEFAULT(1),
    [CustomerID] [int] NOT NULL,
    [ProductSKU] [nvarchar](100) NULL,
    [ProductPrice] [money] NULL,
    [ProductWeight] [money] NULL,
    [ProductID] [int] NOT NULL,
    [VariantID] [int] NOT NULL,
    [Quantity] [int] NOT NULL CONSTRAINT DF_ShoppingCart_Quantity DEFAULT((1)),
    [RequiresCount] [int] NOT NULL CONSTRAINT DF_ShoppingCart_RequiresCount DEFAULT((0)),
    [ChosenColor] [nvarchar](100) NULL,
    [ChosenColorSKUModifier] [nvarchar](50) NULL,
    [ChosenSize] [nvarchar](100) NULL,
    [ChosenSizeSKUModifier] [nvarchar](50) NULL,
    [IsTaxable] [tinyint] NOT NULL CONSTRAINT DF_ShoppingCart_IsTaxable DEFAULT((1)),
    [IsShipSeparately] [tinyint] NOT NULL CONSTRAINT DF_ShoppingCart_IsShipSeparately DEFAULT((0)),
    [IsDownload] [tinyint] NOT NULL CONSTRAINT DF_ShoppingCart_IsDownload DEFAULT((0)),
    [DownloadLocation] [ntext] NULL,
    [FreeShipping] [tinyint] NOT NULL CONSTRAINT DF_ShoppingCart_FreeShipping DEFAULT((0)),
    [CreatedOn] [datetime] NOT NULL CONSTRAINT DF_ShoppingCart_CreatedOn DEFAULT(getdate()),
    [ProductDimensions] [nvarchar](100) NULL,
    [CartType] [int] NOT NULL CONSTRAINT DF_ShoppingCart_CartType DEFAULT((0)),
    [IsSecureAttachment] [tinyint] NOT NULL CONSTRAINT DF_ShoppingCart_IsSecureAttachment DEFAULT((0)),
    [TextOption] [ntext] NULL,
    [NextRecurringShipDate] [datetime] NULL,
    [RecurringIndex] [int] NOT NULL CONSTRAINT DF_ShoppingCart_RecurringIndex DEFAULT((0)),
    [OriginalRecurringOrderNumber] [int] NULL,
    [BillingAddressID] [int] NULL,
    [ShippingAddressID] [int] NULL,
    [ShippingMethodID] [int] NULL,
    [ShippingMethod] [ntext] NULL,
    [DistributorID] [int] NULL,
    [SubscriptionInterval] [int] NULL,
    [Notes] [ntext] NULL,
    [IsUpsell] [tinyint] NOT NULL CONSTRAINT DF_ShoppingCart_IsUpsell DEFAULT((0)),
    [GiftRegistryForCustomerID] [int] NOT NULL CONSTRAINT DF_ShoppingCart_GiftRegistryForCustomerID DEFAULT((0)),
    [RecurringInterval] [int] NOT NULL CONSTRAINT DF_ShoppingCart_RecurringInterval DEFAULT((1)),
    [RecurringIntervalType] [int] NOT NULL CONSTRAINT DF_ShoppingCart_RecurringIntervalType DEFAULT((3)),
    [ExtensionData] [ntext] NULL,
    [SubscriptionIntervalType] [int] NOT NULL CONSTRAINT DF_ShoppingCart_SubscriptionIntervalType DEFAULT((3)),
    [CustomerEntersPrice] [tinyint] NOT NULL CONSTRAINT DF_ShoppingCart_CustomerEntersPrice DEFAULT((0)),
    [IsAKit] [tinyint] NULL,
    [IsKit2] [tinyint] NOT NULL CONSTRAINT DF_ShoppingCartIsKit2 DEFAULT(0),
    [IsAPack] [tinyint] NULL,
    [IsSystem] [tinyint] NULL,
    [TaxClassID] [int] NOT NULL CONSTRAINT DF_ShoppingCart_TaxClassID DEFAULT(1),
    [TaxRate] [money]  NOT NULL CONSTRAINT DF_ShoppingCart_TaxRate DEFAULT(0),
    [RecurringSubscriptionID] [nvarchar](100)  NOT NULL CONSTRAINT DF_ShoppingCart_RecurringSubscriptionID DEFAULT(''),
    CONSTRAINT [PK_ShoppingCart] PRIMARY KEY CLUSTERED 
    (
        [ShoppingCartRecID] ASC
    )
)



GO


CREATE TABLE [dbo].[Orders_CustomCart](
    [OrderNumber] [int] NOT NULL,
    [CustomCartRecID] [int] NOT NULL,
    [CustomerID] [int] NOT NULL,
    [PackID] [int] NULL,
    [ShoppingCartRecID] [int] NOT NULL,
    [ProductSKU] [nvarchar](100) NULL,
    [ProductName] [ntext] NULL,
    [ProductVariantName] [nvarchar](255) NULL,
    [ProductWeight] [money] NULL,
    [ProductID] [int] NULL,
    [VariantID] [int] NULL,
    [Quantity] [int] NULL,
    [ChosenColor] [nvarchar](100) NULL,
    [ChosenColorSKUModifier] [nvarchar](50) NULL,
    [ChosenSize] [nvarchar](100) NULL,
    [ChosenSizeSKUModifier] [nvarchar](50) NULL,
    [CartType] [int] NOT NULL CONSTRAINT DF_Orders_CustomCart_CartType DEFAULT((1)),
    [ExtensionData] [ntext] NULL,
    [CreatedOn] [datetime] NOT NULL CONSTRAINT DF_Orders_CustomCart_CreatedOn DEFAULT(getdate())
)


GO


CREATE TABLE [dbo].[Orders](
    [OrderNumber] [int] NOT NULL,
    [OrderGUID] [uniqueidentifier] NOT NULL CONSTRAINT DF_Orders_OrderGUID DEFAULT(newid()),
    [StoreID] INT NOT NULL CONSTRAINT DF_Orders_StoreID DEFAULT(1),
    [ParentOrderNumber] [int] NULL,
    [StoreVersion] [nvarchar](100) NULL,
    [QuoteCheckout] [tinyint] NOT NULL CONSTRAINT DF_Orders_QuoteCheckout DEFAULT((0)),
    [IsNew] [tinyint] NOT NULL CONSTRAINT DF_Orders_IsNew DEFAULT((1)),
    [ShippedOn] [datetime] NULL,
    [CustomerID] [int] NOT NULL,
    [CustomerGUID] [uniqueidentifier] NOT NULL,
    [Referrer] [ntext] NULL,
    [SkinID] [int] NOT NULL CONSTRAINT DF_Orders_SiteID DEFAULT((1)),
    [LastName] [nvarchar](100) NULL,
    [FirstName] [nvarchar](100) NULL,
    [Email] [nvarchar](100) NULL,
    [Notes] [ntext] NULL,
    [BillingEqualsShipping] [tinyint] NOT NULL CONSTRAINT DF_Orders_BillingEqualsShipping DEFAULT((0)),
    [BillingLastName] [nvarchar](100) NULL,
    [BillingFirstName] [nvarchar](100) NULL,
    [BillingCompany] [nvarchar](100) NULL,
    [BillingAddress1] [nvarchar](100) NULL,
    [BillingAddress2] [nvarchar](100) NULL,
    [BillingSuite] [nvarchar](50) NULL,
    [BillingCity] [nvarchar](100) NULL,
    [BillingState] [nvarchar](100) NULL,
    [BillingZip] [nvarchar](10) NULL,
    [BillingCountry] [nvarchar](100) NULL,
    [BillingPhone] [nvarchar](25) NULL,
    [ShippingLastName] [nvarchar](100) NULL,
    [ShippingFirstName] [nvarchar](100) NULL,
    [ShippingCompany] [nvarchar](100) NULL,
    [ShippingResidenceType] [int] NOT NULL CONSTRAINT DF_Orders_ShippingResidenceType DEFAULT((0)),
    [ShippingAddress1] [nvarchar](100) NULL,
    [ShippingAddress2] [nvarchar](100) NULL,
    [ShippingSuite] [nvarchar](50) NULL,
    [ShippingCity] [nvarchar](100) NULL,
    [ShippingState] [nvarchar](100) NULL,
    [ShippingZip] [nvarchar](10) NULL,
    [ShippingCountry] [nvarchar](100) NULL,
    [ShippingMethodID] [int] NOT NULL CONSTRAINT DF_Orders_ShippingMethodID DEFAULT((0)),
    [ShippingMethod] [ntext] NULL,
    [ShippingPhone] [nvarchar](25) NULL,
    [ShippingCalculationID] [int] NULL,
    [Phone] [nvarchar](25) NULL,
    [RegisterDate] [datetime] NULL,
    [AffiliateID] [int] NULL,
    [CouponCode] [nvarchar](50) NULL,
    [CouponType] [int] NOT NULL CONSTRAINT DF_Orders_CouponType DEFAULT((0)),
    [CouponDescription] [ntext] NULL,
    [CouponDiscountAmount] [money] NULL,
    [CouponDiscountPercent] [money] NULL,
    [CouponIncludesFreeShipping] [tinyint] NULL,
    [OkToEmail] [tinyint] NULL,
    [Deleted] [tinyint] NOT NULL CONSTRAINT DF_Orders_Deleted DEFAULT((0)),
    [CardType] [nvarchar](20) NULL,
    [CardName] [nvarchar](100) NULL,
    [CardNumber] [ntext] NULL,
    [CardExpirationMonth] [nvarchar](10) NULL,
    [CardExpirationYear] [nvarchar](10) NULL,
    [CardStartDate] [ntext] NULL, -- used by UK/EU customers
    [CardIssueNumber] [ntext] NULL, -- used by UK/EU customers
    [OrderSubtotal] [money] NOT NULL CONSTRAINT DF_Orders_OrderSubtotal DEFAULT((0.0)),
    [OrderTax] [money] NOT NULL CONSTRAINT DF_Orders_OrderTax DEFAULT((0.0)),
    [OrderShippingCosts] [money] NOT NULL CONSTRAINT DF_Orders_OrderShippingCosts DEFAULT((0.0)),
    [OrderTotal] [money] NOT NULL CONSTRAINT DF_Orders_OrderTotal DEFAULT((0.0)),
    [PaymentGateway] [nvarchar](50) NULL,
    [AuthorizationCode] [nvarchar](100) NULL,
    [AuthorizationResult] [ntext] NULL,
    [AuthorizationPNREF] [nvarchar](100) NULL,
    [TransactionCommand] [ntext] NULL,
    [OrderDate] [datetime] NOT NULL CONSTRAINT DF_Orders_OrderDate DEFAULT(getdate()),
    [LevelID] [int] NULL CONSTRAINT DF_Orders_LevelID DEFAULT((0)),
    [LevelName] [nvarchar](100) NULL,
    [LevelDiscountPercent] [money] NULL,
    [LevelDiscountAmount] [money] NULL,
    [LevelHasFreeShipping] [tinyint] NULL,
    [LevelAllowsQuantityDiscounts] [tinyint] NULL,
    [LevelHasNoTax] [tinyint] NULL,
    [LevelAllowsCoupons] [tinyint] NULL,
    [LevelDiscountsApplyToExtendedPrices] [tinyint] NULL,
    [LastIPAddress] [varchar](40) NULL,
    [PaymentMethod] [nvarchar](100) NULL,
    [OrderNotes] [ntext] NULL,
    [PONumber] [nvarchar](50) NULL,
    [DownloadEmailSentOn] [datetime] NULL,
    [ReceiptEmailSentOn] [datetime] NULL,
    [DistributorEmailSentOn] [datetime] NULL,
    [ShippingTrackingNumber] [nvarchar](100) NULL,
    [ShippedVIA] [nvarchar](100) NULL,
    [CustomerServiceNotes] [ntext] NULL,
    [RTShipRequest] [ntext] NULL,
    [RTShipResponse] [ntext] NULL,
    [TransactionState] [nvarchar](20) NULL,
    [AVSResult] [nvarchar](50) NULL,
    [CaptureTXCommand] [ntext] NULL,
    [CaptureTXResult] [ntext] NULL,
    [VoidTXCommand] [ntext] NULL,
    [VoidTXResult] [ntext] NULL,
    [RefundTXCommand] [ntext] NULL,
    [RefundTXResult] [ntext] NULL,
    [RefundReason] [ntext] NULL,
    [CardinalLookupResult] [ntext] NULL,
    [CardinalAuthenticateResult] [ntext] NULL,
    [CardinalGatewayParms] [ntext] NULL,
    [AffiliateCommissionRecorded] [tinyint] NOT NULL CONSTRAINT DF_Orders_AffiliateCommissionRecorded DEFAULT((0)),
    [OrderOptions] [ntext] NULL,
    [OrderWeight] [money] NOT NULL CONSTRAINT DF_Orders_OrderWeight DEFAULT((0.0)),
    [eCheckBankABACode] [ntext] NULL,
    [eCheckBankAccountNumber] [ntext] NULL,
    [eCheckBankAccountType] [ntext] NULL,
    [eCheckBankName] [ntext] NULL,
    [eCheckBankAccountName] [ntext] NULL,
    [CarrierReportedRate] [ntext] NULL,
    [CarrierReportedWeight] [ntext] NULL,
    [LocaleSetting] [nvarchar](10) NULL,
    [FinalizationData] [ntext] NULL,
    [ExtensionData] [ntext] NULL,
    [AlreadyConfirmed] [tinyint] NOT NULL CONSTRAINT DF_Orders_AlreadyConfirmed DEFAULT((0)),
    [CartType] [int] NOT NULL,
    [THUB_POSTED_TO_ACCOUNTING] [char](1) NULL CONSTRAINT DF_Orders_THUB_POSTED_TO_ACCOUNTING DEFAULT('N'),
    [THUB_POSTED_DATE] [datetime] NULL,
    [THUB_ACCOUNTING_REF] [char](25) NULL,
    [Last4] [nvarchar](4) NULL,
    [ReadyToShip] [tinyint] NOT NULL CONSTRAINT DF_Orders_ReadyToShip DEFAULT((0)),
    [IsPrinted] [tinyint] NOT NULL CONSTRAINT DF_Orders_IsPrinted DEFAULT((0)),
    [AuthorizedOn] [datetime] NULL,
    [CapturedOn] [datetime] NULL,
    [RefundedOn] [datetime] NULL,
    [VoidedOn] [datetime] NULL,
    [FraudedOn] [datetime] NULL,
    [EditedOn] [datetime] NULL,
    [TrackingURL] [ntext] NULL,
    [ShippedEMailSentOn] [datetime] NULL,
    [InventoryWasReduced] [int] NOT NULL CONSTRAINT DF_Orders_InvReduced DEFAULT((0)),
    [MaxMindFraudScore] decimal(5,2) NULL CONSTRAINT DF_Orders_MaxMindScore DEFAULT((-1)),
    [MaxMindDetails] ntext NULL ,
    [VATRegistrationID] ntext NULL ,
    [Crypt] [int] NOT NULL CONSTRAINT DF_Orders_Crypt DEFAULT(1),

    -- 0 = unknown, 1 = CHARGE, 2 = CREDIT. this flag indicates how the transaction was originally created!
    -- It does NOT tell you what subsequent state the transaction is in. The TransactionState value tells you that.
    -- this flag is set ONLY ONCE when the order is originally created, so you know what type of transaction it was.
    -- in the current design, the only time it should be 2 is if it's an ad-hoc refund
    -- all other cases it should be a 1
    [TransactionType] [int] NOT NULL CONSTRAINT DF_Orders_TransactionType DEFAULT((0)) ,
    [RecurringSubscriptionID] [nvarchar](100) NOT NULL CONSTRAINT DF_Orders_RecurringSubscriptionID DEFAULT('') ,
    [RecurringSubscriptionCommand] [ntext] CONSTRAINT DF_Orders_RecurringSubscriptionCommand default('') NOT NULL,
    [RecurringSubscriptionResult] [ntext] CONSTRAINT DF_Orders_RecurringSubscriptionResult default('') NOT NULL,
    [RelatedOrderNumber] [int] NOT NULL CONSTRAINT DF_Orders_RelatedOrderNumber DEFAULT (0),
    [BuySafeCommand] [ntext] CONSTRAINT DF_Orders_BuySafeCommand default('') NOT NULL,
    [BuySafeResult] [ntext] CONSTRAINT DF_Orders_BuySafeResult default('') NOT NULL
    CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
    (
        [OrderNumber] ASC
    )
)

GO


CREATE TABLE [dbo].[Orders_KitCart](
    [OrderNumber] [int] NOT NULL,
    [KitCartRecID] [int] NOT NULL,
    [CustomerID] [int] NOT NULL,
    [ShoppingCartRecID] [int] NOT NULL,
    [ProductID] [int] NULL,
    [VariantID] [int] NULL,
    [ProductName] [nvarchar](255) NULL,
    [ProductVariantName] [nvarchar](255) NULL,
    [KitGroupID] [int] NULL,
    [KitGroupName] [nvarchar](400) NULL,
    [KitGroupIsRequired] [tinyint] NULL,
    [KitItemID] [int] NULL,
    [KitItemName] [nvarchar](400) NULL,
    [KitItemPriceDelta] [money] NULL,
    [Quantity] [int] NULL,
    [KitItemWeightDelta] [money] NOT NULL CONSTRAINT DF_Orders_KitCart_WeightDelta DEFAULT (0.0),
    [TextOption] [ntext] NULL,
    [ExtensionData] [ntext] NULL,
    [KitGroupTypeID] [int] NOT NULL,
    [InventoryVariantID] [int] NULL,
    [InventoryVariantColor] [nvarchar] (100) NULL, -- must be in master store locale language, this is NOT a ml field!
    [InventoryVariantSize] [nvarchar] (100) NULL, -- must be in master store locale language, this is NOT a ml field!
    [CreatedOn] [datetime] NOT NULL CONSTRAINT DF_Orders_KitCart_CreatedOn DEFAULT(getdate()),
    [CartType] [int] NOT NULL CONSTRAINT DF_Orders_KitCart_CartType DEFAULT((0)),
    [KitGroupIsReadOnly] [tinyint] NOT NULL CONSTRAINT DF_Orders_KitCart_KitGroupIsReadOnly DEFAULT(0),
    [KitItemInventoryQuantityDelta] [int] NOT NULL CONSTRAINT DF_Orders_KitCart_KitItemInventoryQuantityDelta DEFAULT(0)
)


GO


CREATE TABLE [dbo].[OrderNumbers](
    [OrderNumber] [int] IDENTITY(100000,1) NOT NULL,
    [OrderNumberGUID] [uniqueidentifier] NOT NULL CONSTRAINT DF_OrderNumbers_OrderNumberGUID DEFAULT(newid()),
    [CreatedOn] [datetime] NOT NULL CONSTRAINT DF_OrderNumbers_CreatedOn DEFAULT(getdate()),
    CONSTRAINT [PK_OrderNumbers] PRIMARY KEY CLUSTERED 
    (
        [OrderNumber] ASC
    )
)



GO


CREATE TABLE [dbo].[Orders_ShoppingCart](
    [OrderNumber] [int] NOT NULL,
    [ShoppingCartRecID] [int] NOT NULL,
    [CustomerID] [int] NOT NULL,
    [ProductID] [int] NOT NULL,
    [VariantID] [int] NOT NULL,
    [Quantity] [int] NOT NULL,
    [ChosenColor] [nvarchar](100) NULL,
    [ChosenColorSKUModifier] [nvarchar](50) NULL,
    [ChosenSize] [nvarchar](100) NULL,
    [ChosenSizeSKUModifier] [nvarchar](50) NULL,
    [OrderedProductName] [ntext] NULL,
    [OrderedProductVariantName] [ntext] NULL,
    [OrderedProductSKU] [nvarchar](100) NULL,
    [OrderedProductManufacturerPartNumber] [nvarchar](50) NULL,
    [OrderedProductWeight] [money] NULL,
    [OrderedProductPrice] [money] NULL,
    [OrderedProductRegularPrice] [money] NULL,
    [OrderedProductSalePrice] [money] NULL,
    [OrderedProductExtendedPrice] [money] NULL,
    [OrderedProductQuantityDiscountName] [nvarchar](MAX) NULL,
    [OrderedProductQuantityDiscountID] [int] NULL,
    [OrderedProductQuantityDiscountPercent] [money] NULL,
    [IsTaxable] [tinyint] NOT NULL CONSTRAINT DF_Orders_ShoppingCart_IsTaxable DEFAULT((0)),
    [IsShipSeparately] [tinyint] NOT NULL CONSTRAINT DF_Orders_ShoppingCart_IsShipSeparately DEFAULT((0)),
    [IsDownload] [tinyint] NOT NULL CONSTRAINT DF_Orders_ShoppingCart_IsDownload DEFAULT((0)),
    [DownloadLocation] [ntext] NULL,
    [FreeShipping] [tinyint] NOT NULL CONSTRAINT DF_Orders_ShoppingCart_FreeShipping DEFAULT((0)),
    [IsSecureAttachment] [tinyint] NOT NULL CONSTRAINT DF_Orders_ShoppingCart_IsSecureAttachment DEFAULT((0)),
    [TextOption] [ntext] NULL,
    [CartType] [int] NOT NULL CONSTRAINT DF_Orders_ShoppingCart_CartType DEFAULT((0)),
    [SubscriptionInterval] [int] NULL,
    [ShippingAddressID] [int] NOT NULL CONSTRAINT DF_Orders_ShoppingCart_ShippingAddressID DEFAULT((0)),
    [ShippingDetail] [ntext] NULL,
    [ShippingMethodID] [int] NULL,
    [ShippingMethod] [ntext] NULL,
    [DistributorID] [int] NULL,
    [GiftRegistryForCustomerID] [int] NULL,
    [Notes] [ntext] NULL,
    [DistributorEmailSentOn] [datetime] NULL,
    [ExtensionData] [ntext] NULL,
    [SizeOptionPrompt] [ntext] NULL,
    [ColorOptionPrompt] [ntext] NULL,
    [TextOptionPrompt] [ntext] NULL,
    [CreatedOn] [datetime] NOT NULL CONSTRAINT DF_Orders_ShoppingCart_CreatedOn DEFAULT(getdate()),
    [SubscriptionIntervalType] [int] NOT NULL CONSTRAINT DF_Orders_ShoppingCart_SubscriptionIntervalType DEFAULT((3)),
    [CustomerEntersPrice] [tinyint] NOT NULL CONSTRAINT DF_Orders_ShoppingCart_CustomerEntersPrice DEFAULT((0)),
    [CustomerEntersPricePrompt] [ntext] NULL,
    [IsAKit] [tinyint] NULL,
    [IsAPack] [tinyint] NULL,
    [IsSystem] [tinyint] NULL,
    [TaxClassID] [int] NOT NULL CONSTRAINT DF_Orders_ShoppingCart_TaxClassID DEFAULT(1),
    [TaxRate] [money]  NOT NULL CONSTRAINT DF_Orders_ShoppingCart_TaxRate DEFAULT(0)
)


GO


CREATE TABLE [dbo].[OrderOption](
    [OrderOptionID] [int] IDENTITY(1,1) NOT NULL,
    [OrderOptionGUID] [uniqueidentifier] NOT NULL CONSTRAINT DF_OrderOption_OrderOptionGUID DEFAULT(newid()),
    [Name] [nvarchar](400) NOT NULL,
    [Description] [ntext] NULL,
    [Cost] [money] NOT NULL,
    [DisplayOrder] [int] NOT NULL CONSTRAINT DF_OrderOption_DisplayOrder DEFAULT((1)),
    [DefaultIsChecked] [tinyint] CONSTRAINT DF_OrderOption_DefaultIsChecked default(0) NOT NULL ,
    [TaxClassID] [int] NOT NULL CONSTRAINT DF_OrderOption_TaxClassID DEFAULT((1)),
    [ExtensionData] [ntext] NULL,
    [CreatedOn] [datetime] NOT NULL CONSTRAINT DF_OrderOption_CreatedOn DEFAULT(getdate()),
    CONSTRAINT [PK_OrderOption] PRIMARY KEY CLUSTERED 
    (
        [OrderOptionID] ASC
    )
)



GO


CREATE TABLE [dbo].[Poll](
    [PollID] [int] IDENTITY(1,1) NOT NULL,
    [PollGUID] [uniqueidentifier] NOT NULL CONSTRAINT DF_Poll_PollGUID DEFAULT(newid()),
    [Name] [nvarchar](400) NOT NULL,
    [PollSortOrderID] [int] NOT NULL CONSTRAINT DF_Poll_PollSortOrderID DEFAULT((1)),
    [Published] [tinyint] NOT NULL CONSTRAINT DF_Poll_Published DEFAULT((1)),
    [Wholesale] [tinyint] NOT NULL CONSTRAINT DF_Poll_Wholesale DEFAULT((0)),
    [DisplayOrder] [int] NOT NULL CONSTRAINT DF_Poll_DisplayOrder DEFAULT((1)),
    [Deleted] [tinyint] NOT NULL CONSTRAINT DF_Poll_Deleted DEFAULT((0)),
    [AnonsCanVote] [tinyint] NOT NULL CONSTRAINT DF_Poll_AnonsCanVote DEFAULT((0)),
    [ExpiresOn] [datetime] NOT NULL CONSTRAINT DF_Poll_ExpiresOn DEFAULT(dateadd(month,(1),getdate())),
    [ExtensionData] [ntext] NULL,
    [CreatedOn] [datetime] NOT NULL CONSTRAINT DF_Poll_CreatedOn DEFAULT(getdate()),
    CONSTRAINT [PK_Poll] PRIMARY KEY CLUSTERED 
    (
        [PollID] ASC
    )
)



GO


CREATE TABLE [dbo].[PollAnswer](
    [PollAnswerID] [int] IDENTITY(1,1) NOT NULL,
    [PollAnswerGUID] [uniqueidentifier] NOT NULL CONSTRAINT DF_PollAnswer_PollAnswerGUID DEFAULT(newid()),
    [PollID] [int] NOT NULL,
    [Name] [nvarchar](400) NOT NULL,
    [DisplayOrder] [int] NOT NULL CONSTRAINT DF_PollAnswer_DisplayOrder DEFAULT((1)),
    [ExtensionData] [ntext] NULL,
    [Deleted] [tinyint] NOT NULL CONSTRAINT DF_PollAnswer_Deleted DEFAULT((0)),
    [CreatedOn] [datetime] NOT NULL CONSTRAINT DF_PollAnswer_CreatedOn DEFAULT(getdate()),
    CONSTRAINT [PK_PollAnswers] PRIMARY KEY CLUSTERED 
    (
        [PollAnswerID] 
    )
)



GO


CREATE TABLE [dbo].[PollCategory](
    [PollID] [int] NOT NULL,
    [CategoryID] [int] NOT NULL,
    [CreatedOn] [datetime] NOT NULL CONSTRAINT DF_PollCategory_CreatedOn DEFAULT(getdate()),
    CONSTRAINT [PK_PollCategory] PRIMARY KEY CLUSTERED 
    (
        [PollID] ASC,
        [CategoryID] ASC
    )
)


GO


CREATE TABLE [dbo].[PollSection](
    [PollID] [int] NOT NULL,
    [SectionID] [int] NOT NULL,
    [CreatedOn] [datetime] NOT NULL CONSTRAINT DF_PollSection_CreatedOn DEFAULT(getdate()),
    CONSTRAINT [PK_PollSection] PRIMARY KEY CLUSTERED 
    (
        [PollID] ASC,
        [SectionID] ASC
    )
)


GO


CREATE TABLE [dbo].[PollVotingRecord](
    [PollVotingRecordID] [int] IDENTITY(1,1) NOT NULL,
    [PollVotingRecordGUID] [uniqueidentifier] NOT NULL CONSTRAINT DF_PollVotingRecord_PollVotingRecordGUID DEFAULT (newid()),
    [PollID] [int] NOT NULL,
    [PollAnswerID] [int] NOT NULL,
    [CustomerID] [int] NOT NULL,
    [CreatedOn] [datetime] NOT NULL CONSTRAINT DF_PollVotingRecord_CreatedOn DEFAULT (getdate()),
    CONSTRAINT [PK_PollVotingRecord] PRIMARY KEY CLUSTERED 
    (
        [PollVotingRecordID] ASC
    )
)


GO


CREATE TABLE [dbo].[Rating](
    [RatingID] [int] IDENTITY(1,1) NOT NULL,
    [StoreID] INT NOT NULL CONSTRAINT DF_Rating_StoreID DEFAULT(1),
    [ProductID] [int] NOT NULL,
    [CustomerID] [int] NOT NULL,
    [Rating] [int] NOT NULL,
    [Comments] [ntext] NULL,
    [HasComment] [tinyint] NOT NULL CONSTRAINT DF_Rating_HasComment DEFAULT((0)),
    [IsFilthy] [tinyint] NOT NULL CONSTRAINT DF_Rating_IsFilthy DEFAULT((0)),
    [IsROTD] [tinyint] NOT NULL CONSTRAINT DF_Rating_IsROTD DEFAULT((0)),
    [FoundHelpful] [int] NOT NULL CONSTRAINT DF_Rating_FoundHelpful DEFAULT((0)),
    [FoundNotHelpful] [int] NOT NULL CONSTRAINT DF_Rating_FoundNotHelpful DEFAULT((0)),
    [CreatedOn] [datetime] NOT NULL CONSTRAINT DF_Rating_CreatedOn DEFAULT(getdate()),
    CONSTRAINT [PK_Item_Ratings_1] PRIMARY KEY CLUSTERED 
    (
        [RatingID] ASC
    )
)


GO


CREATE TABLE [dbo].[RatingCommentHelpfulness](
	[StoreID] [int] NOT NULL DEFAULT(1),
    [ProductID] [int] NOT NULL,
    [RatingCustomerID] [int] NOT NULL,
    [VotingCustomerID] [int] NOT NULL,
    [Helpful] [tinyint] NOT NULL,
    [CreatedOn] [datetime] NOT NULL CONSTRAINT DF_RatingCommentHelpfulness_CreatedOn DEFAULT (getdate()),
    CONSTRAINT [PK_Comment_Helpfulness] PRIMARY KEY CLUSTERED 
    (
		[StoreID] ASC,
        [ProductID] ASC,
        [RatingCustomerID] ASC,
        [VotingCustomerID] ASC
    )
)


GO


CREATE TABLE [dbo].[BadWord](
    [BadWordID] [int] IDENTITY(1,1) NOT NULL,
    [LocaleSetting] [nvarchar](10) NOT NULL CONSTRAINT DF_BadWord_LocaleSetting DEFAULT('en-US'),
    [Word] [nvarchar](100) NOT NULL,
    [CreatedOn] [datetime] NOT NULL CONSTRAINT DF_BadWord_CreatedOn DEFAULT(getdate()),
    CONSTRAINT [PK_BadWord] PRIMARY KEY CLUSTERED 
    (
        [BadWordID] ASC,
        [LocaleSetting] ASC
    )
)



GO


CREATE PROC dbo.aspdnsf_CheckFilthy
    @COMMENTTEXT ntext,
    @locale char(5)  
  
AS
SET NOCOUNT ON

    IF EXISTS (select * from Badword WHERE (@COMMENTTEXT LIKE '%' + WORD + ' %' OR @COMMENTTEXT LIKE '%' + WORD + ',%' OR @COMMENTTEXT LIKE '%' + WORD + '.%' OR @COMMENTTEXT LIKE '%' + WORD + '!%' OR @COMMENTTEXT LIKE '%' + WORD) AND LocaleSetting = @locale )
        SELECT 1 IsFilthy
    ELSE
        SELECT 0 IsFilthy


GO


CREATE TABLE [dbo].[PollSortOrder](
    [PollSortOrderID] [int] IDENTITY(1,1) NOT NULL,
    [PollSortOrderGUID] [uniqueidentifier] NOT NULL CONSTRAINT DF_PollSortOrder_PollSortOrderGUID DEFAULT(newid()),
    [Name] [nvarchar](400) NOT NULL,
    [DisplayOrder] [int] NOT NULL CONSTRAINT DF_PollSortOrder_DisplayOrder DEFAULT((1)),
    [CreatedOn] [datetime] NOT NULL CONSTRAINT DF_PollSortOrder_CreatedOn DEFAULT(getdate()),
    CONSTRAINT [PK_PollSortOrder] PRIMARY KEY CLUSTERED 
    (
        [PollSortOrderID] ASC
    )
)

GO


CREATE TABLE [dbo].[Category](
    [CategoryID] [int] IDENTITY(1,1) NOT NULL,
    [CategoryGUID] [uniqueidentifier] NOT NULL CONSTRAINT DF_Category_CategoryGUID DEFAULT(newid()),
    [Name] [nvarchar](400) NOT NULL,
    [Summary] [ntext] NULL,
    [Description] [ntext] NULL,
    [SEKeywords] [ntext] NULL,
    [SEDescription] [ntext] NULL,
    [DisplayPrefix] [ntext] NULL,
    [SETitle] [ntext] NULL,
    [SENoScript] [ntext] NULL,
    [SEAltText] [ntext] NULL,
    [ParentCategoryID] [int] NOT NULL CONSTRAINT DF_Category_ParentCategoryID DEFAULT((0)),
    [ColWidth] [int] NOT NULL CONSTRAINT DF_Category_ColWidth DEFAULT((4)),
    [SortByLooks] [tinyint] NOT NULL CONSTRAINT DF_Category_SortByLooks DEFAULT((0)),
    [DisplayOrder] [int] NOT NULL CONSTRAINT DF_Category_DisplayOrder DEFAULT((1)),
    [RelatedDocuments] [ntext] NULL,
    [XmlPackage] [nvarchar](100) NULL,
    [Published] [tinyint] NOT NULL CONSTRAINT DF_Category_Published DEFAULT((1)),
    [Wholesale] [tinyint] NOT NULL CONSTRAINT DF_Category_Wholesale DEFAULT((0)),
    [AllowSectionFiltering] [tinyint] NOT NULL CONSTRAINT DF_Category_AllowSectionFiltering DEFAULT((0)),
    [AllowManufacturerFiltering] [tinyint] NOT NULL CONSTRAINT DF_Category_AllowManufacturerFiltering DEFAULT((0)),
    [AllowProductTypeFiltering] [tinyint] NOT NULL CONSTRAINT DF_Category_AllowProductTypeFiltering DEFAULT((0)),
    [QuantityDiscountID] [int] NULL,
    [ShowInProductBrowser] [int] NOT NULL CONSTRAINT DF_Category_ShowInProductBrowser DEFAULT((1)),
    [SEName] [nvarchar](100) NULL,
    [ExtensionData] [ntext] NULL,
    [ContentsBGColor] [nvarchar](10) NULL,
    [PageBGColor] [nvarchar](10) NULL,
    [GraphicsColor] [nvarchar](20) NULL,
    [ImageFilenameOverride] [ntext] NULL,
    [IsImport] [tinyint] NOT NULL CONSTRAINT DF_Category_IsImport DEFAULT((0)),
    [Deleted] [tinyint] NOT NULL CONSTRAINT DF_Category_Deleted DEFAULT((0)),
    [CreatedOn] [datetime] NOT NULL CONSTRAINT DF_Category_CreatedOn DEFAULT(getdate()),
    [PageSize] [int] NOT NULL CONSTRAINT DF_Category_PageSize DEFAULT ((20)),
    [TaxClassID] [int] NOT NULL CONSTRAINT DF_Category_TaxClassID DEFAULT((1)),
    [SkinID] int NOT NULL CONSTRAINT DF_Category_SkinID DEFAULT(0),
    [TemplateName] nvarchar(50) NOT NULL CONSTRAINT DF_Category_TemplateName DEFAULT(''),
    CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
    (
        [CategoryID] ASC
    )
)



GO


CREATE TABLE [dbo].[Distributor](
    [DistributorID] [int] IDENTITY(1,1) NOT NULL,
    [DistributorGUID] [uniqueidentifier] NOT NULL CONSTRAINT DF_Distributor_DistributorGUID DEFAULT(newid()),
    [Name] [nvarchar](400) NOT NULL,
    [SEName] [nvarchar](100) NULL,
    [SEKeywords] [ntext] NULL,
    [SEDescription] [ntext] NULL,
    [SETitle] [ntext] NULL,
    [SENoScript] [ntext] NULL,
    [SEAltText] [ntext] NULL,
    [Address1] [nvarchar](100) NULL,
    [Address2] [nvarchar](100) NULL,
    [Suite] [nvarchar](25) NULL,
    [City] [nvarchar](100) NULL,
    [State] [nvarchar](100) NULL,
    [ZipCode] [nvarchar](10) NULL,
    [Country] [nvarchar](100) NULL,
    [Phone] [nvarchar](25) NULL,
    [FAX] [nvarchar](25) NULL,
    [URL] [nvarchar](255) NULL,
    [Email] [nvarchar](100) NULL,
    [Summary] [ntext] NULL,
    [Description] [ntext] NULL,
    [Notes] [ntext] NULL,
    [QuantityDiscountID] [int] NULL,
    [SortByLooks] [tinyint] NOT NULL CONSTRAINT DF_Distributor_SortByLooks DEFAULT((0)),
    [XmlPackage] [nvarchar](100) NULL,
    [ColWidth] [int] NOT NULL CONSTRAINT DF_Distributor_ColWidth DEFAULT((4)),
    [DisplayOrder] [int] NOT NULL CONSTRAINT DF_Distributor_DisplayOrder DEFAULT((1)),
    [ExtensionData] [ntext] NULL,
    [ContentsBGColor] [nvarchar](10) NULL,
    [PageBGColor] [nvarchar](10) NULL,
    [GraphicsColor] [nvarchar](20) NULL,
    [NotificationXmlPackage] [nvarchar](100) NULL,
    [ImageFilenameOverride] [ntext] NULL,
    [ParentDistributorID] [int] NOT NULL CONSTRAINT DF_Distributor_ParentDistributorID DEFAULT((0)),
    [Published] [tinyint] NOT NULL CONSTRAINT DF_Distributor_Published DEFAULT((1)),
    [Wholesale] [tinyint] NOT NULL CONSTRAINT DF_Distributor_Wholesale DEFAULT((0)),
    [IsImport] [tinyint] NOT NULL CONSTRAINT DF_Distributor_IsImport DEFAULT((0)),
    [Deleted] [tinyint] NOT NULL CONSTRAINT DF_Distributor_Deleted DEFAULT((0)),
    [CreatedOn] [datetime] NOT NULL CONSTRAINT DF_Distributor_CreatedOn DEFAULT(getdate()),
    [PageSize] [int] NOT NULL CONSTRAINT DF_Distributor_PageSize DEFAULT((20)),
    [TaxClassID] [int] NOT NULL CONSTRAINT DF_Distributor_TaxClassID DEFAULT((1)), -- this field is not used, but is here for uniformity as an Entity table
    [SkinID] int NOT NULL CONSTRAINT DF_Distributor_SkinID DEFAULT(0),
    [TemplateName] nvarchar(50) NOT NULL CONSTRAINT DF_Distributor_TemplateName DEFAULT(''),
    CONSTRAINT [PK_Distributor] PRIMARY KEY CLUSTERED 
    (
        [DistributorID] ASC
    )
)


GO


CREATE TABLE [dbo].[Genre](
    [GenreID] [int] IDENTITY(1,1) NOT NULL,
    [GenreGUID] [uniqueidentifier] NOT NULL CONSTRAINT DF_Genre_GenreGUID DEFAULT(newid()),
    [Name] [nvarchar](400) NOT NULL,
    [SEName] [nvarchar](100) NULL,
    [SEKeywords] [ntext] NULL,
    [SEDescription] [ntext] NULL,
    [SETitle] [ntext] NULL,
    [SENoScript] [ntext] NULL,
    [SEAltText] [ntext] NULL,
    [Address1] [nvarchar](100) NULL,
    [Address2] [nvarchar](100) NULL,
    [Suite] [nvarchar](25) NULL,
    [City] [nvarchar](100) NULL,
    [State] [nvarchar](100) NULL,
    [ZipCode] [nvarchar](10) NULL,
    [Country] [nvarchar](100) NULL,
    [Phone] [nvarchar](25) NULL,
    [FAX] [nvarchar](25) NULL,
    [URL] [nvarchar](255) NULL,
    [Email] [nvarchar](100) NULL,
    [Summary] [ntext] NULL,
    [Description] [ntext] NULL,
    [Notes] [ntext] NULL,
    [QuantityDiscountID] [int] NULL,
    [SortByLooks] [tinyint] NOT NULL CONSTRAINT DF_Genre_SortByLooks DEFAULT((0)),
    [XmlPackage] [nvarchar](100) NULL,
    [ColWidth] [int] NOT NULL CONSTRAINT DF_Genre_ColWidth DEFAULT((4)),
    [DisplayOrder] [int] NOT NULL CONSTRAINT DF_Genre_DisplayOrder DEFAULT((1)),
    [ExtensionData] [ntext] NULL,
    [ContentsBGColor] [nvarchar](10) NULL,
    [PageBGColor] [nvarchar](10) NULL,
    [GraphicsColor] [nvarchar](20) NULL,
    [NotificationXmlPackage] [nvarchar](100) NULL,
    [ImageFilenameOverride] [ntext] NULL,
    [ParentGenreID] [int] NOT NULL CONSTRAINT DF_Genre_ParentGenreID DEFAULT((0)),
    [Published] [tinyint] NOT NULL CONSTRAINT DF_Genre_Published DEFAULT((1)),
    [Wholesale] [tinyint] NOT NULL CONSTRAINT DF_Genre_Wholesale DEFAULT((0)),
    [IsImport] [tinyint] NOT NULL CONSTRAINT DF_Genre_IsImport DEFAULT((0)),
    [Deleted] [tinyint] NOT NULL CONSTRAINT DF_Genre_Deleted DEFAULT((0)),
    [CreatedOn] [datetime] NOT NULL CONSTRAINT DF_Genre_CreatedOn DEFAULT(getdate()),
    [PageSize] [int] NOT NULL CONSTRAINT DF_Genre_PageSize DEFAULT((20)),
    [TaxClassID] [int] NOT NULL CONSTRAINT DF_Genre_TaxClassID DEFAULT((1)), -- this field is not used, but is here for uniformity as an Entity table
    [SkinID] int NOT NULL CONSTRAINT DF_Genre_SkinID DEFAULT(0),
    [TemplateName] nvarchar(50) NOT NULL CONSTRAINT DF_Genre_TemplateName DEFAULT(''),
    CONSTRAINT [PK_Genre] PRIMARY KEY CLUSTERED 
    (
        [GenreID] ASC
    )
)



GO


CREATE TABLE [dbo].[Manufacturer](
    [ManufacturerID] [int] IDENTITY(1,1) NOT NULL,
    [ManufacturerGUID] [uniqueidentifier] NOT NULL CONSTRAINT DF_Manufacturer_ManufacturerGUID DEFAULT(newid()),
    [Name] [nvarchar](400) NOT NULL,
    [SEName] [nvarchar](100) NULL,
    [SEKeywords] [ntext] NULL,
    [SEDescription] [ntext] NULL,
    [SETitle] [ntext] NULL,
    [SENoScript] [ntext] NULL,
    [SEAltText] [ntext] NULL,
    [Address1] [nvarchar](100) NULL,
    [Address2] [nvarchar](100) NULL,
    [Suite] [nvarchar](25) NULL,
    [City] [nvarchar](100) NULL,
    [State] [nvarchar](100) NULL,
    [ZipCode] [nvarchar](10) NULL,
    [Country] [nvarchar](100) NULL,
    [Phone] [nvarchar](25) NULL,
    [FAX] [nvarchar](25) NULL,
    [URL] [nvarchar](255) NULL,
    [Email] [nvarchar](100) NULL,
    [QuantityDiscountID] [int] NULL,
    [SortByLooks] [tinyint] NOT NULL CONSTRAINT DF_Manufacturer_SortByLooks DEFAULT((0)),
    [Summary] [ntext] NULL,
    [Description] [ntext] NULL,
    [Notes] [ntext] NULL,
    [RelatedDocuments] [ntext] NULL,
    [XmlPackage] [nvarchar](100) NULL,
    [ColWidth] [int] NOT NULL CONSTRAINT DF_Manufacturer_ColWidth DEFAULT((4)),
    [DisplayOrder] [int] NOT NULL CONSTRAINT DF_Manufacturer_DisplayOrder DEFAULT((1)),
    [ExtensionData] [ntext] NULL,
    [ContentsBGColor] [nvarchar](10) NULL,
    [PageBGColor] [nvarchar](10) NULL,
    [GraphicsColor] [nvarchar](20) NULL,
    [ImageFilenameOverride] [ntext] NULL,
    [Published] [tinyint] NOT NULL CONSTRAINT DF_Manufacturer_Published DEFAULT((1)),
    [Wholesale] [tinyint] NOT NULL CONSTRAINT DF_Manufacturer_Wholesale DEFAULT((0)),
    [ParentManufacturerID] [int] NOT NULL CONSTRAINT DF_Manufacturer_ParentManufacturerID DEFAULT((0)),
    [IsImport] [tinyint] NOT NULL CONSTRAINT DF_Manufacturer_IsImport DEFAULT((0)),
    [Deleted] [tinyint] NOT NULL CONSTRAINT DF_Manufacturer_Deleted DEFAULT((0)),
    [CreatedOn] [datetime] NOT NULL CONSTRAINT DF_Manufacturer_CreatedOn DEFAULT(getdate()),
    [PageSize] [int] NOT NULL CONSTRAINT DF_Manufacturer_PageSize DEFAULT((20)),
    [SkinID] int NOT NULL CONSTRAINT DF_Manufacturer_SkinID DEFAULT(0),
    [TemplateName] nvarchar(50) NOT NULL CONSTRAINT DF_Manufacturer_TemplateName DEFAULT(''),
    CONSTRAINT [PK_Manufacturer] PRIMARY KEY CLUSTERED 
    (
        [ManufacturerID] ASC
    )
)



GO


CREATE TABLE [dbo].[Section](
    [SectionID] [int] IDENTITY(1,1) NOT NULL,
    [SectionGUID] [uniqueidentifier] NOT NULL CONSTRAINT DF_Section_SectionGUID DEFAULT(newid()),
    [Name] [nvarchar](400) NOT NULL,
    [Summary] [ntext] NULL,
    [Description] [ntext] NULL,
    [SEKeywords] [ntext] NULL,
    [SEDescription] [ntext] NULL,
    [DisplayPrefix] [ntext] NULL,
    [SETitle] [ntext] NULL,
    [SENoScript] [ntext] NULL,
    [SEAltText] [ntext] NULL,
    [RelatedDocuments] [ntext] NULL,
    [ParentSectionID] [int] NOT NULL CONSTRAINT DF_Section_ParentSectionID DEFAULT((0)),
    [ColWidth] [int] NOT NULL CONSTRAINT DF_Section_ColWidth DEFAULT((4)),
    [SortByLooks] [tinyint] NOT NULL CONSTRAINT DF_Section_SortByLooks DEFAULT((0)),
    [DisplayOrder] [int] NOT NULL CONSTRAINT DF_Section_DisplayOrder DEFAULT((1)),
    [XmlPackage] [nvarchar](100) NULL,
    [AllowCategoryFiltering] [tinyint] NOT NULL CONSTRAINT DF_Section_AllowCategoryFiltering DEFAULT((0)),
    [AllowManufacturerFiltering] [tinyint] NOT NULL CONSTRAINT DF_Section_AllowManufacturerFiltering DEFAULT((0)),
    [AllowProductTypeFiltering] [tinyint] NOT NULL CONSTRAINT DF_Section_AllowProductTypeFiltering DEFAULT((0)),
    [Published] [tinyint] NOT NULL CONSTRAINT DF_Section_Published DEFAULT((1)),
    [Wholesale] [tinyint] NOT NULL CONSTRAINT DF_Section_Wholesale DEFAULT((0)),
    [ShowInProductBrowser] [int] NOT NULL CONSTRAINT DF_Section_ShowInProductBrowser DEFAULT((1)),
    [QuantityDiscountID] [int] NULL,
    [SEName] [nvarchar](100) NULL,
    [ExtensionData] [ntext] NULL,
    [ContentsBGColor] [nvarchar](10) NULL,
    [PageBGColor] [nvarchar](10) NULL,
    [GraphicsColor] [nvarchar](20) NULL,
    [ImageFilenameOverride] [ntext] NULL,
    [IsImport] [tinyint] NOT NULL CONSTRAINT DF_Section_IsImport DEFAULT((0)),
    [Deleted] [tinyint] NOT NULL CONSTRAINT DF_Section_Deleted DEFAULT((0)),
    [CreatedOn] [datetime] NOT NULL CONSTRAINT DF_Section_CreatedOn DEFAULT(getdate()),
    [PageSize] [int] NOT NULL CONSTRAINT DF_Section_PageSize DEFAULT((20)),
    [SkinID] int NOT NULL CONSTRAINT DF_Section_SkinID DEFAULT(0),
    [TemplateName] nvarchar(50) NOT NULL CONSTRAINT DF_Section_TemplateName DEFAULT(''),
    CONSTRAINT [PK_Section] PRIMARY KEY CLUSTERED 
    (
        [SectionID] ASC
    )
)


GO


CREATE TABLE [dbo].[Vector](
    [VectorID] [int] IDENTITY(1,1) NOT NULL,
    [VectorGUID] [uniqueidentifier] NOT NULL CONSTRAINT DF_Vector_VectorGUID DEFAULT(newid()),
    [Name] [nvarchar](400) NOT NULL,
    [SEName] [nvarchar](100) NULL,
    [SEKeywords] [ntext] NULL,
    [SEDescription] [ntext] NULL,
    [SETitle] [ntext] NULL,
    [SENoScript] [ntext] NULL,
    [SEAltText] [ntext] NULL,
    [Address1] [nvarchar](100) NULL,
    [Address2] [nvarchar](100) NULL,
    [Suite] [nvarchar](25) NULL,
    [City] [nvarchar](100) NULL,
    [State] [nvarchar](100) NULL,
    [ZipCode] [nvarchar](10) NULL,
    [Country] [nvarchar](100) NULL,
    [Phone] [nvarchar](25) NULL,
    [FAX] [nvarchar](25) NULL,
    [URL] [nvarchar](255) NULL,
    [Email] [nvarchar](100) NULL,
    [Summary] [ntext] NULL,
    [Description] [ntext] NULL,
    [Notes] [ntext] NULL,
    [QuantityDiscountID] [int] NULL,
    [SortByLooks] [tinyint] NOT NULL CONSTRAINT DF_Vector_SortByLooks DEFAULT((0)),
    [XmlPackage] [nvarchar](100) NULL,
    [ColWidth] [int] NOT NULL CONSTRAINT DF_Vector_ColWidth DEFAULT((4)),
    [DisplayOrder] [int] NOT NULL CONSTRAINT DF_Vector_DisplayOrder DEFAULT((1)),
    [ExtensionData] [ntext] NULL,
    [ContentsBGColor] [nvarchar](10) NULL,
    [PageBGColor] [nvarchar](10) NULL,
    [GraphicsColor] [nvarchar](20) NULL,
    [NotificationXmlPackage] [nvarchar](100) NULL,
    [ImageFilenameOverride] [ntext] NULL,
    [ParentVectorID] [int] NOT NULL CONSTRAINT DF_Vector_ParentVectorID DEFAULT((0)),
    [Published] [tinyint] NOT NULL CONSTRAINT DF_Vector_Published DEFAULT((1)),
    [Wholesale] [tinyint] NOT NULL CONSTRAINT DF_Vector_Wholesale DEFAULT((0)),
    [IsImport] [tinyint] NOT NULL CONSTRAINT DF_Vector_IsImport DEFAULT((0)),
    [Deleted] [tinyint] NOT NULL CONSTRAINT DF_Vector_Deleted DEFAULT((0)),
    [CreatedOn] [datetime] NOT NULL CONSTRAINT DF_Vector_CreatedOn DEFAULT(getdate()),
    [PageSize] [int] NOT NULL CONSTRAINT DF_Vector_PageSize DEFAULT((20)),
    [TaxClassID] [int] NOT NULL CONSTRAINT DF_Vector_TaxClassID DEFAULT((1)), -- this field is not used, but is here for uniformity as an Entity table
    [SkinID] int NOT NULL CONSTRAINT DF_Vector_SkinID DEFAULT(0),
    [TemplateName] nvarchar(50) NOT NULL CONSTRAINT DF_Vector_TemplateName DEFAULT(''),
    CONSTRAINT [PK_Vector] PRIMARY KEY CLUSTERED 
    (
        [VectorID] ASC
    )
)



GO


CREATE TABLE [dbo].[Product](
    [ProductID] [int] IDENTITY(1,1) NOT NULL,
    [ProductGUID] [uniqueidentifier] NOT NULL CONSTRAINT DF_Product_ProductGUID DEFAULT(newid()),
    [Name] [nvarchar](400) NOT NULL,
    [Summary] [ntext] NULL,
    [Description] [ntext] NULL,
    [SEKeywords] [ntext] NULL,
    [SEDescription] [ntext] NULL,
    [SpecTitle] [ntext] NULL,
    [MiscText] [ntext] NULL,
    [SwatchImageMap] [ntext] NULL,
    [IsFeaturedTeaser] [ntext] NULL,
    [FroogleDescription] [ntext] NULL,
    [SETitle] [ntext] NULL,
    [SENoScript] [ntext] NULL,
    [SEAltText] [ntext] NULL,
    [SizeOptionPrompt] [ntext] NULL,
    [ColorOptionPrompt] [ntext] NULL,
    [TextOptionPrompt] [ntext] NULL,
    [ProductTypeID] [int] NOT NULL CONSTRAINT DF_Product_ProductTypeID DEFAULT((1)),
    [TaxClassID] [int] NOT NULL CONSTRAINT DF_Product_TaxClassID DEFAULT((1)),
    [SKU] [nvarchar](50) NULL,
    [ManufacturerPartNumber] [nvarchar](50) NULL,
    [SalesPromptID] [int] NOT NULL CONSTRAINT DF_Product_SalesPromptID DEFAULT((1)),
    [SpecCall] [ntext] NULL,
    [SpecsInline] [tinyint] NOT NULL CONSTRAINT DF_Product_SpecsInline DEFAULT((0)),
    [IsFeatured] [tinyint] NOT NULL CONSTRAINT DF_Product_IsFeatured DEFAULT((0)),
    [XmlPackage] [nvarchar](100) NULL,
    [ColWidth] [int] NOT NULL CONSTRAINT DF_Product_ColWidth DEFAULT((4)),
    [Published] [tinyint] NOT NULL CONSTRAINT DF_Product_Published DEFAULT((1)),
    [Wholesale] [tinyint] NOT NULL CONSTRAINT DF_Product_Wholesale DEFAULT((0)),
    [RequiresRegistration] [tinyint] NOT NULL CONSTRAINT DF_Product_RequiresRegistration DEFAULT((0)),
    [Looks] [int] NOT NULL CONSTRAINT DF_Product_Looks DEFAULT((0)),
    [Notes] [ntext] NULL,
    [QuantityDiscountID] [int] NULL,
    [RelatedProducts] [ntext] NULL,
    [UpsellProducts] [ntext] NULL,
    [UpsellProductDiscountPercentage] [money] NOT NULL CONSTRAINT DF_Product_UpsellProductDiscountPercentage DEFAULT((0.0)),
    [RelatedDocuments] [ntext] NULL,
    [TrackInventoryBySizeAndColor] [tinyint] NOT NULL CONSTRAINT DF_Product_TrackInventoryBySizeAndColor DEFAULT((0)),
    [TrackInventoryBySize] [tinyint] NOT NULL CONSTRAINT DF_Product_TrackInventoryBySize DEFAULT((1)),
    [TrackInventoryByColor] [tinyint] NOT NULL CONSTRAINT DF_Product_TrackInventoryByColor DEFAULT((1)),
    [IsAKit] [tinyint] NOT NULL CONSTRAINT DF_Product_IsAKit DEFAULT((0)),
    [ShowInProductBrowser] [int] NOT NULL CONSTRAINT DF_Product_ShowInProductBrowser DEFAULT((1)),
    [IsAPack] [int] NOT NULL CONSTRAINT DF_Product_IsAPack DEFAULT((0)),
    [PackSize] [int] NOT NULL CONSTRAINT DF_Product_PackSize DEFAULT((0)),
    [ShowBuyButton] [int] NOT NULL CONSTRAINT DF_Product_ShowBuyButton DEFAULT((1)),
    [RequiresProducts] [ntext] NULL,
    [HidePriceUntilCart] [tinyint] NOT NULL CONSTRAINT DF_Product_HidePriceUntilCart DEFAULT((0)),
    [IsCalltoOrder] [tinyint] NOT NULL CONSTRAINT DF_Product_IsCalltoOrder DEFAULT((0)),
    [ExcludeFromPriceFeeds] [tinyint] NOT NULL CONSTRAINT DF_Product_ExcludeFromPriceFeeds DEFAULT((0)),
    [RequiresTextOption] [tinyint] NOT NULL CONSTRAINT DF_Product_RequiresTextOption DEFAULT((0)),
    [TextOptionMaxLength] [int] NULL,
    [SEName] [nvarchar](150) NULL,
    [ExtensionData] [ntext] NULL,
    [ExtensionData2] [ntext] NULL,
    [ExtensionData3] [ntext] NULL,
    [ExtensionData4] [ntext] NULL,
    [ExtensionData5] [ntext] NULL,
    [ContentsBGColor] [nvarchar](10) NULL,
    [PageBGColor] [nvarchar](10) NULL,
    [GraphicsColor] [nvarchar](20) NULL,
    [ImageFilenameOverride] [ntext] NULL,
    [IsImport] [tinyint] NOT NULL CONSTRAINT DF_Product_IsImport DEFAULT((0)),
    [IsSystem] [tinyint] NOT NULL CONSTRAINT DF_Product_IsSystem DEFAULT((0)),
    [Deleted] [tinyint] NOT NULL CONSTRAINT DF_Product_Deleted DEFAULT((0)),
    [CreatedOn] [datetime] NOT NULL CONSTRAINT DF_Product_CreatedOn DEFAULT(getdate()),
    [PageSize] [int] NOT NULL CONSTRAINT DF_Product_PageSize DEFAULT((20)),
    [WarehouseLocation] nvarchar(100) NULL,
    [AvailableStartDate] [datetime] NOT NULL CONSTRAINT DF_Product_AvailableStartDate DEFAULT(getdate()), -- field for future use. not used now
    [AvailableStopDate] [datetime] NULL, -- if null, there is no end date
    [GoogleCheckoutAllowed] [tinyint] NOT NULL CONSTRAINT DF_Product_GoogleCheckoutAllowed DEFAULT(1),
    [SkinID] int NOT NULL CONSTRAINT DF_Product_SkinID DEFAULT(0),
    [TemplateName] nvarchar(50) NOT NULL CONSTRAINT DF_Product_TemplateName DEFAULT(''),
    CONSTRAINT [PK_Item] PRIMARY KEY CLUSTERED 
    (
        [ProductID] ASC
    )
)


GO


CREATE TABLE [dbo].[ProductCategory](
    [ProductID] [int] NOT NULL,
    [CategoryID] [int] NOT NULL,
    [DisplayOrder] [int] NOT NULL CONSTRAINT DF_ProductCategory_DisplayOrder DEFAULT((1)),
    [CreatedOn] [datetime] NOT NULL CONSTRAINT DF_ProductCategory_CreatedOn DEFAULT(getdate()),
    CONSTRAINT [PK_ProductCategory] PRIMARY KEY CLUSTERED 
    (
        [ProductID] ASC,
        [CategoryID] ASC
    )
)

 

GO


CREATE TABLE [dbo].[ProductCustomerLevel](
    [ProductID] [int] NOT NULL,
    [CustomerLevelID] [int] NOT NULL,
    [DisplayOrder] [int] NOT NULL CONSTRAINT DF_ProductCustomerLevel_DisplayOrder DEFAULT((1)),
    [CreatedOn] [datetime] NOT NULL CONSTRAINT DF_ProductCustomerLevel_CreatedOn DEFAULT(getdate()),
    CONSTRAINT [PK_ProductCustomerLevel] PRIMARY KEY CLUSTERED 
    (
        [ProductID] ASC,
        [CustomerLevelID] ASC
    )
)



GO


CREATE TABLE [dbo].[ProductDistributor](
    [ProductID] [int] NOT NULL,
    [DistributorID] [int] NOT NULL,
    [DisplayOrder] [int] NOT NULL CONSTRAINT DF_ProductDistributor_DisplayOrder DEFAULT((1)),
    [CreatedOn] [datetime] NOT NULL CONSTRAINT DF_ProductDistributor_CreatedOn DEFAULT(getdate()),
    CONSTRAINT [PK_ProductDistributor] PRIMARY KEY CLUSTERED 
    (
        [ProductID] ASC,
        [DistributorID] ASC
    )
)


GO


CREATE TABLE [dbo].[ProductGenre](
    [ProductID] [int] NOT NULL,
    [GenreID] [int] NOT NULL,
    [DisplayOrder] [int] NOT NULL CONSTRAINT DF_ProductGenre_DisplayOrder DEFAULT((1)),
    [CreatedOn] [datetime] NOT NULL CONSTRAINT DF_ProductGenre_CreatedOn DEFAULT(getdate()),
    CONSTRAINT [PK_ProductGenre] PRIMARY KEY CLUSTERED 
    (
        [ProductID] ASC,
        [GenreID] ASC
    )
)


GO


CREATE TABLE [dbo].[ProductVariant](
    [VariantID] [int] IDENTITY(1,1) NOT NULL,
    [VariantGUID] [uniqueidentifier] NOT NULL CONSTRAINT DF_ProductVariant_VariantGUID DEFAULT(newid()),
    [IsDefault] [int] NOT NULL CONSTRAINT DF_ProductVariant_IsDefault DEFAULT((0)),
    [Name] [nvarchar](400) NULL,
    [Description] [ntext] NULL,
    [SEKeywords] [ntext] NULL,
    [SEDescription] [ntext] NULL,
    [SEAltText] [ntext] NULL,
    [Colors] [ntext] NULL,
    [ColorSKUModifiers] [ntext] NULL,
    [Sizes] [ntext] NULL,
    [SizeSKUModifiers] [ntext] NULL,
    [FroogleDescription] [ntext] NULL,
    [ProductID] [int] NOT NULL,
    [SKUSuffix] [nvarchar](50) NULL,
    [ManufacturerPartNumber] [nvarchar](50) NULL,
    [Price] [money] NOT NULL CONSTRAINT DF_ProductVariant_Price DEFAULT((0.0)),
    [SalePrice] [money] NULL,
    [Weight] [money] NULL,
    [MSRP] [money] NULL,
    [Cost] [money] NULL,
    [Points] [int] NULL CONSTRAINT DF_ProductVariant_Points DEFAULT((0)),
    [Dimensions] [nvarchar](100) NULL,
    [Inventory] [int] NOT NULL CONSTRAINT DF_ProductVariant_Inventory DEFAULT((1000000)),
    [DisplayOrder] [int] NOT NULL CONSTRAINT DF_ProductVariant_DisplayOrder DEFAULT((1)),
    [Notes] [ntext] NULL,
    [IsTaxable] [tinyint] NOT NULL CONSTRAINT DF_ProductVariant_IsTaxable DEFAULT((1)),
    [IsShipSeparately] [tinyint] NOT NULL CONSTRAINT DF_ProductVariant_IsShipSeparately DEFAULT((0)),
    [IsDownload] [tinyint] NOT NULL CONSTRAINT DF_ProductVariant_IsDownload DEFAULT((0)),
    [DownloadLocation] [ntext] NULL,
    [FreeShipping] [tinyint] NOT NULL CONSTRAINT DF_ProductVariant_FreeShipping DEFAULT((0)),
    [Published] [tinyint] NOT NULL CONSTRAINT DF_ProductVariant_Published DEFAULT((1)),
    [Wholesale] [tinyint] NOT NULL CONSTRAINT DF_ProductVariant_Wholesale DEFAULT((0)),
    [IsSecureAttachment] [tinyint] NOT NULL CONSTRAINT DF_ProductVariant_IsSecureAttachment DEFAULT((0)),
    [IsRecurring] [tinyint] NOT NULL CONSTRAINT DF_ProductVariant_IsRecurring DEFAULT((0)),
    [RecurringInterval] [int] NOT NULL CONSTRAINT DF_ProductVariant_RecurringInterval DEFAULT((1)),
    [RecurringIntervalType] [int] NOT NULL CONSTRAINT DF_ProductVariant_RecurringIntervalType DEFAULT((3)),
    [SubscriptionInterval] [int] NULL,
    [RewardPoints] [int] NULL,
    [SEName] [nvarchar](100) NULL,
    [RestrictedQuantities] [nvarchar](250) NULL,
    [MinimumQuantity] [int] NULL,
    [ExtensionData] [ntext] NULL,
    [ExtensionData2] [ntext] NULL,
    [ExtensionData3] [ntext] NULL,
    [ExtensionData4] [ntext] NULL,
    [ExtensionData5] [ntext] NULL,
    [ContentsBGColor] [nvarchar](10) NULL,
    [PageBGColor] [nvarchar](10) NULL,
    [GraphicsColor] [nvarchar](20) NULL,
    [ImageFilenameOverride] [ntext] NULL,
    [IsImport] [tinyint] NOT NULL CONSTRAINT DF_ProductVariant_IsImport DEFAULT((0)),
    [Deleted] [tinyint] NOT NULL CONSTRAINT DF_ProductVariant_Deleted DEFAULT((0)),
    [CreatedOn] [datetime] NOT NULL CONSTRAINT DF_ProductVariant_CreatedOn DEFAULT(getdate()),
    [SubscriptionIntervalType] [int] NOT NULL CONSTRAINT DF_ProductVariant_SubscriptionIntervalType DEFAULT((3)),
    [CustomerEntersPrice] [tinyint] NOT NULL CONSTRAINT DF_ProductVariant_CustomerEntersPrice DEFAULT((0)),
    [CustomerEntersPricePrompt] [ntext] NULL,
	[Condition] [tinyint] NOT NULL CONSTRAINT DF_ProductVariant_Condition DEFAULT ((0)),
    CONSTRAINT [PK_ProductVariants] PRIMARY KEY CLUSTERED 
    (
        [VariantID] ASC
    )
)



GO


CREATE TABLE [dbo].[ProductVector](
    [ProductID] [int] NOT NULL,
    [VectorID] [int] NOT NULL,
    [DisplayOrder] [int] NOT NULL CONSTRAINT DF_ProductVector_DisplayOrder DEFAULT((1)),
    [CreatedOn] [datetime] NOT NULL CONSTRAINT DF_ProductVector_CreatedOn DEFAULT(getdate()),
    CONSTRAINT [PK_ProductVector] PRIMARY KEY CLUSTERED 
    (
        [ProductID] ASC,
        [VectorID] ASC
    )
)


GO

CREATE TABLE [dbo].[ProductSection](
    [ProductID] [int] NOT NULL,
    [SectionID] [int] NOT NULL,
    [DisplayOrder] [int] NOT NULL CONSTRAINT DF_ProductSection_DisplayOrder DEFAULT((1)),
    [CreatedOn] [datetime] NOT NULL CONSTRAINT DF_ProductSection_CreatedOn DEFAULT(getdate()),
    CONSTRAINT [PK_ProductSection] PRIMARY KEY CLUSTERED 
    (
        [ProductID] ASC,
        [SectionID] ASC
    )
)



GO


CREATE TABLE [dbo].[ProductView](
	[ViewID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerViewID] NVARCHAR(50)  NOT NULL,
	[ProductID] [int] NOT NULL,
	[ViewDate] [datetime] NOT NULL,
	CONSTRAINT [PK_ProductView] PRIMARY KEY CLUSTERED 
	(
		[ViewID] ASC
	)
)


GO


CREATE TABLE [dbo].[ProductAffiliate](
    [ProductID] [int] NOT NULL,
    [AffiliateID] [int] NOT NULL,
    [DisplayOrder] [int] NOT NULL CONSTRAINT DF_ProductAffiliate_DisplayOrder DEFAULT((1)),
    [CreatedOn] [datetime] NOT NULL CONSTRAINT DF_ProductAffiliate_CreatedOn DEFAULT(getdate()),
    CONSTRAINT [PK_ProductAffiliate] PRIMARY KEY CLUSTERED 
    (
        [ProductID] ASC,
        [AffiliateID] ASC
    )
)


GO


CREATE TABLE [dbo].[ProductType](
    [ProductTypeID] [int] IDENTITY(1,1) NOT NULL,
    [ProductTypeGUID] [uniqueidentifier] NOT NULL CONSTRAINT DF_ProductType_ProductTypeGUID DEFAULT(newid()),
    [Name] [nvarchar](400) NOT NULL,
    [DisplayOrder] [int] NOT NULL CONSTRAINT DF_ProductType_DisplayOrder DEFAULT((1)),
    [TaxClassID] [int] NOT NULL CONSTRAINT DF_ProductType_TaxClassID DEFAULT((1)),
    [CreatedOn] [datetime] NOT NULL CONSTRAINT DF_ProductType_CreatedOn DEFAULT(getdate()),
    CONSTRAINT [PK_ProductType] PRIMARY KEY CLUSTERED 
    (
        [ProductTypeID] ASC
    )
)


GO


CREATE TABLE [dbo].[ProductManufacturer](
    [ProductID] [int] NOT NULL,
    [ManufacturerID] [int] NOT NULL,
    [DisplayOrder] [int] NOT NULL CONSTRAINT DF_ProductManufacturer_DisplayOrder DEFAULT(1),
    [CreatedOn] [datetime] NOT NULL CONSTRAINT DF_ProductManufacturer_CreatedOn DEFAULT(getdate()),
    CONSTRAINT [PK_ProductManufacturer] PRIMARY KEY CLUSTERED 
    (
        [ProductID] ASC,
        [ManufacturerID] ASC
    )
)



GO


CREATE TABLE [dbo].[Inventory](
    [InventoryID] [int] IDENTITY(1,1) NOT NULL,
    [InventoryGUID] [uniqueidentifier] NOT NULL CONSTRAINT DF_Inventory_InventoryGUID DEFAULT(newid()),
    [VariantID] [int] NOT NULL,
    [Color] [nvarchar](100) NULL,
    [Size] [nvarchar](100) NULL,
    [Quan] [int] NOT NULL CONSTRAINT DF_Inventory_Quan DEFAULT((0)),
    [VendorFullSKU] nvarchar(50) null,
    [WarehouseLocation] nvarchar(100) NULL,
    [WeightDelta] [money] NOT NULL CONSTRAINT DF_Inventory_WeightDelta DEFAULT (0.0),
    [VendorID] nvarchar(50) null,
    [ExtensionData] [ntext] NULL,
    [CreatedOn] [datetime] NOT NULL CONSTRAINT DF_Inventory_CreatedOn DEFAULT(getdate()),
    CONSTRAINT [PK_Inventory] PRIMARY KEY CLUSTERED 
    (
        [InventoryID] ASC
    )
)



GO


CREATE TABLE [dbo].[CouponUsage](
    [CouponUsageID] [int] IDENTITY(1,1) NOT NULL,
    [CustomerID] [int] NOT NULL,
    [CouponCode] [nvarchar](100) NOT NULL,
    [CreatedOn] [datetime] NOT NULL CONSTRAINT DF_CouponUsage_CreatedOn DEFAULT (getdate()),
    CONSTRAINT [PK_CouponUsage] PRIMARY KEY CLUSTERED 
    (
        [CouponUsageID] ASC
    )
)


GO


CREATE TABLE [dbo].[Coupon](
    [CouponID] [int] IDENTITY(1,1) NOT NULL,
    [CouponGUID] [uniqueidentifier] NOT NULL CONSTRAINT DF_Coupon_CouponGUID DEFAULT(newid()),
    [CouponCode] [nvarchar](50) NOT NULL,
    [Description] [ntext] NULL,
	[StartDate] [datetime] NOT NULL CONSTRAINT DF_Coupon_StartDate DEFAULT((getdate())),
    [ExpirationDate] [datetime] NOT NULL,
    [DiscountPercent] [money] NOT NULL CONSTRAINT DF_Coupon_DiscountPercent DEFAULT((0.0)),
    [DiscountAmount] [money] NOT NULL CONSTRAINT DF_Coupon_DiscountAmount DEFAULT((0.0)),
    [DiscountIncludesFreeShipping] [tinyint] NOT NULL CONSTRAINT DF_Coupon_DiscountIncludesFreeShipping DEFAULT((0)),
    [ExpiresOnFirstUseByAnyCustomer] [tinyint] NOT NULL CONSTRAINT DF_Coupon_ExpiresOnFirstUseByAnyCustomer DEFAULT((0)),
    [ExpiresAfterOneUsageByEachCustomer] [tinyint] NOT NULL CONSTRAINT DF_Coupon_ExpiresAfterOneUsageByEachCustomer DEFAULT((1)),
    [ExpiresAfterNUses] [int] NULL,
    [RequiresMinimumOrderAmount] [money] NULL,
    [ValidForCustomers] [ntext] NULL,
    [ValidForProducts] [ntext] NULL,
    [ValidForManufacturers] [ntext] NULL,
    [ValidForCategories] [ntext] NULL,
    [ValidForSections] [ntext] NULL,
    [CouponType] [int] NOT NULL CONSTRAINT DF_Coupon_CouponType DEFAULT((0)),
    [NumUses] [int] NOT NULL CONSTRAINT DF_Coupon_NumUses DEFAULT((0)),
    [ExtensionData] [ntext] NULL,
    [Deleted] [tinyint] NOT NULL CONSTRAINT DF_Coupon_Deleted DEFAULT((0)),
    [CreatedOn] [datetime] NOT NULL CONSTRAINT DF_Coupon_CreatedOn DEFAULT(getdate()),
    CONSTRAINT [PK_Coupons] PRIMARY KEY CLUSTERED 
    (
        [CouponID] ASC
    )
)



GO



CREATE TABLE [dbo].[GiftCard](
    [GiftCardID] [int] IDENTITY(1,1) NOT NULL,
    [GiftCardGUID] [uniqueidentifier] NOT NULL CONSTRAINT DF_GiftCard_GiftCardGUID DEFAULT(newid()),
    [SerialNumber] [nvarchar](100) NULL,
    [PurchasedByCustomerID] [int] NOT NULL,
    [OrderNumber] [int] NOT NULL CONSTRAINT DF_GiftCard_OrderNumber DEFAULT((0)),
    [ShoppingCartRecID] [int] NOT NULL CONSTRAINT DF_GiftCard_ShoppingCartRecID DEFAULT((0)),
    [ProductID] [int] NOT NULL CONSTRAINT DF_GiftCard_ProductID DEFAULT((0)), -- not used currently, for future expansion
    [VariantID] [int] NOT NULL CONSTRAINT DF_GiftCard_VariantID DEFAULT((0)), -- not used currently, for future expansion
    [InitialAmount] [money] NOT NULL CONSTRAINT DF_GiftCard_InitialAmount DEFAULT((0.0)),
    [Balance] [money] NOT NULL CONSTRAINT DF_GiftCard_Balance DEFAULT((0.0)),
    [StartDate] [datetime] NOT NULL CONSTRAINT DF_GiftCard_StartDate DEFAULT(getdate()),
	[ExpirationDate] [datetime]  CONSTRAINT [DF_GiftCard_ExpirationDate] default dateadd(yy,1,getdate()) NOT NULL,
    [GiftCardTypeID] [int] NULL CONSTRAINT DF_GiftCard_GiftCardTypeID DEFAULT((101)),
    [EMailName] [nvarchar](100) NULL,
    [EMailTo] [nvarchar](100) NULL,
    [EMailMessage] [ntext] NULL,
    [ValidForCustomers] [ntext] NULL, -- not used currently, for future expansion
    [ValidForProducts] [ntext] NULL, -- not used currently, for future expansion
    [ValidForManufacturers] [ntext] NULL, -- not used currently, for future expansion
    [ValidForCategories] [ntext] NULL, -- not used currently, for future expansion
    [ValidForSections] [ntext] NULL, -- not used currently, for future expansion
    [DisabledByAdministrator] [tinyint]  CONSTRAINT [DF_GiftCard_DisabledByAdministrator] default(0) NOT NULL,
    [ExtensionData] [ntext] NULL, -- not used currently, for future expansion
    [CreatedOn] [datetime] NOT NULL CONSTRAINT DF_GiftCard_CreatedOn DEFAULT(getdate()),
    CONSTRAINT [PK_GiftCard] PRIMARY KEY CLUSTERED 
    (
        [GiftCardID] ASC
    )
)

GO


CREATE TABLE [dbo].[GiftCardUsage](
    [GiftCardUsageID] [int] IDENTITY(1,1) NOT NULL,
    [GiftCardUsageGUID] [uniqueidentifier] NOT NULL CONSTRAINT DF_GiftCardUsage_GiftCardUsageGUID DEFAULT(newid()),
    [GiftCardID] [int] NOT NULL,
    [UsageTypeID] [int] NOT NULL  CONSTRAINT [DF_GiftCardUsage_UsageTypeID] default(0), -- 0 = used by customer, 1 = funds added by store admin, 2 = funds decremented by store admin
    [UsedByCustomerID] [int] NOT NULL CONSTRAINT DF_GiftCardUsage_UsedByCustomerID DEFAULT((0)),
    [OrderNumber] [int] NOT NULL CONSTRAINT DF_GiftCardUsage_OrderNumber DEFAULT((0)),
    [Amount] [money] NOT NULL CONSTRAINT DF_GiftCardUsage_Amount DEFAULT((0.0)),
    [ExtensionData] [ntext] NULL, -- not used currently, for future expansion
    [CreatedOn] [datetime] NOT NULL CONSTRAINT DF_GiftCardUsage_CreatedOn DEFAULT(getdate()),
    CONSTRAINT [PK_GiftCardUsage] PRIMARY KEY CLUSTERED 
    (
        [GiftCardUsageID] ASC
    )
)


GO


CREATE TABLE [dbo].[ClickTrack](
    [ClickTrackID] [int] IDENTITY(1,1) NOT NULL,
    [Name] [nvarchar](100) NOT NULL,
    [CreatedOn] [datetime] NOT NULL CONSTRAINT DF_ClickTrack_CreatedOn DEFAULT(getdate()),
    CONSTRAINT [PK_ClickTrack] PRIMARY KEY CLUSTERED 
    (
        [ClickTrackID] ASC
    )
)


GO


CREATE TABLE [dbo].[ShippingByProduct](
    [ShippingByProductID] [int] IDENTITY(1,1) NOT NULL,
    [ShippingByProductGUID] [uniqueidentifier] NOT NULL CONSTRAINT DF_ShippingByProduct_ShippingByProductGUID DEFAULT(newid()),
    [VariantID] [int] NOT NULL,
    [ShippingMethodID] [int] NOT NULL,
    [ShippingCost] [money] NOT NULL,
    [CreatedOn] [datetime] NOT NULL CONSTRAINT DF_ShippingByProduct_CreatedOn DEFAULT(getdate()),
    CONSTRAINT [PK_ShippingByProduct] PRIMARY KEY CLUSTERED 
    (
        [ShippingByProductID] ASC
    )
    
)

 

GO


CREATE TABLE [dbo].[ShippingByTotal](
    [RowGUID] [uniqueidentifier] NOT NULL CONSTRAINT DF_ShippingByTotal_RowGUID DEFAULT(newid()),
    [StoreID] INT NOT NULL CONSTRAINT DF_ShippingByTotal_StoreID DEFAULT(1),
    [LowValue] [money] NOT NULL,
    [HighValue] [money] NOT NULL,
    [ShippingMethodID] [int] NOT NULL,
    [ShippingCharge] [money] NOT NULL,
    [CreatedOn] [datetime] NOT NULL CONSTRAINT DF_ShippingByTotal_CreatedOn DEFAULT(getdate())
)


GO



CREATE TABLE [dbo].[ShippingByTotalByPercent](
    [RowGUID] [uniqueidentifier] NOT NULL CONSTRAINT DF_ShippingByTotalByPercent_RowGUID DEFAULT(newid()),
	[StoreID] INT NOT NULL CONSTRAINT DF_ShippingByTotalByPercent_StoreID DEFAULT(1),
    [LowValue] [money] NOT NULL,
    [HighValue] [money] NOT NULL,
    [ShippingMethodID] [int] NOT NULL,
    [MinimumCharge] [money] NOT NULL,
    [SurCharge] [money] NOT NULL,
    [PercentOfTotal] [money] NOT NULL,
    [CreatedOn] [datetime] NOT NULL CONSTRAINT DF_ShippingByTotalByPercent_CreatedOn DEFAULT(getdate())
)


GO



CREATE TABLE [dbo].[ShippingByWeight](
    [RowGUID] [uniqueidentifier] NOT NULL CONSTRAINT DF_ShippingByWeight_RowGUID DEFAULT(newid()),
	[StoreID] INT NOT NULL CONSTRAINT DF_ShippingByWeight_StoreID DEFAULT(1),
    [LowValue] [money] NOT NULL,
    [HighValue] [money] NOT NULL,
    [ShippingMethodID] [int] NOT NULL,
    [ShippingCharge] [money] NOT NULL,
    [CreatedOn] [datetime] NOT NULL CONSTRAINT DF_ShippingByWeight_CreatedOn DEFAULT(getdate())
)


GO


CREATE TABLE [dbo].[ShippingCalculation](
    [ShippingCalculationID] [int] IDENTITY(1,1) NOT NULL,
    [ShippingCalculationGUID] [uniqueidentifier] NOT NULL CONSTRAINT DF_ShippingCalculation_ShippingCalculationGUID DEFAULT(newid()),
    [Name] [nvarchar](400) NOT NULL,
    [Selected] [tinyint] NOT NULL,
    [DisplayOrder] [int] NOT NULL CONSTRAINT DF_ShippingCalculation_DisplayOrder DEFAULT((1)),
    [CreatedOn] [datetime] NOT NULL CONSTRAINT DF_ShippingCalculation_CreatedOn DEFAULT(getdate()),
    CONSTRAINT [PK_ShippingCalculation] PRIMARY KEY CLUSTERED 
    (
        [ShippingCalculationID] ASC
    )
)


GO


CREATE TABLE [dbo].[ShippingImportExport](
    [OrderNumber] [int] NOT NULL,
    [CustomerID] [int] NOT NULL,
    [StoreID] INT NOT NULL CONSTRAINT DF_ShippingImportExport_StoreID DEFAULT(1),
    [CompanyName] [nvarchar](50) NULL,
    [CustomerLastName] [nvarchar](50) NOT NULL,
    [CustomerFirstName] [nvarchar](50) NOT NULL,
    [CustomerPhone] [nvarchar](50) NULL,
    [CustomerEmail] [nvarchar](100) NULL,
    [Address1] [nvarchar](100) NOT NULL,
    [Address2] [nvarchar](100) NULL,
    [Suite] [nvarchar](50) NULL,
    [City] [nvarchar](100) NOT NULL,
    [State] [nvarchar](100) NOT NULL,
    [Zip] [nvarchar](10) NOT NULL,
    [Country] [nvarchar](100) NOT NULL,
    [ServiceCarrierCode] [nvarchar](50) NULL,
    [TrackingNumber] [nvarchar](100) NULL,
    [Cost] [money] NULL,
    [Weight] [money] NULL,
    CONSTRAINT [PK_ShippingImportExport] PRIMARY KEY CLUSTERED
    (
        [OrderNumber] ASC
    )
)


GO


CREATE TABLE [dbo].[ShippingMethod](
    [ShippingMethodID] [int] IDENTITY(1,1) NOT NULL,
    [ShippingMethodGUID] [uniqueidentifier] NOT NULL CONSTRAINT DF_ShippingMethod_ShippingMethodGUID DEFAULT(newid()),
	[StoreID] INT NOT NULL CONSTRAINT DF_ShippingMethod_StoreID DEFAULT(1),
    [Name] [nvarchar](2000) NOT NULL,
    [FixedRate] [money] NULL,
    [FixedPercentOfTotal] [money] NULL,
    [ShipRushTemplate] [ntext] NULL,
    [DisplayOrder] [int] NOT NULL CONSTRAINT DF_ShippingMethod_DisplayOrder DEFAULT((1)),
    [ExtensionData] [ntext] NULL,
    [IsRTShipping] [tinyint] NOT NULL CONSTRAINT DF_ShippingMethod_IsRTShipping DEFAULT((0)),
    [CreatedOn] [datetime] NOT NULL CONSTRAINT DF_ShippingMethod_CreatedOn DEFAULT(getdate()),
    [MappedPM] [nvarchar](400) NULL,
    CONSTRAINT [PK_ShippingMethod] PRIMARY KEY CLUSTERED 
    (
        [ShippingMethodID] ASC
    )
)

GO


CREATE TABLE [dbo].[ShippingMethodToCountryMap](
    [ShippingMethodID] [int] NOT NULL,
	[StoreID] INT NOT NULL CONSTRAINT DF_ShippingMethodToCountryMap_StoreID DEFAULT(1),
    [CountryID] [int] NOT NULL,
    [CreatedOn] [datetime] NOT NULL CONSTRAINT DF_ShippingMethodToCountryMap_CreatedOn DEFAULT(getdate()),
    CONSTRAINT [PK_ShippingMethodToCountryMap] PRIMARY KEY CLUSTERED 
    (
        [ShippingMethodID] ASC,
        [CountryID] ASC
    )
)


GO

CREATE TABLE [dbo].[ShippingMethodToStateMap](
    [ShippingMethodID] [int] NOT NULL,
	[StoreID] INT NOT NULL CONSTRAINT DF_ShippingMethodToStateMap_StoreID DEFAULT(1),
    [StateID] [int] NOT NULL,
    [CreatedOn] [datetime] NOT NULL CONSTRAINT DF_ShippingMethodToStateMap_CreatedOn DEFAULT(getdate()),
    CONSTRAINT [PK_ShippingMethodToStateMap] PRIMARY KEY CLUSTERED 
    (
        [ShippingMethodID] ASC,
        [StateID] ASC
    )
)



GO


CREATE TABLE [dbo].[ShippingMethodToZoneMap](
    [ShippingMethodID] [int] NOT NULL,
    [StoreID] INT NOT NULL CONSTRAINT DF_ShippingMethodToZoneMap_StoreID DEFAULT(1),
    [ShippingZoneID] [int] NOT NULL,
    [CreatedOn] [datetime] NOT NULL CONSTRAINT DF_ShippingMethodToZoneMap_CreatedOn DEFAULT(getdate()),
    CONSTRAINT [PK_ShippingMethodToZoneMap] PRIMARY KEY CLUSTERED 
    (
        [ShippingMethodID] ASC,
        [ShippingZoneID] ASC
    )
)



GO


CREATE TABLE [dbo].[ShippingTotalByZone](
    [RowGUID] [uniqueidentifier] NOT NULL CONSTRAINT DF_ShippingTotalByZone_RowGUID DEFAULT(newid()),
	[StoreID] INT NOT NULL CONSTRAINT DF_ShippingTotalByZone_StoreID DEFAULT(1),
    [ShippingMethodID] [int] NOT NULL,
    [LowValue] [money] NOT NULL,
    [HighValue] [money] NOT NULL,
    [ShippingZoneID] [int] NOT NULL,
    [ShippingCharge] [money] NOT NULL,
    [CreatedOn] [datetime] NOT NULL CONSTRAINT DF_ShippingTotalByZone_CreatedOn DEFAULT(getdate())
)



GO


CREATE TABLE [dbo].[ShippingWeightByZone](
    [RowGUID] [uniqueidentifier] NOT NULL CONSTRAINT DF_ShippingWeightByZone_RowGUID DEFAULT(newid()),
    [ShippingMethodID] [int] NOT NULL,
    [LowValue] [money] NOT NULL,
    [HighValue] [money] NOT NULL,
    [ShippingZoneID] [int] NOT NULL,
    [ShippingCharge] [money] NOT NULL,
    [CreatedOn] [datetime] NOT NULL CONSTRAINT DF_ShippingWeightByZone_CreatedOn DEFAULT(getdate())
)


GO


CREATE TABLE [dbo].[ShippingZone](
    [ShippingZoneID] [int] IDENTITY(1,1) NOT NULL,
    [ShippingZoneGUID] [uniqueidentifier] NOT NULL CONSTRAINT DF_ShippingZone_ShippingZoneGUID DEFAULT(newid()),
    [Name] [nvarchar](400) NOT NULL,
    [ZipCodes] [ntext] NULL,
    [DisplayOrder] [int] NOT NULL CONSTRAINT DF_ShippingZone_DisplayOrder DEFAULT((1)),
    [ExtensionData] [ntext] NULL,
    [Deleted] [tinyint] NOT NULL CONSTRAINT DF_ShippingZone_Deleted DEFAULT((0)),
    [CreatedOn] [datetime] NOT NULL CONSTRAINT DF_ShippingZone_CreatedOn DEFAULT(getdate()),
	[CountryID] [int]  NULL,
    CONSTRAINT [PK_ShippingZone] PRIMARY KEY CLUSTERED 
    (
        [ShippingZoneID] ASC
    )
)


GO


CREATE TABLE [dbo].[AffiliateStore](
    [ID] [int] IDENTITY(1,1) NOT NULL,
    [AffiliateID] [INT] NOT NULL CONSTRAINT [DF_AffiliateStore_AffiliateID]  DEFAULT ((0)),
	[StoreID] [INT] NOT NULL CONSTRAINT [DF_AffiliateStore_StoreID]  DEFAULT ((1)),
	[CreatedOn] [datetime] NOT NULL CONSTRAINT DF_AffiliateStore_CreatedOn DEFAULT(getdate()) 
	CONSTRAINT [PK_AffiliateStore] PRIMARY KEY CLUSTERED 
	(
		[AffiliateID] ASC,
		[StoreID] ASC
	)ON [PRIMARY]	
)



GO


CREATE TABLE [dbo].[NewsStore](
    [ID] [int] IDENTITY(1,1) NOT NULL,
    [NewsID] [INT] NOT NULL CONSTRAINT [DF_NewsStore_NewsID]  DEFAULT ((0)),
	[StoreID] [INT] NOT NULL CONSTRAINT [DF_NewsStore_StoreID]  DEFAULT ((1)),
	[CreatedOn] [datetime] NOT NULL CONSTRAINT DF_NewsStore_CreatedOn DEFAULT(getdate()) 
	CONSTRAINT [PK_NewsStore] PRIMARY KEY CLUSTERED 
	(
		[NewsID] ASC,
		[StoreID] ASC
	)ON [PRIMARY]	
)


GO


CREATE TABLE EntityStore(
	ID			INT IDENTITY(1,1) NOT NULL,
	StoreID		INT NOT NULL CONSTRAINT [DF_EntityStore_StoreID]	DEFAULT ((0)),
	EntityID	INT NOT NULL CONSTRAINT [DF_EntityStore_EntityID]	DEFAULT ((0)),
	EntityType	NVARCHAR (50) NOT NULL,
	CreatedOn	DATETIME NOT NULL CONSTRAINT DF_EntityStore_CreatedOn DEFAULT(GETDATE()) 
	CONSTRAINT [PK_EntityStore] PRIMARY KEY CLUSTERED 
	(
		[StoreID] ASC,
		[EntityID] ASC,
		[EntityType] ASC
	)ON [PRIMARY]
)



GO




CREATE TABLE ProductStore(
	[ID] [INT] IDENTITY(1,1) NOT NULL,
	[ProductID] [INT] NOT NULL CONSTRAINT [DF_ProductStore_ProductID]  DEFAULT ((0)),
	[StoreID] [INT] NOT NULL CONSTRAINT [DF_ProductStore_StoreID]  DEFAULT ((1)),
	[CreatedOn] [datetime] NOT NULL CONSTRAINT DF_ProductStore_CreatedOn DEFAULT(getdate()) 
	CONSTRAINT [PK_ProductStore] PRIMARY KEY CLUSTERED 
	(
		[ProductID] ASC,
		[StoreID] ASC
	)ON [PRIMARY]
)

GO


CREATE TABLE [dbo].[TopicStore](
    [ID] [int] IDENTITY(1,1) NOT NULL,
    [TopicID] [INT] NOT NULL CONSTRAINT [DF_TopicStore_TopicID]  DEFAULT ((0)),
	[StoreID] [INT] NOT NULL CONSTRAINT [DF_TopicStore_StoreID]  DEFAULT ((1)),
	[CreatedOn] [datetime] NOT NULL CONSTRAINT DF_TopicStore_CreatedOn DEFAULT(getdate()) 
	CONSTRAINT [PK_TopicStore] PRIMARY KEY CLUSTERED 
	(
		[TopicID] ASC,
		[StoreID] ASC
	)ON [PRIMARY]
)

GO


CREATE TABLE [dbo].[ShippingCalculationStore](
  [Id] [int] IDENTITY(1,1) NOT NULL,
  [StoreId] [int] NOT NULL,
  [ShippingCalculationId] [int] NOT NULL,
  [CreatedOn] [datetime] NULL CONSTRAINT [DF_StoreShippingCalculation_CreatedOn]  DEFAULT (getdate()),
 CONSTRAINT [PK_StoreShippingCalculation] PRIMARY KEY CLUSTERED 
(
  [StoreId] ASC,
  [ShippingCalculationId] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]


GO


CREATE TABLE [dbo].[ShippingMethodStore](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StoreId] [int] NOT NULL,
	[ShippingMethodId] [int] NOT NULL,
	[CreatedOn] [datetime] NULL CONSTRAINT [DF_StoreShippingMethod_CreatedOn]  DEFAULT (getdate()),
 CONSTRAINT [PK_StoreShippingMethod] PRIMARY KEY CLUSTERED 
(
	[StoreId] ASC,
	[ShippingMethodId] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]


GO


CREATE TABLE PollStore(
	[ID] [INT] IDENTITY(1,1) NOT NULL,
	[PollID] [INT] NOT NULL CONSTRAINT [DF_PollStore_PollID]  DEFAULT (0),
	[StoreID] [INT] NOT NULL CONSTRAINT [DF_PollStore_StoreID]  DEFAULT (1),
	[CreatedOn] [datetime] NOT NULL CONSTRAINT [DF_PollStore_CreatedOn] DEFAULT(getdate()) 
	CONSTRAINT [PK_PollStore] PRIMARY KEY CLUSTERED 
	(
		[PollID] ASC,
		[StoreID] ASC
	)ON [PRIMARY]
)


GO


CREATE TABLE GiftCardStore(
	[ID] [INT] IDENTITY(1,1) NOT NULL,
	[GiftCardID] [INT] NOT NULL CONSTRAINT [DF_GiftCardStore_GiftCardID]  DEFAULT (0),
	[StoreID] [INT] NOT NULL CONSTRAINT [DF_GiftCardStore_StoreID]  DEFAULT (1),
	[CreatedOn] [datetime] NOT NULL CONSTRAINT [DF_GiftCardStore_CreatedOn] DEFAULT(getdate()) 
	CONSTRAINT [PK_GiftCardStore] PRIMARY KEY CLUSTERED 
	(
		[GiftCardID] ASC,
		[StoreID] ASC
	)ON [PRIMARY]
)


GO


CREATE TABLE [dbo].[CouponStore](
    [ID] [int] IDENTITY(1,1) NOT NULL,
    [CouponID] [INT] NOT NULL CONSTRAINT [DF_CouponStore_CouponID]  DEFAULT ((0)),
	[StoreID] [INT] NOT NULL CONSTRAINT [DF_CouponStore_StoreID]  DEFAULT ((1)),
	[CreatedOn] [datetime] NOT NULL CONSTRAINT DF_CouponStore_CreatedOn DEFAULT(getdate()) 
	CONSTRAINT [PK_CouponStore] PRIMARY KEY CLUSTERED 
	(
		[CouponID] ASC,
		[StoreID] ASC
	)ON [PRIMARY]
)


GO


CREATE TABLE [dbo].[OrderOptionStore](
    [ID] [int] IDENTITY(1,1) NOT NULL,
    [OrderOptionID] [INT] NOT NULL CONSTRAINT [DF_OrderOptionStore_OrderOptionID]  DEFAULT ((0)),
	[StoreID] [INT] NOT NULL CONSTRAINT [DF_OrderOptionStore_StoreID]  DEFAULT ((1)),
	[CreatedOn] [datetime] NOT NULL CONSTRAINT DF_OrderOptionStore_CreatedOn DEFAULT(getdate()) 
	CONSTRAINT [PK_OrderOptionStore] PRIMARY KEY CLUSTERED 
	(
		[OrderOptionID] ASC,
		[StoreID] ASC
	)ON [PRIMARY]
)



GO


CREATE TABLE [dbo].[AppConfig](
    [AppConfigID] [int] IDENTITY(1,1) NOT NULL,
    [AppConfigGUID] [uniqueidentifier] NOT NULL CONSTRAINT DF_AppConfig_AppConfigGUID DEFAULT(newid()),
    [StoreID] INT NOT NULL CONSTRAINT DF_AppConfig_StoreID DEFAULT(1),
    [Name] [nvarchar](100) NOT NULL,
    [Description] [ntext] NULL,
    [ConfigValue] [nvarchar](1000) NULL,
    [ValueType] [nvarchar](100) NULL,
    [AllowableValues] [nvarchar](max) NULL,
    [GroupName] [nvarchar](100) NULL,
    [SuperOnly] [tinyint] NOT NULL CONSTRAINT DF_AppConfig_SuperOnly DEFAULT((0)),
    [Hidden] bit NOT NULL CONSTRAINT DF_AppConfig_Hidden DEFAULT(0),
    [CreatedOn] [datetime] NOT NULL CONSTRAINT DF_AppConfig_CreatedOn DEFAULT(getdate()),
    CONSTRAINT [PK_AppConfig] PRIMARY KEY CLUSTERED 
    (
        [AppConfigID] ASC
    )
)

GO


CREATE TABLE [dbo].[aspdnsf_SysLog](
    [SysLogID] [int] IDENTITY(1,1) NOT NULL,
    [SysLogGUID] [uniqueidentifier] NOT NULL CONSTRAINT DF_aspdnsf_SysLog_SysLogGUID DEFAULT (newid()),
    [Message] [nvarchar](max) NOT NULL,
    [Details] [nvarchar](max) NULL,
	[Type] [nvarchar](100) NOT NULL,
    [Severity] [nvarchar](100) NOT NULL,
    [CreatedOn] [datetime] NOT NULL CONSTRAINT DF_aspdnsf_SysLog_CreatedOn DEFAULT (getdate()),
     CONSTRAINT [PK_aspdnsf_SysLog] PRIMARY KEY CLUSTERED 
    (
        [SysLogID] DESC
    )
)

GO


CREATE TABLE [dbo].[AuditLog](
    [AuditLogID] [bigint] IDENTITY(1,1) NOT NULL,
    [ActionDate] [datetime] NOT NULL CONSTRAINT [DF_AuditLog_ActionDate]  DEFAULT (getdate()),
    [CustomerID] [int] NOT NULL,
    [UpdatedCustomerID] [int] NOT NULL,
    [OrderNumber] [int] NOT NULL,
    [Description] [nvarchar](100) NOT NULL,
    [Details] [nvarchar](1000) NOT NULL,
    [PagePath] [nvarchar](200) NOT NULL,
    [AuditGroup] [nvarchar](30) NOT NULL
    CONSTRAINT [PK_AuditLog] PRIMARY KEY CLUSTERED 
    (
        [AuditLogID] ASC
    )
) 

GO


CREATE TABLE [dbo].[ErrorLog](
    [logid] [int] IDENTITY(1,1) NOT NULL,
    [errorDt] [datetime] NOT NULL CONSTRAINT DF_ErrorLog_errorDt DEFAULT(getdate()),
    [source] [varchar](400) NULL,
    [errormsg] [text] NULL,
    CONSTRAINT [PK_ErrorLog] PRIMARY KEY CLUSTERED 
    (
        [logid] ASC
    )
)



GO


CREATE TABLE [dbo].[EventHandler]
(
    EventID int not null IDENTITY,
    EventName nvarchar(20) not null,
    CalloutURL varchar(200) not null,
    XmlPackage varchar(100) not null,
    Debug bit not null CONSTRAINT DF_EventHandler_Debug DEFAULT (0),
    Active bit not null CONSTRAINT DF_EventHandler_Active DEFAULT (0),
    CONSTRAINT PK_EventHandler PRIMARY KEY CLUSTERED 
    (
        EventID 
    )
)


GO


CREATE TABLE [dbo].[SQLLog](
    [SQLLogID] [int] IDENTITY(1,1) NOT NULL,
    [SQLText] [ntext] NOT NULL,
    [ExecutedBy] [int] NOT NULL CONSTRAINT DF_SQLLog_ExecutedBy DEFAULT((0)),
    [ExecutedOn] [datetime] NOT NULL CONSTRAINT DF_SQLLog_ExecutedOn DEFAULT(getdate()),
    CONSTRAINT [PK_SQLLog] PRIMARY KEY CLUSTERED 
    (
        [SQLLogID] ASC
    )
)


GO


CREATE TABLE [dbo].[LOG_Event](
    [EventID] [int] IDENTITY(1,1) NOT NULL,
    [Name] [nvarchar](100) NULL,
    [CreatedOn] [datetime] NOT NULL CONSTRAINT DF_LOG_Event_CreatedOn DEFAULT (getdate()),
    CONSTRAINT [PK_LOG_Events] PRIMARY KEY NONCLUSTERED 
    (
        [EventID] ASC
    )
)


GO


CREATE TABLE [dbo].[SecurityLog](
    [logid] [bigint] IDENTITY(1,1) NOT NULL,
    [SecurityAction] [nvarchar](1000) NOT NULL, -- encrypted
    [Description] [ntext] NOT NULL, -- encrypted
    [ActionDate] [datetime] NOT NULL CONSTRAINT [DF_SecurityLog_ActionDate]  DEFAULT (getdate()),
    [CustomerUpdated] [int] NOT NULL,
    [UpdatedBy] [int] NOT NULL,
    [CustomerSessionID] [int] NOT NULL,
    CONSTRAINT [PK_SecurityLog] PRIMARY KEY CLUSTERED 
    (
        [logid] ASC
    )
)


GO


CREATE TABLE [dbo].[GlobalConfig](
	[GlobalConfigID] [int] IDENTITY(1,1) NOT NULL,
	[GlobalConfigGUID] [uniqueidentifier] NOT NULL CONSTRAINT [DF_GlobalConfig_GlobalConfigGUID]  DEFAULT (newid()),
	[Name] [nvarchar](100) NOT NULL CONSTRAINT [UQ_GlobalConfig_Name] UNIQUE,
	[Description] [ntext]  NULL,
	[ConfigValue] [nvarchar](max) NULL,
	[ValueType] [varchar](30) NOT NULL,
	[GroupName] [nvarchar](100) NULL,
	[EnumValues] nvarchar(max) NULL,
	[SuperOnly] [tinyint] NOT NULL CONSTRAINT [DF_GlobalConfig_SuperOnly]  DEFAULT ((1)),
	[Hidden] [bit] NOT NULL CONSTRAINT [DF_GlobalConfig_Hidden]  DEFAULT ((0)),
	[IsMultiStore] [bit] NOT NULL CONSTRAINT [DF_GlobalConfig_IsMultiStore]  DEFAULT ((0)),
	[CreatedOn] [datetime] NOT NULL CONSTRAINT [DF_GlobalConfig_CreatedOn]  DEFAULT (getdate()),
 CONSTRAINT [PK_GlobalConfig] PRIMARY KEY CLUSTERED 
(
	[GlobalConfigID] ASC
)
)


GO


CREATE TABLE [dbo].[Staff](
    [StaffID] [int] IDENTITY(1,1) NOT NULL,
    [StaffGUID] [uniqueidentifier] NOT NULL CONSTRAINT DF_Staff_StaffGUID DEFAULT (newid()),
    [Name] [nvarchar](100) NOT NULL,
    [Title] [nvarchar](100) NULL,
    [Bio] [ntext] NULL,
    [Phone] [nvarchar](25) NULL,
    [FAX] [nvarchar](25) NULL,
    [Email] [nvarchar](100) NULL,
    [DisplayOrder] [int] NOT NULL CONSTRAINT DF_Staff_DisplayOrder DEFAULT ((1)),
    [Published] [tinyint] NOT NULL CONSTRAINT DF_Staff_Published DEFAULT ((1)),
    [Wholesale] [tinyint] NOT NULL CONSTRAINT DF_Staff_Wholesale DEFAULT ((0)),
    [ExtensionData] [ntext] NULL,
    [Deleted] [tinyint] NOT NULL CONSTRAINT DF_Staff_Deleted DEFAULT ((0)),
    [CreatedOn] [datetime] NOT NULL CONSTRAINT DF_Staff_CreatedOn DEFAULT (getdate()),
    CONSTRAINT [PK_Staff] PRIMARY KEY CLUSTERED 
    (
        [StaffID] ASC
    )
)


GO


CREATE TABLE [dbo].[PasswordLog]
(
    [CustomerID] [int] NOT NULL,
    [ChangeDt] [datetime] NOT NULL,
    [OldPwd] [nvarchar](250) NOT NULL,
    [SaltKey] [int] NOT NULL CONSTRAINT DF_PasswordLogSaltKey DEFAULT(0),
)



GO


CREATE TABLE [dbo].[RestrictedIP](
    [DBRecNo] [int] IDENTITY(1,1) NOT NULL,
    [IPAddress] [nvarchar] (25) NOT NULL,
    [CreatedOn] [datetime] NOT NULL CONSTRAINT DF_RestrictedIP_CreatedOn DEFAULT (getdate()),
     CONSTRAINT [PK_IPAddress] PRIMARY KEY CLUSTERED 
    (
        [IPAddress] ASC
    )
)

GO


CREATE TABLE [dbo].[SkinPreview](
    [SkinPreviewID] [int] IDENTITY(1,1) NOT NULL,
    [SkinPreviewGUID] [uniqueidentifier] NOT NULL CONSTRAINT DF_SkinPreview_SkinPreviewGUID DEFAULT(newid()),
    [SkinID] [int] NOT NULL CONSTRAINT DF_SkinPreview_SkinID DEFAULT((1)),
    [Name] [nvarchar](100) NOT NULL,
    [GroupName] [nvarchar](100) NULL,
    [CreatedOn] [datetime] NOT NULL CONSTRAINT DF_SkinPreview_CreatedOn DEFAULT(getdate()),
    CONSTRAINT [PK_SkinPreview] PRIMARY KEY CLUSTERED 
    (
        [SkinPreviewID] ASC
    )
)


GO


CREATE TABLE [dbo].[TaxClass](
    [TaxClassID] [int] IDENTITY(1,1) NOT NULL,
    [TaxClassGUID] [uniqueidentifier] NOT NULL CONSTRAINT DF_TaxClass_TaxClassGUID DEFAULT(newid()),
    [Name] [nvarchar](400) NOT NULL,
    [TaxCode] [nvarchar](100) NOT NULL,
    [DisplayOrder] [int] NOT NULL CONSTRAINT DF_TaxClass_DisplayOrder DEFAULT((1)),
    [CreatedOn] [datetime] NOT NULL CONSTRAINT DF_TaxClass_CreatedOn DEFAULT(getdate()),
    CONSTRAINT [PK_TaxClass] PRIMARY KEY CLUSTERED 
    (
        [TaxClassID] ASC
    )
)



GO


CREATE TABLE [dbo].[StateTaxRate](
    [StateTaxID] int NOT NULL IDENTITY,
    [StateID] [int] NOT NULL,
    [TaxClassID] [int] NOT NULL CONSTRAINT DF_StateTaxRate_TaxClassID DEFAULT((1)),
    [TaxRate] [money] NULL,
    [CreatedOn] [datetime] NOT NULL CONSTRAINT DF_StateTaxRate_CreatedOn DEFAULT(getdate()),
    CONSTRAINT [PK_StateTaxRate] PRIMARY KEY CLUSTERED 
    (
        [StateTaxID] ASC
    )
)


GO


CREATE TABLE [dbo].[CountryTaxRate](
    [CountryTaxID] int NOT NULL IDENTITY,
    [CountryID] [int] NOT NULL,
    [TaxClassID] [int] NOT NULL CONSTRAINT DF_CountryTaxRate_TaxClassID DEFAULT((1)),
    [TaxRate] [money] NULL,
    [CreatedOn] [datetime] NOT NULL CONSTRAINT DF_CountryTaxRate_CreatedOn DEFAULT(getdate()),
    CONSTRAINT [PK_CountryTaxRate] PRIMARY KEY CLUSTERED 
    (
        [CountryTaxID] ASC
    )
)

GO


CREATE TABLE [dbo].[ZipTaxRate](
    [ZipTaxID] int NOT NULL IDENTITY,
    [ZipCode] [nvarchar](10) NOT NULL,
    [TaxClassID] [int] NOT NULL CONSTRAINT DF_ZipTaxRate_TaxClassID DEFAULT((1)),
    [TaxRate] [money] NULL,
    [CreatedOn] [datetime] NOT NULL CONSTRAINT DF_ZipTaxRate_CreatedOn DEFAULT(getdate()),
	[CountryID] [int] NOT NULL DEFAULT((-1)),
    CONSTRAINT [PK_ZipTaxRate] PRIMARY KEY CLUSTERED 
    (
        [ZipTaxID] ASC
    )
)

GO


CREATE TABLE [dbo].[CreditCardType](
    [CardTypeID] [int] IDENTITY(1,1) NOT NULL,
    [CardTypeGUID] [uniqueidentifier] NOT NULL CONSTRAINT DF_CreditCardType_CardTypeGUID DEFAULT(newid()),
    [CardType] [nvarchar](20) NOT NULL,
    [Accepted] [tinyint] NOT NULL CONSTRAINT DF_CreditCardType_Accepted DEFAULT((1)),
    [CreatedOn] [datetime] NOT NULL CONSTRAINT DF_CreditCardType_CreatedOn DEFAULT(getdate()),
    CONSTRAINT [PK_CreditCardType] PRIMARY KEY CLUSTERED 
    (
        [CardTypeID] ASC
    )
)


GO


CREATE TABLE [dbo].[FailedTransaction](
    [DBRecNo] [int] IDENTITY(1,1) NOT NULL,
    [CustomerID] [int] NOT NULL,
    [OrderNumber] [int] NOT NULL CONSTRAINT DF_FailedTransaction_OrderNumber DEFAULT((0)),
    [OrderDate] [datetime] NOT NULL CONSTRAINT DF_FailedTransaction_OrderDate DEFAULT(getdate()),
    [PaymentGateway] [nvarchar](50) NULL,
    [PaymentMethod] [nvarchar](50) NULL,
    [TransactionCommand] [ntext] NULL,
    [TransactionResult] [ntext] NULL,
    [ExtensionData] [ntext] NULL,
    [MaxMindDetails] ntext NULL ,
    [IPAddress] [nvarchar] (25) NULL,
    [MaxMindFraudScore] decimal(5,2) NULL CONSTRAINT DF_FailedTransaction_MaxMindScore DEFAULT(-1),
    [RecurringSubscriptionID] [nvarchar](100) NOT NULL CONSTRAINT DF_FailedTransaction_RecurringSubscriptionID DEFAULT('') ,
    [CustomerEMailed] [tinyint] NOT NULL CONSTRAINT DF_FailedTransaction_CustomerEMailed DEFAULT(0) ,
    CONSTRAINT [PK_FailedTransactions] PRIMARY KEY CLUSTERED 
    (
        [DBRecNo] ASC
    )
)


GO


CREATE TABLE [dbo].[PageType](
	[PageTypeID] [int] IDENTITY(1,1) NOT NULL,
	[PageTypeGUID] [uniqueidentifier] NOT NULL,
	[PageTypeName] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_PageType_PageTypeID] PRIMARY KEY CLUSTERED 
	(
		[PageTypeID] ASC
	)
)
GO

CREATE TABLE [dbo].[LayoutMap](
	[LayoutMapID] [int] IDENTITY(1,1) NOT NULL,
	[LayoutMapGUID] [uniqueidentifier] NOT NULL,
	[LayoutID] [int] NOT NULL,
	[PageTypeID] [int] NOT NULL,
	[PageID] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_LayoutMap_LayoutMapID] PRIMARY KEY CLUSTERED 
(
	[LayoutMapID] ASC
)
)
GO

CREATE TABLE [dbo].[LayoutFieldAttribute](
	[LayoutFieldAttributeID] [int] IDENTITY(1,1) NOT NULL,
	[LayoutFieldAttributeGUID] [uniqueidentifier] NOT NULL,
	[LayoutID] [int] NOT NULL,
	[LayoutFieldID] [int] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Value] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_LayoutFieldAttribute_LayoutFieldAttributeID] PRIMARY KEY CLUSTERED 
(
	[LayoutFieldAttributeID] ASC
)
)
GO

CREATE TABLE [dbo].[LayoutField](
	[LayoutFieldID] [int] IDENTITY(1,1) NOT NULL,
	[LayoutFieldGUID] [uniqueidentifier] NOT NULL,
	[LayoutID] [int] NULL,
	[FieldType] [int] NULL,
	[FieldID] [nvarchar](100) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_LayoutField_LayoutFieldID] PRIMARY KEY CLUSTERED 
(
	[LayoutFieldID] ASC
)
)
GO

CREATE TABLE [dbo].[Layout](
	[LayoutID] [int] IDENTITY(1,1) NOT NULL,
	[LayoutGUID] [uniqueidentifier] NOT NULL,
	[Name] [varchar](100) NULL,
	[Description] [varchar](max) NULL,
	[HTML] [varchar](max) NULL,
	[Micro] [nvarchar](100) NULL,
	[Icon] [nvarchar](100) NULL,
	[Medium] [nvarchar](100) NULL,
	[Large] [nvarchar](100) NULL,
	[Version] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
	[DisplayOrder] [int] NOT NULL,
 CONSTRAINT [PK_Layout_LayoutID] PRIMARY KEY CLUSTERED 
(
	[LayoutID] ASC
)
)

GO

CREATE TABLE [dbo].[TopicMapping](
	[TopicID] [int] NOT NULL,
	[ParentTopicID] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL CONSTRAINT [DF_TopicMapping_CreatedOn] DEFAULT (getdate())
)

GO


CREATE proc [dbo].[aspdnsf_updLayoutFieldAttribute]
    @LayoutID int,
    @LayoutFieldID int,
    @Name nvarchar(100),
    @Value nvarchar(max)
  
AS
SET NOCOUNT ON 

if not exists(select * from dbo.LayoutFieldAttribute where LayoutFieldID=@LayoutFieldID and Name=@Name)
begin
	INSERT dbo.LayoutFieldAttribute(LayoutFieldAttributeGUID, LayoutID, LayoutFieldID, Name, Value)
	VALUES (NEWID(), @LayoutID, @LayoutFieldID, @Name, @Value)
end
else
begin
    UPDATE dbo.LayoutFieldAttribute
    SET 
        Value = COALESCE(@Value, Value)
		WHERE LayoutFieldID=@LayoutFieldID and Name=@Name
end
GO

CREATE proc [dbo].[aspdnsf_updLayout]
    @LayoutID int,
    @Description nvarchar(max) = null,
    @HTML nvarchar(max) = null,
    @Version int = 1,
    @Micro nvarchar(100) = null,
    @Icon nvarchar(100) = null,
    @Medium nvarchar(100) = null,
    @Large nvarchar(100) = null,
    @UpdatedOn datetime
  
AS
SET NOCOUNT ON 

    UPDATE dbo.Layout
    SET 
        Description = COALESCE(@Description, Description),
        HTML = COALESCE(@HTML, HTML),
        Version =  COALESCE(@Version, Version),
        Micro = COALESCE(@Micro, Micro),
        Icon = COALESCE(@Icon, Icon),
        Medium = COALESCE(@Medium, Medium),
        Large = COALESCE(@Large, Large),
		@UpdatedOn =  COALESCE(@UpdatedOn, getdate())
    WHERE LayoutID = @LayoutID
GO

CREATE proc [dbo].[aspdnsf_insLayoutFieldAttribute]
	@LayoutID int,
	@LayoutFieldID int,
    @Name nvarchar(100),
    @Value nvarchar(250)
  
AS
SET NOCOUNT ON 

if not exists(select * from dbo.LayoutFieldAttribute where LayoutFieldID=@LayoutFieldID and Name=@Name)
begin
INSERT dbo.LayoutFieldAttribute (LayoutID, LayoutFieldID, Name, Value)
VALUES (@LayoutID, @LayoutFieldID, @Name, @Value)
end
else
begin
	UPDATE dbo.LayoutFieldAttribute SET Value=@Value WHERE LayoutFieldID=@LayoutFieldID and Name=@Name
end
GO

CREATE proc [dbo].[aspdnsf_insLayoutField]
	@LayoutID int,
    @FieldType int,
    @FieldID nvarchar(100),
    @LayoutFieldID int OUTPUT
  
AS
SET NOCOUNT ON 

if not exists(select * from dbo.LayoutField where LayoutID=@LayoutID and FieldID=@FieldID)
begin
    INSERT dbo.LayoutField(LayoutID, FieldType, FieldID)
    VALUES (@LayoutID, @FieldType, @FieldID)
    
    set @LayoutFieldID = @@identity
end

GO

create proc [dbo].[aspdnsf_insLayoutMap]
	@layoutid int,				-- the id of the layout
	@pageid int,				-- the entity or object id if the page is a topic, entity, or product
	@pagetypename nvarchar(100)	-- the page name if the page is not a topic, entity, or product
  
AS
BEGIN
    SET NOCOUNT ON
    
    declare @pagetypeid int	-- the pagetypeid from dbo.PageType
	select @pagetypeid = PageTypeID from dbo.PageType where PageTypeName=@pagetypename
	
	IF(@pagetypeid > 0) -- the page type already exists, insert the mapping
		INSERT dbo.LayoutMap (LayoutMapGUID, LayoutID, PageTypeID, PageID, CreatedOn)
		values (
			NEWID(),
			@layoutid,
			@pagetypeid,
			@pageid,
			GETDATE())
	ELSE BEGIN -- the page type does not exist so add the page type then insert the mapping
		INSERT dbo.PageType (PageTypeGUID, PageTypeName)
		values (
			NEWID(),
			@pagetypename )
			
		select @pagetypeid = PageTypeID from dbo.PageType where PageTypeName=@pagetypename
		
		INSERT dbo.LayoutMap (LayoutMapGUID, LayoutID, PageTypeID, PageID, CreatedOn)
		values (
			NEWID(),
			@layoutid,
			@pagetypeid,
			@pageid,
			GETDATE())
	END	
    
END
GO


CREATE proc [dbo].[aspdnsf_insLayout]
	@LayoutGUID uniqueidentifier,
    @Name nvarchar(100),
    @Description nvarchar(max),
    @HTML nvarchar(max),
    @Micro nvarchar(100),
    @Icon nvarchar(100),
    @Medium nvarchar(100),
    @Large nvarchar(100),
    @Version int,
    @CreatedOn datetime,
    @UpdatedOn datetime,
    @LayoutID int OUTPUT
  
AS
SET NOCOUNT ON 


    INSERT dbo.Layout(LayoutGUID, Name, Description, HTML, Micro, Icon, Medium, Large, Version, CreatedOn, UpdatedOn)
    VALUES (@LayoutGUID, @Name, @Description, @HTML, @Micro, @Icon, @Medium, @Large, @Version, @CreatedOn, @UpdatedOn)

    set @LayoutID = @@identity
GO
ALTER TABLE [dbo].[Layout] ADD  CONSTRAINT [DF_Layouts_LayoutGUID]  DEFAULT (newid()) FOR [LayoutGUID]
GO
ALTER TABLE [dbo].[Layout] ADD  CONSTRAINT [DF_Layouts_LayoutVersion]  DEFAULT ((1)) FOR [Version]
GO
ALTER TABLE [dbo].[Layout] ADD  CONSTRAINT [DF_Layouts_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[Layout] ADD  CONSTRAINT [DF_Layouts_UpdatedOn]  DEFAULT (getdate()) FOR [UpdatedOn]
GO
ALTER TABLE [dbo].[Layout] ADD  CONSTRAINT [DF_Layouts_DisplayOrder]  DEFAULT ((1)) FOR [DisplayOrder]
GO
ALTER TABLE [dbo].[LayoutField] ADD  CONSTRAINT [DF_LayoutField_LayoutFieldGUID]  DEFAULT (newid()) FOR [LayoutFieldGUID]
GO
ALTER TABLE [dbo].[LayoutField] ADD  CONSTRAINT [DF_LayoutField_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[LayoutFieldAttribute] ADD  CONSTRAINT [DF_LayoutFieldAttribute_LayoutFieldAttributeGUID]  DEFAULT (newid()) FOR [LayoutFieldAttributeGUID]
GO
ALTER TABLE [dbo].[LayoutMap] ADD  CONSTRAINT [DF_LayoutMap_LayoutMapGUID]  DEFAULT (newid()) FOR [LayoutMapGUID]
GO
ALTER TABLE [dbo].[LayoutMap] ADD  CONSTRAINT [DF_LayoutMap_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[PageType] ADD  CONSTRAINT [DF_PageType_PageTypeGUID]  DEFAULT (newid()) FOR [PageTypeGUID]
GO



CREATE PROC dbo.aspdnsf_insAffiliate
    @EMail nvarchar(100),
    @Password nvarchar(250),
    @DateOfBirth datetime,
    @Gender nvarchar(1),
    @Notes text,
    @IsOnline tinyint,
    @FirstName nvarchar(100),
    @LastName nvarchar(100),
    @Name nvarchar(100),
    @Company nvarchar(100),
    @Address1 nvarchar(100),
    @Address2 nvarchar(100),
    @Suite nvarchar(50),
    @City nvarchar(100),
    @State nvarchar(100),
    @Zip nvarchar(10),
    @Country nvarchar(100),
    @Phone nvarchar(25),
    @WebSiteName nvarchar(100),
    @WebSiteDescription ntext,
    @URL ntext,
    @TrackingOnly tinyint,
    @DefaultSkinID int,
    @ParentAffiliateID int,
    @DisplayOrder int,
    @ExtensionData ntext,
    @SEName nvarchar(100),
    @SETitle ntext,
    @SENoScript ntext,
    @SEAltText ntext,
    @SEKeywords ntext,
    @SEDescription ntext,
    @Wholesale tinyint,
    @SaltKey int,
    @StoreID int,
    @AffiliateID int OUTPUT
  
AS
SET NOCOUNT ON 


insert dbo.Affiliate(AffiliateGUID, EMail, Password, DateOfBirth, Gender, Notes, IsOnline, FirstName, LastName, [Name], Company, Address1, Address2, Suite, City, State, Zip, Country, Phone, WebSiteName, WebSiteDescription, URL, TrackingOnly, DefaultSkinID, ParentAffiliateID, DisplayOrder, ExtensionData, SEName, SETitle, SENoScript, SEAltText, SEKeywords, SEDescription, Published, Wholesale, CreatedOn, SaltKey)
values (newid(), @EMail, @Password, @DateOfBirth, @Gender, @Notes, @IsOnline, @FirstName, @LastName, @Name, @Company, @Address1, @Address2, @Suite, @City, @State, @Zip, @Country, @Phone, @WebSiteName, @WebSiteDescription, @URL, @TrackingOnly, @DefaultSkinID, @ParentAffiliateID, @DisplayOrder, @ExtensionData, @SEName, @SETitle, @SENoScript, @SEAltText, @SEKeywords, @SEDescription, 1, @Wholesale, getdate(), @SaltKey)

set @AffiliateID = @@identity

insert into AffiliateStore (AffiliateID, StoreID, CreatedOn) values (@AffiliateID, @StoreID, GETDATE())



GO



CREATE PROC dbo.aspdnsf_getAffiliate
    @AffiliateID int = null
  
AS
SET NOCOUNT ON 


SELECT a.AffiliateID, AffiliateGUID, EMail, Password, DateOfBirth, Gender, Notes, IsOnline, FirstName, LastName, Name, Company, Address1, Address2, Suite, City, State, Zip, Country, Phone, WebSiteName, 
WebSiteDescription, URL, TrackingOnly, DefaultSkinID, ParentAffiliateID, DisplayOrder, ExtensionData, SEName, SETitle, SENoScript, SEAltText, SEKeywords, SEDescription, Published, Wholesale, Deleted, a.CreatedOn, SaltKey, StoreID
FROM dbo.Affiliate a with (nolock) left join AffiliateStore b with (nolock) on a.AffiliateID = b.AffiliateID
WHERE a.AffiliateID = COALESCE(@AffiliateID, a.AffiliateID)

GO 


GO


create proc dbo.aspdnsf_updAffiliate
    @AffiliateID int,
    @EMail nvarchar(100) = null,
    @Password nvarchar(250) = null,
    @DateOfBirth datetime = null,
    @Gender nvarchar(1) = null,
    @Notes text = null,
    @IsOnline tinyint = null,
    @FirstName nvarchar(100) = null,
    @LastName nvarchar(100) = null,
    @Name nvarchar(100) = null,
    @Company nvarchar(100) = null,
    @Address1 nvarchar(100) = null,
    @Address2 nvarchar(100) = null,
    @Suite nvarchar(50) = null,
    @City nvarchar(100) = null,
    @State nvarchar(100) = null,
    @Zip nvarchar(10) = null,
    @Country nvarchar(100) = null,
    @Phone nvarchar(25) = null,
    @WebSiteName nvarchar(100) = null,
    @WebSiteDescription ntext = null,
    @URL ntext = null,
    @TrackingOnly tinyint = null,
    @DefaultSkinID int = null,
    @ParentAffiliateID int = null,
    @DisplayOrder int = null,
    @ExtensionData ntext = null,
    @SEName nvarchar(100) = null,
    @SETitle ntext = null,
    @SENoScript ntext = null,
    @SEAltText ntext = null,
    @SEKeywords ntext = null,
    @SEDescription ntext = null,
    @Published tinyint = null,
    @Wholesale tinyint = null,
    @Deleted tinyint = null,
    @SaltKey int = null
  
AS
SET NOCOUNT ON 

UPDATE dbo.Affiliate
SET 
    EMail = COALESCE(@EMail, EMail),
    Password = COALESCE(@Password, Password),
    DateOfBirth = COALESCE(@DateOfBirth, DateOfBirth),
    Gender = COALESCE(@Gender, Gender),
    Notes = COALESCE(@Notes, Notes),
    IsOnline = COALESCE(@IsOnline, IsOnline),
    FirstName = COALESCE(@FirstName, FirstName),
    LastName = COALESCE(@LastName, LastName),
    Name = COALESCE(@Name, Name),
    Company = COALESCE(@Company, Company),
    Address1 = COALESCE(@Address1, Address1),
    Address2 = COALESCE(@Address2, Address2),
    Suite = COALESCE(@Suite, Suite),
    City = COALESCE(@City, City),
    State = COALESCE(@State, State),
    Zip = COALESCE(@Zip, Zip),
    Country = COALESCE(@Country, Country),
    Phone = COALESCE(@Phone, Phone),
    WebSiteName = COALESCE(@WebSiteName, WebSiteName),
    WebSiteDescription = COALESCE(@WebSiteDescription, WebSiteDescription),
    URL = COALESCE(@URL, URL),
    TrackingOnly = COALESCE(@TrackingOnly, TrackingOnly),
    DefaultSkinID = COALESCE(@DefaultSkinID, DefaultSkinID),
    ParentAffiliateID = COALESCE(@ParentAffiliateID, ParentAffiliateID),
    DisplayOrder = COALESCE(@DisplayOrder, DisplayOrder),
    ExtensionData = COALESCE(@ExtensionData, ExtensionData),
    SEName = COALESCE(@SEName, SEName),
    SETitle = COALESCE(@SETitle, SETitle),
    SENoScript = COALESCE(@SENoScript, SENoScript),
    SEAltText = COALESCE(@SEAltText, SEAltText),
    SEKeywords = COALESCE(@SEKeywords, SEKeywords),
    SEDescription = COALESCE(@SEDescription, SEDescription),
    Published = COALESCE(@Published, Published),
    Wholesale = COALESCE(@Wholesale, Wholesale),
    Deleted = COALESCE(@Deleted, Deleted),
    SaltKey = COALESCE(@SaltKey, SaltKey)
WHERE AffiliateID = @AffiliateID



GO



CREATE PROC dbo.aspdnsf_getAffiliateByEmail
    @AffiliateEmail nvarchar(100)
  
AS
SET NOCOUNT ON 


SELECT a.AffiliateID, AffiliateGUID, EMail, Password, DateOfBirth, Gender, Notes, IsOnline, FirstName, LastName, Name, Company, Address1, Address2, Suite, City, State, Zip, Country, Phone, WebSiteName, WebSiteDescription, URL, TrackingOnly, 
DefaultSkinID, ParentAffiliateID, DisplayOrder, ExtensionData, SEName, SETitle, SENoScript, SEAltText, SEKeywords, SEDescription, Published, Wholesale, Deleted, a.CreatedOn, SaltKey, StoreID
FROM dbo.Affiliate a with (nolock) left join AffiliateStore b with (nolock) on a.AffiliateID = b.AffiliateID
WHERE EMail = @AffiliateEmail



GO


set IDENTITY_INSERT [dbo].AffiliateActivityReason ON;
INSERT [dbo].AffiliateActivityReason(AffiliateActivityReasonID,Name) values(1,'Customer Order');
INSERT [dbo].AffiliateActivityReason(AffiliateActivityReasonID,Name) values(2,'Payout');
INSERT [dbo].AffiliateActivityReason(AffiliateActivityReasonID,Name) values(3,'Redemption For Merchandise');
INSERT [dbo].AffiliateActivityReason(AffiliateActivityReasonID,Name) values(4,'Manual Credit');
INSERT [dbo].AffiliateActivityReason(AffiliateActivityReasonID,Name) values(5,'Manual Debit');
set IDENTITY_INSERT [dbo].AffiliateActivityReason OFF;


GO


create proc [dbo].[aspdnsf_CreateFeed]
    @Name nvarchar(100),
    @DisplayOrder int,
    @XmlPackage nvarchar(100),
    @CanAutoFTP tinyint,
    @FTPUsername nvarchar(100),
    @FTPPassword nvarchar(100),
    @FTPServer nvarchar(100),
    @FTPPort int,
    @FTPFilename nvarchar(100),
    @ExtensionData ntext,
    @FeedID int OUTPUT
  
AS
BEGIN
SET NOCOUNT ON 

IF isnull(@XmlPackage, '') = '' BEGIN
    RAISERROR('XmlPAckage is required', 16, 1)
    RETURN
END

IF @CanAutoFTP > 1  
    SET @CanAutoFTP = 1


    
INSERT dbo.Feed(FeedGUID, Name, DisplayOrder, XmlPackage, CanAutoFTP, FTPUsername, FTPPassword, FTPServer, FTPPort, FTPFilename, ExtensionData, CreatedOn)
VALUES (newid(), @Name, isnull(@DisplayOrder,1), @XmlPackage, isnull(@CanAutoFTP,0), @FTPUsername, @FTPPassword, @FTPServer, @FTPPort, @FTPFilename, @ExtensionData, getdate())
set @FeedID = @@identity
END

GO


create proc [dbo].[aspdnsf_DelFeed]
    @FeedID int
  
AS
BEGIN
SET NOCOUNT ON 

    DELETE dbo.Feed WHERE FeedID = @FeedID

END


GO


CREATE PROC [dbo].[aspdnsf_GetFeed]
    @FeedID int = null
  
AS
BEGIN
SET NOCOUNT ON 

SELECT FeedID, FeedGUID, a.StoreID, b.Name as StoreName, a.Name, DisplayOrder, XmlPackage, CanAutoFTP, FTPUsername, FTPPassword, FTPServer, FTPPort, FTPFilename, isnull(ExtensionData, '') ExtensionData, a.CreatedOn
FROM dbo.Feed a with (nolock) left join Store b with (nolock) on a.StoreID = b.StoreID
WHERE FeedID = COALESCE(@FeedID, FeedID) order by a.StoreID ASC

END


GO

create proc [dbo].[aspdnsf_UpdFeed]
    @FeedID int,
    @Name nvarchar(100),
    @DisplayOrder int,
    @XmlPackage nvarchar(100),
    @CanAutoFTP tinyint,
    @FTPUsername nvarchar(100),
    @FTPPassword nvarchar(100),
    @FTPServer nvarchar(100),
    @FTPPort int,
    @FTPFilename nvarchar(100),
    @ExtensionData ntext
  
AS
SET NOCOUNT ON 


IF isnull(@XmlPackage, '') = '' BEGIN
    RAISERROR('XmlPAckage is required', 16, 1)
    RETURN
END
    
IF @CanAutoFTP > 1  
    SET @CanAutoFTP = 1

UPDATE dbo.Feed
SET 
    Name = COALESCE(@Name, Name),
    DisplayOrder = COALESCE(@DisplayOrder, DisplayOrder),
    XmlPackage = COALESCE(@XmlPackage, XmlPackage),
    CanAutoFTP = COALESCE(@CanAutoFTP, CanAutoFTP),
    FTPUsername = COALESCE(@FTPUsername, FTPUsername),
    FTPPassword = COALESCE(@FTPPassword, FTPPassword),
    FTPServer = COALESCE(@FTPServer, FTPServer),
    FTPPort = COALESCE(@FTPPort, FTPPort),
    FTPFilename = COALESCE(@FTPFilename, FTPFilename),
    ExtensionData = COALESCE(@ExtensionData, ExtensionData)
WHERE FeedID = @FeedID





GO



CREATE PROCEDURE [dbo].[aspdnsf_GetNews] (
	@NumHomeNewsToDisplay	INT,
	@storeid				INT,
	@filternews				BIT
)
  
AS
BEGIN
	SET NOCOUNT ON

	select TOP(@NumHomeNewsToDisplay) a.* 
	from News a with (NOLOCK) inner join (select distinct a.NewsID from News a with (nolock) left join NewsStore b with (NOLOCK) on a.NewsID = b.NewsID where (@filternews = 0 or StoreID = @storeid)) b on a.NewsID = b.NewsID 
	where ExpiresOn > getdate() and Deleted = 0 and Published = 1 
	order by a.NewsId desc 
END


GO


INSERT [dbo].Topic(Name,HTMLOk,ShowInSiteMap,Title,Description) values('affiliate'                  ,1,0,'Text for your affiliate home page'                                            ,'Welcome to our affiliate program...you should put program info here, along with links to <a href="lat_signup.aspx">sign up</a> and <a href="lat_signin.aspx">sign in</a> and <a href="lat_signout.aspx">sign out</a>. This is the topic Named: affiliate. You edit this in the ADMIN site.');
INSERT [dbo].Topic(Name,HTMLOk,ShowInSiteMap,Title,Description) values('affiliate_faq'              ,1,0,'Your Affiliate FAQs'                                                      ,'Affiliate FAQs here... This is the topic Named: affiliate_faq. You edit this in the ADMIN site.');
INSERT [dbo].Topic(Name,HTMLOk,ShowInSiteMap,Title,Description) values('affiliate_terms'            ,1,0,'Your affiliate sign-up terms and conditions'                              ,'Affiliate Terms and Conditions... This is the topic Named: affiliate_terms. You edit this in the ADMIN site.');
INSERT [dbo].Topic(Name,HTMLOk,ShowInSiteMap,Title,Description) values('affiliate_teaser'           ,1,0,'Your affiliate sign-up teaser'                                                ,'Our affiliate program is a great way to blah blah blah... This is the topic Named: affiliate_teaser. You edit this in the ADMIN site.');
INSERT [dbo].Topic(Name,HTMLOk,ShowInSiteMap,Title,Description) values('hometopintro'               ,1,0,'Home Page Contents'                                                           ,'<div align="center"><table cellSpacing="0" cellPadding="0" width="680" border="0"><tr><td vAlign="top" align="middle"></a><table cellSpacing="5" cellPadding="0" width="100%" border="0"><tr><td vAlign="top"><a href="p-124-wolverine-esp-100gb-multi-media-storage-device-player.aspx"><img height="200" src="App_Themes/skin_(!SKINID!)/images/hometopintro_03.jpg" width="225" border="0"></a></td><td vAlign=top><a href="p-48-hp-pavilion-slimline-s3600t-pc.aspx"><img height="200" src="App_Themes/skin_(!SKINID!)/images/hometopintro_05.jpg" width="225" border="0"></a></td><td vAlign=top><a href="p-126-wolverine-120gb-flashpac-7in1-card-reader.aspx"><img height="200" src="App_Themes/skin_(!SKINID!)/images/hometopintro_07.jpg" width="225" border="0"></a></td></tr></tbody></table></td></tr><tr><td vAlign="top" align="middle"><br><div style="PADDING-LEFT: 10px" align="justify"><strong>Welcome to {Your Store Name}&nbsp;</strong><p>This page just shows you a possible home page design that you may want on your storefront. Each storefront typically has a custom home page layout, which brings out the most important news,  specials, company information and other materials that you want your site visitors to see right as they enter.   We have setup this content in the Topic called "hometopintro" in the database. You can fully edit this HTML in   the admin site in Misc -&gt; Topics, and then using the built-in HTML editor we provide. This is just one   of hundreds of possible suggestions on the home page content. See many of our live client sites in our gallery    for other suggestions and ideas on how they have designed their home page content.</p></div></td></tr><tr><td     vAlign="top" align="middle"><table cellSpacing="10" cellPadding="0" width="100%" border="0"><tr><td vAlign="top"      align="left" width="226"><a href="p-49-dell-xps-630.aspx"><img height="100" src="App_Themes/skin_(!SKINID!)/images/hometopintro_12.jpg" width="680" border="0"></a></td></tr><tr><td vAlign=top align=left><a href="p-118-sony-blu-ray-disc-player.aspx"><img height="130" src="App_Themes/skin_(!SKINID!)/images/hometopintro_14.jpg" width="680" border="0"></a></td></tr></tbody></table></td></tr></table><br><small>This is just a sample home page. You can edit this content in the "hometopintro" Topic in your store Admin site.</small><br></div>');
INSERT [dbo].Topic(Name,HTMLOk,ShowInSiteMap,Title,Description) values('mobilehometopintro'         ,1,0,'Mobile Home Page Contents'                                                    ,'<table cellspacing="0px" cellpadding="0px" class="tblcontenttop"><tbody><tr style="background-color: #27a1da;"><td class="tdcontenttopleft"></td><td class="tdcontenttopcenter"><div style="padding-top: 8px; padding-right: 5px;">Featured Products</div></td></tr><tr><td colspan="2"><table cellspacing="0px" cellpadding="0px" width="100%" style="padding-top: 5px; padding-bottom: 15px;"><tbody><tr><td align="center" style="width: 33.3%;"><a href="#"><img alt="" src="images/p1.png" /></a></td><td align="center" style="width: 33.3%;"><a href="#"><img alt="" src="images/p2.png" /></a></td><td align="center" style="width: 33.3%;"><a href="#"><img alt="" src="images/p3.png" /></a></td></tr></tbody></table></td></tr></tbody></table><br /><table cellspacing="0px" cellpadding="0px" class="tblcontentbottom"><tbody><tr style="background-color: #27a1da;"><td class="tdcontentbottomcenter"><div style="padding-top: 8px; padding-left: 5px;">{Your Store Name}</div></td><td class="tdcontentbottomright"></td></tr><tr><td colspan="2"><table cellspacing="0px" cellpadding="0px" width="100%" style="padding-bottom: 15px;"><tbody><tr><td colspan="3"><div style="text-align: center;"><table cellspacing="0" cellpadding="0" border="0" width="100%"><tbody><tr><td align="middle" valign="top"><br /><div style="padding-left: 5px; padding-right: 5px; text-align: justify;"><p>This page just shows you a possible home page design that you may want on your storefront. Each storefront typically has a custom home page layout, which brings out the most important news,  specials, company information and other materials that you want your site visitors to see right as they enter.   We have setup this content in the Topic called "mobilehometopintro" in the database. You can fully edit this HTML in   the admin site in Misc -&gt; Topics, and then using the built-in HTML editor we provide. This is just one   of hundreds of possible suggestions on the home page content. See many of our live client sites in our gallery    for other suggestions and ideas on how they have designed their home page content.</p></div></td></tr></tbody></table><br /><small>This is just a sample home page. You can edit this content in the "mobilehometopintro" Topic in your store Admin site.</small><br /></div></td></tr></tbody></table></td></tr></tbody></table>');
INSERT [dbo].Topic(Name,HTMLOk,ShowInSiteMap,Title,Description) values('copyright'                  ,1,1,'Copyright Notice'                                                         ,'your copyright info here. This is the topic Named: copyright. You edit this in the ADMIN site.');
INSERT [dbo].Topic(Name,HTMLOk,ShowInSiteMap,Title,Description) values('about'                      ,1,1,'About Us'                                                                 ,'your about info here. This is the topic Named: about. You edit this in the ADMIN site.');
INSERT [dbo].Topic(Name,HTMLOk,ShowInSiteMap,Title,Description) values('faq'                        ,1,1,'Frequently Asked Questions'                                                   ,'your faqs here. This is the topic Named: faq. You edit this in the ADMIN site.');
INSERT [dbo].Topic(Name,HTMLOk,ShowInSiteMap,Title,Description) values('security'                   ,1,1,'Security Policy'                                                          ,'your security policy here. This is the topic Named: security. You edit this in the ADMIN site.');
INSERT [dbo].Topic(Name,HTMLOk,ShowInSiteMap,Title,Description) values('returns'                    ,1,1,'Return Policy'                                                                ,'your return policy here. This is the topic Named: returns. You edit this in the ADMIN site.');
INSERT [dbo].Topic(Name,HTMLOk,ShowInSiteMap,Title,Description) values('ReceiptHeader'              ,1,0,'Extra Info At Top of Receipt, If Desired'                                 ,'');
INSERT [dbo].Topic(Name,HTMLOk,ShowInSiteMap,Title,Description) values('ReceiptFooter'              ,1,0,'Extra Info At Bottom of Receipt, If Desired'                              ,'');
INSERT [dbo].Topic(Name,HTMLOk,ShowInSiteMap,Title,Description) values('service'                    ,1,1,'Customer Service'                                                         ,'your customer service here. This is the topic Named: service. You edit this in the ADMIN site.');
INSERT [dbo].Topic(Name,HTMLOk,ShowInSiteMap,Title,Description) values('shipping'                   ,1,1,'Shipping Information'                                                     ,'your shipping info here. This is the topic Named: shipping. You edit this in the ADMIN site.');
INSERT [dbo].Topic(Name,HTMLOk,ShowInSiteMap,Title,Description) values('ordernotfound'              ,1,0,'Order Not Found'                                                          ,'<img src="images/contact.jpg" align="righ"/t> <p align=center><br/><br/><br/><B><FONT color=red>The specified order is no longer valid or is empty!</FONT></B> <br/><br/><br/>If this is an error, please <a href="t-contact.aspx">contact us</a><B> </p></B>');
INSERT [dbo].Topic(Name,HTMLOk,ShowInSiteMap,Title,Description) values('termsandconditions'         ,1,1,'Terms and Conditions'                                                     ,'your terms here. This is the topic Named: termsandconditions. You edit this in the ADMIN site.');
INSERT [dbo].Topic(Name,HTMLOk,ShowInSiteMap,Title,Description) values('checkouttermsandconditions' ,1,0,'Terms and Conditions'                                                     ,'your checkout terms here. This is the topic Named: checkouttermsandconditions. You edit this in the ADMIN site.');
INSERT [dbo].Topic(Name,HTMLOk,ShowInSiteMap,Title,Description) values('Productnotfound'            ,1,0,'Product Not Found'                                                            ,'That Product could not be found. This is the topic Named: Productnotfound. You edit this in the ADMIN site.');
INSERT [dbo].Topic(Name,HTMLOk,ShowInSiteMap,Title,Description) values('mailfooter'                 ,1,0,'Footer on all e-mails'                                                        ,'<p>----------------------------------------------------------------------------<br/>THIS IS NOT SPAM. You are receiving this e-mail because you are a registered customer and you have indicated that you want to receive e-mail notices and updates from us. If you do not want to receive any further mailings, <a href="%REMOVEURL%">click here to remove yourself</a>, or you can reply to this e-mail wth the subject REMOVE.</p>');
INSERT [dbo].Topic(Name,HTMLOk,ShowInSiteMap,Title,Description) values('checkinstructions'          ,1,0,'Instructions for Mailing Check or Bank Wire'                              ,'Please mail a check (or wire funds) specified as shown below. When your check/bank wire is received and cleared, we will send you an e-mail order confirmation and receipt. This is the topic Named: checkinstructions. You edit this in the ADMIN site.');
INSERT [dbo].Topic(Name,HTMLOk,ShowInSiteMap,Title,Description) values('codinstructions'            ,1,0,'Instructions for Payment By C.O.D.'                                           ,'Please have a check with the specified order total ready when the shipment arives. This is the topic Named: codinstructions. You edit this in the ADMIN site.');
INSERT [dbo].Topic(Name,HTMLOk,ShowInSiteMap,Title,Description) values('helpbox'                    ,1,0,'HelpBox For Left Column'                                                  ,'Place the links you want here in the helpbox topic using the admin site. This is the topic Named: helpbox. You edit this in the ADMIN site.');
INSERT [dbo].Topic(Name,HTMLOk,ShowInSiteMap,Title,Description) values('WorldPayCancel'             ,1,0,'Text for order canceled page'                                             ,'');
INSERT [dbo].Topic(Name,HTMLOk,ShowInSiteMap,Title,Description) values('WorldPaySuccess'            ,1,0,'Text for order success page'                                              ,'');
INSERT [dbo].Topic(Name,HTMLOk,ShowInSiteMap,Title,Description) values('EmptyCategoryText'          ,1,0,'EmptyCategoryText'                                                            ,'<b>This category is currently empty. Please check back soon for new Products... This is the topic Named: emptycategorytext. You edit this in the ADMIN site.</b>');
INSERT [dbo].Topic(Name,HTMLOk,ShowInSiteMap,Title,Description) values('EmptySectionText'           ,1,0,'EmptySectionText'                                                         ,'<b>This department is currently empty. Please check back soon for new Products... This is the topic Named: emptysectiontext. You edit this in the ADMIN site.</b>');
INSERT [dbo].Topic(Name,HTMLOk,ShowInSiteMap,Title,Description) values('EmptyManufacturerText'      ,1,0,'EmtpyManufacturerText'                                                        ,'<b>We currently do not have any products for this manufacturer. Please check back soon for new products... This is the topic Named: emptymanufacturertext. You edit this in the ADMIN site.</b>');
INSERT [dbo].Topic(Name,HTMLOk,ShowInSiteMap,Title,Description) values('EmptyLibraryText'           ,1,0,'EmtpyLibraryText'                                                         ,'<b>This library is currently empty. Please check back soon for new documents... This is the topic named: emptylibrarytext. You edit this in the ADMIN site.</b>');
INSERT [dbo].Topic(Name,HTMLOk,ShowInSiteMap,Title,Description) values('EmptyDistributorText'       ,1,0,'EmtpyDistributorText'                                                     ,'<b>We currently do not have any products for this distributor. Please check back soon for new products... This is the topic Named: emptydistributortext. You edit this in the ADMIN site.</b>');
INSERT [dbo].Topic(Name,HTMLOk,ShowInSiteMap,Title,Description) values('EmptyCartText'              ,1,0,'Text to display if cart is empty'                                         ,'Your shopping cart is currently empty. This is the topic Named: emptycarttext. You edit this in the ADMIN site.');
INSERT [dbo].Topic(Name,HTMLOk,ShowInSiteMap,Title,Description) values('EmptyWishListText'          ,1,0,'Text to display if wish list is empty'                                        ,'Your wish list is currently empty. This is the topic Named: emptywishlisttext. You edit this in the ADMIN site.');
INSERT [dbo].Topic(Name,HTMLOk,ShowInSiteMap,Title,Description) values('EmptyGiftRegistryText'      ,1,0,'Text to display if gift registry is empty'                                    ,'The gift registry is currently empty. This is the topic Named: emptygiftregistrytext. You edit this in the ADMIN site.');
INSERT [dbo].Topic(Name,HTMLOk,ShowInSiteMap,Title,Description) values('DownloadFooter'             ,1,0,'Text for bottom of download e-mail'                                           ,'');
INSERT [dbo].Topic(Name,HTMLOk,ShowInSiteMap,Title,Description) values('CartPageFooter'             ,1,0,'Text for bottom of download cart page, if any'                                ,'');
INSERT [dbo].Topic(Name,HTMLOk,ShowInSiteMap,Title,Description) values('SecureAttachment.EMailBody' ,1,0,'SecureAttachment.EMailBody'                                                   ,'Thank you for your purchase...please specify more information here so the customer will know what to do with the secure attachment download e-mail...');
INSERT [dbo].Topic(Name,HTMLOk,ShowInSiteMap,Title,Description) values('CardinalExplanation'        ,1,0,'CardinalExplanation'                                                      ,'<b>Verified By Visa<br/>MasterCard Secure<br/>Validation Step</b><br/><br/>You will now be shown a form from your credit card issuing bank. This form is entirely private between you and your bank, and the form is secure. The information you enter here is <b>not</b> shared with us. This is to provide additional buyer protection on your credit card. Do not close this window or hit the Back button.</b><br/><br/>Payment authentication is in progress. Please wait until the authentication screen has loaded, then enter your information and click submit.<br/><br/>If you wish to cancel your checkout, please <a href="shoppingcart.aspx">click here</a>.');
INSERT [dbo].Topic(Name,HTMLOk,ShowInSiteMap,Title,Description) values('CheckOutCardAuth'           ,1,0,'CheckOutCardAuth'                                                         ,'<script LANGUAGE="JavaScript">function popUp(url) {   popupWin=window.open(url,"win",''toolbar=0,location=0,directories=0,status=1,menubar=1,scrollbars=1,width=570,height=400'');    self.Name = "mainWin"; }</script><table>  <tr>    <td><font face="verdana,arial,helvetica" color="#bb0000" size="2">Your card may be eligible or enrolled in Verified by Visa or MasterCard&tm; SecureCode&tm; payer authentication programs. After clicking the ''Submit Order'' button, your Card Issuer may prompt you for your payer authentication password to complete your purchase.</font></td>    <td vAlign="center"><a href="javascript:popUp("http://www.mastercardbusiness.com/mcbiz/index.jsp?template=/orphans&content=securecodepopup")"><img src="images/securecode_logo_learn_more.gif" border="0" width="120" height="65"/></a></td>    <td vAlign="center"><a href="javascript:popUp("vbv_learn_more.htm")"><img src="images/vbv_logo_learn_more.gif" border="0" width="100" height="88"/></a></td></table>');
INSERT [dbo].topic(Name,HTMLOk,ShowInSiteMap,Title,Description) values('CustomerServiceTreeMenu'    ,1,0,'CustomerServiceTreeMenu'                                                  ,'Account Info|account.aspx<br/>Order Status|orderhistory.aspx<br/>My Wish List|wishlist.aspx<br/>FAQs|t-faq.aspx<br/>Return Policy|t-returns.aspx<br/>Shipping Info|t-shipping.aspx<br/>Privacy Policy|t-privacy.aspx<br/>Security Policy|t-security.aspx');
INSERT [dbo].topic(Name,HTMLOk,ShowInSiteMap,Title,Description) values('GoogleTrackingCode'         ,0,0,'GoogleTrackingCode'                                                           ,'<!-- Google Conversion Code --><script language="JavaScript"> google_conversion_id = YOURIDHERE; google_conversion_language = "en_US"; google_conversion_format = "2"; google_conversion_color = "666666"; if (Total_Cost) { google_conversion_value = Total_Cost; } google_conversion_label = "Purchase"; </script> <script language="JavaScript" src="https://www.googleadservices.com/pagead/conversion.js"> </script> <noscript> <img height="1" width="1" border="0" src="https://www.googleadservices.com/pagead/conversion/YOURIDHERE/?value=Total_Cost&label=Purchase&script=0"/> </noscript>');
INSERT [dbo].topic(Name,HTMLOk,ShowInSiteMap,Title,Description) values('OvertureTrackingCode'       ,0,0,'OvertureTrackingCode'                                                     ,'<SCRIPT LANGUAGE="JavaScript"> var cc_tagVersion = "1.0"; var cc_accountID = "TBD"; var cc_marketID =  "0"; var cc_protocol="http"; var cc_subdomain = "convctr"; if(location.protocol == "https:") {     cc_protocol="https";      cc_subdomain="convctrs"; } var cc_queryStr = "?" + "ver=" + cc_tagVersion + "&aID=" + cc_accountID + "&mkt=" + cc_marketID +"&ref=" + escape(document.referrer); var cc_imageUrl = cc_protocol + "://" + cc_subdomain + ".overture.com/images/cc/cc.gif" + cc_queryStr; var cc_imageObject = new Image(); cc_imageObject.src = cc_imageUrl; </SCRIPT>');
INSERT [dbo].topic(Name,HTMLOk,ShowInSiteMap,Title,Description) values('CheckoutAnonTeaser'         ,1,0,'CheckoutAnonTeaser'               ,'');
INSERT [dbo].topic(Name,HTMLOk,ShowInSiteMap,Title,Description) values('SiteDisclaimer'             ,1,0,'SiteDisclaimer'                                                               ,'If you need a site disclaimer, which the site visitor must acknoweldge before entering the main site pages, put that topic here...And then set AppConfig:SiteDisclaimerRequired=true');
INSERT [dbo].topic(Name,HTMLOk,ShowInSiteMap,Title,Description) values('GoogleCheckout'             ,1,0,'GoogleCheckout'                                                               ,'<p>In an effort to provide our users the broadest selection of payment options,&nbsp; this store has implemented Google''s new payment service ''Google Checkout''. The Google Checkout service assists customers in two distinct ways.<br><br>On the search side, it shows Google Checkout customers more relevant information in certain Google search results by displaying Google Checkout badging in connection with those merchants who are currently using the Google Checkout process <br><br>Once at the merchant''s web site, Google Checkout (i) provides you with a payment mechanism whereby you don''t need to share your credit card information with the merchant, (ii) moves you through checkout with a single login for use across multiple stores, and (iii) enables you to track your purchase histories in one place at Google.<br><br>Important Google Checkout features are as follows: &nbsp;&nbsp;&nbsp;&nbsp;</p><ul>    <li>Credit/Debit Card Information - Your    credit/debit card information is maintained by Google. Charges to your  credit card are made by Google Payment Corporation, and your credit/debit   card information is not shared with&nbsp; this store or any other merchant that     uses Google Checkout &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>    <li>Maintained Communications - Once you have   completed a purchase using Google Checkout,&nbsp; this store will maintain  communications with you regarding shipping, changes to the order, tracking  and returns. These communications will be made to the email address listed  in your Google Checkout account and are vital in providing you with     important information regarding the fulfillment of your order. &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>  <li>Universal Purchase History - You will have  a universal purchase history for all purchases made using Google Checkout   whether from&nbsp; this store or other merchants using Google Checkout. This    universal purchase history will be maintained by Google in your Google  Checkout account.&nbsp;<br>&nbsp;</li></ul>');
INSERT [dbo].topic(Name,HTMLOk,ShowInSiteMap,Title,Description) values('EMailError'                 ,1,0,'EMailError'                                                                   ,'This page could not be shown, if you are using a personal firewall, it may be interfering with the internal security checks of AspDotNetStorefront, to prevent attacks. This should not occur on the production site, when properly configured and setup.');
INSERT [dbo].topic(Name,HTMLOk,ShowInSiteMap,Title,Description) values('PhoneOrderTimeout'          ,1,0,'PhoneOrderTimeout'                                                            ,'Your phone order session has timed out. Please restart your phone order session by using the buttons above...');
INSERT [dbo].Topic(Name,HTMLOk,ShowInSiteMap,Title,Description) values('3DSecureExplanation'        ,1,0,'3DSecureExplanation'                                                      ,'<b>Verified By Visa<br/>MasterCard Secure<br/>Validation Step</b><br/><br/>You will now be shown a form from your credit card issuing bank. This form is entirely private between you and your bank, and the form is secure. The information you enter here is <b>not</b> shared with us. This is to provide additional buyer protection on your credit card. Do not close this window or hit the Back button.</b><br/><br/>Payment authentication is in progress. Please wait until the authentication screen has loaded, then enter your information and click submit.<br/><br/>If you wish to cancel your checkout, please <a href="shoppingcart.aspx">click here</a>.');
INSERT [dbo].Topic(Name,HTMLOk,ShowInSiteMap,Title,Description) values('EmptyGenreText'             ,1,0,'EmtpyGenreText'                                                       ,'<b>We currently do not have any products for this Genre. Please check back soon for new products... This is the topic Named: emptyGenretext. You edit this in the ADMIN site.</b>');
INSERT [dbo].Topic(Name,HTMLOk,ShowInSiteMap,Title,Description) values('EmptyVectorText'            ,1,0,'EmtpyVectorText'                                                      ,'<b>We currently do not have any products for this Vector. Please check back soon for new products... This is the topic Named: emptyVectortext. You edit this in the ADMIN site.</b>');
INSERT [dbo].Topic(Name,HTMLOk,ShowInSiteMap,Title,Description) values('privacy'                    ,1,1,'Privacy Policy','Your privacy policy goes here. This is the topic Named: privacy. You edit this in the ADMIN site. You should indicate what information you collect from users. By default of course, the storefront WILL collect personally identifable information about users, including names, ip addresses, credit cards, etc...you should consult your own business advisor to create a proper privacy policy page for your own site. With the increased importance in protection of consumer privacy, this page should not be overlooked when setting up your site');
INSERT [dbo].Topic(Name,HTMLOk,ShowInSiteMap,Title,Description) values('BuySafe'                    ,1,0,'BuySafe','<style type=text/css>   <!--    /* Font Definitions */   @font-face     {font-family:Verdana;     panose-1:2 11 6 4 3 5 4 4 2 4;}        /* Style Definitions */    p.MsoNormal, li.MsoNormal, div.MsoNormal     {margin:0in;     margin-bottom:.0001pt;     font-size:10.0pt;     font-family:"Verdana";}   p     {margin-top:1.5pt;     margin-right:0in;     margin-bottom:6.0pt;     margin-left:0in;     font-size:10.0pt;     font-family:"Verdana";}   @page Section1     {size:8.5in 11.0in;     margin:1.0in 1.25in 1.0in 1.25in;}   div.Section1     {page:Section1;}    /* List Definitions */   ol     {margin-bottom:0in;}   ul     {margin-bottom:0in;}   -->   </style>   <div class=Section1> <table width="100%" border=0> <tbody> <tr> <td style="WIDTH: 20%">&nbsp;</td> <td style="WIDTH: 60%"> <p><span style="FONT-SIZE: 18pt"> <center><strong>BuySafe registration:</strong></center></span></td> <td style="WIDTH: 20%"><img alt="" src="images/buysafe_logo.jpg"></td></tr></tbody></table><br> <p></p> <p><b>Introducing buySAFE  the strongest trust signal in e-Commerce!</b> </p> <table> <tbody> <tr> <td>&nbsp; <p><b>Turn More Shoppers Into Buyers With buySAFE</b> </p> <p>Not all shoppers feel safe and confident when buying online and this costs merchants like you money every day. To effectively compete, you need all your shoppers to feel 100% confident when visiting your website. You need buySAFE! </p> <p><b><i>buySAFE provides the only explicit, third-party endorsement of a merchants trustworthiness and reliability  backed by a bond guarantee.</i></b> </p> <p><b><u>With buySAFE, online merchants can expect:</u></b> </p> <ul style="MARGIN-TOP: 0in" type=disc> <li><b>Increased website conversion rates</b>  6.7% average increase <li><b>More repeat buyers</b>  4.3% more likely to buy again and again <li><b>Greater profits</b>  more carts started and fewer carts abandoned add up to more profits for you! </li></ul></td> <td> <table border=1> <tbody> <tr> <td> <p><b>Introductory Offer for AspDotNetStorefront Merchants: Try buySAFE and get TWO months of hosting FREE!</b></p> <p>For a limited time, install buySAFE in your AspDotNet store, and buySAFE will cover your hosting bill for the next TWO months - up to a $250!</p> <p style="TEXT-ALIGN: center" align=center>Visit <a href="http://www.buysafe.com/offerASPDOTNET">www.buySAFE.com/offerASPDOTNET</a> for details.</p></td></tr></tbody></table></td></tr></tbody></table> <p>Best of all, buySAFE is FREE for AspDotNetStorefront merchants  there are no hidden fees, no risk, and no long-term commitments! </p> <p style="TEXT-ALIGN: center" align=center>Learn more at <a href="http://www.buysafe.com/offerASPDOTNET" target=new>www.buySAFE.com/offerASPDOTNET</a> </p> <p><b>How does buySAFE work?</b> </p> <p>Approved buySAFE merchants display the buySAFE Seal on their websitesthe only seal that explicitly certifies that an online merchant is reliable and trustworthy. The buySAFE bond guarantee at checkout, provides shoppers with the option to fully guarantee their online purchase with a buySAFE bond. Together, this powerful combination makes shoppers feel safer and more confident and, therefore, more likely to buy from you. </p> <p><b>Get Started Now!</b> </p> <p><b>Here are the simple steps to enable buySAFE in your online store:</b> </p> <ol style="MARGIN-TOP: 0in" type=1> <li>Click on Register below and complete the short buySAFE Merchant application and store setup process. <li>Next, from your AspDotNetStorefront admin dashboard, choose buySAFE Authentication under the buySAFE menu. You''ll see the Store and Seal Authentication populated with your data. <li>Click on Test Authentication which verifies your data. <li>Lastly, go to your AspDotNet online store and make sure the buySAFE Seal and bond guaranteed are visible and working. </li></ol> <p>&nbsp; </p> <p>Once you complete these steps, you''ll be set up to start turning more shoppers into buyers with buySAFE! </p> <p>&nbsp; </p> <p style="TEXT-ALIGN: center" align=center><b><span style="COLOR: #b20000">Click Register below to get started!</span></b> </p></div> ')
INSERT [dbo].Topic(Name,HTMLOk,ShowInSiteMap,Title,Description) values('CardinalMyECheckPageHeader' ,1,0,'eCheck Terms','your MyECheck terms here. This is the topic Named: CardinalMyECheckPageHeader. You edit this in the ADMIN site.');
INSERT [dbo].Topic(Name,HTMLOk,ShowInSiteMap,Title,Description) values('CardinalMyECheckExplanation',1,0,'eCheck Processing','You will now be shown a form from our eCheck processing service. The information you enter here is <b>not</b> shared with us. Do not close this window or hit the Back button.<br/><br/>Payment authentication is in progress. Please wait until the MyECheck screen has loaded, then enter your information and click submit.<br/><br/>If you wish to cancel your checkout, please <a href="shoppingcart.aspx">click here</a>.');
INSERT [dbo].Topic(Name,HTMLOk,ShowInSiteMap,Title,Description) values('buySAFEOrderOptionDescription',1,0,'BuySafe','buySAFE is the e-commerce Bonding company that ensures internet shopping is always reliable, trusted and risk-free.  Professional online merchants partner with buySAFE to provide their buyers ultimate peace of mind.  They do this by having buySAFE:<br/><br/><ul><li>inspect their website operations,</li><li>monitor their performance daily and</li><li>bond your purchases up to $25,000</li></ul><br/><br/>The display of the buySAFE Seal on a merchant''s site means you can trust they are one of the best merchants on the web.<br/><br/>buySAFE''s bonding partners are Liberty Mutual, Travelers & ACE USA.')
INSERT [dbo].Topic(Name, HTMLOK, ShowInSiteMap,Title, Description) values('Newsletter', 1, 0, '	Newsletter	', '	<HTML>      <HEAD>          <TITLE></TITLE>      </HEAD>      <BODY class=RadEContent>          %NewsletterBody%          <DIV id=NewsletterFooter>You have recieved this newsletter because you are subscribed to the %CompanyName% newsletter. Click <A href="%UnsubscribeURL%">here</A> to unsubscribe. </DIV>      </BODY>  </HTML>  	')
INSERT [dbo].Topic(Name, HTMLOK, ShowInSiteMap,Title, Description) values('NewsletterEmail', 1, 0, '	NewsletterEmail	', '	<HTML>%NewsletterBody%<div id="NewsletterFooter">You have recieved this newsletter because you are subscribed to the %CompanyName% newsletter.Click <a href="%UnsubscribeURL%">here to unsubscribe.</a></div></HTML>	')
INSERT [dbo].Topic(Name, HTMLOK, ShowInSiteMap,Title, Description) values('NewsletterOptInEmail', 1, 0, '	NewsletterOptInEmail	', '	<HTML>You have recieved this email because you requested to be subscribed to the %CompanyName% newsletter.Click <a href="%SubscribeURL%">here</a> to confirm your email address.</HTML>	')
INSERT [dbo].Topic(Name, HTMLOK, ShowInSiteMap,Title, Description) values('Newsletter.OptInOutBadRequest', 1, 0, '	Newsletter.OptInOutBadRequest	', '	The address you''re attempting to confirm is invalid or has already been confirmed.	')
INSERT [dbo].Topic(Name, HTMLOK, ShowInSiteMap,Title, Description) values('Newsletter.ConfirmOptOut', 1, 0, '	Newsletter.ConfirmOptOut	', '	Are you sure you wish to be removed from our newsletter mailing list?	')
INSERT [dbo].Topic(Name, HTMLOK, ShowInSiteMap,Title, Description) values('Newsletter.ConfirmOptIn', 1, 0, '	Newsletter.ConfirmOptIn	', '	Click confirm to subscribe to our newsletter.	')
INSERT [dbo].Topic(Name, HTMLOK, ShowInSiteMap,Title, Description) values('Newsletter.AddressErrorBlock', 1, 0, '	Newsletter.AddressErrorBlock	', '	<table>  <tr class="captchaBox">  <td align="center">The email address you entered was in an invalid format.</td>  </tr>  </table>	')
INSERT [dbo].Topic(Name, HTMLOK, ShowInSiteMap,Title, Description) values('Newsletter.CaptchaErrorBlock', 1, 0, '	Newsletter.CaptchaErrorBlock	', '	<table>      <tr class="captchaBox">          <td align="center">The captcha characters you entered were incorrect.</td>      </tr>  </table>	')
INSERT [dbo].Topic(Name, HTMLOK, ShowInSiteMap,Title, Description) values('Newsletter.SubscribeSuccessful', 1, 0, 'Newsletter.SubscribeSuccessful', 'Thank you, you''re now subscribed to our newsletter. ')
INSERT [dbo].Topic(Name, HTMLOK, ShowInSiteMap,Title, Description) values('Newsletter.SubscribeConfirm', 1, 0, 'Newsletter.SubscribeConfirm', 'Thank you.  An email confirming your subscription is being sent.')
INSERT [dbo].Topic(Name, HTMLOK, ShowInSiteMap,Title, Description) values('Newsletter.UnsubscribeSuccessful', 1, 0, 'Newsletter.UnsubscribeSuccessful', 'You have now unsubscribed from our newsletter. ')
INSERT [dbo].Topic(Name, HTMLOk,ShowInSiteMap,Title,Description) values('InvalidRequest'                    ,1,0,'Invalid Request'                                                                ,'<b>Unable to Process Request</b><p>We were unable to process your request.  Please try again.  If you continue to receive this message, contact our customer service department by clicking <a href="t-contact.aspx">here</a>.  We apologize for the inconvenience.</p>');
INSERT [dbo].Topic(Name, HTMLOK, ShowInSiteMap,Title, Description) values('ContactEmail', 1, 0, 'ContactEmail', '<table style="width: 400px;"><tbody><tr><td align="right" style="width: 150px;">Customer Name: </td><td align="left">%NAME%</td></tr><tr><td align="right" style="width: 150px;">Customer Email: </td><td align="left">%EMAIL%</td></tr><tr><td align="right" style="width: 150px;">Customer Phone:</td><td align="left">%PHONE%</td></tr><tr><td colspan="2"> </td></tr><tr><td colspan="2"><b>%SUBJECT%</b></td></tr><tr><td colspan="2" style="padding-top: 3px;">%MESSAGE%</td></tr></tbody></table>')
INSERT [dbo].Topic(Name, Title, Description, ShowInSiteMap) values('PageNotFound','PageNotFound','<font color=#ff0000 size=2>  <p><br><font size=4>The requested page could not be found.</font></p></font>',0)



GO


TRUNCATE TABLE TopicStore
INSERT INTO TopicStore (TopicID, StoreID, CreatedOn) SELECT TopicID, 1, GETDATE() FROM Topic


GO


insert [dbo].[Feed](Name,XmlPackage,CanAutoFTP,FTPUsername, FTPPassword, FTPServer,FTPPort, FTPFilename) values('GoogleBase','feed.googlebase.xml.config',1,'', '', 'uploads.google.com',21, '');



GO


CREATE proc [dbo].[aspdnsf_DeleteAddress]
    @AddressID int,
    @CustomerID int
  
AS
BEGIN
    SET NOCOUNT ON 

    DECLARE @addrID int

    BEGIN TRAN
        DELETE dbo.ADDRESS WHERE AddressID = @AddressID and CustomerID = @CustomerID
        IF @@ERROR <> 0 BEGIN
            ROLLBACK TRAN
            RETURN
        END

        SELECT TOP 1 @addrID = AddressID FROM dbo.Address with (nolock) WHERE CustomerID = @CustomerID

        update [dbo].Customer SET ShippingAddressID = @addrID WHERE ShippingAddressID = @AddressID and CustomerID = @CustomerID
        IF @@ERROR <> 0 BEGIN
            ROLLBACK TRAN
            RETURN
        END

        update [dbo].Customer SET BillingAddressID = @addrID WHERE BillingAddressID = @AddressID and CustomerID = @CustomerID

        IF @@ERROR <> 0 BEGIN
            ROLLBACK TRAN
            RETURN
        END

    COMMIT TRAN

END

GO


create proc [dbo].[aspdnsf_insCustomer]
    @Email nvarchar(100),
    @Password nvarchar(100),
    @SkinID int,
    @AffiliateID int,
    @Referrer ntext,
    @IsAdmin tinyint,
    @LastIPAddress varchar(40),
    @LocaleSetting nvarchar(10),
    @Over13Checked tinyint,
    @CurrencySetting nvarchar(10),
    @VATSetting int,
    @VATRegistrationID nvarchar(100),
    @CustomerLevelID int,
    @CustomerID int OUTPUT
  
AS
SET NOCOUNT ON
 

insert dbo.Customer(CustomerGUID, CustomerLevelID, RegisterDate, Email, Password, DateOfBirth, Gender, FirstName, LastName, Notes, SkinID, Phone, AffiliateID, Referrer, CouponCode, OkToEmail, IsAdmin, BillingEqualsShipping, LastIPAddress, OrderNotes, SubscriptionExpiresOn, RTShipRequest, RTShipResponse, OrderOptions, LocaleSetting, MicroPayBalance, RecurringShippingMethodID, RecurringShippingMethod, BillingAddressID, ShippingAddressID, GiftRegistryGUID, GiftRegistryIsAnonymous, GiftRegistryAllowSearchByOthers, GiftRegistryNickName, GiftRegistryHideShippingAddresses, CODCompanyCheckAllowed, CODNet30Allowed, ExtensionData, FinalizationData, Deleted, CreatedOn, Over13Checked, CurrencySetting, VATSetting, VATRegistrationID, StoreCCInDB, IsRegistered, LockedUntil, AdminCanViewCC, PwdChanged, BadLoginCount, LastBadLogin, Active, PwdChangeRequired, SaltKey)
values
(
    newid(),
    @CustomerLevelID,
    getdate(),
    isnull(@Email, ''),
    isnull(@Password, ''),
    null,
    null,
    null,
    null,
    null,
    isnull(@SkinID, 1),
    null,
    @AffiliateID,
    @Referrer,
    null,
    1,
    isnull(@IsAdmin, 0),
    0,
    @LastIPAddress,
    null,
    null,
    null,
    null,
    null,
    isnull(@LocaleSetting, ('en-US')),
    0.0,
    1,
    null,
    null,
    null,
    newid(),
    1,
    1,
    null,
    1,
    0,
    0,
    null,
    null,
    0,
    getdate(),
    @Over13Checked,
    @CurrencySetting,
    @VATSetting,
    @VATRegistrationID,
    1,
    0,
    null,
    1,
    getdate(),
    0,
    null,
    1,
    0,
    0
)
 
set @CustomerID = @@identity
 

GO

GO


create proc dbo.aspdnsf_CustomerConsistencyCheck
  
AS
BEGIN
SET NOCOUNT ON 
    delete from dbo.ShoppingCart where CustomerID not in (select distinct CustomerID from Customer);
    delete from dbo.CustomCart where ShoppingCartRecID not in (select distinct ShoppingCartRecID from ShoppingCart);
    delete from dbo.KitCart where ShoppingCartRecID not in (select distinct ShoppingCartRecID from ShoppingCart);
    delete from dbo.CustomerSession where CustomerID not in (select distinct CustomerID from Customer);
    delete from dbo.LOG_CustomerEvent where CustomerID not in (select distinct CustomerID from Customer);
    delete from dbo.RatingCommentHelpfulness where RatingCustomerID not in (select distinct CustomerID from Customer);
    delete from dbo.RatingCommentHelpfulness where VotingCustomerID not in (select distinct CustomerID from Customer);
    delete from dbo.CouponUsage where CustomerID not in (select distinct CustomerID from Customer);
    delete from dbo.PollVotingRecord where CustomerID not in (select distinct CustomerID from Customer);
    delete from dbo.Address where CustomerID not in (select distinct CustomerID from Customer);
    delete from dbo.Rating where CustomerID not in (select distinct CustomerID from Customer);
END
go

GO


create proc [dbo].[aspdnsf_GetCustomerByID]
    @CustomerID int
  
AS
BEGIN
    SET NOCOUNT ON


    DECLARE @CustomerSessionID int, @LastActivity datetime, @SessionTimeOut varchar(10), @intSessionTimeOut int

    SELECT @LastActivity = '1/1/1900', @CustomerSessionID = -1

    SELECT @SessionTimeOut = ConfigValue FROM dbo.AppConfig with (nolock) WHERE [Name] = 'SessionTimeoutInMinutes'

    IF ISNUMERIC(@SessionTimeOut) = 1
        set @intSessionTimeOut = convert(int, @SessionTimeOut)
    ELSE
        set @intSessionTimeOut = 60

    SELECT  @CustomerSessionID  = cs.CustomerSessionID , @LastActivity = cs.LastActivity  
    FROM dbo.CustomerSession cs with (nolock) 
        join (SELECT max(CustomerSessionID) CustomerSessionID 
              FROM dbo.CustomerSession s with (nolock) join dbo.Customer c with (nolock) on s.CustomerID = c.CustomerID 
              WHERE c.CustomerID = @CustomerID and s.LoggedOut is null and s.LastActivity >= dateadd(mi, -@intSessionTimeOut, getdate())) a on cs.CustomerSessionID = a.CustomerSessionID

    SELECT top 1 
            c.CustomerID, c.CustomerGUID, c.CustomerLevelID, c.RegisterDate, c.Email, c.Password, c.SaltKey, c.DateOfBirth, c.Gender, 
            c.FirstName, c.LastName, c.Notes, c.SkinID, c.Phone, c.AffiliateID, c.Referrer, c.CouponCode, c.OkToEmail, 
            IsAdmin&1 IsAdmin, sign(IsAdmin&2) IsSuperAdmin, c.BillingEqualsShipping, c.LastIPAddress, 
            c.OrderNotes, c.SubscriptionExpiresOn, c.RTShipRequest, c.RTShipResponse, c.OrderOptions, c.LocaleSetting, 
            c.MicroPayBalance, c.RecurringShippingMethodID, c.RecurringShippingMethod, c.BillingAddressID, c.ShippingAddressID, 
            c.GiftRegistryGUID, c.GiftRegistryIsAnonymous, c.GiftRegistryAllowSearchByOthers, c.GiftRegistryNickName, 
            c.GiftRegistryHideShippingAddresses, c.CODCompanyCheckAllowed, c.CODNet30Allowed, c.ExtensionData, 
            c.FinalizationData, c.Deleted, c.CreatedOn, c.Over13Checked, c.CurrencySetting, 
            case when isnull(cl.CustomerLevelID, 0) > 0 and cl.LevelHasNoTax = 1 then 2 else c.VATSetting end VATSetting, 
            c.VATRegistrationID, c.StoreCCInDB, c.IsRegistered, c.LockedUntil, c.AdminCanViewCC, c.PwdChanged, c.BadLoginCount, 
            c.LastBadLogin, c.Active, c.PwdChangeRequired, c.SaltKey, isnull(cl.LevelDiscountPercent, 0) LevelDiscountPercent, 
            isnull(cl.LevelDiscountsApplyToExtendedPrices, 0) LevelDiscountsApplyToExtendedPrices, c.RequestedPaymentMethod,
            @CustomerSessionID CustomerSessionID,
            @LastActivity LastActivity, c.StoreID, d.Name StoreName
    FROM dbo.Customer c with (nolock) left join dbo.CustomerLevel cl with (nolock) on c.CustomerLevelID = cl.CustomerLevelID
    left join Store d with (nolock) on c.StoreID = d.StoreID
    WHERE c.Deleted=0 and c.CustomerID = @CustomerID
END


GO


create proc [dbo].[aspdnsf_GetCustomerByGUID]
    @CustomerGUID uniqueidentifier
  
AS
BEGIN
    SET NOCOUNT ON

    DECLARE @CustomerSessionID int, @LastActivity datetime, @SessionTimeOut varchar(10), @intSessionTimeOut int

    SELECT @LastActivity = '1/1/1900', @CustomerSessionID = -1

    SELECT @SessionTimeOut = ConfigValue FROM dbo.AppConfig with (nolock) WHERE [Name] = 'SessionTimeoutInMinutes'

    IF ISNUMERIC(@SessionTimeOut) = 1
        set @intSessionTimeOut = convert(int, @SessionTimeOut)
    ELSE
        set @intSessionTimeOut = 60

    SELECT  @CustomerSessionID  = cs.CustomerSessionID , @LastActivity = cs.LastActivity  
    FROM dbo.CustomerSession cs with (nolock) 
        join (SELECT max(CustomerSessionID) CustomerSessionID 
              FROM dbo.CustomerSession s with (nolock) join dbo.Customer c with (nolock) on s.CustomerID = c.CustomerID 
              WHERE c.CustomerGUID = @CustomerGUID and s.LoggedOut is null and s.LastActivity >= dateadd(mi, -@intSessionTimeOut, getdate())) a on cs.CustomerSessionID = a.CustomerSessionID


    SELECT top 1 
            c.CustomerID, c.CustomerGUID, c.CustomerLevelID, c.RegisterDate, c.Email, c.Password, c.SaltKey, c.DateOfBirth, c.Gender, 
            c.FirstName, c.LastName, c.Notes, c.SkinID, c.Phone, c.AffiliateID, c.Referrer, c.CouponCode, c.OkToEmail, 
            IsAdmin&1 IsAdmin, sign(IsAdmin&2) IsSuperAdmin, c.BillingEqualsShipping, c.LastIPAddress, 
            c.OrderNotes, c.SubscriptionExpiresOn, c.RTShipRequest, c.RTShipResponse, c.OrderOptions, c.LocaleSetting, 
            c.MicroPayBalance, c.RecurringShippingMethodID, c.RecurringShippingMethod, c.BillingAddressID, c.ShippingAddressID, 
            c.GiftRegistryGUID, c.GiftRegistryIsAnonymous, c.GiftRegistryAllowSearchByOthers, c.GiftRegistryNickName, 
            c.GiftRegistryHideShippingAddresses, c.CODCompanyCheckAllowed, c.CODNet30Allowed, c.ExtensionData, 
            c.FinalizationData, c.Deleted, c.CreatedOn, c.Over13Checked, c.CurrencySetting, 
            case when isnull(cl.CustomerLevelID, 0) > 0 and cl.LevelHasNoTax = 1 then 2 else c.VATSetting end VATSetting, 
            c.VATRegistrationID, c.StoreCCInDB, c.IsRegistered, c.LockedUntil, c.AdminCanViewCC, c.PwdChanged, c.BadLoginCount, 
            c.LastBadLogin, c.Active, c.PwdChangeRequired, c.SaltKey, isnull(cl.LevelDiscountPercent, 0) LevelDiscountPercent, 
            isnull(cl.LevelDiscountsApplyToExtendedPrices, 0) LevelDiscountsApplyToExtendedPrices, c.RequestedPaymentMethod,
            @CustomerSessionID CustomerSessionID, @LastActivity LastActivity, c.StoreID, d.Name StoreName
    FROM dbo.Customer c with (nolock) left join dbo.CustomerLevel cl with (nolock) on c.CustomerLevelID = cl.CustomerLevelID
    left join Store d with (nolock) on c.StoreID = d.StoreID
    WHERE c.Deleted=0 and c.CustomerGUID = @CustomerGUID
END


GO


CREATE PROC [dbo].[aspdnsf_GetCustomerByEmail]
    @Email nvarchar(100),
    @filtercustomer bit,
    @StoreID int = 1
    
  
AS
BEGIN
    SET NOCOUNT ON

    DECLARE @CustomerSessionID int, @LastActivity datetime, @SessionTimeOut varchar(10), @intSessionTimeOut int

    SELECT @LastActivity = '1/1/1900', @CustomerSessionID = -1

    SELECT @SessionTimeOut = ConfigValue FROM dbo.AppConfig with (nolock) WHERE [Name] = 'SessionTimeoutInMinutes'

    IF ISNUMERIC(@SessionTimeOut) = 1
        set @intSessionTimeOut = convert(int, @SessionTimeOut)
    ELSE
        set @intSessionTimeOut = 60

    SELECT  @CustomerSessionID  = cs.CustomerSessionID , @LastActivity = cs.LastActivity  
    FROM dbo.CustomerSession cs with (nolock) 
        join (SELECT max(CustomerSessionID) CustomerSessionID 
              FROM dbo.CustomerSession s with (nolock) join dbo.Customer c with (nolock) on s.CustomerID = c.CustomerID 
              WHERE c.Email = @Email and s.LoggedOut is null and s.LastActivity >= dateadd(mi, -@intSessionTimeOut, getdate())) a on cs.CustomerSessionID = a.CustomerSessionID

    SELECT top 1 
            c.CustomerID, c.CustomerGUID, c.CustomerLevelID, c.RegisterDate, c.Email, c.Password, c.SaltKey, c.DateOfBirth, c.Gender, 
            c.FirstName, c.LastName, c.Notes, c.SkinID, c.Phone, c.AffiliateID, c.Referrer, c.CouponCode, c.OkToEmail, 
            IsAdmin&1 IsAdmin, sign(IsAdmin&2) IsSuperAdmin, c.BillingEqualsShipping, c.LastIPAddress, 
            c.OrderNotes, c.SubscriptionExpiresOn, c.RTShipRequest, c.RTShipResponse, c.OrderOptions, c.LocaleSetting, 
            c.MicroPayBalance, c.RecurringShippingMethodID, c.RecurringShippingMethod, c.BillingAddressID, c.ShippingAddressID, 
            c.GiftRegistryGUID, c.GiftRegistryIsAnonymous, c.GiftRegistryAllowSearchByOthers, c.GiftRegistryNickName, 
            c.GiftRegistryHideShippingAddresses, c.CODCompanyCheckAllowed, c.CODNet30Allowed, c.ExtensionData, 
            c.FinalizationData, c.Deleted, c.CreatedOn, c.Over13Checked, c.CurrencySetting, 
            case when isnull(cl.CustomerLevelID, 0) > 0 and cl.LevelHasNoTax = 1 then 2 else c.VATSetting end VATSetting, 
            c.VATRegistrationID, c.StoreCCInDB, c.IsRegistered, c.LockedUntil, c.AdminCanViewCC, c.PwdChanged, c.BadLoginCount, 
            c.LastBadLogin, c.Active, c.PwdChangeRequired, c.SaltKey, isnull(cl.LevelDiscountPercent, 0) LevelDiscountPercent, 
            isnull(cl.LevelDiscountsApplyToExtendedPrices, 0) LevelDiscountsApplyToExtendedPrices, c.RequestedPaymentMethod,
            @CustomerSessionID CustomerSessionID, @LastActivity LastActivity, c.StoreID, d.Name StoreName
    FROM dbo.Customer c with (nolock) left join dbo.CustomerLevel cl with (nolock) on c.CustomerLevelID = cl.CustomerLevelID
    left join Store d with (nolock) on c.StoreID = d.StoreID
    WHERE c.Deleted=0 and c.Email = @Email and ((@filtercustomer = 0 or IsAdmin > 0) or c.StoreID = @StoreID)
END

GO


CREATE proc [dbo].[aspdnsf_updCustomer]
    @CustomerID int,
    @CustomerLevelID int = null,
    @Email nvarchar(100) = null,
    @Password nvarchar(250) = null,
    @SaltKey int = null,
    @DateOfBirth datetime = null,
    @Gender nvarchar(1) = null,
    @FirstName nvarchar(100) = null,
    @LastName nvarchar(100) = null,
    @Notes ntext = null,
    @SkinID int = null,
    @Phone nvarchar(25) = null,
    @AffiliateID int = null,
    @Referrer ntext = null,
    @CouponCode nvarchar(50) = null,
    @OkToEmail tinyint = null,
    @IsAdmin tinyint = null,
    @BillingEqualsShipping tinyint = null,
    @LastIPAddress varchar(40) = null,
    @OrderNotes ntext = null,
    @SubscriptionExpiresOn datetime = null,
    @RTShipRequest ntext = null,
    @RTShipResponse ntext = null,
    @OrderOptions ntext = null,
    @LocaleSetting nvarchar(10) = null,
    @MicroPayBalance money = null,
    @RecurringShippingMethodID int = null,
    @RecurringShippingMethod nvarchar(100) = null,
    @BillingAddressID int = null,
    @ShippingAddressID int = null,
    @GiftRegistryGUID uniqueidentifier = null,
    @GiftRegistryIsAnonymous tinyint = null,
    @GiftRegistryAllowSearchByOthers tinyint = null,
    @GiftRegistryNickName nvarchar(100) = null,
    @GiftRegistryHideShippingAddresses tinyint = null,
    @CODCompanyCheckAllowed tinyint = null,
    @CODNet30Allowed tinyint = null,
    @ExtensionData ntext = null,
    @FinalizationData ntext = null,
    @Deleted tinyint = null,
    @Over13Checked tinyint = null,
    @CurrencySetting nvarchar(10) = null,
    @VATSetting int = null,
    @VATRegistrationID nvarchar(100) = null,
    @StoreCCInDB tinyint = null,
    @IsRegistered tinyint = null,
    @LockedUntil datetime = null,
    @AdminCanViewCC tinyint = null,
    @BadLogin smallint = 0, --only pass -1 = null, 0 = null, or 1: -1 clears the field = null, 0 does nothing = null, 1 increments the field by one
    @Active tinyint = null,
    @PwdChangeRequired tinyint = null,
    @RegisterDate datetime = null,
    @RequestedPaymentMethod  nvarchar(100) = null,
    @StoreID	int =1
    
  
AS
SET NOCOUNT ON 

DECLARE @OldPwd nvarchar(100), @IsAdminCust tinyint, @OldSaltKey int

SELECT @OldPwd = Password, @IsAdminCust = IsAdmin, @OldSaltKey = Saltkey FROM dbo.Customer WHERE CustomerID = @CustomerID


UPDATE dbo.Customer
SET 
    CustomerLevelID = COALESCE(@CustomerLevelID, CustomerLevelID),
    RegisterDate = COALESCE(@RegisterDate, RegisterDate),
    Email = COALESCE(@Email, Email),
    Password = COALESCE(@Password, Password),
    SaltKey = COALESCE(@SaltKey, SaltKey),
    DateOfBirth = COALESCE(@DateOfBirth, DateOfBirth),
    Gender = COALESCE(@Gender, Gender),
    FirstName = COALESCE(@FirstName, FirstName),
    LastName = COALESCE(@LastName, LastName),
    Notes = COALESCE(@Notes, Notes),
    SkinID = COALESCE(@SkinID, SkinID),
    Phone = COALESCE(@Phone, Phone),
    AffiliateID = COALESCE(@AffiliateID, AffiliateID),
    Referrer = COALESCE(@Referrer, Referrer),
    CouponCode = COALESCE(@CouponCode, CouponCode),
    OkToEmail = COALESCE(@OkToEmail, OkToEmail),
    IsAdmin = COALESCE(@IsAdmin, IsAdmin),
    BillingEqualsShipping = COALESCE(@BillingEqualsShipping, BillingEqualsShipping),
    LastIPAddress = COALESCE(@LastIPAddress, LastIPAddress),
    OrderNotes = COALESCE(@OrderNotes, OrderNotes),
    SubscriptionExpiresOn = COALESCE(@SubscriptionExpiresOn, SubscriptionExpiresOn),
    RTShipRequest = COALESCE(@RTShipRequest, RTShipRequest),
    RTShipResponse = COALESCE(@RTShipResponse, RTShipResponse),
    OrderOptions = COALESCE(@OrderOptions, OrderOptions),
    LocaleSetting = COALESCE(@LocaleSetting, LocaleSetting),
    MicroPayBalance = COALESCE(@MicroPayBalance, MicroPayBalance),
    RecurringShippingMethodID = COALESCE(@RecurringShippingMethodID, RecurringShippingMethodID),
    RecurringShippingMethod = COALESCE(@RecurringShippingMethod, RecurringShippingMethod),
    BillingAddressID = COALESCE(@BillingAddressID, BillingAddressID),
    ShippingAddressID = COALESCE(@ShippingAddressID, ShippingAddressID),
    GiftRegistryGUID = COALESCE(@GiftRegistryGUID, GiftRegistryGUID),
    GiftRegistryIsAnonymous = COALESCE(@GiftRegistryIsAnonymous, GiftRegistryIsAnonymous),
    GiftRegistryAllowSearchByOthers = COALESCE(@GiftRegistryAllowSearchByOthers, GiftRegistryAllowSearchByOthers),
    GiftRegistryNickName = COALESCE(@GiftRegistryNickName, GiftRegistryNickName),
    GiftRegistryHideShippingAddresses = COALESCE(@GiftRegistryHideShippingAddresses, GiftRegistryHideShippingAddresses),
    CODCompanyCheckAllowed = COALESCE(@CODCompanyCheckAllowed, CODCompanyCheckAllowed),
    CODNet30Allowed = COALESCE(@CODNet30Allowed, CODNet30Allowed),
    ExtensionData = COALESCE(@ExtensionData, ExtensionData),
    FinalizationData = COALESCE(@FinalizationData, FinalizationData),
    Deleted = COALESCE(@Deleted, Deleted),
    Over13Checked = COALESCE(@Over13Checked, Over13Checked),
    CurrencySetting = COALESCE(@CurrencySetting, CurrencySetting),
    VATSetting = COALESCE(@VATSetting, VATSetting),
    VATRegistrationID = COALESCE(@VATRegistrationID, VATRegistrationID),
    StoreCCInDB = COALESCE(@StoreCCInDB, StoreCCInDB),
    IsRegistered = COALESCE(@IsRegistered, IsRegistered),
    LockedUntil = COALESCE(@LockedUntil, LockedUntil),
    AdminCanViewCC = COALESCE(@AdminCanViewCC, AdminCanViewCC),
    PwdChanged = case when @OldPwd <> @Password and @Password is not null then getdate() else PwdChanged end,
    BadLoginCount = case @BadLogin when -1 then 0 else BadLoginCount + @BadLogin end,
    LastBadLogin = case @BadLogin when -1 then null when 1 then getdate() else LastBadLogin end,
    Active = COALESCE(@Active, Active),
    PwdChangeRequired = COALESCE(@PwdChangeRequired, PwdChangeRequired),
    RequestedPaymentMethod = COALESCE(@RequestedPaymentMethod, RequestedPaymentMethod),
    StoreID = COALESCE(@StoreID, StoreID)
WHERE CustomerID = @CustomerID

IF @IsAdminCust > 0 and @OldPwd <> @Password
    INSERT dbo.PasswordLog (CustomerID, OldPwd, SaltKey, ChangeDt)
    VALUES (@CustomerID, @OldPwd, @OldSaltKey, getdate())


GO


CREATE proc [dbo].[aspdnsf_updCustomerByEmail]
    @Email nvarchar(100),
    @CustomerLevelID int = null,
    @Password nvarchar(250) = null,
    @SaltKey int = null,
    @DateOfBirth datetime = null,
    @Gender nvarchar(1) = null,
    @FirstName nvarchar(100) = null,
    @LastName nvarchar(100) = null,
    @Notes ntext = null,
    @SkinID int = null,
    @Phone nvarchar(25) = null,
    @AffiliateID int = null,
    @Referrer ntext = null,
    @CouponCode nvarchar(50) = null,
    @OkToEmail tinyint = null,
    @IsAdmin tinyint = null,
    @BillingEqualsShipping tinyint = null,
    @LastIPAddress varchar(40) = null,
    @OrderNotes ntext = null,
    @SubscriptionExpiresOn datetime = null,
    @RTShipRequest ntext = null,
    @RTShipResponse ntext = null,
    @OrderOptions ntext = null,
    @LocaleSetting nvarchar(10) = null,
    @MicroPayBalance money = null,
    @RecurringShippingMethodID int = null,
    @RecurringShippingMethod nvarchar(100) = null,
    @BillingAddressID int = null,
    @ShippingAddressID int = null,
    @GiftRegistryGUID uniqueidentifier = null,
    @GiftRegistryIsAnonymous tinyint = null,
    @GiftRegistryAllowSearchByOthers tinyint = null,
    @GiftRegistryNickName nvarchar(100) = null,
    @GiftRegistryHideShippingAddresses tinyint = null,
    @CODCompanyCheckAllowed tinyint = null,
    @CODNet30Allowed tinyint = null,
    @ExtensionData ntext = null,
    @FinalizationData ntext = null,
    @Deleted tinyint = null,
    @Over13Checked tinyint = null,
    @CurrencySetting nvarchar(10) = null,
    @VATSetting int = null,
    @VATRegistrationID nvarchar(100) = null,
    @StoreCCInDB tinyint = null,
    @IsRegistered tinyint = null,
    @LockedUntil datetime = null,
    @AdminCanViewCC tinyint = null,
    @BadLogin smallint = 0 , --only pass -1 = null, 0 = null, or 1: -1 clears the field = null, 0 does nothing = null, 1 increments the field by one
    @Active tinyint = null,
    @PwdChangeRequired tinyint = null,
    @RequestedPaymentMethod  nvarchar(100) = null
  
AS
SET NOCOUNT ON 

DECLARE @CustomerID int, @OldPwd nvarchar(100), @IsAdminCust tinyint, @OldSaltKey int

SELECT @CustomerID = CustomerID , @OldPwd = Password, @IsAdminCust = IsAdmin, @OldSaltKey = Saltkey FROM dbo.Customer WHERE Email = @Email 


UPDATE dbo.Customer
SET 
    CustomerLevelID = COALESCE(@CustomerLevelID, CustomerLevelID),
    Email = COALESCE(@Email, Email),
    Password = COALESCE(@Password, Password),
    SaltKey = COALESCE(@SaltKey, SaltKey),
    DateOfBirth = COALESCE(@DateOfBirth, DateOfBirth),
    Gender = COALESCE(@Gender, Gender),
    FirstName = COALESCE(@FirstName, FirstName),
    LastName = COALESCE(@LastName, LastName),
    Notes = COALESCE(@Notes, Notes),
    SkinID = COALESCE(@SkinID, SkinID),
    Phone = COALESCE(@Phone, Phone),
    AffiliateID = COALESCE(@AffiliateID, AffiliateID),
    Referrer = COALESCE(@Referrer, Referrer),
    CouponCode = COALESCE(@CouponCode, CouponCode),
    OkToEmail = COALESCE(@OkToEmail, OkToEmail),
    IsAdmin = COALESCE(@IsAdmin, IsAdmin),
    BillingEqualsShipping = COALESCE(@BillingEqualsShipping, BillingEqualsShipping),
    LastIPAddress = COALESCE(@LastIPAddress, LastIPAddress),
    OrderNotes = COALESCE(@OrderNotes, OrderNotes),
    SubscriptionExpiresOn = COALESCE(@SubscriptionExpiresOn, SubscriptionExpiresOn),
    RTShipRequest = COALESCE(@RTShipRequest, RTShipRequest),
    RTShipResponse = COALESCE(@RTShipResponse, RTShipResponse),
    OrderOptions = COALESCE(@OrderOptions, OrderOptions),
    LocaleSetting = COALESCE(@LocaleSetting, LocaleSetting),
    MicroPayBalance = COALESCE(@MicroPayBalance, MicroPayBalance),
    RecurringShippingMethodID = COALESCE(@RecurringShippingMethodID, RecurringShippingMethodID),
    RecurringShippingMethod = COALESCE(@RecurringShippingMethod, RecurringShippingMethod),
    BillingAddressID = COALESCE(@BillingAddressID, BillingAddressID),
    ShippingAddressID = COALESCE(@ShippingAddressID, ShippingAddressID),
    GiftRegistryGUID = COALESCE(@GiftRegistryGUID, GiftRegistryGUID),
    GiftRegistryIsAnonymous = COALESCE(@GiftRegistryIsAnonymous, GiftRegistryIsAnonymous),
    GiftRegistryAllowSearchByOthers = COALESCE(@GiftRegistryAllowSearchByOthers, GiftRegistryAllowSearchByOthers),
    GiftRegistryNickName = COALESCE(@GiftRegistryNickName, GiftRegistryNickName),
    GiftRegistryHideShippingAddresses = COALESCE(@GiftRegistryHideShippingAddresses, GiftRegistryHideShippingAddresses),
    CODCompanyCheckAllowed = COALESCE(@CODCompanyCheckAllowed, CODCompanyCheckAllowed),
    CODNet30Allowed = COALESCE(@CODNet30Allowed, CODNet30Allowed),
    ExtensionData = COALESCE(@ExtensionData, ExtensionData),
    FinalizationData = COALESCE(@FinalizationData, FinalizationData),
    Deleted = COALESCE(@Deleted, Deleted),
    Over13Checked = COALESCE(@Over13Checked, Over13Checked),
    CurrencySetting = COALESCE(@CurrencySetting, CurrencySetting),
    VATSetting = COALESCE(@VATSetting, VATSetting),
    VATRegistrationID = COALESCE(@VATRegistrationID, VATRegistrationID),
    StoreCCInDB = COALESCE(@StoreCCInDB, StoreCCInDB),
    IsRegistered = COALESCE(@IsRegistered, IsRegistered),
    LockedUntil = COALESCE(@LockedUntil, LockedUntil),
    AdminCanViewCC = COALESCE(@AdminCanViewCC, AdminCanViewCC),
    PwdChanged = case when @OldPwd <> @Password and @Password is not null then getdate() else PwdChanged end,
    BadLoginCount = case @BadLogin when -1 then 0 else BadLoginCount + @BadLogin end,
    LastBadLogin = case @BadLogin when -1 then null when 1 then getdate() else LastBadLogin end,
    Active = COALESCE(@Active, Active),
    PwdChangeRequired = COALESCE(@PwdChangeRequired, PwdChangeRequired),
    RequestedPaymentMethod = COALESCE(@RequestedPaymentMethod, RequestedPaymentMethod)
WHERE Email = @Email

IF @IsAdminCust = 1 and @OldPwd <> @Password
    INSERT dbo.PasswordLog (CustomerID, OldPwd, SaltKey, ChangeDt)
    VALUES (@CustomerID, @OldPwd, @OldSaltKey, getdate())


GO


create proc [dbo].[aspdnsf_SessionGetByCustomerID]
    @CustomerID int
  
AS
SET NOCOUNT ON 

DECLARE @CustomerSessionID int, @SessionTimeOut varchar(10), @intSessionTimeOut int
SELECT @SessionTimeOut = ConfigValue FROM dbo.AppConfig with (nolock) WHERE [Name] = 'SessionTimeoutInMinutes'

IF ISNUMERIC(@SessionTimeOut) = 1
    set @intSessionTimeOut = convert(int, @SessionTimeOut)
ELSE
    set @intSessionTimeOut = 60


select @CustomerSessionID = max(CustomerSessionID)
from dbo.Customersession with (nolock) 
WHERE CustomerID = @CustomerID and LoggedOut is null and LastActivity > dateadd(mi, -@intSessionTimeOut, getdate())

UPDATE dbo.Customersession 
SET LastActivity = getdate()
WHERE CustomerSessionID = @CustomerSessionID

SELECT cs.CustomerSessionID, cs.CustomerSessionGUID, cs.CustomerID, cs.SessionName, cs.SessionValue, cs.CreatedOn, cs.ExpiresOn, cs.ipaddr, cs.LastActivity, cs.LoggedOut
FROM dbo.Customersession cs with (nolock) 
WHERE CustomerSessionID = @CustomerSessionID

DELETE dbo.Customersession WHERE CustomerID = @CustomerID and CustomersessionID <> @CustomerSessionID 


GO



create proc [dbo].[aspdnsf_SessionGetByGUID]
    @CustomerSessionGUID uniqueidentifier
  
AS
SET NOCOUNT ON 

DECLARE @CustomerSessionID int, @SessionTimeOut varchar(10), @intSessionTimeOut int
SELECT @SessionTimeOut = ConfigValue FROM dbo.AppConfig with (nolock) WHERE [Name] = 'SessionTimeoutInMinutes'

IF ISNUMERIC(@SessionTimeOut) = 1
    set @intSessionTimeOut = convert(int, @SessionTimeOut)
ELSE
    set @intSessionTimeOut = 60

UPDATE dbo.Customersession 
SET LastActivity = getdate()
WHERE CustomerSessionGUID = @CustomerSessionGUID


SELECT CustomerSessionID, CustomerSessionGUID, CustomerID, SessionName, SessionValue, CreatedOn, ExpiresOn, ipaddr, LastActivity, LoggedOut
FROM dbo.Customersession
WHERE CustomerSessionGUID = @CustomerSessionGUID and LoggedOut is null and LastActivity > dateadd(mi, -@intSessionTimeOut, getdate())



GO




create proc [dbo].[aspdnsf_SessionGetByID]
    @CustomerSessionID int
  
AS
SET NOCOUNT ON 

DECLARE @SessionTimeOut varchar(10), @intSessionTimeOut int
SELECT @SessionTimeOut = ConfigValue FROM dbo.AppConfig with (nolock) WHERE [Name] = 'SessionTimeoutInMinutes'

IF ISNUMERIC(@SessionTimeOut) = 1
    set @intSessionTimeOut = convert(int, @SessionTimeOut)
ELSE
    set @intSessionTimeOut = 60

UPDATE dbo.Customersession 
SET LastActivity = getdate()
WHERE CustomerSessionID = @CustomerSessionID


SELECT CustomerSessionID, CustomerSessionGUID, CustomerID, SessionName, SessionValue, CreatedOn, ExpiresOn, ipaddr, LastActivity, LoggedOut
FROM dbo.Customersession
WHERE CustomerSessionID = @CustomerSessionID and LoggedOut is null and LastActivity > dateadd(mi, -@intSessionTimeOut, getdate())



GO


create proc [dbo].[aspdnsf_SessionInsert]
    @CustomerID int,
    @SessionValue ntext,
    @ipaddr varchar(15),
    @CustomerSessionID int OUTPUT
  
AS
SET NOCOUNT ON 

DECLARE @CustomerSessionGUID uniqueidentifier

set @CustomerSessionGUID = newid()
insert dbo.Customersession(CustomerID, SessionName, SessionValue, CreatedOn, ipaddr, LastActivity, CustomerSessionGUID)
values (@CustomerID, '', isnull(@SessionValue, ''), getdate(), @ipaddr, getdate(), @CustomerSessionGUID)

set @CustomerSessionID = @@identity

DELETE dbo.Customersession WHERE CustomerID = @CustomerID and CustomersessionID <> @CustomerSessionID 



GO


create proc [dbo].[aspdnsf_SessionAge]
    @CustomerID int = null
  
AS
SET NOCOUNT ON 

DECLARE @SessionTimeOut varchar(10), @intSessionTimeOut int
SELECT @SessionTimeOut = ConfigValue FROM dbo.AppConfig with (nolock) WHERE [Name] = 'SessionTimeoutInMinutes'

IF ISNUMERIC(@SessionTimeOut) = 1
    set @intSessionTimeOut = convert(int, @SessionTimeOut)
ELSE
    set @intSessionTimeOut = 60

DELETE dbo.Customersession WHERE CustomerID = coalesce(@CustomerID, CustomerID) and  (LoggedOut is not null or LastActivity <= dateadd(mi, -@intSessionTimeOut, getdate()))


GO


CREATE proc [dbo].[aspdnsf_SessionUpdate]
    @CustomerSessionID int,
    @SessionName nvarchar(100),
    @SessionValue ntext,
    @ExpiresOn datetime,
    @LoggedOut datetime
  
AS
SET NOCOUNT ON 


UPDATE dbo.Customersession
SET 
    SessionName = COALESCE(@SessionName, SessionName),
    SessionValue = COALESCE(@SessionValue, SessionValue),
    ExpiresOn = COALESCE(@ExpiresOn, ExpiresOn),
    LastActivity = getdate(),
    LoggedOut = COALESCE(@LoggedOut, LoggedOut)
WHERE CustomerSessionID = @CustomerSessionID


SELECT CustomerSessionID, CustomerID, SessionName, SessionValue, CreatedOn, ExpiresOn, ipaddr, LastActivity, CustomerSessionGUID
FROM dbo.Customersession
WHERE CustomerSessionID = @CustomerSessionID 


GO



CREATE PROC [dbo].[aspdnsf_GetCustomersAlsoBoughtProducts]  
    @NumProductToDisplay	int,  
    @productid				int,  
    @CustomerLevelID		int,  
    @InvFilter				int,  
    @affiliateID			int,
	@storeID				int = 1,
	@filterProduct			bit = 0		  

  
AS  
SET NOCOUNT ON   

DECLARE @custlevelcount int, @affiliatecount int, @AffiliateExists int, @FilterProductsByAffiliate tinyint, @CustomerLevelFilteringIsAscending bit, @FilterProductsByCustomerLevel tinyint, @DisplayOutOfStockProducts tinyint, @OutOfStockThreshold int  

SELECT @custlevelcount = si.rows from dbo.sysobjects so with (nolock) join dbo.sysindexes si with (nolock) on so.id = si.id where so.id = object_id('ProductCustomerLevel') and si.indid < 2 and type = 'u'  
SELECT @FilterProductsByCustomerLevel = case ConfigValue when 'true' then 1 else 0 end FROM dbo.AppConfig with (nolock) WHERE [Name] = 'FilterProductsByCustomerLevel'  
SELECT @affiliatecount = count(*),  @AffiliateExists = sum(case when AffiliateID = @affiliateID then 1 else 0 end) from dbo.ProductAffiliate with (nolock) where ProductID = @ProductID   

SET @CustomerLevelFilteringIsAscending  = 0  
SELECT @CustomerLevelFilteringIsAscending  = case ConfigValue when 'true' then 1 else 0 end FROM dbo.AppConfig with (NOLOCK) WHERE name = 'FilterByCustomerLevelIsAscending'  

SELECT @FilterProductsByAffiliate = case ConfigValue when 'true' then 1 else 0 end FROM dbo.AppConfig with (nolock) WHERE [Name] = 'FilterProductsByAffiliate'  


SELECT TOP (@NumProductToDisplay) p.ProductID,p.ImageFilenameOverride, p.Name,p.SKU, p.SEName, Description, a.CountOfOrders, UnitsOrdered, SEAltText
FROM dbo.product p with (nolock)   
    join (  
            SELECT top 8 os.productid, count(*) CountOfOrders, sum(os.Quantity) UnitsOrdered  
            from dbo.orders_shoppingcart os   
                join (SELECT distinct o.ordernumber  
                      from dbo.orders_shoppingcart os with (nolock)   
                           join dbo.orders o with (nolock) on os.ordernumber = o.ordernumber   
                      WHERE (o.TransactionState = 'CAPTURED' or o.TransactionState = 'AUTHORIZED' or o.TransactionState = 'AUTH' )and os.ProductID = @productid --and o.orderdate > dateadd(dy, -360, getdate())  
                     ) o on os.ordernumber = o.ordernumber   
                join dbo.product p with (nolock) on os.productid = p.productid  
                join dbo.productvariant pv with (nolock) on os.variantid = pv.variantid  
                left join (select variantid, sum(quan) inventory from inventory group by variantid) i on pv.variantid = i.variantid  
                left join dbo.productcustomerlevel pcl with (nolock) on os.productid = pcl.productid  
                left join dbo.ProductAffiliate     pa  with (nolock) on os.ProductID = pa.ProductID
				INNER JOIN (SELECT DISTINCT ProductID FROM ProductStore with (nolock) WHERE (@filterProduct = 0 or StoreID = @storeID)) ps on p.ProductID = ps.ProductID   
            WHERE os.productid <> @productid  
                  and p.published = 1 AND p.deleted = 0   
                  and pv.published = 1 AND pv.deleted = 0   
                  and GETDATE() BETWEEN ISNULL(p.AvailableStartDate, '1/1/1900') AND ISNULL(p.AvailableStopDate, '1/1/2999')   
                  and pv.Inventory >= @InvFilter  
                  and (case   
                        when @FilterProductsByCustomerLevel = 0 or @custlevelcount = 0 or pcl.CustomerLevelID is null or @CustomerLevelID is null then 1  
                        when @CustomerLevelFilteringIsAscending = 1 and pcl.CustomerLevelID <= @CustomerLevelID then 1   
                        when pcl.CustomerLevelID = @CustomerLevelID or pcl.CustomerLevelID is null then 1   
                        else 0  
                       end  = 1  
                      )  
                  and (pa.AffiliateID = @affiliateID or pa.AffiliateID is null or @affiliatecount = 0 or @FilterProductsByAffiliate = 0)  
            GROUP BY os.productid   
            ORDER BY count(*) desc, sum(os.Quantity) desc  
        ) a on p.productid = a.productid  


GO



CREATE PROCEDURE [dbo].[aspdnsf_GetCustomersRelatedProducts]
	@CustomerViewID		nvarchar(50),
	@ProductID			int,
	@CustomerLevelID	int,
	@InvFilter			int,
	@affiliateID		int,
	@storeID			int = 1,
	@filterProduct		bit = 0
	
  
AS
SET NOCOUNT ON 

DECLARE 
	@custlevelcount int, 
	@CustomerLevelFilteringIsAscending bit, 
	@FilterProductsByCustomerLevel tinyint, 
	@relatedprods varchar(8000),
	@DynamicProductsEnabled varchar(10),
	@DynamicProductsDisplayed int,
	@FilterProductsByAffiliate tinyint,
	@affiliatecount int,
	@AffiliateExists int
	

SELECT @custlevelcount = si.rows from dbo.sysobjects so with (nolock) join dbo.sysindexes si with (nolock) on so.id = si.id where so.id = object_id('ProductCustomerLevel') and si.indid < 2 and type = 'u'
SELECT @FilterProductsByCustomerLevel = case ConfigValue when 'true' then 1 else 0 end FROM dbo.AppConfig with (nolock) WHERE [Name] = 'FilterProductsByCustomerLevel'
SELECT @FilterProductsByAffiliate = case ConfigValue when 'true' then 1 else 0 end FROM dbo.AppConfig with (nolock) WHERE [Name] = 'FilterProductsByAffiliate'
SELECT @affiliatecount = count(*),  @AffiliateExists = sum(case when AffiliateID = @affiliateID then 1 else 0 end) from dbo.ProductAffiliate with (nolock) where ProductID = @ProductID


SET @CustomerLevelFilteringIsAscending  = 0
SELECT @CustomerLevelFilteringIsAscending  = case configvalue when 'true' then 1 else 0 end
FROM dbo.appConfig with (nolock)
WHERE name like 'FilterByCustomerLevelIsAscending'	

SELECT @DynamicProductsDisplayed = CAST(ConfigValue AS INT) from AppConfig with (NOLOCK) where Name = 'DynamicRelatedProducts.NumberDisplayed'
SELECT @DynamicProductsEnabled = CASE ConfigValue WHEN 'true' then 1 else 0 end from AppConfig with (NOLOCK) where Name = 'DynamicRelatedProducts.Enabled'
select @relatedprods = replace(cast(relatedproducts as varchar(8000)), ' ', '') from dbo.product with (NOLOCK) where productid = @productid

IF(@DynamicProductsEnabled = 1 and @DynamicProductsDisplayed > 0)
BEGIN
SELECT TOP (@DynamicProductsDisplayed) tp.ProductID, tp.ProductGUID, tp.ImageFilenameOverride, tp.SKU, tp.SEAltText, tp.Name, tp.Description  FROM Product tp with (NOLOCK) JOIN
(
SELECT p.ProductID, p.ProductGUID, p.ImageFilenameOverride, p.SKU, p.SEAltText, p.Name, p.Description  
from dbo.product p with (nolock) 
    join dbo.split(@relatedprods, ',') rp on p.productid = cast(rp.items as int) 
    left join dbo.productcustomerlevel pcl with (nolock) on p.productid = pcl.productid and @FilterProductsByCustomerLevel = 1
    join (select p.ProductID
          from dbo.product p  with (nolock)
              join dbo.split(@relatedprods, ',') rp on p.productid = cast(rp.items as int) 
              join (select ProductID, sum(Inventory) Inventory from dbo.productvariant with (nolock) group by ProductID) pv on p.ProductID = pv.ProductID
              left join (select ProductID, sum(quan) inventory from dbo.inventory i1 with (nolock) join dbo.productvariant pv1 with (nolock) on pv1.variantid = i1.variantid join dbo.split(@relatedprods, ',') rp1 on pv1.productid = cast(rp1.items as int) group by pv1.productid) i on i.productid = p.productid
          where case p.TrackInventoryBySizeAndColor when 1 then isnull(i.inventory, 0) else pv.inventory end >= @InvFilter
          ) tp on p.productid = tp.productid
where published = 1 and deleted = 0 and p.productid != @productid
	and GETDATE() BETWEEN ISNULL(AvailableStartDate, '1/1/1900') AND ISNULL(AvailableStopDate, '1/1/2999')
    and case 
         when @FilterProductsByCustomerLevel = 0 then 1
         when @CustomerLevelFilteringIsAscending = 1 and pcl.CustomerLevelID <= @CustomerLevelID or pcl.CustomerLevelID is null then 1 
         when @CustomerLevelID=0 and pcl.CustomerLevelID is null then 1
         when @CustomerLevelID is null or @custlevelcount = 0 then 1 
         when pcl.CustomerLevelID = @CustomerLevelID or pcl.CustomerLevelID is null then 1 
         else 0
        end  = 1
UNION ALL	
SELECT pr.ProductID, pr.ProductGUID, pr.ImageFilenameOverride, pr.SKU, pr.SEAltText, pr.Name, pr.Description 
FROM Product pr WITH (NOLOCK)
WHERE pr.ProductID in (
	SELECT TOP 100 PERCENT p.ProductID FROM Product p with (NOLOCK) 
	JOIN 
	(
		SELECT ProductID FROM ProductView with (NOLOCK) WHERE CustomerViewID 
		IN 
		(
		SELECT CustomerViewID FROM ProductView with (NOLOCK)
		WHERE ProductID = @ProductID AND CustomerViewID <> @CustomerViewID		
		)
		AND ProductID <> @ProductID
		AND ProductID NOT 
		IN
		(
		select ProductID 
		from product with (NOLOCK) 
		join split(@relatedprods, ',') rp on productid = cast(rp.items as int) 
		group by ProductID  		
		)
	) a on p.ProductID = a.ProductID
	
	
	LEFT JOIN dbo.productcustomerlevel pcl with (NOLOCK) on p.productid = pcl.productid and @FilterProductsByCustomerLevel = 1
	left join dbo.ProductAffiliate     pa  with (nolock) on p.ProductID = pa.ProductID 	    
	WHERE 
	Published = 1 AND Deleted = 0
	and GETDATE() BETWEEN ISNULL(AvailableStartDate, '1/1/1900') AND ISNULL(AvailableStopDate, '1/1/2999')
	and case 
         when @FilterProductsByCustomerLevel = 0 then 1
         when @CustomerLevelFilteringIsAscending = 1 and pcl.CustomerLevelID <= @CustomerLevelID or pcl.CustomerLevelID is null then 1 
         when @CustomerLevelID=0 and pcl.CustomerLevelID is null then 1
         when @CustomerLevelID is null or @custlevelcount = 0 then 1 
         when pcl.CustomerLevelID = @CustomerLevelID or pcl.CustomerLevelID is null then 1 
         else 0
        end  = 1 
    and (pa.AffiliateID = @affiliateID or pa.AffiliateID is null or @affiliatecount = 0 or @FilterProductsByAffiliate = 0)		
	group by p.ProductID
	order by COUNT(*) desc		
)
)prd on tp.ProductID = prd.ProductID
inner join (select distinct a.ProductID from Product a with (nolock) left join ProductStore b with (nolock) on a.ProductID = b.ProductID where (@filterProduct = 0 or StoreID = @storeID)) ps on tp.ProductID = ps.ProductID
END

IF(@DynamicProductsEnabled = 0 and @DynamicProductsDisplayed > 0)
BEGIN 
select TOP (@DynamicProductsDisplayed) p.ProductID, p.ProductGUID, p.ImageFilenameOverride, p.SKU, p.SEAltText, p.Name, p.Description  
from dbo.product p with (nolock) 
    join dbo.split(@relatedprods, ',') rp on p.productid = cast(rp.items as int) 
    left join dbo.productcustomerlevel pcl with (nolock) on p.productid = pcl.productid and @FilterProductsByCustomerLevel = 1
    join (select p.ProductID
          from dbo.product p  with (nolock)
              join dbo.split(@relatedprods, ',') rp on p.productid = cast(rp.items as int) 
              join (select ProductID, sum(Inventory) Inventory from dbo.productvariant with (nolock) group by ProductID) pv on p.ProductID = pv.ProductID
              left join (select ProductID, sum(quan) inventory from dbo.inventory i1 with (nolock) join dbo.productvariant pv1 with (nolock) on pv1.variantid = i1.variantid join dbo.split(@relatedprods, ',') rp1 on pv1.productid = cast(rp1.items as int) group by pv1.productid) i on i.productid = p.productid
          where case p.TrackInventoryBySizeAndColor when 1 then isnull(i.inventory, 0) else pv.inventory end >= @InvFilter
          ) tp on p.productid = tp.productid
	inner join (select distinct a.ProductID from Product a with (nolock) left join ProductStore b with (nolock) on a.ProductID = b.ProductID where (@filterProduct = 0 or StoreID = @storeID)) ps on p.ProductID = ps.ProductID
where published = 1 and deleted = 0 and p.productid != @productid
and GETDATE() BETWEEN ISNULL(AvailableStartDate, '1/1/1900') AND ISNULL(AvailableStopDate, '1/1/2999')
    and case 
         when @FilterProductsByCustomerLevel = 0 then 1
         when @CustomerLevelFilteringIsAscending = 1 and pcl.CustomerLevelID <= @CustomerLevelID or pcl.CustomerLevelID is null then 1 
         when @CustomerLevelID=0 and pcl.CustomerLevelID is null then 1
         when @CustomerLevelID is null or @custlevelcount = 0 then 1 
         when pcl.CustomerLevelID = @CustomerLevelID or pcl.CustomerLevelID is null then 1 
         else 0
        end  = 1
END


GO

create procedure [dbo].[aspdnsf_SaveTopicMap]
	@TopicID INT,
	@ParentTopicID INT,
	@Map BIT

AS
BEGIN
	-- Add Mapping Information
	if(@map = 1)
	begin
	    if not exists(select * from dbo.TopicMapping where TopicID=@TopicID and ParentTopicID=@ParentTopicID and @TopicID<>@ParentTopicID)
	    begin
			INSERT INTO dbo.TopicMapping(TopicID, ParentTopicID) VALUES (@TopicID, @ParentTopicID)
		end
	end
	-- Remove Mapping Information if any
	else if (@map = 0)
	begin
		DELETE FROM dbo.TopicMapping WHERE TopicID=@TopicID AND ParentTopicID=@ParentTopicID
	end
END

GO


CREATE PROCEDURE [dbo].[aspdnsf_GetRecentlyViewedProducts]
	@productID							int, 
	@CustomerViewID						nvarchar(50),
	@invFilter							int,
	@recentlyViewedProductsNumToDisplay int,
	@storeID							int = 1,
	@filterProduct						bit = 0

      
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	DECLARE @HideProductsWithLessThanThisInventoryLevel int,
			@RecentlyViewedProductsEnabled varchar(10)
	
    -- Insert statements for procedure here
    SELECT @RecentlyViewedProductsEnabled = CASE ConfigValue WHEN 'true' THEN 1 ELSE 0 END FROM dbo.AppConfig WITH (NOLOCK) WHERE Name = 'RecentlyViewedProducts.Enabled'
    SELECT @HideProductsWithLessThanThisInventoryLevel = CONVERT(int, ConfigValue) FROM dbo.AppConfig WITH (NOLOCK) WHERE [Name] = 'HideProductsWithLessThanThisInventoryLevel' AND ISNUMERIC(ConfigValue) = 1
    
    SELECT @RecentlyViewedProductsEnabled = CASE configvalue WHEN 'true' then 1 else 0 end FROM dbo.AppConfig WITH (NOLOCK)WHERE Name = 'RecentlyViewedProducts.Enabled'

    IF (@HideProductsWithLessThanThisInventoryLevel > @invFilter or @HideProductsWithLessThanThisInventoryLevel = -1) and @invFilter <> -1
        SET @invFilter = @HideProductsWithLessThanThisInventoryLevel 
    
    if(@RecentlyViewedProductsEnabled = 1)
    BEGIN
	SELECT TOP (@recentlyViewedProductsNumToDisplay) pv.ProductID, pr.Name,pr.ImageFilenameOverride, pr.SEName,pr.SKU
	FROM ProductView pv WITH (NOLOCK) 
		 INNER JOIN Product pr WITH (NOLOCK) ON pv.ProductID = pr.ProductID 
		 INNER JOIN dbo.productvariant pvt WITH (NOLOCK) ON pv.ProductID = pvt.ProductID and pvt.IsDefault =1   
		 LEFT JOIN (SELECT variantid, SUM(quan) inventory FROM inventory GROUP BY variantid) i ON pvt.variantid = i.variantid 	
		 inner join (select distinct a.ProductID from Product a with (nolock) left join ProductStore b with (nolock) on a.ProductID = b.ProductID where (@filterProduct = 0 or StoreID = @storeID)) ps on pv.ProductID = ps.ProductID
	WHERE @RecentlyViewedProductsEnabled = 1 AND
		  pr.Deleted = 0  AND 
		  pvt.Deleted = 0 AND 
		  pr.published = 1 AND 
		  pvt.published = 1 AND
		  pv.CustomerViewID = @CustomerViewID AND 
	      pv.ProductID <> @productID AND  
	      pr.ProductID <> @productID AND
		  pvt.ProductID <> @productID AND
		  pv.ViewDate <> GETDATE() AND 
		                 GETDATE() BETWEEN ISNULL(pr.AvailableStartDate, '1/1/1900') AND 
		                 ISNULL(pr.AvailableStopDate, '1/1/2999')AND  
		                 (CASE pr.TrackInventoryBySizeAndColor WHEN 1 THEN isnull(i.inventory, 0) 
																	  ELSE pvt.Inventory END >= @InvFilter OR @InvFilter = -1)	
	 
	ORDER BY pv.ViewDate DESC
	END
END


GO


set IDENTITY_INSERT [dbo].Customer ON;
INSERT [dbo].customer(CustomerID,FirstName,LastName,Email,Password,SaltKey,IsAdmin,LocaleSetting, IsRegistered, Over13Checked) values(58639,'Admin','User','admin@aspdotnetstorefront.com','Admin$11',-1,3,'en-US', 1, 1);
set IDENTITY_INSERT [dbo].Customer OFF;
GO

set IDENTITY_INSERT [dbo].Address ON;
INSERT [dbo].Address(AddressID, AddressGUID, CustomerID, NickName, FirstName, LastName, Company, Address1, Address2, Suite, City, State, Zip, Country, ResidenceType, Phone, Email, Deleted, CreatedOn, Crypt) values(1,newid(),58639,'','Admin','User','', '123 Main St', '', '', 'New York', 'NY', '10451', 'United States', 0, '123-456-7890', 'admin@aspdotnetstorefront.com', 0, getdate(), 1);
set IDENTITY_INSERT [dbo].Address OFF;
GO

UPDATE [dbo].customer set BillingAddressID = 1, ShippingAddressID = 1 where CustomerID = 58639
GO


GO


create proc [dbo].[aspdnsf_FindCircularReference]
  
as
SET NOCOUNT ON

DECLARE @categorypath table(catid int, parentID int)
SELECT c1.categoryid into #tmp FROM dbo.category c1 with (nolock) left join [dbo].category c2 with (nolock) on c1.categoryid = c2.ParentCategoryID WHERE c2.ParentCategoryID is null

DECLARE @StartCatID int, @loopCatID int, @prevloopCatID int, @parentCatID int, @catname nvarchar(200)

SELECT top 1 @StartCatID = categoryid from #tmp
WHILE @@rowcount > 0 BEGIN
    SELECT @loopCatID = ParentCategoryID, @catname = [name] from dbo.category with (nolock) WHERE categoryid = @StartCatID
    INSERT @categorypath values(@StartCatID, @loopCatID)
    WHILE @@rowcount > 0 begin
        IF exists (select * from @categorypath where catid = @loopCatID) BEGIN
            INSERT @categorypath select * from @categorypath where catid = @loopCatID
            PRINT 'circular reference found'
            SELECT cp.catid CategoryID, cp.parentID, c.name [Category Name] FROM @categorypath cp join [dbo].category c on cp.catid = c.CategoryID
            PRINT ''
            BREAK
        END

        IF @loopCatID = 0
            BREAK

        SET @prevloopCatID = @loopCatID 
        SELECT @loopCatID = ParentCategoryID, @catname = [name] FROM dbo.category with (nolock) WHERE categoryid = @loopCatID 
        INSERT @categorypath VALUES(@prevloopCatID, @loopCatID)
    end
    DELETE #tmp where categoryid = @StartCatID 
    DELETE @categorypath
    SELECT top 1 @StartCatID = categoryid from #tmp
END

drop table #tmp


GO


CREATE PROCEDURE [dbo].[aspdnsf_SetProfileProperties]    
    @customerid				int,
    @CustomerGUID			UniqueIdentifier,
    @isAuthenticated        bit,
    @PropertyNames          nvarchar(256),
    @PropertyValuesString   nvarchar(256),
    @storeid				int
    
 
AS
BEGIN 
		IF EXISTS (SELECT * FROM profile with (NOLOCK) where CustomerGUID = @CustomerGUID and PropertyName = @PropertyNames and StoreID = @storeid)
		BEGIN 		
			Update profile Set				
				PropertyValueString = @PropertyValuesString,
				UpdatedOn = GETDATE()	
				Where CustomerGUID = @CustomerGUID and PropertyName = @PropertyNames and StoreID = @storeid
		END
		ELSE
		BEGIN
				Insert into profile
				(
				StoreID,
				CustomerID,
				PropertyName,
				CustomerGUID,
				PropertyValueString,
				UpdatedOn		
				)
				Values
				(
				@storeid,		
				@customerid,
				@PropertyNames,
				@CustomerGUID,
				@PropertyValuesString,
				GETDATE()
				)
		END
END

GO


CREATE PROCEDURE [dbo].[aspdnsf_ClearAllImportFlags]
  
as
BEGIN
    SET NOCOUNT ON 
    update [dbo].productvariant set IsImport=0;
    update [dbo].product set IsImport=0;
    update [dbo].manufacturer set IsImport=0;
    update [dbo].category set IsImport=0;
    update [dbo].section set IsImport=0;
    update [dbo].library set IsImport=0;
    update [dbo].Document set IsImport=0;
END


GO


create procEDURE [dbo].[aspdnsf_UndoImport]
  
as
BEGIN
    SET NOCOUNT ON 
    delete from [dbo].customcart where shoppingcartrecid in (select shoppingcartrecid from shoppingcart where productid in (select productid from product where IsImport=1 and IsSystem=0));
    delete from [dbo].kitcart where shoppingcartrecid in (select shoppingcartrecid from shoppingcart where productid in (select productid from product where IsImport=1 and IsSystem=0));
    delete from [dbo].shoppingcart where productid in (select productid from product where IsImport=1 and IsSystem=0);
    delete from [dbo].ProductCategory where productid in (select productid from product where IsImport=1 and IsSystem=0);
    delete from [dbo].ProductSection where productid in (select productid from product where IsImport=1 and IsSystem=0);
    delete from [dbo].ProductAffiliate where productid in (select productid from product where IsImport=1 and IsSystem=0);
    delete from [dbo].ProductCustomerLevel where productid in (select productid from product where IsImport=1 and IsSystem=0);
    delete from [dbo].ProductManufacturer where productid in (select productid from product where IsImport=1 and IsSystem=0);
    delete from [dbo].productvariant where productid in (select productid from product where IsImport=1 and IsSystem=0) or IsImport=1;
    delete from [dbo].kititem where kitgroupid in (select kitgroupid from kitgroup where productid in (select productid from product where IsImport=1 and IsSystem=0));
    delete from [dbo].kitgroup where productid in (select productid from product where IsImport=1 and IsSystem=0);
    delete from [dbo].product where IsImport=1 and IsSystem=0;
    delete from [dbo].manufacturer where IsImport=1;
    delete from [dbo].category where IsImport=1;
    delete from [dbo].section where IsImport=1;
    delete from [dbo].library where IsImport=1;
    delete from [dbo].Document where IsImport=1;
    delete from [dbo].Manufacturer where IsImport=1;
END



GO


create proc [dbo].[aspdnsf_CreateIndexes] 
  
as
BEGIN
CREATE UNIQUE INDEX [UIX_Address_AddressGUID] ON [Address] ([AddressGUID]);
CREATE INDEX [IX_Address_CustomerID] ON [Address]([CustomerID]) ;
CREATE UNIQUE INDEX [UIX_CustomerGiftRegistrySearches_CustomerID_GIftRegistryGUID] ON [CustomerGiftRegistrySearches] ([CustomerID],[GIftRegistryGUID]) ;
CREATE INDEX [IX_Address_Deleted] ON [Address]([Deleted]) ;
CREATE INDEX [IX_AffiliateActivity_AffiliateID] ON [AffiliateActivity]([AffiliateID]) ;
CREATE INDEX [IX_AffiliateActivity_AffiliateID_ActivityDate] ON [AffiliateActivity]([AffiliateID],[ActivityDate]) ;
CREATE INDEX [IX_AffiliateActivityReason_Name] ON [AffiliateActivityReason]([Name]) ;
CREATE INDEX [IX_AffiliateCommissions_RowGUID] ON [AffiliateCommissions]([RowGUID]) ;
CREATE INDEX [IX_AffiliateCommissions_LowValue] ON [AffiliateCommissions]([LowValue]) ;
CREATE INDEX [IX_AffiliateCommissions_HighValue] ON [AffiliateCommissions]([HighValue]) ;
CREATE UNIQUE INDEX [UIX_AppConfig_Name_StoreID] ON [AppConfig] ([Name], [StoreID]);
CREATE INDEX [IX_AppConfig_GroupName] ON [AppConfig]([GroupName]) ;
CREATE UNIQUE INDEX [UIX_StringResource_Name_LocaleSetting] ON [StringResource]([Name],[LocaleSetting]);
CREATE INDEX [IX_BadWord] ON [BadWord]([Word]) ;
CREATE INDEX [IX_Category_Name] ON [Category]([Name]) ;
CREATE INDEX [IX_Category_Deleted] ON [Category]([Deleted]) ;
CREATE INDEX [IX_Category_Published] ON [Category]([Published]) ;
CREATE INDEX [IX_Category_Wholesale] ON [Category]([Wholesale]) ;
CREATE INDEX [IX_Category_CategoryGUID] ON [Category]([CategoryGUID]) ;
CREATE INDEX [IX_Category_ParentCategoryID] ON [Category]([ParentCategoryID]) ;
CREATE INDEX [IX_Category_DisplayOrder] ON [Category]([DisplayOrder]) ;
CREATE INDEX [IX_Category_Deleted_Published] ON [Category]([Deleted],[Published]) ;
CREATE INDEX [IX_Category_Deleted_Wholesale] ON [Category]([Deleted],[Wholesale]) ;
CREATE INDEX [IX_ClickTrack_Name_CreatedOn] ON [ClickTrack]([Name],[CreatedOn]) ;
CREATE UNIQUE INDEX [UIX_Country_Name] ON [Country]([Name]);
CREATE INDEX [IX_Country_DisplayOrder_Name] ON [Country]([DisplayOrder],[Name]) ;
CREATE INDEX [IX_Country_CountryGUID] ON [Country]([CountryGUID]) ;
CREATE INDEX [IX_Country_DisplayOrder] ON [Country]([DisplayOrder]) ;
CREATE UNIQUE INDEX [UIX_Coupon_CouponGUID] ON [Coupon]([CouponGUID]);
CREATE UNIQUE INDEX [UIX_Coupon_CouponCode] ON [Coupon]([CouponCode]);
CREATE INDEX [IX_Coupon_ExpirationDate] ON [Coupon]([ExpirationDate]) ;
CREATE INDEX [IX_Coupon_Deleted] ON [Coupon]([Deleted]) ;
CREATE INDEX [IX_CouponUsage_CustomerID] ON [CouponUsage]([CustomerID]) ;
CREATE INDEX [IX_CouponUsage_CouponCode] ON [CouponUsage]([CouponCode]) ;
CREATE INDEX [IX_CouponUsage_CreatedOn] ON [CouponUsage]([CreatedOn]) ;
CREATE UNIQUE INDEX [UIX_CreditCardTypes] ON [CreditCardType]([CardTypeGUID]);
CREATE INDEX [IX_CreditCardType_CardType] ON [CreditCardType]([CardType]) ;
CREATE UNIQUE INDEX [UIX_Currency_CurrencyGUID] ON [dbo].[Currency]([CurrencyGUID])
CREATE INDEX [IX_CustomCart_VariantID] ON [CustomCart]([VariantID]) ;
CREATE INDEX [IX_CustomCart_CustomerID_ShoppingCartRecID] ON [CustomCart]([CustomerID],[ShoppingCartRecID]) ;
CREATE INDEX [IX_CustomCart_CustomerID_ProductID_VariantID] ON [CustomCart]([CustomerID],[ProductID],[VariantID]) ;
CREATE INDEX [IX_CustomCart_ChosenColor] ON [CustomCart]([ChosenColor]) ;
CREATE INDEX [IX_CustomCart_ChosenSize] ON [CustomCart]([ChosenSize]) ;
CREATE INDEX [IX_CustomCart_ProductID] ON [CustomCart]([ProductID]) ;
CREATE INDEX [IX_CustomCart_CartType] ON [CustomCart]([CartType]) ;
CREATE INDEX [IX_CustomCart_CustomerID_CartType] ON [CustomCart]([CustomerID],[CartType]) ;
CREATE INDEX [IX_CustomCart_CustomerID] ON [CustomCart]([CustomerID]) ;
CREATE INDEX [IX_CustomCart_CustomerID_PackID] ON [CustomCart]([CustomerID],[PackID]) ;
CREATE INDEX [IX_CustomCart_CreatedOn] ON [CustomCart]([CreatedOn]) ;
CREATE UNIQUE INDEX [UIX_Customer_CustomerGUID] ON [Customer]([CustomerGUID]);
CREATE INDEX [IX_Customer_GiftRegistryGUID] ON [Customer]([GiftRegistryGUID]) ;
CREATE INDEX [IX_Customer_GiftRegistryNickName] ON [Customer]([GiftRegistryNickName]) ;
CREATE INDEX [IX_Customer_EMail] ON [Customer]([Email]) ;
CREATE INDEX [IX_Customer_Password] ON [Customer]([Password]) ;
CREATE INDEX [IX_Customer_CustomerLevelID] ON [Customer]([CustomerLevelID]) ;
CREATE INDEX [IX_Customer_IsAdmin] ON [Customer]([IsAdmin]) ;
CREATE INDEX [IX_Customer_OkToEMail] ON [Customer]([OkToEmail]) ;
CREATE INDEX [IX_Customer_Deleted] ON [Customer]([Deleted]) ;
CREATE INDEX [IX_Customer_AffiliateID] ON [Customer]([AffiliateID]) ;
CREATE INDEX [IX_Customer_CouponCode] ON [Customer]([CouponCode]) ;
CREATE INDEX [IX_Customer_CreatedOn] ON [Customer]([CreatedOn]) ;
CREATE INDEX [IX_CustomerLevel_Deleted] ON [CustomerLevel]([Deleted]) ;
CREATE INDEX [IX_CustomerLevel_Name] ON [CustomerLevel]([Name]) ;
CREATE INDEX [IX_CustomerLevel_DisplayOrder] ON [CustomerLevel]([DisplayOrder]) ;
CREATE INDEX [IX_CustomerLevel_DisplayOrder_Name] ON [CustomerLevel]([DisplayOrder],[Name]) ;
CREATE INDEX [IX_CustomerSession_CustomerID] ON [CustomerSession]([CustomerID]) ;
CREATE UNIQUE INDEX [UIX_Distributor_DistributorGUID] ON [Distributor]([DistributorGUID]);
CREATE INDEX [IX_Distributor_DisplayOrder] ON [Distributor]([DisplayOrder]) ;
CREATE INDEX [IX_Distributor_Name] ON [Distributor]([Name]) ;
CREATE INDEX [IX_Distributor_DisplayOrder_Name] ON [Distributor]([DisplayOrder],[Name]) ;
CREATE UNIQUE INDEX [UIX_Document_DocumentGUID] ON [Document]([DocumentGUID]);
CREATE INDEX [IX_Document_Published] ON [Document]([Published]) ;
CREATE INDEX [IX_Document_Wholesale] ON [Document]([Wholesale]) ;
CREATE INDEX [IX_Document_Deleted] ON [Document]([Deleted]) ;
CREATE INDEX [IX_Document_DocumentTypeID] ON [Document]([DocumentTypeID]) ;
CREATE INDEX [IX_Document_Published_Deleted] ON [Document]([Published],[Deleted]) ;
CREATE INDEX [IX_Document_Wholesale_Deleted] ON [Document]([Wholesale],[Deleted]) ;
CREATE INDEX [IX_Document_Name] ON [Document]([Name]) ;
CREATE UNIQUE INDEX [UIX_DocumentLibrary_DocumentID_LibraryID] ON [DocumentLibrary]([DocumentID],[LibraryID]);
CREATE INDEX [IX_DocumentLIbrary_DocumentID] ON [DocumentLibrary]([DocumentID]) ;
CREATE INDEX [IX_DocumentLibrary_LibraryID] ON [DocumentLibrary]([LibraryID]) ;
CREATE INDEX [IX_DocumentType_DocumentTypeGUID] ON [DocumentType]([DocumentTypeGUID]) ;
CREATE INDEX [IX_DocumentType_Name] ON [DocumentType]([Name]) ;
CREATE INDEX [IX_DocumentType_DisplayOrder] ON [DocumentType]([DisplayOrder]) ;
CREATE INDEX [IX_DocumentType_DisplayOrder_Name] ON [DocumentType]([DisplayOrder],[Name]) ;
CREATE UNIQUE INDEX [UIX_EventhHandler] ON [EventHandler] ([EventName]);
CREATE UNIQUE INDEX [UIX_ExtendedPrice_2] ON [ExtendedPrice] ([ExtendedPriceGUID]);
CREATE INDEX [IX_ExtendedPrice_VariantID_CustomerLevelID] ON [ExtendedPrice]([VariantID],[CustomerLevelID]) ;
CREATE INDEX [IX_ExtendedPrice_VariantID] ON [ExtendedPrice]([VariantID]) ;
CREATE INDEX [IX_FailedTransaction_OrderDate] ON [FailedTransaction]([OrderDate]) ;
CREATE INDEX [IX_FailedTransaction_PaymentGateway] ON [FailedTransaction]([PaymentGateway]) ;
CREATE UNIQUE INDEX [UIX_Gallery_GalleryGUID] ON [Gallery] ([GalleryGUID]);
CREATE INDEX [IX_Gallery_DisplayOrder] ON [Gallery]([DisplayOrder]) ;
CREATE INDEX [IX_Gallery_DisplayOrder_Name] ON [Gallery]([DisplayOrder],[Name]) ;
CREATE INDEX [IX_Gallery_Name] ON [Gallery]([Name]) ;
CREATE INDEX [IX_Gallery_Deleted] ON [Gallery]([Deleted]) ;
CREATE UNIQUE INDEX [UIX_Genre_GenreGUID] ON [Genre]([GenreGUID]);
CREATE INDEX [IX_Genre_Name] ON [Genre]([Name]) ;
CREATE INDEX [IX_Genre_DisplayOrder_Name] ON [Genre]([DisplayOrder],[Name]) ;
CREATE UNIQUE INDEX [UIX_Feed_FeedGUID] ON [Feed] ([FeedGUID]);
CREATE INDEX [IX_Feed_DisplayOrder] ON [Feed]([DisplayOrder]) ;
CREATE INDEX [IX_Feed_DisplayOrder_Name] ON [Feed]([DisplayOrder],[Name]) ;
CREATE UNIQUE INDEX [UIX_GiftCard_GiftCardGUID] ON [GiftCard] ([GiftCardGUID]);
CREATE INDEX [IX_GiftCard_SerialNumber] ON [GiftCard]([SerialNumber]) ;
CREATE INDEX [IX_GiftCard_ExpirationDate] ON [GiftCard]([ExpirationDate]) ;
CREATE INDEX [IX_GiftCard_CreatedOn] ON [GiftCard]([CreatedOn]) ;
CREATE INDEX [IX_GiftCard_PurchasedByCustomerID] ON [GiftCard]([PurchasedByCustomerID]) ;
CREATE UNIQUE INDEX [UIX_GiftCardUsage_GiftCardUsageGUID] ON [GiftCardUsage]([GiftCardUsageGUID]);
CREATE INDEX [IX_GiftCardUsage_GiftCardID] ON [GiftCardUsage]([GiftCardID]) ;
CREATE INDEX [IX_GiftCardUsage_UsedByCustomerID] ON [GiftCardUsage]([UsedByCustomerID]) ;
CREATE UNIQUE INDEX [UIX_Inventory_InventoryGUID] ON [Inventory] ([InventoryGUID]);
CREATE INDEX [IX_Inventory_VariantID_Color_Size] ON [Inventory]([VariantID],[Color],[Size]) ;
CREATE INDEX [IX_KitCart_CreatedOn] ON [KitCart]([CreatedOn]) ;
CREATE INDEX [IX_KitCart_ShoppingCartRecID] ON [KitCart]([ShoppingCartRecID]) ;
CREATE INDEX [IX_KitCart_CustomerID_ShoppingCartRecID] ON [KitCart]([CustomerID],[ShoppingCartRecID]) ;
CREATE INDEX [IX_KitCart_ProductID] ON [KitCart]([ProductID]) ;
CREATE INDEX [IX_KitCart_VariantID] ON [KitCart]([VariantID]) ;
CREATE INDEX [IX_KitCart_KitGroupID] ON [KitCart]([KitGroupID]) ;
CREATE INDEX [IX_KitCart_KitItemID] ON [KitCart]([KitItemID]) ;
CREATE UNIQUE INDEX [UIX_KitGroup_KitGroupGUID] ON [KitGroup] ([KitGroupGUID]);
CREATE INDEX [IX_KitGroup_ProductID] ON [KitGroup]([ProductID]) ;
CREATE INDEX [IX_KitGroup_ProductID_DisplayOrder] ON [KitGroup]([ProductID],[DisplayOrder]) ;
CREATE INDEX [IX_KitGroup_DisplayOrder] ON [KitGroup]([DisplayOrder]) ;
CREATE UNIQUE INDEX [UIX_KitGroupType_KitGroupTypeGUID] ON [KitGroupType] ([KitGroupTypeGUID]);
CREATE INDEX [IX_KitGroupType_DisplayOrder] ON [KitGroupType]([DisplayOrder]) ;
CREATE INDEX [IX_KitGroupType_DisplayOrder_Name] ON [KitGroupType]([DisplayOrder],[Name]) ;
CREATE INDEX [IX_KitGroupType_Name] ON [KitGroupType]([Name]) ;
CREATE UNIQUE INDEX [UIX_KitItem_KitItemGUID] ON [KitItem] ([KitItemGUID]);
CREATE INDEX [IX_KitItem_KitGroupID] ON [KitItem]([KitGroupID]) ;
CREATE INDEX [IX_KitItem_KitGroupID_DisplayOrder] ON [KitItem]([KitGroupID],[DisplayOrder]) ;
CREATE INDEX [IX_KitItem_DisplayOrder] ON [KitItem]([DisplayOrder]) ;
CREATE INDEX [IX_KitItem_DisplayOrder_Name] ON [KitItem]([DisplayOrder],[Name]) ;
CREATE INDEX [IX_KitItem_Name] ON [KitItem]([Name]) ;
CREATE INDEX [IX_Library_Deleted] ON [Library]([Deleted]) ;
CREATE INDEX [IX_Library_Published] ON [Library]([Published]) ;
CREATE INDEX [IX_Library_Wholesale] ON [Library]([Wholesale]) ;
CREATE INDEX [IX_Library_LibraryGUID] ON [Library]([LibraryGUID]) ;
CREATE INDEX [IX_Library_ParentLibraryID] ON [Library]([ParentLibraryID]) ;
CREATE INDEX [IX_Library_DisplayOrder] ON [Library]([DisplayOrder]) ;
CREATE INDEX [IX_Library_Deleted_Published] ON [Library]([Deleted],[Published]) ;
CREATE INDEX [IX_Library_Deleted_Wholesale] ON [Library]([Deleted],[Wholesale]) ;
CREATE INDEX [IX_Library_Name] ON [Library]([Name]) ;
CREATE INDEX [IX_Library_DisplayOrder_Name] ON [Library]([DisplayOrder],[Name]) ;
CREATE UNIQUE INDEX [UIX_Locale_LocaleSettingGUID] ON [LocaleSetting] ([LocaleSettingGUID]);
CREATE UNIQUE INDEX [UIX_Locale_Name] ON [LocaleSetting] ([Name]);
CREATE INDEX [IX_Locale_DisplayOrder_Name] ON [LocaleSetting]([DisplayOrder],[Name]) ;
CREATE INDEX [IX_Locale_DisplayOrder] ON [LocaleSetting]([DisplayOrder]) ;
CREATE INDEX [IX_CustomerEvents_CustomerID] ON [LOG_CustomerEvent]([CustomerID]) ;
CREATE INDEX [IX_LOG_CustomerEvents_CustomerID_Timestamp] ON [LOG_CustomerEvent]([CustomerID],[Timestamp]) ;
CREATE INDEX [IX_CustomerEvents_Timestamp] ON [LOG_CustomerEvent]([Timestamp]) ;
CREATE INDEX [IX_CustomerEvents_EventID] ON [LOG_CustomerEvent]([EventID]) ;
CREATE UNIQUE INDEX [UIX_MailingMgrLog_MailingMgrLogGUID] ON [MailingMgrLog] ([MailingMgrLogGUID]);
CREATE INDEX [IX_MailingMgrLog_SentOn_ToEMail] ON [MailingMgrLog]([SentOn],[ToEmail]) ;
CREATE UNIQUE INDEX [UIX_Manufacturer_ManufacturerGUID] ON [Manufacturer] ([ManufacturerGUID]);
CREATE INDEX [IX_Manufacturer_Deleted] ON [Manufacturer]([Deleted]) ;
CREATE INDEX [IX_Manufacturer_DisplayOrder] ON [Manufacturer]([DisplayOrder]) ;
CREATE INDEX [IX_Manufacturer_Name] ON [Manufacturer]([Name]) ;
CREATE INDEX [IX_Manufacturer_DisplayOrder_Name] ON [Manufacturer]([DisplayOrder],[Name]) ;
CREATE UNIQUE INDEX [UIX_News_NewsGUID] ON [News] ([NewsGUID]);
CREATE INDEX [IX_News_ExpiresOn] ON [News]([ExpiresOn] DESC) ;
CREATE INDEX [IX_News_Deleted] ON [News]([Deleted]) ;
CREATE INDEX [IX_News_Published] ON [News]([Published]) ;
CREATE INDEX [IX_News_Wholesale] ON [News]([Wholesale]) ;
CREATE UNIQUE INDEX [UIX_OrderNumbers_OrderNumberGUID] ON [OrderNumbers] ([OrderNumberGUID]);
CREATE INDEX [IX_OrderNumbers_CreatedOn] ON [OrderNumbers]([CreatedOn]) ;
CREATE INDEX [IX_Orders_OrderNumber] ON [Orders]([OrderNumber]) ;
CREATE INDEX [IX_Orders_ParentOrderNumber] ON [Orders]([ParentOrderNumber]) ;
CREATE INDEX [IX_Orders_CustomerID] ON [Orders]([CustomerID]) ;
CREATE INDEX [IX_Orders_OrderNumber_CustomerID] ON [Orders]([OrderNumber],[CustomerID]) ;
CREATE INDEX [IX_Orders_AffiliateID] ON [Orders]([AffiliateID]) ;
CREATE INDEX [IX_Orders_OrderDate] ON [Orders]([OrderDate]) ;
CREATE INDEX [IX_Orders_OrderGUID] ON [Orders]([OrderGUID]) ;
CREATE INDEX [IX_Orders_EMail] ON [Orders]([EMail]) ;
CREATE INDEX [IX_Orders_IsNew] ON [Orders]([IsNew]) ;
CREATE INDEX [IX_Orders_CouponCode] ON [Orders]([CouponCode]) ;
CREATE INDEX [IX_Orders_TransactionState] ON [Orders]([TransactionState]) ;
CREATE CLUSTERED INDEX [IX_Orders_CustomCart_OrderNumber] ON [Orders_CustomCart]([OrderNumber]) ;
CREATE INDEX [IX_Orders_CustomCart_CustomCartRecID] ON [Orders_CustomCart]([CustomCartRecID]) ;
CREATE INDEX [IX_Orders_CustomCart_CustomerID] ON [Orders_CustomCart]([CustomerID]) ;
CREATE INDEX [IX_Orders_CustomCart_ShoppingCartRecID] ON [Orders_CustomCart]([ShoppingCartRecID]) ;
CREATE INDEX [IX_Orders_CustomCart_ProductID_VariantID_ChosenColor_ChosenSize] ON [Orders_CustomCart]([ProductID],[VariantID],[ChosenColor],[ChosenSize]) ;
CREATE INDEX [IX_Orders_CustomCart_CreatedOn] ON [Orders_CustomCart]([CreatedOn]) ;
CREATE INDEX [IX_Orders_CustomCart_ProductSKU] ON [Orders_CustomCart]([ProductSKU]) ;
CREATE CLUSTERED INDEX [IX_Orders_KitCart_OrderNumber] ON [Orders_KitCart]([OrderNumber]) ;
CREATE INDEX [IX_Orders_KitCart_ProductID_VariantID] ON [Orders_KitCart]([ProductID],[VariantID]) ;
CREATE INDEX [IX_Orders_KitCart_CreatedOn] ON [Orders_KitCart]([CreatedOn]) ;
CREATE INDEX [IX_Orders_KitCart_KitCartRecID] ON [Orders_KitCart]([KitCartRecID]) ;
CREATE INDEX [IX_Orders_KitCart_CustomerID] ON [Orders_KitCart]([CustomerID]) ;
CREATE INDEX [IX_Orders_KitCart_ShoppingCartRecID] ON [Orders_KitCart]([ShoppingCartRecID]) ;
CREATE INDEX [IX_Orders_KitCart_KitGroupID] ON [Orders_KitCart]([KitGroupID]) ;
CREATE INDEX [IX_Orders_ShoppingCart_OrderedProductSKU] ON [Orders_ShoppingCart]([OrderedProductSKU]) ;
CREATE INDEX [IX_Orders_ShoppingCart_CustomerID] ON [Orders_ShoppingCart]([CustomerID]) ;
CREATE CLUSTERED INDEX [IX_Orders_ShoppingCart_OrderNumber_CustomerID] ON [Orders_ShoppingCart]([OrderNumber],[CustomerID]) ;
CREATE INDEX [IX_Orders_ShoppingCart_ShoppingCartRecID] ON [Orders_ShoppingCart]([ShoppingCartRecID]) ;
CREATE INDEX [IX_Orders_ShoppingCart_ProductID] ON [Orders_ShoppingCart]([ProductID]) ;
CREATE INDEX [IX_Orders_ShoppingCart_ProductID_VariantID_ChosenColor_ChosenSize] ON [Orders_ShoppingCart]([ProductID],[VariantID],[ChosenColor],[ChosenSize]) ;
CREATE INDEX [IX_Orders_ShoppingCart_CreatedOn] ON [Orders_ShoppingCart]([CreatedOn]) ;
CREATE UNIQUE INDEX [UIX_Partner_PartnerGUID] ON [Partner] ([PartnerGUID]);
CREATE INDEX [IX_Partner_DisplayOrder] ON [Partner]([DisplayOrder]) ;
CREATE INDEX [IX_Partner_DisplayOrder_Name] ON [Partner]([DisplayOrder],[Name]) ;
CREATE INDEX [IX_Partner_Name] ON [Partner]([Name]) ;
CREATE INDEX [IX_Partner_Published] ON [Partner]([Published]) ;
CREATE INDEX [IX_Partner_Wholesale] ON [Partner]([Wholesale]) ;
CREATE INDEX [IX_Partner_Deleted] ON [Partner]([Deleted]) ;
CREATE UNIQUE INDEX [UIX_Poll_PollGUID] ON [Poll] ([PollGUID]);
CREATE INDEX [IX_Poll_DisplayOrder] ON [Poll]([DisplayOrder]) ;
CREATE INDEX [IX_Poll_Name] ON [Poll]([Name]) ;
CREATE INDEX [IX_Poll_DisplayOrder_Name] ON [Poll]([DisplayOrder],[Name]) ;
CREATE INDEX [IX_Poll_Published] ON [Poll]([Published]) ;
CREATE INDEX [IX_Poll_Wholesale] ON [Poll]([Wholesale]) ;
CREATE INDEX [IX_Poll_Deleted] ON [Poll]([Deleted]) ;
CREATE INDEX [IX_Poll_ExpiresOn] ON [Poll]([ExpiresOn]) ;
CREATE UNIQUE INDEX [UIX_PollAnswer_PollAnswerGUID] ON [PollAnswer] ([PollAnswerGUID]);
CREATE INDEX [IX_PollAnswers_PollID_DisplayOrder] ON [PollAnswer]([PollID],[DisplayOrder]) ;
CREATE INDEX [IX_PollAnswer_Deleted] ON [PollAnswer]([Deleted]) ;
CREATE INDEX [IX_PollAnswer_PollID] ON [PollAnswer]([PollID]) ;
CREATE INDEX [IX_PollAnswer_Name] ON [PollAnswer]([Name]) ;
CREATE UNIQUE INDEX [UIX_PollSortOrder_PollSortOrderGUID] ON [PollSortOrder] ([PollSortOrderGUID]);
CREATE INDEX [IX_PollSortOrder_DisplayOrder] ON [PollSortOrder]([DisplayOrder]) ;
CREATE INDEX [IX_PollSortOrder_Name] ON [PollSortOrder]([Name]) ;
CREATE INDEX [IX_PollSortOrder_DisplayOrder_Name] ON [PollSortOrder]([DisplayOrder],[Name]) ;
CREATE UNIQUE INDEX [UIX_PollVotingRecord_PollID_CustomerID] ON [PollVotingRecord] ([PollID],[CustomerID]);
CREATE UNIQUE INDEX [UIX_PollVotingRecord_PollVotingRecordGUID] ON [PollVotingRecord] ([PollVotingRecordGUID]);
CREATE INDEX [IX_PollVotingRecord_PollID] ON [PollVotingRecord]([PollID]) ;
CREATE INDEX [IX_PollVotingRecord_CreatedOn] ON [PollVotingRecord]([CreatedOn]) ;
CREATE UNIQUE INDEX [UIX_Product_ProductGUID] ON [Product] ([ProductGUID]);
CREATE INDEX [IX_Product_SKU] ON [Product]([SKU]) ;
CREATE INDEX [IX_Product_IsImport] ON [Product]([IsImport]) ;
CREATE INDEX [IX_Product_IsSystem] ON [Product]([IsSystem]) ;
CREATE INDEX [IX_Product_Published] ON [Product]([Published]) ;
CREATE INDEX [IX_Product_Wholesale] ON [Product]([Wholesale]) ;
CREATE INDEX [IX_Product_Deleted] ON [Product]([Deleted]) ;
CREATE INDEX [IX_Product_ProductTypeID] ON [Product]([ProductTypeID]) ;
CREATE INDEX [IX_Product_IsAPack] ON [Product]([IsAPack]) ;
CREATE INDEX [IX_Product_IsAKit] ON [Product]([IsAKit]) ;
CREATE INDEX [IX_Product_Name] ON [Product]([Name]) ;
CREATE INDEX [IX_Product_ManufacturerPartNumber] ON [Product]([ManufacturerPartNumber]) ;
CREATE INDEX [IX_Product_Published_Deleted] ON [Product]([Published],[Deleted]) ;
CREATE INDEX [IX_Product_Wholesale_Deleted] ON [Product]([Wholesale],[Deleted]) ;
CREATE INDEX [IX_Product_ProductID] ON [ProductCategory]([ProductID]) ;
CREATE INDEX [IX_Category_CategoryID] ON [ProductCategory]([CategoryID]) ;
CREATE INDEX [IX_ProductType_ProductTypeGUID] ON [ProductType]([ProductTypeGUID]) ;
CREATE INDEX [IX_ProductType_Name] ON [ProductType]([Name]) ;
CREATE INDEX [IX_ProductType_DisplayOrder] ON [ProductType]([DisplayOrder]) ;
CREATE INDEX [IX_ProductType_DisplayOrder_Name] ON [ProductType]([DisplayOrder],[Name]) ;
CREATE UNIQUE INDEX [UIX_ProductVariant_VariantID] ON [ProductVariant] ([VariantGUID]);
CREATE INDEX [IX_ProductVariant_ProductID] ON [ProductVariant]([ProductID]) ;
CREATE INDEX [IX_ProductVariant_SKUSuffix] ON [ProductVariant]([SKUSuffix]) ;
CREATE INDEX [IX_ProductVariant_ManufacturerPartNumber] ON [ProductVariant]([ManufacturerPartNumber]) ;
CREATE INDEX [IX_ProductVariant_Deleted] ON [ProductVariant]([Deleted]) ;
CREATE INDEX [IX_ProductVariant_Published] ON [ProductVariant]([Published]) ;
CREATE INDEX [IX_ProductVariant_Wholesale] ON [ProductVariant]([Wholesale]) ;
CREATE INDEX [IX_ProductVariant_Deleted_Published] ON [ProductVariant]([Deleted],[Published]) ;
CREATE INDEX [IX_ProductVariant_Deleted_Wholesale] ON [ProductVariant]([Deleted],[Wholesale]) ;
CREATE INDEX [IX_ProductVariant_IsDefault] ON [ProductVariant]([IsDefault]) ;
CREATE INDEX [IX_ProductVariant_DisplayOrder] ON [ProductVariant]([DisplayOrder]) ;
CREATE INDEX [IX_ProductVariant_Name] ON [ProductVariant]([Name]) ;
CREATE INDEX [IX_ProductVariant_DisplayOrder_Name] ON [ProductVariant]([DisplayOrder],[Name]) ;
CREATE UNIQUE INDEX [UIX_QuantityDiscount_QuantityDiscountGUID] ON [QuantityDiscount] ([QuantityDiscountGUID]);
CREATE INDEX [IX_QuantityDiscount_DisplayOrder] ON [QuantityDiscount]([DisplayOrder]) ;
CREATE INDEX [IX_QuantityDiscount_DisplayOrder_Name] ON [QuantityDiscount]([DisplayOrder],[Name]) ;
CREATE INDEX [IX_QuantityDiscount_Name] ON [QuantityDiscount]([Name]) ;
CREATE UNIQUE INDEX [UIX_QuantityDiscountTable_QuantityDiscountTableGUID] ON [QuantityDiscountTable] ([QuantityDiscountTableGUID]);
CREATE INDEX [IX_QuantityDiscountTable_QuantityDiscountTableID] ON [QuantityDiscountTable]([QuantityDiscountID]) ;
CREATE INDEX [IX_QuantityDiscountTable_LowQuantity_HighQuantity] ON [QuantityDiscountTable]([LowQuantity],[HighQuantity]) ;
CREATE INDEX [IX_Rating_FoundNotHelpful] ON [Rating]([FoundNotHelpful]) ;
CREATE INDEX [IX_Rating_CreatedOn] ON [Rating]([CreatedOn]) ;
CREATE INDEX [IX_Rating] ON [Rating]([HasComment]) ;
CREATE INDEX [IX_Rating_ProductID] ON [Rating]([ProductID]) ;
CREATE INDEX [IX_Rating_CustomerID] ON [Rating]([CustomerID]) ;
CREATE INDEX [IX_Rating_IsROTD] ON [Rating]([IsROTD]) ;
CREATE INDEX [IX_Rating_FoundHelpful] ON [Rating]([FoundHelpful]) ;
CREATE INDEX [IX_Rating_IsFilthy] ON [Rating]([IsFilthy]) ;
CREATE INDEX [IX_RatingCommentHelpfulness_StoreID] ON [RatingCommentHelpfulness]([StoreID]) ;
CREATE INDEX [IX_RatingCommentHelpfulness_VotingCustomerID] ON [RatingCommentHelpfulness]([VotingCustomerID]) ;
CREATE INDEX [IX_RatingCommentHelpfulness_ProductID] ON [RatingCommentHelpfulness]([ProductID]) ;
CREATE INDEX [IX_RatingCommentHelpfulness_RatingCustomerID] ON [RatingCommentHelpfulness]([RatingCustomerID]) ;
CREATE INDEX [IX_RatingCommentHelpfulness_Helpful] ON [RatingCommentHelpfulness]([Helpful]) ;
CREATE UNIQUE INDEX [UIX_SkinPreview_Name] ON [SkinPreview] ([Name]);
CREATE INDEX [IX_SkinPreview_GroupName] ON [SkinPreview]([GroupName]) ;
CREATE INDEX [IX_SQLLog_ExecutedBy] ON [SQLLog]([ExecutedBy]) ;
CREATE INDEX [IX_SQLLog_ExecutedOn] ON [SQLLog]([ExecutedOn]) ;
CREATE UNIQUE INDEX [UIX_SalesPrompt_SalesPromptGUID] ON [SalesPrompt] ([SalesPromptGUID]);
CREATE INDEX [IX_SalesPrompt_Deleted] ON [SalesPrompt]([Deleted]) ;
CREATE INDEX [IX_SalesPrompt_Name] ON [SalesPrompt]([Name]) ;
CREATE UNIQUE INDEX [UIX_Section_SectionGUID] ON [Section] ([SectionGUID]);
CREATE INDEX [IX_Section_ParentSectionID] ON [Section]([ParentSectionID]) ;
CREATE INDEX [IX_Section_DisplayOrder] ON [Section]([DisplayOrder]) ;
CREATE INDEX [IX_Section_Name] ON [Section]([Name]) ;
CREATE INDEX [IX_Section_DisplayOrder_Name] ON [Section]([DisplayOrder],[Name]) ;
CREATE INDEX [IX_Section_Published] ON [Section]([Published]) ;
CREATE INDEX [IX_Section_Wholesale] ON [Section]([Wholesale]) ;
CREATE INDEX [IX_Section_Deleted] ON [Section]([Deleted]) ;
CREATE INDEX [IX_Section_Deleted_Published] ON [Section]([Deleted],[Published]) ;
CREATE INDEX [IX_Section_Deleted_Wholesale] ON [Section]([Deleted],[Wholesale]) ;
CREATE INDEX [IX_ProductSection_SectionID_DisplayOrder] ON [ProductSection]([SectionID],[DisplayOrder]) ;
CREATE UNIQUE INDEX [UIX_ShippingByProduct_ShippingByProductGUID] ON [dbo].[ShippingByProduct]([ShippingByProductGUID])
CREATE INDEX [IX_ShippingByTotal_ShippingMethodID_LowValue_HighValue] ON [ShippingByTotal]([ShippingMethodID],[LowValue],[HighValue]) ;
CREATE INDEX [IX_ShippingByTotal_RowGUID] ON [ShippingByTotal]([RowGUID]) ;
CREATE INDEX [IX_ShippingByTotalByPercent_ShippingMethodID_LowValue_HighValue] ON [ShippingByTotalByPercent]([ShippingMethodID],[LowValue],[HighValue]) ;
CREATE INDEX [IX_ShippingByTotalByPercent_RowGUID] ON [ShippingByTotalByPercent]([RowGUID]) ;
CREATE INDEX [IX_ShippingByWeight_ShippingMethodID_LowValue_HighValue] ON [ShippingByWeight]([ShippingMethodID],[LowValue],[HighValue]) ;
CREATE INDEX [IX_ShippingByWeight_RowGUID] ON [ShippingByWeight]([RowGUID]) ;
CREATE INDEX [IX_ShippingWeightByZone_RowGUID] ON [ShippingWeightByZone]([RowGUID]) ;
CREATE INDEX [IX_ShippingWeightByZone_ShippingZoneID_LowValue_HighValue] ON [ShippingWeightByZone]([ShippingZoneID],[LowValue],[HighValue]) ;
CREATE INDEX [IX_ShippingTotalByZone_RowGUID] ON [ShippingTotalByZone]([RowGUID]) ;
CREATE INDEX [IX_ShippingTotalByZone_ShippingZoneID_LowValue_HighValue] ON [ShippingTotalByZone]([ShippingZoneID],[LowValue],[HighValue]) ;
CREATE UNIQUE INDEX [UIX_ShippingCalculation_ShippingCalculationID] ON [ShippingCalculation] ([ShippingCalculationGUID]);
CREATE INDEX [IX_ShippingCalculation_DisplayOrder] ON [ShippingCalculation]([DisplayOrder]) ;
CREATE INDEX [IX_ShippingCalculation_Name] ON [ShippingCalculation]([Name]) ;
CREATE INDEX [IX_ShippingCalculation_DisplayOrder_Name] ON [ShippingCalculation]([DisplayOrder],[Name]) ;
CREATE UNIQUE INDEX [UIX_ShippingMethod_ShippingMethodGUID] ON [ShippingMethod] ([ShippingMethodGUID]);
CREATE INDEX [IX_ShippingMethod_IsRTShipping] ON [ShippingMethod]([IsRTShipping]) ;
CREATE INDEX [IX_ShippingMethod_DisplayOrder] ON [ShippingMethod]([DisplayOrder]) ;
CREATE UNIQUE INDEX [UIX_ShippingZone_ShippingZoneGUID] ON [ShippingZone] ([ShippingZoneGUID]);
CREATE INDEX [IX_ShippingZone_DisplayOrder] ON [ShippingZone]([DisplayOrder]) ;
CREATE INDEX [IX_ShippingZone_Deleted] ON [ShippingZone]([Deleted]) ;
CREATE UNIQUE INDEX [UIX_ShoppingCart_ShoppingCartRecGUID] ON [ShoppingCart] ([ShoppingCartRecGUID]);
CREATE INDEX [IX_ShoppingCart_CustomerID] ON [ShoppingCart]([CustomerID]) ;
CREATE INDEX [IX_ShoppingCart_CustomerID_CartType] ON [ShoppingCart]([CustomerID],[CartType]) ;
CREATE INDEX [IX_ShoppingCart_ProductID] ON [ShoppingCart]([ProductID]) ;
CREATE INDEX [IX_ShoppingCart_VariantID] ON [ShoppingCart]([VariantID]) ;
CREATE INDEX [IX_ShoppingCart_ProductID_VariantID_ChosenColor_ChosenSize] ON [ShoppingCart]([ProductID],[VariantID],[ChosenColor],[ChosenSize]) ;
CREATE INDEX [IX_ShoppingCart_CreatedOn] ON [ShoppingCart]([CreatedOn]) ;
CREATE INDEX [IX_ShoppingCart_CartType] ON [ShoppingCart]([CartType]) ;
CREATE INDEX [IX_ShoppingCart_CartType_RecurringSubscriptionID] ON [ShoppingCart]([CartType], [RecurringSubscriptionID]) ;
CREATE INDEX [IX_ShoppingCart_NextRecurringShipDate] ON [ShoppingCart]([NextRecurringShipDate]) ;
CREATE INDEX [IX_ShoppingCart_RecurringIndex] ON [ShoppingCart]([RecurringIndex]) ;
CREATE UNIQUE INDEX [UIX_Staff_StaffGUID] ON [Staff] ([StaffGUID]);
CREATE INDEX [IX_Staff_Name] ON [Staff]([Name]) ;
CREATE INDEX [IX_Staff_DisplayOrder_Name] ON [Staff]([DisplayOrder],[Name]) ;
CREATE INDEX [IX_Staff_DisplayOrder] ON [Staff]([DisplayOrder]) ;
CREATE INDEX [IX_Staff_Deleted] ON [Staff]([Deleted]) ;
CREATE INDEX [IX_Staff_Published] ON [Staff]([Published]) ;
CREATE INDEX [IX_Staff_Wholesale] ON [Staff]([Wholesale]) ;
CREATE UNIQUE INDEX [UIX_State_StateGUID] ON [State] ([StateGUID]);
CREATE UNIQUE INDEX [UIX_State_Country_Abbrv] ON [dbo].[State]([CountryID], [Abbreviation])
CREATE INDEX [IX_State_DisplayOrder] ON [State]([DisplayOrder]) ;
CREATE INDEX [IX_State_Name] ON [State]([Name]) ;
CREATE INDEX [IX_State_DisplayOrder_Name] ON [State]([DisplayOrder],[Name]) ;
CREATE INDEX [IX_State_CountryID] ON [State]([CountryID]) ;
CREATE UNIQUE INDEX [UIX_Topic_TopicGUID] ON [Topic] ([TopicGUID]);
CREATE INDEX [IX_Topic_Deleted] ON [Topic]([Deleted]) ;
CREATE UNIQUE INDEX [UIX_Topic_Name] ON [Topic]([Name]) ;
CREATE INDEX [IX_Topic_ShowInSiteMap] ON [Topic]([ShowInSiteMap]) ;
CREATE CLUSTERED INDEX CIX_PasswordLog on dbo.PasswordLog (CustomerID, ChangeDt)
CREATE UNIQUE INDEX [UIX_ZipTaxRate_ZipCode_TaxClassID_CountryID] ON [ZipTaxRate] (ZipCode,TaxClassID,CountryID)
CREATE UNIQUE INDEX [UIX_StateTaxRate_StateID_TaxClassID] ON [StateTaxRate] (StateID,TaxClassID)
CREATE UNIQUE INDEX [UIX_CountryTaxRate_CountryID_TaxClassID] ON [CountryTaxRate] (CountryID,TaxClassID)
CREATE UNIQUE INDEX [UIX_Vector_VectorGUID] ON [Vector]([VectorGUID]);
CREATE INDEX [IX_Vector_Name] ON [Vector]([Name]) ;
CREATE INDEX [IX_Vector_DisplayOrder_Name] ON [Vector]([DisplayOrder],[Name]) ;
CREATE INDEX [IX_Profile_CustomerGuid] ON [Profile]	([CustomerGUID]) ;
END


GO


CREATE FUNCTION dbo.GetCustomerLevelPrice(@VariantID int, @CustomerLevelID int)
RETURNS decimal(15, 6)
AS
BEGIN
    DECLARE @levelprice money, @LevelDiscountPercent money, @LevelDiscountsApplyToExtendedPrices tinyint
    SELECT @LevelDiscountPercent = LevelDiscountPercent, @LevelDiscountsApplyToExtendedPrices = LevelDiscountsApplyToExtendedPrices FROM dbo.customerlevel with (nolock) WHERE customerlevelid = @CustomerLevelID    

    SELECT @levelprice = case 
                          when @CustomerLevelID = 0 and pv.SalePrice is not null and pv.SalePrice > 0 then pv.SalePrice
                          when e.price is not null and pcl.CustomerLevelID is not null then case when isnull(@LevelDiscountsApplyToExtendedPrices, 0) = 1 and isnull(@LevelDiscountPercent, 0.0) > 0 then (e.price * (100.0-@LevelDiscountPercent))/100.0 else e.price end
                          else case when isnull(@LevelDiscountPercent, 0.0) > 0 then round((pv.Price * (100.0-@LevelDiscountPercent))/100.0, 2) else pv.Price end
                         end
    FROM dbo.ProductVariant pv with (nolock) 
        left join dbo.ExtendedPrice e with (nolock) on pv.VariantID = e.VariantID and e.CustomerLevelID = @CustomerLevelID
        left join ProductCustomerlevel pcl with (nolock) on pv.ProductID = pcl.ProductID and pcl.CustomerLevelID  =@CustomerLevelID
    WHERE pv.VariantID = @VariantID


    RETURN @levelprice
END




GO


CREATE PROCEDURE [dbo].[aspdnsf_GetUpsellProducts]
	@productID			int, 
	@customerlevelID	int,
	@invFilter			int,
	@storeID			int = 1,
	@filterProduct		bit = 0	

      
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @UpsellProducts VARCHAR(8000), 
			@UpsellProductDiscPct MONEY

    SELECT @UpsellProducts = replace(cast(UpsellProducts as varchar(8000)), ' ', ''), @UpsellProductDiscPct = UpsellProductDiscountPercentage from dbo.product with (nolock) where productid = @productid
	
	SELECT 1-(@UpsellProductDiscPct/100) UpsellDiscMultiplier, p.*, pv.VariantID, pv.Price , isnull(pv.SalePrice, 0) SalePrice, isnull(pv.Points, 0) Points, sp.Name SalesPromptName, isnull(ep.price, 0) ExtendedPrice
            from dbo.product p  with (nolock) 
                join dbo.split(@UpsellProducts, ',') up on p.productid = cast(up.items as int)
                left join dbo.SalesPrompt sp  with (nolock) on sp.SalesPromptID = p.SalesPromptID
                join dbo.productvariant pv  with (nolock) on pv.productid = cast(up.items as int) and pv.isdefault = 1 and pv.Published = 1 and pv.Deleted = 0
                left join dbo.ExtendedPrice ep  with (nolock) on ep.VariantID = pv.VariantID and ep.CustomerLevelID = @CustomerLevelID
                join (select p.ProductID
                      from dbo.product p  with (nolock)
                          join dbo.split(@UpsellProducts, ',') rp on p.productid = cast(rp.items as int) 
                          join (select ProductID, sum(Inventory) Inventory from dbo.productvariant with (nolock) group by ProductID) pv on p.ProductID = pv.ProductID
                          left join (select ProductID, sum(quan) inventory from dbo.inventory i1 with (nolock) join dbo.productvariant pv1 with (nolock) on pv1.variantid = i1.variantid join dbo.split(@UpsellProducts, ',') rp1 on pv1.productid = cast(rp1.items as int) group by pv1.productid) i on i.productid = p.productid
                      where case p.TrackInventoryBySizeAndColor when 1 then isnull(i.inventory, 0) else pv.inventory end >= @InvFilter
                      ) tp on p.productid = tp.productid
				inner join (select distinct a.ProductID from Product a with (nolock) left join ProductStore b with (nolock) on a.ProductID = b.ProductID where (@filterProduct = 0 or StoreID = @storeID)) ps on p.ProductID = ps.ProductID
			where p.Published = 1 and p.Deleted = 0 and p.IsCallToOrder = 0 and p.productid != @productid
END


GO


CREATE FUNCTION [dbo].[GetQtyDiscount](@productid int, @Qty int, @discounttype tinyint)
RETURNS decimal(15,6)
AS
BEGIN
    DECLARE @did int, @qtydiscount decimal(15,6)
    SET @did = 0
    SET @qtydiscount = 0

    SELECT @did =  dbo.GetQtyDiscountID(@productid)

    IF @did = 0 
        SET @qtydiscount = 0
    ELSE BEGIN
        SELECT @qtydiscount = qdt.DiscountPercent FROM dbo.QuantityDiscountTable qdt with (nolock) join dbo.QuantityDiscount qd with (nolock) on qdt.QuantityDiscountID = qd.QuantityDiscountID WHERE qd.quantitydiscountid = @did and qdt.LowQuantity <= @Qty and qdt.HighQuantity >= @Qty and qd.DiscountType = @discounttype
    END 

    RETURN @qtydiscount
END 


GO



create proc [dbo].[aspdnsf_AdjustInventory]
    @ordernumber int,
    @direction smallint -- 1 = add items to inventory, -1 = remove from inventory
  
AS
BEGIN
    SET NOCOUNT ON 

    IF @direction <> 1 and @direction <> -1 BEGIN
        RAISERROR('Invalid direction specified', 16, 1)
        RETURN
    END

    DECLARE @InventoryWasReduced int
    SELECT @InventoryWasReduced = InventoryWasReduced FROM dbo.orders with (nolock) WHERE ordernumber = @ordernumber

    IF (@direction = 1 and @InventoryWasReduced = 1) or (@direction = -1 and @InventoryWasReduced = 0) BEGIN

        BEGIN TRAN
            -- update [dbo].Non-Pack Products
            update dbo.Inventory
            SET Quan = Quan + (a.qty*@direction)
            FROM dbo.Inventory i 
                join (select o.variantid, 
                            case when o.ChosenColor is null then '' when charindex('[', o.ChosenColor)>0 then rtrim(left(o.ChosenColor, charindex('[', o.ChosenColor)-1)) else o.ChosenColor end ChosenColor, 
                            case when o.ChosenSize is null then '' when charindex('[', o.ChosenSize)>0 then rtrim(left(o.ChosenSize, charindex('[', o.ChosenSize)-1)) else o.ChosenSize end ChosenSize, 
                            sum(o.Quantity) qty 
                      from dbo.Orders_ShoppingCart o 
                          join dbo.product p on p.ProductID = o.ProductID 
                          join dbo.productvariant pv on o.ProductID = pv.ProductID and o.VariantID = pv.VariantID 
                      where o.ordernumber = @ordernumber and p.TrackInventoryBySizeAndColor = 1 
                      group by o.variantid, 
                            case when o.ChosenColor is null then '' when charindex('[', o.ChosenColor)>0 then rtrim(left(o.ChosenColor, charindex('[', o.ChosenColor)-1)) else o.ChosenColor end , 
                            case when o.ChosenSize is null then '' when charindex('[', o.ChosenSize)>0 then rtrim(left(o.ChosenSize, charindex('[', o.ChosenSize)-1)) else o.ChosenSize end 
                     ) a on i.variantid = a.variantid and isnull(i.size, '') = a.ChosenSize and isnull(i.Color, '') = a.ChosenColor

            IF @@ERROR <> 0 BEGIN
                ROLLBACK TRAN
                RAISERROR('Inventory update failed', 16, 1)
                RETURN
            END
            

            update dbo.ProductVariant
            SET Inventory = Inventory + (a.qty*@direction)
            FROM dbo.ProductVariant pv join [dbo].Product p on pv.productid = p.productid 
                join (select o.variantid, sum(o.Quantity) qty 
                      from dbo.Orders_ShoppingCart o 
                          join dbo.product p on p.ProductID = o.ProductID 
                          join dbo.productvariant pv on o.ProductID = pv.ProductID and o.VariantID = pv.VariantID 
                      where o.ordernumber = @ordernumber and p.TrackInventoryBySizeAndColor = 0
                      group by o.variantid
                     ) a on pv.variantid = a.variantid


            IF @@ERROR <> 0 BEGIN
                ROLLBACK TRAN
                RAISERROR('ProductVariant inventory update failed', 16, 1)
                RETURN
            END



            --update [dbo].Pack Products
            update dbo.Inventory
            SET Quan = Quan + (a.qty*@direction)
            FROM dbo.Inventory i
                join (select o.variantid, 
                            case when o.ChosenColor is null then '' when charindex('[', o.ChosenColor)>0 then rtrim(left(o.ChosenColor, charindex('[', o.ChosenColor)-1)) else o.ChosenColor end ChosenColor, 
                            case when o.ChosenSize is null then '' when charindex('[', o.ChosenSize)>0 then rtrim(left(o.ChosenSize, charindex('[', o.ChosenSize)-1)) else o.ChosenSize end ChosenSize, 
                            sum(o.Quantity) qty 
                      from dbo.Orders_CustomCart o 
                          join dbo.Orders_ShoppingCart sc on sc.ShoppingCartRecID = o.ShoppingCartRecID
                          join dbo.product p on p.ProductID = o.ProductID 
                          join dbo.productvariant pv on o.ProductID = pv.ProductID and o.VariantID = pv.VariantID 
                      where o.ordernumber = @ordernumber and p.TrackInventoryBySizeAndColor = 1 
                      group by o.variantid, 
                            case when o.ChosenColor is null then '' when charindex('[', o.ChosenColor)>0 then rtrim(left(o.ChosenColor, charindex('[', o.ChosenColor)-1)) else o.ChosenColor end , 
                            case when o.ChosenSize is null then '' when charindex('[', o.ChosenSize)>0 then rtrim(left(o.ChosenSize, charindex('[', o.ChosenSize)-1)) else o.ChosenSize end 
                     ) a on i.variantid = a.variantid and isnull(i.size, '') = a.ChosenSize and isnull(i.Color, '') = a.ChosenColor


            IF @@ERROR <> 0 BEGIN
                ROLLBACK TRAN
                RAISERROR('Inventory update failed', 16, 1)
                RETURN
            END


            update dbo.ProductVariant
            SET Inventory = Inventory + (a.qty*@direction)
            FROM dbo.ProductVariant pv join [dbo].Product p on pv.productid = p.productid 
                join (select o.variantid, sum(o.Quantity*sc.Quantity) qty 
             from dbo.Orders_CustomCart o 
                          join dbo.Orders_ShoppingCart sc on sc.ShoppingCartRecID = o.ShoppingCartRecID
                          join dbo.product p on p.ProductID = o.ProductID 
                          join dbo.productvariant pv on o.ProductID = pv.ProductID and o.VariantID = pv.VariantID 
                      where o.ordernumber = @ordernumber and p.TrackInventoryBySizeAndColor = 0
                      group by o.variantid
                     ) a on pv.variantid = a.variantid


            IF @@ERROR <> 0 BEGIN
                ROLLBACK TRAN
                RAISERROR('ProductVariant inventory update failed', 16, 1)
                RETURN
            END


            --Update Inventory of inventoryable kititems
            UPDATE dbo.Inventory
            SET Quan = Quan + (a.qty*@direction)
            FROM dbo.Inventory i
                join (select o.InventoryVariantID variantid, 
                            case when o.InventoryVariantColor is null then '' when charindex('[', o.InventoryVariantColor)>0 then rtrim(left(o.InventoryVariantColor, charindex('[', o.InventoryVariantColor)-1)) else o.InventoryVariantColor end ChosenColor, 
                            case when o.InventoryVariantSize is null then '' when charindex('[', o.InventoryVariantSize)>0 then rtrim(left(o.InventoryVariantSize, charindex('[', o.InventoryVariantSize)-1)) else o.InventoryVariantSize end ChosenSize, 
                            sum(o.Quantity) qty 
                      from dbo.Orders_KitCart o 
                          join dbo.Orders_ShoppingCart sc on sc.ShoppingCartRecID = o.ShoppingCartRecID
                          join dbo.product p on p.ProductID = o.ProductID 
                          join dbo.productvariant pv on o.ProductID = pv.ProductID and o.VariantID = pv.VariantID 
                      where o.ordernumber = @ordernumber and p.TrackInventoryBySizeAndColor = 1 
                      group by o.InventoryVariantID, 
                            case when o.InventoryVariantColor is null then '' when charindex('[', o.InventoryVariantColor)>0 then rtrim(left(o.InventoryVariantColor, charindex('[', o.InventoryVariantColor)-1)) else o.InventoryVariantColor end , 
                            case when o.InventoryVariantSize is null then '' when charindex('[', o.InventoryVariantSize)>0 then rtrim(left(o.InventoryVariantSize, charindex('[', o.InventoryVariantSize)-1)) else o.InventoryVariantSize end  
                     ) a on i.variantid = a.variantid and isnull(i.size, '') = a.ChosenSize and isnull(i.Color, '') = a.ChosenColor

            IF @@ERROR <> 0 BEGIN
                ROLLBACK TRAN
                RAISERROR('KitItem Inventory update failed', 16, 1)
                RETURN
            END


            update dbo.ProductVariant
            SET Inventory = Inventory + (a.qty*@direction)
            FROM dbo.ProductVariant pv join [dbo].Product p on pv.productid = p.productid 
                join (select o.InventoryVariantID variantid, sum(o.Quantity*sc.Quantity) qty 
                      from dbo.Orders_KitCart o 
                          join dbo.Orders_ShoppingCart sc on sc.ShoppingCartRecID = o.ShoppingCartRecID
                          join dbo.product p on p.ProductID = o.ProductID 
                          join dbo.productvariant pv on o.ProductID = pv.ProductID and o.VariantID = pv.VariantID 
                      where o.ordernumber = @ordernumber and p.TrackInventoryBySizeAndColor = 0
                      group by o.InventoryVariantID
                     ) a on pv.variantid = a.variantid


            IF @@ERROR <> 0 BEGIN
                ROLLBACK TRAN
                RAISERROR('KitItem ProductVariant inventory update failed', 16, 1)
                RETURN
            END

            UPDATE dbo.orders SET InventoryWasReduced = case @direction when 1 then 0 when -1 then 1 else InventoryWasReduced end WHERE ordernumber = @ordernumber

        COMMIT TRAN

    END

END


GO


set IDENTITY_INSERT [dbo].DocumentType ON;
INSERT [dbo].DocumentType(DocumentTypeID,Name) values(1,'Plain Text');
INSERT [dbo].DocumentType(DocumentTypeID,Name) values(2,'HTML');
INSERT [dbo].DocumentType(DocumentTypeID,Name) values(3,'PDF File');
INSERT [dbo].DocumentType(DocumentTypeID,Name) values(4,'Scanned Image Set');
set IDENTITY_INSERT [dbo].DocumentType OFF;


GO


CREATE FUNCTION [dbo].[GetIndexColumns] 
( 
    @table_name SYSNAME, 
    @object_id INT, 
    @index_id TINYINT 
) 
RETURNS NVARCHAR(4000) 
AS 
BEGIN 
    DECLARE 
        @colnames NVARCHAR(4000),  
        @thisColID INT, 
        @thisColName SYSNAME 
         
    SET @colnames = INDEX_COL(@table_name, @index_id, 1) 
        + dbo.GetIndexColumnOrder(@object_id, @index_id, 1) 
 
    SET @thisColID = 2 
    SET @thisColName = INDEX_COL(@table_name, @index_id, @thisColID) 
        + dbo.GetIndexColumnOrder(@object_id, @index_id, @thisColID) 
 
    WHILE (@thisColName IS NOT NULL) 
    BEGIN 
        SET @thisColID = @thisColID + 1 
        SET @colnames = @colnames + ', ' + @thisColName 
 
        SET @thisColName = INDEX_COL(@table_name, @index_id, @thisColID) 
            + dbo.GetIndexColumnOrder(@object_id, @index_id, @thisColID) 
    END 
    RETURN @colNames 
END 

GO


create function dbo.ExchangeRate(@CurrencyCode varchar(3))
RETURNS money
AS
BEGIN
    declare @SourceExchangerate money, @TargetExchangerate money, @Exchangerate money, @StoreBaseCurrency varchar(3)
    select @StoreBaseCurrency = ConfigValue from dbo.Appconfig with (nolock) where [name] = 'Localization.StoreCurrency'
    select @TargetExchangerate = ExchangeRate from dbo.currency with (nolock) where CurrencyCode = @CurrencyCode
    select @SourceExchangerate = ExchangeRate from dbo.currency with (nolock) where CurrencyCode = @StoreBaseCurrency
    if @SourceExchangerate is null or @SourceExchangerate = 0 or @TargetExchangerate is null or @TargetExchangerate = 0
        set @exchangerate = 1
    else
        set @exchangerate = @TargetExchangerate/@SourceExchangerate

    RETURN @exchangerate
END


GO



CREATE PROCEDURE [dbo].[aspdnsf_getKitItems] (
	@ProductID int,
    @CartRecID int,
	@CustomerID int)
  
AS
BEGIN
	SET NOCOUNT ON	
	SELECT
			p.[Name]		 AS ProductName,
			ki.KitItemID,
			kg.KitGroupID,
			kg.ProductID,
			ki.[Name]        AS ItemName,
			ki.[Description] AS ItemDescription,
			ki.PriceDelta    AS ItemPriceDelta,
			ki.WeightDelta   AS ItemWeightDelta, 
			ki.IsDefault,	
			ki.DisplayOrder,	
			ki.InventoryVariantID,
			ki.InventoryQuantityDelta,
			ki.InventoryVariantColor,
			ki.InventoryVariantSize,			
			CAST( (CASE WHEN ki.IsDefault = 1 THEN 1 ELSE 0 END ) AS BIT) AS IsSelected,
			CASE	WHEN   kc.KitItemID IS NOT NULL THEN kc.TextOption       			
					ELSE ''
			END AS TextOption,
			kg.[Name]		 AS GroupName,
			kg.[Description] AS GroupDescription,
			kg.Summary AS GroupSummary,
			kg.DisplayOrder	 AS GroupDisplayOrder,
			kg.IsRequired,
			kg.IsReadOnly,
			kgt.KitGroupTypeID AS SelectionControl
    FROM KitItem      ki  with (nolock) 
    JOIN KitGroup     kg  with (nolock) ON kg.KitGroupID=ki.KitGroupID 
    JOIN KitGroupType kgt with (nolock) ON kgt.KitGroupTypeID=kg.KitGroupTypeID
	JOIN Product	  p   with (nolock) ON p.IsAKit = 1 AND kg.ProductId = p.ProductId
    LEFT JOIN KitCart kc  with (nolock) ON ( kc.KitItemID = ki.KitItemID AND kc.KitGroupID = ki.KitGroupID 
                                                  AND kc.ProductID = kg.ProductID  
                                                  AND kc.CustomerID = @CustomerID 
                                                  AND kc.ShoppingCartrecID = @CartRecID AND kc.ShoppingCartrecID <> 0)  
    WHERE	p.ProductID=@ProductID 	
    ORDER BY kg.DisplayOrder ASC, ki.DisplayOrder ASC, ki.[Name]

END


GO



create procedure [dbo].[aspdnsf_SaveKitGroup] (
	@KitGroupID int,
	@Name nvarchar(400),
	@Description ntext,
	@Summary ntext,
	@ProductID int,
	@DisplayOrder int,
	@KitGroupTypeID int,
	@IsRequired bit,
	@IsReadOnly bit,
	@SavedID int OUTPUT)
 
AS
BEGIN
	IF(EXISTS(SELECT * FROM KitGroup WITH (NOLOCK) WHERE KitGroupID = @KitGroupID))
	BEGIN
		UPDATE KitGroup SET
			[Name] = @Name,
			Description = @Description,
			Summary = @Summary,
			ProductID = @ProductID,
			DisplayOrder = @DisplayOrder,
			KitGroupTypeID = @KitGroupTypeID,
			IsRequired = @IsRequired,
			IsReadOnly = @IsReadOnly
		WHERE KitGroupID = @KitGroupID
		
		SET @SavedID = @KitGroupID
		
	END
	ELSE
	BEGIN
		INSERT INTO KitGroup(
			KitGroupGUID,
			[Name],
			Description,
			Summary,
			ProductID,
			DisplayOrder,
			KitGroupTypeID,
			IsRequired,
			IsReadOnly,
			CreatedOn)
		VALUES (
			newid(),
			@Name,
			@Description,
			@Summary,
			@ProductID,
			@DisplayOrder,
			@KitGroupTypeID,
			@IsRequired,
			@IsReadOnly,
			getdate())

		SET @SavedID = @@Identity
	END
END


GO


create procedure [dbo].[aspdnsf_SaveKitItem](
	@KitItemID int,
	@KitGroupID int,
	@Name nvarchar(400),
	@Description ntext,	
	@PriceDelta money,
	@WeightDelta money,
	@IsDefault bit,
	@DisplayOrder int,
	@InventoryVariantID int,
	@InventoryQuantityDelta int,
	@InventoryVariantColor nvarchar(100),
	@InventoryVariantSize nvarchar(100),
	@SavedID int OUTPUT
)
 
AS
BEGIN

	IF EXISTS(SELECT * FROM KitItem WITH(NOLOCK) WHERE KitItemId = @KitItemId )
	BEGIN
		UPDATE KitItem SET
			KitGroupID = @KitGroupID,
			[Name] = @Name,
			Description = @Description,
			PriceDelta = @PriceDelta,
			WeightDelta = @WeightDelta,
			IsDefault = @IsDefault,
			DisplayOrder = @DisplayOrder,
			InventoryVariantID = @InventoryVariantID,
			InventoryQuantityDelta = @InventoryQuantityDelta,
			InventoryVariantColor = @InventoryVariantColor,
			InventoryVariantSize = @InventoryVariantSize
		WHERE KitItemID = @KitItemID

		SET @SavedID = @KitItemId		
	END
	ELSE
	BEGIN

		INSERT INTO KitItem( KitItemGUID,
			KitGroupID,
			[Name],
			Description,
			PriceDelta,
			WeightDelta,
			IsDefault,
			DisplayOrder,
			InventoryVariantID,
			InventoryQuantityDelta,
			InventoryVariantColor,
			InventoryVariantSize,
			CreatedOn)
		VALUES ( newid(),
			@KitGroupID,
			@Name,
			@Description,
			@PriceDelta,
			@WeightDelta,
			@IsDefault,
			@DisplayOrder,
			@InventoryVariantID,
			@InventoryQuantityDelta,
			@InventoryVariantColor,
			@InventoryVariantSize,
			getdate() )

		SET @SavedID = @@Identity

	END

END 



GO


CREATE FUNCTION dbo.KitPriceDelta(@CustomerID int, @ProductID int, @ShoppingCartRecID int)
RETURNS decimal(15, 6)
AS
BEGIN
    DECLARE @deltaprice money

    SELECT @deltaprice = sum(quantity*pricedelta) 
    FROM dbo.kitcart kc with (NOLOCK)  join dbo.kititem ki with (NOLOCK) on kc.kititemid = ki.kititemid 
    WHERE CustomerID = @CustomerID and ProductID = @ProductID and ShoppingCartRecid = @ShoppingCartRecID

    RETURN @deltaprice
END



GO


CREATE FUNCTION dbo.KitWeightDelta(@CustomerID int, @ProductID int, @ShoppingCartRecID int)
RETURNS money
AS
BEGIN
    DECLARE @deltaweight money

    SELECT @deltaweight = sum(quantity*weightdelta) 
    FROM dbo.kitcart kc with (NOLOCK)  join dbo.kititem ki with (NOLOCK) on kc.kititemid = ki.kititemid 
    WHERE CustomerID = @CustomerID and ProductID = @ProductID and ShoppingCartRecid = @ShoppingCartRecID

    RETURN @deltaweight

END

GO


set IDENTITY_INSERT [dbo].KitGroupType ON;
INSERT [dbo].KitGroupType(KitGroupTypeID,Name,DisplayOrder) values(1,'Single Select Dropdown List',1);
INSERT [dbo].KitGroupType(KitGroupTypeID,Name,DisplayOrder) values(2,'Single Select Radio List',2);
INSERT [dbo].KitGroupType(KitGroupTypeID,Name,DisplayOrder) values(3,'Multi Select Checkbox',3);
INSERT [dbo].KitGroupType(KitGroupTypeID,Name,DisplayOrder) values(4,'Textbox',4)
INSERT [dbo].KitGroupType(KitGroupTypeID,Name,DisplayOrder) values(5,'Text Area',5)
INSERT [dbo].KitGroupType(KitGroupTypeID,Name,DisplayOrder) values(6,'File Upload',7)
set IDENTITY_INSERT [dbo].KitGroupType OFF;


GO


create proc [dbo].[aspdnsf_getStringresource]
    @StringResourceID int = null
  
AS
SET NOCOUNT ON 


SELECT StoreId, StringResourceID, StringResourceGUID, Name, LocaleSetting, ConfigValue, CreatedOn, Modified
FROM dbo.Stringresource with (nolock) 
WHERE StringResourceID = COALESCE(@StringResourceID, StringResourceID)




GO


create proc [dbo].[aspdnsf_insStringresource]
    @Name nvarchar(100),
    @LocaleSetting nvarchar(10),
    @ConfigValue nvarchar(2500),
	@StoreId int,
    @StringResourceID int OUTPUT
  
AS
SET NOCOUNT ON 

if exists (select * FROM dbo.Stringresource with (nolock) where StoreId = @StoreId and [Name] = @Name and LocaleSetting = @LocaleSetting) begin
    set @StringResourceID = -1
end
else begin
    insert dbo.Stringresource(StoreId, StringResourceGUID, Name, LocaleSetting, ConfigValue, CreatedOn, Modified)
    values (@StoreId, newid(), @Name, @LocaleSetting, @ConfigValue, getdate(), 0)

    set @StringResourceID = @@identity
end 

 

GO


create proc [dbo].[aspdnsf_updStringresource]
    @StringResourceID int,
	@StoreId int,
    @Name nvarchar(100),
    @LocaleSetting nvarchar(10),
    @ConfigValue nvarchar(2500)
  
AS
SET NOCOUNT ON 


UPDATE dbo.Stringresource
SET 
	StoreId = COALESCE(@StoreId, StoreId),
    Name = COALESCE(@Name, Name),
    LocaleSetting = COALESCE(@LocaleSetting, LocaleSetting),
    ConfigValue = COALESCE(@ConfigValue, ConfigValue),
    Modified = 1
WHERE StringResourceID = @StringResourceID



GO


-- setup countries. We force US to be CountryID 1, and Canada to be CountryID 2 to setup states/provices below.
set IDENTITY_INSERT [dbo].Country ON;
INSERT [dbo].Country(CountryID,Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values(1,'United States','US','USA','840',1);
INSERT [dbo].Country(CountryID,Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values(2,'Canada','CA','CAN','124',2);
set IDENTITY_INSERT [dbo].Country OFF;
GO

-- INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Afghanistan','AF','AFG','004',2);
-- INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Albania','AL','ALB','008',2);
-- INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Algeria','DZ','DZA','012',2);
-- INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('American Samoa','AS','ASM','016',2);
-- INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Andorra','AD','AND','020',2);
-- INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Angola','AO','AGO','024',2);
-- INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Anguilla','AI','AIA','660',2);
-- INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Antarctica','AQ','ATA','010',2);
-- INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Antigua and Barbuda','AG','ATG','028',2);
   INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Argentina','AR','ARG','032',2);
   INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Armenia','AM','ARM','051',2);
   INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Aruba','AW','ABW','533',2);
   INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Australia','AU','AUS','036',2);
   INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Austria','AT','AUT','040',2);
   INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Azerbaijan','AZ','AZE','031',2);
   INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Bahamas','BS','BHS','044',2);
-- INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Bahrain','BH','BHR','048',2);
   INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Bangladesh','BD','BGD','050',2);
-- INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Barbados','BB','BRB','052',2);
   INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Belarus','BY','BLR','112',2);
   INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Belgium','BE','BEL','056',2);
   INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Belize','BZ','BLZ','084',2);
-- INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Benin','BJ','BEN','204',2);
   INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Bermuda','BM','BMU','060',2);
-- INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Bhutan','BT','BTN','064',2);
   INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Bolivia','BO','BOL','068',2);
   INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Bosnia and Herzegowina','BA','BIH','070',2);
-- INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Botswana','BW','BWA','072',2);
-- INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Bouvet Island','BV','BVT','074',2);
   INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Brazil','BR','BRA','076',2);
-- INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('British Indian Ocean Territory','IO','IOT','086',2);
-- INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Brunei Darussalam','BN','BRN','096',2);
   INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Bulgaria','BG','BGR','100',2);
-- INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Burkina Faso','BF','BFA','854',2);
-- INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Burundi','BI','BDI','108',2);
-- INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Cambodia','KH','KHM','116',2);
-- INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Cape Verde','CV','CPV','13',2);
   INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Cayman Islands','KY','CYM','136',2);
-- INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Central African Republic','CF','CAF','140',2);
-- INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Chad','TD','TCD','148',2);
   INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder,PostalCodeRequired) values('Chile','CL','CHL','152',2,0);
   INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('China','CN','CHN','156',2);
-- INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Christmas Island','CX','CXR','162',2);
-- INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Cocos (Keeling) Islands','CC','CCK','166',2);
   INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder,PostalCodeRequired) values('Colombia','CO','COL','170',2,0);
-- INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Comoros','KM','COM','174',2);
-- INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Congo','CG','COG','178',2);
-- INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Congo, the Democratic Republic of the','CD','COD','180',2);
-- INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Cook Islands','CK','COK','184',2);
   INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Costa Rica','CR','CRI','188',2);
-- INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Cote d''Ivoire','CI','CIV','384',2);
   INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Croatia (local Name: Hrvatska)','HR','HRV','191',2);
   INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Cuba','CU','CUB','192',2);
   INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Cyprus','CY','CYP','196',2);
   INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Czech Republic','CZ','CZE','203',2);
   INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Denmark','DK','DNK','208',2);
-- INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Djibouti','DJ','DJI','262',2);
-- INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Dominica','DM','DMA','212',2);
   INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Dominican Republic','DO','DOM','214',2);
-- INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('East Timor','TP','TMP','626',2);
   INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Ecuador','EC','ECU','218',2);
   INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Egypt','EG','EGY','818',2);
-- INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('El Salvador','SV','SLV','222',2);
-- INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Estonia', 'EE', 'EST', '223', 2);
-- INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Falkland Islands (Malvinas)','FK','FLK','238',2);
-- INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Faroe Islands','FO','FRO','234',2);
-- INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Fiji','FJ','FJI','242',2);
   INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Finland','FI','FIN','246',2);
   INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('France','FR','FRA','250',2);
-- INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('France, Metropolitan','FX','FXX','249',2);
-- INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('French Guiana','GF','GUF','254',2);
-- INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('French Polynesia','PF','PYF','258',2);
-- INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('French Southern Territories','TF','ATF','260',2);
-- INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Gabon','GA','GAB','266',2);
-- INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Gambia','GM','GMB','270',2);
   INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Georgia','GE','GEO','268',2);
   INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Germany','DE','DEU','276',2);
-- INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Ghana','GH','GHA','288',2);
   INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Gibraltar','GI','GIB','292',2);
   INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Greece','GR','GRC','300',2);
-- INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Greenland','GL','GRL','304',2);
-- INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Grenada','GD','GRD','308',2);
-- INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Guadeloupe','GP','GLP','312',2);
-- INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Guam','GU','GUM','316',2);
   INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Guatemala','GT','GTM','320',2);
-- INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Guinea','GN','GIN','324',2);
-- INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Guinea-Bissau','GW','GNB','624',2);
-- INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Guyana','GY','GUY','328',2);
-- INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Haiti','HT','HTI','332',2);
-- INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Heard and Mc Donald Islands','HM','HMD','334',2);
-- INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Holy see (Vatican City State)','VA','VAT','336',2);
-- INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Honduras','HN','HND','340',2);
   INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Hong Kong','HK','HKG','344',2);
   INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Hungary','HU','HUN','348',2);
-- INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Iceland','IS','ISL','352',2);
   INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('India','IN','IND','356',2);
   INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Indonesia','ID','IDN','360',2);
-- INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Iran (Islamic Republic of)','IR','IRN','364',2);
-- INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Iraq','IQ','IRQ','368',2);
   INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder, PostalCodeRequired) values('Ireland','IE','IRL','372',2,0);
   INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Israel','IL','ISR','376',2);
   INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Italy','IT','ITA','380',2);
   INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Jamaica','JM','JAM','388',2);
   INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Japan','JP','JPN','392',2);
   INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Jordan','JO','JOR','400',2);
   INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Kazakhstan','KZ','KAZ','398',2);
-- INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Kenya','KE','KEN','404',2);
-- INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Kiribati','KI','KIR','296',2);
   INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Korea, Democratic People''s Republic of','KP','PRK','408',2);
-- INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Korea, Republic of','KR','KOR','410',2);
   INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Kuwait','KW','KWT','414',2);
-- INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Kyrgyzstan','KG','KGZ','417',2);
-- INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Lao People''s Democratic Republic','LA','LAO','418',2);
-- INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Latvia','LV','LVA','428',2);
-- INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Lebanon','LB','LBN','422',2);
-- INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Lesotho','LS','LSO','426',2);
-- INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Liberia','LR','LBR','430',2);
-- INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Libyan Arab Jamahiriya','LY','LBY','434',2);
-- INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Liechtenstein','LI','LIE','438',2);
-- INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Lithuania','LT','LTU','440',2);
-- INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Luxembourg','LU','LUX','442',2);
-- INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Macau','MO','MAC','446',2);
-- INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Macedonia, the former Yugoslav Republic of','MK','MKD','807',2);
-- INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Madagascar','MG','MDG','400',2);
-- INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Malawi','MW','MWI','454',2);
   INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Malaysia','MY','MYS','458',2);
-- INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Maldives','MV','MDV','462',2);
-- INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Mali','ML','MLI','466',2);
-- INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Malta','MT','MLT','470',2);
-- INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Marshall Islands','MH','MHL','584',2);
-- INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Martinique','MQ','MTQ','474',2);
-- INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Mauritania','MR','MRT','478',2);
-- INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Mauritius','MU','MUS','480',2);
-- INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Mayotte','YT','MYT','175',2);
   INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Mexico','MX','MEX','484',2);
-- INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Micronesia, Federated States of','FM','FSM','583',2);
-- INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Moldova, Republic of','MD','MDA','498',2);
-- INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Monaco','MC','MCO','492',2);
-- INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Mongolia','MN','MNG','496',2);
-- INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Montserrat','MS','MSR','500',2);
-- INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Morocco','MA','MAR','504',2);
-- INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Mozambique','MZ','MOZ','508',2);
-- INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Myanmar','MM','MMR','104',2);
-- INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Namibia','NA','NAM','516',2);
-- INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Nauru','NR','NRU','520',2);
-- INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Nepal','NP','NPL','524',2);
   INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Netherlands','NL','NLD','528',2);
-- INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Netherlands Antilles','AN','ANT','530',2);
-- INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('New Caledonia','NC','NCL','540',2);
   INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('New Zealand','NZ','NZL','554',2);
-- INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Nicaragua','NI','NIC','558',2);
-- INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Niger','NE','NER','562',2);
-- INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Nigeria','NG','NGA','566',2);
-- INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Niue','NU','NIU','570',2);
-- INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Norfolk Island','NF','NFK','574',2);
-- INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Northern Mariana Islands','MP','MNP','580',2);
   INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Norway','NO','NOR','578',2);
-- INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Oman','OM','OMN','512',2);
   INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Pakistan','PK','PAK','586',2);
-- INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Palau','PW','PLW','585',2);
-- INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Palestinian Territory','PS','PSE','275',2);
-- INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Panama','PA','PAN','591',2);
-- INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Papua New Guinea','PG','PNG','598',2);
   INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Paraguay','PY','PRY','600',2);
   INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Peru','PE','PER','604',2);
   INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Philippines','PH','PHL','608',2);
-- INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Pitcairn','PN','PCN','612',2);
   INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Poland','PL','POL','616',2);
   INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Portugal','PT','PRT','620',2);
   INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Puerto Rico','PR','PRI','630',2);
   INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Qatar','QA','QAT','634',2);
-- INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Reunion','RE','REU','638',2);
   INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Romania','RO','ROM','642',2);
   INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Russia','RU','RUS','643',2);
-- INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Rwanda','RW','RWA','646',2);
-- INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Saint Kitts and Nevis','KN','KNA','659',2);
-- INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Saint Lucia','LC','LCA','662',2);
-- INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Saint Vincent and the Grenadines','VC','VCT','670',2);
-- INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Samoa','WS','WSM','882',2);
-- INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('San Marino','SM','SMR','674',2);
-- INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Sao Tome and Principe','ST','STP','678',2);
   INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Saudi Arabia','SA','SAU','682',2);
-- INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Senegal','SN','SEN','686',2);
-- INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Seychelles','SC','SYC','690',2);
-- INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Sierra Leone','SL','SLE','694',2);
   INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Singapore','SG','SGP','702',2);
   INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Slovakia (Slovak Republic)','SK','SVK','703',2);
   INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Slovenia','SI','SVN','705',2);
-- INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Solomon Islands','SB','SLB','090',2);
-- INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Somalia','SO','SOM','706',2);
   INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('South Africa','ZA','ZAF','710',2);
-- INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('South Georgia and the South Sandwich Islands','GS','SGS','239',2);
   INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Spain','ES','ESP','724',2);
-- INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Sri Lanka','LK','LKA','144',2);
-- INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('St. Helena','SH','SHN','654',2);
-- INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('St. Pierre and Miquelon','PM','SPM','666',2);
-- INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Sudan','SD','SDN','736',2);
-- INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('SuriName','SR','SUR','740',2);
-- INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Svalbard and Jan Mayen Islands','SJ','SJM','744',2);
-- INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Swaziland','SZ','SWZ','748',2);
   INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Sweden','SE','SWE','752',2);
   INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Switzerland','CH','CHE','756',2);
-- INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Syria','SY','SYR','760',2);
   INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Taiwan','TW','TWN','158',2);
-- INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Tajikistan','TJ','TJK','762',2);
-- INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Tanzania, United Republic of','TZ','TZA','834',2);
   INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Thailand','TH','THA','764',2);
-- INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Togo','TG','TGO','768',2);
-- INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Tokelau','TK','TKL','772',2);
-- INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Tonga','TO','TON','776',2);
-- INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Trinidad and Tobago','TT','TTO','780',2);
-- INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Tunisia','TN','TUN','788',2);
   INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Turkey','TR','TUR','792',2);
-- INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Turkmenistan','TM','TKM','795',2);
-- INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Turks and Caicos Islands','TC','TCA','796',2);
-- INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Tuvalu','TV','TUV','798',2);
-- INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Uganda','UG','UGA','800',2);
   INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Ukraine','UA','UKR','804',2);
   INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('United Arab Emirates','AE','ARE','784',2);
   INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('United Kingdom','GB','GBR','826',2);
   INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('United States minor outlying islands','UM','UMI','581',2);
   INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Uruguay','UY','URY','858',2);
   INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Uzbekistan','UZ','UZB','860',2);
-- INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Vanuatu','VU','VUT','548',2);
   INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Venezuela','VE','VEN','862',2);
-- INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Viet Nam','VN','VNM','704',2);
-- INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Virgin Islands (British)','VG','VGB','092',2);
-- INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Virgin Islands (U.S.)','VI','VIR','850',2);
-- INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Wallis and Futuna Islands','WF','WLF','876',2);
-- INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Western Sahara','EH','ESH','732',2);
-- INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Yemen','YE','YEM','887',2);
   INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Yugoslavia','YU','YUG','891',2);
-- INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Zambia','ZM','ZMB','894',2);
-- INSERT [dbo].Country(Name,TwoLetterISOCode,ThreeLetterISOCode,NumericISOCode,DisplayOrder) values('Zimbabwe','ZW','ZWE','716',2);


GO


UPDATE Country SET PostalCodeRegEx = '^\d{5}(-\d{4})?$', PostalCodeRequired = 1, PostalCodeExample = '12345-6789 or 12345' WHERE TwoLetterISOCode = 'US'
UPDATE Country SET PostalCodeRegEx = '^([a-z-[dfioqu]]|[A-Z-[DFIOQU]])\d([a-z-[dfioqu]]|[A-Z-[DFIOQU]])(\s)?\d([a-z-[dfioqu]]|[A-Z-[DFIOQU]])\d$', PostalCodeRequired = 1, PostalCodeExample = 'H1H 1H3' WHERE TwoLetterISOCode = 'CA'
UPDATE Country SET PostalCodeRegEx = '^\d{4}$', PostalCodeRequired = 1, PostalCodeExample = '1234' WHERE TwoLetterISOCode = 'AU'
UPDATE Country SET PostalCodeRegEx = '^\d{4}$', PostalCodeRequired = 1, PostalCodeExample = '1234' WHERE TwoLetterISOCode = 'BE'
UPDATE Country SET PostalCodeRegEx = '^\d{5}$', PostalCodeRequired = 1, PostalCodeExample = '01234' WHERE TwoLetterISOCode = 'FR'
UPDATE Country SET PostalCodeRegEx = '^\d{5}$', PostalCodeRequired = 1, PostalCodeExample = '01234' WHERE TwoLetterISOCode = 'DE'
UPDATE Country SET PostalCodeRegEx = '^(((D|d)(K|k)(\s|-)?)|((D|d)(E|e)(N|n)(M|m)(A|a)(R|r)(K|k)(\s|-)?))?\d{3,4}$', PostalCodeRequired = 1, PostalCodeExample = '1000 or DK-9000 or 123' WHERE TwoLetterISOCode = 'DK'
UPDATE Country SET PostalCodeRegEx = '^\d{5}$', PostalCodeRequired = 1, PostalCodeExample = '12345' WHERE TwoLetterISOCode = 'IT'
UPDATE Country SET PostalCodeRegEx = '^\d{5}$', PostalCodeRequired = 1, PostalCodeExample = '12345' WHERE TwoLetterISOCode = 'MX'
UPDATE Country SET PostalCodeRegEx = '^\d{4}\s?[a-zA-Z]{2}$', PostalCodeRequired = 1, PostalCodeExample = '2597 QQ' WHERE TwoLetterISOCode = 'NL'
UPDATE Country SET PostalCodeRegEx = '^\d{4}$', PostalCodeRequired = 1, PostalCodeExample = '1234' WHERE TwoLetterISOCode = 'NZ'
UPDATE Country SET PostalCodeRegEx = '^\d{4}$', PostalCodeRequired = 1, PostalCodeExample = '1122' WHERE TwoLetterISOCode = 'NO'
UPDATE Country SET PostalCodeRegEx = '^[0-5][1-2]\d{3}$', PostalCodeRequired = 1, PostalCodeExample = '01123 or 52345' WHERE TwoLetterISOCode = 'ES'
UPDATE Country SET PostalCodeRegEx = '^\d{3}\s?\d{2}$', PostalCodeRequired = 1, PostalCodeExample = '12345, ' WHERE TwoLetterISOCode = 'SE'
UPDATE Country SET PostalCodeRegEx = '^\d{4}$', PostalCodeRequired = 1, PostalCodeExample = '1234' WHERE TwoLetterISOCode = 'CH'
UPDATE Country SET PostalCodeRegEx = '^((GIR 0AA|[A-PR-UWYZ]([0-9]{1,2}|([A-HK-Y][0-9]|[A-HK-Y][0-9]([0-9]|[ABEHMNPRV-Y]))|[0-9][A-HJKS-UW]) [0-9][ABD-HJLNP-UW-Z]{2})|((GIR 0AA)|((([A-Z-[QVX]][0-9][0-9]?)|(([A-Z-[QVX]][A-Z-[IJZ]][0-9][0-9]?)|(([A-Z-[QVX]][0-9][A-HJKSTUW])|([A-Z-[QVX]][A-Z-[IJZ]][0-9][ABEHMNPRVWXY])))) [0-9][A-Z-[CIKMOV]]{2}){2})|([A-Z]{1,2}[0-9R][0-9A-Z]? [0-9][A-Z-[CIKMOV]]{2})|([A-Z]{1,2}[0-9R][0-9A-Z]? [0-9][A-Z]{2}))$', PostalCodeRequired = 1, PostalCodeExample = 'A9 9AA or A99 9AA or AA9 9AA or AA99 9AA' WHERE TwoLetterISOCode = 'GB'


GO


INSERT [dbo].State(CountryID,Name,Abbreviation,DisplayOrder) values(1,'Alabama','AL',1);
INSERT [dbo].State(CountryID,Name,Abbreviation,DisplayOrder) values(1,'Alaska','AK',1);
INSERT [dbo].State(CountryID,Name,Abbreviation,DisplayOrder) values(1,'American Samoa','AS',1);
INSERT [dbo].State(CountryID,Name,Abbreviation,DisplayOrder) values(1,'AA (Armed Forces Americas)','AA',1);
INSERT [dbo].State(CountryID,Name,Abbreviation,DisplayOrder) values(1,'AE (Armed Forces Europe)','AE',1);
INSERT [dbo].State(CountryID,Name,Abbreviation,DisplayOrder) values(1,'AP (Armed Forces Pacific)','AP',1);
INSERT [dbo].State(CountryID,Name,Abbreviation,DisplayOrder) values(1,'Arizona','AZ',1);
INSERT [dbo].State(CountryID,Name,Abbreviation,DisplayOrder) values(1,'Arkansas','AR',1);
INSERT [dbo].State(CountryID,Name,Abbreviation,DisplayOrder) values(1,'California','CA',1);
INSERT [dbo].State(CountryID,Name,Abbreviation,DisplayOrder) values(1,'Colorado','CO',1);
INSERT [dbo].State(CountryID,Name,Abbreviation,DisplayOrder) values(1,'Connecticut','CT',1);
INSERT [dbo].State(CountryID,Name,Abbreviation,DisplayOrder) values(1,'Delaware','DE',1);
INSERT [dbo].State(CountryID,Name,Abbreviation,DisplayOrder) values(1,'District of Columbia','DC',1);
INSERT [dbo].State(CountryID,Name,Abbreviation,DisplayOrder) values(1,'Federated States of Micronesia','FM',1);
INSERT [dbo].State(CountryID,Name,Abbreviation,DisplayOrder) values(1,'Florida','FL',1);
INSERT [dbo].State(CountryID,Name,Abbreviation,DisplayOrder) values(1,'Georgia','GA',1);
INSERT [dbo].State(CountryID,Name,Abbreviation,DisplayOrder) values(1,'Guam','GU',1);
INSERT [dbo].State(CountryID,Name,Abbreviation,DisplayOrder) values(1,'Hawaii','HI',1);
INSERT [dbo].State(CountryID,Name,Abbreviation,DisplayOrder) values(1,'Idaho','ID',1);
INSERT [dbo].State(CountryID,Name,Abbreviation,DisplayOrder) values(1,'Illinois','IL',1);
INSERT [dbo].State(CountryID,Name,Abbreviation,DisplayOrder) values(1,'Indiana','IN',1);
INSERT [dbo].State(CountryID,Name,Abbreviation,DisplayOrder) values(1,'Iowa','IA',1);
INSERT [dbo].State(CountryID,Name,Abbreviation,DisplayOrder) values(1,'Kansas','KS',1);
INSERT [dbo].State(CountryID,Name,Abbreviation,DisplayOrder) values(1,'Kentucky','KY',1);
INSERT [dbo].State(CountryID,Name,Abbreviation,DisplayOrder) values(1,'Louisiana','LA',1);
INSERT [dbo].State(CountryID,Name,Abbreviation,DisplayOrder) values(1,'Maine','ME',1);
INSERT [dbo].State(CountryID,Name,Abbreviation,DisplayOrder) values(1,'Marshall Islands','MH',1);
INSERT [dbo].State(CountryID,Name,Abbreviation,DisplayOrder) values(1,'Maryland','MD',1);
INSERT [dbo].State(CountryID,Name,Abbreviation,DisplayOrder) values(1,'Massachusetts','MA',1);
INSERT [dbo].State(CountryID,Name,Abbreviation,DisplayOrder) values(1,'Michigan','MI',1);
INSERT [dbo].State(CountryID,Name,Abbreviation,DisplayOrder) values(1,'Minnesota','MN',1);
INSERT [dbo].State(CountryID,Name,Abbreviation,DisplayOrder) values(1,'Mississippi','MS',1);
INSERT [dbo].State(CountryID,Name,Abbreviation,DisplayOrder) values(1,'Missouri','MO',1);
INSERT [dbo].State(CountryID,Name,Abbreviation,DisplayOrder) values(1,'Montana','MT',1);
INSERT [dbo].State(CountryID,Name,Abbreviation,DisplayOrder) values(1,'Northern Mariana Islands','MP',1);
INSERT [dbo].State(CountryID,Name,Abbreviation,DisplayOrder) values(1,'Nebraska','NE',1);
INSERT [dbo].State(CountryID,Name,Abbreviation,DisplayOrder) values(1,'Nevada','NV',1);
INSERT [dbo].State(CountryID,Name,Abbreviation,DisplayOrder) values(1,'New Hampshire','NH',1);
INSERT [dbo].State(CountryID,Name,Abbreviation,DisplayOrder) values(1,'New Jersey','NJ',1);
INSERT [dbo].State(CountryID,Name,Abbreviation,DisplayOrder) values(1,'New Mexico','NM',1);
INSERT [dbo].State(CountryID,Name,Abbreviation,DisplayOrder) values(1,'New York','NY',1);
INSERT [dbo].State(CountryID,Name,Abbreviation,DisplayOrder) values(1,'North Carolina','NC',1);
INSERT [dbo].State(CountryID,Name,Abbreviation,DisplayOrder) values(1,'North Dakota','ND',1);
INSERT [dbo].State(CountryID,Name,Abbreviation,DisplayOrder) values(1,'Ohio','OH',1);
INSERT [dbo].State(CountryID,Name,Abbreviation,DisplayOrder) values(1,'Oklahoma','OK',1);
INSERT [dbo].State(CountryID,Name,Abbreviation,DisplayOrder) values(1,'Oregon','OR',1);
INSERT [dbo].State(CountryID,Name,Abbreviation,DisplayOrder) values(1,'Palau','PW',1);
INSERT [dbo].State(CountryID,Name,Abbreviation,DisplayOrder) values(1,'Pennsylvania','PA',1);
INSERT [dbo].State(CountryID,Name,Abbreviation,DisplayOrder) values(1,'Puerto Rico','PR',1);
INSERT [dbo].State(CountryID,Name,Abbreviation,DisplayOrder) values(1,'Rhode Island','RI',1);
INSERT [dbo].State(CountryID,Name,Abbreviation,DisplayOrder) values(1,'South Carolina','SC',1);
INSERT [dbo].State(CountryID,Name,Abbreviation,DisplayOrder) values(1,'South Dakota','SD',1);
INSERT [dbo].State(CountryID,Name,Abbreviation,DisplayOrder) values(1,'Tennessee','TN',1);
INSERT [dbo].State(CountryID,Name,Abbreviation,DisplayOrder) values(1,'Texas','TX',1);
INSERT [dbo].State(CountryID,Name,Abbreviation,DisplayOrder) values(1,'Utah','UT',1);
INSERT [dbo].State(CountryID,Name,Abbreviation,DisplayOrder) values(1,'Vermont','VT',1);
INSERT [dbo].State(CountryID,Name,Abbreviation,DisplayOrder) values(1,'Virgin Islands','VI',1);
INSERT [dbo].State(CountryID,Name,Abbreviation,DisplayOrder) values(1,'Virginia','VA',1);
INSERT [dbo].State(CountryID,Name,Abbreviation,DisplayOrder) values(1,'Washington','WA',1);
INSERT [dbo].State(CountryID,Name,Abbreviation,DisplayOrder) values(1,'West Virginia','WV',1);
INSERT [dbo].State(CountryID,Name,Abbreviation,DisplayOrder) values(1,'Wisconsin','WI',1);
INSERT [dbo].State(CountryID,Name,Abbreviation,DisplayOrder) values(1,'Wyoming','WY',1);

INSERT [dbo].State(CountryID,Name,Abbreviation,DisplayOrder) values(2,'Alberta','AB',1);
INSERT [dbo].State(CountryID,Name,Abbreviation,DisplayOrder) values(2,'British Columbia','BC',1);
INSERT [dbo].State(CountryID,Name,Abbreviation,DisplayOrder) values(2,'Manitoba','MB',1);
INSERT [dbo].State(CountryID,Name,Abbreviation,DisplayOrder) values(2,'New Brunswick','NB',1);
INSERT [dbo].State(CountryID,Name,Abbreviation,DisplayOrder) values(2,'Newfoundland and Labrador', 'NL',1);
INSERT [dbo].State(CountryID,Name,Abbreviation,DisplayOrder) values(2,'Northwest Territories','NT',1);
INSERT [dbo].State(CountryID,Name,Abbreviation,DisplayOrder) values(2,'Nova Scotia','NS',1);
INSERT [dbo].State(CountryID,Name,Abbreviation,DisplayOrder) values(2,'Nunavut','NU',1);
INSERT [dbo].State(CountryID,Name,Abbreviation,DisplayOrder) values(2,'Ontario','ON',1);
INSERT [dbo].State(CountryID,Name,Abbreviation,DisplayOrder) values(2,'Prince Edward Island','PE',1);
INSERT [dbo].State(CountryID,Name,Abbreviation,DisplayOrder) values(2,'Quebec','QC',1);
INSERT [dbo].State(CountryID,Name,Abbreviation,DisplayOrder) values(2,'Saskatchewan','SK',1);
INSERT [dbo].State(CountryID,Name,Abbreviation,DisplayOrder) values(2,'Yukon Territory','YU',1);
GO
--For non-US and Canada Addresses
INSERT [dbo].State(CountryID,Name,Abbreviation,DisplayOrder) values(null,'Other (Non U.S.)','--',1);
GO


declare @countryid int
select @countryid = CountryID from [dbo].Country where ThreeLetterISOCode = 'GBR'
if @countryid <> null begin
    INSERT [dbo].State(CountryID,Name,Abbreviation,DisplayOrder) values(@countryid,'Alderney','ALD',1)
    INSERT [dbo].State(CountryID,Name,Abbreviation,DisplayOrder) values(@countryid,'County Antrim','ATM',2)
    INSERT [dbo].State(CountryID,Name,Abbreviation,DisplayOrder) values(@countryid,'County Armagh','ARM',3)
    INSERT [dbo].State(CountryID,Name,Abbreviation,DisplayOrder) values(@countryid,'Avon','AVN',4)
    INSERT [dbo].State(CountryID,Name,Abbreviation,DisplayOrder) values(@countryid,'Bedfordshire','BFD',5)
    INSERT [dbo].State(CountryID,Name,Abbreviation,DisplayOrder) values(@countryid,'Berkshire','BRK',6)
    INSERT [dbo].State(CountryID,Name,Abbreviation,DisplayOrder) values(@countryid,'Borders','BDS',7)
    INSERT [dbo].State(CountryID,Name,Abbreviation,DisplayOrder) values(@countryid,'Buckinghamshire','BUX',8)
    INSERT [dbo].State(CountryID,Name,Abbreviation,DisplayOrder) values(@countryid,'Cambridgeshire','CBE',9)
    INSERT [dbo].State(CountryID,Name,Abbreviation,DisplayOrder) values(@countryid,'Central','CTR',10)
    INSERT [dbo].State(CountryID,Name,Abbreviation,DisplayOrder) values(@countryid,'Cheshire','CHS',11)
    INSERT [dbo].State(CountryID,Name,Abbreviation,DisplayOrder) values(@countryid,'Cleveland','CVE',12)
    INSERT [dbo].State(CountryID,Name,Abbreviation,DisplayOrder) values(@countryid,'Clwyd','CLD',13)
    INSERT [dbo].State(CountryID,Name,Abbreviation,DisplayOrder) values(@countryid,'Cornwall','CNL',14)
    INSERT [dbo].State(CountryID,Name,Abbreviation,DisplayOrder) values(@countryid,'Cumbria','CBA',15)
    INSERT [dbo].State(CountryID,Name,Abbreviation,DisplayOrder) values(@countryid,'Derbyshire','DYS',16)
    INSERT [dbo].State(CountryID,Name,Abbreviation,DisplayOrder) values(@countryid,'Devon','DVN',17)
    INSERT [dbo].State(CountryID,Name,Abbreviation,DisplayOrder) values(@countryid,'Dorse','DOR',18)
    INSERT [dbo].State(CountryID,Name,Abbreviation,DisplayOrder) values(@countryid,'County Down','DWN',19)
    INSERT [dbo].State(CountryID,Name,Abbreviation,DisplayOrder) values(@countryid,'Dumfries and Galloway','DGL',20)
    INSERT [dbo].State(CountryID,Name,Abbreviation,DisplayOrder) values(@countryid,'County Durham','DHM',21)
    INSERT [dbo].State(CountryID,Name,Abbreviation,DisplayOrder) values(@countryid,'Dyfed','DFD',22)
    INSERT [dbo].State(CountryID,Name,Abbreviation,DisplayOrder) values(@countryid,'Essex','ESX',23)
    INSERT [dbo].State(CountryID,Name,Abbreviation,DisplayOrder) values(@countryid,'County Fermanagh','FMH',24)
    INSERT [dbo].State(CountryID,Name,Abbreviation,DisplayOrder) values(@countryid,'Fife','FFE',25)
    INSERT [dbo].State(CountryID,Name,Abbreviation,DisplayOrder) values(@countryid,'Mid Glamorgan','GNM',26)
    INSERT [dbo].State(CountryID,Name,Abbreviation,DisplayOrder) values(@countryid,'South Glamorgan','GNS',27)
    INSERT [dbo].State(CountryID,Name,Abbreviation,DisplayOrder) values(@countryid,'West Glamorgan','GNW',28)
    INSERT [dbo].State(CountryID,Name,Abbreviation,DisplayOrder) values(@countryid,'Gloucester','GLR',29)
    INSERT [dbo].State(CountryID,Name,Abbreviation,DisplayOrder) values(@countryid,'Grampian','GRN',30)
    INSERT [dbo].State(CountryID,Name,Abbreviation,DisplayOrder) values(@countryid,'Guernsey','GUR',31)
    INSERT [dbo].State(CountryID,Name,Abbreviation,DisplayOrder) values(@countryid,'Gwent','GWT',32)
    INSERT [dbo].State(CountryID,Name,Abbreviation,DisplayOrder) values(@countryid,'Gwynedd','GDD',33)
    INSERT [dbo].State(CountryID,Name,Abbreviation,DisplayOrder) values(@countryid,'Hampshire','HPH',34)
    INSERT [dbo].State(CountryID,Name,Abbreviation,DisplayOrder) values(@countryid,'Hereford and Worcester','HWR',35)
    INSERT [dbo].State(CountryID,Name,Abbreviation,DisplayOrder) values(@countryid,'Hertfordshire','HFD',36)
    INSERT [dbo].State(CountryID,Name,Abbreviation,DisplayOrder) values(@countryid,'Highlands','HLD',37)
    INSERT [dbo].State(CountryID,Name,Abbreviation,DisplayOrder) values(@countryid,'Humberside','HBS',38)
    INSERT [dbo].State(CountryID,Name,Abbreviation,DisplayOrder) values(@countryid,'Isle of Man','IOM',39)
    INSERT [dbo].State(CountryID,Name,Abbreviation,DisplayOrder) values(@countryid,'Isle of Wight','IOW',40)
    INSERT [dbo].State(CountryID,Name,Abbreviation,DisplayOrder) values(@countryid,'Jersey','JER',41)
    INSERT [dbo].State(CountryID,Name,Abbreviation,DisplayOrder) values(@countryid,'Kent','KNT',42)
    INSERT [dbo].State(CountryID,Name,Abbreviation,DisplayOrder) values(@countryid,'Lancashire','LNH',43)
    INSERT [dbo].State(CountryID,Name,Abbreviation,DisplayOrder) values(@countryid,'Leicestershire','LEC',44)
    INSERT [dbo].State(CountryID,Name,Abbreviation,DisplayOrder) values(@countryid,'Lincolnshire','LCN',45)
    INSERT [dbo].State(CountryID,Name,Abbreviation,DisplayOrder) values(@countryid,'Greater London','LDN',46)
    INSERT [dbo].State(CountryID,Name,Abbreviation,DisplayOrder) values(@countryid,'County Londonderry ','LDR',47)
    INSERT [dbo].State(CountryID,Name,Abbreviation,DisplayOrder) values(@countryid,'Lothian','LTH',48)
    INSERT [dbo].State(CountryID,Name,Abbreviation,DisplayOrder) values(@countryid,'Greater Manchester','MCH',49)
    INSERT [dbo].State(CountryID,Name,Abbreviation,DisplayOrder) values(@countryid,'Merseyside','MSY',50)
    INSERT [dbo].State(CountryID,Name,Abbreviation,DisplayOrder) values(@countryid,'Norfolk','NOR',51)
    INSERT [dbo].State(CountryID,Name,Abbreviation,DisplayOrder) values(@countryid,'Northamptonshire','NHM',52)
    INSERT [dbo].State(CountryID,Name,Abbreviation,DisplayOrder) values(@countryid,'Northumberland','NLD',53)
    INSERT [dbo].State(CountryID,Name,Abbreviation,DisplayOrder) values(@countryid,'Nottinghamshire','NOT',54)
    INSERT [dbo].State(CountryID,Name,Abbreviation,DisplayOrder) values(@countryid,'Orkney','ORK',55)
    INSERT [dbo].State(CountryID,Name,Abbreviation,DisplayOrder) values(@countryid,'Oxfordshire','OFE',56)
    INSERT [dbo].State(CountryID,Name,Abbreviation,DisplayOrder) values(@countryid,'Powys','PWS',57)
    INSERT [dbo].State(CountryID,Name,Abbreviation,DisplayOrder) values(@countryid,'Shropshire','SPE',58)
    INSERT [dbo].State(CountryID,Name,Abbreviation,DisplayOrder) values(@countryid,'Sark','SRK',59)
    INSERT [dbo].State(CountryID,Name,Abbreviation,DisplayOrder) values(@countryid,'Shetland','SLD',60)
    INSERT [dbo].State(CountryID,Name,Abbreviation,DisplayOrder) values(@countryid,'Somerset','SOM',61)
    INSERT [dbo].State(CountryID,Name,Abbreviation,DisplayOrder) values(@countryid,'Staffordshire','SFD',62)
    INSERT [dbo].State(CountryID,Name,Abbreviation,DisplayOrder) values(@countryid,'Strathclyde','SCD',63)
    INSERT [dbo].State(CountryID,Name,Abbreviation,DisplayOrder) values(@countryid,'Suffolk','SFK',64)
    INSERT [dbo].State(CountryID,Name,Abbreviation,DisplayOrder) values(@countryid,'Surrey','SRY',65)
    INSERT [dbo].State(CountryID,Name,Abbreviation,DisplayOrder) values(@countryid,'East Sussex','SXE',66)
    INSERT [dbo].State(CountryID,Name,Abbreviation,DisplayOrder) values(@countryid,'West Sussex','SXW',67)
    INSERT [dbo].State(CountryID,Name,Abbreviation,DisplayOrder) values(@countryid,'Tayside','TYS',68)
    INSERT [dbo].State(CountryID,Name,Abbreviation,DisplayOrder) values(@countryid,'Tyne and Wear','TWR',69)
    INSERT [dbo].State(CountryID,Name,Abbreviation,DisplayOrder) values(@countryid,'County Tyrone','TYR',70)
    INSERT [dbo].State(CountryID,Name,Abbreviation,DisplayOrder) values(@countryid,'Warwickshire','WKS',71)
    INSERT [dbo].State(CountryID,Name,Abbreviation,DisplayOrder) values(@countryid,'Western Isles','WIL',72)
    INSERT [dbo].State(CountryID,Name,Abbreviation,DisplayOrder) values(@countryid,'West Midlands','WMD',73)
    INSERT [dbo].State(CountryID,Name,Abbreviation,DisplayOrder) values(@countryid,'Wiltshire','WLT',74)
    INSERT [dbo].State(CountryID,Name,Abbreviation,DisplayOrder) values(@countryid,'North Yorkshire','YSN',75)
    INSERT [dbo].State(CountryID,Name,Abbreviation,DisplayOrder) values(@countryid,'South Yorkshire','YSS',76)
    INSERT [dbo].State(CountryID,Name,Abbreviation,DisplayOrder) values(@countryid,'West Yorkshire','YSW',77)
end




GO


INSERT [dbo].LocaleSetting(Name,DisplayOrder,Description) values('en-US' ,1,'United States');

GO


CREATE VIEW StoreMappingView
AS

	SELECT ID, StoreID, EntityID, EntityType FROM EntityStore WITH (NOLOCK)
	UNION ALL
	SELECT ID, StoreID, ProductID EntityID, 'Product' EntityType FROM ProductStore WITH (NOLOCK)
	UNION ALL
	SELECT ID, StoreID, NewsID EntityID, 'News' EntityType FROM NewsStore WITH (NOLOCK)
	UNION ALL
	SELECT ID, StoreID, TopicID EntityID, 'Topic' EntityType FROM TopicStore WITH (NOLOCK)
	UNION ALL
	SELECT ID, StoreID, CouponID EntityID, 'Coupon' EntityType FROM CouponStore WITH (NOLOCK)
	UNION ALL
	SELECT ID, StoreID, OrderOptionID EntityID, 'OrderOption' EntityType FROM OrderOptionStore WITH (NOLOCK)
	UNION ALL
	SELECT ID, StoreID, GiftCardID EntityID, 'GiftCard' EntityType FROM GiftCardStore WITH (NOLOCK)
	UNION ALL
	SELECT ID, StoreID, PollID EntityID, 'Polls' EntityType FROM PollStore WITH (NOLOCK)
	UNION ALL
	SELECT ID, StoreID, ShippingMethodID EntityID, 'ShippingMethod' EntityType FROM ShippingMethodStore WITH (NOLOCK)
	UNION ALL
	SELECT ID, StoreID, AffiliateID EntityID, 'Affiliate' EntityType FROM AffiliateStore WITH (NOLOCK)


GO



CREATE PROCEDURE aspdnsf_UpdateCartItemQuantity
	@ProductID int,
    @VariantID int,
	@ShoppingCartRecID INT,
	@Quantity INT,
	@NewQuantity INT OUTPUT
  
AS
BEGIN
	DECLARE @RestrictedQy varchar(8000), @CurrentCartQty int

	SELECT @RestrictedQy = RestrictedQuantities 
	FROM dbo.ProductVariant with (nolock) 
	WHERE VariantID = @VariantID

	SELECT @CurrentCartQty = Quantity 
	FROM dbo.shoppingcart with (nolock) 
	WHERE ShoppingCartRecID = @ShoppingCartRecID

	DECLARE @RQty int
	IF isnull(rtrim(@RestrictedQy), '') = ''
		set @RQty = -1
	ELSE
		SELECT @RQty = cast(items as int) FROM dbo.Split(@RestrictedQy, ',') WHERE cast(items as int) <= isnull(@CurrentCartQty, 0) + @Quantity

	UPDATE dbo.ShoppingCart 
    SET Quantity = case @RQty when -1 then Quantity + @Quantity else isnull(@RQty, 0) end
    WHERE ShoppingCartRecID = @ShoppingCartRecID

	SELECT @NewQuantity = Quantity FROM dbo.ShoppingCart with (nolock) WHERE ShoppingCartRecID = @ShoppingCartRecID
END



GO


create proc [dbo].[aspdnsf_MoveToShoppingCart]
    @ShoppingCartRecId int,
    @CartType int
  
AS
SET NOCOUNT ON 

DECLARE @custid int, @pid int, @vid int, @isapack tinyint, @isakit tinyint, @color nvarchar(200), @size nvarchar(200), @text nvarchar(4000), @qty int

select @custid = s.Customerid, @pid = s.ProductID, @vid = variantid, @color = s.ChosenColor, @size = s.ChosenSize, @qty = s.Quantity, @text = convert(nvarchar(4000), TextOption), @isapack = p.IsAPack, @isakit = p.IsAKit
from dbo.shoppingcart s with (nolock) 
    join dbo.Product p with (nolock) on s.ProductID = p.ProductID 
where s.ShoppingCartRecId = @ShoppingCartRecId and s.CartType = @CartType

if @isapack = 0 and @isakit = 0 begin
    if exists (select * from dbo.shoppingcart with (nolock) where CustomerID=@custid and carttype = 0 and productid = @pid and variantid = @vid and ChosenColor = @color and ChosenSize = @size and convert(nvarchar(4000), TextOption) = @text) begin
        update dbo.shoppingcart set Quantity = Quantity + @qty,CreatedOn=getdate() where CustomerID=@custid and carttype = 0 and productid = @pid and variantid = @vid and ChosenColor = @color and ChosenSize = @size and convert(nvarchar(4000), TextOption) = @text 
        delete dbo.shoppingcart where ShoppingCartRecId = @ShoppingCartRecId and CartType = @CartType
    end
    else begin
        update dbo.ShoppingCart set CartType = 0,CreatedOn=getdate() where ShoppingCartRecId = @ShoppingCartRecId and CartType = @CartType
    end
end
else begin
    update dbo.ShoppingCart set CartType = 0,CreatedOn=getdate() where ShoppingCartRecId = @ShoppingCartRecId and CartType = @CartType
    update dbo.CustomCart set CartType = 0,CreatedOn=getdate() where ShoppingCartRecId = @ShoppingCartRecId and CartType = @CartType
    update dbo.KitCart set CartType = 0,CreatedOn=getdate() where ShoppingCartRecId = @ShoppingCartRecId and CartType = @CartType
end



GO


create proc dbo.aspdnsf_UpdateCartKitPrice
    @ShoppingCartRecId int,
    @CustomerLevelID int = 0
  
AS
BEGIN
    SET NOCOUNT ON
    DECLARE @LevelDiscountsApplyToExtendedPrices tinyint, @LevelDiscountPercent money, @ProductPrice money

    SELECT @LevelDiscountsApplyToExtendedPrices = LevelDiscountsApplyToExtendedPrices, @LevelDiscountPercent = LevelDiscountPercent  
    FROM customerlevel
    WHERE CustomerLevelID = @CustomerLevelID

    select @ProductPrice = case 
                            when isnull(@LevelDiscountsApplyToExtendedPrices, 0) = 1 then (100-isnull(@LevelDiscountPercent, 0))*(coalesce(ep.price, nullif(pv.saleprice, 0), pv.price) + kc.pricedelta)/100.0
                            when isnull(@LevelDiscountsApplyToExtendedPrices, 0) = 0 and ep.price is not null then ep.price + kc.pricedelta
                            else (100-isnull(@LevelDiscountPercent, 0))*((coalesce(nullif(pv.saleprice, 0), pv.price) + kc.pricedelta))/100.0
                           end 
    FROM ShoppingCart sc with (nolock) 
        join productvariant pv with (nolock) on sc.variantid = pv.variantid
        left join extendedprice ep with (nolock) on pv.variantid = ep.variantid and ep.CustomerLevelID = @CustomerLevelID
        join (select ShoppingCartRecId, sum(pricedelta) pricedelta
              from kitcart kc with (nolock) 
                join kititem ki with (nolock) on kc.kititemid = ki.kititemid
              where kc.ShoppingCartRecId = @ShoppingCartRecId
              group by ShoppingCartRecId 
             ) kc on sc.ShoppingCartRecId = kc.ShoppingCartRecId
    WHERE sc.ShoppingCartRecId = @ShoppingCartRecId

    UPDATE ShoppingCart
    SET ProductPrice = @ProductPrice
    WHERE ShoppingCartRecID = @ShoppingCartRecId
END


GO


CREATE PROC [dbo].[aspdnsf_SynchronizeCart](
    @CustomerID int,
    @CartType int
)
  
AS
SET NOCOUNT ON
BEGIN

	UPDATE sc 
	SET sc.ProductSKU = case when i.VendorFullSKU IS NULL OR rtrim(i.VendorFullSKU) = '' then isnull(p.sku, '') + isnull(pv.skusuffix, '') + isnull(sc.ChosenColorSKUModifier, '') + isnull(sc.ChosenSizeSKUModifier, '') else i.VendorFullSKU end
	FROM dbo.ShoppingCart sc
		INNER JOIN  dbo.Product p with (NOLOCK)  ON p.ProductID = sc.ProductID AND sc.CustomerID = @CustomerID
		JOIN dbo.ProductVariant pv with (NOLOCK) on sc.VariantID = pv.VariantID 
		LEFT JOIN dbo.Inventory i with (NOLOCK) on pv.VariantID = i.VariantID AND i.size = sc.ChosenSize AND i.color = sc.ChosenColor		
    WHERE sc.CustomerID = @CustomerID and
          sc.CartType  = @CartType
END


GO


create proc [dbo].[aspdnsf_GetShoppingCart]
    @CartType tinyint, -- ShoppingCart = 0, WishCart = 1, RecurringCart = 2, GiftRegistryCart = 3
    @CustomerID int,
    @OriginalRecurringOrderNumber int,
    @OnlyLoadRecurringItemsThatAreDue tinyint,
    @StoreID int = 1
    
  
AS
BEGIN
 
    SET NOCOUNT ON 
    declare @filtershoppingcart bit, @filterproduct bit
    SELECT TOP 1 @filtershoppingcart = ConfigValue FROM GlobalConfig WHERE Name='AllowShoppingcartFiltering'
    SELECT TOP 1 @filterproduct = ConfigValue FROM GlobalConfig WHERE Name='AllowProductFiltering'
    
    SELECT
        ShoppingCart.ProductSKU,
        ShoppingCart.IsUpsell,
        ShoppingCart.Notes,
        ShoppingCart.ExtensionData,
        ShoppingCart.CustomerEntersPrice,
        ShoppingCart.NextRecurringShipDate,
        ShoppingCart.RecurringIndex,
        ShoppingCart.OriginalRecurringOrderNumber,
        ShoppingCart.RecurringSubscriptionID,
        ShoppingCart.CartType,
        ShoppingCart.ProductPrice,
        ShoppingCart.ProductWeight,
        ShoppingCart.ProductDimensions,
        ShoppingCart.SubscriptionInterval,
        ShoppingCart.SubscriptionIntervalType,
        ShoppingCart.ShoppingCartRecID,
        ShoppingCart.ProductID,
        ShoppingCart.VariantID,
        ShoppingCart.Quantity,
        ShoppingCart.IsTaxable,
        ShoppingCart.TaxClassID,
        ShoppingCart.TaxRate,
        ShoppingCart.IsShipSeparately,
        ShoppingCart.ChosenColor,
        ShoppingCart.ChosenColorSKUModifier,
        ShoppingCart.ChosenSize,
        ShoppingCart.ChosenSizeSKUModifier,
        ShoppingCart.TextOption,
        ShoppingCart.IsDownload,
        ShoppingCart.FreeShipping,
        ShoppingCart.DistributorID,
        ShoppingCart.DownloadLocation,
        ShoppingCart.CreatedOn,
        ShoppingCart.BillingAddressID as ShoppingCartBillingAddressID,
        ShoppingCart.GiftRegistryForCustomerID,
        ShoppingCart.ShippingAddressID as ShoppingCartShippingAddressID,
        ShoppingCart.ShippingMethodID,
        ShoppingCart.ShippingMethod,
        ShoppingCart.RequiresCount,
        ShoppingCart.IsSystem,
        ShoppingCart.IsAKit,
        ShoppingCart.IsAPack,
        Customer.EMail,
        Customer.OrderOptions,
        Customer.OrderNotes,
        Customer.FinalizationData,
        Customer.CouponCode,
        Customer.ShippingAddressID as
        CustomerShippingAddressID,
        Customer.BillingAddressID as CustomerBillingAddressID,
        Product.Name as ProductName,
        Product.IsSystem,
        ProductVariant.name as VariantName,
        Product.TextOptionPrompt,
        Product.SizeOptionPrompt,
        Product.ColorOptionPrompt,
        ProductVariant.CustomerEntersPricePrompt,
        Product.ProductTypeId,
        Product.TaxClassId,
        Product.ManufacturerPartNumber,
        Product.ImageFileNameOverride,
        Product.SEName,
        Product.Deleted,
        ProductVariant.Weight,
        case @CartType when 2 then ShoppingCart.RecurringInterval else productvariant.RecurringInterval end RecurringInterval,
        case @CartType when 2 then ShoppingCart.RecurringIntervalType else productvariant.RecurringIntervalType end RecurringIntervalType
 
    FROM dbo.Customer with (NOLOCK)
        join dbo.ShoppingCart with (NOLOCK) ON Customer.CustomerID = ShoppingCart.CustomerID
        join dbo.Product with (NOLOCK) on ShoppingCart.ProductID=Product.ProductID
        left join dbo.ProductVariant with (NOLOCK) on ShoppingCart.VariantID=ProductVariant.VariantID
        left join dbo.Address with (NOLOCK) on Customer.ShippingAddressID=Address.AddressID
        left join dbo.country c on c.name = Address.country 
        left join dbo.State with (nolock) ON Address.State = State.Abbreviation and State.countryid = c.countryid
		inner join (select distinct a.ProductID,a.StoreID from ShoppingCart a with (nolock) left join ProductStore b with (nolock) on a.ProductID = b.ProductID where (@filterproduct = 0 or a.StoreID = b.StoreID)) productstore
        on ShoppingCart.ProductID = productstore.ProductID and ShoppingCart.StoreID = productstore.StoreID
        
    WHERE ShoppingCart.CartType = @CartType
        and Product.Deleted in (0,2)
        and ProductVariant.Deleted = 0
        and Customer.customerid = @CustomerID
        and (@OriginalRecurringOrderNumber = 0 or ShoppingCart.OriginalRecurringOrderNumber = @OriginalRecurringOrderNumber)
        and (@OnlyLoadRecurringItemsThatAreDue = 0 or (@CartType = 2 and NextRecurringShipDate < dateadd(dy, 1, getdate())))
        and (@filtershoppingcart = 0 or ShoppingCart.StoreID = @StoreID)
		AND (AvailableStopDate IS NULL OR AvailableStopDate > GetDate())
     ORDER BY ShoppingCart.GiftRegistryForCustomerID,ShoppingCart.ShippingAddressID
 
END


GO


create proc [dbo].[aspdnsf_ReloadCart]
    @CartXML text
  
AS
BEGIN
    SET NOCOUNT ON  

    DECLARE @tmpShoppingCart TABLE ( [CustomerID] [int] NOT NULL ,[ProductSKU] [nvarchar] (100) NULL , [ProductPrice] [money] NULL ,[ProductWeight] [money] NULL , [ProductID] [int] NOT NULL , [VariantID] [int] NOT NULL , [Quantity] [int] NOT NULL , [ChosenColor] [nvarchar] (100)  NULL , [ChosenColorSKUModifier] [nvarchar] (50) NULL , [ChosenSize] [nvarchar] (100) NULL , [ChosenSizeSKUModifier] [nvarchar] (50) NULL , [IsTaxable] [tinyint] NOT NULL , [IsShipSeparately] [tinyint] NOT NULL , [IsDownload] [tinyint] NOT NULL , [DownloadLocation] [ntext] NULL , [CreatedOn] [datetime] NOT NULL , [ProductDimensions] [nvarchar] (100) NULL , [CartType] [int] NOT NULL , [IsSecureAttachment] [tinyint] NOT NULL , [TextOption] [ntext] NULL , [NextRecurringShipDate] [datetime] NULL , [RecurringIndex] [int] NOT NULL , [OriginalRecurringOrderNumber] [int] NULL , [RecurringSubscriptionID] [nvarchar](100) NOT NULL, [BillingAddressID] [int] NULL , [ShippingAddressID] [int] NULL , [ShippingMethodID] [int] NULL , [ShippingMethod] [nvarchar] (400) NULL , [DistributorID] [int] NULL , [SubscriptionInterval] [int] NULL , [SubscriptionIntervalType] [int] NULL, [Notes] [ntext] NULL , [IsUpsell] [tinyint] NOT NULL , [GiftRegistryForCustomerID] [int] NOT NULL , [RecurringInterval] [int] NOT NULL , [RecurringIntervalType] [int] NOT NULL , [ExtensionData] [ntext] NULL, [FreeShipping] [tinyint] NOT NULL, [CustomerEntersPrice] [tinyint] NOT NULL, [IsAKit] [tinyint] NOT NULL, [IsAPack] [tinyint] NOT NULL)
    DECLARE @tmpShoppingCart2 TABLE (oldCartID int not null,  [ShoppingCartRecGUID] [uniqueidentifier] NOT NULL, [CustomerID] [int] NOT NULL , [ProductSKU] [nvarchar] (100) NULL , [ProductPrice] [money] NULL , [ProductWeight] [money] NULL , [ProductID] [int] NOT NULL , [VariantID] [int] NOT NULL , [Quantity] [int] NOT NULL , [ChosenColor] [nvarchar] (100) NULL , [ChosenColorSKUModifier] [nvarchar] (50) NULL , [ChosenSize] [nvarchar] (100) NULL , [ChosenSizeSKUModifier] [nvarchar] (50) NULL , [IsTaxable] [tinyint] NOT NULL , [IsShipSeparately] [tinyint] NOT NULL , [IsDownload] [tinyint] NOT NULL , [DownloadLocation] [ntext] NULL , [CreatedOn] [datetime] NOT NULL , [ProductDimensions] [nvarchar] (100) NULL , [CartType] [int] NOT NULL , [IsSecureAttachment] [tinyint] NOT NULL , [TextOption] [ntext] NULL , [NextRecurringShipDate] [datetime] NULL , [RecurringIndex] [int] NOT NULL , [OriginalRecurringOrderNumber] [int] NULL , [RecurringSubscriptionID] [nvarchar](100) NOT NULL, [BillingAddressID] [int] NULL , [ShippingAddressID] [int] NULL , [ShippingMethodID] [int] NULL , [ShippingMethod] [nvarchar] (400) NULL , [DistributorID] [int] NULL , [SubscriptionInterval] [int] NULL , [SubscriptionIntervalType] [int] NULL , [Notes] [ntext] NULL , [IsUpsell] [tinyint] NOT NULL , [GiftRegistryForCustomerID] [int] NOT NULL , [RecurringInterval] [int] NOT NULL , [RecurringIntervalType] [int] NOT NULL , [ExtensionData] [ntext] NULL, [FreeShipping] [tinyint] NOT NULL, [CustomerEntersPrice] [tinyint] NOT NULL, [IsAKit] [tinyint] NOT NULL, [IsAPack] [tinyint] NOT NULL)
    DECLARE @tmpCart TABLE (cartid int not null, addressid int not null, qty  int not null)     
    DECLARE @tmp1 TABLE ( [CustomerID] [int] NOT NULL , [CartType] [int] NOT NULL , [ProductID] [int] NOT NULL , [VariantID] [int] NOT NULL , [ChosenColor] [nvarchar] (100) NULL , [ChosenSize] [nvarchar] (100) NULL ,[TextOption] [ntext] NULL , [ShippingAddressID] [int] NULL , [Qty] [int] NOT NULL )
    DECLARE @tmp2 TABLE ([cartid] [int] NOT NULL )

    DECLARE @hdoc int, @retcode int
    EXEC @retcode = sp_xml_preparedocument 
                        @hdoc OUTPUT,
                        @CartXML
 
    INSERT @tmpCart (cartid, addressid, qty)
    SELECT cartid, addressid, count(*)
    FROM OPENXML(@hdoc, '/root/row', 0) WITH (cartid int, addressid int)
    GROUP BY cartid, addressid
 
    DECLARE @custid int, @carttype int
 
    SELECT top 1 @custid = CustomerID, @carttype = CartType
    FROM dbo.ShoppingCart s with (nolock) 
            join @tmpCart c on s.ShoppingCartRecID = c.cartid
 

    --creates cart item/shipping address combinations
    INSERT @tmpShoppingCart
    SELECT CustomerID, ProductSKU, ProductPrice, ProductWeight, ProductID,VariantID, c.qty quantity, ChosenColor, ChosenColorSKUModifier, ChosenSize,ChosenSizeSKUModifier, IsTaxable, IsShipSeparately, IsDownload,DownloadLocation, CreatedOn, ProductDimensions, CartType,IsSecureAttachment, TextOption, NextRecurringShipDate, RecurringIndex,OriginalRecurringOrderNumber, RecurringSubscriptionID, BillingAddressID,c.addressid ShippingAddressID, ShippingMethodID, ShippingMethod,DistributorID, SubscriptionInterval, SubscriptionIntervalType, Notes,IsUpsell, GiftRegistryForCustomerID, RecurringInterval,RecurringIntervalType, ExtensionData, s.FreeShipping, s.CustomerEntersPrice, s.IsAKit, s.IsAPack
    FROM dbo.ShoppingCart s 
        join @tmpCart c on s.ShoppingCartRecID = c.cartid
 
 
 
    -- combines like items based on the fields in the group by clause
    INSERT @tmp1
    SELECT customerid, carttype, productid, variantid, chosencolor, chosensize, convert(nvarchar(4000), textoption) textoption, shippingaddressid, sum(quantity)
    FROM @tmpShoppingCart 
    GROUP BY customerid,carttype,productid,variantid,chosencolor,chosensize,convert(nvarchar(4000), textoption),shippingaddressid
 

    -- gets original cartID for restricting new cart items
    INSERT @tmp2
    SELECT min(ShoppingCartRecID) cartid
    FROM dbo.ShoppingCart
    WHERE customerid = @custid and carttype = @carttype
    GROUP BY customerid, carttype, productid, variantid, chosencolor, chosensize, convert(nvarchar(4000), textoption)
 

    -- create new cart records
    INSERT @tmpShoppingCart2 (oldCartID, ShoppingCartRecGUID, CustomerID,ProductSKU, ProductPrice, ProductWeight, ProductID, VariantID, Quantity,ChosenColor, ChosenColorSKUModifier, ChosenSize, ChosenSizeSKUModifier,IsTaxable, IsShipSeparately, IsDownload, DownloadLocation, CreatedOn,ProductDimensions, CartType, IsSecureAttachment, TextOption,NextRecurringShipDate, RecurringIndex, OriginalRecurringOrderNumber,RecurringSubscriptionID, BillingAddressID, ShippingAddressID,ShippingMethodID, ShippingMethod, DistributorID, SubscriptionInterval,SubscriptionIntervalType, Notes, IsUpsell, GiftRegistryForCustomerID,RecurringInterval, RecurringIntervalType, ExtensionData, FreeShipping, CustomerEntersPrice, IsAKit, IsAPack)
    SELECT c.cartid, newid(), s.CustomerID, s.ProductSKU, s.ProductPrice,s.ProductWeight, s.ProductID, s.VariantID, a.qty, s.ChosenColor,s.ChosenColorSKUModifier, s.ChosenSize, s.ChosenSizeSKUModifier,s.IsTaxable, s.IsShipSeparately, s.IsDownload, s.DownloadLocation,s.CreatedOn, s.ProductDimensions, s.CartType, s.IsSecureAttachment,s.TextOption, s.NextRecurringShipDate, s.RecurringIndex,s.OriginalRecurringOrderNumber, s.RecurringSubscriptionID,s.BillingAddressID, a.shippingaddressid, s.ShippingMethodID,s.ShippingMethod, s.DistributorID, s.SubscriptionInterval,s.SubscriptionIntervalType, '', s.IsUpsell, s.GiftRegistryForCustomerID,s.RecurringInterval, s.RecurringIntervalType, s.ExtensionData, s.FreeShipping, s.CustomerEntersPrice, s.IsAKit, s.IsAPack
    FROM dbo.ShoppingCart s 
        join @tmp1 a
            on s.customerid = a.customerid and
               s.carttype = a.carttype and 
               s.productid = a.productid and 
               s.variantid = a.variantid and 
               s.chosencolor = a.chosencolor and 
               s.chosensize = a.chosensize and 
               convert(nvarchar(4000), s.textoption)  = convert(nvarchar(4000), a.textoption) 
        join @tmp2 c on s.ShoppingCartRecID = c.cartid
 

    BEGIN TRAN
        INSERT [dbo].ShoppingCart (ShoppingCartRecGUID, CustomerID,ProductSKU, ProductPrice, ProductWeight, ProductID, VariantID, Quantity,ChosenColor, ChosenColorSKUModifier, ChosenSize, ChosenSizeSKUModifier,IsTaxable, IsShipSeparately, IsDownload, DownloadLocation, CreatedOn,ProductDimensions, CartType, IsSecureAttachment, TextOption,NextRecurringShipDate, RecurringIndex, OriginalRecurringOrderNumber,RecurringSubscriptionID, BillingAddressID, ShippingAddressID,ShippingMethodID, ShippingMethod, DistributorID, SubscriptionInterval,SubscriptionIntervalType, Notes, IsUpsell, GiftRegistryForCustomerID,RecurringInterval, RecurringIntervalType, ExtensionData, FreeShipping, CustomerEntersPrice, IsAKit, IsAPack)
        SELECT ShoppingCartRecGUID, CustomerID, ProductSKU, ProductPrice,ProductWeight, ProductID, VariantID, Quantity, ChosenColor,ChosenColorSKUModifier, ChosenSize, ChosenSizeSKUModifier, IsTaxable,IsShipSeparately, IsDownload, DownloadLocation, CreatedOn,ProductDimensions, CartType, IsSecureAttachment, TextOption,NextRecurringShipDate, RecurringIndex, OriginalRecurringOrderNumber,RecurringSubscriptionID, BillingAddressID, ShippingAddressID,ShippingMethodID, ShippingMethod, DistributorID, SubscriptionInterval,SubscriptionIntervalType, Notes, IsUpsell, GiftRegistryForCustomerID,RecurringInterval, RecurringIntervalType, ExtensionData, FreeShipping, CustomerEntersPrice, IsAKit, IsAPack
        FROM @tmpShoppingCart2
 
        IF @@Error <>0 BEGIN
            ROLLBACK TRAN
            RAISERROR('Could not add new shopping cart records', 16, 1)
            RETURN -1
        END
 
 
 
        INSERT [dbo].KitCart(CustomerID, ShoppingCartRecID, ProductID,VariantID, KitGroupID, KitGroupTypeID, KitItemID, TextOption, Quantity,CartType, OriginalRecurringOrderNumber, ExtensionData, InventoryVariantID, InventoryVariantColor,InventoryVariantSize, CreatedOn)        
        SELECT k.CustomerID, s.ShoppingCartRecID, k.ProductID, k.VariantID,k.KitGroupID, k.KitGroupTypeID, k.KitItemID, k.TextOption, k.Quantity,k.CartType, k.OriginalRecurringOrderNumber, k.ExtensionData, k.InventoryVariantID, k.InventoryVariantColor,k.InventoryVariantSize, k.CreatedOn
        FROM dbo.KitCart k 
            join @tmpShoppingCart2 c on k.ShoppingCartRecID = c.oldCartID 
            join [dbo].ShoppingCart s with (nolock) on s.ShoppingCartRecGUID = c.ShoppingCartRecGUID
 
        IF @@Error <>0 BEGIN
            ROLLBACK TRAN
            RAISERROR('Could not add new kit cart records', 16, 1)
            RETURN -2
        END
 

        INSERT [dbo].CustomCart (CustomerID, PackID, ShoppingCartRecID,ProductSKU, ProductWeight, ProductID, VariantID, Quantity, ChosenColor,ChosenColorSKUModifier, ChosenSize, ChosenSizeSKUModifier, CartType,OriginalRecurringOrderNumber, ExtensionData,CreatedOn)        
        SELECT k.CustomerID, k.PackID, s.ShoppingCartRecID, k.ProductSKU,k.ProductWeight, k.ProductID, k.VariantID, k.Quantity, k.ChosenColor,k.ChosenColorSKUModifier, k.ChosenSize, k.ChosenSizeSKUModifier, k.CartType,k.OriginalRecurringOrderNumber, k.ExtensionData,k.CreatedOn
        FROM dbo.CustomCart k 
            join @tmpShoppingCart2 c on k.ShoppingCartRecID = c.oldCartID 
            join [dbo].ShoppingCart s with (nolock) on s.ShoppingCartRecGUID = c.ShoppingCartRecGUID
 
        IF @@Error <>0 BEGIN
            ROLLBACK TRAN
            RAISERROR('Could not add new custom cart records', 16, 1)
            RETURN -3
        END
 

        DELETE dbo.ShoppingCart
        FROM dbo.ShoppingCart s 
            join @tmpCart c on s.ShoppingCartRecID = c.cartid
 
        IF @@Error <>0 BEGIN
            ROLLBACK TRAN
            RAISERROR('Could not delete old shopping cart records', 16, 1)
            RETURN -4
        END
 
        DELETE dbo.KitCart
        FROM dbo.KitCart s
            join @tmpCart c on s.ShoppingCartRecID = c.cartid
 
        IF @@Error <>0 BEGIN
            ROLLBACK TRAN
            RAISERROR('Could not delete old kit cart records', 16, 1)
            RETURN -5
        END
 

        DELETE dbo.CustomCart
        FROM dbo.CustomCart s
            join @tmpCart c on s.ShoppingCartRecID = c.cartid
 
        IF @@Error <>0 BEGIN
            ROLLBACK TRAN
            RAISERROR('Could not delete old custom cart records', 16, 1)
            RETURN -6
        END
 
    COMMIT TRAN
  
    exec sp_xml_removedocument @hdoc
END




GO


create proc dbo.aspdnsf_MarkOrderAsFraud
    @ordernum int,
    @fraudstate int
  
AS
SET NOCOUNT ON
BEGIN
    if @fraudstate=1
        update orders set TransactionState='FRAUD', IsNew=0 where OrderNumber=@ordernum
    else
        update orders 
        set TransactionState= case 
                                when AuthorizedOn > isnull(CapturedOn, '1/1/1900')   and AuthorizedOn > isnull(RefundedOn, '1/1/1900')   and AuthorizedOn > isnull(VoidedOn, '1/1/1900')     then 'AUTHORIZED'
                                when CapturedOn   > isnull(AuthorizedOn, '1/1/1900') and CapturedOn   > isnull(RefundedOn, '1/1/1900')   and CapturedOn   > isnull(VoidedOn, '1/1/1900')     then 'CAPTURED'
                                when RefundedOn   > isnull(CapturedOn, '1/1/1900')   and RefundedOn   > isnull(AuthorizedOn, '1/1/1900') and RefundedOn   > isnull(VoidedOn, '1/1/1900')     then 'REFUNDED'
                                when VoidedOn     > isnull(CapturedOn, '1/1/1900')   and VoidedOn     > isnull(RefundedOn, '1/1/1900')   and VoidedOn     > isnull(AuthorizedOn, '1/1/1900') then 'VOIDED'
                              end,
            IsNew=0 
        where OrderNumber=@ordernum
END



GO


create proc [dbo].[aspdnsf_OrderAvgSummary]
@transactionstate nvarchar(100)
  
AS
BEGIN
SET NOCOUNT ON

SELECT case CountTodayOrders when 0 then 0 else SumTodayOrders/CountTodayOrders end Today,
case CountThisWeekOrders when 0 then 0 else SumThisWeekOrders/CountThisWeekOrders end ThisWeek,
case CountThisMonthOrders when 0 then 0 else SumThisMonthOrders/CountThisMonthOrders end ThisMonth,
case CountThisYearOrders when 0 then 0 else SumThisYearOrders/CountThisYearOrders end ThisYear,
AllTime
FROM
(

select sum(case when datediff(dy, OrderDate, getdate()) = 0 then OrderTotal else 0 end) SumTodayOrders,

sum(case when datediff(dy, OrderDate, getdate()) = 0 then 1 else 0 end) CountTodayOrders,
sum(case when datediff(wk, OrderDate, getdate()) = 0 then OrderTotal else 0 end) SumThisWeekOrders,
sum(case when datediff(wk, OrderDate, getdate()) = 0 then 1 else 0 end) CountThisWeekOrders,
sum(case when datediff(mm, OrderDate, getdate()) = 0 then OrderTotal else 0 end) SumThisMonthOrders,
sum(case when datediff(mm, OrderDate, getdate()) = 0 then 1 else 0 end) CountThisMonthOrders,
sum(case when datediff(yy, OrderDate, getdate()) = 0 then OrderTotal else 0 end) SumThisYearOrders,
sum(case when datediff(yy, OrderDate, getdate()) = 0 then 1 else 0 end) CountThisYearOrders,
avg(OrderTotal) AllTime

from dbo.Orders
where OrderTotal > 0 and TransactionState=@transactionstate

) a
END

GO


CREATE proc [dbo].[aspdnsf_OrderSummary]
    @transactionstate nvarchar(100)
  
AS
BEGIN
SET NOCOUNT ON

SELECT case CountTodayOrder when 0 then 0 else SumTodayOrders/CountTodayOrder end Today,
        case CountThisWeekOrders when 0 then 0 else SumThisWeekOrders/CountThisWeekOrders end ThisWeek,
        case CountThisMonthOrders when 0 then 0 else SumThisMonthOrders/CountThisMonthOrders end ThisMonth,
        case CountThisYearOrders when 0 then 0 else SumThisWeekOrders/SumThisYearOrders end ThisYear,
        AllTime
FROM
(
    select sum(case when datediff(dy, OrderDate, getdate()) = 0 then OrderTotal else 0 end) SumTodayOrders,
            sum(case when datediff(dy, OrderDate,getdate()) = 0 then 1 else 0 end) CountTodayOrder,
            sum(case when datediff(wk, OrderDate, getdate()) = 0 then OrderTotal else 0 end) SumThisWeekOrders,
            sum(case when datediff(wk, OrderDate,getdate()) = 0 then 1 else 0 end) CountThisWeekOrders,
            sum(case when datediff(mm, OrderDate, getdate()) = 0 then OrderTotal else 0 end) SumThisMonthOrders,
            sum(case when datediff(mm,OrderDate,getdate()) = 0 then 1 else 0 end) CountThisMonthOrders,
            sum(case when datediff(yy, OrderDate, getdate()) = 0 then OrderTotal else 0 end) SumThisYearOrders,
            sum(case when datediff(yy, OrderDate,getdate()) = 0 then 1 else 0 end) CountThisYearOrders,
            avg(OrderTotal) AllTime
    from Orders
    where TransactionState=@transactionstate
) a

END



GO


create PROC [dbo].[aspdnsf_ImportOrderShipment_XML]  
 @xmlorder ntext,
 @carrierName ntext  
  
AS  
  
BEGIN  
SET NOCOUNT ON  
  
CREATE TABLE #tmp (ReadyToShip bit, OrderNumber int, TrackingNumber nvarchar(100))  
  
DECLARE @hdoc int, @retcode int  
DECLARE @OrderState nvarchar(10)  
  
EXEC @retcode = sp_xml_preparedocument   
  @hdoc OUTPUT,  
  @xmlorder    
  
INSERT INTO #tmp  
SELECT *
FROM OPENXML(@hdoc, '/shipment/ordershipment',2)  
WITH (ReadyToShip bit, OrderNumber int, TrackingNumber nvarchar(100))  
   
  UPDATE dbo.Orders
  SET  
  ShippingTrackingNumber = t.TrackingNumber,  
  ReadyToShip = t.ReadyToShip,
  ShippedOn = getdate(),
  ShippedVia = @carrierName,
  IsNew = 0
  FROM dbo.Orders o  
  JOIN #tmp t  
  ON o.OrderNumber = t.OrderNumber
    
EXEC sp_xml_removedocument @hdoc  
DROP TABLE #tmp  

  
END  




GO


create proc dbo.aspdnsf_EditOrder
    @OrderNumber int
  
AS
SET NOCOUNT ON

DECLARE @custid int, @custlvl int  
  
SELECT @custid = customerid from dbo.orders with (nolock) where OrderNumber = @OrderNumber  
SELECT @custlvl = CustomerLevelID FROM dbo.Customer with (nolock) WHERE customerid = @custid  
  
DELETE dbo.shoppingcart where customerid = @custid and carttype = 0  
DELETE dbo.CustomCart where customerid = @custid and carttype = 0  
DELETE dbo.KitCart where customerid = @custid and carttype = 0  
  
INSERT dbo.ShoppingCart(ShoppingCartRecGUID, CustomerID, ProductSKU, ProductPrice, ProductWeight, ProductID, VariantID, Quantity, ChosenColor, ChosenColorSKUModifier, ChosenSize, ChosenSizeSKUModifier, DistributorID, IsTaxable, IsShipSeparately, IsDownload, DownloadLocation, FreeShipping, CreatedOn, ProductDimensions, CartType, IsSecureAttachment, TextOption,ShippingAddressID, IsUpsell, CustomerEntersPrice, IsAKit, IsAPack, IsSystem, TaxClassID, TaxRate, RequiresCount)  
SELECT  newid(), os.CustomerID, os.OrderedProductSKU, case when isnull(pv.saleprice, 0) = 0 then  pv.Price else pv.saleprice end, pv.Weight, os.ProductID, os.VariantID, os.Quantity, os.ChosenColor, os.ChosenColorSKUModifier, os.ChosenSize, os.ChosenSizeSKUModifier, os.DistributorID, os.IsTaxable, os.IsShipSeparately, os.IsDownload, os.DownloadLocation, os.FreeShipping, getdate(), pv.Dimensions, 0, os.IsSecureAttachment, os.TextOption,os.ShippingAddressID, 0, os.CustomerEntersPrice, os.IsAKit, os.IsAPack, os.IsSystem, os.TaxClassID, os.TaxRate, ShoppingCartRecID  
FROM dbo.orders_shoppingcart os with (NOLOCK)  
    join dbo.product p with (NOLOCK) on os.productid = p.productid  
    join dbo.productvariant pv with (NOLOCK) on os.variantid = pv.variantid  
WHERE os.OrderNumber = @OrderNumber  
  
INSERT dbo.CustomCart(CartType, ChosenColor, ChosenColorSKUModifier, ChosenSize, ChosenSizeSKUModifier, CreatedOn, CustomerID, ExtensionData, PackID, ProductID, ProductSKU, ProductWeight, Quantity, ShoppingCartRecID, VariantID)  
SELECT 0, cc.ChosenColor, cc.ChosenColorSKUModifier, cc.ChosenSize, cc.ChosenSizeSKUModifier, getdate(), cc.CustomerID, cc.ExtensionData, cc.PackID, cc.ProductID, cc.ProductSKU, cc.ProductWeight, cc.Quantity, s.ShoppingCartRecID, cc.VariantID  
FROM dbo.orders_CustomCart cc with (NOLOCK)  
    join dbo.orders_shoppingcart os with (NOLOCK) on cc.ShoppingCartRecID = os.ShoppingCartRecID  
    join dbo.ShoppingCart s with (NOLOCK) on os.ShoppingCartRecID = s.RequiresCount  
WHERE os.OrderNumber = @OrderNumber  
  
INSERT dbo.KitCart(CartType, CreatedOn, CustomerID, ExtensionData, InventoryVariantColor, InventoryVariantID, InventoryVariantSize, KitGroupID, KitGroupTypeID, KitItemID, ProductID, Quantity, ShoppingCartRecID, TextOption, VariantID)  
SELECT 0, getdate(), kc.CustomerID, kc.ExtensionData, kc.InventoryVariantColor, kc.InventoryVariantID, kc.InventoryVariantSize, kc.KitGroupID, kc.KitGroupTypeID, kc.KitItemID, kc.ProductID, kc.Quantity, s.ShoppingCartRecID, kc.TextOption, kc.VariantID  
FROM dbo.orders_KitCart kc with (NOLOCK)   
    join dbo.orders_shoppingcart os with (NOLOCK) on kc.ShoppingCartRecID = os.ShoppingCartRecID  
    join dbo.ShoppingCart s with (NOLOCK) on os.ShoppingCartRecID = s.RequiresCount  
WHERE os.OrderNumber = @OrderNumber  
  
UPDATE ShoppingCart SET RequiresCount = 0 WHERE customerid = @custid and carttype = 0  



GO


create proc dbo.aspdnsf_getOrder
    @ordernumber int
  
AS
SET NOCOUNT ON 

SELECT 
    o.OrderNumber,
    o.OrderGUID,
    o.ParentOrderNumber,
    o.StoreVersion,
    o.QuoteCheckout,
    o.IsNew,
    o.ShippedOn,
    o.CustomerID,
    o.CustomerGUID,
    o.Referrer,
    o.SkinID,
    o.LastName,
    o.FirstName,
    o.Email,
    o.Notes,
    o.BillingEqualsShipping,
    o.BillingLastName,
    o.BillingFirstName,
    o.BillingCompany,
    o.BillingAddress1,
    o.BillingAddress2,
    o.BillingSuite,
    o.BillingCity,
    o.BillingState,
    o.BillingZip,
    o.BillingCountry,
    o.BillingPhone,
    o.ShippingLastName,
    o.ShippingFirstName,
    o.ShippingCompany,
    o.ShippingResidenceType,
    o.ShippingAddress1,
    o.ShippingAddress2,
    o.ShippingSuite,
    o.ShippingCity,
    o.ShippingState,
    o.ShippingZip,
    o.ShippingCountry,
    o.ShippingMethodID,
    o.ShippingMethod,
    o.ShippingPhone,
    o.ShippingCalculationID,
    o.Phone,
    o.RegisterDate,
    o.AffiliateID,
    o.CouponCode,
    o.CouponType,
    o.CouponDescription,
    o.CouponDiscountAmount,
    o.CouponDiscountPercent,
    o.CouponIncludesFreeShipping,
    o.OkToEmail,
    o.Deleted,
    o.CardType,
    o.CardName,
    o.CardNumber,
    o.CardExpirationMonth,
    o.CardExpirationYear,
    o.OrderSubtotal,
    o.OrderTax,
    o.OrderShippingCosts,
    o.OrderTotal,
    o.PaymentGateway,
    o.AuthorizationCode,
    o.AuthorizationResult,
    o.AuthorizationPNREF,
    o.TransactionCommand,
    o.OrderDate,
    o.LevelID,
    o.LevelName,
    o.LevelDiscountPercent,
    o.LevelDiscountAmount,
    o.LevelHasFreeShipping,
    o.LevelAllowsQuantityDiscounts,
    o.LevelHasNoTax,
    o.LevelAllowsCoupons,
    o.LevelDiscountsApplyToExtendedPrices,
    o.LastIPAddress,
    o.PaymentMethod,
    o.OrderNotes,
    o.PONumber,
    o.DownloadEmailSentOn,
    o.ReceiptEmailSentOn,
    o.DistributorEmailSentOn,
    o.ShippingTrackingNumber,
    o.ShippedVIA,
    o.CustomerServiceNotes,
    o.RTShipRequest,
    o.RTShipResponse,
    o.TransactionState,
    o.AVSResult,
    o.CaptureTXCommand,
    o.CaptureTXResult,
    o.VoidTXCommand,
    o.VoidTXResult,
    o.RefundTXCommand,
    o.RefundTXResult,
    o.CardinalLookupResult,
    o.CardinalAuthenticateResult,
    o.CardinalGatewayParms,
    o.AffiliateCommissionRecorded,
    o.OrderOptions,
    o.OrderWeight,
    o.eCheckBankABACode,
    o.eCheckBankAccountNumber,
    o.eCheckBankAccountType,
    o.eCheckBankName,
    o.eCheckBankAccountName,
    o.CarrierReportedRate,
    o.CarrierReportedWeight,
    o.LocaleSetting,
    o.FinalizationData,
    o.ExtensionData,
    o.AlreadyConfirmed,
    o.CartType,
    o.THUB_POSTED_TO_ACCOUNTING,
    o.THUB_POSTED_DATE,
    o.THUB_ACCOUNTING_REF,
    o.Last4,
    o.ReadyToShip,
    o.IsPrinted,
    o.AuthorizedOn,
    o.CapturedOn,
    o.RefundedOn,
    o.VoidedOn,
    o.EditedOn,
    o.InventoryWasReduced,
    o.MaxMindFraudScore,
    o.MaxMindDetails,
    o.CardStartDate,
    o.CardIssueNumber,
    o.TransactionType,
    o.Crypt,
    o.VATRegistrationID,
    o.FraudedOn,
    o.RefundReason,
    o.AuthorizationPNREF as TransactionID,
    o.RecurringSubscriptionID,
    o.RelatedOrderNumber,

    os.SubscriptionInterval,
    os.SubscriptionIntervalType,
    os.ShoppingCartRecID,
    os.IsTaxable,
    os.IsShipSeparately,
    os.IsDownload,
    os.DownloadLocation,
    os.FreeShipping,
    os.DistributorID,
    os.ShippingDetail,
    os.TaxClassID,
    os.TaxRate,
    os.Notes,
    os.CustomerEntersPrice,
    os.ProductID,
    os.VariantID,
    os.Quantity,
    os.ChosenColor,
    os.ChosenColorSKUModifier,
    os.ChosenSize,
    os.ChosenSizeSKUModifier,
    os.TextOption,
    os.SizeOptionPrompt,
    os.ColorOptionPrompt,
    os.TextOptionPrompt,
    os.CustomerEntersPricePrompt,
    os.OrderedProductQuantityDiscountID,
    os.OrderedProductQuantityDiscountName,
    os.OrderedProductQuantityDiscountPercent,
    os.OrderedProductName,
    os.OrderedProductVariantName,
    os.OrderedProductSKU,
    os.OrderedProductManufacturerPartNumber ,
    os.OrderedProductPrice,
    os.OrderedProductWeight,
    os.OrderedProductPrice,
    os.ShippingMethodID,
    os.GiftRegistryForCustomerID,
    os.ShippingAddressID,
    os.IsAKit,
    os.IsAPack
FROM Orders o with (nolock) 
    left join orders_ShoppingCart os with (nolock) ON os.OrderNumber = o.OrderNumber 
WHERE o.OrderNumber = @ordernumber 
ORDER BY os.GiftRegistryForCustomerID,os.ShippingAddressID


GO


create proc dbo.aspdnsf_updOrders
    @OrderNumber int,
    @ParentOrderNumber int = null,
    @StoreVersion nvarchar(100) = null,
    @QuoteCheckout tinyint = null,
    @IsNew tinyint = null,
    @ShippedOn datetime = null,
    @CustomerID int = null,
    @CustomerGUID uniqueidentifier = null,
    @Referrer ntext = null,
    @SkinID int = null,
    @LastName nvarchar(100) = null,
    @FirstName nvarchar(100) = null,
    @Email nvarchar(100) = null,
    @Notes ntext = null,
    @BillingEqualsShipping tinyint = null,
    @BillingLastName nvarchar(100) = null,
    @BillingFirstName nvarchar(100) = null,
    @BillingCompany nvarchar(100) = null,
    @BillingAddress1 nvarchar(100) = null,
    @BillingAddress2 nvarchar(100) = null,
    @BillingSuite nvarchar(50) = null,
    @BillingCity nvarchar(100) = null,
    @BillingState nvarchar(100) = null,
    @BillingZip nvarchar(10) = null,
    @BillingCountry nvarchar(100) = null,
    @BillingPhone nvarchar(25) = null,
    @ShippingLastName nvarchar(100) = null,
    @ShippingFirstName nvarchar(100) = null,
    @ShippingCompany nvarchar(100) = null,
    @ShippingResidenceType int = null,
    @ShippingAddress1 nvarchar(100) = null,
    @ShippingAddress2 nvarchar(100) = null,
    @ShippingSuite nvarchar(50) = null,
    @ShippingCity nvarchar(100) = null,
    @ShippingState nvarchar(100) = null,
    @ShippingZip nvarchar(10) = null,
    @ShippingCountry nvarchar(100) = null,
    @ShippingMethodID int = null,
    @ShippingMethod ntext = null,
    @ShippingPhone nvarchar(25) = null,
    @ShippingCalculationID int = null,
    @Phone nvarchar(20) = null,
    @RegisterDate datetime = null,
    @AffiliateID int = null,
    @CouponCode nvarchar(50) = null,
    @CouponType int = null,
    @CouponDescription ntext = null,
    @CouponDiscountAmount money = null,
    @CouponDiscountPercent money = null,
    @CouponIncludesFreeShipping tinyint = null,
    @OkToEmail tinyint = null,
    @Deleted tinyint = null,
    @CardType nvarchar(20) = null,
    @CardName nvarchar(100) = null,
    @CardNumber ntext = null,
    @CardExpirationMonth nvarchar(10) = null,
    @CardExpirationYear nvarchar(10) = null,
    @OrderSubtotal money = null,
    @OrderTax money = null,
    @OrderShippingCosts money = null,
    @OrderTotal money = null,
    @PaymentGateway nvarchar(50) = null,
    @AuthorizationCode nvarchar(100) = null,
    @AuthorizationResult ntext = null,
    @AuthorizationPNREF nvarchar(100) = null,
    @TransactionCommand ntext = null,
    @OrderDate datetime = null,
    @LevelID int = null,
    @LevelName nvarchar(100) = null,
    @LevelDiscountPercent money = null,
    @LevelDiscountAmount money = null,
    @LevelHasFreeShipping tinyint = null,
    @LevelAllowsQuantityDiscounts tinyint = null,
    @LevelHasNoTax tinyint = null,
    @LevelAllowsCoupons tinyint = null,
    @LevelDiscountsApplyToExtendedPrices tinyint = null,
    @LastIPAddress varchar(40) = null,
    @PaymentMethod nvarchar(100) = null,
    @OrderNotes ntext = null,
    @PONumber nvarchar(50) = null,
    @DownloadEmailSentOn datetime = null,
    @ReceiptEmailSentOn datetime = null,
    @DistributorEmailSentOn datetime = null,
    @ShippingTrackingNumber nvarchar(100) = null,
    @ShippedVIA nvarchar(100) = null,
    @CustomerServiceNotes ntext = null,
    @RTShipRequest ntext = null,
    @RTShipResponse ntext = null,
    @TransactionState nvarchar(20) = null,
    @AVSResult nvarchar(50) = null,
    @CaptureTXCommand ntext = null,
    @CaptureTXResult ntext = null,
    @VoidTXCommand ntext = null,
    @VoidTXResult ntext = null,
    @RefundTXCommand ntext = null,
    @RefundTXResult ntext = null,
    @CardinalLookupResult ntext = null,
    @CardinalAuthenticateResult ntext = null,
    @CardinalGatewayParms ntext = null,
    @AffiliateCommissionRecorded tinyint = null,
    @OrderOptions ntext = null,
    @OrderWeight money = null,
    @eCheckBankABACode ntext = null,
    @eCheckBankAccountNumber ntext = null,
    @eCheckBankAccountType ntext = null,
    @eCheckBankName ntext = null,
    @eCheckBankAccountName ntext = null,
    @CarrierReportedRate ntext = null,
    @CarrierReportedWeight ntext = null,
    @LocaleSetting nvarchar(10) = null,
    @FinalizationData ntext = null,
    @ExtensionData ntext = null,
    @AlreadyConfirmed tinyint = null,
    @CartType int = null,
    @THUB_POSTED_TO_ACCOUNTING char(1) = null,
    @THUB_POSTED_DATE datetime = null,
    @THUB_ACCOUNTING_REF char(25) = null,
    @Last4 nvarchar(4) = null,
    @ReadyToShip tinyint = null,
    @IsPrinted tinyint = null,
    @AuthorizedOn datetime = null,
    @CapturedOn datetime = null,
    @RefundedOn datetime = null,
    @VoidedOn datetime = null,
    @InventoryWasReduced int = null,
    @MaxMindFraudScore decimal(5, 2) = null,
    @MaxMindDetails ntext = null,
    @CardStartDate nvarchar(20) = null,
    @CardIssueNumber nvarchar(25) = null,
    @TransactionType int = null,
    @Crypt int = null,
    @VATRegistrationID ntext = null,
    @FraudedOn tinyint = null,
    @RefundReason ntext = null
  
AS
SET NOCOUNT ON 


UPDATE dbo.Orders
SET 
    ParentOrderNumber = COALESCE(@ParentOrderNumber, ParentOrderNumber),
    StoreVersion = COALESCE(@StoreVersion, StoreVersion),
    QuoteCheckout = COALESCE(@QuoteCheckout, QuoteCheckout),
    IsNew = COALESCE(@IsNew, IsNew),
    ShippedOn = COALESCE(@ShippedOn, ShippedOn),
    CustomerID = COALESCE(@CustomerID, CustomerID),
    CustomerGUID = COALESCE(@CustomerGUID, CustomerGUID),
    Referrer = COALESCE(@Referrer, Referrer),
    SkinID = COALESCE(@SkinID, SkinID),
    LastName = COALESCE(@LastName, LastName),
    FirstName = COALESCE(@FirstName, FirstName),
    Email = COALESCE(@Email, Email),
    Notes = COALESCE(@Notes, Notes),
    BillingEqualsShipping = COALESCE(@BillingEqualsShipping, BillingEqualsShipping),
    BillingLastName = COALESCE(@BillingLastName, BillingLastName),
    BillingFirstName = COALESCE(@BillingFirstName, BillingFirstName),
    BillingCompany = COALESCE(@BillingCompany, BillingCompany),
    BillingAddress1 = COALESCE(@BillingAddress1, BillingAddress1),
    BillingAddress2 = COALESCE(@BillingAddress2, BillingAddress2),
    BillingSuite = COALESCE(@BillingSuite, BillingSuite),
    BillingCity = COALESCE(@BillingCity, BillingCity),
    BillingState = COALESCE(@BillingState, BillingState),
    BillingZip = COALESCE(@BillingZip, BillingZip),
    BillingCountry = COALESCE(@BillingCountry, BillingCountry),
    BillingPhone = COALESCE(@BillingPhone, BillingPhone),
    ShippingLastName = COALESCE(@ShippingLastName, ShippingLastName),
    ShippingFirstName = COALESCE(@ShippingFirstName, ShippingFirstName),
    ShippingCompany = COALESCE(@ShippingCompany, ShippingCompany),
    ShippingResidenceType = COALESCE(@ShippingResidenceType, ShippingResidenceType),
    ShippingAddress1 = COALESCE(@ShippingAddress1, ShippingAddress1),
    ShippingAddress2 = COALESCE(@ShippingAddress2, ShippingAddress2),
    ShippingSuite = COALESCE(@ShippingSuite, ShippingSuite),
    ShippingCity = COALESCE(@ShippingCity, ShippingCity),
    ShippingState = COALESCE(@ShippingState, ShippingState),
    ShippingZip = COALESCE(@ShippingZip, ShippingZip),
    ShippingCountry = COALESCE(@ShippingCountry, ShippingCountry),
    ShippingMethodID = COALESCE(@ShippingMethodID, ShippingMethodID),
    ShippingMethod = COALESCE(@ShippingMethod, ShippingMethod),
    ShippingPhone = COALESCE(@ShippingPhone, ShippingPhone),
    ShippingCalculationID = COALESCE(@ShippingCalculationID, ShippingCalculationID),
    Phone = COALESCE(@Phone, Phone),
    RegisterDate = COALESCE(@RegisterDate, RegisterDate),
    AffiliateID = COALESCE(@AffiliateID, AffiliateID),
    CouponCode = COALESCE(@CouponCode, CouponCode),
    CouponType = COALESCE(@CouponType, CouponType),
    CouponDescription = COALESCE(@CouponDescription, CouponDescription),
    CouponDiscountAmount = COALESCE(@CouponDiscountAmount, CouponDiscountAmount),
    CouponDiscountPercent = COALESCE(@CouponDiscountPercent, CouponDiscountPercent),
    CouponIncludesFreeShipping = COALESCE(@CouponIncludesFreeShipping, CouponIncludesFreeShipping),
    OkToEmail = COALESCE(@OkToEmail, OkToEmail),
    Deleted = COALESCE(@Deleted, Deleted),
    CardType = COALESCE(@CardType, CardType),
    CardName = COALESCE(@CardName, CardName),
    CardNumber = COALESCE(@CardNumber, CardNumber),
    CardExpirationMonth = COALESCE(@CardExpirationMonth, CardExpirationMonth),
    CardExpirationYear = COALESCE(@CardExpirationYear, CardExpirationYear),
    OrderSubtotal = COALESCE(@OrderSubtotal, OrderSubtotal),
    OrderTax = COALESCE(@OrderTax, OrderTax),
    OrderShippingCosts = COALESCE(@OrderShippingCosts, OrderShippingCosts),
    OrderTotal = COALESCE(@OrderTotal, OrderTotal),
    PaymentGateway = COALESCE(@PaymentGateway, PaymentGateway),
    AuthorizationCode = COALESCE(@AuthorizationCode, AuthorizationCode),
    AuthorizationResult = COALESCE(@AuthorizationResult, AuthorizationResult),
    AuthorizationPNREF = COALESCE(@AuthorizationPNREF, AuthorizationPNREF),
    TransactionCommand = COALESCE(@TransactionCommand, TransactionCommand),
    OrderDate = COALESCE(@OrderDate, OrderDate),
    LevelID = COALESCE(@LevelID, LevelID),
    LevelName = COALESCE(@LevelName, LevelName),
    LevelDiscountPercent = COALESCE(@LevelDiscountPercent, LevelDiscountPercent),
    LevelDiscountAmount = COALESCE(@LevelDiscountAmount, LevelDiscountAmount),
    LevelHasFreeShipping = COALESCE(@LevelHasFreeShipping, LevelHasFreeShipping),
    LevelAllowsQuantityDiscounts = COALESCE(@LevelAllowsQuantityDiscounts, LevelAllowsQuantityDiscounts),
    LevelHasNoTax = COALESCE(@LevelHasNoTax, LevelHasNoTax),
    LevelAllowsCoupons = COALESCE(@LevelAllowsCoupons, LevelAllowsCoupons),
    LevelDiscountsApplyToExtendedPrices = COALESCE(@LevelDiscountsApplyToExtendedPrices, LevelDiscountsApplyToExtendedPrices),
    LastIPAddress = COALESCE(@LastIPAddress, LastIPAddress),
    PaymentMethod = COALESCE(@PaymentMethod, PaymentMethod),
    OrderNotes = COALESCE(@OrderNotes, OrderNotes),
    PONumber = COALESCE(@PONumber, PONumber),
    DownloadEmailSentOn = COALESCE(@DownloadEmailSentOn, DownloadEmailSentOn),
    ReceiptEmailSentOn = COALESCE(@ReceiptEmailSentOn, ReceiptEmailSentOn),
    DistributorEmailSentOn = COALESCE(@DistributorEmailSentOn, DistributorEmailSentOn),
    ShippingTrackingNumber = COALESCE(@ShippingTrackingNumber, ShippingTrackingNumber),
    ShippedVIA = COALESCE(@ShippedVIA, ShippedVIA),
    CustomerServiceNotes = COALESCE(@CustomerServiceNotes, CustomerServiceNotes),
    RTShipRequest = COALESCE(@RTShipRequest, RTShipRequest),
    RTShipResponse = COALESCE(@RTShipResponse, RTShipResponse),
    TransactionState = COALESCE(@TransactionState, TransactionState),
    AVSResult = COALESCE(@AVSResult, AVSResult),
    CaptureTXCommand = COALESCE(@CaptureTXCommand, CaptureTXCommand),
    CaptureTXResult = COALESCE(@CaptureTXResult, CaptureTXResult),
    VoidTXCommand = COALESCE(@VoidTXCommand, VoidTXCommand),
    VoidTXResult = COALESCE(@VoidTXResult, VoidTXResult),
    RefundTXCommand = COALESCE(@RefundTXCommand, RefundTXCommand),
    RefundTXResult = COALESCE(@RefundTXResult, RefundTXResult),
    CardinalLookupResult = COALESCE(@CardinalLookupResult, CardinalLookupResult),
    CardinalAuthenticateResult = COALESCE(@CardinalAuthenticateResult, CardinalAuthenticateResult),
    CardinalGatewayParms = COALESCE(@CardinalGatewayParms, CardinalGatewayParms),
    AffiliateCommissionRecorded = COALESCE(@AffiliateCommissionRecorded, AffiliateCommissionRecorded),
    OrderOptions = COALESCE(@OrderOptions, OrderOptions),
    OrderWeight = COALESCE(@OrderWeight, OrderWeight),
    eCheckBankABACode = COALESCE(@eCheckBankABACode, eCheckBankABACode),
    eCheckBankAccountNumber = COALESCE(@eCheckBankAccountNumber, eCheckBankAccountNumber),
    eCheckBankAccountType = COALESCE(@eCheckBankAccountType, eCheckBankAccountType),
    eCheckBankName = COALESCE(@eCheckBankName, eCheckBankName),
    eCheckBankAccountName = COALESCE(@eCheckBankAccountName, eCheckBankAccountName),
    CarrierReportedRate = COALESCE(@CarrierReportedRate, CarrierReportedRate),
    CarrierReportedWeight = COALESCE(@CarrierReportedWeight, CarrierReportedWeight),
    LocaleSetting = COALESCE(@LocaleSetting, LocaleSetting),
    FinalizationData = COALESCE(@FinalizationData, FinalizationData),
    ExtensionData = COALESCE(@ExtensionData, ExtensionData),
    AlreadyConfirmed = COALESCE(@AlreadyConfirmed, AlreadyConfirmed),
    CartType = COALESCE(@CartType, CartType),
    THUB_POSTED_TO_ACCOUNTING = COALESCE(@THUB_POSTED_TO_ACCOUNTING, THUB_POSTED_TO_ACCOUNTING),
    THUB_POSTED_DATE = COALESCE(@THUB_POSTED_DATE, THUB_POSTED_DATE),
    THUB_ACCOUNTING_REF = COALESCE(@THUB_ACCOUNTING_REF, THUB_ACCOUNTING_REF),
    Last4 = COALESCE(@Last4, Last4),
    ReadyToShip = COALESCE(@ReadyToShip, ReadyToShip),
    IsPrinted = COALESCE(@IsPrinted, IsPrinted),
    AuthorizedOn = COALESCE(@AuthorizedOn, AuthorizedOn),
    CapturedOn = COALESCE(@CapturedOn, CapturedOn),
    RefundedOn = COALESCE(@RefundedOn, RefundedOn),
    VoidedOn = COALESCE(@VoidedOn, VoidedOn),
    InventoryWasReduced = COALESCE(@InventoryWasReduced, InventoryWasReduced),
    MaxMindFraudScore = COALESCE(@MaxMindFraudScore, MaxMindFraudScore),
    MaxMindDetails = COALESCE(@MaxMindDetails, MaxMindDetails),
    CardStartDate = COALESCE(@CardStartDate, CardStartDate),
    CardIssueNumber = COALESCE(@CardIssueNumber, CardIssueNumber),
    TransactionType = COALESCE(@TransactionType, TransactionType),
    Crypt = COALESCE(@Crypt, Crypt),
    VATRegistrationID = COALESCE(@VATRegistrationID, VATRegistrationID),
    FraudedOn = COALESCE(@FraudedOn, FraudedOn),
    RefundReason = COALESCE(@RefundReason, RefundReason)
WHERE OrderNumber = @OrderNumber



GO


create proc dbo.aspdnsf_GetCartCategoryCountsByProduct
    @CustomerID int
  
AS
BEGIN
    SELECT pc.productid, pc.categoryid, sum(a.Quantity) CategoryQty
    FROM dbo.productcategory pc with (nolock) 
        join
        (select pc1.categoryid, sum(Quantity) Quantity
         from dbo.shoppingcart sc with (nolock) 
         join [dbo].productcategory pc1 with (nolock) on sc.productid = pc1.productid
         where sc.customerid = @CustomerID
         group by pc1.categoryid
        ) a on pc.categoryid = a.categoryid
        join (select distinct productid from dbo.shoppingcart with (nolock) where customerid = @CustomerID) b on pc.productid = b.productid 
    GROUP BY pc.productid, pc.categoryid
    ORDER BY pc.productid, pc.categoryid
END

GO


CREATE PROC dbo.aspdnsf_SearchProductComments
    @Search			varchar(1000) = '',
    @CustomerID		int = null,
    @FilthyOnly		tinyint = 0,
    @Sort			tinyint = 1,
    @days			int = 7,
	@storeID		int = 1,
	@FilterByStore	tinyint = 0
  
AS
BEGIN
    SET NOCOUNT ON 

    CREATE TABLE #tmpProductComments(
        [RatingID] [int] NOT NULL,
        [ProductID] [int] NOT NULL,
        [CustomerID] [int] NOT NULL,
        [Rating] [int] NOT NULL,
        [Comments] [ntext] NULL,
        [FoundHelpful] [int] NOT NULL,
        [FoundNotHelpful] [int] NOT NULL,
        [CreatedOn] [datetime] NOT NULL,
        [ProductName] [nvarchar](400) NULL,
        [FirstName] [nvarchar](100) NULL,
        [LastName] [nvarchar](100) NULL,
        [IsFilthy] [tinyint] NOT NULL
    ) 

    IF RTRIM(@Search) = '' and @CustomerID = null and @FilthyOnly = 0 BEGIN
        SELECT @days = convert(int, ConfigValue) FROM dbo.AppConfig with (nolock) WHERE Name = 'RecentCommentHistoryDays'
        
        IF @days = 0 
            SET @days = 7

        INSERT #tmpProductComments
        SELECT     
            r.RatingID, 
            r.ProductID, 
            r.CustomerID, 
            r.Rating, 
            r.Comments, 
            r.FoundHelpful, 
            r.FoundNotHelpful, 
            r.CreatedOn, 
            p.Name ProductName, 
            c.FirstName, 
            c.LastName, 
            r.IsFilthy
        FROM dbo.Rating r with (nolock) 
            left join dbo.Customer c with (nolock) ON r.CustomerID = c.CustomerID 
            left join dbo.Product p with (nolock) ON r.ProductID = p.ProductID 
        WHERE r.HasComment = 1
             AND p.Deleted = 0 
             AND p.Published = 1
             AND r.IsFilthy >= @FilthyOnly
             AND r.CustomerID = COALESCE(@CustomerID, r.CustomerID)
             AND r.CreatedOn >= dateadd(dy, -@days, getdate())
			 AND (0 = @FilterByStore OR r.StoreID = @storeID)
    END
    ELSE BEGIN
        SET @Search = '%' + @Search + '%'
        INSERT #tmpProductComments
        SELECT     
            r.RatingID, 
            r.ProductID, 
            r.CustomerID, 
            r.Rating, 
            r.Comments, 
            r.FoundHelpful, 
            r.FoundNotHelpful, 
            r.CreatedOn, 
            p.Name ProductName, 
            c.FirstName, 
            c.LastName, 
            r.IsFilthy
        FROM dbo.Rating r with (nolock) 
            left join dbo.Customer c with (nolock) ON r.CustomerID = c.CustomerID 
            left join dbo.Product p with (nolock) ON r.ProductID = p.ProductID 
        WHERE r.HasComment = 1
             AND p.Deleted = 0 
             AND p.Published = 1
             AND r.IsFilthy >= @FilthyOnly
             AND r.CustomerID = COALESCE(@CustomerID, r.CustomerID)
             AND isnull(r.Comments, '') like @Search
			 AND (0 = @FilterByStore OR r.StoreID = @storeID)
    END

    IF @Sort = 1 
        SELECT * FROM #tmpProductComments ORDER BY FoundHelpful desc, CreatedOn desc
    ELSE IF @Sort = 2
        SELECT * FROM #tmpProductComments ORDER BY FoundHelpful asc, CreatedOn desc 
    ELSE IF @Sort = 3
        SELECT * FROM #tmpProductComments ORDER BY CreatedOn desc
    ELSE IF @Sort = 4
        SELECT * FROM #tmpProductComments ORDER BY CreatedOn
    ELSE IF @Sort = 5
        SELECT * FROM #tmpProductComments ORDER BY Rating desc, CreatedOn desc
    ELSE IF @Sort = 6
        SELECT * FROM #tmpProductComments ORDER BY Rating asc, CreatedOn desc
END


GO


create proc [dbo].[aspdnsf_getBadWord]
    @BadWordID int   = null
  
AS
SET NOCOUNT ON 
SELECT [BadWordID],
      [LocaleSetting],
      [Word],
      [CreatedOn]
FROM [dbo].[BadWord] with (nolock) 
WHERE [BadWordID] = COALESCE(@BadWordID,[BadWordID])
ORDER BY BadWordID




GO


create proc [dbo].[aspdnsf_insBadWord]
    @LocaleSetting nvarchar(10),
    @Word nvarchar(100),
    @BadWordID int OUTPUT
      
AS
SET NOCOUNT ON 

INSERT INTO [dbo].[BadWord] (LocaleSetting, Word, CreatedOn)
VALUES(@LocaleSetting,@Word,getdate())

set @BadWordId = @@Identity



GO


create proc [dbo].[aspdnsf_updBadWord]
    @BadWordID int,
    @LocaleSetting nvarchar(10)      = null,
    @Word nvarchar(100)              = null
  
AS    
UPDATE [dbo].[BadWord]
   SET [LocaleSetting]               = COALESCE(@LocaleSetting,[LocaleSetting]),
       [Word]                        = COALESCE(@Word,[Word])
 WHERE BadWordID = @BadWordID



GO


create proc [dbo].[aspdnsf_GetRecentComments]
    @votingcustomer int,
    @pagesize int = 20,
    @pagenum int = 1,
    @sort tinyint = 0,
    @categoryid int = 0
  
AS
BEGIN
    SET NOCOUNT ON

    CREATE TABLE #tmp (rownum int not null identity, RatingID int, ProductID int, CustomerID int, Rating int, Comments ntext, FoundHelpful tinyint, FoundNotHelpful tinyint, CreatedOn datetime, IsFilthy tinyint, ProductName nvarchar(400), ProductSEName nvarchar(150), ProductGuid uniqueidentifier, RatingCustomerName nvarchar(200), CommentHelpFul smallint, MyRating tinyint)


    DECLARE @totalcomments int, @cmd nvarchar(4000)

    SET @cmd = N'SELECT  r.RatingID, r.ProductID, r.CustomerID, r.Rating, r.Comments, r.FoundHelpful, 
            r.FoundNotHelpful, r.CreatedOn, r.IsFilthy, 
            p.Name, p.SEName, p.ProductGuid,
            c.FirstName + '' '' + c.LastName RatingCustomerName,
            isnull(convert(smallint, h.HelpFul), -1),
            isnull(r2.Rating, 0)
    FROM dbo.Rating r with (nolock) 
        join [dbo].Customer c with (nolock) ON r.CustomerID = c.CustomerID 
        join [dbo].Product p with (nolock) ON r.ProductID = p.ProductID 
        left join [dbo].RatingCommentHelpfulness h with (nolock) on h.productid = r.ProductID and h.RatingCustomerID = r.CustomerID and h.VotingCustomerID = @votingcustomerid
        left join [dbo].Rating r2 with (nolock) on r2.CustomerID = @votingcustomerid and r.ProductID = r2.ProductID 
    WHERE r.HasComment <> 0 AND p.Deleted = 0 AND p.Published <> 0 '
    + case when @categoryid > 0 then
    'AND r.ProductID in (select productid from [dbo].productcategory where categoryid=' + CAST(@categoryid AS nvarchar(10)) +')'
    else '' end
    + ' ORDER BY ' + case @sort when 0 then 'r.CreatedOn desc' when 1 then 'r.CreatedOn asc' when 2 then 'r.Rating desc, r.CreatedOn desc' when 3 then 'r.Rating asc, r.CreatedOn desc' end

    INSERT #tmp (RatingID, ProductID, CustomerID, Rating, Comments, FoundHelpful, FoundNotHelpful, CreatedOn, IsFilthy, ProductName, ProductSEName, ProductGuid, RatingCustomerName, CommentHelpFul, MyRating)
    EXEC sp_executesql @cmd, N'@votingcustomerid int', @votingcustomerid = @votingcustomer


    SET @totalcomments = @@rowcount

    SELECT * 
    FROM #tmp
    WHERE rownum >= @pagesize*(@pagenum-1)+1 and rownum <= @pagesize*(@pagenum)
    ORDER BY rownum

    SELECT @totalcomments totalcomments, ceiling(@totalcomments*1.0/@pagesize) pages

END



GO


CREATE proc [dbo].[aspdnsf_GetProductComments]
    @ProductID		int,
    @votingcustomer int,
    @pagesize		int = 20,
    @pagenum		int = 1,
    @sort			tinyint = 0,
	@storeID		int = 1
  
AS
BEGIN
    SET NOCOUNT ON

    CREATE TABLE #tmp (rownum int not null identity, RatingID int, ProductID int, CustomerID int, Rating int, 
                       Comments ntext, FoundHelpful tinyint, FoundNotHelpful tinyint, CreatedOn datetime, 
                       IsFilthy tinyint, ProductName nvarchar(400), ProductSEName nvarchar(150), ProductGuid uniqueidentifier, 
                       FirstName nvarchar(100), LastName nvarchar(100),
                       RatingCustomerName nvarchar(200), CommentHelpFul smallint, MyRating tinyint)


    DECLARE @totalcomments int, @cmd nvarchar(4000)

    SET @cmd = N'SELECT  r.RatingID, r.ProductID, r.CustomerID, r.Rating, r.Comments, r.FoundHelpful, 
            r.FoundNotHelpful, r.CreatedOn, r.IsFilthy, 
            p.Name, p.SEName, p.ProductGuid,
            c.FirstName, c.LastName, 
            c.FirstName + '' '' + c.LastName RatingCustomerName,
            isnull(convert(smallint, h.HelpFul), -1),
            isnull(r2.Rating, 0)
    FROM dbo.Rating r with (nolock) 
        join [dbo].Customer c with (nolock) ON r.CustomerID = c.CustomerID 
        join [dbo].Product p with (nolock) ON r.ProductID = p.ProductID 
        left join [dbo].RatingCommentHelpfulness h with (nolock) on h.productid = r.ProductID and h.RatingCustomerID = r.CustomerID and h.VotingCustomerID = @votingcustomerid and h.StoreID = r.StoreID
        left join [dbo].Rating r2 with (nolock) on r2.CustomerID = @votingcustomerid and r.ProductID = r2.ProductID and r2.StoreID = r.StoreID
    WHERE r.HasComment <> 0 AND p.Deleted = 0 AND p.Published <> 0 and r.ProductID = @ProdID and r.StoreID = @store AND r.IsFilthy = 0
    ORDER BY ' + case @sort 
                    when 1 then'r.FoundHelpful desc, r.CreatedOn desc' 
                    when 2 then'r.FoundHelpful asc, r.CreatedOn desc' 
                    when 3 then'r.CreatedOn desc' 
                    when 4 then'r.CreatedOn asc' 
                    when 5 then'r.Rating desc, r.CreatedOn desc' 
                    when 6 then'r.Rating asc, r.CreatedOn desc' 
                 end

    INSERT #tmp (RatingID, ProductID, CustomerID, Rating, Comments, FoundHelpful, FoundNotHelpful, CreatedOn, IsFilthy, ProductName, ProductSEName, ProductGuid, FirstName, LastName, RatingCustomerName, CommentHelpFul, MyRating)
    EXEC sp_executesql @cmd, N'@votingcustomerid int, @ProdID int, @store int', @votingcustomerid = @votingcustomer, @ProdID = @ProductID, @store = @storeID

    SET @totalcomments = @@rowcount

    SELECT @totalcomments totalcomments, ceiling(@totalcomments*1.0/@pagesize) pages

    SELECT * 
    FROM #tmp
    WHERE rownum >= @pagesize*(@pagenum-1)+1 and rownum <= @pagesize*(@pagenum)
    ORDER BY rownum
END




GO


set IDENTITY_INSERT [dbo].PollSortOrder ON;
INSERT [dbo].PollSortOrder(PollSortOrderID,Name) values(1,'As Written');
INSERT [dbo].PollSortOrder(PollSortOrderID,Name) values(2,'Ascending');
INSERT [dbo].PollSortOrder(PollSortOrderID,Name) values(3,'Descending');
set IDENTITY_INSERT [dbo].PollSortOrder OFF;


GO

CREATE VIEW dbo.[EntityMaster]
 
AS
    SELECT 'category' EntityType, Entity.CategoryID EntityID, Entity.CategoryGUID EntityGuid, Name,ColWidth,Description,SEName,SEKeywords,SEDescription,SETitle,SENoScript,SEAltText,ParentCategoryID ParentEntityID,DisplayOrder,SortByLooks,XmlPackage,Published,ContentsBGColor,PageBGColor,GraphicsColor,isnull(NumProducts, 0) NumObjects, PageSize, QuantityDiscountID, Summary, SkinID, TemplateName
    FROM dbo.Category Entity with (NOLOCK)
      left join (SELECT pc.CategoryID, COUNT(pc.ProductID) AS NumProducts
                 FROM  dbo.ProductCategory pc with (nolock)
                     join [dbo].Product p with (nolock) on pc.ProductID = p.ProductID  and p.deleted=0 and p.published=1
                 GROUP BY pc.CategoryID
                ) a on Entity.CategoryID = a.CategoryID
    WHERE Published = 1 and Deleted=0

    UNION ALL

    SELECT 'affiliate' EntityType, Entity.AffiliateID EntityID,Entity.AffiliateGUID EntityGuid, Name,4 as ColWidth,'' as Description,SEName,SEKeywords,SEDescription,SETitle,SENoScript,SEAltText,ParentAffiliateID ParentEntityID,DisplayOrder,0 as SortByLooks,'' as XmlPackage,Published,'' as ContentsBGColor,'' as PageBGColor,'' as GraphicsColor,isnull(NumProducts, 0) NumObjects, 0 PageSize, 0 QuantityDiscountID, '' Summary, SkinID, TemplateName
    FROM dbo.Affiliate Entity with (NOLOCK)
      left join (SELECT pa.AffiliateID, COUNT(pa.ProductID) AS NumProducts
                 FROM dbo.ProductAffiliate pa with (nolock) join [dbo].Product p with (nolock) on pa.ProductID = p.ProductID and p.deleted=0 and p.published=1
                 GROUP BY pa.AffiliateID
                ) a on Entity.AffiliateID = a.AffiliateID
    WHERE Published = 1 and Deleted=0

    UNION ALL

    SELECT 'section' EntityType, Entity.SectionID EntityID,Entity.SectionGUID EntityGuid,Name,ColWidth,Description,SEName,SEKeywords,SEDescription,SETitle,SENoScript,SEAltText,ParentSectionID ParentEntityID,DisplayOrder,SortByLooks,XmlPackage,Published,ContentsBGColor,PageBGColor,GraphicsColor,isnull(NumProducts, 0) NumObjects, PageSize, QuantityDiscountID, Summary, SkinID, TemplateName
    FROM dbo.Section Entity with (NOLOCK)
        left join (SELECT ps.SectionID, COUNT(ps.ProductID) AS NumProducts
                   FROM dbo.ProductSection ps with (nolock) join [dbo].Product p with (nolock) on ps.ProductID = p.ProductID and p.deleted=0 and p.published=1
                   GROUP BY ps.SectionID
                  ) a on Entity.SectionID = a.SectionID
    WHERE Published = 1 and Deleted=0

    UNION ALL

    SELECT 'manufacturer' EntityType, Entity.ManufacturerID EntityID,Entity.ManufacturerGUID EntityGuid,Name,ColWidth,Description,SEName,SEKeywords,SEDescription,SETitle,SENoScript,SEAltText,ParentManufacturerID as ParentEntityID,DisplayOrder,0 as SortByLooks,XmlPackage,Published,ContentsBGColor,PageBGColor,GraphicsColor,isnull(NumProducts, 0) NumObjects, PageSize, QuantityDiscountID, Summary, SkinID, TemplateName
    FROM dbo.Manufacturer Entity with (NOLOCK)
    left join (SELECT pm.ManufacturerID, COUNT(pm.ProductID) AS NumProducts
               FROM dbo.ProductManufacturer pm with (nolock) join [dbo].Product p with (nolock) on pm.ProductID = p.ProductID and p.deleted=0 and p.published=1
               GROUP BY pm.ManufacturerID
              ) a on Entity.ManufacturerID = a.ManufacturerID
    WHERE Published = 1 and Deleted=0

    UNION ALL

    SELECT 'library' EntityType, Entity.LibraryID EntityID,Entity.LibraryGUID EntityGuid,Name,ColWidth,Description,SEName,SEKeywords,SEDescription,SETitle,SENoScript,SEAltText,ParentLibraryID ParentEntityID,DisplayOrder,SortByLooks,XmlPackage,Published,ContentsBGColor,PageBGColor,GraphicsColor,isnull(NumDocuments, 0) NumObjects, PageSize, 0 QuantityDiscountID, Summary, SkinID, TemplateName
    FROM dbo.Library Entity with (NOLOCK)
        left join (SELECT dl.LibraryID, COUNT(dl.DocumentID) AS NumDocuments
                   FROM  dbo.DocumentLibrary dl with (nolock) 
                       join [dbo].[Document] d with (nolock) on d.DocumentID = dl.DocumentID and d.deleted=0 and d.published=1
                   GROUP BY dl.LibraryID
                  ) a on Entity.LibraryID = a.LibraryID
    WHERE Published = 1 and Deleted=0

    UNION ALL

    SELECT 'distributor' EntityType, Entity.DistributorID EntityID,Entity.DistributorGUID EntityGuid,Name,ColWidth,Description,SEName,SEKeywords,SEDescription,SETitle,SENoScript,SEAltText,ParentDistributorID as ParentEntityID,DisplayOrder,0 as SortByLooks,XmlPackage,Published,ContentsBGColor,PageBGColor,GraphicsColor,isnull(NumProducts, 0) NumObjects, PageSize, QuantityDiscountID, Summary, SkinID, TemplateName
    FROM dbo.Distributor Entity with (NOLOCK)
        left join (SELECT pd.DistributorID, COUNT(pd.ProductID) AS NumProducts
                   FROM dbo.ProductDistributor pd with (nolock) join [dbo].Product p with (nolock) on pd.ProductID = p.ProductID and p.deleted=0 and p.published=1
                   GROUP BY pd.DistributorID
                  ) a on Entity.DistributorID = a.DistributorID
    WHERE Published = 1 and Deleted=0

    UNION ALL
 
    SELECT 'genre' EntityType, Entity.GenreID EntityID,Entity.GenreGUID EntityGuid,Name,ColWidth,Description,SEName,SEKeywords,SEDescription,SETitle,SENoScript,SEAltText,ParentGenreID as ParentEntityID,DisplayOrder,0 as SortByLooks,XmlPackage,Published,ContentsBGColor,PageBGColor,GraphicsColor,isnull(NumProducts, 0) NumObjects, PageSize, QuantityDiscountID, Summary, SkinID, TemplateName
    FROM dbo.Genre Entity with (NOLOCK)
        left join (SELECT px.GenreID, COUNT(px.ProductID) AS NumProducts
                   FROM dbo.ProductGenre px with (nolock) join [dbo].Product p with (nolock) on px.ProductID = p.ProductID and p.deleted=0 and p.published=1
                   GROUP BY px.GenreID
                  ) a on Entity.GenreID = a.GenreID
    WHERE Published = 1 and Deleted=0

    UNION ALL

    SELECT 'vector' EntityType, Entity.VectorID EntityID,Entity.VectorGUID EntityGuid,Name,ColWidth,Description,SEName,SEKeywords,SEDescription,SETitle,SENoScript,SEAltText,ParentVectorID as ParentEntityID,DisplayOrder,0 as SortByLooks,XmlPackage,Published,ContentsBGColor,PageBGColor,GraphicsColor,isnull(NumProducts, 0) NumObjects, PageSize, QuantityDiscountID, Summary, SkinID, TemplateName
    FROM dbo.Vector Entity with (NOLOCK)
        left join (SELECT px2.VectorID, COUNT(px2.ProductID) AS NumProducts
                   FROM dbo.ProductVector px2 with (nolock) join [dbo].Product p with (nolock) on px2.ProductID = p.ProductID and p.deleted=0 and p.published=1
                   GROUP BY px2.VectorID
                  ) a on Entity.VectorID = a.VectorID
    WHERE Published = 1 and Deleted=0

    UNION ALL

    SELECT 'customerLevel' EntityType, Entity.CustomerLevelID EntityID,Entity.CustomerLevelGUID EntityGuid,Name, 4 ColWidth, '' Description,SEName, '' SEKeywords, '' SEDescription, '' SETitle, '' SENoScript,'' SEAltText,ParentCustomerLevelID ParentEntityID,DisplayOrder,0 SortByLooks, '' XmlPackage, 1 Published,'' ContentsBGColor, '' PageBGColor, '' GraphicsColor,isnull(NumProducts, 0) NumObjects, 20 PageSize, 0 QuantityDiscountID, '' Summary, SkinID, TemplateName
    FROM dbo.CustomerLevel Entity with (NOLOCK)
      left join (SELECT pc.CustomerLevelID, COUNT(pc.ProductID) AS NumProducts
                 FROM  dbo.ProductCustomerLevel pc with (nolock)
                     join [dbo].Product p with (nolock) on pc.ProductID = p.ProductID  and p.deleted=0 and p.published=1
                 GROUP BY pc.CustomerLevelID
                ) a on Entity.CustomerLevelID = a.CustomerLevelID
    WHERE Deleted=0


GO


create proc [dbo].[aspdnsf_SearchCategories]
    @SearchTerm nvarchar(3000),
    @CategoryID int = null,
    @storeID	int = 1,	
    @filterEntity bit
    
  
AS
BEGIN
SET NOCOUNT ON

    SET @SearchTerm = '%' + rtrim(ltrim(@SearchTerm)) + '%'
    SET @CategoryID = nullif(@CategoryID, 0)

    SELECT a.* 
    FROM dbo.Category a with (NOLOCK)
    inner join (SELECT DISTINCT CategoryID EntityID FROM Category A WITH (NOLOCK) LEFT JOIN EntityStore B WITH (NOLOCK) ON A.CategoryID = B.EntityID AND EntityType = 'Category' WHERE (@filterEntity = 0 or StoreID = @storeID)) B ON A.CategoryID = B.EntityID
    WHERE a.name like @SearchTerm 
        and Published <> 0 
        and Deleted = 0 
        and CategoryID = coalesce(@CategoryID, CategoryID)
        and CategoryID in (select distinct CategoryID 
                           from dbo.ProductCategory   with (NOLOCK)  
                           where ProductID in 
                                (select ProductID 
                                 from dbo.Product   with (NOLOCK)  
                                 where Deleted=0 and Published=1
                                )
                          )
    ORDER BY DisplayOrder, Name

END

GO


create proc [dbo].[aspdnsf_SearchSections]
    @SearchTerm nvarchar(3000),
    @SectionID int = null,
    @storeID	int = 1,	
    @filterEntity bit	
    
  
AS
BEGIN
SET NOCOUNT ON

    SET @SearchTerm = '%' + rtrim(ltrim(@SearchTerm)) + '%'
    SET @SectionID = nullif(@SectionID, 0)


    SELECT * 
    FROM dbo.[Section] a with (NOLOCK)
    inner join (SELECT DISTINCT SectionID EntityID FROM Section A WITH (NOLOCK) LEFT JOIN EntityStore B WITH (NOLOCK) ON A.SectionID = B.EntityID AND EntityType = 'Section' WHERE (@filterEntity = 0 or StoreID = @storeID)) B ON A.SectionID = B.EntityID
    WHERE Deleted=0 and Published=1 
        and SectionID = coalesce(@SectionID, SectionID)
        and a.Name like @SearchTerm
        and SectionID in (select distinct SectionID 
                          from dbo.ProductSection   with (NOLOCK)  
                          where ProductID in (select distinct ProductID 
                                              from dbo.Product   with (NOLOCK)  
                                              where Deleted=0 and Published=1
                                              )
                         ) 
    ORDER BY DisplayOrder, Name
END



GO


create proc [dbo].[aspdnsf_SearchManufacturers]
    @SearchTerm		nvarchar(3000),
    @ManufacturerID int = null,
    @storeID		int = 1,	
    @filterEntity bit
    
  
AS
BEGIN
SET NOCOUNT ON

    SET @SearchTerm = '%' + rtrim(ltrim(@SearchTerm)) + '%'
    SET @ManufacturerID = nullif(@ManufacturerID, 0)

    SELECT * 
    FROM dbo.Manufacturer a with (NOLOCK)
    inner join (SELECT DISTINCT ManufacturerID EntityID FROM Manufacturer A WITH (NOLOCK) LEFT JOIN EntityStore B WITH (NOLOCK) ON A.ManufacturerID = B.EntityID AND EntityType = 'Manufacturer' WHERE (@filterEntity = 0 or StoreID = @storeID)) B ON A.ManufacturerID = B.EntityID
    WHERE deleted=0 
        and name like @SearchTerm 
        and ManufacturerID = coalesce(@ManufacturerID, ManufacturerID)
END


GO



create proc [dbo].[aspdnsf_SearchDistributors]
    @SearchTerm		nvarchar(3000),
    @DistributorID	int = null,
    @storeID		int = 1,	
    @filterEntity bit
    
  
AS
BEGIN
SET NOCOUNT ON

    SET @SearchTerm = '%' + rtrim(ltrim(@SearchTerm)) + '%'
    SET @DistributorID = nullif(@DistributorID, 0)

    SELECT * 
    FROM dbo.Distributor a with (NOLOCK)
    inner join (SELECT DISTINCT DistributorID EntityID FROM Distributor A WITH (NOLOCK) LEFT JOIN EntityStore B WITH (NOLOCK) ON A.DistributorID = B.EntityID AND EntityType = 'Distributor' WHERE (@filterEntity = 0 or StoreID = @storeID)) B ON A.DistributorID = B.EntityID
    WHERE deleted=0 
        and name like @SearchTerm 
        and DistributorID = coalesce(@DistributorID, DistributorID)
END


GO


create proc [dbo].[aspdnsf_SearchGenres]
    @SearchTerm nvarchar(3000),
    @GenreID int = null,
    @storeID		int = 1,	
    @filterEntity bit
    
  
AS
BEGIN
SET NOCOUNT ON

    SET @SearchTerm = '%' + rtrim(ltrim(@SearchTerm)) + '%'
    SET @GenreID = nullif(@GenreID, 0)

    SELECT * 
    FROM dbo.Genre a with (NOLOCK) 
    inner join (SELECT DISTINCT GenreID EntityID FROM Genre A WITH (NOLOCK) LEFT JOIN EntityStore B WITH (NOLOCK) ON A.GenreID = B.EntityID AND EntityType = 'Genre' WHERE (@filterEntity = 0 or StoreID = @storeID)) B ON A.GenreID = B.EntityID
    WHERE deleted=0 
        and name like @SearchTerm 
        and GenreID = coalesce(@GenreID, GenreID)

END



GO



create proc [dbo].[aspdnsf_SearchVectors]
    @SearchTerm nvarchar(3000),
    @VectorID int = null,
    @storeID		int = 1,	
    @filterEntity bit
    
  
AS
BEGIN
SET NOCOUNT ON

    SET @SearchTerm = '%' + rtrim(ltrim(@SearchTerm)) + '%'
    SET @VectorID = nullif(@VectorID, 0)

    SELECT * 
    FROM dbo.vector a with (NOLOCK) 
    inner join (SELECT DISTINCT VectorID EntityID FROM Vector A WITH (NOLOCK) LEFT JOIN EntityStore B WITH (NOLOCK) ON A.VectorID = B.EntityID AND EntityType = 'Vector' WHERE (@filterEntity = 0 or StoreID = @storeID)) B ON A.VectorID = B.EntityID
    WHERE deleted=0 
        and name like @SearchTerm 
        and VectorID = coalesce(@VectorID, VectorID)
END



GO


create proc dbo.aspdnsf_CreateSubEntities
    @EntityName varchar(20),
    @EntityID int,
    @EntityList varchar(8000)
  
AS
BEGIN
SET NOCOUNT ON

IF RTRIM(@EntityList) = ''
    RETURN

IF @EntityName = 'category'
    INSERT INTO [dbo].[Category] (CategoryGUID, Name, ParentCategoryID, XmlPackage, SEName, ColWidth, PageSize)
    SELECT newid(), s.Items, @EntityID, e.XmlPackage, dbo.MakeSEName(s.Items), e.ColWidth, e.PageSize
    FROM [dbo].[Category] e with (nolock) cross join dbo.split(@EntityList, ',') s
    WHERE categoryid = @EntityID 

IF @EntityName = 'section'
    INSERT INTO [dbo].Section (SectionGUID, Name, ParentSectionID, XmlPackage, SEName, ColWidth, PageSize)
    SELECT newid(), s.Items, @EntityID, e.XmlPackage, dbo.MakeSEName(s.Items), e.ColWidth, e.PageSize
    FROM [dbo].[Section] e with (nolock) cross join dbo.split(@EntityList, ',') s
    WHERE Sectionid = @EntityID 

IF @EntityName = 'distributor'
    INSERT INTO [dbo].Distributor (DistributorGUID, Name, ParentDistributorID, XmlPackage, SEName, ColWidth, PageSize)
    SELECT newid(), s.Items, @EntityID, e.XmlPackage, dbo.MakeSEName(s.Items), e.ColWidth, e.PageSize
    FROM [dbo].Distributor e with (nolock) cross join dbo.split(@EntityList, ',') s
    WHERE Distributorid = @EntityID 

IF @EntityName = 'manufacturer'
    INSERT INTO [dbo].Manufacturer (ManufacturerGUID, Name, ParentManufacturerID, XmlPackage, SEName, ColWidth, PageSize)
    SELECT newid(), s.Items, @EntityID, e.XmlPackage, dbo.MakeSEName(s.Items), e.ColWidth, e.PageSize
    FROM [dbo].Manufacturer e with (nolock) cross join dbo.split(@EntityList, ',') s
    WHERE Manufacturerid = @EntityID 

IF @EntityName = 'affiliate'
    INSERT INTO [dbo].Affiliate (AffiliateGUID, Name, ParentAffiliateID, SEName)
    SELECT newid(), s.Items, @EntityID, dbo.MakeSEName(s.Items)
    FROM [dbo].Affiliate e with (nolock) cross join dbo.split(@EntityList, ',') s
    WHERE Affiliateid = @EntityID 

IF @EntityName = 'genre'
    INSERT INTO [dbo].Genre (GenreGUID, Name, ParentGenreID, XmlPackage, SEName, ColWidth, PageSize)
    SELECT newid(), s.Items, @EntityID, e.XmlPackage, dbo.MakeSEName(s.Items), e.ColWidth, e.PageSize
    FROM [dbo].Genre e with (nolock) cross join dbo.split(@EntityList, ',') s
    WHERE Genreid = @EntityID 

IF @EntityName = 'vector'
    INSERT INTO [dbo].Vector (VectorGUID, Name, ParentVectorID, XmlPackage, SEName, ColWidth, PageSize)
    SELECT newid(), s.Items, @EntityID, e.XmlPackage, dbo.MakeSEName(s.Items), e.ColWidth, e.PageSize
    FROM [dbo].Vector e with (nolock) cross join dbo.split(@EntityList, ',') s
    WHERE Vectorid = @EntityID 

END


GO


create proc [dbo].[aspdnsf_EntityMgr]
    @EntityName varchar(100),
    @PublishedOnly tinyint
    
  
AS
BEGIN
    SET NOCOUNT ON
    IF @EntityName = 'Category' BEGIN
        SELECT Entity.CategoryID EntityID, Entity.CategoryGUID EntityGuid, Name,ColWidth,Description,SEName,SEKeywords,SEDescription,SETitle,SENoScript,SEAltText,ParentCategoryID ParentEntityID,DisplayOrder,SortByLooks,XmlPackage,Published,ContentsBGColor,PageBGColor,GraphicsColor
			   ,isnull(NumProducts, 0) NumObjects, PageSize, QuantityDiscountID, Summary, SkinID, TemplateName
        FROM dbo.Category Entity with (NOLOCK)
          left join (SELECT pc.CategoryID, COUNT(pc.ProductID) AS NumProducts
                     FROM  dbo.ProductCategory pc with (nolock)
                         join [dbo].Product p with (nolock) on pc.ProductID = p.ProductID  and p.deleted=0 and p.published=1
                     GROUP BY pc.CategoryID
                    ) a on Entity.CategoryID = a.CategoryID
        WHERE Published >= @PublishedOnly and Deleted=0
        ORDER BY ParentCategoryID,DisplayOrder,Name
    END
 
 
 
    IF @EntityName = 'Affiliate' BEGIN
        SELECT Entity.AffiliateID EntityID,Entity.AffiliateGUID EntityGuid, Name,4 as ColWidth,'' as Description,SEName,SEKeywords,SEDescription,SETitle,SENoScript,SEAltText,ParentAffiliateID ParentEntityID,DisplayOrder,0 as SortByLooks,'' as XmlPackage,Published,'' as ContentsBGColor,'' as PageBGColor
			   ,'' as GraphicsColor,isnull(NumProducts, 0) NumObjects, 0 PageSize, 0 QuantityDiscountID, '' Summary, SkinID, TemplateName
        FROM dbo.Affiliate Entity with (NOLOCK)
          left join (SELECT pa.AffiliateID, COUNT(pa.ProductID) AS NumProducts
                     FROM dbo.ProductAffiliate pa with (nolock) join [dbo].Product p with (nolock) on pa.ProductID = p.ProductID and p.deleted=0 and p.published=1
                     GROUP BY pa.AffiliateID
                    ) a on Entity.AffiliateID = a.AffiliateID
        WHERE Published >= @PublishedOnly and Deleted=0
        ORDER BY ParentAffiliateID, DisplayOrder,Name
    END
 
 
 
    IF @EntityName = 'Section' BEGIN
        SELECT Entity.SectionID EntityID,Entity.SectionGUID EntityGuid,Name,ColWidth,Description,SEName,SEKeywords,SEDescription,SETitle,SENoScript,SEAltText,ParentSectionID ParentEntityID,DisplayOrder,SortByLooks,XmlPackage,Published,ContentsBGColor,PageBGColor,GraphicsColor,isnull(NumProducts, 0) NumObjects
			   , PageSize, QuantityDiscountID, Summary, SkinID, TemplateName
        FROM dbo.Section Entity with (NOLOCK)
            left join (SELECT ps.SectionID, COUNT(ps.ProductID) AS NumProducts
                       FROM dbo.ProductSection ps with (nolock) join [dbo].Product p with (nolock) on ps.ProductID = p.ProductID and p.deleted=0 and p.published=1
                       GROUP BY ps.SectionID
                      ) a on Entity.SectionID = a.SectionID
        WHERE Published >= @PublishedOnly and Deleted=0
        ORDER BY ParentSectionID,DisplayOrder,Name
    END
 
 
 
    IF @EntityName = 'Manufacturer' BEGIN
        SELECT Entity.ManufacturerID EntityID,Entity.ManufacturerGUID EntityGuid,Name,ColWidth,Description,SEName,SEKeywords,SEDescription,SETitle,SENoScript,SEAltText,ParentManufacturerID as ParentEntityID,DisplayOrder,0 as SortByLooks,XmlPackage,Published,ContentsBGColor,PageBGColor
			   ,GraphicsColor,isnull(NumProducts, 0) NumObjects, PageSize, QuantityDiscountID, Summary, SkinID, TemplateName
        FROM dbo.Manufacturer Entity with (NOLOCK)
        left join (SELECT pm.ManufacturerID, COUNT(pm.ProductID) AS NumProducts
                   FROM dbo.ProductManufacturer pm with (nolock) join [dbo].Product p with (nolock) on pm.ProductID = p.ProductID and p.deleted=0 and p.published=1
                   GROUP BY pm.ManufacturerID
                  ) a on Entity.ManufacturerID = a.ManufacturerID
        WHERE Published >= @PublishedOnly and Deleted=0
        ORDER BY ParentManufacturerID,DisplayOrder,Name
    END
 
 
 
    IF @EntityName = 'Library' BEGIN
        SELECT Entity.LibraryID EntityID,Entity.LibraryGUID EntityGuid,Name,ColWidth,Description,SEName,SEKeywords,SEDescription,SETitle,SENoScript,SEAltText,ParentLibraryID ParentEntityID,DisplayOrder,SortByLooks,XmlPackage,Published,ContentsBGColor,PageBGColor,GraphicsColor
			   ,isnull(NumDocuments, 0) NumObjects, PageSize, 0 QuantityDiscountID, Summary, SkinID, TemplateName
        FROM dbo.Library Entity with (NOLOCK)
        left join (SELECT dl.LibraryID, COUNT(dl.DocumentID) AS NumDocuments
                       FROM  dbo.DocumentLibrary dl with (nolock) 
                           join [dbo].[Document] d with (nolock) on d.DocumentID = dl.DocumentID and d.deleted=0 and d.published=1
                       GROUP BY dl.LibraryID
                      ) a on Entity.LibraryID = a.LibraryID
        WHERE Published >= @PublishedOnly and Deleted=0
        ORDER BY ParentLibraryID,DisplayOrder,Name
    END
 
 
 
    IF @EntityName = 'Distributor' BEGIN
        SELECT Entity.DistributorID EntityID,Entity.DistributorGUID EntityGuid,Name,ColWidth,Description,SEName,SEKeywords,SEDescription,SETitle,SENoScript,SEAltText,ParentDistributorID as ParentEntityID,DisplayOrder,0 as SortByLooks,XmlPackage,Published,ContentsBGColor,PageBGColor
			   ,GraphicsColor,isnull(NumProducts, 0) NumObjects, PageSize, QuantityDiscountID, Summary, SkinID, TemplateName
        FROM dbo.Distributor Entity with (NOLOCK)
        left join (SELECT pd.DistributorID, COUNT(pd.ProductID) AS NumProducts
                       FROM dbo.ProductDistributor pd with (nolock) join [dbo].Product p with (nolock) on pd.ProductID = p.ProductID and p.deleted=0 and p.published=1
                       GROUP BY pd.DistributorID
                      ) a on Entity.DistributorID = a.DistributorID
        WHERE Published >= @PublishedOnly and Deleted=0
        ORDER BY ParentDistributorID,DisplayOrder,Name
    END
 
 
    IF @EntityName = 'Genre' BEGIN
        SELECT Entity.GenreID EntityID,Entity.GenreGUID EntityGuid,Name,ColWidth,Description,SEName,SEKeywords,SEDescription,SETitle,SENoScript,SEAltText,ParentGenreID as ParentEntityID,DisplayOrder,0 as SortByLooks,XmlPackage,Published,ContentsBGColor,PageBGColor,GraphicsColor
			   ,isnull(NumProducts, 0) NumObjects, PageSize, QuantityDiscountID, Summary, SkinID, TemplateName
        FROM dbo.Genre Entity with (NOLOCK)
        left join (SELECT px.GenreID, COUNT(px.ProductID) AS NumProducts
                       FROM dbo.ProductGenre px with (nolock) join [dbo].Product p with (nolock) on px.ProductID = p.ProductID and p.deleted=0 and p.published=1
                       GROUP BY px.GenreID
                      ) a on Entity.GenreID = a.GenreID
        WHERE Published >= @PublishedOnly and Deleted=0
        ORDER BY ParentGenreID,DisplayOrder,Name
    END
 
    IF @EntityName = 'Vector' BEGIN
        SELECT Entity.VectorID EntityID,Entity.VectorGUID EntityGuid,Name,ColWidth,Description,SEName,SEKeywords,SEDescription,SETitle,SENoScript,SEAltText,ParentVectorID as ParentEntityID,DisplayOrder,0 as SortByLooks,XmlPackage,Published,ContentsBGColor,PageBGColor,GraphicsColor
			   ,isnull(NumProducts, 0) NumObjects, PageSize, QuantityDiscountID, Summary, SkinID, TemplateName
        FROM dbo.Vector Entity with (NOLOCK)
        left join (SELECT px2.VectorID, COUNT(px2.ProductID) AS NumProducts
                       FROM dbo.ProductVector px2 with (nolock) join [dbo].Product p with (nolock) on px2.ProductID = p.ProductID and p.deleted=0 and p.published=1
                       GROUP BY px2.VectorID
                      ) a on Entity.VectorID = a.VectorID
        WHERE Published >= @PublishedOnly and Deleted=0
        ORDER BY ParentVectorID,DisplayOrder,Name
    END
 
 
    IF @EntityName = 'Customerlevel' BEGIN
        SELECT Entity.CustomerLevelID EntityID,Entity.CustomerLevelGUID EntityGuid,Name, 4 ColWidth, '' Description,SEName, '' SEKeywords, '' SEDescription, '' SETitle, '' SENoScript,'' SEAltText,ParentCustomerLevelID ParentEntityID,DisplayOrder,0 SortByLooks, '' XmlPackage, 1 Published,'' ContentsBGColor
			   , '' PageBGColor, '' GraphicsColor,isnull(NumProducts, 0) NumObjects, 20 PageSize, 0 QuantityDiscountID, '' Summary, SkinID, TemplateName
        FROM dbo.CustomerLevel Entity with (NOLOCK)
          left join (SELECT pc.CustomerLevelID, COUNT(pc.ProductID) AS NumProducts
                     FROM  dbo.ProductCustomerLevel pc with (nolock)
                         join [dbo].Product p with (nolock) on pc.ProductID = p.ProductID  and p.deleted=0 and p.published=1
                     GROUP BY pc.CustomerLevelID
                    ) a on Entity.CustomerLevelID = a.CustomerLevelID
        WHERE Deleted=0
        ORDER BY ParentCustomerLevelID, DisplayOrder,Name
    END
END

GO


create proc [dbo].[aspdnsf_GetProductsEntity]
    @categoryID      int = 0,
    @sectionID       int = 0,
    @manufacturerID  int = 0,
    @distributorID   int = 0,
    @genreID   int = 0,
    @vectorID   int = 0,
    @affiliateID     int = 0,
    @ProductTypeID   int = 1,
    @ViewType        bit = 1, -- 0 = all variants, 1 = one variant
    @StatsFirst      tinyint = 1,
    @searchstr       nvarchar(4000) = '',
    @extSearch       tinyint = 1,
    @publishedonly   tinyint = 0,
    @OnSaleOnly      tinyint = 0,
    @SearchIndex     varchar(2) = '',
    @SortOrder       varchar(4) = 'ASC', -- ASC or DESC
    @SortBy          varchar(50) = 'Name' -- name to sort by
  
AS
BEGIN

    SET NOCOUNT ON 

    DECLARE @rcount int

    DECLARE @custlevelcount int, @sectioncount int, @affiliatecount int, @categorycount int, @distributorcount int, @genrecount int,  @vectorcount int, @manufacturercount int

    DECLARE @FilterProductsByAffiliate tinyint
    SELECT @FilterProductsByAffiliate = case ConfigValue when 'true' then 1 else 0 end FROM AppConfig with (nolock) WHERE [Name] = 'FilterProductsByAffiliate'

    select @categorycount     = si.rows from sysobjects so with (nolock) join sysindexes si with (nolock) on so.id = si.id where so.id = object_id('productcategory') and si.indid < 2 and type = 'u'
    select @sectioncount      = si.rows from sysobjects so with (nolock) join sysindexes si with (nolock) on so.id = si.id where so.id = object_id('productsection') and si.indid < 2 and type = 'u'
    select @affiliatecount    = si.rows from sysobjects so with (nolock) join sysindexes si with (nolock) on so.id = si.id where so.id = object_id('ProductAffiliate') and si.indid < 2 and type = 'u'
    select @distributorcount  = si.rows from sysobjects so with (nolock) join sysindexes si with (nolock) on so.id = si.id where so.id = object_id('ProductDistributor') and si.indid < 2 and type = 'u'
    select @genrecount  = si.rows from sysobjects so with (nolock) join sysindexes si with (nolock) on so.id = si.id where so.id = object_id('ProductGenre') and si.indid < 2 and type = 'u'
    select @vectorcount  = si.rows from sysobjects so with (nolock) join sysindexes si with (nolock) on so.id = si.id where so.id = object_id('ProductVector') and si.indid < 2 and type = 'u'
    select @manufacturercount = si.rows from sysobjects so with (nolock) join sysindexes si with (nolock) on so.id = si.id where so.id = object_id('ProductManufacturer') and si.indid < 2 and type = 'u'


    SET @searchstr = '%' + @searchstr + '%'
    SET @SearchIndex = @SearchIndex + '%'


    SET @rcount = @@rowcount
    IF @StatsFirst = 1
        SELECT cast(ceiling(@rcount*1.0/1) as int) pages, @rcount ProductCount

    DECLARE @sql nvarchar(4000)
    SET @sql = '
    SELECT 
        p.ProductID,
        p.Name,
        pv.VariantID,
        pv.Name AS VariantName,
        p.ProductGUID,
        p.Summary,
        p.Description,
        p.ProductTypeID,
        p.TaxClassID,
        p.SKU,
        p.ManufacturerPartNumber,
        p.XmlPackage,
        p.Published,
        p.Looks,
        p.Notes,
        p.IsAKit,
        p.ShowInProductBrowser,
        p.IsAPack,
        p.PackSize,
        p.IsSystem,
        p.Deleted,
        p.CreatedOn,
        p.ImageFileNameOverride,
        pv.VariantGUID,
        pv.Description AS VariantDescription,
        pv.SKUSuffix,
        pv.ManufacturerPartNumber AS VariantManufacturerPartNumber,
        pv.Price,
        pv.CustomerEntersPrice, 
        isnull(pv.SalePrice, 0) SalePrice,
        cast(isnull(pv.Weight,0) as decimal(10,1)) Weight,
        pv.MSRP,
        pv.Cost,
        case p.TrackInventoryBySizeAndColor when 1 then isnull(i.quan, 0) else pv.inventory end Inventory,
        pv.DisplayOrder as VariantDisplayOrder,
        pv.Notes AS VariantNotes,
        pv.IsTaxable,
        pv.IsShipSeparately,
        pv.IsDownload,
        pv.DownloadLocation,
        pv.Published AS VariantPublished,
        pv.SubscriptionInterval,
        pv.RestrictedQuantities,
        pv.MinimumQuantity,
        pv.Deleted AS VariantDeleted,
        pv.CreatedOn AS VariantCreatedOn,
        d.Name AS DistributorName,
        x.Name AS GenreName,
        x2.Name AS SHowName,
        d.DistributorID,
        x.GenreID,
        x2.VectorID,
        m.ManufacturerID,
        m.Name AS ManufacturerName'

    DECLARE @sql1 nvarchar(4000)
    SET @sql1 = '
    FROM Product p with (NOLOCK) 
        join 
        (
        SELECT distinct p.productid, pv.VariantID 
            FROM 
                product p with (nolock)
                left join ProductVariant pv             with (NOLOCK) on p.ProductID = pv.ProductID and pv.IsDefault >= '

    SET @sql1 = @sql1 +CONVERT(nvarchar,@ViewType)+'
                left join productcategory pc       with (nolock) on p.ProductID = pc.ProductID 
                left join productsection ps        with (nolock) on p.ProductID = ps.ProductID 
                left join ProductManufacturer pm   with (nolock) on p.ProductID = pm.ProductID 
                left join ProductDistributor pd    with (nolock) on p.ProductID = pd.ProductID 
                left join ProductGenre px    with (nolock) on p.ProductID = px.ProductID 
                left join ProductVector px2    with (nolock) on p.ProductID = px2.ProductID 
                left join ProductAffiliate pa      with (nolock) on p.ProductID = pa.ProductID 
            WHERE 
                  (pc.categoryid = '


    DECLARE @sql2 nvarchar(4000)

    SET @sql2 = ' ' + CONVERT(nvarchar,@categoryID) + ') or (ps.sectionid = '

    SET @sql2 = @sql2 + CONVERT(nvarchar,@sectionID) + ') or (pa.AffiliateID = '

    SET @sql2 = @sql2 + CONVERT(nvarchar,@affiliateID) + ') or (pm.manufacturerid = '

    SET @sql2 = @sql2 + CONVERT(nvarchar,@manufacturerID) + ') or (pd.DistributorID = '

    SET @sql2 = @sql2 + CONVERT(nvarchar,@distributorID) + ') or (px.genreID = '

    SET @sql2 = @sql2 + CONVERT(nvarchar,@genreID) + ') or (px2.vectorID = '

    SET @sql2 = @sql2 + CONVERT(nvarchar,@vectorID) + ')'

        DECLARE @sql3 nvarchar(4000)
        SET @sql3 = ' 
          and case when isnull(pv.saleprice,0) = 0 then 0 else 1 end >= '+CONVERT(nvarchar,@OnSaleOnly)+'
          and p.published >= '+CONVERT(nvarchar,@publishedonly)+'
          and pv.published >= '+CONVERT(nvarchar,@publishedonly)+'
          and p.Deleted = 0
          and pv.Deleted = 0
        )                              pf on p.ProductID = pf.ProductID  
        left join ProductVariant      pv  with (NOLOCK) on p.ProductID = pv.ProductID and pv.IsDefault >= '

    SET @sql3 = @sql3 + CONVERT(nvarchar,@ViewType)+'
        left join ProductManufacturer pm  with (NOLOCK) on p.ProductID = pm.ProductID 
        left join Manufacturer         m  with (NOLOCK) on pm.ManufacturerID = m.ManufacturerID 
        left join ProductDistributor  pd  with (NOLOCK) on p.ProductID = pd.ProductID
        left join ProductGenre  px  with (NOLOCK) on p.ProductID = px.ProductID
        left join ProductVector  px2  with (NOLOCK) on p.ProductID = px2.ProductID
        left join Distributor          d  with (NOLOCK) on pd.DistributorID = d.DistributorID
        left join Genre          x  with (NOLOCK) on px.GenreID = x.GenreID
        left join Vector          x2  with (NOLOCK) on px2.VectorID = x2.VectorID
        left join (select VariantID, sum(quan) quan from dbo.Inventory with (nolock) group by VariantID) i  on pv.VariantID = i.VariantID
    WHERE
        (p.ProductTypeID = '+CONVERT(nvarchar,@ProductTypeID)+ ' or  '+CONVERT(nvarchar,@ProductTypeID)+ ' = 0) and 
        (
          p.Name LIKE '''+ @searchstr + ''' 
          or convert(nvarchar(20),p.productid) LIKE '''+ @searchstr + '''
          or pv.name LIKE '''+ @searchstr + ''' 
          or p.sku LIKE '''+ @searchstr + ''' 
          or p.manufacturerpartnumber LIKE '''+ @searchstr + ''' 
          or pv.manufacturerpartnumber LIKE '''+ @searchstr + ''' 
          or ('+CONVERT(nvarchar,@extSearch)+' = 1 AND p.Description LIKE '''+ @searchstr + ''')
          or ('+CONVERT(nvarchar,@extSearch)+' = 1 AND p.Summary LIKE '''+ @searchstr + ''')
        )
        and 
        p.Name LIKE '''+ @SearchIndex + ''' 
    ORDER BY '

DECLARE @sql4 nvarchar(4000)
    
    IF @SortBy = 'ProductID' 
        SET @sql4 = 'P.ProductID'
    ELSE IF @SortBy = 'SKU' 
        SET @sql4 = 'SKU'
    ELSE IF @SortBy = 'ManufacturerPartNumber' 
        SET @sql4 = 'P.ManufacturerPartNumber'
    ELSE IF @SortBy = 'Inventory' 
        SET @sql4 = 'Inventory'
    ELSE 
        SET @sql4 = 'P.[Name]'
    
    
    IF @SortOrder = 'DESC' 
        SET @sql4 = @sql4 + ' DESC'
    ELSE 
        SET @sql4 = @sql4 + ' ASC'
    
    SET @sql4 = @sql4 + ', pv.DisplayOrder'

    EXECUTE(@sql+' '+@sql1+' '+@sql2+' '+@sql3+' '+@sql4)

    IF @StatsFirst <> 1
        SELECT cast(ceiling(@rcount*1.0/1) as int) pages, @rcount ProductCount

END



GO

create view [dbo].[ProductEntity]
 
AS
select 'category' EntityType, ProductID, CategoryID EntityID, DisplayOrder, CreatedOn From dbo.productcategory with (nolock)
union all
select 'section', ProductID, SectionID EntityID, DisplayOrder, CreatedOn From dbo.productsection with (nolock)
union all
select 'manufacturer', ProductID, ManufacturerID EntityID, DisplayOrder, CreatedOn From dbo.productmanufacturer with (nolock)
union all
select 'distributor', ProductID, DistributorID EntityID, DisplayOrder, CreatedOn From dbo.productdistributor with (nolock)
union all
select 'affiliate', ProductID, AffiliateID EntityID, DisplayOrder, CreatedOn From dbo.productaffiliate with (nolock)
union all
select 'locale', ProductID, LocaleSettingID EntityID, DisplayOrder, CreatedOn From dbo.productlocalesetting with (nolock)
union all
select 'customerlevel', ProductID, CustomerLevelID EntityID, DisplayOrder, CreatedOn From dbo.ProductCustomerLevel with (nolock)
union all
select 'library', DocumentID, LibraryID EntityID, DisplayOrder, CreatedOn From dbo.DocumentLibrary with (nolock)
union all
select 'genre', ProductID, GenreID EntityID, DisplayOrder, CreatedOn From dbo.productgenre with (nolock)
union all
select 'vector', ProductID, VectorID EntityID, DisplayOrder, CreatedOn From dbo.productvector with (nolock)


GO


create proc [dbo].[aspdnsf_GetProducts]
    @categoryID      int = null,  
    @sectionID       int = null,  
    @manufacturerID  int = null,  
    @distributorID   int = null,  
    @genreID         int = null,  
    @vectorID        int = null,  
    @localeID        int = null,  
    @CustomerLevelID int = null,  
    @affiliateID     int = null,  
    @ProductTypeID   int = null,  
    @ViewType        bit = 1, -- 0 = all variants, 1 = one variant  
    @sortEntity      int = 0, -- 1 = category, 2 = section, 3 = manufacturer, 4 = distributor, 5= genre, 6 = vector  
    @pagenum         int = 1,  
    @pagesize        int = null,  
    @StatsFirst      tinyint = 1,  
    @searchstr       nvarchar(4000) = null,  
    @extSearch       tinyint = 0,  
    @publishedonly   tinyint = 0,  
    @ExcludePacks    tinyint = 0,  
    @ExcludeKits     tinyint = 0,  
    @ExcludeSysProds tinyint = 0,  
    @InventoryFilter int = 0,  --  will only show products with an inventory level GREATER OR EQUAL TO than the number specified in this parameter, set to -1 to disable inventory filtering  
    @sortEntityName  varchar(20) = '', -- usely only when the entity id is provided, allowed values: category, section, manufacturer, distributor, genre, vector  
    @localeName      varchar(20) = '',  
    @OnSaleOnly      tinyint = 0,  
    @IncludeAll      bit = 0, -- Don't filter products that have a start date in the future or a stop date in the past  
	@storeID		 int = 1,
	@filterProduct	 bit = 0
	
  
AS  
BEGIN  
  
    SET NOCOUNT ON   
  
    DECLARE @rcount int  
    DECLARE @productfilter table (rownum int not null identity  primary key, productid int not null, displayorder int not null, VariantID int not null, VariantDisplayOrder int not null, ProductName nvarchar(400) null, VariantName nvarchar(400) null)  
    DECLARE @FilterProductsByAffiliate tinyint, @FilterProductsByCustomerLevel tinyint, @DisplayOutOfStockProducts tinyint, @HideProductsWithLessThanThisInventoryLevel int  
    CREATE TABLE #displayorder ([name] nvarchar (800), productid int not null primary key, displayorder int not null)  
    CREATE TABLE #inventoryfilter (productid int not null, variantid int not null, InvQty int not null)  
    CREATE CLUSTERED INDEX tmp_inventoryfilter ON #inventoryfilter (productid, variantid)  
  
    DECLARE @custlevelcount int, @sectioncount int, @localecount int, @affiliatecount int, @categorycount int, @CustomerLevelFilteringIsAscending bit, @distributorcount int, @genrecount int, @vectorcount int, @manufacturercount int  
  
	DECLARE @ftsenabled tinyint
	
	SET @ftsenabled = 0
	
	IF ((SELECT DATABASEPROPERTY(db_name(db_id()),'IsFulltextEnabled')) = 1 
		AND EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[dbo].[KeyWordSearch]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
		AND EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetValidSearchString]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT')))
	BEGIN
		SET @ftsenabled = 1
	END
  
    SELECT @FilterProductsByAffiliate = case ConfigValue when 'true' then 1 else 0 end FROM dbo.AppConfig with (nolock) WHERE [Name] = 'FilterProductsByAffiliate'  
    SELECT @FilterProductsByCustomerLevel = case ConfigValue when 'true' then 1 else 0 end FROM dbo.AppConfig with (nolock) WHERE [Name] = 'FilterProductsByCustomerLevel'  
    SELECT @DisplayOutOfStockProducts = case ConfigValue when 'true' then 1 else 0 end FROM dbo.AppConfig with (nolock) WHERE [Name] = 'DisplayOutOfStockProducts'
    SELECT @HideProductsWithLessThanThisInventoryLevel = convert(int, ConfigValue) FROM dbo.AppConfig with (nolock) WHERE [Name] = 'HideProductsWithLessThanThisInventoryLevel' and isnumeric(ConfigValue) = 1  
  
    IF @DisplayOutOfStockProducts = 1 
	BEGIN
		SET @HideProductsWithLessThanThisInventoryLevel = 0
		SET @InventoryFilter = -1
	END
    
    IF @InventoryFilter <> -1 and (@HideProductsWithLessThanThisInventoryLevel > @InventoryFilter or @HideProductsWithLessThanThisInventoryLevel  = -1)  
        SET @InventoryFilter  = @HideProductsWithLessThanThisInventoryLevel  
  
  
    SET @categoryID      = nullif(@categoryID, 0)  
    SET @sectionID       = nullif(@sectionID, 0)  
    SET @manufacturerID  = nullif(@manufacturerID, 0)  
    SET @distributorID   = nullif(@distributorID, 0)  
    SET @genreID         = nullif(@genreID, 0)  
    SET @vectorID        = nullif(@vectorID, 0)  
    SET @affiliateID     = nullif(@affiliateID, 0)  
    SET @ProductTypeID   = nullif(@ProductTypeID, 0)  
  
  
    SET @CustomerLevelFilteringIsAscending  = 0  
    SELECT @CustomerLevelFilteringIsAscending  = case configvalue when 'true' then 1 else 0 end  
    FROM dbo.AppConfig with (nolock)   
    WHERE name = 'FilterByCustomerLevelIsAscending'  
  
    IF @localeID is null and ltrim(rtrim(@localeName)) <> ''  
        SELECT @localeID = LocaleSettingID FROM dbo.LocaleSetting with (nolock) WHERE Name = ltrim(rtrim(@localeName))  
  
    select @categorycount     = si.rows from sysobjects so with (nolock) join sysindexes si with (nolock) on so.id = si.id where so.id = object_id('productcategory') and si.indid < 2 and type = 'u'  
    select @sectioncount      = si.rows from sysobjects so with (nolock) join sysindexes si with (nolock) on so.id = si.id where so.id = object_id('productsection') and si.indid < 2 and type = 'u'  
    select @localecount       = si.rows from sysobjects so with (nolock) join sysindexes si with (nolock) on so.id = si.id where so.id = object_id('ProductLocaleSetting') and si.indid < 2 and type = 'u'  
    select @custlevelcount    = si.rows from sysobjects so with (nolock) join sysindexes si with (nolock) on so.id = si.id where so.id = object_id('ProductCustomerLevel') and si.indid < 2 and type = 'u'  
    select @affiliatecount    = si.rows from sysobjects so with (nolock) join sysindexes si with (nolock) on so.id = si.id where so.id = object_id('ProductAffiliate') and si.indid < 2 and type = 'u'  
    select @distributorcount  = si.rows from sysobjects so with (nolock) join sysindexes si with (nolock) on so.id = si.id where so.id = object_id('ProductDistributor') and si.indid < 2 and type = 'u'  
    select @genrecount        = si.rows from sysobjects so with (nolock) join sysindexes si with (nolock) on so.id = si.id where so.id = object_id('ProductGenre') and si.indid < 2 and type = 'u'  
    select @vectorcount       = si.rows from sysobjects so with (nolock) join sysindexes si with (nolock) on so.id = si.id where so.id = object_id('ProductVector') and si.indid < 2 and type = 'u'  
    select @manufacturercount = si.rows from sysobjects so with (nolock) join sysindexes si with (nolock) on so.id = si.id where so.id = object_id('ProductManufacturer') and si.indid < 2 and type = 'u'  
  
  
    -- get page size  
    IF @pagesize is null or @pagesize = 0 BEGIN  
        IF @categoryID is not null  
            SELECT @pagesize = PageSize FROM dbo.Category with (nolock) WHERE categoryID = @categoryID  
        ELSE IF @sectionID is not null  
            SELECT @pagesize = PageSize FROM dbo.Section with (nolock) WHERE sectionID = @sectionID  
        ELSE IF @manufacturerID is not null  
            SELECT @pagesize = PageSize FROM dbo.Manufacturer with (nolock) WHERE manufacturerID = @manufacturerID  
        ELSE IF @distributorID is not null  
            SELECT @pagesize = PageSize FROM dbo.Distributor with (nolock) WHERE distributorID = @distributorID  
        ELSE IF @genreID is not null  
            SELECT @pagesize = PageSize FROM dbo.Genre with (nolock) WHERE genreID = @genreID  
        ELSE IF @vectorID is not null  
            SELECT @pagesize = PageSize FROM dbo.Vector with (nolock) WHERE vectorID = @vectorID  
        ELSE   
            SELECT @pagesize = convert(int, ConfigValue) FROM dbo.AppConfig with (nolock) WHERE [Name] = 'Default_CategoryPageSize'  
    END  
  
    IF @pagesize is null or @pagesize = 0  
        SET @pagesize = 20  
  
    -- get sort order  
    IF @sortEntity = 1 or @sortEntityName = 'category' BEGIN  
        INSERT #displayorder select distinct null as [name], a.productid, displayorder from dbo.ProductCategory a with (nolock) inner join (select distinct a.ProductID from ProductCategory a with (nolock) 
        left join ProductStore b with (nolock) on a.ProductID = b.ProductID where (@filterProduct = 0 or StoreID = @storeID)) b  on a.ProductID = b.ProductID where categoryID = @categoryID 
    END  
    ELSE IF @sortEntity = 2 or @sortEntityName = 'section' BEGIN  
        INSERT #displayorder select distinct null as [name], a.productid, displayorder from dbo.ProductSection a with (nolock) inner join (select distinct a.ProductID from ProductSection a with (nolock) 
        left join ProductStore b with (nolock) on a.ProductID = b.ProductID where (@filterProduct = 0 or StoreID = @storeID)) b on a.ProductID = B.ProductID where sectionId = @sectionID
    END  
    ELSE IF @sortEntity = 3 or @sortEntityName = 'manufacturer' BEGIN  
        INSERT #displayorder select distinct null as [name], a.productid, displayorder from dbo.ProductManufacturer a with (nolock) inner join (select distinct a.ProductID from ProductManufacturer a with (nolock) 
        left join ProductStore b with (nolock) on a.ProductID = b.ProductID where (@filterProduct = 0 or StoreID = @storeID)) b on a.ProductID = B.ProductID where ManufacturerID = @manufacturerID
    END  
    ELSE IF @sortEntity = 4 or @sortEntityName = 'distributor' BEGIN  
        INSERT #displayorder select distinct null as [name], a.productid, displayorder from dbo.ProductDistributor a with (nolock) inner join (select distinct a.ProductID from ProductDistributor a with (nolock) 
        left join ProductStore b with (nolock) on a.ProductID = b.ProductID where (@filterProduct = 0 or StoreID = @storeID)) b on a.ProductID = B.ProductID where DistributorID = @distributorID
    END  
    ELSE IF @sortEntity = 5 or @sortEntityName = 'genre' BEGIN  
        INSERT #displayorder select distinct null as [name], a.productid, displayorder from dbo.ProductGenre a with (nolock) inner join (select distinct a.ProductID from ProductGenre a with (nolock) 
        left join ProductStore b with (nolock) on a.ProductID = b.ProductID where (@filterProduct = 0 or StoreID = @storeID)) b on a.ProductID = B.ProductID where GenreID = @genreID
    END  
    ELSE IF @sortEntity = 6 or @sortEntityName = 'vector' BEGIN  
        INSERT #displayorder select distinct null as [name], a.productid, displayorder from dbo.ProductVector a with (nolock) inner join (select distinct a.ProductID from ProductVector a with (nolock) 
        left join ProductStore b with (nolock) on a.ProductID = b.ProductID where (@filterProduct = 0 or StoreID = @storeID)) b on a.ProductID = B.ProductID where VectorID = @vectorID
    END  
    ELSE BEGIN  
        INSERT #displayorder select distinct [name], a.productid, 1 from dbo.Product a with (nolock) inner join (select distinct a.ProductID from Product a with (nolock) 
        left join ProductStore b with (nolock) on a.ProductID = b.ProductID where (@filterProduct = 0 or StoreID = @storeID)) b on a.ProductID = B.ProductID ORDER BY Name  
    END  

	IF (@ftsenabled = 1)
	BEGIN
		IF rtrim(isnull(@searchstr, '')) <> ''
		BEGIN
			DECLARE @tmpsrch nvarchar(4000)
			SET @tmpsrch = dbo.GetValidSearchString(@searchstr) 
			DELETE #displayorder from #displayorder d left join dbo.KeyWordSearch(@tmpsrch) k on d.productid = k.productid where k.productid is null  
		END
	END
	
	SET @searchstr = '%' + rtrim(ltrim(@searchstr)) + '%' 
 
    IF @InventoryFilter <> -1 BEGIN  
        IF @ViewType = 1 BEGIN  
            INSERT #inventoryfilter  
            SELECT p.productid, pv.VariantID, sum(case p.TrackInventoryBySizeAndColor when 1 then isnull(i.quan, 0) else pv.inventory end ) invqty  
            FROM product p with (NOLOCK) join #displayorder d on p.ProductID = d.ProductID  
                join ProductVariant pv with (NOLOCK) on p.ProductID = pv.ProductID  and pv.IsDefault = 1  
                left join Inventory i with (NOLOCK) on pv.VariantID = i.VariantID  
            GROUP BY p.productid, pv.VariantID  
            HAVING sum(case p.TrackInventoryBySizeAndColor when 1 then isnull(i.quan, 0) else pv.inventory end ) >= @InventoryFilter  
        END  
        ELSE  
            INSERT #inventoryfilter  
            SELECT p.productid, pv.VariantID, sum(case p.TrackInventoryBySizeAndColor when 1 then isnull(i.quan, 0) else pv.inventory end ) invqty  
            FROM product p with (NOLOCK) join #displayorder d on p.ProductID = d.ProductID  
                join ProductVariant pv with (NOLOCK) on p.ProductID = pv.ProductID  
                left join Inventory i with (NOLOCK) on pv.VariantID = i.VariantID  
            GROUP BY p.productid, pv.VariantID  
            HAVING sum(case p.TrackInventoryBySizeAndColor when 1 then isnull(i.quan, 0) else pv.inventory end ) >= @InventoryFilter  
  

        INSERT @productfilter (productid, displayorder, VariantID, VariantDisplayOrder, ProductName, VariantName)  
        SELECT distinct p.productid, do.displayorder, pv.VariantID, pv.DisplayOrder, p.Name, pv.Name  
        FROM   
            product p with (nolock)  
            join #displayorder do on p.ProductID = do.ProductID   
            left join ProductVariant pv        with (NOLOCK) ON p.ProductID = pv.ProductID and pv.IsDefault >= @ViewType  
            left join productcategory pc       with (nolock) on p.ProductID = pc.ProductID   
            left join productsection ps        with (nolock) on p.ProductID = ps.ProductID   
            left join ProductManufacturer pm   with (nolock) on p.ProductID = pm.ProductID   
            left join ProductDistributor pd    with (nolock) on p.ProductID = pd.ProductID   
            left join ProductGenre px          with (nolock) on p.ProductID = px.ProductID   
            left join ProductVector px2        with (nolock) on p.ProductID = px2.ProductID   
            left join ProductLocaleSetting pl  with (nolock) on p.ProductID = pl.ProductID   
            left join ProductCustomerLevel pcl with (nolock) on p.ProductID = pcl.ProductID   
            left join ProductAffiliate pa      with (nolock) on p.ProductID = pa.ProductID
			   
            join #inventoryfilter i on pv.VariantID = i.VariantID  
        WHERE   
              (pc.categoryid = @categoryID or @categoryID is null or @categorycount = 0)  
          and (ps.sectionid = @sectionID or @sectionID is null or @sectioncount = 0)  
          and (pl.LocaleSettingID = @localeID or @localeID is null or @localecount = 0)  
          and (pa.AffiliateID = @affiliateID or pa.AffiliateID is null or @affiliatecount = 0 or @FilterProductsByAffiliate = 0)  
          and (pm.manufacturerid = @manufacturerID or @manufacturerID is null or @manufacturercount = 0)  
          and (pd.DistributorID = @distributorID or @distributorID is null or @distributorcount = 0)  
          and (px.GenreID = @genreID or @genreID is null or @genrecount = 0)  
          and (px2.VectorID = @vectorID or @vectorID is null or @vectorcount = 0)  
          and p.ProductTypeID = coalesce(@ProductTypeID, p.ProductTypeID)  
          and (case   
                when @FilterProductsByCustomerLevel = 0 or @custlevelcount = 0 or pcl.CustomerLevelID is null or @CustomerLevelID is null then 1  
                when @CustomerLevelFilteringIsAscending = 1 and pcl.CustomerLevelID <= @CustomerLevelID then 1   
                when pcl.CustomerLevelID = @CustomerLevelID or pcl.CustomerLevelID is null then 1   
                else 0  
               end  = 1  
              )  
          and (@ftsenabled = 1 or
				(@ftsenabled = 0 and
					(@searchstr is null  
					 or patindex(@searchstr, isnull(p.name, '')) > 0  
					 or patindex(@searchstr, isnull(convert(nvarchar(20),p.productid), '')) > 0   
					 or patindex(@searchstr, isnull(pv.name, '')) > 0  
					 or patindex(@searchstr, isnull(p.sku , '')+isnull(pv.skusuffix , '')) > 0  
					 or patindex(@searchstr, isnull(p.manufacturerpartnumber, '')) > 0  
					 or patindex(@searchstr, isnull(pv.manufacturerpartnumber, '')) > 0  
					 or (patindex(@searchstr, isnull(p.Description, '')) > 0 and @extSearch = 1)  
					 or (patindex(@searchstr, isnull(p.Summary, '')) > 0 and @extSearch = 1)  
					)
				)
              )  
          and case when isnull(pv.saleprice,0) = 0 then 0 else 1 end >= @OnSaleOnly  
          and p.published >= @publishedonly  
          and pv.published >= @publishedonly  
          and isnull(p.IsAPack, 0) <= 1-@ExcludePacks  
          and isnull(p.IsAKit, 0) <= 1-@ExcludeKits  
          and p.IsSystem <= 1-@ExcludeSysProds  
          and p.Deleted = 0  
          and pv.Deleted = 0  
          and ((@IncludeAll = 1) or (getdate() between isnull(p.AvailableStartDate, '1/1/1900') and isnull(p.AvailableStopDate, '1/1/2999')))    
        order by do.displayorder, p.Name, pv.DisplayOrder, pv.Name  
  
    END   
    ELSE BEGIN  
        INSERT @productfilter (productid, displayorder, VariantID, VariantDisplayOrder, ProductName, VariantName)  
        SELECT distinct p.productid, do.displayorder, pv.VariantID, pv.DisplayOrder, p.Name, pv.Name  
        FROM   
            product p with (nolock)  
            join #displayorder do on p.ProductID = do.ProductID   
            join ProductVariant pv             with (NOLOCK) on p.ProductID = pv.ProductID and pv.IsDefault >= @ViewType  
            left join productcategory pc       with (nolock) on p.ProductID = pc.ProductID   
            left join productsection ps        with (nolock) on p.ProductID = ps.ProductID   
            left join ProductManufacturer pm   with (nolock) on p.ProductID = pm.ProductID   
            left join ProductDistributor pd    with (nolock) on p.ProductID = pd.ProductID   
            left join ProductGenre px          with (nolock) on p.ProductID = px.ProductID   
            left join ProductVector px2        with (nolock) on p.ProductID = px2.ProductID   
            left join ProductLocaleSetting pl  with (nolock) on p.ProductID = pl.ProductID   
            left join ProductCustomerLevel pcl with (nolock) on p.ProductID = pcl.ProductID   
            left join ProductAffiliate pa      with (nolock) on p.ProductID = pa.ProductID   
        WHERE   
              (pc.categoryid = @categoryID or @categoryID is null or @categorycount = 0)  
          and (ps.sectionid = @sectionID or @sectionID is null or @sectioncount = 0)  
          and (pl.LocaleSettingID = @localeID or @localeID is null or @localecount = 0)  
          and (pa.AffiliateID = @affiliateID or pa.AffiliateID is null or @affiliatecount = 0 or @FilterProductsByAffiliate = 0)  
          and (pm.manufacturerid = @manufacturerID or @manufacturerID is null or @manufacturercount = 0)  
          and (pd.DistributorID = @distributorID or @distributorID is null or @distributorcount = 0)  
          and (px.GenreID = @genreID or @genreID is null or @genrecount = 0)  
          and (px2.VectorID = @vectorID or @vectorID is null or @vectorcount = 0)  
          and p.ProductTypeID = coalesce(@ProductTypeID, p.ProductTypeID)  
          and (case   
                when @FilterProductsByCustomerLevel = 0 or @custlevelcount = 0 or pcl.CustomerLevelID is null or @CustomerLevelID is null then 1  
                when @CustomerLevelFilteringIsAscending = 1 and pcl.CustomerLevelID <= @CustomerLevelID then 1   
                when pcl.CustomerLevelID = @CustomerLevelID or pcl.CustomerLevelID is null then 1   
                else 0  
               end  = 1  
              )  
          and (@ftsenabled = 1 or
				(@ftsenabled = 0 and
					(@searchstr is null  
					or patindex(@searchstr, isnull(p.name, '')) > 0  
					or patindex(@searchstr, isnull(convert(nvarchar(20),p.productid), '')) > 0   
					or patindex(@searchstr, isnull(pv.name, '')) > 0  
					or patindex(@searchstr, isnull(p.sku , '')+isnull(pv.skusuffix , '')) > 0  
					or patindex(@searchstr, isnull(p.manufacturerpartnumber, '')) > 0  
					or patindex(@searchstr, isnull(pv.manufacturerpartnumber, '')) > 0  
					or (patindex(@searchstr, isnull(p.Description, '')) > 0 and @extSearch = 1)  
					or (patindex(@searchstr, isnull(p.Summary, '')) > 0 and @extSearch = 1)  
					)
				)
              )  
          and case when isnull(pv.saleprice,0) = 0 then 0 else 1 end >= @OnSaleOnly  
          and p.published >= @publishedonly  
          and pv.published >= @publishedonly  
          and isnull(p.IsAPack, 0) <= 1-@ExcludePacks  
          and isnull(p.IsAKit, 0) <= 1-@ExcludeKits  
          and p.IsSystem <= 1-@ExcludeSysProds  
          and p.Deleted = 0  
          and pv.Deleted = 0  
          and ((@IncludeAll = 1) or (getdate() between isnull(p.AvailableStartDate, '1/1/1900') and isnull(p.AvailableStopDate, '1/1/2999')))    
        order by do.displayorder, p.Name, pv.DisplayOrder, pv.Name  
    END  
	
    SET @rcount = @@rowcount  
    IF @StatsFirst = 1  
        SELECT cast(ceiling(@rcount*1.0/@pagesize) as int) pages, @rcount ProductCount  
  
    SELECT   
        p.ProductID,  
        p.Name,  
        pv.VariantID,  
        pv.Name AS VariantName,  
        p.ProductGUID,  
        p.Summary,  
        p.Description,  
        p.SEKeywords,  
        p.SEDescription,  
        p.SpecTitle,  
        p.MiscText,  
        p.SwatchImageMap,  
        p.IsFeaturedTeaser,  
        p.FroogleDescription,  
        p.SETitle,  
        p.SENoScript,  
        p.SEAltText,  
        p.SizeOptionPrompt,  
        p.ColorOptionPrompt,  
        p.TextOptionPrompt,  
        p.ProductTypeID,  
        p.TaxClassID,  
        p.SKU,  
        p.ManufacturerPartNumber,  
        p.SalesPromptID,  
        p.SpecCall,  
        p.SpecsInline,  
        p.IsFeatured,  
        p.XmlPackage,  
        p.ColWidth,  
        p.Published,  
        p.RequiresRegistration,  
        p.Looks,  
        p.Notes,  
        p.QuantityDiscountID,  
        p.RelatedProducts,  
        p.UpsellProducts,  
        p.UpsellProductDiscountPercentage,  
        p.RelatedDocuments,  
        p.TrackInventoryBySizeAndColor,  
        p.TrackInventoryBySize,  
        p.TrackInventoryByColor,  
        p.IsAKit,  
        p.ShowInProductBrowser,  
        p.IsAPack,  
        p.PackSize,  
        p.ShowBuyButton,  
        p.RequiresProducts,  
        p.HidePriceUntilCart,  
        p.IsCalltoOrder,  
        p.ExcludeFromPriceFeeds,  
        p.RequiresTextOption,  
        p.TextOptionMaxLength,  
        p.SEName,  
        p.Deleted,  
        p.CreatedOn,  
        p.ImageFileNameOverride,  
        pv.VariantGUID,  
        pv.Description AS VariantDescription,  
        pv.SEKeywords AS VariantSEKeywords,  
        pv.SEDescription AS VariantSEDescription,  
        pv.Colors,  
        pv.ColorSKUModifiers,  
        pv.Sizes,  
        pv.SizeSKUModifiers,  
        pv.FroogleDescription AS VariantFroogleDescription,  
        pv.SKUSuffix,  
        pv.ManufacturerPartNumber AS VariantManufacturerPartNumber,  
        pv.Price,  
        pv.CustomerEntersPrice,   
        pv.CustomerEntersPricePrompt,  
        isnull(pv.SalePrice, 0) SalePrice,  
        cast(isnull(pv.Weight,0) as decimal(10,1)) Weight,  
        pv.MSRP,  
        pv.Cost,  
        isnull(pv.Points,0) Points,  
        pv.Dimensions,  
        case p.TrackInventoryBySizeAndColor when 1 then isnull(i.quan, 0) else pv.inventory end Inventory,  
        pv.DisplayOrder as VariantDisplayOrder,  
        pv.Notes AS VariantNotes,  
        pv.IsTaxable,  
        pv.IsShipSeparately,  
        pv.IsDownload,  
        pv.DownloadLocation,  
        pv.Published AS VariantPublished,  
        pv.IsSecureAttachment,  
        pv.IsRecurring,  
        pv.RecurringInterval,  
        pv.RecurringIntervalType,  
        pv.SubscriptionInterval,  
        pv.SEName AS VariantSEName,  
        pv.RestrictedQuantities,  
        pv.MinimumQuantity,  
        pv.Deleted AS VariantDeleted,  
        pv.CreatedOn AS VariantCreatedOn,  
        d.Name AS DistributorName,  
        d.DistributorID,  
        d.SEName AS DistributorSEName,  
        m.ManufacturerID,  
        m.Name AS ManufacturerName,  
        m.SEName AS ManufacturerSEName,  
        s.Name AS SalesPromptName,  
        case when pcl.productid is null then 0 else isnull(ep.Price, 0) end ExtendedPrice  
    FROM dbo.Product p with (NOLOCK)   
        left join dbo.ProductVariant       pv  with (NOLOCK) on p.ProductID = pv.ProductID and pv.IsDefault >= @ViewType  
        join @productfilter                pf                on pv.ProductID = pf.ProductID and pv.VariantID = pf.VariantID   
        left join dbo.SalesPrompt           s  with (NOLOCK) on p.SalesPromptID = s.SalesPromptID   
        left join dbo.ProductManufacturer  pm  with (NOLOCK) on p.ProductID = pm.ProductID   
        left join dbo.Manufacturer          m  with (NOLOCK) on pm.ManufacturerID = m.ManufacturerID   
        left join dbo.ProductDistributor   pd  with (NOLOCK) on p.ProductID = pd.ProductID  
        left join dbo.Distributor           d  with (NOLOCK) on pd.DistributorID = d.DistributorID  
        left join dbo.ExtendedPrice        ep  with (NOLOCK) on ep.VariantID = pv.VariantID and ep.CustomerLevelID = @CustomerLevelID  
        left join dbo.ProductCustomerLevel pcl with (NOLOCK) on p.ProductID = pcl.ProductID and pcl.CustomerLevelID = @CustomerLevelID  
        left join (select VariantID, sum(quan) quan from dbo.Inventory with (nolock) group by VariantID) i  on pv.VariantID = i.VariantID  
    WHERE pf.rownum >= @pagesize*(@pagenum-1)+1 and pf.rownum <= @pagesize*(@pagenum)  
    ORDER BY pf.rownum  
  
    IF @StatsFirst <> 1  
        SELECT cast(ceiling(@rcount*1.0/@pagesize) as int) pages, @rcount ProductCount  
  
END  


GO


create proc [dbo].[aspdnsf_ProductInfo]
    @ProductID          int,  
    @CustomerLevelID    int,  
    @DefaultVariantOnly tinyint,  
    @InvFilter          int = 0,  
    @affiliateID        int = null,  
    @publishedonly      tinyint = 1  
  
AS  
SET NOCOUNT ON  
  
DECLARE @CustLevelExists int, @AffiliateExists  int, @FilterProductsByAffiliate tinyint, @FilterProductsByCustomerLevel tinyint, @CustomerLevelFilteringIsAscending tinyint,@DisplayOutOfStockProducts tinyint, @custlevelcount int, @affiliatecount int, @minproductcustlevel int, @HideProductsWithLessThanThisInventoryLevel int  
SELECT @FilterProductsByCustomerLevel     = case ConfigValue when 'true' then 1 else 0 end FROM dbo.AppConfig with (nolock) WHERE [Name] = 'FilterProductsByCustomerLevel'  
SELECT @CustomerLevelFilteringIsAscending = case ConfigValue when 'true' then 1 else 0 end FROM dbo.AppConfig with (nolock) WHERE [Name] = 'FilterByCustomerLevelIsAscending'  
SELECT @FilterProductsByAffiliate         = case ConfigValue when 'true' then 1 else 0 end FROM dbo.AppConfig with (nolock) WHERE [Name] = 'FilterProductsByAffiliate'  
  
SET @minproductcustlevel = 0  
SET @CustLevelExists = 0  
SELECT @custlevelcount = count(*), @minproductcustlevel = min(CustomerLevelID), @CustLevelExists = sum(case when CustomerLevelID = @CustomerLevelID then 1 else 0 end) from dbo.ProductCustomerLevel with (nolock) where ProductID = @ProductID   
SELECT @affiliatecount = count(*),  @AffiliateExists = sum(case when AffiliateID = @affiliateID then 1 else 0 end) from dbo.ProductAffiliate with (nolock) where ProductID = @ProductID   
  
SELECT @DisplayOutOfStockProducts = case ConfigValue when 'true' then 1 else 0 end FROM dbo.AppConfig with (nolock) WHERE [Name] = 'DisplayOutOfStockProducts'
SELECT @HideProductsWithLessThanThisInventoryLevel = convert(int, ConfigValue) FROM dbo.AppConfig with (nolock) WHERE [Name] = 'HideProductsWithLessThanThisInventoryLevel' and isnumeric(ConfigValue) = 1  
  
 IF @DisplayOutOfStockProducts = 1 
 BEGIN
        SET @HideProductsWithLessThanThisInventoryLevel = 0
		SET @InvFilter = -1
 END

IF (@HideProductsWithLessThanThisInventoryLevel > @InvFilter or @HideProductsWithLessThanThisInventoryLevel = -1) and @InvFilter <> -1  
    SET @InvFilter = @HideProductsWithLessThanThisInventoryLevel   
  
  
if (@FilterProductsByCustomerLevel = 0 or @custlevelcount = 0 or (@CustomerLevelFilteringIsAscending = 1 and @minproductcustlevel <= @CustomerLevelID ) or @CustLevelExists > 0)  
    and (@FilterProductsByAffiliate = 0 or @affiliatecount = 0 or @AffiliateExists > 0)  
    SELECT   
           p.*,   
           pv.VariantID, pv.name VariantName, pv.Price, pv.Description VariantDescription, isnull(pv.SalePrice, 0) SalePrice, isnull(SkuSuffix, '') SkuSuffix, pv.Dimensions, pv.Weight, isnull(pv.Points, 0) Points, pv.Inventory, pv.ImageFilenameOverride VariantImageFilenameOverride,  pv.isdefault, pv.CustomerEntersPrice, isnull(pv.colors, '') Colors, isnull(pv.sizes, '') Sizes,  
           sp.name SalesPromptName,   
           case when pcl.productid is null then 0 else isnull(e.Price, 0) end ExtendedPrice  
    FROM dbo.Product p with (nolock) join dbo.productvariant            pv  with (NOLOCK) on p.ProductID = pv.ProductID     
        join dbo.SalesPrompt               sp  with (NOLOCK) on p.SalesPromptID = sp.SalesPromptID   
        left join dbo.ExtendedPrice        e   with (NOLOCK) on pv.VariantID=e.VariantID and e.CustomerLevelID = @CustomerLevelID  
        left join dbo.ProductCustomerLevel pcl with (NOLOCK) on p.ProductID = pcl.ProductID and pcl.CustomerLevelID = @CustomerLevelID  
        left join (select variantid, sum(quan) inventory from inventory group by variantid) i on pv.variantid = i.variantid  
    WHERE p.ProductID = @ProductID   
        and p.Deleted = 0   
        and pv.Deleted = 0   
        and p.published >= @publishedonly  
        and pv.published >= @publishedonly  
        and pv.isdefault >= @DefaultVariantOnly  
        and getdate() between isnull(p.AvailableStartDate, '1/1/1900') and isnull(p.AvailableStopDate, '1/1/2999')  
        and (case p.TrackInventoryBySizeAndColor when 1 then isnull(i.inventory, 0) else pv.inventory end >= @InvFilter or @InvFilter = -1)  
    ORDER BY pv.DisplayOrder, pv.name  



GO


create proc [dbo].[aspdnsf_EditOrderProduct]
    @ShoppingCartRecID int,
    @CustomerLevelID   int
  
AS
SET NOCOUNT ON 

    SELECT p.*, 
           pv.VariantID, pv.name VariantName, pv.Price, isnull(pv.SalePrice, 0) SalePrice, isnull(SkuSuffix, '') SkuSuffix, pv.Dimensions, pv.Weight, isnull(pv.Points, 0) Points, pv.Inventory, pv.ImageFilenameOverride VariantImageFilenameOverride,  pv.isdefault, pv.CustomerEntersPrice,
           sp.name SalesPromptName, 
           case when pcl.productid is null then 0 else isnull(e.Price, 0) end ExtendedPrice
    FROM dbo.ShoppingCart           sc  with (nolock) 
        join dbo.Product            p   with (NOLOCK) on p.ProductID = sc.ProductID   
        join dbo.productvariant     pv  with (NOLOCK) on sc.ProductID = pv.ProductID and sc.variantid = pv.variantid
        join dbo.SalesPrompt        sp  with (NOLOCK) on p.SalesPromptID = sp.SalesPromptID 
        left join dbo.ExtendedPrice e   with (NOLOCK) on pv.VariantID=e.VariantID and e.CustomerLevelID = @CustomerLevelID
        left join dbo.ProductCustomerLevel pcl with (NOLOCK) on p.ProductID = pcl.ProductID and pcl.CustomerLevelID = @CustomerLevelID
    WHERE sc.ShoppingCartRecID = @ShoppingCartRecID


GO


create proc [dbo].[aspdnsf_NukeProduct]
    @ProductID int
  
AS
SET NOCOUNT ON 
BEGIN


BEGIN TRAN
    DELETE dbo.ProductCategory WHERE productid = @productid
    IF @@ERROR <> 0 BEGIN
        raiserror('ProductCategory could not be deleted', 1, 16)
        rollback tran
        return
    END
    
    DELETE dbo.CustomCart WHERE productid = @productid
    IF @@ERROR <> 0 BEGIN
        raiserror('CustomCart could not be deleted', 1, 16)
        rollback tran
        return
    END
    
    DELETE dbo.ProductDistributor WHERE productid = @productid
    IF @@ERROR <> 0 BEGIN
        raiserror('ProductDistributor could not be deleted', 1, 16)
        rollback tran
        return
    END
    
    DELETE dbo.ProductGenre WHERE productid = @productid
    IF @@ERROR <> 0 BEGIN
        raiserror('ProductGenre could not be deleted', 1, 16)
        rollback tran
        return
    END
    
    DELETE dbo.KitCart WHERE productid = @productid
    IF @@ERROR <> 0 BEGIN
        raiserror('KitCart could not be deleted', 1, 16)
        rollback tran
        return
    END
    
    DELETE dbo.KitGroup WHERE productid = @productid
    IF @@ERROR <> 0 BEGIN
        raiserror('KitGroup could not be deleted', 1, 16)
        rollback tran
        return
    END
    
    DELETE dbo.ProductManufacturer WHERE productid = @productid
    IF @@ERROR <> 0 BEGIN
        raiserror('ProductManufacturer could not be deleted', 1, 16)
        rollback tran
        return
    END
    
    DELETE dbo.ProductAffiliate WHERE productid = @productid
    IF @@ERROR <> 0 BEGIN
        raiserror('ProductAffiliate could not be deleted', 1, 16)
        rollback tran
        return
    END
    
    DELETE dbo.ProductCategory WHERE productid = @productid
    IF @@ERROR <> 0 BEGIN
        raiserror('ProductCategory could not be deleted', 1, 16)
        rollback tran
        return
    END
    
    DELETE dbo.ProductCustomerLevel WHERE productid = @productid
    IF @@ERROR <> 0 BEGIN
        raiserror('ProductCustomerLevel could not be deleted', 1, 16)
        rollback tran
        return
    END
    
    DELETE dbo.ProductLocaleSetting WHERE productid = @productid
    IF @@ERROR <> 0 BEGIN
        raiserror('ProductLocaleSetting could not be deleted', 1, 16)
        rollback tran
        return
    END
    
    DELETE dbo.ProductSection WHERE productid = @productid
    IF @@ERROR <> 0 BEGIN
        raiserror('ProductSection could not be deleted', 1, 16)
        rollback tran
        return
    END
    
    DELETE dbo.Rating WHERE productid = @productid 
    IF @@ERROR <> 0 BEGIN
        raiserror('Rating could not be deleted', 1, 16)
        rollback tran
        return
    END
    
    DELETE dbo.RatingCommentHelpfulness WHERE productid = @productid
    IF @@ERROR <> 0 BEGIN
        raiserror('RatingCommentHelpfulness could not be deleted', 1, 16)
        rollback tran
        return
    END
    
    DELETE dbo.ShoppingCart WHERE productid = @productid
    IF @@ERROR <> 0 BEGIN
        raiserror('ShoppingCart could not be deleted', 1, 16)
        rollback tran
        return
    END

    DELETE dbo.ExtendedPrice FROM dbo.ExtendedPrice with (nolock) join [dbo].productvariant pv with (nolock) on ExtendedPrice.variantid = pv.variantid where pv.productid = @productid
    IF @@ERROR <> 0 BEGIN
        raiserror('ExtendedPrice could not be deleted', 1, 16)
        rollback tran
        return
    end
    
    DELETE dbo.Inventory FROM dbo.Inventory with (nolock) join [dbo].productvariant pv with (nolock) on Inventory.variantid = pv.variantid where pv.productid = @productid
    IF @@ERROR <> 0 BEGIN
        raiserror('Inventory could not be deleted', 1, 16)
        rollback tran
        return
    end

    DELETE dbo.ProductVariant WHERE productid = @productid
    IF @@ERROR <> 0 BEGIN
        raiserror('ProductVariant could not be deleted', 1, 16)
        rollback tran
        return
    END

    DELETE dbo.Product WHERE productid = @productid
    IF @@ERROR <> 0 BEGIN
        raiserror('Product could not be deleted', 1, 16)
        rollback tran
        return
    END
    
    
COMMIT TRAN

END


GO


create proc [dbo].[aspdnsf_RecentAdditions]
    @since			int = 180,  -- products added in the last "@since" number of days
    @return			int = 10,   -- returns the top "@returns" items
    @storeID		int = 1,
	@filterProduct	bit = 0
	
  
AS
BEGIN
SET NOCOUNT ON

DECLARE @cmd varchar(200)

CREATE TABLE #tmp (id int not null identity, ProductID int, VariantID int, SKU nvarchar(50), SKUSuffix nvarchar(50), ProductName nvarchar(400), SEName nvarchar(150), VariantName nvarchar(400),ImageFilenameOverride ntext)
INSERT #tmp (ProductID, VariantID, SKU, SKUSuffix, ProductName, SEName, VariantName,ImageFilenameOverride)
SELECT 
    p.ProductID, 
    pv.VariantID, 
    p.SKU, 
    isnull(pv.SKUSuffix, '') SKUSuffix, 
    p.Name, 
    p.SEName, 
    isnull(pv.Name, '') VariantName,
    ISNULL(p.ImageFilenameOverride, '') AS ImageFilenameOverride
FROM dbo.Product p with (nolock) 
    join [dbo].ProductVariant pv with (nolock) on pv.productid = p.productid
    inner join (select distinct a.ProductID from Product a with (nolock) left join ProductStore b with (nolock) on a.ProductID = b.ProductID where (@filterProduct = 0 or StoreID = @storeID)) b on p.ProductID = b.ProductID
WHERE p.CreatedOn >= dateadd(dy, -@since, getdate())
    and p.Deleted = 0 
    and p.Published = 1  
    and pv.Published = 1 
    and pv.Deleted = 0 
ORDER BY p.CreatedOn desc

SET @cmd = 'select top ' + convert(varchar(10), @return ) + ' * FROM #tmp order by id'

EXEC (@cmd)
END





GO


create proc [dbo].[aspdnsf_BestSellers]
    @since			int = 180,  -- best sellers in the last "@since" number of days
    @return			int = 10,   -- returns the top "@returns" items
    @orderby		tinyint = 1, -- 1 = order by count of sales for each product, 2 = order by total dollars sales for each product
    @storeID		int = 1,
	@filterProduct	bit = 0	
 
  
AS
BEGIN
SET NOCOUNT ON

DECLARE @cmd varchar(200)

CREATE TABLE #tmp (id int not null identity, ProductID int, VariantID int, SKU nvarchar(50), SKUSuffix nvarchar(50), ProductName nvarchar(400), SEName nvarchar(150), VariantName nvarchar(400), SalesCount money, SalesDollars money,ImageFilenameOverride ntext, VariantImageFilenameOverride ntext, VariantCount int)
INSERT #tmp (ProductID, VariantID, SKU, SKUSuffix, ProductName, SEName, VariantName, SalesCount, SalesDollars,ImageFilenameOverride, VariantImageFilenameOverride,VariantCount)
SELECT 
    s.ProductID, 
    s.VariantID, 
    p.SKU, 
    isnull(pv.SKUSuffix, '') SKUSuffix, 
    p.Name, 
    p.SEName, 
    isnull(pv.Name, '') VariantName, 
    s.NumSales, 
    s.NumDollars,
    ISNULL(p.ImageFilenameOverride, '') AS ImageFilenameOverride, 
    ISNULL(pv.ImageFilenameOverride, '') AS VariantImageFilenameOverride,
    (SELECT count(VariantID) from ProductVariant WHERE ProductID = p.productid)
FROM (select ProductID, VariantID, SUM(Quantity) AS NumSales, SUM(OrderedProductPrice) AS NumDollars
      from dbo.Orders_ShoppingCart sc
            join [dbo].Orders o on sc.OrderNumber = o.OrderNumber and o.OrderDate >= dateadd(dy, -@since, getdate())
      group by ProductID, VariantID 
     ) s 
    join [dbo].Product p with (nolock) on s.productid = p.productid 
    join [dbo].ProductVariant pv with (nolock) on s.variantid = pv.variantid
    inner join (select distinct a.ProductID from Product a with (nolock) left join ProductStore b with (nolock) on a.ProductID = b.ProductID where (@filterProduct = 0 or StoreID = @storeID)) b on p.ProductID = b.ProductID
WHERE p.Deleted = 0 
    and p.Published = 1  
    and pv.Published = 1 
    and pv.Deleted = 0 
ORDER BY case @orderby when 1 then s.NumSales when 2 then s.NumDollars else s.NumSales end desc


SET @cmd = 'select top ' + convert(varchar(10), @return ) + ' * FROM #tmp order by id'

EXEC (@cmd)
END



GO


CREATE proc [dbo].[aspdnsf_ProductStats]
    @ProductID	int,
	@storeID	int = 1
  
AS
BEGIN
    SET NOCOUNT ON

    SELECT * 
    FROM dbo.product p with (nolock)
        left join (SELECT ProductID,count(rating) as NumRatings, sum(rating) as SumRatings, convert(decimal(4,3), avg(rating*1.0)) AvgRating
                   FROM dbo.Rating with (nolock)
                   WHERE ProductID = @ProductID and StoreID = @storeID
                   GROUP BY ProductID) ps on p.productid = ps.productid 
    WHERE p.ProductID = @ProductID
END



GO


create proc [dbo].[aspdnsf_ImportProductPricing_XML]
    @pricing ntext
  
AS
BEGIN
SET NOCOUNT ON

CREATE TABLE #tmp (ProductID int, VariantID int, KitItemID int, Name nvarchar(400), KitGroup nvarchar(800), SKU nvarchar(50), SKUSuffix nvarchar(50), ManufacturerPartNumber nvarchar(50), Cost money, MSRP money, Price money, SalePrice money, Inventory int)
DECLARE @hdoc int, @retcode int
EXEC @retcode = sp_xml_preparedocument 
                    @hdoc OUTPUT,
                    @pricing

INSERT #tmp
SELECT *
FROM OPENXML(@hdoc, '/productlist/productvariant', 2) 
        WITH (ProductID int, VariantID int, KitItemID int, Name nvarchar(400), KitGroup nvarchar(800), SKU nvarchar(50), SKUSuffix nvarchar(50), ManufacturerPartNumber nvarchar(50), Cost money, MSRP money, Price money, SalePrice money, Inventory int)


UPDATE dbo.ProductVariant
SET Price = t.Price,
    SalePrice = nullif(t.SalePrice,0),
    Inventory = t.Inventory,
    Cost = t.cost
FROM dbo.ProductVariant p 
    join #tmp t  on p.ProductID = t.ProductID and p.VariantID = t.VariantID
WHERE KitItemID = 0


UPDATE dbo.KitItem
SET PriceDelta = t.Price
FROM dbo.KitItem k
    join #tmp t  on k.KitItemID = t.KitItemID
WHERE t.KitItemID > 0



exec sp_xml_removedocument @hdoc

DROP TABLE #tmp
END


GO



create proc [dbo].[aspdnsf_CloneProduct]
    @productID int,
    @userid int = 0, 
    @cloneinventory int = 1
  
AS
BEGIN

SET NOCOUNT ON

DECLARE @tmpKitTbl TABLE(KitGroupID int not null)
DECLARE @tmpPVariantTbl TABLE(VariantID int not null)
DECLARE @newproductID int
DECLARE @err int, @newkitgroupid int

SET @newproductID = -1

BEGIN TRAN
    INSERT [dbo].product (ProductGUID, Name, Summary, Description, SEKeywords, SEDescription, SpecTitle, MiscText, SwatchImageMap, IsFeaturedTeaser, FroogleDescription, SETitle, SENoScript, SEAltText, SizeOptionPrompt, ColorOptionPrompt, TextOptionPrompt, ProductTypeID, TaxClassID, SKU, ManufacturerPartNumber, SalesPromptID, SpecCall, SpecsInline, IsFeatured, XmlPackage, ColWidth, Published, RequiresRegistration, Looks, Notes, QuantityDiscountID, RelatedProducts, UpsellProducts, UpsellProductDiscountPercentage, RelatedDocuments, TrackInventoryBySizeAndColor, TrackInventoryBySize, TrackInventoryByColor, IsAKit, ShowInProductBrowser, IsAPack, PackSize, ShowBuyButton, RequiresProducts, HidePriceUntilCart, IsCalltoOrder, ExcludeFromPriceFeeds, RequiresTextOption, TextOptionMaxLength, SEName, ExtensionData, ExtensionData2, ExtensionData3, ExtensionData4, ExtensionData5, ContentsBGColor, PageBGColor, GraphicsColor, ImageFilenameOverride, IsImport, Deleted, CreatedOn)
    SELECT newid(), Name + ' - CLONED', Summary, Description, SEKeywords, SEDescription, SpecTitle, MiscText, SwatchImageMap, IsFeaturedTeaser, FroogleDescription, SETitle, SENoScript, SEAltText, SizeOptionPrompt, ColorOptionPrompt, TextOptionPrompt, ProductTypeID, TaxClassID, SKU, ManufacturerPartNumber, SalesPromptID, SpecCall, SpecsInline, IsFeatured, XmlPackage, ColWidth, Published, RequiresRegistration, 0, Notes, QuantityDiscountID, RelatedProducts, UpsellProducts, UpsellProductDiscountPercentage, RelatedDocuments, TrackInventoryBySizeAndColor, TrackInventoryBySize, TrackInventoryByColor, IsAKit, ShowInProductBrowser, IsAPack, PackSize, ShowBuyButton, RequiresProducts, HidePriceUntilCart, IsCalltoOrder, ExcludeFromPriceFeeds, RequiresTextOption, TextOptionMaxLength, SEName, ExtensionData, ExtensionData2, ExtensionData3, ExtensionData4, ExtensionData5, ContentsBGColor, PageBGColor, GraphicsColor, ImageFilenameOverride, IsImport, Deleted, getdate()
    FROM dbo.product
    WHERE productid = @productID
    
    SELECT @newproductID = @@identity, @err = @@error

    IF @err <> 0 BEGIN
        raiserror('Product not cloned', 1, 16)
        rollback tran
        return -1
    END





    IF @cloneinventory = 1 BEGIN
        DECLARE @PrdVariantID int, @newvariantID int
        INSERT @tmpPVariantTbl SELECT VariantID FROM dbo.productvariant  WHERE productid = @productID
        SELECT top 1 @PrdVariantID = VariantID FROM @tmpPVariantTbl
        WHILE @@rowcount <> 0 BEGIN

            INSERT [dbo].productvariant (VariantGUID, ProductID, IsDefault, Name, Description, SEKeywords, SEDescription, Colors, ColorSKUModifiers, Sizes, SizeSKUModifiers, FroogleDescription, SKUSuffix, ManufacturerPartNumber, Price, SalePrice, Weight, MSRP, Cost, Points, Dimensions, Inventory, DisplayOrder, Notes, IsTaxable, IsShipSeparately, IsDownload, DownloadLocation, FreeShipping, Published, IsSecureAttachment, IsRecurring, RecurringInterval, RecurringIntervalType, SubscriptionInterval, SubscriptionIntervalType, RewardPoints, SEName, RestrictedQuantities, MinimumQuantity, ExtensionData, ExtensionData2, ExtensionData3, ExtensionData4, ExtensionData5, ContentsBGColor, PageBGColor, GraphicsColor, ImageFilenameOverride, IsImport, Deleted, CreatedOn)
            SELECT newid(), @newproductID, IsDefault, Name, Description, SEKeywords, SEDescription, Colors, ColorSKUModifiers, Sizes, SizeSKUModifiers, FroogleDescription, SKUSuffix, ManufacturerPartNumber, Price, SalePrice, Weight, MSRP, Cost, Points, Dimensions, Inventory, DisplayOrder, Notes, IsTaxable, IsShipSeparately, IsDownload, DownloadLocation, FreeShipping, Published, IsSecureAttachment, IsRecurring, RecurringInterval, RecurringIntervalType, SubscriptionInterval, SubscriptionIntervalType, RewardPoints, SEName, RestrictedQuantities, MinimumQuantity, ExtensionData, ExtensionData2, ExtensionData3, ExtensionData4, ExtensionData5, ContentsBGColor, PageBGColor, GraphicsColor, ImageFilenameOverride, IsImport, Deleted, getdate()
            FROM dbo.productvariant
            WHERE VariantID = @PrdVariantID

            SELECT @newvariantID = @@identity, @err = @@error
        
            IF @err <> 0 BEGIN
                raiserror('Product not cloned', 1, 16)
                rollback tran
                return -2
            END


            INSERT [dbo].Inventory (InventoryGUID, VariantID, Color, Size, Quan, CreatedOn) 
            SELECT newid(), @newvariantID, Color, Size, Quan, getdate()
            FROM dbo.Inventory 
            WHERE VariantID = @PrdVariantID

            IF @@error <> 0 BEGIN
                raiserror('Product not cloned', 1, 16)
                rollback tran
                return -14
            END
        
            DELETE @tmpPVariantTbl where VariantID = @PrdVariantID
            SELECT top 1 @PrdVariantID = VariantID from @tmpPVariantTbl
        END
    END
    ELSE BEGIN

        INSERT [dbo].productvariant (VariantGUID, ProductID, IsDefault, Name, Description, SEKeywords, SEDescription, Colors, ColorSKUModifiers, Sizes, SizeSKUModifiers, FroogleDescription, SKUSuffix, ManufacturerPartNumber, Price, SalePrice, Weight, MSRP, Cost, Points, Dimensions, Inventory, DisplayOrder, Notes, IsTaxable, IsShipSeparately, IsDownload, DownloadLocation, FreeShipping, Published, IsSecureAttachment, IsRecurring, RecurringInterval, RecurringIntervalType, SubscriptionInterval, SubscriptionIntervalType, RewardPoints, SEName, RestrictedQuantities, MinimumQuantity, ExtensionData, ExtensionData2, ExtensionData3, ExtensionData4, ExtensionData5, ContentsBGColor, PageBGColor, GraphicsColor, ImageFilenameOverride, IsImport, Deleted, CreatedOn)
        SELECT newid(), @newproductID, IsDefault, Name, Description, SEKeywords, SEDescription, Colors, ColorSKUModifiers, Sizes, SizeSKUModifiers, FroogleDescription, SKUSuffix, ManufacturerPartNumber, Price, SalePrice, Weight, MSRP, Cost, Points, Dimensions, Inventory, DisplayOrder, Notes, IsTaxable, IsShipSeparately, IsDownload, DownloadLocation, FreeShipping, Published, IsSecureAttachment, IsRecurring, RecurringInterval, RecurringIntervalType, SubscriptionInterval, SubscriptionIntervalType, RewardPoints, SEName, RestrictedQuantities, MinimumQuantity, ExtensionData, ExtensionData2, ExtensionData3, ExtensionData4, ExtensionData5, ContentsBGColor, PageBGColor, GraphicsColor, ImageFilenameOverride, IsImport, Deleted, getdate()
        FROM dbo.productvariant
        WHERE productid = @productID
        
        IF @@error <> 0 BEGIN
            raiserror('Product not cloned', 1, 16)
            rollback tran
            return -2
        END
    
    END





    DECLARE @kitgrpid int
    INSERT @tmpKitTbl select KitGroupID FROM kitgroup  where productid = @productID
    SELECT top 1 @kitgrpid = KitGroupID FROM @tmpKitTbl
    WHILE @@rowcount <> 0 BEGIN
        INSERT [dbo].kitgroup (KitGroupGUID, Name, Description, ProductID, DisplayOrder, KitGroupTypeID, IsRequired, ExtensionData, CreatedOn)
        SELECT newid(), Name, Description, @newproductID, DisplayOrder, KitGroupTypeID, IsRequired, ExtensionData, getdate()
        FROM dbo.kitgroup
        WHERE KitGroupID = @kitgrpid
    
        SELECT @newkitgroupid = @@identity, @err = @@error
    
        IF @err <> 0 BEGIN
            raiserror('Product not cloned', 1, 16)
            rollback tran
            return -3
        END
    
        
        INSERT [dbo].kititem (KitItemGUID, KitGroupID, Name, Description, PriceDelta, IsDefault, DisplayOrder, TextOptionMaxLength, TextOptionWidth, TextOptionHeight, ExtensionData, InventoryVariantID, InventoryVariantColor, InventoryVariantSize, CreatedOn)
        SELECT newid(), @newkitgroupid, kititem.Name, kititem.Description, kititem.PriceDelta, kititem.IsDefault, kititem.DisplayOrder, kititem.TextOptionMaxLength, kititem.TextOptionWidth, kititem.TextOptionHeight, kititem.ExtensionData, kititem.InventoryVariantID, kititem.InventoryVariantColor, kititem.InventoryVariantSize, getdate()
        FROM dbo.kititem 
        WHERE KitGroupID = @kitgrpid
    
        IF @@error <> 0 BEGIN
            raiserror('Product not cloned', 1, 16)
            rollback tran
            return -6
        END
    
        DELETE @tmpKitTbl WHERE KitGroupID = @kitgrpid
        SELECT top 1 @kitgrpid = KitGroupID FROM @tmpKitTbl
    END
    
    INSERT [dbo].productcategory (ProductID, CategoryID, CreatedOn)
    SELECT @newproductID, CategoryID, getdate()
    FROM dbo.productcategory
    WHERE productid = @productID

    IF @@error <> 0 BEGIN
        raiserror('Product not cloned', 1, 16)
        rollback tran
        return -5
    END
    
	
    
    INSERT [dbo].productsection (ProductID, SectionID, CreatedOn)
    SELECT @newproductID, SectionID, getdate()
    FROM dbo.productsection
    WHERE productid = @productID

    IF @@error <> 0 BEGIN
        raiserror('Product not cloned', 1, 16)
        rollback tran
        return -7
    END
    
    
    INSERT [dbo].productaffiliate (ProductID, AffiliateID, CreatedOn)
    SELECT @newproductID, AffiliateID, getdate()
    FROM dbo.productaffiliate
    WHERE productid = @productID

    IF @@error <> 0 BEGIN
        raiserror('Product not cloned', 1, 16)
        rollback tran
        return -9
    END
    
    INSERT [dbo].productcustomerlevel (ProductID, CustomerLevelID, CreatedOn)
    SELECT @newproductID, CustomerLevelID, getdate()
    FROM dbo.productcustomerlevel
    WHERE productid = @productID

    IF @@error <> 0 BEGIN
        raiserror('Product not cloned', 1, 16)
        rollback tran
        return -10 
    END
    
    INSERT [dbo].productlocalesetting (ProductID, LocaleSettingID, CreatedOn)
    SELECT @newproductID, LocaleSettingID, getdate()
    FROM dbo.productlocalesetting
    WHERE productid = @productID

    IF @@error <> 0 BEGIN
        raiserror('Product not cloned', 1, 16)
        rollback tran
        return -11 
    END
    
    INSERT [dbo].ProductManufacturer (ManufacturerID, ProductID, DisplayOrder, CreatedOn)
    SELECT ManufacturerID, @newproductID, DisplayOrder, getdate()
    FROM dbo.productmanufacturer
    WHERE productid = @productID

    IF @@error <> 0 BEGIN
        raiserror('Product not cloned', 1, 16)
        rollback tran
        return -12
    END
    
	
    INSERT [dbo].ProductDistributor (DistributorID, ProductID, DisplayOrder, CreatedOn)
    SELECT DistributorID, @newproductID, DisplayOrder, getdate()
    FROM dbo.productdistributor
    WHERE productid = @productID

    INSERT [dbo].ProductGenre (GenreID, ProductID, DisplayOrder, CreatedOn)
    SELECT GenreID, @newproductID, DisplayOrder, getdate()
    FROM dbo.productgenre
    WHERE productid = @productID

    INSERT [dbo].ProductVector (VectorID, ProductID, DisplayOrder, CreatedOn)
    SELECT VectorID, @newproductID, DisplayOrder, getdate()
    FROM dbo.productvector
    WHERE productid = @productID

    IF @@error <> 0 BEGIN
        raiserror('Product not cloned', 1, 16)
        rollback tran
        return -13
    END


    -- return one result row with new Product ID
    select @newproductID
    

COMMIT TRAN

END


GO


create proc [dbo].[aspdnsf_ExportProductList]
    @categoryID int = -1,
    @sectionID int = -1,
    @manufacturerID int = -1,
    @distributorID int = -1,
    @genreID int = -1,
    @vectorID int = -1
  
AS
BEGIN
    set nocount on 

    declare @productfilter table (productid int not null primary key)

    IF @categoryID+@sectionID+@manufacturerID+@distributorID+@genreID+@vectorID = -6

        SELECT p.ProductID, 
               pv.VariantID, 
               '' KitItemID,
               p.Name, 
               0 KitGroupID,
               '' KitGroup,
               isnull(p.SKU, '') SKU,
               isnull(p.ManufacturerPartNumber, '') ManufacturerPartNumber, 
               isnull(pv.SKUSuffix,'') SKUSuffix, 
               convert(varchar(20), isnull(convert(decimal(10,2), pv.Cost), 0)) Cost, 
               convert(varchar(20), isnull(convert(decimal(10,2), pv.MSRP), 0)) MSRP,
               convert(varchar(20), isnull(convert(decimal(10,2), pv.Price), 0)) Price, 
               convert(varchar(20), isnull(convert(decimal(10,2), pv.SalePrice), 0)) SalePrice, 
               convert(varchar(20), isnull(case p.TrackInventoryBySizeAndColor when 1 then i.quan else pv.Inventory end, 0)) Inventory
        FROM dbo.product p with (nolock) 
            join dbo.productvariant pv with (nolock) on pv.ProductID = p.ProductID
            left join (select VariantID, sum(quan) quan from dbo.Inventory with (nolock) group by VariantID) i on i.VariantID = pv.VariantID
        WHERE p.deleted = 0 and pv.deleted = 0 
        UNION ALL
        SELECT p.ProductID, 
               pv.VariantID, 
               convert(varchar(10), KitItemID) KitItemID,
               k.Name, 
               kg.KitGroupID,
               kg.name,
               '',
               '', 
               '', 
               '', 
               '',
               convert(varchar(20), k.PriceDelta), 
               '', 
               ''
        FROM dbo.product p with (nolock) 
            join dbo.productvariant pv with (nolock) on pv.ProductID = p.ProductID
            join dbo.KitGroup kg with (nolock) on p.ProductID = kg.ProductID 
            join dbo.KitItem k with (nolock) on k.KitGroupID = kg.KitGroupID
        WHERE p.deleted = 0 and pv.deleted = 0 
        ORDER BY p.ProductID, pv.VariantID, KitGroupID

    ELSE BEGIN
        insert @productfilter 
        SELECT distinct p.ProductID FROM dbo.product p with (nolock) join [dbo].productcategory pc with (nolock) on p.ProductID = pc.ProductID WHERE pc.categoryID = @categoryID
        UNION
        SELECT distinct p.ProductID FROM dbo.product p with (nolock) join [dbo].productsection ps with (nolock) on p.ProductID = ps.ProductID WHERE ps.sectionid = @sectionID
        UNION
        SELECT distinct p.ProductID FROM dbo.product p with (nolock) join [dbo].productManufacturer pm with (nolock) on p.ProductID = pm.ProductID WHERE pm.manufacturerid = @manufacturerID
        UNION
        SELECT distinct p.ProductID FROM dbo.product p with (nolock) join [dbo].productDistributor pd with (nolock) on p.ProductID = pd.ProductID WHERE pd.Distributorid = @DistributorID
        UNION
        SELECT distinct p.ProductID FROM dbo.product p with (nolock) join [dbo].productGenre px with (nolock) on p.ProductID = px.ProductID WHERE px.Genreid = @GenreID
        UNION
        SELECT distinct p.ProductID FROM dbo.product p with (nolock) join [dbo].productvector px2 with (nolock) on p.ProductID = px2.ProductID WHERE px2.Vectorid = @VectorID

        SELECT p.ProductID, 
               pv.VariantID, 
               '' KitItemID,
               p.Name, 
               0 KitGroupID,
               '' KitGroup,
               isnull(p.SKU, '') SKU,
               isnull(p.ManufacturerPartNumber, '') ManufacturerPartNumber, 
               isnull(pv.SKUSuffix,'') SKUSuffix, 
               convert(varchar(20), isnull(convert(decimal(10,2), pv.Cost), 0)) Cost, 
               convert(varchar(20), isnull(convert(decimal(10,2), pv.MSRP), 0)) MSRP,
               convert(varchar(20), isnull(convert(decimal(10,2), pv.Price), 0)) Price,
               convert(varchar(20), isnull(convert(decimal(10,2), pv.SalePrice), 0)) SalePrice, 
               convert(varchar(20), isnull(case p.TrackInventoryBySizeAndColor when 1 then i.quan else pv.Inventory end, 0)) Inventory
        FROM dbo.product p with (nolock) 
            join dbo.productvariant pv with (nolock) on pv.ProductID = p.ProductID
            join @productfilter pf on p.ProductID = pf.ProductID
            left join (select VariantID, sum(quan) quan from dbo.Inventory with (nolock) group by VariantID) i on i.VariantID = pv.VariantID
        WHERE p.deleted = 0 and pv.deleted = 0 
        UNION ALL
        SELECT p.ProductID, 
               pv.VariantID, 
               convert(varchar(10), KitItemID) KitItemID,
               k.Name, 
               kg.KitGroupID,
               kg.name,
               '',
               '', 
               '', 
               '', 
               '',
               convert(varchar(20), k.PriceDelta), 
               '', 
               ''
        FROM dbo.product p with (nolock) 
            join dbo.productvariant pv with (nolock) on pv.ProductID = p.ProductID
            join @productfilter pf on p.ProductID = pf.ProductID
            join dbo.KitGroup kg with (nolock) on p.ProductID = kg.ProductID 
            join dbo.KitItem k with (nolock) on k.KitGroupID = kg.KitGroupID
        WHERE p.deleted = 0 and pv.deleted = 0 
        ORDER BY p.ProductID, pv.VariantID, KitGroupID

    END
END



GO


create proc [dbo].[aspdnsf_insProductType]
    @Name nvarchar(400),
    @ProductTypeID int OUTPUT
  
AS
SET NOCOUNT ON
 
if exists (select * FROM dbo.ProductType with (nolock) where [Name] = @Name) begin
 select @ProductTypeID=ProductTypeID FROM dbo.ProductType with (nolock) where [Name] = @Name
end
else begin
    insert dbo.ProductType(ProductTypeGUID, Name) values (newid(),@Name)
    set @ProductTypeID = @@identity
end

GO


CREATE PROC [dbo].[aspdnsf_updProductView]
	@OrgCustomerViewID nvarchar(50),
	@CustomerViewID nvarchar(50)

  
AS
SET NOCOUNT ON
BEGIN
	UPDATE dbo.ProductView SET CustomerViewID=@CustomerViewID WHERE CustomerViewID=@OrgCustomerViewID

	--Remove duplicate records.
	DELETE ProductView WHERE ViewID IN(SELECT MIN(ViewID) FROM ProductView WHERE CustomerViewID=@CustomerViewID GROUP BY ProductID HAVING COUNT(ProductID) >1)
END


GO


CREATE PROC [dbo].[aspdnsf_insProductView]
	@CustomerViewID nvarchar(50),
	@ProductID int,
	@ViewDate datetime

  
AS
SET NOCOUNT ON
BEGIN
	IF EXISTS (SELECT * FROM ProductView with (NOLOCK) where CustomerViewID = @CustomerViewID and ProductID = @ProductID)
	BEGIN 		
		UPDATE ProductView set ViewDate = @ViewDate where CustomerViewID = @CustomerViewID and ProductID = @ProductID
	END
	ELSE
	BEGIN
		insert into ProductView(CustomerViewID,ProductID,ViewDate) values (@CustomerViewID,@ProductID,@ViewDate)
	END
END

GO



set IDENTITY_INSERT [dbo].ProductType ON;
INSERT [dbo].ProductType(ProductTypeID,Name) values(1,'Generic Product');
INSERT [dbo].ProductType(ProductTypeID,Name) values(2,'Kit Product');
INSERT [dbo].ProductType(ProductTypeID,Name) values(100,'Gift Card Physical');
INSERT [dbo].ProductType(ProductTypeID,Name) values(101,'Gift Card Email');
INSERT [dbo].ProductType(ProductTypeID,Name) values(102,'Gift Card Certificate');
set IDENTITY_INSERT [dbo].ProductType OFF;

GO


create proc [dbo].[aspdnsf_CreateMissingVariants] 
  
AS 
BEGIN
SET NOCOUNT ON
INSERT [dbo].ProductVariant (VariantGUID, IsDefault, Name, ProductID, Price, SalePrice, Inventory, 
                           DisplayOrder, IsTaxable, IsShipSeparately, IsDownload, FreeShipping, 
                           Published, Wholesale, IsSecureAttachment, IsRecurring, RecurringInterval, 
                           RecurringIntervalType, SEName, IsImport, Deleted, CreatedOn, 
                           SubscriptionIntervalType, CustomerEntersPrice) 
SELECT newid(), 1, '', p.ProductID, 0, 0, 100000000, 
       1, 0, 0, 0, 0, 
       1, 0, 0, 0, 0, 
       0, '', 0, 0, getdate(), 
       0, 0
FROM dbo.Product p with (nolock) 
    left join [dbo].ProductVariant pv with (nolock) on p.ProductID = pv.ProductID WHERE pv.ProductID is null
END


 

GO


create proc [dbo].[aspdnsf_ResetAllProductVariantDefaults] 
  
as
BEGIN
    SET NOCOUNT ON 

    update dbo.ProductVariant set IsDefault=0
    update dbo.ProductVariant 
    set IsDefault=1 
    from dbo.ProductVariant pv 
        join ( select distinct p.ProductID,pv.VariantID 
               from Product p
               join ProductVariant pv on p.ProductID=pv.ProductID
               where pv.VariantID in (SELECT top 1 VariantID from ProductVariant where ProductID=p.ProductID and ProductVariant.Deleted=0 order by DisplayOrder,Name)
               and p.Deleted=0
             ) a on pv.VariantID = a.VariantID

END



GO


create procedure [dbo].[aspdnsf_GetProductWithVariants](
	@AlphaFilter nvarchar(30) = null,
	@SearchFilter nvarchar(30) = null,
	@pageSize int = null,
	@page int = null
)
as
begin

	declare @count int
	declare @allPages int
	declare @start int
	declare @end int

	-- flag to determine if we should do paging
	declare @doPage bit
	set @doPage = case when @pageSize is null and @page is null then 0 else 1 end	

	-- execute query to fetch the count of all availalble data
	-- which we will use later on to get the paging information
	select @count = count(*)
	from
	(
		select	p.ProductId, 
				p.[Name], 
				p.Description, 
				p.Published, 
				p.Deleted 
		from Product p with (nolock)
		where	(@AlphaFilter IS NULL OR (p.[Name] like @AlphaFilter + '%')) and 
				(@SearchFilter IS NULL OR (p.[Name] like '%' + @SearchFilter + '%'))
	) p

	-- sanity check
	if(@count <= @pageSize) set @pageSize = @count

	-- determine start and end index	
	set @start = ((@page - 1) * @pageSize) + 1
	set @end = (@start + @pageSize) - 1
	if(@end > @count) set @end = @count

	-- compute the total number of pages
	if(@count > 0 ) 
	begin
		set @allPages = @count / @pageSize

		declare @rem int
		set @rem = @count % @pageSize -- residue
		if(@rem > 0) set @allPages = @allPages + 1
	end 
	else set @allPages = 0
	

	-- paging information
	select	@count as TotalCount, 
			@pageSize as PageSize, 
			@page as CurrentPage, 
			@allPages as TotalPages, 
			@start as StartIndex, 
			@end as [EndIndex]
	
	-- actual paged result set
	select	p.ProductId, 
			p.[Name], 
			p.Description, 
			p.Published, 
			p.Deleted 
	from
	(
		select	ROW_NUMBER() over(order by p.ProductId) as [Row_Number], 
				p.ProductId, 
				p.[Name], 
				p.Description, 
				p.Published, 
				p.Deleted 
		from Product p with (nolock)
		where	(@AlphaFilter IS NULL OR (p.[Name] like @AlphaFilter + '%')) and 
				(@SearchFilter IS NULL OR (p.[Name] like '%' + @SearchFilter + '%'))
	) p
	where @doPage = 0 or (ROW_NUMBER BETWEEN @start AND @end)

	-- next result set would be the variants that are tied to the previous products result set	
	select	pv.VariantId, 
			pv.ProductId, 
			pv.[Name], 
			pv.Description, 
			pv.Published, 
			pv.Deleted, 
			pv.IsDefault, 
			pv.Inventory, 
			pv.Price, 
			pv.SalePrice, 
			pv.Weight
	from ProductVariant pv with (nolock)
	inner join 	
	(
		select	p.ProductId
		from
		(
			select	ROW_NUMBER() over(order by p.ProductId) as [Row_Number], 
					p.ProductId, 
					p.[Name], 
					p.Description, 
					p.Published, 
					p.Deleted 
			from Product p with (nolock)
			where	(@AlphaFilter IS NULL OR (p.[Name] like @AlphaFilter + '%')) and 
					(@SearchFilter IS NULL OR (p.[Name] like '%' + @SearchFilter + '%'))
		) p
		where @doPage = 0 or (ROW_NUMBER BETWEEN @start AND @end)
	) p on p.ProductId = pv.ProductId	

end
go



GO

CREATE proc [dbo].[aspdnsf_CloneVariant]
    @VariantID int,
    @userid int = 0 
  
AS
BEGIN
    DECLARE @newvariantid int
    SET @newvariantid = 0

    INSERT [dbo].productvariant (VariantGUID, ProductID, IsDefault, Name, Description, SEKeywords, SEDescription, Colors, ColorSKUModifiers, Sizes, SizeSKUModifiers, FroogleDescription, SKUSuffix, ManufacturerPartNumber, Price, SalePrice, Weight, MSRP, Cost, Points, Dimensions, Inventory, DisplayOrder, Notes, IsTaxable, IsShipSeparately, IsDownload, DownloadLocation, FreeShipping, Published, IsSecureAttachment, IsRecurring, RecurringInterval, RecurringIntervalType, SubscriptionInterval, SubscriptionIntervalType, RewardPoints, SEName, RestrictedQuantities, MinimumQuantity, ExtensionData, ExtensionData2, ExtensionData3, ExtensionData4, ExtensionData5, ContentsBGColor, PageBGColor, GraphicsColor, ImageFilenameOverride, IsImport, Deleted, CreatedOn)
    SELECT newid(), ProductID, 0, '(Cloned) ' + Name, Description, SEKeywords, SEDescription, Colors, ColorSKUModifiers, Sizes, SizeSKUModifiers, FroogleDescription, SKUSuffix, ManufacturerPartNumber, Price, SalePrice, Weight, MSRP, Cost, Points, Dimensions, Inventory, DisplayOrder, Notes, IsTaxable, IsShipSeparately, IsDownload, DownloadLocation, FreeShipping, Published, IsSecureAttachment, IsRecurring, RecurringInterval, RecurringIntervalType, SubscriptionInterval, SubscriptionIntervalType, RewardPoints, SEName, RestrictedQuantities, MinimumQuantity, ExtensionData, ExtensionData2, ExtensionData3, ExtensionData4, ExtensionData5, ContentsBGColor, PageBGColor, GraphicsColor, ImageFilenameOverride, IsImport, Deleted, getdate()
    FROM dbo.productvariant
    WHERE VariantID = @VariantID
    
    SELECT @newvariantid = @@IDENTITY 

    IF @@error <> 0 BEGIN
        raiserror('Variant not cloned', 1, 16)
        SELECT 0 VariantID
        RETURN
    END
    ELSE BEGIN
        INSERT [dbo].ExtendedPrice (ExtendedPriceGUID, VariantID, CustomerLevelID, Price, ExtensionData, CreatedOn)
        SELECT newid(), @newvariantid, CustomerLevelID, Price, ExtensionData, getdate()
        FROM dbo.ExtendedPrice
        WHERE VariantID = @VariantID

        INSERT [dbo].Inventory (InventoryGUID, VariantID, Color, Size, Quan, CreatedOn)
        SELECT newid(), @newvariantid, Color, Size, Quan, @userid
        FROM dbo.Inventory
        WHERE VariantID = @VariantID

        SELECT @newvariantid VariantID
    END
END



GO


create proc [dbo].[aspdnsf_CreateDefaultVariant] 
AS
SET NOCOUNT ON


INSERT [dbo].ProductVariant (VariantGUID, IsDefault, Name, ProductID, Price, SalePrice, Inventory, 
                       DisplayOrder, IsTaxable, IsShipSeparately, IsDownload, FreeShipping, 
                       Published, Wholesale, IsSecureAttachment, IsRecurring, RecurringInterval, 
                       RecurringIntervalType, SEName, IsImport, Deleted, CreatedOn, 
                       SubscriptionIntervalType, CustomerEntersPrice)
SELECT newid(), 1, '', p.ProductID, 0, 0, 100000000, 
       1, 0, 0, 0, 0, 
       1, 0, 0, 0, 0, 
       0, '', 0, 0, getdate(), 
       0, 0
FROM dbo.Product p with (nolock) 
    left join dbo.ProductVariant pv with (nolock) on p.ProductID = pv.ProductID
WHERE pv.ProductID is null



GO


CREATE proc [dbo].[aspdnsf_CreateGiftCard]
    @SerialNumber nvarchar(200),
    @PurchasedByCustomerID int,
    @OrderNumber int = null,
    @ShoppingCartRecID int,
    @ProductID int = null,
    @VariantID int = null,
    @InitialAmount money = null,
    @Balance money = null,
    @ExpirationDate datetime = null,
    @GiftCardTypeID int,
    @EMailName nvarchar(100) = null,
    @EMailTo nvarchar(100) = null,
    @EMailMessage ntext = null,
    @ValidForCustomers ntext = null,
    @ValidForProducts ntext = null,
    @ValidForManufacturers ntext = null,
    @ValidForCategories ntext = null,
    @ValidForSections ntext = null,
    @ExtensionData ntext = null,
    @GiftCardID int OUTPUT
  
AS
SET NOCOUNT ON 

IF @ExpirationDate is null
    set @ExpirationDate = dateadd(yy, 1, getdate())

insert dbo.GiftCard(GiftCardGUID, SerialNumber, PurchasedByCustomerID, OrderNumber, ShoppingCartRecID, ProductID, VariantID, InitialAmount, Balance, ExpirationDate, GiftCardTypeID, EMailName, EMailTo, EMailMessage, ValidForCustomers, ValidForProducts, ValidForManufacturers, ValidForCategories, ValidForSections, DisabledByAdministrator, ExtensionData, CreatedOn)
values 
(
    newid(), 
    @SerialNumber,
    @PurchasedByCustomerID, 
    isnull(@OrderNumber, 0),
    isnull(@ShoppingCartRecID, 0),
    isnull(@ProductID, 0),
    isnull(@VariantID, 0),
    isnull(@InitialAmount,0), 
    isnull(@Balance, 0),
    @ExpirationDate,
    @GiftCardTypeID,
    @EMailName, 
    @EMailTo, 
    @EMailMessage, 
    @ValidForCustomers, 
    @ValidForProducts, 
    @ValidForManufacturers, 
    @ValidForCategories, 
    @ValidForSections, 
    0, 
    @ExtensionData, 
    getdate()
)

set @GiftCardID = @@identity




GO


create proc [dbo].[aspdnsf_updGiftCard]
    @GiftCardID int,
    @SerialNumber nvarchar(100),
    @OrderNumber int,
    @InitialAmount money,
    @Balance money,
    @ExpirationDate datetime,
    @EMailName nvarchar(100),
    @EMailTo nvarchar(100),
    @EMailMessage ntext,
    @ValidForCustomers ntext,
    @ValidForProducts ntext,
    @ValidForManufacturers ntext,
    @ValidForCategories ntext,
    @ValidForSections ntext,
    @DisabledByAdministrator tinyint,
    @ExtensionData ntext
  
AS
SET NOCOUNT ON 


UPDATE dbo.GiftCard
SET 
    SerialNumber = COALESCE(@SerialNumber, SerialNumber),
    OrderNumber = COALESCE(@OrderNumber, OrderNumber),
    InitialAmount = COALESCE(@InitialAmount, InitialAmount),
    Balance = COALESCE(@Balance, Balance),
    ExpirationDate = COALESCE(@ExpirationDate, ExpirationDate),
    EMailName = COALESCE(@EMailName, EMailName),
    EMailTo = COALESCE(@EMailTo, EMailTo),
    EMailMessage = COALESCE(@EMailMessage, EMailMessage),
    ValidForCustomers = COALESCE(@ValidForCustomers, ValidForCustomers),
    ValidForProducts = COALESCE(@ValidForProducts, ValidForProducts),
    ValidForManufacturers = COALESCE(@ValidForManufacturers, ValidForManufacturers),
    ValidForCategories = COALESCE(@ValidForCategories, ValidForCategories),
    ValidForSections = COALESCE(@ValidForSections, ValidForSections),
    DisabledByAdministrator = COALESCE(@DisabledByAdministrator, DisabledByAdministrator),
    ExtensionData = COALESCE(@ExtensionData, ExtensionData)
WHERE GiftCardID = @GiftCardID



GO


create proc [dbo].[aspdnsf_insGiftCardUsage]
    @GiftCardID int,
    @UsageTypeID int,
    @UsedByCustomerID int,
    @OrderNumber int,
    @Amount money,
    @ExtensionData ntext = null,
    @GiftCardUsageID int OUTPUT
  
AS
BEGIN
    SET NOCOUNT ON 
    DECLARE @err int, @TotalUsage money, @Balance money
    
    select @Balance = Balance from dbo.GiftCard with (nolock) WHERE GiftCardID = @GiftCardID
    IF @UsageTypeID in (2, 4) and @Balance < @Amount BEGIN
        SET @Amount = @Balance 
    END

    BEGIN TRAN
        insert dbo.GiftCardUsage(GiftCardUsageGUID, GiftCardID, UsageTypeID, UsedByCustomerID, OrderNumber, Amount, ExtensionData, CreatedOn)
        values (newid(), @GiftCardID, @UsageTypeID, @UsedByCustomerID, @OrderNumber, @Amount, @ExtensionData, getdate())

        SELECT  @GiftCardUsageID = @@identity, @err = @@ERROR
        IF @err <> 0 BEGIN
            SET @GiftCardUsageID = -2
            RAISERROR('Could not enter gift card usage transaction', 16, 1)
            ROLLBACK TRAN
            RETURN
        END 

        SELECT @TotalUsage = sum(Amount*(case when UsageTypeID in (2, 4) then -1 else 1 end)) FROM dbo.GiftCardUsage with (nolock) WHERE GiftCardID = @GiftCardID
        UPDATE dbo.GiftCard
        SET Balance = InitialAmount + @TotalUsage 
        WHERE GiftCardID = @GiftCardID

        IF @err <> 0 BEGIN
            SET @GiftCardUsageID = -3
            RAISERROR('Could not update gift card balance', 16, 1)
            ROLLBACK TRAN
            RETURN
        END 

    COMMIT TRAN
END


GO


create proc [dbo].[aspdnsf_updGiftCardUsage]
    @GiftCardUsageID int,
    @UsageTypeID int,
    @UsedByCustomerID int,
    @OrderNumber int,
    @Amount money,
    @ExtensionData ntext
  
AS
SET NOCOUNT ON 


UPDATE dbo.GiftCardUsage
SET 
    UsageTypeID = COALESCE(@UsageTypeID, UsageTypeID),
    UsedByCustomerID = COALESCE(@UsedByCustomerID, UsedByCustomerID),
    OrderNumber = COALESCE(@OrderNumber, OrderNumber),
    Amount = COALESCE(@Amount, Amount),
    ExtensionData = COALESCE(@ExtensionData, ExtensionData)
WHERE GiftCardUsageID = @GiftCardUsageID





GO


create proc [dbo].[aspdnsf_getGiftCardUsage]
    @GiftCardUsageID int
  
AS
SET NOCOUNT ON 


SELECT GiftCardUsageID, GiftCardUsageGUID, GiftCardID, UsageTypeID, UsedByCustomerID, OrderNumber, Amount, ExtensionData, CreatedOn
FROM dbo.GiftCardUsage with (nolock) 
WHERE GiftCardUsageID = COALESCE(@GiftCardUsageID, GiftCardUsageID)




GO


create proc [dbo].[aspdnsf_getGiftCardUsageByGiftCard]
    @GiftCardID int
  
AS
SET NOCOUNT ON 


SELECT GiftCardUsageID, GiftCardUsageGUID, GiftCardID, UsageTypeID, UsedByCustomerID, OrderNumber, Amount, ExtensionData, CreatedOn
FROM dbo.GiftCardUsage with (nolock) 
WHERE GiftCardID = @GiftCardID


GO


CREATE PROCEDURE [dbo].[aspdnsf_GetFeaturedProducts](
	@FeaturedCategoryID				INT,
	@NumHomePageFeaturedProducts	INT,
	@CustomerLevelID				INT,
	@storeID						INT = 1,
	@filterProduct					BIT = 0
)
  
AS
BEGIN
	SET NOCOUNT ON

	declare @numSpecialDisplay int 

	if @NumHomePageFeaturedProducts = 0 
		select @numSpecialDisplay = configvalue from appconfig where name = 'NumHomePageSpecials'		
	else
		select @numSpecialDisplay = @NumHomePageFeaturedProducts
		
	select top (@numSpecialDisplay) 
		p.ProductID,
		p.ImageFilenameOverride,
		p.SKU,
		p.SEName,
		p.Name,
		p.Description,
		p.TaxClassID,
		pv.VariantID, 
		p.HidePriceUntilCart,
		pv.name VariantName, 
		pv.Price, 
		pv.Description VariantDescription, 
		isnull(pv.SalePrice, 0) SalePrice, 
		isnull(SkuSuffix, '') SkuSuffix, 
		pv.Dimensions, 
		pv.Weight, 
		isnull(pv.Points, 0) Points, 
		pv.Inventory, 
		pv.ImageFilenameOverride VariantImageFilenameOverride,  
		pv.isdefault, 
		pv.CustomerEntersPrice, 
		isnull(pv.colors, '') Colors, 
		isnull(pv.sizes, '') Sizes, 
		sp.name SalesPromptName,
		case when pcl.productid is null then 0 else isnull(e.Price, 0) end ExtendedPrice		   
	from ProductCategory pc with (NOLOCK) 
	inner join Product p with (NOLOCK) on pc.ProductID = p.ProductID 
	inner join ProductVariant pv with (NOLOCK) on pv.ProductID = p.ProductID and pv.IsDefault = 1
	join dbo.SalesPrompt sp with (NOLOCK) on p.SalesPromptID = sp.SalesPromptID 
	left join dbo.ExtendedPrice e  with (NOLOCK) on pv.VariantID=e.VariantID and e.CustomerLevelID = @CustomerLevelID 
	left join dbo.ProductCustomerLevel pcl with (NOLOCK) on p.ProductID = pcl.ProductID and pcl.CustomerLevelID = @CustomerLevelID 
	INNER JOIN (SELECT DISTINCT a.ProductID FROM Product a with (nolock) left join ProductStore b with (nolock) on a.ProductID = b.ProductID WHERE (@filterProduct = 0 OR StoreID = @storeID)) ps on pc.ProductID = ps.ProductID
	where pc.CategoryID=@FeaturedCategoryID and p.Deleted=0
	order by newid()

END


GO


set IDENTITY_INSERT [dbo].SalesPrompt ON;
INSERT [dbo].SalesPrompt(SalesPromptID,Name) values(1,'On Sale For');
INSERT [dbo].SalesPrompt(SalesPromptID,Name) values(2,'Special Introductory Price');
INSERT [dbo].SalesPrompt(SalesPromptID,Name) values(3,'On Sale Now');
INSERT [dbo].SalesPrompt(SalesPromptID,Name) values(4,'Member Price');
INSERT [dbo].SalesPrompt(SalesPromptID,Name) values(5,'Special Affiliate Price');
INSERT [dbo].SalesPrompt(SalesPromptID,Name) values(6,'Grand Opening Sale Price');
set IDENTITY_INSERT [dbo].SalesPrompt OFF;


GO


CREATE proc dbo.aspdnsf_WorldShipExport   
          
AS      
SET NOCOUNT ON
BEGIN

    SELECT CAST(o.OrderNumber AS varchar(10)) + '-' + CAST(a.ShippingAddressID AS varchar(10)) OrderNumber,    
         o.ShippingTrackingNumber, o.ShippedOn, o.ShippingMethod, o.CustomerID, o.FirstName + ' ' + o.LastName [Name],    
         o.Email, ad.FirstName + ' ' + ad.LastName AS ShippingName, o.ShippingCompany, ad.Address1 ShippingAddress1,
         ad.Address2 ShippingAddress2, ad.Suite ShippingSuite, ad.City ShippingCity, ad.State ShippingState, ad.Zip ShippingZip, ad.Country ShippingCountry,     
         ad.Phone ShippingPhone, b.AddressSubTotal OrderSubtotal,    
         o.OrderTax, o.OrderShippingCosts, o.OrderTotal, o.OrderDate, CASE WHEN (c.AddressCount = 1) THEN o.OrderWeight ELSE b.AddressWeightTotal END OrderWeight
    FROM dbo.Orders o    with (nolock) 
     JOIN (SELECT OrderNumber, ShippingAddressID FROM dbo.orders_shoppingcart with (nolock) GROUP BY OrderNumber, ShippingAddressID HAVING COUNT(DISTINCT ShippingAddressID) = 1 ) a ON O.OrderNumber = A.OrderNumber    
     JOIN (SELECT OrderNumber, ShippingAddressID, SUM(OrderedProductPrice * Quantity) AddressSubTotal,   SUM(PV.Weight * Quantity) AddressWeightTotal FROM dbo.orders_shoppingcart os with (nolock) JOIN productvariant pv with (nolock) on os.variantid = pv.variantid group by ordernumber, shippingaddressid )  b on b.ordernumber = a.ordernumber and b.ShippingAddressID = a.ShippingAddressID    
     JOIN (SELECT OrderNumber, count(ShippingAddressID) AddressCount FROM dbo.orders_shoppingcart with (nolock) group by ordernumber ) c on c.ordernumber = a.ordernumber
     JOIN dbo.Address ad on ad.addressid = b.shippingaddressid    

    WHERE o.ReadyToShip = 1 AND o.ShippedOn IS NULL AND TransactionState IN ('AUTHORIZED', 'CAPTURED')
    ORDER BY ordernumber

END



GO


set IDENTITY_INSERT [dbo].ShippingCalculation ON;
INSERT [dbo].ShippingCalculation(ShippingCalculationID,Name,Selected) values(1,'Calculate Shipping By Weight',0);
INSERT [dbo].ShippingCalculation(ShippingCalculationID,Name,Selected) values(2,'Calculate Shipping By Total',1);
INSERT [dbo].ShippingCalculation(ShippingCalculationID,Name,Selected) values(3,'Use Fixed Prices',0);
INSERT [dbo].ShippingCalculation(ShippingCalculationID,Name,Selected) values(4,'All Orders Have Free Shipping',0);
INSERT [dbo].ShippingCalculation(ShippingCalculationID,Name,Selected) values(5,'Use Fixed Percentage Of Total',0);
INSERT [dbo].ShippingCalculation(ShippingCalculationID,Name,Selected) values(6,'Use Individual Item Shipping Costs',0);
INSERT [dbo].ShippingCalculation(ShippingCalculationID,Name,Selected) values(7,'Use Real Time Rates',0);
INSERT [dbo].ShippingCalculation(ShippingCalculationID,Name,Selected) values(8,'Calculate Shipping By Weight & Zone',0);
INSERT [dbo].ShippingCalculation(ShippingCalculationID,Name,Selected) values(9,'Calculate Shipping By Total & Zone',0);
INSERT [dbo].ShippingCalculation(ShippingCalculationID,Name,Selected) values(10,'Calculate Shipping By Total & Percent',0);
set IDENTITY_INSERT [dbo].ShippingCalculation OFF;

GO


create view [dbo].[ShippingMethodStoreSummaryView]
AS
SELECT	sm.ShippingMethodID, 
        SUM(CASE WHEN sms.StoreId IS NULL THEN 0 ELSE POWER(2, sms.StoreId) END) AS StoreBitMap
FROM ShippingMethod sm WITH (NOLOCK) 
LEFT OUTER JOIN ShippingMethodStore sms WITH (NOLOCK) ON sm.ShippingMethodID = sms.ShippingMethodID 
GROUP BY sm.ShippingMethodID


GO


create proc [dbo].[aspdnsf_StoreVersion] 
as
BEGIN
    select configvalue from dbo.appconfig with (nolock) where name='StoreVersion'
end


GO


CREATE PROC [dbo].[aspdnsf_CloneStoreMappings]
	@FromStoreID INT,	
	@ToStoreID int
AS
BEGIN	
	
	INSERT INTO EntityStore (StoreID, EntityID, EntityType)
	SELECT @ToStoreID AS [StoreID], EntityID, EntityType FROM EntityStore WHERE StoreID = @FromStoreID

	INSERT INTO AffiliateStore (StoreID, AffiliateID)
	SELECT @ToStoreID AS [StoreID], AffiliateID FROM AffiliateStore WHERE StoreID = @FromStoreID

	INSERT INTO NewsStore (StoreID, NewsID)
	SELECT @ToStoreID AS [StoreID], NewsID FROM NewsStore WHERE StoreID = @FromStoreID

	INSERT INTO ProductStore (StoreID, ProductID)
	SELECT @ToStoreID AS [StoreID], ProductID FROM ProductStore WHERE StoreID = @FromStoreID

	INSERT INTO TopicStore (StoreID, TopicID)
	SELECT @ToStoreID AS [StoreID], TopicID FROM TopicStore WHERE StoreID = @FromStoreID

	INSERT INTO PollStore (StoreID, PollID)
	SELECT @ToStoreID AS [StoreID], PollID FROM Pollstore WHERE StoreID = @FromStoreID

	INSERT INTO GiftCardStore (StoreID, GiftCardID)
	SELECT @ToStoreID AS [StoreID], GiftCardID FROM GiftCardStore WHERE StoreID = @FromStoreID

	INSERT INTO CouponStore (StoreID, CouponID)
	SELECT @ToStoreID AS [StoreID], CouponID FROM CouponStore WHERE StoreID = @FromStoreID

	INSERT INTO OrderOptionStore(StoreID, OrderOptionID)
	SELECT @ToStoreID AS [StoreID], OrderOptionID FROM OrderOptionStore WHERE StoreID = @FromStoreID

	INSERT INTO ShippingMethodStore(StoreID, ShippingMethodID)
	SELECT @ToStoreID AS [StoreID], ShippingMethodID FROM ShippingMethodStore WHERE StoreID = @FromStoreID

	-- only create additional configs/string resources for non-default stores
	declare @isDefault tinyint
	select @isDefault = IsDefault from Store WHERE StoreID = @FromStoreID
	if(@isDefault <> 1)
	begin
	   INSERT INTO StringResource(StringResourceGUID, StoreID, [Name], LocaleSetting, ConfigValue)
		SELECT newid(), @ToStoreID, [Name], LocaleSetting, ConfigValue FROM StringResource WHERE StoreID = @FromStoreID 

		INSERT INTO AppConfig(AppConfigGUID, StoreID, [Name], Description, ConfigValue, ValueType, AllowableValues, GroupName, SuperOnly, Hidden)
		SELECT newid(), @ToStoreID, [Name], Description, ConfigValue, ValueType, AllowableValues, GroupName, SuperOnly, Hidden FROM AppConfig WHERE StoreID = @FromStoreID 	
	end	
END


GO


CREATE PROC [dbo].[aspdnsf_NukeStoreMappings]
	@StoreID INT
AS
BEGIN
	
	
	DELETE FROM EntityStore WHERE StoreID = @StoreID
	DELETE FROM AffiliateStore WHERE StoreID = @StoreID	
	DELETE FROM NewsStore WHERE StoreID = @StoreID	
	DELETE FROM ProductStore WHERE StoreID = @StoreID
	DELETE FROM TopicStore WHERE StoreID = @StoreID	
	DELETE FROM Pollstore WHERE StoreID = @StoreID	
	DELETE FROM GiftCardStore WHERE StoreID = @StoreID	
	DELETE FROM CouponStore WHERE StoreID = @StoreID	
	DELETE FROM OrderOptionStore WHERE StoreID = @StoreID	
	DELETE FROM ShippingMethodStore WHERE StoreID = @StoreID

	-- only create additional configs/string resources for non-default stores
	declare @isDefault tinyint
	select @isDefault = IsDefault from Store WHERE StoreID = @StoreID
	if(@isDefault <> 1)
	begin	   
		DELETE FROM StringResource WHERE StoreID = @StoreID 		
		DELETE FROM AppConfig WHERE StoreID = @StoreID 	
	end	
END


GO


create procedure [dbo].[aspdnsf_NukeStoreCustomer]
	@StoreID int,
	@IncludeAdmins BIT = 0
as
begin
	set nocount on;

	delete cu	
	from couponusage cu
	inner join Customer c on cu.CustomerID = c.CustomerID
	where c.StoreID = @StoreID and (@IncludeAdmins = 0 and c.IsAdmin = 0) or (@IncludeAdmins = 1 and c.IsAdmin in (0, 1, 3))

	delete occ	
	from orders_customcart occ
	inner join Customer c on occ.CustomerID = c.CustomerID
	where c.StoreID = @StoreID and (@IncludeAdmins = 0 and c.IsAdmin = 0) or (@IncludeAdmins = 1 and c.IsAdmin in (0, 1, 3))

	delete okc	
	from orders_kitcart okc
	inner join Customer c on okc.CustomerID = c.CustomerID
	where c.StoreID = @StoreID and (@IncludeAdmins = 0 and c.IsAdmin = 0) or (@IncludeAdmins = 1 and c.IsAdmin in (0, 1, 3))

	delete osc	
	from orders_ShoppingCart osc
	inner join Customer c on osc.CustomerID = c.CustomerID
	where c.StoreID = @StoreID and (@IncludeAdmins = 0 and c.IsAdmin = 0) or (@IncludeAdmins = 1 and c.IsAdmin in (0, 1, 3))

	delete o	
	from orders o
	inner join Customer c on o.CustomerID = c.CustomerID
	where c.StoreID = @StoreID and (@IncludeAdmins = 0 and c.IsAdmin = 0) or (@IncludeAdmins = 1 and c.IsAdmin in (0, 1, 3))

	delete sc	
	from ShoppingCart sc
	inner join Customer c on sc.CustomerID = c.CustomerID
	where c.StoreID = @StoreID and (@IncludeAdmins = 0 and c.IsAdmin = 0) or (@IncludeAdmins = 1 and c.IsAdmin in (0, 1, 3))

	delete ft	
	from failedtransaction ft
	inner join Customer c on ft.CustomerID = c.CustomerID
	where c.StoreID = @StoreID and (@IncludeAdmins = 0 and c.IsAdmin = 0) or (@IncludeAdmins = 1 and c.IsAdmin in (0, 1, 3))

	delete kc	
	from kitcart kc
	inner join Customer c on kc.CustomerID = c.CustomerID
	where c.StoreID = @StoreID and (@IncludeAdmins = 0 and c.IsAdmin = 0) or (@IncludeAdmins = 1 and c.IsAdmin in (0, 1, 3))

	delete cc	
	from customcart cc
	inner join Customer c on cc.CustomerID = c.CustomerID
	where c.StoreID = @StoreID and (@IncludeAdmins = 0 and c.IsAdmin = 0) or (@IncludeAdmins = 1 and c.IsAdmin in (0, 1, 3))


	delete pvr	
	from pollvotingrecord pvr
	inner join Customer c on pvr.CustomerID = c.CustomerID
	where c.StoreID = @StoreID and (@IncludeAdmins = 0 and c.IsAdmin = 0) or (@IncludeAdmins = 1 and c.IsAdmin in (0, 1, 3))

	delete rch	
	from ratingcommenthelpfulness rch
	inner join Customer c on rch.RatingCustomerID = c.CustomerID or rch.VotingCustomerID = c.CustomerID
	where c.StoreID = @StoreID and (@IncludeAdmins = 0 and c.IsAdmin = 0) or (@IncludeAdmins = 1 and c.IsAdmin in (0, 1, 3))

	delete r	
	from rating r
	inner join Customer c on r.CustomerID = c.CustomerID
	where c.StoreID = @StoreID and (@IncludeAdmins = 0 and c.IsAdmin = 0) or (@IncludeAdmins = 1 and c.IsAdmin in (0, 1, 3))

	delete a	
	from Address a
	inner join Customer c on a.CustomerID = c.CustomerID
	where c.StoreID = @StoreID and (@IncludeAdmins = 0 and c.IsAdmin = 0) or (@IncludeAdmins = 1 and c.IsAdmin in (0, 1, 3))

	delete lce
	from LOG_CustomerEvent lce
	inner join Customer c on lce.CustomerID = c.CustomerID
	where c.StoreID = @StoreID and (@IncludeAdmins = 0 and c.IsAdmin = 0) or (@IncludeAdmins = 1 and c.IsAdmin in (0, 1, 3))

	delete cgrs
	from CustomerGiftRegistrySearches cgrs
	inner join Customer c on cgrs.CustomerID = c.CustomerID
	where c.StoreID = @StoreID and (@IncludeAdmins = 0 and c.IsAdmin = 0) or (@IncludeAdmins = 1 and c.IsAdmin in (0, 1, 3))

	delete cs
	from CustomerSession cs
	inner join Customer c on cs.CustomerID = c.CustomerID
	where c.StoreID = @StoreID and (@IncludeAdmins = 0 and c.IsAdmin = 0) or (@IncludeAdmins = 1 and c.IsAdmin in (0, 1, 3))
	
	delete c
	from Customer c
	where c.StoreID = @StoreID and (@IncludeAdmins = 0 and c.IsAdmin = 0) or (@IncludeAdmins = 1 and c.IsAdmin in (0, 1, 3))

end

GO


create procedure [dbo].[aspdnsf_NukeStoreOrder]
	@StoreID int
as
begin
	set nocount on;

	delete occ
	from Orders_CustomCart occ
	inner join Orders o on o.OrderNumber = occ.OrderNumber
	where o.StoreId = @StoreId
	
	delete okc
	from Orders_KitCart okc
	inner join Orders o on o.OrderNumber = okc.OrderNumber
	where o.StoreId = @StoreId
	
	delete osc
	from Orders_ShoppingCart osc
	inner join Orders o on o.OrderNumber = osc.OrderNumber
	where o.StoreId = @StoreId
	
	delete o
	from Orders o
	where o.StoreId = @StoreId
	
end

GO


create procedure [dbo].[aspdnsf_MakeStoreDefault]
	@StoreID int
as
begin
	set nocount on;

	declare @prefDefID int
	select @prefDefID = StoreID from Store where IsDefault = 1
	
	update Store set IsDefault = Case when(StoreId = @StoreId) then 1 else 0 end

	-- synchronize appconfig and string resources
	update AppConfig set StoreID = @StoreID where StoreID = @prefDefID
	update StringResource set StoreID = @StoreID where StoreID = @prefDefID

end


GO


create procedure [dbo].[aspdnsf_SaveMap]
	@StoreID INT,
	@EntityID INT,
	@EntityType NVARCHAR(50),
	@Map BIT

AS
BEGIN
	-- Add Mapping Information
	if(@map = 1)
	begin

		IF @EntityType='Product'
		begin
			IF NOT EXISTS (SELECT * FROM ProductStore WHERE StoreID = @StoreID AND ProductID = @EntityID)
			begin
				INSERT INTO ProductStore(StoreID, ProductID) VALUES (@StoreID, @EntityID)
			end
		end
		else IF @EntityType in ('Category', 'Manufacturer', 'Section')
		begin
			IF NOT EXISTS (SELECT * FROM EntityStore WHERE StoreID = @StoreID AND EntityId = @EntityID and EntityType = @EntityType)
			begin
				INSERT INTO EntityStore(StoreID, EntityType, EntityId) VALUES (@StoreID, @EntityType, @EntityID)
			end
		end
		else IF @EntityType='ShippingMethod'
		begin
			IF NOT EXISTS (SELECT * FROM ShippingMethodStore WHERE StoreID = @StoreID AND ShippingMethodId = @EntityID)
			begin
				INSERT INTO ShippingMethodStore(StoreID, ShippingMethodId) VALUES (@StoreID, @EntityID)
			end
		end
		else IF @EntityType = 'Topic'
		begin
			IF NOT EXISTS(SELECT * FROM TopicStore WHERE @StoreID = StoreID AND TopicID = @EntityID)
			begin
				INSERT INTO TopicStore (StoreID, TopicID) VALUES (@StoreID, @EntityID)
			end			
		end
		else IF @EntityType = 'News'
		begin
			IF NOT EXISTS (SELECT * FROM NewsStore WHERE StoreID = @StoreID AND NewsID = @EntityID)
			begin
				INSERT INTO NewsStore(StoreID, NewsID) VALUES (@StoreID, @EntityID)
			end		
		end			
		else IF @EntityType='OrderOption'
		begin
			IF NOT EXISTS (SELECT * FROM OrderOptionStore WHERE StoreID = @StoreID AND OrderOptionID = @EntityID)
			begin
				INSERT INTO OrderOptionStore(StoreID, OrderOptionID) VALUES (@StoreID, @EntityID)
			end
		end
		else IF @EntityType='GiftCard'
		begin
			IF NOT EXISTS (SELECT * FROM GiftCardStore WHERE StoreID = @StoreID AND GiftCardId = @EntityID)
			begin
				INSERT INTO GiftCardStore(StoreID, GiftCardId) VALUES (@StoreID, @EntityID)
			end
		end
		else IF @EntityType='Affiliate'
		begin
			IF NOT EXISTS (SELECT * FROM AffiliateStore WHERE StoreID = @StoreID AND AffiliateID = @EntityID)
			begin
				INSERT INTO AffiliateStore(StoreID, AffiliateID) VALUES (@StoreID, @EntityID)
			end
		end
		else IF @EntityType='Coupon'
		begin
			IF NOT EXISTS (SELECT * FROM CouponStore WHERE StoreID = @StoreID AND CouponID = @EntityID)
			begin
				INSERT INTO CouponStore(StoreID, CouponID) VALUES (@StoreID, @EntityID)
			end
		end
		else IF @EntityType='Polls'
		begin
			IF NOT EXISTS (SELECT * FROM PollStore WHERE StoreID = @StoreID AND PollID = @EntityID)
			begin
				INSERT INTO PollStore(StoreID, PollID) VALUES (@StoreID, @EntityID)
			end
		end
	end
	-- Remove Mapping Information if any
	else if (@map = 0)
	begin

		IF @EntityType='Product'
		begin
			DELETE FROM ProductStore WHERE ProductID = @EntityID AND StoreID = @StoreID
		end 
		else IF @EntityType in ('Category', 'Manufacturer', 'Section')
		begin
			DELETE FROM EntityStore WHERE EntityId = @EntityID AND StoreID = @StoreID and EntityType = @EntityType
		end 
		else IF @EntityType = 'ShippingMethod'
		begin
			DELETE FROM ShippingMethodStore WHERE ShippingMethodID = @EntityID AND StoreID = @StoreID
		end
		else IF @EntityType = 'Topic'
		begin
			DELETE FROM TopicStore WHERE TopicID = @EntityID AND StoreID = @StoreID
		end
		else IF @EntityType = 'News'
		begin
			DELETE FROM NewsStore WHERE NewsID = @EntityID AND StoreID = @StoreID
		end		
		else IF @EntityType='OrderOption'
		begin
			DELETE FROM OrderOptionStore WHERE OrderOptionID = @EntityID AND StoreID = @StoreID
		end
		else IF @EntityType='GiftCard'
		begin
			DELETE FROM GiftCardStore WHERE GiftCardId = @EntityID AND StoreID = @StoreID
		end
		else IF @EntityType='Affiliate'
		begin
			DELETE FROM AffiliateStore WHERE AffiliateId = @EntityID AND StoreID = @StoreID
		end
		else IF @EntityType='Coupon'
		begin
			DELETE FROM CouponStore WHERE CouponID = @EntityID AND StoreID = @StoreID
		end
			else IF @EntityType='Polls'
		begin
			DELETE FROM PollStore WHERE PollID = @EntityID AND StoreID = @StoreID
		end	
	end

END


GO


CREATE PROC aspdnsf_Map
	@CreateMap BIT,
	@RemoveMap BIT,
	@StoreID INT,
	@EntityID INT,
	@EntityType VARCHAR(100)

AS
IF @EntityType IN ('Topic', 'News', 'Product', 'OrderOption')
BEGIN
		IF @CreateMap = 1
		BEGIN
			IF @EntityType = 'Topic'
			IF NOT EXISTS(SELECT * FROM TopicStore WHERE @StoreID = StoreID AND TopicID = @EntityID)
				INSERT INTO TopicStore (StoreID, TopicID)
				VALUES (@StoreID, @EntityID)
			IF @EntityType = 'News'
			IF NOT EXISTS (SELECT * FROM NewsStore WHERE StoreID = @StoreID AND NewsID = @EntityID)
				INSERT INTO NewsStore(StoreID, NewsID)
				VALUES (@StoreID, @EntityID)
			IF @EntityType='Product'
			IF NOT EXISTS (SELECT * FROM ProductStore WHERE StoreID = @StoreID AND ProductID = @EntityID)
				INSERT INTO ProductStore(StoreID, ProductID)
				VALUES (@StoreID, @EntityID)
			IF @EntityType='OrderOption'
			IF NOT EXISTS (SELECT * FROM OrderOptionStore WHERE StoreID = @StoreID AND OrderOptionID = @EntityID)
				INSERT INTO OrderOptionStore(StoreID, OrderOptionID)
				VALUES (@StoreID, @EntityID)
		END	
		IF @RemoveMap = 1
		BEGIN
			IF @EntityType = 'Topic'
				DELETE FROM TopicStore WHERE TopicID = @EntityID AND StoreID = @StoreID
			IF @EntityType = 'News'
				DELETE FROM NewsStore WHERE NewsID = @EntityID AND StoreID = @StoreID
			IF @EntityType='Product'
				DELETE FROM ProductStore WHERE ProductID = @EntityID AND StoreID = @StoreID
			IF @EntityType='OrderOption'
				DELETE FROM OrderOptionStore WHERE OrderOptionID = @EntityID AND StoreID = @StoreID
		END
END
ELSE
	BEGIN
		IF @CreateMap = 1
		BEGIN
		IF NOT EXISTS (SELECT * FROM EntityStore WHERE StoreID = @StoreID AND EntityID = @EntityID  AND EntityType = @EntityType)
			INSERT INTO EntityStore (StoreID, EntityID, EntityType) 
				VALUES (@StoreID, @EntityID, @EntityType)
				
		END
		IF @RemoveMap = 1
		BEGIN
			DELETE FROM EntityStore
				WHERE StoreID = @StoreID AND EntityID = @EntityID  AND EntityType = @EntityType
	END
END



GO


INSERT dbo.Store(StoreGUID, ProductionURI, StagingURI, DevelopmentURI, [Name], Summary, Description, Published, Deleted, SkinID, IsDefault, CreatedOn) Values(newid(), 'www.mystore.com', 'staging.mystore.com', 'localhost', 'Default Store', '', '', 1, 0, 1, 1, getdate())


GO


/* Base App Configs*/

INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'ActiveQuantityDiscountTable','GENERAL','Enter the NAME of the quantity discount table that you want to be active for ALL products on the site. If you enter a discount table name here, it applies to all products. If a category has a discount table also specified, the category discount table overrides this one. If a product has a discount table specified, the product discount table overrides the category and the site one. Discount table order of precedence: 1. Product Level, 2. Category Level, and 3. Site Level.','');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'Admin_DefaultInventory','ADMIN','This is the inventory level of a new Product by default, unless the user inputs something different when they add a Product.','1000000');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'Admin_DefaultProductTypeID','ADMIN','This is the default Product type id applied to a new Product, unless the user overrides it.','8');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'Admin_DefaultTaxClassID','ADMIN','This is the default tax classification for a product, unless you decide to add additional tax classes and override it','1');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'Admin_DefaultSalesPromptID','ADMIN','This is the default sales prompt applied to a new Product, unless the user overrides it','1');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'Admin_ProductPageSize','ADMIN','# of Products shown on a page in the admin site','50');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'Admin_ShowReportSQL','ADMIN','If true, the SQL used to generate admin reports will be shown.','false');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'Admin_SpecsInlineByDefault','ADMIN','If true, a new Product is set to have inline specs by default, unless the user overrides this when adding a new Product. Probably best to default to false.','false');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'Admin_TextAreaHeight','ADMIN','The height in line of the textarea boxes on the admin site. Making bigger for bigger monitors helps ease of editing Product and category descriptions, etc.','20');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'Admin_TextAreaHeightSmall','ADMIN','The height in line of the (smaller) textarea boxes on the admin site. Making bigger for bigger monitors helps ease of editing Product summaries, misc text, etc.','10');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'Admin_TextAreaWidth','ADMIN','The width in chars of the textarea boxes on the admin site. Making bigger for bigger monitors helps ease of editing Product and category descriptions, etc.','70');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'AdminDir','SETUP','The subdir on which you have the admin site','admin');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'AgeCartDays','GENERAL','Products are removed from customer carts after this many days.','7');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'AgeWishListDays','GENERAL','Products are removed from customer wish lists after this many days.','7');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'AllowEmptySkuAddToCart','GENERAL','If true, Products with no SKU''s whatsoever (for the product or variant) can be added to the cart. It is highly recommended that this value be set to false. The admin personnel must then assign a SKU to every product/variant. This keeps things orderly!','true');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'AllowShipToDifferentThanBillTo','SECURITY','If true, then the customer can specify a shipping address which is different than their billing address. If false, then ONLY the billing address can be entered, and the shipping address will be set to match it.','true');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'AlsoBoughtNumberToDisplay','XMLPACKAGE','Determines the maximum number of AlsoBought products that will be displayed at the bottom of product pages.',4);
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'AlsoBoughtProductsFormat','XMLPACKAGE','Controls how AlsoBought Products are displayed at the bottom of Product pages. Valid values are GRID or TABLE. Grid uses AppConfig:AlsoBoughtProductsGridColWidth as # items per each row.','GRID');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'AlsoBoughtProductsGridColWidth','XMLPACKAGE','If using grid layout for AlsoBought products (see the AlsoBoughtProductsFormat AppConfig), this is the # of cols in the grid.',4);
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'AUTHORIZENET_X_EMAIL','GATEWAY','Required for AIM Wells Fargo SecureSource Merchants. Leave blank for non Wells Fargo SecureSource users','');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'AUTHORIZENET_X_Login','GATEWAY','The login to use if you are using AUTHORIZENET. Provided by Authorizenet.','');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'AUTHORIZENET_X_Tran_Key','GATEWAY','Transaction key provided by AUTHORIZENET','');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'AUTHORIZENET_X_DELIM_DATA','GATEWAY','Do not change this value. This value is required by AspDotNetStorefront','TRUE');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'AUTHORIZENET_X_DELIM_CHAR','GATEWAY','Do not change this value. This value is required by AspDotNetStorefront','|');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'AUTHORIZENET_X_ENCAP_CHAR','GATEWAY','Do not change this value. This value is required by AspDotNetStorefront','');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'AUTHORIZENET_X_RELAY_RESPONSE','GATEWAY','Do not change this value. This value is required by AspDotNetStorefront','FALSE');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'AUTHORIZENET_X_EMAIL_CUSTOMER','GATEWAY','Do not change this value. This value is required by AspDotNetStorefront. We generate our own receipts','FALSE');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'AUTHORIZENET_X_METHOD','GATEWAY','Do not change this value. This value is required by AspDotNetStorefront. ','CC');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'AUTHORIZENET_X_RECURRING_BILLING','GATEWAY','Do not change this value. This value is required by AspDotNetStorefront. ','FALSE');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'AUTHORIZENET_X_VERSION','GATEWAY','Do not change this value. This value is required by AspDotNetStorefront. ','3.1');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'AUTHORIZENET_LIVE_SERVER','GATEWAY','Do not change this value','https://secure.authorize.net/gateway/transact.dll');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'AUTHORIZENET_TEST_SERVER','GATEWAY','Do not change this value','https://test.authorize.net/gateway/transact.dll');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'AUTHORIZENET_Verify_Addresses','GATEWAY','Set to true if you want their gateway to validate the customer billing address against the credit card. Note that this may decrease fraud, but may also cause valid transactions to go failed, if they have different punctuation than on their credit card.','TRUE');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'AutoVariantFillColumnDelimiter','MISC','For Auto Variant population, delimits the Name,sku,price cols from each other','|');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'BestSellersN','BESTSELLERS','The # of Products you want listed on the best sellers page','10');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'BestSellersShowPics','BESTSELLERS','If true pics will be shown on the bestsellers.aspx page','false');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'BoxFrameStyle','SITEDISPLAY','This is the style for the "outline" of the frame around the "box" sections on the pages (e.g. account info, help box, browse by category box, etc).','border-style: solid; border-width: 1px; border-color: #444444;');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'CacheDurationMinutes','SITEDISPLAY','If the CacheMenus AppConfig is set to true, this is the duration (in MINUTES) between cache updates.  This should not be set to a value much lower than 60, or the cache will not have time to build up enough to be of any use.','60');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'CacheMenus','SITEDISPLAY','If true, then site menus and MANY MANY other navigational and dataset elements on the store and admin site are cached for faster performance. If cached, they update every CacheDurationMinutes, so changes made on the admin site may not take effect until the cache expires. To force the store to reload cache, restart the site through IIS or by ''touching'' the web.config. In production, CacheMenus should almost always be set to true for performance reasons.','false');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'CardExtraCodeIsOptional','GATEWAY','If false, the customer MUST enter their 3 or 4 digit card verification code. if true, they can enter it, but it is not required by the javascript form validation routines.  Note that this controls on-site validation only, your payment gateway may require that value regardless of this setting.','false');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'CardinalCommerce.Centinel.Enabled','CARDINAL','if true, then the Cardinal Commerce Centinel EasyConnect pre-payment fraud prevention system will be engaged. Please refer to the cardinalcommerce.com web site for details and to enroll. You must have an account with Cardinal Commerce before enabling this option.','false');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'CardinalCommerce.Centinel.IsLive','CARDINAL','if true, then the live Cardinal servers will be called, otherwise, the test servers are invoked for site testing/development.','false');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'CardinalCommerce.Centinel.MerchantID','CARDINAL','Your Cardinal Centinal Assigned Merchant ID. 100 is a test id','100');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'CardinalCommerce.Centinel.ProcessorID','CARDINAL','Your Cardinal Centinal Assigned Processor ID. 800 is a test id','800');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'CardinalCommerce.Centinel.MsgType.Lookup','CARDINAL','Do not change this value unless you know what you are doing','cmpi_lookup');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'CardinalCommerce.Centinel.Version.Lookup','CARDINAL','','1.4');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'CardinalCommerce.Centinel.MsgType.Authenticate','CARDINAL','Do not change this value unless you know what you are doing','cmpi_authenticate');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'CardinalCommerce.Centinel.Version.Authenticate','CARDINAL','','1.4');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'CardinalCommerce.Centinel.TransactionUrl.Test','CARDINAL','The test/development server to use','https://centineltest.cardinalcommerce.com/maps/txns.asp');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'CardinalCommerce.Centinel.TransactionUrl.Live','CARDINAL','The live/production server to use, assigned to your account by Cardinal','https://centinel800.cardinalcommerce.com/maps/txns.asp');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'CardinalCommerce.Centinel.MapsTimeout','CARDINAL','Millisconds timeout for the cardinal API calls','10000');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'CardinalCommerce.Centinel.TermURL','CARDINAL','Do not modify this value unless you know what you are doing','cardinal_process.aspx');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'CardinalCommerce.Centinel.NumRetries','CARDINAL','The number of times the authentication request will be attempted, if necessary','3');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'ClearCouponAfterOrdering','GENERAL','If true, then the customer''s coupon code will be cleared in their customer record after each order. If false, then the customer''s coupon code will remain active in their customer record.  Generally best left set to true.','true');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'ClearOldCartOnSignin','GENERAL','if true, the customer''s shopping cart is cleared every time they log into the site. This can prevent ''old'' stuff from being left in the cart from prior site visits. We tend to like to preserve the cart...so they can still order what they added even a month ago or more.','false');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'CODHandlingExtraFee','SHIPPING','If non-zero, this extra amount will be added to all order totals using the C.O.D. payment method, for orders where the shipping total is already non zero. This cost is NOT added to orders where the shipping total computes to 0.00!! This value should be a dollar amount, without leading $ character, e.g. 5.00','');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'DefaultShippingCalculationID','SHIPPING','The defaut type of shipping calculation the site uses, if no other value can be found.','2');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'DefaultSkinID','SITEDISPLAY','The default skin applied to a page, if a siteid parameter is not specified on the page invocation.','1');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'DelayedDownloads','SECURITY','If true, then the download e-mail will NOT be sent automatically.  You will have to send the order download to the customer via the Send Download Email button on the View/Manage Orders page. This is to allow for fraud screening before releasing digital products.','false');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'DelayedDropShipNotifications','MISC','If true, then the distributor e-mail will NOT be sent automatically.  You will have to send the order download to the customer via the Send Distributor Email button on the View/Manage Orders page. This is to allow for fraud screening and order verification before shipping products.','false');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'Dispatch_OrderThreshold','DISPATCH','If non-empty, this values specifies the order amount, in dollars and cents that must be exceeded before a dispatch message is sent, e.g. 100.00. If left blank, then each order is dispatched as it is received. You can use this if you only want to be notified on larger orders','');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'Dispatch_ToPhoneNumber','DISPATCH','The cell messaging number of your phone, in the EXACT format required by your carrier to receive a message, e.g. xxxxxxxxx@mmode.com, or whatever. Contact your cell carrier for more instructions on how to send SMS messages to your phone.','');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'Dispatch_SiteName','DISPATCH','The Name of the store you want to appear in your cell message. this MUST be short, e.g. < 5 chars!!!','');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'Dispatch_MAX_SMS_MSG_LENGTH','DISPATCH','Do not change unless you know what you are doing!','160');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'DoNotShowNewsOnHomePage','SITEDISPLAY','if true, the home page will NOT have news items, even if there are any','false');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'DumpDownloadInfo','DEBUG','if true, then orderdownload building will dump locations & directories of files being copied/created','false');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'EFSNET_LIVE_STOREKEY','GATEWAY','The login to use if you are using EFSNET. Provided by EFSNET.','');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'EFSNET_LIVE_STOREID','GATEWAY','The login to use if you are using EFSNET. Provided by EFSNET.','');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'EFSNET_LIVE_SERVER','GATEWAY','Do not change this value','https://efsnet.concordebiz.com/EFSnet.dll');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'EFSNET_TEST_STOREKEY','GATEWAY','The login to use if you are using EFSNET. Provided by EFSNET.','');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'EFSNET_TEST_STOREID','GATEWAY','The login to use if you are using EFSNET. Provided by EFSNET.','');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'EFSNET_TEST_SERVER','GATEWAY','Do not change this value','https://testefsnet.concordebiz.com/EFSnet.dll');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'EFSNET_VERIFY_ADDRESSES','GATEWAY','Set to true if you want their gateway to validate the customer billing address against the credit card. Note that this may decrease fraud, but may also cause valid transactions to go failed, if they have different punctuation than on their credit card.','TRUE');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'EventLoggingEnabled','MISC','If true, every user action is logged in the LOG_CustomerEvent table. WARNING: this table could get very large. This can be helpful to figure out what users are doing on the site, what pages they are visiting, etc. You need to manually update the [dbo].LOG_Event and the page code to track events you want on each page.','false');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'FreeShippingThreshold','SHIPPING','If set to a dollar amount (no $ sign) orders equal to or greater than this amount will have free shipping. A value of 0.00 or blank disables this feature.','');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'GotOrderEMailFrom','EMAIL','Got New Order nofication e-mails are sent FROM this e-mail account, as the sender.','');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'GotOrderEMailFromName','EMAIL','Got New Order nofication e-mails are sent FROM this e-mail account Name as the sender. This is optional. This could also match GotOrderEMailFrom_1 value.','Sales');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'GotOrderEMailTo','EMAIL','Who gets notified of new orders. This is typicall the e-mail address that the store administrator monitors.','');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'GreyCellColor','SITEDISPLAY','Grey table cell color. This should usually match the template style/colors somewhat. Use RRGGBB HEX values, with no leading # character.','DDDDDD');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'HeaderBGColor','SITEDISPLAY','This is generally the ''background'' color of the header, or something that looks good with the header. AspDotNetStorefront pages that have tables may use this value. This should usually match the template style/colors somewhat. Use RRGGBB HEX values, with no leading # character.','444444');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'HideProductNextPrevLinks','SITEDISPLAY','if true, then the Product previous and next navigation links will be turned OFF on the Product page.','false');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'HomeTemplate','SKINS','The Name of the home page template, if different than template.master (e.g. hometemplate.master). Include the .master extension also in what you enter.','');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'HomeTemplateAsIs','SKINS','If true, then the home page template is written out as is, after making some search tag mods, title mods, etc...but the contents section is assumed to be predefined in the template. Use this for completely hand written custom home pages, in conjunction with AppConfig:HomeTemplate','false');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'Inventory.LimitCartToQuantityOnHand','MISC','if true, then if the customer adds a quantity that is greater than inventory, the add to cart button will warn them and change the quantity added to quantity on hand. The cart page also will not allow quantities greater than quantity on hand','false');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'IsFeaturedCategoryID','SITEDISPLAY','The category ID that is considered to be ''Featured Products''. Products mapped to this category get a Featured status. The IsFeatured flag should also be set on the Product. This category ID provides an additional way for consumers to find the ''specials''. The ''is featured'' category Name typically has a Name like ''Specials'', ''On Sale Now'', ''Blowout Specials'', etc...','0');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'ITransact.Test_FirstName','GATEWAY','This is the Name set in the ITransact Applications setting under Test Transaction settings. When in Store Test mode this Name is substituted for the first Name forcing the gateway to treat it as a test transaction','');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'ITransact.Sale_Server','GATEWAY','Live Server URL for Xml sale transactions','https://secure.paymentclearing.com/cgi-bin/rc/xmltrans.cgi');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'ITransact.VoidRefund_Server','GATEWAY','Live Server URL for Xml void/refund transactions','https://secure.paymentclearing.com/cgi-bin/rc/xmltrans2.cgi');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'ITransact.Vendor_ID','GATEWAY','Assigned by ITransact','');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'ITransact.Verify_Addresses','GATEWAY','Should be set to true','TRUE');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'ITransact.Password','GATEWAY','Assigned by ITransact','');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'KitCategoryID','SITEDISPLAY','Leftover from some prior legacy store sits. Probably not used by your AspDotNetStorefront (consult code for this AppConfig value).','0');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'LightCellColor','SITEDISPLAY','Lightest table cell color, but still probably non-white. This should usually match the template style/colors somewhat. Use RRGGBB HEX values, with no leading # character.','DDDDDD');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'LINKPOINT_CONFIGFILE','GATEWAY','Change this to your store number','xxxxxx');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'LINKPOINT_KEYFILE','GATEWAY','Change this to the Name and location of your certificate file. This should usually be in the root of your website.','linkpoint.pem');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'LINKPOINT_LIVE_SERVER','GATEWAY','The live linkpoint host. don''t change unless you know what you are doing','secure.linkpt.net');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'LINKPOINT_PORT','GATEWAY','Don''t change unless you know what you are doing','1129');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'LINKPOINT_TEST_SERVER','GATEWAY','The linkpoint test transaction server. don''t change unless you know what you are doing.','staging.linkpt.net');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'LINKPOINT_Verify_Addresses','GATEWAY','if true, address verification will be used on linkpoint transactions.','true');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'LinkToProductPageInCart','SITEDISPLAY','if true, the Product Name in the shopping cart will link back to the Product page. If false, the shopping cart has no links out','true');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'LiveServer','SETUP','The domain of the live site. This is usually just domain.com for your site (use your own domain name). if you are on a subdomain, it should be subdomain.domain.com.','yourdomain.com');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'MailCheckReminder','GATEWAY','Note added to order record if customer paid by check','Thank you for your order. Please remember to send off your check, as we will not ship your order until we have received your check and it has cleared the bank.');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'MailMe_FromAddress','EMAIL','The e-mail address you want order receipts to be sent from, e.g. sales@yourdomain.com','sales@yourdomain.com');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'MailMe_FromName','EMAIL','The Name you want order receipts to be sent from, e.g. Sales','Sales');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'MailMe_Pwd','EMAIL','mail server login password (optional). Consult your mail server requirements to see if this is required','');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'MailMe_Port','EMAIL','Set this value to the TCP Port that your mail server uses.  The vast majority of all SMTP servers on the internet use standard port 25.  Only change this if you are certain that your mail server uses a different port for SMTP connections.','25');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'MailMe_Server','EMAIL','DNS of your mail server, usually mail.yourdomain.com','');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'MailMe_ToAddress','EMAIL','The e-mail address you want order notifications to be sent to, usually the same as MailMe_FromAddress, e.g. sales@yourdomain.com','');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'MailMe_ToName','EMAIL','The e-mail Name you want order notifications to be sent to, e.g. Sales','Sales');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'MailMe_User','EMAIL','mail server login userName (optional). Consult your mail server requirements to see if this is required','');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'MailMe_UseSSL','EMAIL','Set this to true if your mail server requires an SSL connection.  NOTE:  This is very uncommon and has nothing to do with SSL on your site.  Only change this if you know what you are doing.','false');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'ManufacturersLinkToOurPage','SITEDISPLAY','If true, then a manufacturer listing page will have manufacturer Names/icons link to AspDotNetStorefront pages which show Products by that manufacturer. If false, then the manufacturer links will take the user to the manufacturer site URL directly.','true');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'MaxSlides','SITEDISPLAY','Maximum number of slides in a slide show gallery. This CANNOT be set higher than 99 without modifying the code, so don''t modify this parameter unless you know what you are doing!','99');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'MediumCellColor','SITEDISPLAY','Mid-range table cell color. This should usually match the template style/colors somewhat. Use RRGGBB HEX values, with no leading # character.','CCCCCC');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'MinCartItemsBeforeCheckout','GATEWAY','minimum # of items a user must have in their cart, before they can checkout. Sum of cart quantity > this value. Can be from any item in the store','1');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'MinSearchStringLength','SEARCH','minimum number of characters required in search boxes on site. So users can''t search for ''a'', ''th'', etc... if desired. Min value is 1.','3');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'NetBilling.Test_Server','GATEWAY','Test Server URL','https://secure.netbilling.com:1402/gw/sas/direct3.0');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'NetBilling.Live_Server','GATEWAY','Live Server URL','https://secure.netbilling.com:1402/gw/sas/direct3.0');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'NetBilling.Pay_Type','GATEWAY','Specifies Credit Card, Do not change','C');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'NetBilling.Account_ID','GATEWAY','Enter your NetBIlling assigned Account ID 12 digit number. You  must also have NetBilling add your server IP address to their approved list','');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'NetBilling.Site_Tag','GATEWAY','NetBilling assigned Site Tag (optional)','');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'NetBilling.Verify_Addresses','GATEWAY','Must be set to true','TRUE');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'NumHomePageSpecials','SITEDISPLAY','The number of specials shown on the home page featured box','3');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'OnSaleForTextColor','SITEDISPLAY','Color of on sale for prices.','red');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'PayFuse.UserID','GATEWAY','Assigned by PayFuse','');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'PayFuse.Password','GATEWAY','Assigned by PayFuse','');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'PayFuse.Alias','GATEWAY','Assigned by PayFuse (They may also call this the ClientID)','');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'PayFuse.Test_Server','GATEWAY','Test Server URL','https://test5x.clearcommerce.com:11500');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'PayFuse.Live_Server','GATEWAY','Live Server URL. You must also provide PayFuse with your site IP Address ahead of time, before this call will work','https://Xmlic.payfuse.com');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'OrderShowCCPwd','SECURITY','The ''password'' that the admin site passes to the store site, so the store administrative personnel can view the credit card numbers of customers, in receipts and order summaries. Make this a unique value for your site.','WIZARD');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'PAYMENTECH_BIN','GATEWAY','Merchant BIN number, assigned by Paymentech. Paymentech may have to ADD YOUR SITE IP ADDRESS before any transactions are accepted.','');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'PAYMENTECH_LIVE_SERVER','GATEWAY','Do not change this value','https://orbital1.paymentech.net/authorize');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'PAYMENTECH_MERCHANT_ID','GATEWAY','Your Merchant id, assigned by Paymentech','');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'PAYMENTECH_MERCHANT_TERMINAL_ID','GATEWAY','Your Merchant terminal id, assigned by Paymentech','');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'PAYMENTECH_MERCHANT_TZCODE','GATEWAY','Your Merchant timezone code, obtained from Paymentech documentation, 705=eastern, 706=central, 707=mountain, 708=pacific, 709=alaska, 110=hawaii, 105=indiana, 107=arizona','');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'PAYMENTECH_TEST_SERVER','GATEWAY','Do not change this value','https://orbitalvar1.paymentech.net/authorize');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'PAYMENTECH_Verify_Addresses','GATEWAY','Set to true if you want their gateway to validate the customer billing address against the credit card. Note that this may decrease fraud, but may also cause valid transactions to go failed, if they have different punctuation than on their credit card.','TRUE');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'PaymentExpress.Username','GATEWAY','Username assigned by Payment Express','');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'PaymentExpress.Password','GATEWAY','Password assigned by Payment Express','');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'PaymentGateway','GATEWAY','This value specifies what credit card payment processing gateway you are using. To set your active Payment Gateway, run the Configuration Wizard page in the admin site.','MANUAL');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'PaymentMethods','GATEWAY','Enter the payment methods you want to allow on the store. Valid values are: Credit Card, Purchase Order, eCheck, PayPal, PayPal Express, Request Quote, Check By Mail, and C.O.D. (that is "C.O.D." with the ending period), C.O.D. (Money Order), C.O.D. (Company Check), MICROPAY, C.O.D. (Net 30). You can specify that you want to allow multiple payment methods, just separate them by a comma, e.g. Credit Card, Purchase Order, PayPal','Credit Card');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'PayPal.BusinessID','GATEWAY','Your PayPal Business Identifier, which is usually your account e-mail address with PayPal (When using the PayPal Payment Method)','');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'PayPal.LiveServer','GATEWAY','Do not change this value unless you know what you are doing','https://www.paypal.com/cgi-bin/webscr');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'PayPal.ReturnCancelURL','GATEWAY','If using PayPal, this is the page that is invoked on return of a bad or canceled transaction.','paypalcancel.aspx');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'PayPal.ReturnOKURL','GATEWAY','If using PayPal, this is the page that is invoked on return of a successful transaction.','paypalok.aspx');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'PayPal.ForceCapture','GATEWAY','If true, will force PayPal & PayPal Express Checkout payments to Capture, regardless of TransactionMode. If false, these payments will obey the TransactionMode setting.','false');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'PayPal.API.Username','GATEWAY','PayPal Assigned API Username. Consult PayPal Documentation for more information. You get this from the PayPal site.','');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'PayPal.API.Password','GATEWAY','PayPal Assigned API Password. Consult PayPal Documentation for more information. You get this from the PayPal site.','');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'PayPal.API.MerchantEMailAddress','GATEWAY','PayPal Assigned API merchant e-mail address for your account. Consult PayPal Documentation for more information. This is almost ALWAYS left blank!','');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'PayPal.API.TestURL','GATEWAY','Test sandbox PayPal SOAP API URL. Do not change this value unless you know what you are doing.','https://api.sandbox.paypal.com/2.0/');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'PayPal.API.LiveURL','GATEWAY','Live server PayPal SOAP API URL. Do not change this value unless you know what you are doing.','https://api-3t.paypal.com/2.0/');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'PayPal.API.TestAAURL','GATEWAY','Test sandbox SOAP API URL for PayPal Payments Pro API. Consult PayPal Pro Documentation for more information.','https://api-aa.sandbox.paypal.com/2.0/');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'PayPal.API.LiveAAURL','GATEWAY','Live server SOAP API URL for PayPal Payments Pro API. Consult PayPal Pro Documentation for more information.','https://api-aa-3t.paypal.com/2.0/');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'PayPal.API.Version','GATEWAY','PayPal Payments Pro API Version. Consult PayPal Pro Documentation for more information.','2.0');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'PayPal.API.RefundVersion','GATEWAY','PayPal Payments Pro Obj Refund API Version. Consult PayPal Pro Documentation for more information.','1.0');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'PayPal.RequireConfirmedAddress','GATEWAY','To require the customer to check out only with a Confirmed PayPal Shipping Address set to true, to allow any address, set to false. It is recommended that this be set to true for Seller Protection.','false');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'PayPal.DefaultLocaleCode','GATEWAY','Two character Locale Code for pages displayed by PayPal. Supported values: AU, DE, FR, IT, GB, ES, US','US');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'PayPal.Express.AllowAnonCheckout','GATEWAY','This enables customers to checkout using PayPal Express without being a register customer (i.e. anonymous customer). When you set this to true you also need to set the AllowCustomerDuplicateEMailAddresses AppConfig parameter to true.','true');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'PayPal.TestServer','GATEWAY','PayPal Sandbox Site URL. Do not change unless you know what you are doing.','https://www.sandbox.paypal.com/cgi-bin/webscr');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'PayPal.PaymentIcon','GATEWAY','Image URL for Paypal payment method icon.','https://www.paypal.com/en_US/i/logo/PayPal_mark_50x34.gif');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'PayPal.UseInstantNotification','GATEWAY','set to true to use PayPal Instant Notification to capture payments','false');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'PayPal.NotificationURL','GATEWAY','URL to the page that will handle PayPal Instant Notification messages.','paypalnotification.aspx');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'PayPal.Express.CancelURL','GATEWAY','PayPal Express Cancel Return URL. Do not change unless you know what you are doing.','shoppingcart.aspx?resetlinkback=1');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'PayPal.Express.LiveURL','GATEWAY','PayPal Express Live Site URL. Do not change unless you know what you are doing.','https://www.paypal.com/cgi-bin/webscr');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'PayPal.Express.ReturnURL','GATEWAY','PayPal Express OK Return URL. Do not change unless you know what you are doing.','PayPalExpressOK.aspx');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'PayPal.Express.SandboxURL','GATEWAY','PayPal Express Sandbox Site URL. Do not change unless you know what you are doing.','https://www.sandbox.paypal.com/cgi-bin/webscr');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'PayPal.Express.PageStyle','GATEWAY','Sets the Custom Payment Page Style for payment pages associated with this button/link. PageStyle corresponds to the HTML variable page_style for customizing payment pages. The value is the same as the Page Style Name you chose when adding or editing the page style from the Profile subtab of the My Account tab of your PayPal account.','');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'PayPal.Express.HeaderImage','GATEWAY','A URL for the image you want to appear at the top left of the payment page. The image has a maximum size of 750 pixels wide by 90 pixels high. PayPal recommends that you provide an image that is stored on a secure (https) server.','');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'PayPal.Express.HeaderBackColor','GATEWAY','Sets the background color for the header of the payment page. Character length and limitation: Six character HTML hexadecimal color code in ASCII','');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'PayPal.Express.HeaderBorderColor','GATEWAY','Sets the border color around the header of the payment page. The border is a 2-pixel perimeter around the header space, which is 750 pixels wide by 90 pixels high. Character length and limitations: Six character HTML hexadecimal color code in ASCII','');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'PayPal.Express.PayFlowColor','GATEWAY','Sets the background color for the payment page. Character length and limitation: Six character HTML hexadecimal color code in ASCII','');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'PayPal.API.Signature','GATEWAY','PayPal Assigned API Signature. Consult PayPal Documentation for more information. You get this from the PayPal site.','');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'PayPal.Express.ShowOnCartPage','GATEWAY','If you don''t want the PayPal Express Checkout button on your cart page, set this to false. In order to fully enable this payment method you need to select PayPalPro as your payment gateway and of course have a PayPal account with the PayPalPro service enabled. By default, this is set to true and, so they can select the checkout method on our payments page like all other payment methods. The icon will not be shown if the cart is empty also.','true');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'PayPal.Promo.Enabled','GATEWAY','Master control of Promotion. Set to TRUE to enable. You must have approval from PayPal prior to enabling this feature.','False');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'PayPal.Promo.CartMinimum','GATEWAY','The minimum order amount that can be purchased. If an order is less than this amount, customers will not be able to proceed past the shopping cart page. Leave blank for no minimum. Enter ##.## values (no $).','50');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'PayPal.Promo.CartMaximum','GATEWAY','Customer cart must have total less than or equal to this value to enable promotion','1500');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'PayPal.Promo.BannerURL','GATEWAY','URL or path to Banner Image for Promotion','App_Themes/skin_1/images/paypal_promo.gif');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'PayPal.Promo.LearnMoreURL','GATEWAY','URL for informational page to display when customer clicks on the Banner.','https://www.paypal.com/cgibin/webscr?cmd=xpt/cps/popup/BCLearnMoreNoPayments-outside');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'PayPal.Promo.ButtonImageURL','GATEWAY','URL for Checkout Button Image when cart meets Promotion requirements','https://www.paypal.com/en_US/i/btn/btn_xpressCheckout.gif');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'PayPal.Promo.Codes','GATEWAY','Promo codes to include for qualifying Express Checkout purchases. Comma Delimited list.','');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'PayPal.Express.ButtonImageURL','GATEWAY','URL for Express Checkout Button Image','https://www.paypal.com/en_US/i/btn/btn_xpressCheckout.gif');

INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'PayflowPro.Reporting.LiveURL','GATEWAY','Payflow URL for reporting API interface for Live transactions.','https://payments-reports.paypal.com/reportingengine');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'PayflowPro.RecurringMaxFailPayments','GATEWAY','Payflow recurring billing API maxfailpayments value to use for setting up new subscriptions.','1');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'PayflowPro.Reporting.ReportName','GATEWAY','Payflow report name to use for recurring subscription status.','RecurringBillingReport');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'PayflowPro.Reporting.TestURL','GATEWAY','Payflow URL for reporting API interface for Test transactions.','https://payments-reports.paypal.com/test-reportingengine');

INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'RecentAdditionsShowPics','MISC','If true pics will be shown on the recentadditions.aspx page','false');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'PersistFilters','SITEDISPLAY','If true, then a user''s section, category, manufacturer, and Product type id active selections are stored in cookies, so as they continue to browse the site, those filters are continally applied (useful to let a site visitor browse all Products of one manufacturer, for instance). Some users may find this annyoying, so setting false turns this off. Some users may find it annoying that the site forgets their values, so leaving true appeases them. Good luck...some customers will complain regardless...','true');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'PreserveActiveCartOnSignin','SETUP','This setting controls what happens when an ''anon'' customer (someone who is NOT logged in, but has a customer record, because with AspDotNetStorefront, EVERY visitor is assigned a customer record in the session start) then logs in. If true, their cart is cleared on signin. If false, their ''anon'' cart is preserved and migrated to their ''logged in'' cart... Best setting is usually TRUE, so if they are using the site not logged in, add items to their cart, and then log-in, those items are still in their cart.','true');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'ProductBrowserHeight','SITEDISPLAY','The height of the Product browser iframe, in pixels, used for packs','500');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'ProductBrowserHoverColor','SITEDISPLAY','mouseover color for Product browser (packs)','DDDDDD');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'RatingsCommentFrameVisibility','RATINGS','if visible, ratings voting worker window will be show, for debug only','hidden');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'RatingsCanBeDoneByAnons','RATINGS','if true, anon users can rate Products, otherwise, only registered customers can rate Products','false');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'RatingsEnabled','RATINGS','if true, Product ratings will be enabled, and shown on the Product pages, at the bottom','false');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'RatingsPageSize','RATINGS','# of rating comments show on a page','10');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'ReceiptEMailFrom','EMAIL','When customers are sent their order recipt, it comes from this e-mail account.','');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'ReceiptEMailFromName','EMAIL','When customers are sent their order recipt, it comes from this e-mail account.','Sales');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'RedirectLiveToWWW','SECURITY','If True, and on LiveServer, and user types in http://yourdomain.com or yourdomain.com, the default page will redirect to http://www.yourdomain.com. This can help prevent users from bookmarking the site without www if you choose. Probably not necessary in most cases.','FALSE');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'RelatedProductsFormat','SITEDISPLAY','Controls how related Products are displayed at the bottom of Product pages. Valid values are GRID or TABLE. Grid uses AppConfig:RelatedProductsGridColWidth as # items per each row.','GRID');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'RequireTermsAndConditionsAtCheckout','SETUP','If true, the CheckoutTermsAndConditions topic is displayed on the check out page, and the user must check a box indicating that they accept the specified terms and conditions, or they cannot finalize their order. This is only necessary in rare circumstances (selling dangerous goods, etc).','false');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'ResizeSlideWindow','SITEDISPLAY','If using gallery slide shows (if supplied), then this controls whether the gallery window resizes to ''fit'' each slide.','false');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'RTShipping.ActiveCarrier','RTSHIPPING','The shipping carrier you will be using, can be a comma separated list of: UPS, USPS, FEDEX, DHL','UPS');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'RTShipping.DomesticCarriers','RTSHIPPING','The shipping carrier you will be using for domestic shipments, can be a comma separated list of: UPS, USPS, FEDEX, DHL','');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'RTShipping.InternationalCarriers','RTSHIPPING','The shipping carrier you will be using for international shipments, can be a comma separated list of: UPS, USPS, FEDEX, DHL','');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'RTShipping.Insured','RTSHIPPING','True if you want shipment insured, false if not','false');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'RTShipping.DefaultItemWeight','RTSHIPPING','If any Product variant does not have any weight specified in the Product variant, this default weight will be used (float number)','0.5');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'RTShipping.OriginAddress','RTSHIPPING','The address of where you are shipping from','');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'RTShipping.OriginAddress2','RTSHIPPING','The address of where you are shipping from','');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'RTShipping.OriginCity','RTSHIPPING','The city of where you are shipping from','');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'RTShipping.OriginState','RTSHIPPING','The state/province abbreviation of where you are shipping from','');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'RTShipping.OriginZip','RTSHIPPING','The zip code of where you are shipping from','');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'RTShipping.OriginCountry','RTSHIPPING','The 2-character country abbreviation of where you are shipping from.','US');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'RTShipping.UPS.UserName','RTSHIPPING','Your UPS Account UserName, assigned by UPS.','');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'RTShipping.UPS.Password','RTSHIPPING','Your UPS Account Password, assigned by UPS.','');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'RTShipping.UPS.License','RTSHIPPING','Your UPS Account License, or XML Access Key they may call this. ','');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'RTShipping.UPS.Server','RTSHIPPING','The UPS live shipping rates server','https://onlinetools.ups.com/ups.app/xml/Rate');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'RTShipping.UPS.TestServer','RTSHIPPING','The UPS test shipping rates server','https://wwwcie.ups.com/ups.app/xml/Rate');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'RTShipping.UPS.UPSPickupType','RTSHIPPING','The type of UPS pickup being used. Allowed values are: UPSDailyPickup, UPSCustomerCounter, UPSOneTimePickup, UPSOnCallAir, UPSSuggestedRetailRates, UPSLetterCenter, UPSAirServiceCenter','UPSDailyPickup');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'RTShipping.UPS.AccountNumber','RTSHIPPING','UPS2 Carrier Only. For accounts with negotiated rates, specify the 6-character UPS account.','');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'RTShipping.UPS.AddressTypeBehavior','RTSHIPPING','UPS2 Carrier Only. Controls behavior of AddressType indicator in ShipTo addresses. Default is blank, which treats Unknown types as Residential. Legal values are ForceAllResidential, UnknownsAreCommercial, or ForceAllCommercial.','');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'RTShipping.UPS.DeliveryConfirmation','RTSHIPPING','UPS2 Carrier Only. Legal values are DeliveryConfirmation, SignatureRequired, or AdultSignatureRequired','');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'RTShipping.UPS.GetNegotiatedRates','RTSHIPPING','UPS2 Carrier Only. When true, retrieves negotiated rates for the account specified in RTShipping.UPS.AccountNumber.','false');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'RTShipping.UPS.Services','RTSHIPPING','UPS2 Carrier Only. A comma-separated list of UPS services, in the format CODE;DisplayName.','03;UPS Ground,12;UPS Three-Day Select,02;UPS Second Day Air,13;UPS Next Day Air Saver,01;UPS Next Day Air,14;UPS Next Day Air Early AM,07;UPS Worldwide Express,08;UPS Worldwide Expedited,11;UPS Standard,54;UPS Worldwide Express Plus,59;UPS Second Day Air AM,65;UPS Saver');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'RTShipping.UPS.MaxWeight','RTSHIPPING','The maximum allowed weight for a UPS shipment, in AppConfig:RTSHipping.WeightUnits. If an order weight exceeds this, then the AppConfig:CallForShippingPrompt will be displayed as the shipping method, with a $0 cost','150');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'RTShipping.USPS.UserName','RTSHIPPING','Your USPS Account userName','');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'RTShipping.USPS.Server','RTSHIPPING','The USPS live shipping rates server','http://Production.ShippingAPIs.com/ShippingAPI.dll');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'RTShipping.USPS.TestServer','RTSHIPPING','The USPS test shipping rates server','http://testing.shippingapis.com/ShippingapiTest.dll');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'RTShipping.USPS.MaxWeight','RTSHIPPING','The maximum allowed weight for a USPS shipment, in AppConfig:RTSHipping.WeightUnits. If an order weight exceeds this, then the AppConfig:CallForShippingPrompt will be displayed as the shipping method, with a $0 cost','150');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'RTShipping.USPS.Services','RTSHIPPING','Contains a list of available USPS Services. Valid services are: Express,Priority,Parcel,Library,Media','Express,Priority,Parcel,Library,Media');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'RTShipping.FedEx.AccountNumber','RTSHIPPING','Your FedEx Account #','');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'RTShipping.FedEx.Server','RTSHIPPING','Your FedEx Server Assigned by FedEX. The Server URl is CaSE SeNSitIVe!!! Your URL may DIfFeR frOm THis One!','https://gateway.fedex.com:443/GatewayDC');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'RTShipping.FedEx.Meter','RTSHIPPING','Your FedEx Meter, provided to you after registration','');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'RTShipping.WeightUnits','RTSHIPPING','Enter the value for RTShipping calls. See UPS/USPS/FEDEX/DHL requirements. See also AppConfig:Localization.WeightUnits','LBS');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'RTShipping.MarkupPercent','RTSHIPPING','If you want to markup the rates returned by the carrier, enter the markup percentage here, e.g. 5.0 would add 5% to each returned rate','');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'RTShipping.Fedex.ShipDate','RTSHIPPING','Specifies date used in Xml call to FedEx Rate Call, Allowed values are: NONE, TODAY, TOMORROW','TODAY');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'RTShipping.Fedex.CarrierCodes','RTSHIPPING','Specifies the carrier codes to use, or leave blank to return all rates (e.g. FDXE,FDXG). Use comma separated list if required','');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'RTShipping.DumpXmlOnCartPage','RTSHIPPING','if true, then RTShippingRequest and RTShippingResponse Xml will be shown on bottom of cart page, because it is turning into a NIGHTMARE to figure out why this shipper or that shipper is not returning this, or that, for whatever, etc...','true');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'RTShipping.CallForShippingPrompt','RTSHIPPING','if the order exceeds maximum shipping rate, this prompt will be shown as the shippingmethod with $0 cost','Call For Shipping Rates');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'RTShipping.FedEx.MaxWeight','RTSHIPPING','The maximum allowed weight for a FedEx shipment, in AppConfig:RTSHipping.WeightUnits. If an order weight exceeds this, then the AppConfig:CallForShippingPrompt will be displayed as the shipping method, with a $0 cost','150');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'RTShipping.ShowErrors','RTSHIPPING','if true, any errors returned from the real time rate call will be displayed on the cart page. Very helpful for debugging real time rate issues. See also RTShipping.DumpXmlOnCartPage for more debug info','true');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'RTShipping.DHL.AccountNumber','RTSHIPPING','Your DHL Account Number','');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'RTShipping.DHL.APISystemID','RTSHIPPING','Your DHL Account API ID','');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'RTShipping.DHL.APISystemPassword','RTSHIPPING','Your DHL API Account Password','');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'RTShipping.DHL.Server','RTSHIPPING','The DHL live shipping rates server','HTTPS://eCommerce.airborne.com/ApiLanding.asp');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'RTShipping.DHL.TestServer','RTSHIPPING','The DHL test shipping rates server','HTTPS://eCommerce.airborne.com/ApiLandingTest.asp');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'RTShipping.ShippingMethodsToPrevent','RTSHIPPING','if you want to filter the Real Time shipping methods that can be selected by users, enter a comma separated list of the EXACT text description of the shipping methods that you do NOT want to allow. e.g. U. S. FedEx Same Day, FedEx Overnight, U.S. Postal Priority, ...','');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'RTShipping.PackageExtraWeight','RTSHIPPING','extra weight, in lbs, that will be added to each package. You can use this to account for the weight of packing materials if you need to','0.0');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'RTShipping.UseTestRates','RTSHIPPING','Used to determine if the realtime rates service contacts live or test servers','false');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'RTShipping.MultiDistributorCalculation','RTSHIPPING','*BETA* - If you have multiple distributors, set this true to allow real time shipping rates to be calculated for the products based on the address of the distributor that its assigned to.  Currently only available for UPS.  Do not set this to true if using GoogleCheckout - GoogleCheckout is not supported with this set to true.','false')
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'RTShipping.CanadaPost.DefaultPackageSize','RTSHIPPING','For items combined into one box, this is the default size of that box in cm.','25x20x15');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'RTShipping.CanadaPost.Language','RTSHIPPING','Valid values are en (English), fr (French), auto (default; selected based on customer locale).','auto');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'RTShipping.CanadaPost.MaxWeight','RTSHIPPING','Canada Post maximum package weight in kg.','30');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'RTShipping.CanadaPost.MerchantID','RTSHIPPING','Sell Online Merchant ID.','');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'RTShipping.CanadaPost.Server','RTSHIPPING','DNS of Sell Online ratings server. Default is sellonline.canadapost.ca.','sellonline.canadapost.ca');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'RTShipping.CanadaPost.ServerPort','RTSHIPPING','TCP port of Sell Online ratings server. Default is 30000.','30000');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'RTShipping.DHL.ShipInDays','RTSHIPPING','The number of days from today to calculate the Ship-On date.','2');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'RTShipping.DHLIntl.BillingAccountNbr','RTSHIPPING','If the IntlBillingParty is someone other than S (Sender), enter the DHL account number to be billed.','');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'RTShipping.DHLIntl.BillingParty','RTSHIPPING','Valid codes are S (Sender, default), R (Receiver), and 3 (Third Party).','S');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'RTShipping.DHLIntl.Dutiable','RTSHIPPING','Indicates if the shipment is dutiable or non-dutiable. Valid codes are Y (dutiable, default) or N (non-dutiable).','Y');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'RTShipping.DHLIntl.DutyPayment','RTSHIPPING','Duty and tax charge payment type. Valid codes are S (Shipper, default), R (Receiver), or 3 (Third Party).','S');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'RTShipping.DHLIntl.DutyPaymentAccountNbr','RTSHIPPING','If Duty payment type is someone other than Sender or Receiver, enter the DHL account number to be billed.','');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'RTShipping.DHLIntl.MaxWeight','RTSHIPPING','DHL International maximum package weight.','550');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'RTShipping.DHLIntl.Overrides','RTSHIPPING','Valid codes include Z1 (override Postal Code not in State/Province error), Z2 (override PostalCode not in DHL database error), ES (generate Saturday quote on day other than Friday)','');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'RTShipping.DHLIntl.Packaging','RTSHIPPING','Valid codes are P (package, box or tube), or L (Letter, cannot exceed 0.5 lb)','P');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'RTShipping.DHLIntl.Services','RTSHIPPING','Service Level Code for the requested service levels. Valid codes are IE;DHL Worldwide Priority Express','IE;DHL Worldwide Priority Express');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'RTShipping.DHLIntl.ShippingKey','RTSHIPPING','Your DHL Shipping Key for International Shipments','');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'RTShipping.AusPost.DefaultPackageSize','RTSHIPPING','For non-ShipSeparately items, the package dimensions to use, specified in cm. ','15x15x15');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'RTShipping.AusPost.DomesticServices','RTSHIPPING','List of domestic shipping classes, separated by commas. Each entry consists of a CODE;Description pair, separated by a semi-colon.','STANDARD;Regular Parcel, EXPRESS;Express Post Parcel');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'RTShipping.AusPost.IntlServices','RTSHIPPING','List of international shipping classes, separated by commas. Each entry consists of a CODE;Description pair, separated by a semi-colon.','SEA;Sea Mail, AIR;Air Mail, ECI_M;Express Courier International, EPI;Express Post International');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'RTShipping.AusPost.MaxWeight','RTSHIPPING','The maximum allowed weight for an Australia Post shipment, in kg. If an order weight exceeds this, then the AppConfig:CallForShippingPrompt will be displayed as the shipping method, with a $0 cost.','20');

INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'RTShipping.SortByRate','RTSHIPPING','To sort the list of rates by increasing rate, set to true.','false');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'UPS.MinimumPackageWeight','RTSHIPPING','This is the minimum package weight in pounds that can be reported to UPS for a shipping quote.  Note: Setting this to a value less than 0.1 could cause UPS to return an error in their response.','0.1');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'SE_MetaTitle','SKINS','Default page titles, if nothing else is found','Enter your site title here');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'SE_MetaDescription','SKINS','If a page doesn''t get a meta description from somewhere (like a Product page), this is used by default','enter your site description here');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'SE_MetaKeywords','SKINS','If a page doesn''t get a meta keyword list from somewhere (like a Product page), this is used by default','enter your site keywords here');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'SE_MetaNoScript','SKINS','No Script Block, if any','');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'Search_ShowDistributorsInResults','SEARCH','if true, then a distributor matches will be shown in the advanced search results','false');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'Search_ShowManufacturersInResults','SEARCH','if true, then a manufacturer matches will be shown in the advanced search results','false');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'Search_ShowCategoriesInResults','SEARCH','if true, then a category matches will be shown in the advanced search results','true');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'Search_ShowSectionsInResults','SEARCH','if true, then a section matches will be shown in the advanced search results','true');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'Search_ShowProductsInResults','SEARCH','if true, then a category matches will be shown in the advanced search results','true');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'SearchAdv_ShowProductType','SEARCH','if true, then a Product type filter will be shown in the advanced search page','true');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'SearchAdv_ShowCategory','SEARCH','if true, then a category filter will be shown in the advanced search page','true');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'SearchAdv_ShowSection','SEARCH','if true, then a section filter will be shown in the advanced search page','true');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'SearchAdv_ShowManufacturer','SEARCH','if true, then a manufacturer filter will be shown in the advanced search page','true');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'SearchAdv_ShowDistributor','SEARCH','if true, then a distributor filter will be shown in the advanced search page','true');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'SearchAdv_ShowSKU','SEARCH','if true, then a SKU filter will be shown in the advanced search page','true');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'SearchAdv_ShowPriceRange','SEARCH','if true, then a price range filter will be shown in the advanced search page','true');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'SessionTimeoutInMinutes','SECURITY','Customer session data timeout value. Default is 15 minutes','15');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'ShippingHandlingExtraFee','SHIPPING','If you want, this extra amount will be added to all shipping totals, for orders where the shipping total is already non zero. This cost is NOT added to orders where the shipping total computes to 0.00. This value should be a dollar amount, without leading $ character, e.g. 5.00','');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'ShippingMethodIDIfFreeShippingIsOn','SHIPPING','The shipping method(s) that you want to mark as having free shipping. This value can be a comma separated list of integer shipping method IDs. You can see the shipping method id''s for your site in the Admin -> Shipping -> Shipping Methods Page. If you are using Real Time Shipping from UPS, FEDEX, DHL, or USPS, you have to enter the shipping method id''s from the bottom of that page that correspond to the real time shipping method id that you are wanting to mark as free.','');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'ShipRush.Enabled','SHIPPING','If you are using ShipRush, set this to true','false');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'ShipRush.TrackRef','SHIPPING','If you are using ShipRush, you should set this to your shipping carrier, e.g. UPS, FEDEX, etc...','');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'ShipRush.DefaultTemplate','SHIPPING','If you are using ShipRush, you should set this to the default template you want to use. See ShipRush documentation for details. This template is only used if the site cannot find the ShipRushTemplate for the shippingmethodid specified in the order record.','');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'ShipRush.LoginID','SHIPPING','If you are using ShipRush, and want activity tied to a specific admin user id you already have defined in ShipRush, enter that ID here. If this is blank, we will create a default user that matches the store administrator customer id.','');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'ShipRush.ProvideExtraTemplateInfo','SHIPPING','If true, we provide the order weight, total, and order # in the template reference invocation','true');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'ShowBuyButtons','SITEDISPLAY','If false, the add to cart buttons will not appear on the Product pages, so no one can order anything (useful if you just have a catalog, informational, or gallery item site).','true');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'ShowDescriptionInTableCondensed','SITEDISPLAY','If using condensed table format for Product page, this flag controls whether the Product variant description field is displayed or not. Many sites don''t care about this, and in some cases, the descriptions are lengthy, and don''t fit well into the condensed table format.','true');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'ShowDimensionsInTableCondensed','SITEDISPLAY','If using condensed table format for Product page, this flag controls whether the Product variant dimensions field is displayed or not. Many sites don''t care about dimensions (e.g. sofware sites, jewelry sites, etc...)','false');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'ShowQuantityOnProductPage','SITEDISPLAY','If True, then a quantity box will be shown on the Product pages, allowing store users to specify a quantity of the Product to add to the cart.','true');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'ShowWishButtons','SITEDISPLAY','If false, the add to wish list buttons will not appear on the Product pages','true');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'ShowCartDeleteItemButton','SITEDISPLAY','if true, then a little delete icon will be shown next to each item in the shopping cart, so the user can click on this icon to remove it from their cart. If false, then no button is show, and they must enter 0 as the quantity, and update [dbo].cart to delete the item.','true');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'ShowCustomerServiceNotesInReceipts','SETUP','if true, customerservice notes will be shown to customers in their receipt and order history pages','true');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'ShowEMailProductToFriend','SITEDISPLAY','If true, on Product pages, the mail this Product to a friend option appears','true');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'ShowFullNameInRightBar','SITEDISPLAY','If true, then a Product''s full Name (Product Name + variant Name) is always displayed in an right bar format. If false (recommended) the AspDotNetStorefront code makes some decisions on what is most appropriate to display.','false');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'ShowFullNameInTableCondensed','SITEDISPLAY','If true, then a Product''s full Name (Product Name + variant Name) is always displayed in a condensed table. If false (recommended) the AspDotNetStorefront code makes some decisions on what is most appropriate to display.','false');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'ShowFullNameInTableExpanded','SITEDISPLAY','If true, then a Product''s full Name (Product Name + variant Name) is always displayed in an expanded table. If false (recommended) the AspDotNetStorefront code makes some decisions on what is most appropriate to display.','false');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'ShowInventoryTable','SITEDISPLAY','If true, then inventory in stock table will be shown for the Product. This only works for Products using advanced inventory management, and only shows the first variant inventory table, if the Product has multiple variants','false');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'ShowKitPics','SITEDISPLAY','if true, then Product icons are shown in small kit boxes (consult code for more info). may not apply to your site.','false');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'ShowPriceRegularPrompt','SITEDISPLAY','Prefix given to regular prices on section/category grid pages','Our Price');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'ShowSpecialsPics','SITEDISPLAY','if true, then specials ''small'' box will have Product icons displayed.','true');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'ShowSubcatsInGrid','SITEDISPLAY','If a category has subcategories, they are displayed in either list or grid format based on this flag, at the top of category pages.','false');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'ShowWeightInTableCondensed','SITEDISPLAY','If using condensed table format for Product page, this flag controls whether the Product variant weight field is displayed or not. Many sites don''t care about weight(e.g. sofware sites, jewelry sites, etc...)','false');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'SlideShowInterval','SITEDISPLAY','Seconds between images in a slide show (gallery), if this feature is used/available.','3');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'StoreCCInDB','SECURITY','if true, then customers credit card info will be stored in the db in an encrypted string. if false, then no credit card numbers will be stored anywhere. We highly recommend not storing any credit card numbers unless you have a specific reason to (e.g. recurring orders, etc). If you don''t store them, the customer will just have to re-enter them on every order, which is easy for them to do during checkout. Note that CCV codes are NOT stored ANYWHERE in the db, as it is not allowed to store them.','false');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'StoreName','SKINS','The Name of your store','AspDotNetStorefront');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'StoreVersion','SETUP','This is only used for documentation purposes, and all order records are tagged with the AspDotNetStorefront version they were created with.','9.0.1.2');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'TRANSACTIONCENTRAL_MerchantID','GATEWAY','Your Merchant ID. Provided by Transaction Central (primerchants.com).','');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'TRANSACTIONCENTRAL_RegKey','GATEWAY','Your RegKey. Provided by Transaction Central (primerchants.com).','');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'TRANSACTIONCENTRAL_LIVE_SERVER','GATEWAY','Do not change this value','https://webservices.primerchants.com/billing/TransactionCentral/processCC.asp');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'TRANSACTIONCENTRAL_TEST_SERVER','GATEWAY','Do not change this value','https://webservices.primerchants.com/billing/TransactionCentral/processCC.asp');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'TRANSACTIONCENTRAL_VOID_SERVER','GATEWAY','Do not change this value','https://webservices.primerchants.com/billing/TransactionCentral/voidcreditcconline.asp');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'TransactionMode','SETUP','Specifies how credit cards are handled in real-time by the site, when an order is entered. AUTH means that the card is ONLY authorized. You will have to use the admin site to later capture the amount, or process the card manually offline. AUTH CAPTURE means that the card is authorized AND captured in real-time by the site, Note that ECHECKS ARE ONLY AUTH CAPTURE','AUTH CAPTURE');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'UseLiveTransactions','GATEWAY','If true, the merchant gateway IS called when processing an order. If false, then the merchant gateway code is bypassed, and an OK status is returned. A false value is good for development/testing. Almost always must be true for a ''live'' store site.','false');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'UseSKUForProductImageName','SITEDISPLAY','if true, then the Product image fileName will be taken from the Product SKU.jpg, SKU.gif, or SKU.png. If false (the default), the Product image fileNames will be ProductID.JPG, ProductID.GIF or ProductID.PNG','false');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'UseSSL','SECURITY','If true, https links will be used for shoppingcart pages, account pages, receipt pages, etc. Only set this value true AFTER you have your Secure Certificate (SSL cert) installed on your live server. SSL also is ONLY invoked on the live server, not the dev server, so make sure your AppConfig:LiveServer is set to be yourdomain.com also','false');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'VIAKLIX_LIVE_SERVER','GATEWAY','Do not change unless instructed to by viaKLIX','https://www.viaKLIX.com/process.asp');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'VIAKLIX_SSL_MERCHANT_ID','GATEWAY','Your viaKLIX assigned Merchant ID','');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'VIAKLIX_SSL_PIN','GATEWAY','The PIN that corresponds with the specified User ID','');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'VIAKLIX_SSL_USER_ID','GATEWAY','Your viaKLIX User ID for processing Internet transactions','');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'VIAKLIX_TEST_SERVER','GATEWAY','Do not change unless instructed to by viaKLIX','https://demo.viaklix.com/process.asp');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'IDEPOSIT_TEST_URL','GATEWAY','Do not change unless instructed to by iDeposit','https://ideposit.vbprograms.net/servlet/pg');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'IDEPOSIT_TEST_USERNAME','GATEWAY','Your test iDeposit Username','');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'IDEPOSIT_TEST_PASSWORD','GATEWAY','Your test iDeposit Password','');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'IDEPOSIT_TEST_CLERKID','GATEWAY','Your test iDeposit Clerk ID to be associated with transactions (optional)','Internet');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'IDEPOSIT_LIVE_URL','GATEWAY','Do not change unless instructed to by iDeposit','https://ideposit.vbprograms.net/servlet/pg');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'IDEPOSIT_LIVE_USERNAME','GATEWAY','Your iDeposit Username','');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'IDEPOSIT_LIVE_PASSWORD','GATEWAY','Your iDeposit Password','');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'IDEPOSIT_LIVE_CLERKID','GATEWAY','Your iDeposit Clerk ID to be associated with transactions (optional)','Internet');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'3DSecure.CreditCardTypeIDs','GATEWAY','Comma separated list of CreditCardTypeIDs that 3-D Secure transactions can be processed for with the currently active gateway. You need to get the desired card type ids from the Configuration -> Payment -> Credit Card Types page.','');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'WorldPay_InstallationID','GATEWAY','Your WorldPay Identifier (If Using WorldPay Gateway). This is assigned to you by WorldPay','');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'WorldPay_Live_Server','GATEWAY','Do not change this value unless you know what you are doing','https://select.worldpay.com/wcc/purchase');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'WorldPay_ReturnURL','GATEWAY','If using WorldPay, this is the page that is invoked on return of a successful transaction.','worldpayreturn.aspx');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'WorldPay_TestMode','GATEWAY','Your WorldPay mode. Use true to apply test transactions during development. Use false for Production','false');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'WorldPay_TestModeCode','GATEWAY','Your WorldPay test mode code, consult WorldPay docs','100');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'WorldPay_FixContact','GATEWAY','Prevents user from changing contact info while on WorldPay servers, recommended true. Consult WorldPay docs','true');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'WorldPay_HideContact','GATEWAY','Prevents user from changing contact info while on WorldPay servers, recommended true. Cnsult WorldPay docs','true');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'WorldPay_LanguageLocale','GATEWAY','Should be set to match your language setting','en-US');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'WorldPay_RequireAVSMatch','GATEWAY','Set to true if you want AVS matches to be required to accept a transaction','true');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'WorldPay_OnCancelAutoRedirectToCart','GATEWAY','Set to true if you want to send the customer back to the shoppingcart page automatically if they cancel their WorldPay checkout','true');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'ZoneIdForNoMatch','SHIPPING','The shipping zone id to use IF shipping by weight or total & zone is specified, and the customer zip doesn''t match any zone...this must be the Zone ID reported for the zone definition in the admin site','0');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'AffiliateEMailAddress','AFFILIATES','The e-mail address YOU will use to contact your affiliates','affiliates@yourdomain.com');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'MicroPay.Enabled','MISC','If true, MicroPayments will be enabled','false');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'Recurring.DefaultRecurringShippingMethodID','MISC','ShippingMethodID to use for processing a recurring order ONLY IF their customer record RecurringShippingMethodID is NULL or 0','1');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'Recurring.DefaultRecurringShippingMethod','MISC','ShippingMethod to use for processing a recurring order ONLY IF their customer record RecurringShippingMethod is NULL or empty string','Ground');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'Recurring.SendOrderEMailToCustomer','MISC','if true, when a recurring order is successfully processed (i.e. card charged ok, and new orderCREATEd), the customer will be sent an order receipt e-mail. If false, then no order receipt e-mail is sent','true');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'Recurring.SendShippedEMail','MISC','if true, when a recurring order is marked as shipped a your order has shipped e-mail will be sent to the customer. If false, then no order has shipped e-mail is sent','true');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'Recurring.LimitCustomerToOneOrder','MISC','When true, if a customer places a new Gateway Auto-Ship order any existing Auto-Ship orders are canceled with the gateway and are cleared from their cart. If a subscription is involved and SubscriptionExtensionOccursFromOrderDate=false then their remaining subscription period will be preserved.','false');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'Recurring.UseGatewayInternalBilling','MISC','if true, the gateway''s internal billing will be used instead of our own build order billing mechanism when processing recurring orders. This is ONLY allowed to be true if you are using the Authorize.net or Verisign PayFlow PRO gateways!! If using those gateways, setting this flag to true allows you to not have to store credit cards in your db. See manual for further instructions on how to process the recurring order reports using each gateway.','false');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'Recurring.ClearIsNewFlag','MISC','When true, recurrences of Auto-Ship orders will have the IsNew flag cleared automatically.','false');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'SendOrderEMailToCustomer','MISC','if true, when a (normal, not recurring) order isCREATEd, an order receipt e-mail will be sent to the customer. If false, then no order e-mail is sent','true');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'SendShippedEMailToCustomer','MISC','if true, when a (normal, not recurring) order is marked in the admin site, a your order has shipped e-mail will be sent to the customer. If false, then no order has shipped e-mail is sent','true');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'ShowSummaryInTableOrderFormat','SITEDISPLAY','if true, then the summary field in the Product will be used on table order formatted category pages','false');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'CustomerLevel0AllowsPOs','SITEDISPLAY','If true, then customer level 0 (all customers) can use purchase orders (assuming that payment method is enabled).','true');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'FilterDocumentsByAffiliate','SITEDISPLAY','if true, Documents are filtered by the customer affiliate id, and the Document to affiliate mappings are used in DocumentAffiliate table','false');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'FilterProductsByAffiliate','SITEDISPLAY','if true, Products are filtered by the customer affiliate id, and the Product to affiliate mappings are used in ProductAffiliate table','false');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'ShowManufacturerTree','SITEDISPLAY','if true, sites using left TOC Tree will include manufacturers tree','false');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'DisallowCoupons','SITEDISPLAY','If true, coupon fields will be hidden.','false');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'DisallowOrderNotes','SITEDISPLAY','If true, the order notes field on the shopping cart page will be hidden.','false');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'CartMinOrderAmount','SITEDISPLAY','the minimum order amount that can be ordered. If order is less than this amount, checkout button will not be shown in cart. Leave blank for no minimum. Examples amount would be 100.00, with no $ sign!','');



GO


/* 4.1 added */

INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'UseSKUForProductDescriptionName','SITEDISPLAY','If true, then the Product description fileName will be taken from the Product SKU.HTM. If false (the default), the Product description fileNames will be ProductID.HTM and be stored in the  /Productdescriptions directory','false');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'UseNameForSectionDescriptionName','SITEDISPLAY','If true, then the section description fileName will be taken from the SECTIONName.HTM. If false (the default), the Product description fileNames will be SectionID.HTM and be stored in the  /sectiondescriptions directory','false');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'eProcessingNetwork_X_EMAIL','GATEWAY','Required for AIM Wells Fargo SecureSourece Merchants','');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'eProcessingNetwork_X_Login','GATEWAY','The login to use if you are using eProcessingNetwork. Provided by eProcessingNetwork.','');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'eProcessingNetwork_X_Tran_Key','GATEWAY','Transaction key provided by eProcessingNetwork','');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'eProcessingNetwork_X_DELIM_DATA','GATEWAY','Do not change this value. This value is required by AspDotNetStorefront','TRUE');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'eProcessingNetwork_X_DELIM_CHAR','GATEWAY','Do not change this value. This value is required by AspDotNetStorefront','|');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'eProcessingNetwork_X_ENCAP_CHAR','GATEWAY','Do not change this value. This value is required by AspDotNetStorefront','');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'eProcessingNetwork_X_RELAY_RESPONSE','GATEWAY','Do not change this value. This value is required by AspDotNetStorefront','FALSE');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'eProcessingNetwork_X_EMAIL_CUSTOMER','GATEWAY','Do not change this value. This value is required by AspDotNetStorefront. We generate our own receipts','FALSE');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'eProcessingNetwork_X_METHOD','GATEWAY','Do not change this value. This value is required by AspDotNetStorefront. ','CC');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'eProcessingNetwork_X_RECURRING_BILLING','GATEWAY','Do not change this value. This value is required by AspDotNetStorefront. ','FALSE');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'eProcessingNetwork_X_VERSION','GATEWAY','Do not change this value. This value is required by AspDotNetStorefront. ','3.1');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'eProcessingNetwork_LIVE_SERVER','GATEWAY','Do not change this value','https://www.eProcessingNetwork.Com/cgi-bin/an/order.pl');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'eProcessingNetwork_TEST_SERVER','GATEWAY','Do not change this value','https://www.eProcessingNetwork.Com/cgi-bin/an/order.pl');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'eProcessingNetwork_Verify_Addresses','GATEWAY','Set to true if you want their gateway to validate the customer billing address against the credit card. Note that this may decrease fraud, but may also cause valid transactions to go failed, if they have different punctuation than on their credit card.','TRUE');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'FilterProductsByCustomerLevel','SITEDISPLAY','if true, Products are filtered by the customer affiliate id, and the Product to customer level mappings are used in Productcustomerlevel table','false');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'FilterDocumentsByCustomerLevel','SITEDISPLAY','if true, Documents are filtered by the customer affiliate id, and the Document to customer level mappings are used in DocumentCustomerLevel table','false');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'FilterByCustomerLevelIsAscending','SITEDISPLAY','if true, and filterProductsbycustomerlevel=true, then HIGHER customer levels (numerically) can see Products from that level, and all lower customer levels. E.g. Customer Level 3 would see all Products mapped to customer levels, 0, 1, 2, and 3. Remember Customer Level 0 is an anon user, or just regular site visitor','false');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'ShippingCostWhenNoZoneMatch','SHIPPING','ONLY IF shipping by weight by zone is selected, and the users zip code does not match any zone, this is the shipping cost that will be used in the cart','0.00');

INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'Localization.StoreCurrency','SETUP','The ISO 4217 Standard for the master store currency (i.e. what you do business in). This defines the currency code sent to the payment gateway.','USD');
INSERT [dbo].AppConfig(SuperOnly,Name,groupName,Description,ConfigValue) values(0,'Localization.StoreCurrencyNumericCode','SETUP','The ISO 4217 Standard Numeric code for the master store currency (i.e. what you do business in). This defines the currency code sent to the payment gateway.','840');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'Localization.WeightUnits','SETUP','Enter the prompt you want to use for weights (e.g. lbs, kg, kilos, etc)','LBS');



GO


/* 4.2 added */

INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'Suscription.ExpiredMessageWhenViewingTopic','SITEDISPLAY','Message shown to user when they try to view a subscription topic and the customer has an expired subscription','<p><b>A valid subscription is required to view this content.</b></p>');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'AddToCartAction','SITEDISPLAY','If this is set to STAY, then after an add to cart action the site will go back to the product page the customer was just on. If blank (the default), customers will be sent to the shopping cart page.','');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'ShowMiniCart','SITEDISPLAY','if true, mini-cart can be displayed in left col, if your skin template allows that','true');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'ShowPicsInMiniCart','SITEDISPLAY','if true, Product picture icons will be shown in the mini-cart','true');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'MiniCartMaxIconWidth','SITEDISPLAY','Max width of icon in mini-cart','125');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'MiniCartMaxIconHeight','SITEDISPLAY','Max height of icon in mini-cart','125');



GO


/* 4.3 added */

INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'DefaultAddToCartQuantity','SITEDISPLAY','The default quantity filled into the add to cart form quantity field. If blank, 1 will be used. Enter 0 if you want 0.','');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'MinOrderWeight','SITEDISPLAY','The minimum order weight, in lbs. Generally most useful when you are using real time shipping calculations','1.0');


GO


/* 5.0 added */

INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'2CHECKOUT_VendorID','GATEWAY','your numerical 2checkout vendor account number. provided by 2checkout. Set your Direct Return to disabled in your 2Checkout control panel also!.','');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'2CHECKOUT_LIVE_SERVER','GATEWAY','Do not change this value','https://www.2checkout.com/2co/buyer/purchase');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'YOURPAY_CONFIGFILE','GATEWAY','Change this to your store number','xxxxxx');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'YOURPAY_KEYFILE','GATEWAY','Change this to the Name and location of your certificate file. This should usually be in the root of your website.','YOURPAY.pem');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'YOURPAY_LIVE_SERVER','GATEWAY','The live YOURPAY host. don''t change unless you know what you are doing','secure.linkpt.net');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'YOURPAY_PORT','GATEWAY','Don''t change unless you know what you are doing','1129');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'YOURPAY_TEST_SERVER','GATEWAY','The YOURPAY test transaction server. don''t change unless you know what you are doing.','staging.linkpt.net');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'YOURPAY_Verify_Addresses','GATEWAY','if true, address verification will be used on YOURPAY transactions.','true');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'PasswordIsOptionalDuringCheckout','MISC','if true, then the customer does not have to pick a password during checkout. The side effect of this is that they will never be able to login to the site again to get their order history. Changing this value from false (the default) should be done with great care!','false');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'HidePasswordFieldDuringCheckout','MISC','if true, the password fields are not even displayed during checkout. Changing this value from false (the default) should be done with great care!','false');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'WriteFileInUTF8','MISC','if true, text files will be written out in UTF-8 format. If false, the default, files will be written out in ASCII format','false');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'Micropay.HideOnCartPage','MISC','if true, and micropay.enabled, the "add $5 to your micropay" Product line item will NOT appear on the shopping cart page. This is helpful if the store administrator is controlling their micropay balance using some other means','false');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'AllowMultipleShippingAddressPerOrder','MISC','If true, the user can add a shipping address for each item in their cart. Note that if you have your gift registry feature enabled, that will also force allowing multiple shipping addresses per order to be enabled!','false');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'IncludeGoogleTrackingCode','MISC','if true, google tracking topic will be included on order confirmation page','false');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'IncludeOvertureTrackingCode','MISC','if true, overture tracking topic will be included on order confirmation page','false');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'Admin.MultiGalleryImageWidth','SITEDISPLAY','if not blank and non-zero, this width will be used to set image size widths in multi-image Product manager (does not resize images on store site). This is only a convenience to help view the multi-image gallery in a smaller size when editing on the admin site','');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'AllowShoppingCartItemNotes','SITEDISPLAY','If true, each shipping group on an order will have a notes field that customers can type in.','false');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'ShoppingCartItemNotesTextareaRows','SITEDISPLAY','# of rows in item notes textarea if being displayed','2');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'ShoppingCartItemNotesTextareaCols','SITEDISPLAY','# of cols in item notes textarea if being displayed','35');


GO


/* X.X added */



GO


/* 5.4 added */

INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'HidePicsInTableCondensed','SITEDISPLAY','set to true if you do NOT want product pics to be used on category/section/product pages if using condensed table view formats','true');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'ResizableLargeImagePopup','SITEDISPLAY','set to true if you want the large image popup window to be resizable by the user','false');


GO


/* 5.5 added */

INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'GoogleSiteMap.EntityChangeFreq','SITEDISPLAY','frequency tag used on Google Site Map (category, section, manufacturer, etc) url nodes. Consult google documentation for allowed values. Do NOT call us if you change this to a value that is not supported by Google please!','weekly');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'GoogleSiteMap.EntityPriority','SITEDISPLAY','priority tag used on Google Site Map entity (category, section, manufacturer, etc) url nodes. Consult google documentation for allowed values. Do NOT call us if you change this to a value that is not supported by Google please!','0.7');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'GoogleSiteMap.ObjectChangeFreq','SITEDISPLAY','frequency tag used on Google Site Map product (object) url nodes. Consult google documentation for allowed values. Do NOT call us if you change this to a value that is not supported by Google please!','daily');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'GoogleSiteMap.ObjectPriority','SITEDISPLAY','priority tag used on Google Site Map product (object) url nodes. Consult google documentation for allowed values. Do NOT call us if you change this to a value that is not supported by Google please!','0.9');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'GoogleSiteMap.TopicChangeFreq','SITEDISPLAY','frequency tag used on Google Site Map topic url nodes. Consult google documentation for allowed values. Do NOT call us if you change this to a value that is not supported by Google please!','weekly');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'GoogleSiteMap.TopicPriority','SITEDISPLAY','priority tag used on Google Site Map topic url nodes. Consult google documentation for allowed values. Do NOT call us if you change this to a value that is not supported by Google please!','0.5');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'GoogleSiteMap.Xmlns','SITEDISPLAY','Change to match Google requirements, if necessary. This should not be changed without full understanding of what you are doing!  All information on supported schemas must come from Google.','http://www.google.com/schemas/sitemap/1.0');

INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'Reorder.ClearCartBeforeAddingReorderItems','MISC','set to true if you want a customers cart to be cleared if they press the reorder button on a prior order. If false, the prior order contents will simply be added to their current cart','true');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'Watermark.Enabled','MISC','If you want to watermark your product images, true here','false');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'Watermark.CopyrightText','MISC','If you want to watermark your product images (all sizes) with a text string, enter the copyright notice here, e.g. Copyright YourStore.com','');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'Watermark.CopyrightImage.Icon','MISC','If you want to watermark your icon product images with an embedded image watermark, enter the relative image url path here, e.g. /images/mywatermark.jpg','');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'Watermark.CopyrightImage.Medium','MISC','If you want to watermark your medium product images with an embedded image watermark, enter the relative image url path here, e.g. /images/mywatermark.jpg','');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'Watermark.CopyrightImage.Large','MISC','If you want to watermark your large product images with an embedded image watermark, enter the relative image url path here, e.g. /images/mywatermark.jpg','');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'Watermark.OffsetFromBottomPercentage','MISC','Offset from bottom of product image, in percent, that the copyright is placed','10');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'Watermark.Opacity','MISC','opacity of watermark image, range is 0.0 = invisible watermark, 1.0 = fullly visible watermark','0.2');


GO


/* 5.7 added */

INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'PlugNPay_URL','GATEWAY','If using PlugNPlay COM merchant gateway, this is the transaction URL they have told you to use. You will have to register your site IP address with the merchant gateway also!','https://pay1.plugnpay.com/payment/pnpremote.cgi');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'PlugNPay_Username','GATEWAY','If using PlugNPlay COM merchant gateway , this is the username value assigned to your store. You will have to register your site IP address with the merchant gateway also!','pnpdemo');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'PlugNPay_Password','GATEWAY','If using PlugNPlay COM merchant gateway , this is the password value assigned to your store. You will have to register your site IP address with the merchant gateway also!','pnpdemo');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'ContentsBGColorDefault','SITEDISPLAY','If no background color is specified in a skin, this value will be used for the content area.','#FFFFFF');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'PageBGColorDefault','SITEDISPLAY','undocumented feature','#FFFFFF');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'GraphicsColorDefault','SITEDISPLAY','undocumented feature','');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'SiteMap.ShowProducts','SITEDISPLAY','if you want product links to be shown in the sitemap, set this to true.','true');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'SiteMap.ShowDocuments','SITEDISPLAY','if you want document links to be shown in the sitemap, set this to true.','true');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'SiteMap.ShowLibraries','SITEDISPLAY','if you want libraries to be shown in the sitemap, set this to true.','true');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'SiteMap.ShowManufacturers','SITEDISPLAY','if you want manufacturers to be shown in the sitemap, set this to true.','true');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'SiteMap.ShowCategories','SITEDISPLAY','if you want categories to be shown in the sitemap, set this to true. if false, only cats/subcats and sections/subsections will be shown','true');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'SiteMap.ShowSections','SITEDISPLAY','if you want sections to be shown in the sitemap, set this to true.','true');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'SiteMap.ShowTopics','SITEDISPLAY','if you want topics to be shown in the sitemap, set this to true.','true');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'SiteMap.ShowCustomerService','SITEDISPLAY','if you want customer service items to be shown in the sitemap, set this to true.','true');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'Tree.ShowCategories','SITEDISPLAY','if you want categories to be shown in the tree, set this to true.','true');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'Tree.ShowSections','SITEDISPLAY','if you want sections to be shown in the tree, set this to true.','true');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'Tree.ShowLibraries','SITEDISPLAY','if you want libraries to be shown in the tree, set this to true.','true');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'Tree.ShowManufacturers','SITEDISPLAY','if you want libraries to be shown in the tree, set this to true.','true');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'Tree.ShowCustomerService','SITEDISPLAY','if you want the customer service node to be shown in the tree, set this to true. If true, then the AppConfig Tree.CustomerServiceXml will be read and displayed AS IS, so it must be a valid Xml Document fragement for the tree.','true');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'Tree.CustomerServiceXml','SITEDISPLAY','Xml fragment that defines your ComponentArt Tree Customer Service items','<siteMapNode Text="(!menu.YourAccount!)" NavigateUrl="account.aspx" /><siteMapNode Text="(!menu.OrderHistory!)" NavigateUrl="account.aspx" /><siteMapNode Text="(!menu.FAQs!)" NavigateUrl="t-faq.aspx" /><siteMapNode Text="(!menu.PolicyReturns!)" NavigateUrl="t-returns.aspx" /><siteMapNode Text="(!menu.Shipping!)" NavigateUrl="t-shipping.aspx" /><siteMapNode Text="(!menu.Contact!)" NavigateUrl="t-contact.aspx" /><siteMapNode Text="(!menu.PolicyPrivacy!)" NavigateUrl="t-privacy.aspx" /><siteMapNode Text="(!menu.PolicySecurity!)" NavigateUrl="t-security.aspx" />');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'AllowRecurringIntervalEditing','ADMIN','if true, then the admin user can edit the next ship date for recurring orders.','true');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'ReplaceImageURLFromAssetMgr','ADMIN','if true, then the store topic.cs class will replace ../images with images during HTML content retrieval (topics, descriptions, etc) from the db, this is to allow images you inserted via the innova editor with asset manager to resolve properly on the store site.','true');



GO


/* 5.8 added */

INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'ShowGiftRegistryButtons','SITEDISPLAY','If false, the add to gift registry buttons will not appear on the Product pages','false');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'ShippingMethodIDIfItemShippingCostsAreOn','SHIPPING','The shipping method used (reported to customers in their receipt e-mail) if the site is item based shipping costs on all orders. Since users aren''t charged for shipping (it''s free), they can''t change or select the shipping type either, so this lets AspDotNetStorefront know what method you will be using to ship the orders.','1');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'AllowGiftRegistryQuantities','SITEDISPLAY','If true, customers can specify the # of items they want in their gift registry for each product','true');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'DecrementGiftRegistryOnOrder','SITEDISPLAY','If true, customer a''s gift registry desired quantity will be decreased by N if customer b purchased N products from customer a''s gift registry. If false, the customer''s gift registry doesn''t change unless the customer does it manually.','true');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'OrderSummaryReportFields','ADMIN','This sets the fields used in the new order summary reports in the admin site. You can use any comma separate list of valid field names here from the Orders table. If blank, all fields are displayed','OrderNumber,OrderDate,OrderTotal,IsNew,CustomerID,FirstName,LastName,Email,Notes,Phone,AffiliateID,CardType,CardName,CardNumber,Last4,CardExpirationMonth,CardExpirationYear,PaymentMethod,OrderNotes,FinalizationData,PONumber,DownloadEmailSentOn,ReceiptEmailSentOn,ShippingTrackingNumber,ShippedVIA,AVSResult,LocaleSetting');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'ShowPicsInCart','SITEDISPLAY','if true, Product picture icons will be shown in the shopping cart','false');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'ShowUpsellProductsOnCartPage','SITEDISPLAY','if true, upsell products, for those products already in the cart, will be shown beneath their current cart products, as a suggestive sell feature','true');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'UpsellProductsLimitNumberOnCart','SITEDISPLAY','if ShowUpsellProductsOnCartPage is true, this is the max # of products that will be shown','10');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'UseParserOnEntityDescriptions','SITEDISPLAY','if true, the parser will be invoked on Product (or other object) descriptions. Don''t turn this on unless you need it, as it adds overhead','false');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'UseParserOnObjectDescriptions','SITEDISPLAY','if true, the parser will be invoked on Product (or other object) descriptions. Don''t turn this on unless you need it, as it adds overhead','false');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'ContinueShoppingURL','MISC','This can be set to the relative path of a page on your site (ie c-1-myproducts.aspx, products.htm, etc).  Customers who click Continue Shopping on the shopping cart page will be sent there instead of back to the page they were on.','');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'SiteDisclaimerRequired','MISC','if true, customer must read and acknoweldge a site disclaimer topic before entering main site pages. See the SiteDisclaimer topic for more info','false');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'SiteDisclaimerNotAgreedURL','MISC','if a customer does not accept the site disclaimer, we will send them to this URL. This must be a FULLY qualified http://.... url target','http://www.disneyland.com');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'SiteDisclaimerAgreedPage','MISC','if a customer accepts the site disclaimer, this is the PAGE relative to your store where they are sent.','default.aspx');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'MultiShipMaxItemsAllowed','DISPLAY','if an order as sum(quantity) > this value, then multi-ship checkout is NOT allowed...set this threshold to make sense for your store. Why is this needed? Someone could ad 9000 items to their cart, and there would be NO way to ever "multi-ship" such an item list without specific knowledge of your business. So if you need that type of capability, you will need source code customizations.','25');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'MaxMenuSize','SITEDISPLAY','The maximum number of items you want to allow in a top menu (e.g. manufacturers). If a menu is longer than this, it is NOT displayed.','25');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'SkipShippingOnCheckout','DISPLAY','set to true if you want to bypass the shipping checkout pages (e.g. if your store doesn''t care about shipping at all)','false');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'ShowQuantityDiscountTablesInline','DISPLAY','if false, quantity discount table is pop-up link on product page. if true, then table is shown inline above product description','false');


GO


/* 5.9 added */

INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'PAYJUNCTION_LOGON','GATEWAY','Payjunction username (also called logon), assigned by PayJunction','');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'PAYJUNCTION_PASSWORD','GATEWAY','Payjunction password, assigned by PayJunction','');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'PAYJUNCTION_HTTP_VERSION','GATEWAY','Do not change unless instructed to by PayJunction','1.2');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'PAYJUNCTION_TEST_SERVER','GATEWAY','Do not change unless instructed to by PayJunction','https://payjunction.com/quick_link?');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'PAYJUNCTION_LIVE_SERVER','GATEWAY','Do not change unless instructed to by PayJunction','https://payjunction.com/quick_link?');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'PAYJUNCTION_SECURITY_DESCRIPTOR','GATEWAY','See PayJunction API Spec Page 19, this controls how the gateway deals with address mismatches, cvs mismatches, etc. The defaults set here are to: match zip, CVS is On, preauth is off (should never be on really for our storefront), avsforce=false, cvvforce=false','WZ|M|false|false|false');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'JETPAY_MERCHANTID','GATEWAY','Your JetPay assigned Merchant ID','');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'JETPAY_TEST_SERVER','GATEWAY','Do not change unless instructed to by JetPay','https://test1.jetpay.com/jetpay');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'JETPAY_LIVE_SERVER','GATEWAY','Do not change unless instructed to by JetPay','https://gateway1.jetpay.com/jetpay');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'ForceSignoutOnOrderCompletion','SECURITY','If true, upon order completion, the user will be forcibly signed out of the site.','false');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'Micropay.ShowTotalOnTopOfCartPage','DISPLAY','if true, and Micropay.Enabled=true, then the user''s current Micropay Balance will be shown at the top of the shopping cart page','true');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'WholesaleOnlySite','DISPLAY','if true, then all "retail" customers (level 0) will NOT see any prices on the entire site. They also cannot add to cart. This appconfig is useful to sites doing wholesale.','false');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'GoNonSecureAgain','SECURITY','if false the cart stays secure on ALL pages that follow any page that goes secure (account, cart, etc). If true, the cart will "TRY" to go non-secure again on other pages, AFTER it has gone secure. We recommend the default value of false for most sites!','false');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'SkipPaymentEntryOnZeroDollarCheckout','DISPLAY','set to true and the customer has a Zero dollar order total, then all payment collection/entry screens are bypassed during checkout, and a zero dollar order is created','true');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'ShowPreviousPurchase','DISPLAY','set to true to display a warning from custom.cs.86 resource string if the customer has previously purchased this product.','false');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'ReceiptHideStoreVersion','DISPLAY','if true, the store version will not be shown on customer receipts.','false');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'HideKitQuantity','DISPLAY','if true, the store will not show the (N) quantity on kit items for kits.','false');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'HideKitPrice','DISPLAY','if true, the store will not show the base kit price on the product page.','false');


GO


/* 5.9.2 added */

INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'SecurityCodeRequiredOnStoreLogin','SECURITY','If true, turing number security fields are added to the login pages, to prevent automated attacks. Turing fields are also ONLY used on the live server, not the dev server, so make sure your AppConfig:LiveServer is set to be yourdomain.com also','false');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'SecurityCodeRequiredOnAdminLogin','SECURITY','If true, turing number security fields are added to the login pages, to prevent automated attacks. Turing fields are also ONLY used on the live server, not the dev server, so make sure your AppConfig:LiveServer is set to be yourdomain.com also','false');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'SecurityCodeRequiredOnCreateAccount','SECURITY','If true, turing number security fields are added to the create account page (not checkout mode), to prevent automated attacks. Turing fields are also ONLY used on the live server, not the dev server, so make sure your AppConfig:LiveServer is set to be yourdomain.com also','false');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'SecurityCodeRequiredOnCreateAccountDuringCheckout','SECURITY','If true, turing number security fields are added to the create account page during checkout, to prevent automated attacks. Turing fields are also ONLY used on the live server, not the dev server, so make sure your AppConfig:LiveServer is set to be yourdomain.com also','false');


GO


/* 6.0 added */

INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'Innova.XHTML','DISPLAY','If true, the admin site innova html editor fields will use XHTML format and validation. If false, they will use straight HTML format.','false');


GO


/* 6.1 added */

INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'HideProductsWithLessThanThisInventoryLevel','DISPLAY','If not -1, the site will filter out products that have less than the inventory # in stock that you specify here. Leave set to -1 to disable this filtering. For products with multiple variants, and sizes & colors, etc, the SUM of those inventory items is used to determine if to filter the product. So the sum of all variant inventory must be less than this number before it will be filtered out.','-1');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'FilterOutShippingMethodsThatHave0Cost','SHIPPING','if you want to filter out shipping methods that result in $0 costs to the customer, you can set this flag to true. Otherwise, all shipping methods are returned and displayed. This appconfig should almost always be false.','false');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'AutoSelectFirstSizeColorOption','DISPLAY','If true, the first choice in the size or color select lists on add to cart forms will be auto-selected.  If false, customers will be forced to choose a size or color before adding to the cart (recommended).','false');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'XmlPackage.DumpTransform','XMLPACKAGE','if true, XmlPackages will write debugging output .xml files in the /images directory','false');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'XmlPackage.DefaultDistributorNotification','XMLPACKAGE','The XmlPackage used by default to send new order notifications to distributors. You can override the XmlPackage to be used on each distributor however in the admin site','notification.distributor.xml.config');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'XmlPackage.LostPassword','XMLPACKAGE','The XmlPackage used to generate lost password messages back to customers','notification.lostpassword.xml.config');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'XmlPackage.OrderReceipt','XMLPACKAGE','The XmlPackage used to generate order receipts for customers','notification.receipt.xml.config');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'XmlPackage.OrderAsXml','XMLPACKAGE','The XmlPackage used to convert an order into Xml format (for administrative purposes, for export purposes, etc)','notification.orderasxml.xml.config');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'XmlPackage.OrderShipped','XMLPACKAGE','The XmlPackage used to create the "your order has shipped" e-mail notifications to customers','notification.shipped.xml.config');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'XmlPackage.NewOrderAdminNotification','XMLPACKAGE','The XmlPackage used when sending an e-mail to the store administrator when a new order is received','notification.adminneworder.xml.config');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'XmlPackage.NewOrderAdminSMSNotification','XMLPACKAGE','The XmlPackage used when sending a SMS cell phone message to the store administrator when a new order is received','notification.smsneworder.xml.config');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'XmlPackage.AffiliateSignupNotification','XMLPACKAGE','The XmlPackage used to create the e-mail message to be sent to new affiliates when they sign-up.','notification.affiliatesignup.xml.config');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'XmlPackage.OrderFinalization','XMLPACKAGE','The XmlPackage used to create the order finalization instructions during checkout','finalizationdata.xml.config');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'XmlPackage.OrderConfirmationPage','XMLPACKAGE','The XmlPackage fired on a successful order received, on the order confirmation page','page.orderconfirmation.xml.config');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'RelatedProductsGridColWidth','DISPLAY','if using grid layout for related products, this is the # of cols in the grid','4');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'UpsellProductsGridColWidth','DISPLAY','if using grid layout for upsell products, this is the # of cols in the grid','4');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'GiftCard.PhysicalProductTypeIDs','GIFTCARD','A comma delimited list of the ProductTypeIDs that identify a Physical Gift Card. Physical Gift Cards have their Serial numbers assigned when they are shipped to the customer.','100');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'GiftCard.EmailProductTypeIDs','GIFTCARD','A comma delimited list of the ProductTypeIDs that identify an Email Gift Card. Email Gift Cards are emailed to the recipient and have their Serial numbers assigned automatically.','101');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'GiftCard.CertificateProductTypeIDs','GIFTCARD','A comma delimited list of the ProductTypeIDs that identify an Certificate Gift Card. Certificate Gift Cards are printed by the customer so they may be given by the customer to the recipient and will have their Serial numbers assigned automatically.','102');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'RequireOver13Checked','SECURITY','if true, on creating an account, the users must check a checkbox indicating they are over 13. this may be required for federal regulation compliance.','true');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'SubscriptionExtensionOccursFromOrderDate','MISC','if false, the order extends a customers subscription from the PRIOR expiration date, if true, it sets the expiration date to the order date + subscription interval in the order.','false');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'Localization.CurrencyFeedUrl','LOCALIZATION','the fully specified url that you will be using to get Currency Exchange Rate Data. See also AppConfig:Localization.CurrencyFeedXmlPackage','http://www.ecb.int/stats/eurofxref/eurofxref-daily.xml');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'Localization.CurrencyFeedXmlPackage','LOCALIZATION','The xmlpackage that you want to use to provide the currency exchange rate data conversion. This package usually must work hand in hand with the currency exchange rate data provider, to convert their rate data into our predefined xml format. See also AppConfig:Localization.CurrencyFeedUrl','feed.exchangerates-eur.central.bank.xml.config');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'Localization.CurrencyFeedBaseRateCurrencyCode','LOCALIZATION','You MUST set this appconfig to match the BASE currency code that your currency feed is returning exchange rates relative to, e.g. USD, EUR, etc.','EUR');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'Localization.CurrencyCacheMinutes','LOCALIZATION','The time that a currency rate table is cached. The site will call the live currencyserver specified in AppConfig:Localization.CurrencyFeedUrl parameter every time this cache period expires','60');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'CENTRALPAYMENTS_AssociateName','GATEWAY','Your CentralPayments assigned associate name','FCTEST');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'CENTRALPAYMENTS_AssociatePassword','GATEWAY','Your CentralPayments assigned associate password','FCTEST');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'QBMERCHANTSERVICES_ApplicationLogin','GATEWAY','Your Application login that you obtained from QuickBooks. See manual for instructions.','');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'QBMERCHANTSERVICES_ApplicationID','GATEWAY','Your Application ID that you obtained from QuickBooks. See manual for instructions.','');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'QBMERCHANTSERVICES_ApplicationVersion','GATEWAY','do not change this value','1.0');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'QBMERCHANTSERVICES_InstallID','GATEWAY','','');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'QBMERCHANTSERVICES_ConnectionTicket','GATEWAY','Your connection ticket assigned by QuickBooks. See Quick Books Merchant Services and our manual page for instructions on how to obtain your connection ticket.','');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'QBMERCHANTSERVICES_Language','GATEWAY','Your connection ticket assigned by QuickBooks. See Quick Books Merchant Services for instructions on how to obtain your connection ticket.','English');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'Default_CategoryPageSize','SITEDISPLAY','The default pagesize for a category, when it is first added to the db. After adding, you can edit in the admin site. Set to 0 for no paging (i.e. all products are listed). This value MAY be used by the XmlPackage displaying this page.','20');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'Default_SectionPageSize','SITEDISPLAY','The default pagesize for a section, when it is first added to the db. After adding, you can edit in the admin site. Set to 0 for no paging (i.e. all products are listed). This value MAY be used by the XmlPackage displaying this page.','20');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'Default_LibraryPageSize','SITEDISPLAY','The default pagesize for a library, when it is first added to the db. After adding, you can edit in the admin site. Set to 0 for no paging (i.e. all products are listed). This value MAY be used by the XmlPackage displaying this page.','20');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'Default_ManufacturerPageSize','SITEDISPLAY','The default pagesize for a manufacturer, when it is first added to the db. After adding, you can edit in the admin site. Set to 0 for no paging (i.e. all products are listed). This value MAY be used by the XmlPackage displaying this page.','20');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'Default_DistributorPageSize','SITEDISPLAY','The default pagesize for a distributor, when it is first added to the db. After adding, you can edit in the admin site. Set to 0 for no paging (i.e. all products are listed). This value MAY be used by the XmlPackage displaying this page.','20');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'Default_ProductPageSize','SITEDISPLAY','The default pagesize for a product, when it is first added to the db. After adding, you can edit in the admin site. Set to 0 for no paging (i.e. all variants are listed). This value MAY be used by the XmlPackage displaying this page.','20');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'Default_DocumentPageSize','SITEDISPLAY','The default pagesize for a document, when it is first added to the db. After adding, you can edit in the admin site. Set to 0 for no paging (i.e. all documents are listed). This value MAY be used by the XmlPackage displaying this page.','20');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'Default_CategoryColWidth','SITEDISPLAY','The default ColWidth for a category, when it is first added to the db. After adding, you can edit in the admin site. Set to 0 for no paging (i.e. all products are listed). This value MAY be used by the XmlPackage displaying this page.','4');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'Default_SectionColWidth','SITEDISPLAY','The default ColWidth for a section, when it is first added to the db. After adding, you can edit in the admin site. Set to 0 for no paging (i.e. all products are listed). This value MAY be used by the XmlPackage displaying this page.','4');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'Default_LibraryColWidth','SITEDISPLAY','The default ColWidth for a library, when it is first added to the db. After adding, you can edit in the admin site. Set to 0 for no paging (i.e. all products are listed). This value MAY be used by the XmlPackage displaying this page.','4');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'Default_ManufacturerColWidth','SITEDISPLAY','The default ColWidth for a manufacturer, when it is first added to the db. After adding, you can edit in the admin site. Set to 0 for no paging (i.e. all products are listed). This value MAY be used by the XmlPackage displaying this page.','4');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'Default_DistributorColWidth','SITEDISPLAY','The default ColWidth for a distributor, when it is first added to the db. After adding, you can edit in the admin site. Set to 0 for no paging (i.e. all products are listed). This value MAY be used by the XmlPackage displaying this page.','4');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'Default_ProductColWidth','SITEDISPLAY','The default ColWidth for a product, when it is first added to the db. After adding, you can edit in the admin site. Set to 0 for no paging (i.e. all variants are listed). This value MAY be used by the XmlPackage displaying this page.','4');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'Default_DocumentColWidth','SITEDISPLAY','The default ColWidth for a document, when it is first added to the db. After adding, you can edit in the admin site. Set to 0 for no paging (i.e. all documents are listed). This value MAY be used by the XmlPackage displaying this page.','4');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'DisallowShippingToPOBoxes','SHIPPING','If you do not want to allow, or cannot allow (e.g. using FEDEX) shipping to PO Boxes, set this flag to true, and the store will TRY to prevent users from entering PO Box shipping addresses. It is NOT 100% guaranteed. Users enter all types of crap!','false');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'UseMappingShipToPayment','SHIPPING','if true, you can via the admin site map which shipping methods are allowed for the payment methods. This is an undocumented and unsupported feature.','false');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'XmlPackage.EmailGiftCardNotification','XMLPACKAGE','The package used to create body of the email sent when some one purchases an email gift card.','notification.emailgiftcard.xml.config');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'Skipjack.LiveServer','GATEWAY','Your SkipJack live production transaction server post URL.','https://www.skipjackic.com/scripts/evolvcc.dll?AuthorizeAPI');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'Skipjack.TestServer','GATEWAY','Your SkipJack test transaction server post URL.','https://developer.skipjackic.com/scripts/evolvcc.dll?AuthorizeAPI');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'Skipjack.LiveSerialNumber','GATEWAY','Your SkipJack assigned live account html serial number. You get this from SkipJack','');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'Skipjack.DeveloperSerialNumber','GATEWAY','Your SkipJack assigned developer serial number. You get this from SkipJack','');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'Skipjack.LiveChangeURL','GATEWAY','Your SkipJack live production change transaction server post URL.','https://www.skipjackic.com/scripts/evolvcc.dll?SJAPI_TransactionChangeStatusRequest');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'Skipjack.TestChangeURL','GATEWAY','Your SkipJack test change transaction server post URL.','https://developer.skipjackic.com/scripts/evolvcc.dll?SJAPI_TransactionChangeStatusRequest');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'Skipjack.TestSerialNumber','GATEWAY','Your SkipJack assigned test account html serial number. You get this from SkipJack','');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'Skipjack.ForceSettlement','GATEWAY','Used for SkipJack transaction changes for SETTLE and CREDIT to include a ForceSettlement option. Typically this is False.','False');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'MaxMind.Enabled','GATEWAY','If true, the MaxMind fraud prevention score will be checked before a credit card is sent to the gateway. If the returned FraudScore exceeds AppLogic.MaxMind.FailScoreThreshold, the order will be failed. See MaxMind.com for more documentation.','false');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'MaxMind.LicenseKey','GATEWAY','Your MaxMind license key. Issued by MaxMind. Consult MaxMind.com for documentation','');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'MaxMind.FailScoreThreshold','GATEWAY','Threshold over which to fail orders. 0.0 is lowest risk. 10.0 is highest risk. By default, this setting (of 10.0) will NOT FAIL any order. You will have to set this threshold to your own liking for your own business. Every store will probably use different thresholds due to the nature of their business. Consult MaxMind.com for documentation. ','10.0');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'MaxMind.DelayDownloadThreshold','GATEWAY','Threshold over which to force delayed downloads on orders, regardless of the setting of AppConfig:DelayedDownloads is set to. 0.0 is lowest risk. 10.0 is highest risk. See AppConfig:MaxMind.ScoreThreshold also.','2.5');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'MaxMind.DelayDropShipThreshold','GATEWAY','Threshold over which to force delayed downloads on orders, regardless of the setting of AppConfig:DelayedDropShipNotifications is set to. 0.0 is lowest risk. 10.0 is highest risk. See AppConfig:MaxMind.ScoreThreshold also.','2.5');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'MaxMind.SOAPURL','GATEWAY','SOAP MaxMind Web Service URL. Consult MaxMind.com for documentation','http://www.maxmind.com:8005/maxmind/minfraud_soap');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'SendWelcomeEmail','MISC','Set to true if you want new customers to get a welcoming email.  The email message content is controled by the XmlPackage specified in the XmlPackage.WelcomeEmail Appconfig parameter.  The email subject is stored in the StringResource createaccount.aspx.79','false');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'XmlPackage.WelcomeEmail','XMLPACKAGE','Used for the contents of the welcome email that newly registered customers receive.','notification.newmemberwelcome.xml.config');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'XmlPackage.RefundEmail','XMLPACKAGE','Used for the contents of the email sent to customers when their order has been refunded.','notification.orderrefund.xml.config');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'XmlPackage.OrderCanceledEmail','XMLPACKAGE','Used for the contents of the email sent to customers when their order has been voided.','notification.ordercanceled.xml.config');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'GatewayRetries','GATEWAY','The number of retries to try to call the payment gateway, if it is not responding, times out, or has other connection error. Currently, we only do retries with authorize.net gateway. This value probably should never exceed 3. It should also rarely be needed. Most modern gateways are redundant and very reliable.','2');


GO


/* 6.2.1 added */

INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'GoogleCheckout.ShowOnCartPage','GOOGLE CHECKOUT','This enables or disables Google Checkout on the Shopping Cart page. If true, the Google Checkout button will be shown (assuming the shopping cart is not empty). If false, the Google Checkout button will not be shown, and Google Checkout cannot be used.','true');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'GoogleCheckout.UseSandbox','GOOGLE CHECKOUT','This enables use of the Google Sandbox for test transactions. If true, transactions will be sent to sandbox.google.com for testing. If false, transactions will be "live", and will be processed at checkout.google.com.','true');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'GoogleCheckout.DefaultShippingMarkup','GOOGLE CHECKOUT','Google Checkout requires "default shipping" options when the cart is initially loaded. This is the multiplier applied to the base shipping rates, to calculate the "default shipping" rates.','2.0');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'GoogleCheckout.MerchantId','GOOGLE CHECKOUT','From the Settings>Intergration page at checkout.google.com/sell','');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'GoogleCheckout.MerchantKey','GOOGLE CHECKOUT','From the Settings>Intergration page at checkout.google.com/sell','');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'GoogleCheckout.SandboxMerchantId','GOOGLE CHECKOUT','From the Settings>Intergration page at sandbox.google.com/sell','');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'GoogleCheckout.SandboxMerchantKey','GOOGLE CHECKOUT','From the Settings>Intergration page at sandbox.google.com/sell','');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'GoogleCheckout.LogMessages','GOOGLE CHECKOUT','This true/false setting enables diagnostic troubleshooting messages to be logged to a text file. As messages are being transmitted between your site and Google Checkout, they are also written to a text file for later analysis.','false');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'GoogleCheckout.LogFileName','GOOGLE CHECKOUT','The filename of the log file, relative to the root of your website. Enter a relative pathname here. Absolute pathnames won''t work.','images/GoogleCheckout.log');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'GoogleCheckout.BaseUrl','GOOGLE CHECKOUT','Don''t change this value. It''s the URL that your website uses to communicate with Google Checkout.','https://checkout.google.com/api/checkout/v2/request/Merchant/{0}');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'GoogleCheckout.DiagnosticsOnly','GOOGLE CHECKOUT','Don''t set this value to true, as it will cause Google Checkout to stop working. If it''s set to true, all communications between your site and Google Checkout will be done in diagnostic-mode, which is used to check for XML syntax errors.','false');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'GoogleCheckout.DefaultTaxRate','GOOGLE CHECKOUT','Set this to the deafult tax rate that will be used either for all products or for products that don''t have a tax table mapping','0');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'GoogleCheckout.UseTaxTables','GOOGLE CHECKOUT','Boolean value (true or false) that indicates whether to use ONLY the deafult tax rate or to implement full table table mappng for google checkout (for non US GoogleCheckout only)','false');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'GoogleCheckout.ShippingIsTaxed','GOOGLE CHECKOUT','Boolean value (true or false) that indicates whether shipping is taxed','false');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'GoogleCheckout.SandBoxCheckoutButton','GOOGLE CHECKOUT','The url for the GoogleCheckout Sandbox checkout button, the replace token in the string is for the merchantid','http://sandbox.google.com/checkout/buttons/checkout.gif?merchant_id={0}&w=180&h=46&style=white&variant=text');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'GoogleCheckout.LiveCheckoutButton','GOOGLE CHECKOUT','The url for the GoogleCheckout Live checkout button, the replace token in the string is for the merchantid','http://checkout.google.com/buttons/checkout.gif?merchant_id={0}&w=180&h=46&style=white&variant=text');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'GoogleCheckout.SandBoxCheckoutURL','GOOGLE CHECKOUT','The URL that your website uses to communicate with Google Checkout Sandbox interface, the replace token in the string is for the merchantid','https://sandbox.google.com/checkout/api/checkout/v2/request/Merchant/{0}');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'GoogleCheckout.AllowAnonCheckout','GOOGLE CHECKOUT','This enables customers to check out with Google Checkout without registering on the store site.  When you set this to true you should also set the AllowCustomerDuplicateEMailAddresses AppConfig parmeter to true, or customers will only be able to purchase once.','false');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'GoogleCheckout.DefaultDomesticShipToCity','GOOGLE CHECKOUT','Used to calculate default shipping rates for merchant calculated shipping in case Google fails to update the shipping rates in real time with the actual customer address.','Wichita');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'GoogleCheckout.DefaultDomesticShipToState','GOOGLE CHECKOUT','Used to calculate default shipping rates for merchant calculated shipping in case Google fails to update the shipping rates in real time with the actual customer address.','KS');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'GoogleCheckout.DefaultDomesticShipToZip','GOOGLE CHECKOUT','Used to calculate default shipping rates for merchant calculated shipping in case Google fails to update the shipping rates in real time with the actual customer address.','67215');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'GoogleCheckout.DefaultDomesticShipToCountry','GOOGLE CHECKOUT','Used to calculate default shipping rates for merchant calculated shipping in case Google fails to update the shipping rates in real time with the actual customer address. Two Letter Code.','US');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'GoogleCheckout.DefaultInternationalShipToCity','GOOGLE CHECKOUT','Used to calculate default shipping rates for merchant calculated shipping in case Google fails to update the shipping rates in real time with the actual customer address.','Norwich');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'GoogleCheckout.DefaultInternationalShipToState','GOOGLE CHECKOUT','Used to calculate default shipping rates for merchant calculated shipping in case Google fails to update the shipping rates in real time with the actual customer address.','--');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'GoogleCheckout.DefaultInternationalShipToZip','GOOGLE CHECKOUT','Used to calculate default shipping rates for merchant calculated shipping in case Google fails to update the shipping rates in real time with the actual customer address.','NR1 3QA');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'GoogleCheckout.DefaultInternationalShipToCountry','GOOGLE CHECKOUT','Used to calculate default shipping rates for merchant calculated shipping in case Google fails to update the shipping rates in real time with the actual customer address. Two Letter Code.','GB');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'GoogleCheckout.CarrierCalculatedShippingEnabled','GOOGLE CHECKOUT','When true, Google Checkout calculates the shipping costs. When false, your store front calculates the shipping costs.','false');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'GoogleCheckout.CarrierCalculatedPackage','GOOGLE CHECKOUT','Carrier Calculated Shipping package dimensions in inches. Example: 10x12x8','10x10x10');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'GoogleCheckout.CarrierCalculatedShippingOptions','GOOGLE CHECKOUT','Comma separated list of Google Checkout Carrier Calculated shipping methods with optional default price. These are case sensitive. The default price can be included with a | (pipe) character and then the amount added after the method name. Valid methods: FedEx 2Day, FedEx Express Saver, FedEx First Overnight, FedEx Ground, FedEx Home Delivery, FedEx Priority Overnight, FedEx Standard Overnight, UPS 2nd Day Air, UPS 2nd Day Air AM, UPS 3 Day Select, UPS Ground, UPS Next Day Air, UPS Next Day Air Early AM, UPS Next Day Air Saver, USPS Express Mail, USPS Media Mail, USPS Parcel Post, USPS Priority Mail','FedEx 2Day|20, FedEx Standard Overnight|30, UPS 2nd Day Air|20, UPS Ground|10, UPS Next Day Air|30, USPS Express Mail|50');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'GoogleCheckout.CarrierCalculatedDefaultPrice','GOOGLE CHECKOUT','Google could display this to the customer if there is a technical problem. Use a large value. Specific default prices may be set with the GoogleCheckout.CarrierCalculatedShippingOptions appconfig. This value will be used for the Options that do not have it specifed within GoogleCheckout.CarrierCalculatedShippingOptions.','50.0');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'GoogleCheckout.CarrierCalculatedFreeOption','GOOGLE CHECKOUT','The shipping method(s) that you want to mark as having free shipping. If more than one, separate with commas. See GoogleCheckout.CarrierCalculatedShippingOptions decription for valid values.','UPS Ground, FedEx Home Delivery');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'GoogleCheckout.ConversionURL','GOOGLE CHECKOUT','Enter the URL used for your third-party conversion tracking. If there are parameters specified in ConversionParameters, those should not appear within this string. It should start with http:// or https://','');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'GoogleCheckout.ConversionParameters','GOOGLE CHECKOUT','This setting is optional depending on the requirements of your conversion tracking service. Enter the Google Checkout parameter name followed by a space and then the name to be used in the url for your conversion tracking service. For instance, if your conversion tracking service has a parameter called amount that corresponds to the merchandise amount you would set this value to order-subtotal amount without the quotes. Multiple parameters should be separated by commas. Valid Google Checkout parameter names are: buyer-id, order-id, order-subtotal, order-subtotal-plus-tax, order-subtotal-plus-shipping, order-total, tax-amount, shipping-amount, coupon-amount, billing-city, billing-region, billing-postal-code, billing-country-code, shipping-city, shipping-region, shipping-postal-code, shipping-country-code','');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'GoogleCheckout.SendStoreReceipt','GOOGLE CHECKOUT','This forces the store to send the store recpeit in addition to the receipt sent out by GoogleCheckout.  In some cases the store receipt has needed information on it that the Google Checkout receipt doesn''t.','false');


INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'UseStrongPwd','GENERAL', 'set to true to enable strong paswords for customers. When true the regular expression stored in the CustomerPwdValidator AppConfig parameter', 'false');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'CustomerPwdValidator','GENERAL','A Regular Expression that is used to validate customer passwords.  Test your expression thoroughly before changing this.','^.*(?=.{8,})(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%\^&\*\(\)_\+\=\-\[\]\{\}\.,<>\?\/\\|~`:;"'']).*$');


GO


/* 6.2.2 added */

INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'ShowCardStartDateFields','MISC','if true, credit card forms will show the Card Start Date, and Card Issue Number fields, used for UK/EU customers.','false');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'ValidateCreditCardNumbers','MISC','if true, a javascript validator will fire on any page that requires entry of a credit card number to try to enforce it is valid.','false');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'QUICKCOMMERCE_X_EMAIL','GATEWAY','Required for AIM Wells Fargo SecureSource Merchants. Leave blank for non Wells Fargo SecureSource users','');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'QUICKCOMMERCE_X_Login','GATEWAY','The login to use if you are using QUICKCOMMERCE. Provided by QUICKCOMMERCE.','');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'QUICKCOMMERCE_X_Tran_Key','GATEWAY','Transaction key provided by QUICKCOMMERCE','');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'QUICKCOMMERCE_X_DELIM_DATA','GATEWAY','Do not change this value. This value is required by AspDotNetStorefront','TRUE');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'QUICKCOMMERCE_X_DELIM_CHAR','GATEWAY','Do not change this value. This value is required by AspDotNetStorefront','|');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'QUICKCOMMERCE_X_ENCAP_CHAR','GATEWAY','Do not change this value. This value is required by AspDotNetStorefront','');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'QUICKCOMMERCE_X_RELAY_RESPONSE','GATEWAY','Do not change this value. This value is required by AspDotNetStorefront','FALSE');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'QUICKCOMMERCE_X_EMAIL_CUSTOMER','GATEWAY','Do not change this value. This value is required by AspDotNetStorefront. We generate our own receipts','FALSE');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'QUICKCOMMERCE_X_METHOD','GATEWAY','Do not change this value. This value is required by AspDotNetStorefront. ','CC');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'QUICKCOMMERCE_X_RECURRING_BILLING','GATEWAY','Do not change this value. This value is required by AspDotNetStorefront. ','FALSE');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'QUICKCOMMERCE_X_VERSION','GATEWAY','Do not change this value. This value is required by AspDotNetStorefront. ','3.1');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'QUICKCOMMERCE_LIVE_SERVER','GATEWAY','Do not change this value','https://secure.authorize.net/gateway/transact.dll');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'QUICKCOMMERCE_TEST_SERVER','GATEWAY','Do not change this value','https://certification.authorize.net/gateway/transact.dll');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'QUICKCOMMERCE_Verify_Addresses','GATEWAY','Set to true if you want their gateway to validate the customer billing address against the credit card. Note that this may decrease fraud, but may also cause valid transactions to go failed, if they have different punctuation than on their credit card.','TRUE');


GO


/* 7.0 added */

INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'MaxBadLogins','SECURITY','The number of failed logins before the customer account is locked out','3')
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'BadLoginLockTimeOut','SECURITY','Sets the amount of time in minutes that an account will be locked out after the MaxBadLogins threshold has been exceeded.  You can set this to zero to disable bad login lockout altogether','30')
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'AdminPwdChangeDays','SECURITY','The number of days between password resets for admins users.','30')
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'Checkout.UseOnePageCheckout','GENERAL','Use single page checkout instead of normal multi-step checkout','false')
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'Checkout.UseOnePageCheckout.UseFinalReviewOrderPage','GENERAL','IF using one page checkout, and IF your order qualifies for one page checkout, this flag indicates whether to take the user to a final "review order" page before sumitting the transaction. if false, they submit the transaction right on the one page checkout page. We do recommend this being true, to allow the customer to review their full final order stats before "charging" them. Some card processors/merchant accounts/ banks may also require this step!','true')
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'TurnOffHtmlEditorInAdminSite','GENERAL','if you do not want to use the Innova HTML editor in your admin site (if it is not understanding your html properly), you can disable it, and show all html enabled fields as simple text areas if you prefer. If fals, the HTML editor will be shown. If true, textarea plain will be shown (you can still enter HTML into the text area)','false')
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'DistributorEMailCC','GENERAL','If you want a copy of distributor notification e-mails sent to another e-mail address (e.g. your e-mail address), enter that e-mail address here','')
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'Admin.ShowSecurityFeed','GENERAL','If you want to show the security panel on the admin home page, leave this value set to true','true')
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'Admin.ShowNewsFeed','GENERAL','If you want to show the news panel on the admin home page, leave this value set to true','true')
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'Admin.ShowSponsorFeed','GENERAL','If you want to show the sponsor panel on the admin home page, leave this value set to true','true')
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'Admin.EntityFrameMenuWidth','GENERAL','The width, in pixels, of the admin site left entity tree pane','350')
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'AddressCCSaltField','HIDDEN','The salt field to use for encrypting the credit card field in the address table, if AppConfig:StoreCCInDB=true also. The allowed values ONLY are one of the following: AddressID, CustomerID','AddressID')
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'OrdersCCSaltField','HIDDEN','The salt field to use for encrypting the credit card field in the orders table, if AppConfig:StoreCCInDB=true also. The allowed values ONLY are one of the following: OrderNumber,OrderGUID,CustomerID,CustomerGUID,EMail','EMail')
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'Web.Config.EncryptionProvider','SECURITY','The encryption provider used to encrypt the web.config.  The allowed values are DataProtectionConfigurationProvider and RsaProtectedConfigurationProvider.  Use RsaProtectedConfigurationProvider is you are running on a web farm.  You will need to create and RSA key container before implementing the RSA encryption provider.','DataProtectionConfigurationProvider');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'HSBC.DocVersion','GATEWAY','Do not change this value','1.0');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'HSBC.ClientID','GATEWAY','Your HSBC Assigned client id. Use only ONE of either the ClientAlias or ClientID. Do NOT fill in both fields. If both are filled in, CLientID is used.','');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'HSBC.ClientAlias','GATEWAY','Your HSBC Assigned client alias. Use only ONE of either the ClientAlias or ClientID. Do NOT fill in both fields. If both are filled in, CLientID is used.','');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'HSBC.ClientName','GATEWAY','Your HSBC Assigned client name (HSBC may call this your User ID)','');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'HSBC.ClientPassword','GATEWAY','Your HSBC Assigned password','');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'HSBC.Pipeline','GATEWAY','Allowed values are Payment or PaymentNoFraud','PaymentNoFraud');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'HSBC.Mode.Test','GATEWAY','Do not change this value unless you know what you are doing, and are working with the HSBC API specifications','R');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'HSBC.Mode.Live','GATEWAY','Do not change this value unless you know what you are doing, and are working with the HSBC API specifications','P');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'HSBC.Test.Server','GATEWAY','The HSBC assigned url to post the transaction to for test mode transactions','https://www.uat.apixml.netq.hsbc.com');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'HSBC.Live.Server','GATEWAY','The HSBC assigned url to post the transaction to for live mode transactions','https://www.uat.apixml.netq.hsbc.com');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'AdminAlert.Message','GENERAL','If you have to present a message to all site visitors, enter it here. You must also then have an invocation of the skin.adminalert.xml.config XmlPackage in your skin file somewhere, or the message will not be displayed. The message is only displayed if not emtpy (blank)','');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'AdminAlert.BackgroundColor','GENERAL','The background color for the admin alert message','FFFF00');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'AdminAlert.FontColor','GENERAL','The text foreground color for the admin alert message','FF0000');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'VAT.Enabled','VAT','Set this to true if you want the store to know about and use EU VAT Tax display costs','false');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'VAT.DefaultSetting','VAT','This sets the default behavior of the storefront for EU customers needing to show prices either VAT inclusive or VAT exclusive. Allowed values are 1 (VAT inclusive) or 2 (VAT exclusive). Enter only a 1 or 2 in the value for this AppConfig','1');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'VAT.AllowCustomerToChooseSetting','VAT','For EU VAT customers, this setting controls whether or not they can on the site choose to view the site in VAT inclusive or VAT exclusive mode for all prices. If false, they will not be able to choose their preference, and the store will force your AppConfig:VAT.DefaultSetting value to be used.','true');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'VAT.CountryID','VAT','This must be set to the CountryID (you can view the country id''s in your admin site under Taxes -> Edit Countries) for your storefront. This is used to set the default country for VAT calculations','0');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'VAT.RoundPerItem','VAT','Turns on rounding of the VAT included price before multiplying by the quantity ordered','false');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'VAT.HideTaxInOrderSummary','VAT','When set to true, the Tax in the order summary on checkout pages will be hidden when customers have VAT inclusive prices enabled ','true');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'ShippingTaxClassID','TAXES','This must match the tax class id of your "shipping"" class, this is sometimes necessary to set tax rates for "shipping" by country, state, or zip','3');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'IPAddress.MaxFailedTransactions','SECURITY','If an IP Address has had more than this number of failed transactions, it will be added to the restricted IP Address list (table) and orders from that IP address will not be allowed. They will not even be sent to the gateway. An "Order Declined, Please Contact Us" message will just be sent back to the user on the site.','5');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'IPAddress.RefuseRestrictedIPsFromSite','SECURITY','if true, then any user that comes from an IP address that is in the RestrictedIP table will be refused to view any page of the site. we fail the page hard with an exception "REFUSED"','true');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'InitializationVector','ENCRYPTION','You can change it if you want, it has to be exactly 16 characters long! It is not needed to protect it''s value that you choose like you will the EncryptKey.','834!#$5dle40m34A');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'EncryptIterations','ENCRYPTION','Enter a number from 1 to 4. 1 is less secure, but faster, 4 is more secure, but slower','2');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'KeySize','ENCRYPTION','Has to be 128, 192, or 256. Lower values are faster, and less secure. Higher values are more secure','256');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'HashAlgorithm','ENCRYPTION','Must be either MD5 or SHA1 (SHA1 is recommended)','SHA1');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'NextKeyChange','ENCRYPTION','DO NOT CHANGE THIS VALUE',convert(varchar(12), dateadd(dy, 90, getdate()), 1));
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'GoogleCheckout.AuthenticateCallback','GOOGLE CHECKOUT','Set this to true to verify http basic authentication on the gcCallback.aspx file.  This should almost never be set to true!','false');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'CYBERSOURCE.merchantID','GATEWAY','your merchant id, which is really your vendor id, call cybersource if unsure','');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'CYBERSOURCE.keysDirectory','GATEWAY','should be full physical file path with ending backslash','');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'CYBERSOURCE.keyFilename','GATEWAY','full file name 1111111.p12 for example','');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'CYBERSOURCE.LiveURL','GATEWAY','Do not change this unless you know what you are doing.','https://ics2ws.ic3.com/commerce/1.x/transactionProcessor');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'CYBERSOURCE.PITURL','GATEWAY','Do not change this unless you know what you are doing.','https://pit.ic3.com/commerce/1.x/transactionProcessor');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'CYBERSOURCE.paCountryCode','GATEWAY','Usually this is blank because Cybersource will have it configured on your account. If Cybersource requests you to send a Country Code for Payer Authorization processing, enter it here.','');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'CYBERSOURCE.paMerchantName','GATEWAY','Usually this is blank because Cybersource will have it configured on your account. If Cybersource requests you to send a Merchant Name for Payer Authorization processing, enter it here.','');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'CYBERSOURCE.paMerchantURL','GATEWAY','Usually this is blank because Cybersource will have it configured on your account. If Cybersource requests you to send a Merchant URL for Payer Authorization processing, enter it here.','');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'CYBERSOURCE.UsePIT','GATEWAY','For VBV PIT Testing. This will force the PITURL to be used for requests instead of the TestURL or LiveURL. This should always be false in production environments.','false');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'CYBERSOURCE.TestURL','GATEWAY','Cybersource gateway test server','https://ics2wstest.ic3.com/commerce/1.x/transactionProcessor');


INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'Search_ShowGenresInResults','SEARCH','if true, then a Genre matches will be shown in the advanced search results','false');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'SearchAdv_ShowGenre','SEARCH','if true, then a Genre filter will be shown in the advanced search page','true');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'Default_GenrePageSize','SITEDISPLAY','The default pagesize for a Genre, when it is first added to the db. After adding, you can edit in the admin site. Set to 0 for no paging (i.e. all products are listed). This value MAY be used by the XmlPackage displaying this page.','20');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'Default_GenreColWidth','SITEDISPLAY','The default ColWidth for a Genre, when it is first added to the db. After adding, you can edit in the admin site. Set to 0 for no paging (i.e. all products are listed). This value MAY be used by the XmlPackage displaying this page.','4');

INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'Tree.ShowGenres','SITEDISPLAY','if you want genres to be shown in the tree, set this to true.','true');

INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'Tree.ShowVectors','SITEDISPLAY','if you want vectors to be shown in the tree, set this to true.','true');

INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'eSelectPlus.store_id','GATEWAY','ESelectPlus Store ID','monusqa002')
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'eSelectPlus.api_token','GATEWAY','ESelectPlus API Token','qatoken')
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'eSelectPlus.host','GATEWAY','ESelectPlus Host','esplusqa.moneris.com')
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'eSelectPlus.commcard_invoice','GATEWAY','ESelectPlus CommCard Invoice','')
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'eSelectPlus.commcard_tax_OrderTotal','GATEWAY','ESelectPlus Tax Order Total','')

INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'AnonCheckoutReqEmail','GENERAL','Boolean value (true or false) that indicates whether anonymous checkout requires email or not.','false');

INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'FedexShipManager.Enabled','SHIPPING','If you are going to use the FedEx shipping manager to process shipments, turn this appconfig on to true. NOTE: this is not for Real Time Rates. Only for processing shipments via FedEx shipping manager','false');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'NewPwdAllowedChars','SECURITY','Used when created new passwords via the request new password function on the signin page','abcdefghijkmnopqrstuvwxyzABCDEFGHJKLMNOPQRSTUVWXYZ23456789~!@#$%&*');


INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'IATS.URL','GATEWAY','The web site url for the IATS ticketmaster payment gateway','www.iats.ticketmaster.com');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'IATS.AgentCode','GATEWAY','Your IATS ticketmaster payment gateway assigned Agent Code','');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'IATS.Password','GATEWAY','Your IATS ticketmaster payment gateway assigned password','');

INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'TemplateSwitching.Enabled','DISPLAY','If you want to enable template file switching by entity, set this flag to true. You can then assign a template.ascx file to each entity (category, section, etc) that you want. The template.ascx file you assign to each entity must exist in the active skin folder (e.g. skins/skin_1).','false');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'TurnOffStoreAdminEMailNotifications','MISC','If false, the store admin will receive a "new order notification" e-mail from the storefront. If true, no e-mail will be sent to the store admin. Customers will also continue to receive their e-mail receipts no matter what this AppConfig value is set to!','false');

INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'PinnaclePayments.UserName','GATEWAY','Your Pinnacle Payments SmartPayment assigned account username','TestTerminal');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'PinnaclePayments.Password','GATEWAY','Your Pinnacle Payments SmartPayment assigned account password','TestPass');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'PinnaclePayments.SOAPURL','GATEWAY','Your Pinnacle Payments SmartPayment assigned gateway URL','https://www.ppscommerce.net/SmartPayments/transact.asmx');

INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'AllowAddressChangeOnCheckoutShipping','MISC','If true, the customer will be allowed to select or add a new address easily on the checkout shipping page. If false, they must go through their address book to make address changes.','false');

INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'VerifyAddressesProvider','ADMIN','Leave blank if you do not want to verify addresses. Otherwise set it to "usps" and make sure the VerifyAddressesProvider.USPS server and userid are set.','');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'VerifyAddressesProvider.USPS.Server','ADMIN','USPS server URL for the Verify Address API','http://production.shippingapis.com/shippingapi.dll');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'VerifyAddressesProvider.USPS.UserID','ADMIN','USPS userid for the Verify Address API','');

-- v7.0.1.0 added:
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'CardiaServices.Test.MerchantToken','GATEWAY','Your Cardia Services assigned test mode merchant token','');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'CardiaServices.Live.MerchantToken','GATEWAY','Your Cardia Services assigned live mode merchant token','');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'CardiaServices.Test.UserToken','GATEWAY','Your Cardia Services assigned live mode user token','');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'CardiaServices.Live.UserToken','GATEWAY','Your Cardia Services assigned test mode user token','');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'CardiaServices.SOAPURL','GATEWAY','Cardia Services gateway URL.  DO NOT change this unless instructed to do so!','https://secure.cardia.no/Service/Card/Transaction/1.2/Transaction.asmx');
 
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'eWay.Test.CustomerID','GATEWAY','Your eWay assigned test mode Customer ID','');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'eWay.Live.CustomerID','GATEWAY','Your eWay assigned live mode Customer ID','');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'eWay.Test.URL','GATEWAY','Your eWay assigned gateway test mode posting URL. NOTE: eWay gateway only supports AUTH CAPTURE. Delayed CAPTURE, VOID, and REFUND are not supported via their Xml API.','https://www.eway.com.au/gateway_cvn/xmltest/TestPage.asp');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'eWay.Live.URL','GATEWAY','Your eWay assigned gateway live mode posting URL. NOTE: eWay gateway only supports AUTH CAPTURE. Delayed CAPTURE, VOID, and REFUND are not supported via their Xml API.','https://www.eway.com.au/gateway_cvn/xmlpayment.asp');

INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'ShowFullNewsArticle','GENERAL','If true the entire news article text will be displayed on the news.aspx page, if false then only a link to the article is displayed and the user has to click the link to view the entire article','false');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'NewsTeaser','GENERAL','Displayed at the top of the news page','');

-- v7.0.1.0 added:
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'BulkImportSendsShipmentNotifications','SHIPPING','If true, then when bulk importing shipments that are not voided, shipped notification emails will be sent to the customers of the orders whose shipments were imported.','true');

INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'Polls.Enabled','MISC','If true, Poll tokens will be supported by the parser object','false');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'EntitySelectLists.Enabled','MISC','If true, Entity Select List (e.g. (!CATEGORY_SELECT_LIST!) tokens will be supported by the parser object','false');

INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'DefaultCustomerLevelID','MISC','the default customer level (int) to be used on new customer records','0');

INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'BreadcrumbSeparator','MISC','This is the separator character(s) used when building up breadcrumbs on entity and product pages.','&rarr;');

INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'USAePay.Test.SourceKey','GATEWAY','The test USA ePay source key','dgb8otyulg26vm2hYiF8b2q6P7091681');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'USAePay.Test.Pin','GATEWAY','The test USA ePay pin','ABA123');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'USAePay.Live.SourceKey','GATEWAY','Your live USA ePay source key, assigned to you by USA ePay','');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'USAePay.Live.Pin','GATEWAY','Your live USA ePay pin, assigned to you by USA ePay','');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'USAePay.Description','GATEWAY','this is the value passed to USAePay to describe every transaction','AspDotNetStorefront Order');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'USAePay.Declined','GATEWAY','Message to be used if the card is declined by the gateway','The Transaction Was Declined');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'USAePay.TransactionError','GATEWAY','Message to be used if there is an unknown transaction error from the USA ePay gateway','Unknown Error on USAePay Gateway');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'USAePay.ConnectionError','GATEWAY','Message to be used if we cannot get a connection to the USA ePay gateway','Could not connect to USAePay Gateway');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'USAePay.UseSandBox','GATEWAY','Allows customers to test against their sandbox environment','false');

INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'SagePayUK.UseSimulator','GATEWAY','Set to true to use the Simulator URLs. This overrides both the Live and Test URLs.','false');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'SagePayUK.Vendor','GATEWAY','Your Vendor name supplied by Sage Pay.','');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'SagePayUKURL.Live.Abort','GATEWAY','Do not change this unless you know what you are doing.','https://live.sagepay.com/gateway/service/abort.vsp');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'SagePayUKURL.Live.Callback','GATEWAY','Do not change this unless you know what you are doing.','https://live.sagepay.com/gateway/service/direct3dcallback.vsp');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'SagePayUKURL.Live.Purchase','GATEWAY','Do not change this unless you know what you are doing.','https://live.sagepay.com/gateway/service/vspdirect-register.vsp');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'SagePayUKURL.Live.Refund','GATEWAY','Do not change this unless you know what you are doing.','https://live.sagepay.com/gateway/service/refund.vsp');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'SagePayUKURL.Live.Release','GATEWAY','Do not change this unless you know what you are doing.','https://live.sagepay.com/gateway/service/release.vsp');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'SagePayUKURL.Simulator.Abort','GATEWAY','Do not change this unless you know what you are doing.','https://ukvpstest.protx.com/VSPSimulator/VSPServerGateway.asp?service=VendorAbortTx');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'SagePayUKURL.Simulator.Callback','GATEWAY','Do not change this unless you know what you are doing.','https://ukvpstest.protx.com/VSPSimulator/VSPDirectCallback.asp');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'SagePayUKURL.Simulator.Purchase','GATEWAY','Do not change this unless you know what you are doing.','https://ukvpstest.protx.com/VSPSimulator/VSPDirectGateway.asp');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'SagePayUKURL.Simulator.Refund','GATEWAY','Do not change this unless you know what you are doing.','https://ukvpstest.protx.com/VSPSimulator/VSPServerGateway.asp?service=VendorRefundTx');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'SagePayUKURL.Simulator.Release','GATEWAY','Do not change this unless you know what you are doing.','https://ukvpstest.protx.com/VSPSimulator/VSPServerGateway.asp?service=VendorReleaseTx');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'SagePayUKURL.Test.Abort','GATEWAY','Do not change this unless you know what you are doing.','https://test.sagepay.com/gateway/service/abort.vsp');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'SagePayUKURL.Test.Callback','GATEWAY','Do not change this unless you know what you are doing.','https://test.sagepay.com/gateway/service/direct3dcallback.vsp');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'SagePayUKURL.Test.Purchase','GATEWAY','Do not change this unless you know what you are doing.','https://test.sagepay.com/gateway/service/vspdirect-register.vsp');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'SagePayUKURL.Test.Refund','GATEWAY','Do not change this unless you know what you are doing.','https://test.sagepay.com/gateway/service/refund.vsp');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'SagePayUKURL.Test.Release','GATEWAY','Do not change this unless you know what you are doing.','https://test.sagepay.com/gateway/service/release.vsp');

INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'InternationalCheckout.Enabled','MISC','if true, internationalcheckout.com button will be visible on your shopping cart page. You must sign up separately for an account from International Checkout if you want to use this feature.','false');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'InternationalCheckout.StoreID','MISC','if true and InternationalCheckout is enabled, enter your InternationalCheckout.com assigned storeid here (e.g. store123)','');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'InternationalCheckout.ForceForInternationalCustomers','MISC','if true and InternationalCheckout is enabled, and the customer''s address is outside the U.S., their only checkout button will be the InternationalCheckout button. See AppConfig:InternationalCheckout.Enabled appconfig also.','false');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'InternationalCheckout.TestMode','MISC','if true and InternationalCheckout is enabled, you can set this to true to see the form that is submitted to InternationalCheckout before the submission. This can help during debug/development mode','true');

INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'Recurring.AUTHORIZENET_AUTOBILL_TEST_SERVER','GATEWAY','Do not change this value unless instructed by Authorize.net or our support group','https://apitest.authorize.net/xml/v1/request.api');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'Recurring.AUTHORIZENET_AUTOBILL_LIVE_SERVER','GATEWAY','Do not change this value unless instructed by Authorize.net or our support group','https://api.authorize.net/xml/v1/request.api');

INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'ZipCodePrefixLength','SHIPPING', 'Sets the length used to macth zip code prefixes when matching shipping zones', '3');

INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'ShippingTrackingCarriers','SHIPPING','Comma delimited list of Carriers that have tracking numbers that can be matched. These values must match up with corresponding ShippingTrackingURL and ShippingTrackingRegEx AppConfig variables.','UPS,USPS,FedEx,DHL,AusPost,ParcelForce');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'ShippingTrackingRegEx.AusPost','SHIPPING','Australia Post Tracking Number Match Regular Expression','^[0-9A-Z]{8}$');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'ShippingTrackingURL.AusPost','SHIPPING','Australia Post URL for generating package tracking link. You must include the {0} placeholder at the location in the link that the tracking number should be inserted.','http://platinum.auspost.com.au/scripts/cgiip.exe/WService=wtsaae/ap_inquiryresults.w?inquirynumber={0}');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'ShippingTrackingRegEx.DHL','SHIPPING','DHL Tracking Number Match Regular Expression','^\d{10,11}$');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'ShippingTrackingURL.DHL','SHIPPING','DHL URL for generating package tracking link. You must include the {0} placeholder at the location in the link that the tracking number should be inserted.','http://track.dhl-usa.com/atrknav.asp?ShipmentNumber={0}');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'ShippingTrackingRegEx.FedEx','SHIPPING','FedEx Tracking Number Match Regular Expression','^\d{12,19}$');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'ShippingTrackingURL.FedEx','SHIPPING','FedEx URL for generating package tracking link. You must include the {0} placeholder at the location in the link that the tracking number should be inserted.','http://www.fedex.com/Tracking?tracknumbers={0}');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'ShippingTrackingRegEx.UPS','SHIPPING','UPS Tracking Number Match Regular Expression','^(1Z)');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'ShippingTrackingURL.UPS','SHIPPING','UPS URL for generating package tracking link. You must include the {0} placeholder at the location in the link that the tracking number should be inserted.','http://wwwapps.ups.com/WebTracking/processInputRequest?sort_by=status&tracknums_displayed=1&TypeOfInquiryNumber=T&loc=en_US&InquiryNumber1={0}&track.x=0&track.y=0');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'ShippingTrackingRegEx.USPS','SHIPPING','USPS Tracking Number Match Regular Expression','^\d{22}|[0-9A-Z]{11}US$');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'ShippingTrackingURL.USPS','SHIPPING','USPS URL for generating package tracking link. You must include the {0} placeholder at the location in the link that the tracking number should be inserted.','http://trkcnfrm1.smi.usps.com/PTSInternetWeb/InterLabelInquiry.do?origTrackNum={0}');

INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'PayFlowPro.PARTNER','GATEWAY','If using PayPal PayFlow PRO merchant gateway, this is the partner value assigned by the bank.','');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'PayFlowPro.PWD','GATEWAY','If using PayPal PayFlow PRO merchant gateway, this is the password value assigned by the bank.','');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'PayFlowPro.USER','GATEWAY','If using PayPal PayFlow PRO merchant gateway, this is the username value assigned by the bank.','');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'PayFlowPro.VENDOR','GATEWAY','If using PayPal PayFlow PRO merchant gateway, this is the vendor value assigned by the bank.','');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'PayFlowPro.LiveURL','GATEWAY','Do not change this unless you know what you are doing.','https://payflowpro.paypal.com');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'PayFlowPro.TestURL','GATEWAY','Do not change this unless you know what you are doing.','https://pilot-payflowpro.paypal.com');


GO


/* 7.0.2.0 added */

INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'UseImageResize','IMAGERESIZE','Determines whether image resizing will be used.  This can be overridden in any of the size configs through use of the attribute resize (i.e resize:false;).','true')
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'ProductImg_icon','IMAGERESIZE','Sets the specifications for the product icon image.  Valid attributes are width(int), height(int), quality(int), stretch(true or false), fill(color string with #), crop(true or false), cropv(top,bottom, or middle), and croph(left,right, or center).  All attributes are optional and if not specified will use the values from the default-configs.','width:150;height:150;')
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'ProductImg_medium','IMAGERESIZE','Sets the specifications for the product medium image.  Valid attributes are width(int), height(int), quality(int), stretch(true or false), fill(color string with #), crop(true or false), cropv(top,bottom, or middle), and croph(left,right, or center).  All attributes are optional and if not specified will use the values from the default-configs.','width:250;height:250;')
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'ProductImg_large','IMAGERESIZE','Sets the specifications for the product large image.  Valid attributes are width(int), height(int), quality(int), stretch(true or false), fill(color string with #), crop(true or false), cropv(top,bottom, or middle), croph(left,right, or center), largecreates(true or false), and largeoverwrites(true or false).  All attributes are optional and if not specified will use the values from the default-configs.','width:500;height:500;')
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'ProductImg_swatch','IMAGERESIZE','Sets the specifications for the product swatch image if uploaded manually.  Valid attributes are width(int), height(int), quality(int), stretch(true or false), fill(color string with #), crop(true or false), cropv(top,bottom, or middle), and croph(left,right, or center).  All attributes are optional and if not specified will use the values from the default-configs.','width:150;height:50;')
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'VariantImg_icon','IMAGERESIZE','Sets the specifications for the variant icon image.  Valid attributes are width(int), height(int), quality(int), stretch(true or false), fill(color string with #), crop(true or false), cropv(top,bottom, or middle), and croph(left,right, or center).  All attributes are optional and if not specified will use the values from the default-configs.','width:150;height:150;')   
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'VariantImg_medium','IMAGERESIZE','Sets the specifications for the variant medium image.  Valid attributes are width(int), height(int), quality(int), stretch(true or false), fill(color string with #), crop(true or false), cropv(top,bottom, or middle), and croph(left,right, or center).  All attributes are optional and if not specified will use the values from the default-configs.','width:250;height:250;')
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'VariantImg_large','IMAGERESIZE','Sets the specifications for the variant large image.  Valid attributes are width(int), height(int), quality(int), stretch(true or false), fill(color string with #), crop(true or false), cropv(top,bottom, or middle), and croph(left,right, or center), largecreates(true or false), and largeoverwrites(true or false).  All attributes are optional and if not specified will use the values from the default-configs.','width:500;height:500;')
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'CategoryImg_icon','IMAGERESIZE','Sets the specifications for the category icon image.  Valid attributes are width(int), height(int), quality(int), stretch(true or false), fill(color string with #), crop(true or false), cropv(top,bottom, or middle), croph(left,right, or center).  All attributes are optional and if not specified will use the values from the default-configs.','width:150;height:150;')
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'CategoryImg_medium','IMAGERESIZE','Sets the specifications for the category medium image.  Valid attributes are width(int), height(int), quality(int), stretch(true or false), fill(color string with #), crop(true or false), cropv(top,bottom, or middle), and croph(left,right, or center).  All attributes are optional and if not specified will use the values from the default-configs.','width:250;height:250;')
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'CategoryImg_large','IMAGERESIZE','Sets the specifications for the category large image.  Valid attributes are width(int), height(int), quality(int), stretch(true or false), fill(color string with #), crop(true or false), cropv(top,bottom, or middle), croph(left,right, or center), largecreates(true or false), and largeoverwrites(true or false).  All attributes are optional and if not specified will use the values from the default-configs.','width:500;height:500;')
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'ManufacturerImg_icon','IMAGERESIZE','Sets the specifications for the manufacturer icon image.  Valid attributes are width(int), height(int), quality(int), stretch(true or false), fill(color string with #), crop(true or false), cropv(top,bottom, or middle), and croph(left,right, or center).  All attributes are optional and if not specified will use the values from the default-configs.','width:150;height:150;')
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'ManufacturerImg_medium','IMAGERESIZE','Sets the specifications for the manufacturer medium image.  Valid attributes are width(int), height(int), quality(int), stretch(true or false), fill(color string with #), crop(true or false), cropv(top,bottom, or middle), and croph(left,right, or center).  All attributes are optional and if not specified will use the values from the default-configs.','width:250;height:250;')
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'ManufacturerImg_large','IMAGERESIZE','Sets the specifications for the manufacturer large image.  Valid attributes are width(int), height(int), quality(int), stretch(true or false), fill(color string with #), crop(true or false), cropv(top,bottom, or middle), croph(left,right, or center), largecreates(true or false), and largeoverwrites(true or false).  All attributes are optional and if not specified will use the values from the default-configs.','width:500;height:500;')
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'SectionImg_icon','IMAGERESIZE','Sets the specifications for the department icon image.  Valid attributes are width(int), height(int), quality(int), stretch(true or false), fill(color string with #), crop(true or false), cropv(top,bottom, or middle), and croph(left,right, or center).  All attributes are optional and if not specified will use the values from the default-configs.','width:150;height:150;')
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'SectionImg_medium','IMAGERESIZE','Sets the specifications for the department medium image.  Valid attributes are width(int), height(int), quality(int), stretch(true or false), fill(color string with #), crop(true or false), cropv(top,bottom, or middle), and croph(left,right, or center).  All attributes are optional and if not specified will use the values from the default-configs.','width:250;height:250;')
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'SectionImg_large','IMAGERESIZE','Sets the specifications for the department large image.  Valid attributes are width(int), height(int), quality(int), stretch(true or false), fill(color string with #), crop(true or false), cropv(top,bottom, or middle), croph(left,right, or center), largecreates(true or false), and largeoverwrites(true or false).  All attributes are optional and if not specified will use the values from the default-configs.','width:500;height:500;')
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'DistributorImg_icon','IMAGERESIZE','Sets the specifications for the distributor icon image.  Valid attributes are width(int), height(int), quality(int), stretch(true or false), fill(color string with #), crop(true or false), cropv(top,bottom, or middle), and croph(left,right, or center).  All attributes are optional and if not specified will use the values from the default-configs.','width:150;height:150;')
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'DistributorImg_medium','IMAGERESIZE','Sets the specifications for the distributor medium image.  Valid attributes are width(int), height(int), quality(int), stretch(true or false), fill(color string with #), crop(true or false), cropv(top,bottom, or middle), and croph(left,right, or center).  All attributes are optional and if not specified will use the values from the default-configs.','width:250;height:250;')
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'DistributorImg_large','IMAGERESIZE','Sets the specifications for the distributor large image.  Valid attributes are width(int), height(int), quality(int), stretch(true or false), fill(color string with #), crop(true or false), cropv(top,bottom, or middle), croph(left,right, or center), largecreates(true or false), and largeoverwrites(true or false).  All attributes are optional and if not specified will use the values from the default-configs.','width:500;height:500;')
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'LargeCreatesOthers','IMAGERESIZE','Determines whether an uploaded large image will create the icon and medium images.  This value can be over written in each of the size-configs through use of the attribute largecreates (i.e. largecreates:false;).','true')
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'LargeOverwritesOthers','IMAGERESIZE','Determines whether an uploaded large image will create AND overwrite existing icon and medium images.  This value can be over written in each of the size-configs through use of the attribute largeoverwrites (i.e. largeoverwrites:false;).','true')
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'DefaultCrop','IMAGERESIZE','true or false.  You can leave the crop attribute out of all size-configs and cropping will be determined according to this value.  If you use the crop attribute in the other appconfigs (i.e crop:false;) it will take precedence over this value.  This value should NOT be left blank.','true')
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'DefaultCropVertical','IMAGERESIZE','top, bottom, or middle.  The vertical anchor point when cropping will default to this unless otherwise specified in the size-configs (i.e cropv:top).','middle')
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'DefaultCropHorizontal','IMAGERESIZE','left, right, or center.  The horizontal anchor point when cropping will default to this unless otherwise specified in the size-configs (i.e croph:left).','center')
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'DefaultFillColor','IMAGERESIZE','Default fill color to be used if fill attribute is left out of the other size-configs (i.e fill:#00FF00;).','#FFFFFF')
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'DefaultQuality','IMAGERESIZE','Default quality if quality attribute is not used in other size-configs (i.e. quality:75;).','100')
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'DefaultStretch','IMAGERESIZE','Default stretch value if stretch attribute is not specified in other size-configs (i.e. stretch:false).  Stretch is the value that determines whether a smaller, uploaded image will stretch to fill a largeer, resized destination image.','true')
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'DefaultWidth_icon','IMAGERESIZE','Default width of an icon image if no width attribute is specified in the other size-configs (i.e. width:50;).  This value should NOT be left blank.','150')
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'DefaultHeight_icon','IMAGERESIZE','Default height of an icon image if no width attribute is specified in the other size-configs (i.e. width:50;).  This value should NOT be left blank.','150')
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'DefaultWidth_medium','IMAGERESIZE','Default width of a medium image if no width attribute is specified in the other size-configs (i.e. width:50;).  This value should NOT be left blank.','250')
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'DefaultHeight_medium','IMAGERESIZE','Default height of a medium image if no width attribute is specified in the other size-configs (i.e. width:50;).  This value should NOT be left blank.','250')
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'DefaultWidth_large','IMAGERESIZE','Default width of a large image if no width attribute is specified in the other size-configs (i.e. width:50;).  This value should NOT be left blank.','500')
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'DefaultHeight_large','IMAGERESIZE','Default height of a large image if no width attribute is specified in the other size-configs (i.e. width:50;).  This value should NOT be left blank.','500')
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'MultiColorMakesSwatchAndMap','IMAGERESIZE','If true, when uploading images in the medium multi-image manager the store will create a single swatch image that is composed of all of your images.  The width and height specified in SwatchStyleAuto are the width and height for each smaller portion of the swatch image and they will be joined into 1 image that is width x number of colors wide and height high.  This will also create the swatch map code for you and insert it into the database.','false')
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'MultiMakesMicros','IMAGERESIZE','If true this will create micro images resized by the width and height specified in MicroStyle and will save them in the images/product/micro folder whenever you are uploading multiple images in the medium multi-image manager.  If a product has multi-images and UseImagesForMultiNav is true then images will be shown instead of the number icons.','true')
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'MicroStyle','IMAGERESIZE','Attributes used for MultiMakesMicros.  The cols colspacing, and rowspacing attributes are used to determine how many images can appear in each row and how much space (in pixels) is between each image while the width and height determine the resized micro height.','width:40;height:40;cols:5;colspacing:5;rowspacing:5;')
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'SwatchStyleAuto','IMAGERESIZE','Attributes used for MultiColorMakesSwatchAndMap.  Valid attributes are width, and height.','width:25;height:25;')
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'UseImagesForMultiNav','IMAGERESIZE','If true micro images will be used instead of the number icons when multiple images exist in the multi-image manager.','false')
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'UseRolloverForMultiNav','IMAGERESIZE','If true and UseImagesForMultiNav is true then the medium image will change when you rollover the micro images instead of when you click on them.','false')
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'MultiImage.UseProductIconPics','IMAGERESIZE','','false')
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'ApplyShippingHandlingExtraFeeToFreeShipping','SHIPPING','If true and ShippingHandlingExtraFee is non-zero, then the ShippingHandlingExtraFee will be applied to the shipping cost even when its $0.00.  If false...then it will not be applied with the shipping cost is $0.00','false')
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'SubscriptionExpiredGracePeriod','MISC','Number of days before expired subscriptions are enforced and customer loses access.','0');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'Recurring.GatewayImportOffsetHours','MISC','Hours to offset the reporting date from midnight. If you want the report to run through 6:00 AM then set this value to 6.','0');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'Recurring.GatewayLastImportedDate','MISC','Time stamp for last Gateway Import. This value is automatically updated.','');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'SecureNet.ID','GATEWAY','Your SecurenetID supplied by SecureNet.','');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'SecureNet.Key','GATEWAY','Your SecureKey supplied by SecureNet.','');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'SecureNet.LiveURL','GATEWAY','SecureNet Gateway Web Service API endpoint for Live transactions.','https://gateway.securenet.com/payment.asmx');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'SecureNet.TestURL','GATEWAY','SecureNet Gateway Web Service API endpoint for Test transactions.','https://certify.securenet.com/payment.asmx');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values (1,'FreeShippingAllowsRateSelection','SHIPPING','Set to true to allow customers to select a shipping method other than the free method if they want to pay for faster delivery or a different shipping method when the order does not consist of all download items.  Leave false to force the free shipping method...the customer will not be able to choose a different method.','false')
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values (1,'OrderEditingEnabled','ADMIN','If true, customers and admin users can edit orders, assuming those orders meet state critieria for being editable','false')
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'Ogone.PSPID','GATEWAY','Ogone PSPID','');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'Ogone.USERID','GATEWAY','Ogone USERID for DirectLink access.','');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'Ogone.PSWD','GATEWAY','Ogone password for the USERID user.','');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'Ogone.SHASignature','GATEWAY','Must match SHA-1 Signature setting in Ogone account configuration.','');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'Ogone.LivePostURL','GATEWAY','Live mode URL for 3-Tier e-Commerce new order FORM POST.','https://secure.ogone.com/ncol/prod/orderstandard.asp');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'Ogone.TestPostURL','GATEWAY','Test mode URL for 3-Tier e-Commerce new order FORM POST.','https://secure.ogone.com/ncol/test/orderstandard.asp');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'Ogone.LiveServerOrder','GATEWAY','Live mode URL for DirectLink new order requests.','https://secure.ogone.com/ncol/prod/orderdirect.asp');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'Ogone.TestServerOrder','GATEWAY','Test mode URL for DirectLink new order requests.','https://secure.ogone.com/ncol/test/orderdirect.asp');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'Ogone.LiveServer','GATEWAY','Live mode URL for DirectLink maintenance requests.','https://secure.ogone.com/ncol/prod/maintenancedirect.asp');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'Ogone.TestServer','GATEWAY','Test mode URL for DirectLink maintenance requests.','https://secure.ogone.com/ncol/test/maintenancedirect.asp');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'Ogone.Use3TierMode','GATEWAY','Default behavior is to use DirectLink for new orders, if you want to use 3-Tier e-Commerce then set this to true. This is not supported when using one page checkout. You must configure Post payment feedback on Ogone.com pointing to ogone_postsale.aspx.','false');


-- new AppConfigs for Canada Post and DHL Domestic and International
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values (0,'TaxCalcMode','TAX','Determines if tax calculation is based on shipping address or billing address.  Allowed values are "shipping" and "billing"','shipping');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'eSelectPlus.country','GATEWAY','eSelectPlus API country code. Either US or CA','US');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'eSelectPlus.URL.CA.Live','GATEWAY','eSelectPlus XML API URL for Live mode CA','https://www3.moneris.com/gateway2/servlet/MpgRequest');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'eSelectPlus.URL.CA.LiveMPI','GATEWAY','eSelectPlus MPI API URL for Live mode CA','https://www3.moneris.com/mpi/servlet/MpiServlet');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'eSelectPlus.URL.CA.Test','GATEWAY','eSelectPlus XML API URL for Test mode CA','https://esqa.moneris.com/gateway2/servlet/MpgRequest');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'eSelectPlus.URL.CA.TestMPI','GATEWAY','eSelectPlus MPI API URL for Test mode CA','https://esqa.moneris.com/mpi/servlet/MpiServlet');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'eSelectPlus.URL.US.Live','GATEWAY','eSelectPlus XML API URL for Live mode US','https://esplus.moneris.com/gateway_us/servlet/MpgRequest');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'eSelectPlus.URL.US.LiveMPI','GATEWAY','eSelectPlus MPI API URL for Live mode US','https://esplus.moneris.com/mpi/servlet/MpiServlet');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'eSelectPlus.URL.US.Test','GATEWAY','eSelectPlus XML API URL for Test mode US','https://esplusqa.moneris.com/gateway_us/servlet/MpgRequest');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'eSelectPlus.URL.US.TestMPI','GATEWAY','eSelectPlus MPI API URL for Test mode US','https://esplusqa.moneris.com/mpi/servlet/MpiServlet');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'eSelectPlus.api_token.Test','GATEWAY','eSelectPlus API Token for Test mode','qatoken');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'eSelectPlus.store_id.Test','GATEWAY','eSelectPlus Store ID for Test mode','monusqa002');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'eSelectPlus.api_token.Live','GATEWAY','eSelectPlus API Token for Live mode','');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'eSelectPlus.store_id.Live','GATEWAY','eSelectPlus Store ID for Live mode','');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'eSelectPlus.crypt','GATEWAY','eSelectPlus Default Crypt Value','7');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'eSelectPlus.includeAVS','GATEWAY','eSelectPlus control of sending AVS data to gateway. True sends AVS, False does not send AVS.','true');
INSERT INTO AppConfig (SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'BuySafe.Enabled', 'buySAFE','This flag enables buySAFE features once you have signed up with buySAFE. Refer to http://www.buysafe.com for more information.', 'false')
INSERT INTO AppConfig (SuperOnly,Name,GroupName,Description,ConfigValue) VALUES(1,'BuySafe.Username', 'buySAFE', 'MSP username from buySAFE. Do NOT change unless you are instructed, as this may invalidate your buySAFE features if you are using them', 'aspdotnetstorefront')
INSERT INTO AppConfig (SuperOnly,Name,GroupName,Description,ConfigValue) VALUES(1,'BuySafe.Password', 'buySAFE', 'MSP password from buySAFE.Do NOT change unless you are instructed, as this may invalidate your buySAFE features if you are using them', '96736ADD-ECC8-4FD2-9525-9FD9449CC95F')
INSERT INTO AppConfig (SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'BuySafe.MspId', 'buySAFE', 'MSP identifier from buySAFE. Do NOT change unless you are instructed, as this may invalidate your buySAFE features if you are using them', '8')
INSERT INTO AppConfig (SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'BuySafe.Hash', 'buySAFE', 'Enter your buySAFE assigned publich hash code here, This value is provided to you when you sign up for buySAFE', '')
INSERT INTO AppConfig (SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'BuySafe.StoreToken', 'buySAFE', 'Enter your Store Token assigned to you by buySAFE. This value is provided to you when you sign up for buySAFE', '')
INSERT INTO AppConfig (SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'BuySafe.JsUrl', 'buySAFE', 'URL to buySAFE''s javascript. Do NOT change unless you are instructed, as this may invalidate your buySAFE features if you are using them', 'https://seal.buysafe.com/private/rollover/rollover.js')
INSERT INTO AppConfig (SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'BuySafe.RegUrl', 'buySAFE', 'The buySAFE registration page URL. Do NOT change unless you are instructed, as this may invalidate your buySAFE features if you are using them', 'https://www.buysafe.com/web/login/registrationoptions.aspx')
INSERT INTO AppConfig (SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'BuySafe.InvitationCode', 'buySAFE', 'AspDotNetStorefront reg code. Do NOT change unless you are instructed, as this may invalidate your buySAFE features if you are using them', 'offerASPDOTNET')
INSERT INTO AppConfig (SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'BuySafe.SealSize', 'buySAFE', 'Specifies the size of the buySAFE seal graphic used, when buySAFE is enabled. Allowed values are: Small, Medium, Large, and Persistent. To use a small seal, set this value to small. The size of seal you should use is dependent on the structure of your skin, and where you have this seal appear', 'Small')
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'HSBC.CcpaURL','GATEWAY','HSBC URL for client form post when using Payer Authentication.','https://www.ccpa.hsbc.com/ccpa');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'HSBC.CcpaClientID','GATEWAY','HSBC merchant identifier for Payer Authentication. Typically of the format UK12345678CUR01 (15 characters). See also AppConfig 3DSecure.CreditCardTypeIDs.','');

INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'ShowEditButtonInCartForKitProducts','MISC','If true, an edit button will be shown in the shopping cart next to kit products, allowing customers to edit/change them','true');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'ShowEditButtonInCartForPackProducts','MISC','If true, an edit button will be shown in the shopping cart next to pack products, allowing customers to edit/change them','true');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'ShowEditButtonInCartForRegularProducts','MISC','If true, an edit button will be shown in the shopping cart next to regular (non kit or pack) products, allowing customers to edit/change them','false');

INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'Zoomify.Active','SITEDISPLAY','Enable display of Zoomify Viewer when Zoomify image content is available.','false');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'Zoomify.GalleryMedium','SITEDISPLAY','Enable Zoomify content for medium product gallery images using the standard LookupProductImage function within XmlPackages.','true');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'Zoomify.Large.Height','SITEDISPLAY','Large Zoomify Viewer Height','500');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'Zoomify.Large.Width','SITEDISPLAY','Large Zoomify Viewer Width','500');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'Zoomify.Medium.Height','SITEDISPLAY','Medium Zoomify Viewer Height','250');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'Zoomify.Medium.Width','SITEDISPLAY','Medium Zoomify Viewer Width','250');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'Zoomify.ProductLarge','SITEDISPLAY','Enable Zoomify content for large product images using the standard LookupProductImage function within XmlPackages.','true');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'Zoomify.ProductMedium','SITEDISPLAY','Enable Zoomify content for medium product images using the standard LookupProductImage function within XmlPackages.','true');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'CardinalCommerce.Centinel.TransactionPwd','CARDINAL','Your Cardinal Centinel Assigned Transaction Password.','');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'CardinalCommerce.Centinel.MyECheckMarkAsCaptured','CARDINAL','When false the order must be marked as Captured manually upon review and approval in the store admin. If true then new orders with Cardinal MyECheck will immediately be marked as Captured. This should only be set to true if you are subscribed with the MyECheck payment guarantee service.','false');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'Shipwire.Username','SHIPPING','Your Shipwire Username, provided by Shipwire. Typically the email address you used when you signed-up. ','');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'Shipwire.Password','SHIPPING','Your Shipwire Password, provided by Shipwire.','');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'Google.AnalyticsAccount','MISC','The google tracking account to be used with the google analytics tracking javascript code (ga.js).  This does not apply to the urchin tracking javascript code (urchin.js).','');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'Google.EcomOrderTrackingEnabled','MISC','Determines whether the google ecommerce tracking version 2 code is fired on the order confirmation.  If this AppConfig is disabled, the GOOGLE_ECOM_TRACKING_V2 token will still function, however order details will not be sent to google.','false');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'AuditLog.Enabled','MISC','Set to true to log actions affecting a customer order. The log is viewable by following the link on the Customer History page. (Currently only Recurring Orders are implemented.)','false');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'Admin_OrderStatisticIsChart','ADMIN','If true, the order statistics on the admin home page will display as a chart.  If false, they will be in a table.','true');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0, 'CacheEntityPageHTML', 'GENERAL', 'if true, this enables HTML caching of your category, section (department) and manufacturer pages. You can use this setting in most cases, as long as you are not doing real time inventory updates (to the minute) or other specific entity page product filtering', 'false')
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1, 'NumPreviouslyUsedPwds', 'SECURITY', 'Prevents admin users from re-using any of the specified number of previously used passwords, the PA-DSS requirement is 4.', '4')
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'ShowShippingAndTaxEstimate','SHIPPING','If ShowShippingAndTaxEstimate is set to true, the Shipping and Tax Estimator control will show in ShoppingCart pages','true');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'DisallowAnonCustomerToCreateWishlist','ADMIN','If this is set to true, customers must be logged in to add to the wishlist.','false');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'404.ComparisonDistance','404','This value filters the likeness of words. The higher the value, the wider the range of results the 404 page will return.   Suggested value .60 to .70.','.60');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'404.VisibleSuggestions','404','Specifies what type(s) of pages to suggest on the 404 page (blank by default).  Allowed values are product, category, manufacturer, section, topic.','');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'Show404SuggestionLinks','404','If Show404SuggestionLinks is set to true, suggestion of links will be enable and visible whenever redirect to 404.aspx','true');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'404.NumberOfSuggestedLinks','404','This appconfig sets the upper limit of the suggested links that will display on the 404 page.','5');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'DisplayOutOfStockProducts','OUTOFSTOCK','This will show ''out of stock'' or ''In stock'' message depending on the inventory of product. If the inventory is less than OutOfStockThreshold value, it will display ''Out of stock'' message, otherwise ''In stock'' message. This can enable by setting the value to true and will automatically disable the HideProductsWithLessThanThisInventoryLevel. You can totaly configure it in Configuration -> Inventory Control page.','False');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'DisplayOutOfStockOnProductPages','OUTOFSTOCK','This will show ''out of stock'' or ''In stock'' message on product pages only. To enable this you must first set DisplayOutOfStockProducts to true','False');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'DisplayOutOfStockOnEntityPages','OUTOFSTOCK','This will show ''out of stock'' or ''In stock'' message on entity pages only. To enable this you must first set DisplayOutOfStockProducts to true','False');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'OutOfStockThreshold','OUTOFSTOCK','This is the flag use in DisplayOutOfStockProducts. To enable this you must first set DisplayOutOfStockProducts to true.','0');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'SagePayments.MERCHANT_KEY','GATEWAY','Transaction key provided by SagePayments','');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'SagePayments.ServiceURLTEST','GATEWAY','Your SagePayments assigned gateway test mode posting URL','https://www.sagepayments.net/web_services/vterm_extensions/transaction_processing.asmx?WSDL');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'SagePayments.ServiceURL','GATEWAY','Your SagePayments assigned gateway URL','https://www.sagepayments.net/web_services/vterm_extensions/transaction_processing.asmx?WSDL');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'SagePayments.MERCHANT_ID','GATEWAY','Your Merchant id, assigned by SagePayments.','');
INSERT dbo.AppConfig(SuperOnly, Name, GroupName, Description, ConfigValue) values(0, 'DynamicRelatedProducts.Enabled','DISPLAY','When set to true, the products that are related to the product currently viewed by the customer will be displayed at the bottom of the Product page. Valid values are true and false only','false')
INSERT dbo.AppConfig(SuperOnly, Name, GroupName, Description, ConfigValue) values(0, 'DynamicRelatedProducts.NumberDisplayed','DISPLAY','Controls the maximum number of related products that will be displayed at the bottom of the Product pages. Valid values are from 1-10.','4')
INSERT dbo.Appconfig(SuperOnly, Name, GroupName, Description, ConfigValue) values(0, 'RecentlyViewedProducts.Enabled', 'DISPLAY', 'When set to true, the products that were viewed previoulsy by the customer will be displayed at the bottom of the Product page. Valid values are true and false only.', 'false')
INSERT dbo.Appconfig(SuperOnly, Name, GroupName, Description, ConfigValue) values(0, 'RecentlyViewedProducts.NumberDisplayed', 'DISPLAY', 'Controls the maximum number of Recently Viewed products that will be displayed at the bottom of the Product page. Valid values are from 1-10.', '4')
INSERT dbo.Appconfig(SuperOnly, Name, GroupName, Description, ConfigValue) values(0, 'RecentlyViewedProducts.ProductsFormat', 'XMLPACKAGE', 'Controls how Recently Viewed Products are displayed at the bottom of Product page. Valid values are GRID or TABLE. Grid uses AppConfig:RecentlyViewedProductsGridColWidth as # items per each row.', 'GRID')  
INSERT dbo.Appconfig(SuperOnly, Name, GroupName, Description, ConfigValue) values(0, 'RecentlyViewedProductsGridColWidth', 'XMLPACKAGE' , 'If product format is GRID, this is the # of columns in the grid. Valid values are non-negative or greater than or equal to 1.', '4')  


GO


/* 8.0 added */

INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue,Hidden) values(0,'RTShipping.AllowLocalPickup','RTSHIPPING','Enabling this setting will allow a store-pickup option to be displayed and selected when using real time shipping rates.','false',1);
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue,Hidden) values(0,'RTShipping.LocalPickupCost','RTSHIPPING','If you want to charge a handling fee for local in-store pickups, you can enter the amount here (eg. 10.00).','0.00',1);
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue,Hidden) values(0,'RTShipping.LocalPickupRestrictionType','RTSHIPPING','If you want to limit the store-pickup option to only certain addresses or locations you can use this to determine how you are going to limit them. Unrestricted allows anyone to see and select the pickup option, state allows you to specify the states for which the pickup method is valid, zip allows you to specify a zip code or zip codes for which the pickup method is valid, and zone allows you to specify a zone or zones that are set up in the shipping zones section for which the pickup method is valid.','unrestricted',1);
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue,Hidden) values(0,'RTShipping.LocalPickupRestrictionStates','RTSHIPPING','State restrictions for the store-pickup option if the restriction type is state.','',1);
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue,Hidden) values(0,'RTShipping.LocalPickupRestrictionZips','RTSHIPPING','Zip Code restrictions for the store-pickup option if the restriction type is zip.','',1);
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue,Hidden) values(0,'RTShipping.LocalPickupRestrictionZones','RTSHIPPING','Zone restrictions for the store-pickup option if the restriction type is zone.','',1);


GO


/* 8.0.1 added */

INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'Captcha.NumberOfCharacters', 'SECURITY', 'Specifies the number of characters that the Captcha generator will use.  The minimum number of characters that can be used is 6.', '6')
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'Captcha.AllowedCharactersRegex', 'SECURITY', 'Regex value for the allowed characters in the image.  See the AspDotNetStorefront manual for additional regex values.  Do not modify this value unless you are sure of what you are doing.', '[a-zA-Z0-9]')
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'Captcha.ImageBackColor', 'SECURITY', 'The color (Red, Blue, Green, etc...) or hex value (#0000FF) for the back color of the captcha image.', 'LightGray')
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'Captcha.ImageForeColor', 'SECURITY', 'The color (Red, Blue, Green, etc...) or hex value (#0000FF) for the fore color of the captcha image.', 'White')
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'Captcha.TextBackColor', 'SECURITY', 'The color (Red, Blue, Green, etc...) or hex value (#0000FF) for the back color of the captcha text.', 'DarkGray')
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'Captcha.TextForeColor', 'SECURITY', 'The color (Red, Blue, Green, etc...) or hex value (#0000FF) for the fore color of the captcha text.', 'Black')
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'Captcha.HorizontalColor', 'SECURITY', 'The color (Red, Blue, Green, etc...) or hex value (#0000FF) for the horizontal colored lines.', 'Blue')
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'Captcha.VerticalColor', 'SECURITY', 'The color (Red, Blue, Green, etc...) or hex value (#0000FF) for the horizontal colored lines.', 'Blue')
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'Captcha.CaseSensitive', 'SECURITY', 'If true, the captcha image will be case-sensitive.', 'true')
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue,Hidden) values(1,'Captcha.MaxAsciiValue', 'SECURITY', 'Maximum ASCII value used in Captcha random character generation.  Do not modify this value unless you know what you are doing.', '126', 1)

INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'NETAXEPT.Test_UI','GATEWAY','The test url for BBS Hosted UI,do not change this value unless you know what you are doing','https://epayment-test.bbs.no/terminal/');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'NETAXEPT.Live_UI','GATEWAY','The production url for BBS Hosted UI,do not change this value unless you know what you are doing','https://epayment.bbs.no/terminal/');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'NETAXEPT.Test_Server','GATEWAY','The test server url ,do not change this value unless you know what you are doing','https://epayment-test.bbs.no/service.svc?wsdl');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'NETAXEPT.Live_Server','GATEWAY','The production server,do not change this value unless you know what you are doing','https://epayment.bbs.no/service.svc?wsdl');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'NETAXEPT.Merchant_Id','GATEWAY','The merchant ID is the ID given to you by BBS.','');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'NETAXEPT.Merchant_Token','GATEWAY','The token is the shared secret between merchant and BBS. This is similar to a password.','');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'NETAXEPT.MerchantSettings.RedirectUrl','GATEWAY','After payment information at BBS, customer will be redirected to this page.','netaxept.aspx');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'NETAXEPT.Error.Setup','GATEWAY','If true, an error message caused by the setup call will be shown in the checkoutpayment page, otherwise it will be redirected to the BBS UI interface','true');


GO


/* v 9.0.0.0 added */

--INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'AMAZON.AccessKey','GATEWAY','A string distributed by AWS that uniquely identifies an AWS developer. The value of this Id is included in every Amazon Simple Pay request.','');
--INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'AMAZON.ButtonURL','GATEWAY','The url of the amazon button that will appear on checkoutpayment.aspx.','http://g-ecx.images-amazon.com/images/G/01/asp/SLPayNowWithAmazon.gif');
--INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'AMAZON.CollectShippingAddress','GATEWAY','To enable amazon to return through form post the shipping address selected.',1);
--INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'AMAZON.Description','GATEWAY','The description that shows if you used amazon simple pay as your payment method','Payment');
--INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'AMAZON.FPS_LiveServer','GATEWAY','The live server url of amazon flexible payment service.','https://fps.amazonaws.com');
--INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'AMAZON.FPS_TestServer','GATEWAY','The sandbox url of amazon flexible payment service.','https://fps.sandbox.amazonaws.com');
--INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'AMAZON.ImmediateReturn','GATEWAY','After amazon accepts the payment the api returns you to the website immediately if true it displays status page of the payment.',1);
--INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'AMAZON.LiveServer','GATEWAY','The live server url of amazon business account.','https://authorize.payments.amazon.com/pba/paypipeline');
--INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'AMAZON.SecretKey','GATEWAY','A string distributed by AWS that uniquely identifies an AWS developer.','');
--INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(1,'AMAZON.TestServer','GATEWAY','The sandbox url of amazon business account.','https://authorize.payments-sandbox.amazon.com/pba/paypipeline');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue) values(0,'MaxMenuLevel','SITEDISPLAY','The maximum number of menu levels to render for dynamic menu.','1');

INSERT [dbo].AppConfig(SuperOnly, Name, GroupName, Description, ConfigValue) values(0 , 'Newsletter.CaptchaErrorDisplayLength', 'Newsletter', 'Amount of time to display error message on Newsletter control in seconds', '3.5')
INSERT [dbo].AppConfig(SuperOnly, Name, GroupName, Description, ConfigValue) values(0 , 'Newsletter.GetFirstAndLast', 'Newsletter', 'whether or not to retrieve a subscribers first and last name when subscribing to the newsletter', 'false')
INSERT [dbo].AppConfig(SuperOnly, Name, GroupName, Description, ConfigValue) values(0 , 'Newsletter.OptInLevel', 'Newsletter', 'The level of validation that is required when subscribing.  Valid values are "single", "double", and "triple"', 'double')
INSERT [dbo].AppConfig(SuperOnly, Name, GroupName, Description, ConfigValue) values(0 , 'Newsletter.OptOutLevel', 'Newsletter', 'The level of validation that is required when unsubscribing.  Valid values are "double", and "triple"', 'double')
INSERT [dbo].AppConfig(SuperOnly, Name, GroupName, Description, ConfigValue) values(0 , 'Newsletter.UseCaptcha', 'Newsletter', 'whether or not the newsletter control protects against scripts with a captcha', 'true')

INSERT [dbo].AppConfig(SuperOnly, Name, GroupName, Description, ConfigValue) values(0 , 'KitInventory.DisableItemSelection', 'OUTOFSTOCK', 'If a kit item is tied to a particular variant, setting this to true disables the KitItem selection if its variant goes out of stock. You can also configure this on the Configuration -> Inventory Control page.', 'false')
INSERT [dbo].AppConfig(SuperOnly, Name, GroupName, Description, ConfigValue) values(0 , 'KitInventory.HideOutOfStock', 'OUTOFSTOCK', 'If a kit item is tied to a particular variant, setting this to true hides the KitItem display entirely if its variant goes out of stock. You can also configure this on the Configuration -> Inventory Control page.', 'false')
INSERT [dbo].AppConfig(SuperOnly, Name, GroupName, Description, ConfigValue) values(0 , 'KitInventory.ShowStockHint', 'OUTOFSTOCK', 'If a kit item is tied to a particular variant, setting this to true shows stock notices for that kit item. You can also configure this on the Configuration -> Inventory Control page.', 'false')

INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue, ValueType) values(1,'System.ErrorHandlingEnabled','SYSTEM','Determines whether application error events trigger logging and handling functions.  This setting should only be disabled when debugging.','TRUE', 'boolean');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue, ValueType) values(1,'System.ShowFriendlyErrors','SYSTEM','If error handling is enabled, determines whether a friendly error page will be shown if an error occurs, or if the user will be shown an ASP.NET exception page.','TRUE', 'boolean');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue, ValueType) values(1,'System.LoggingEnabled','SYSTEM','If error handling is enabled, determines whether the error is silently swallowed or logged for troubleshooting later','TRUE', 'boolean');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue, ValueType, AllowableValues) values(1,'System.LoggingLocation','SYSTEM','If error logging is enabled, specifies where the log will be stored.  It is recommended to store logs in the database, however troubleshooting my necessitate storing the error log file elsewhere such as the file system (images/errors directory) or the system event log.  Email error logging is not recommended','DATABASE', 'multiselect', 'Database,File,EventLog,Email');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue, ValueType) values(1,'System.MaxLogEntries','SYSTEM','The maximum number of log entries to store.  If this value is exceeded, the oldest log entry will be deleted to make room for new entries.','250', 'integer');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue, ValueType) values(1,'System.MaxLogDays','SYSTEM','The maximum number of days to store log entries.  Entries older than this will be deleted on application start','30', 'integer');

INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue, ValueType) values(1,'PaymentGateway.PrimaryRetries','GATEWAY','The number of times to try the primary payment gateway before switching to the backup.  Setting this value too high could cause the site to timeout for the user, or have an inordinate delay if the payment gateway does not respond.  It is recommended to set this value to 1 or 2.','2', 'integer');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue, ValueType) values(1,'PaymentGateway.BackupRetries','GATEWAY','The number of times to try the backup gatway before failing the order.  Setting this value too high could cause the site to timeout for the user, or have an inordinate delay if the payment gateway does not respond.  It is recommended to set this value to 1 or 2.','2', 'integer');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue, ValueType) values(1,'PaymentGatewayBackup','GATEWAY','The payment gateway to use as a backup.  Leave this value blank if you do not have a backup payment gateway','', 'enum');

INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue, ValueType) VALUES (1,'Minicart.UseAjaxAddToCart','GENERAL','Use Ajaxified Minicart Control for adding product to cart','false', 'boolean');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue, ValueType) VALUES (1,'Minicart.MaxLatestCartItemsCount','GENERAL','the ajax minicart maximum latest cart items count.',8, 'int');

INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue, ValueType) VALUES (1,'AddToCart.UseImageButton','SITEDISPLAY','Use images for addtocart buttons','false', 'boolean');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue, ValueType) VALUES (1,'AddToCart.AddToCartButton','SITEDISPLAY','The image location for the add to cart button. This must be located in the /skins/skin_#/images folder. Specify just the filename i.e. addtocart.gif.','', 'string');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue, ValueType) VALUES (1,'AddToCart.AddToWishButton','SITEDISPLAY','The image location for the add to wishlist button. This must be located in the /skins/skin_#/images folder. Specify just the filename i.e. addwishlist.gif.','', 'string');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue, ValueType) VALUES (1,'AddToCart.AddToGiftRegistryButton','SITEDISPLAY','The image location for the add to gift registry button. This must be located in the /skins/skin_#/images folder. Specify just the filename i.e. addtogiftregistry.gif.','', 'string');

INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue, ValueType) values(1,'AddInDir','SETUP','The subdirectory in which you have addins.','AddIns', 'string');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue, ValueType) values(1,'AddIns.Enabled','SETUP','You must turn this on in order to use AddIns on your site.  Unless you have a specific addin to install you should leave this set to false.','FALSE', 'boolean');

INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue, ValueType) values(1,'Moneybookers.LiveServer','GATEWAY','Live mode URL for Moneybookers maintenance requests.','https://www.moneybookers.com/app/payment.pl', 'string')
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue, ValueType) values(1,'Moneybookers.TestServer','GATEWAY','Test mode URL for Moneybookers maintenance requests.','http://www.moneybookers.com/app/payment.pl', 'string')
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue, ValueType) values(1,'Moneybookers.MerchantEmail','GATEWAY','Email address of the Merchant''s Moneybookers account.','', 'string')
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue, ValueType) values(1,'Moneybookers.Language','GATEWAY','2-letter code of the language used for Moneybookers'' pages (i.e. EN, DE, ES, etc).','EN', 'string')
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue, ValueType) values(1,'Moneybookers.RefundURL','GATEWAY','Refund mode URL for Moneybookers maintenance requests.','https://www.moneybookers.com/app/refund.pl', 'string')
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue, ValueType) values(1,'Moneybookers.StoreLogoURL','GATEWAY','The URL of the logo which you would like to appear at the top of the gateway. The logo must be accessible via HTTPS otherwise it will not be shown. For best result we recommend a dimension up to 200px width and 50px height.','', 'string')
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue, ValueType) values(1,'Moneybookers.NotifyMerchant','GATEWAY','Uses Moneybookers.MerchantEmail to which the transaction details will be sent after the payment process is made. This is optional.','FALSE', 'boolean')
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue, ValueType) values(1,'Moneybookers.MerchantMD5Password','GATEWAY','A cryptographic MD5 hash of merchant password. You may require Moneybookers assistance to generate an MD5 merchant password value.','', 'string')

INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue, ValueType) values(1,'Netgiro.MerchantID','GATEWAY','Merchant ID provided by Netgiro.','', 'int');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue, ValueType) values(1,'Netgiro.HostName','GATEWAY','Should be either the IP of the SSLP host or the IP/DNS name of one of Netgiro''s data centers.','', 'string');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue, ValueType) values(1,'Netgiro.HostPort','GATEWAY','Should be either the port that the SSLP is listening to or the port for one of Netgiro''s data centers.','', 'int');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue, ValueType) values(1,'Netgiro.MerchantCertificateLocation','GATEWAY','Directory location of Merchant certificate either .pfx or .cer (e.g. C:\cert\merchant.pfx). ','', 'string');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue, ValueType) values(1,'Netgiro.MerchantCertificatePassword','GATEWAY','Password for Merchant Certificate. Leave blank if certificate has no password.','', 'string');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue, ValueType) values(1,'Netgiro.NetgiroCertificateLocation','GATEWAY','Directory location of Netgiro certificate either .pfx or .cer (e.g. C:\cert\netgiro.cer).','', 'string');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue, ValueType) values(1,'Netgiro.NetgiroCertificatePassword','GATEWAY','Password for Netgiro Certificate. Leave blank if certificate has no password.','', 'string');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue, ValueType) values(1,'Netgiro.URL','GATEWAY','Netgiro server url. Consult Netgiro for valid url values.','', 'string');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue, ValueType) values(1,'PayLeap.LIVE_URL','GATEWAY','Your PayLeap SmartPayment assigned gateway LIVE URL','https://secure.payleap.com/SmartPayments/transact.asmx','string');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue, ValueType) values(1,'PayLeap.TEST_URL','GATEWAY','Your PayLeap SmartPayment assigned gateway TEST URL','http://test.payleap.com/SmartPayments/transact.asmx','string');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue, ValueType) values(1,'PayLeap.Password','GATEWAY','Your PayLeap SmartPayment assigned account password','','string');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue, ValueType) values(1,'PayLeap.UserName','GATEWAY','Your PayLeap SmartPayment assigned account Username','','string');



GO

INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue, ValueType) values(1,'Layouts.Enabled','LAYOUTS','When enabled layouts can be used throughout the site and the quick edit navigation bar will be enabled.','false', 'boolean');
INSERT [dbo].AppConfig(SuperOnly,Name,GroupName,Description,ConfigValue, ValueType) values(0,'Mobile.EntityPageSize', 'MOBILE', 'This will control the number of entities that display per page when the site is being browsed from a mobile device.', 10, 'int');

 
INSERT GlobalConfig([Name], [GroupName], [Description], [ConfigValue], [ValueType], [IsMultiStore]) VALUES('AllowProductFiltering', 'MULTISTORE', 'Indicator of whether or not to filter products by store', 'false', 'boolean', 'true')
INSERT GlobalConfig([Name], [GroupName], [Description], [ConfigValue], [ValueType], [IsMultiStore]) VALUES('AllowEntityFiltering', 'MULTISTORE', 'Indicator of whether or not to filter Entities by store', 'false', 'boolean', 'true')
INSERT GlobalConfig([Name], [GroupName], [Description], [ConfigValue], [ValueType], [IsMultiStore]) VALUES('AllowCustomerFiltering', 'MULTISTORE', 'Indicator of whether or not to filter Customers by store', 'false', 'boolean', 'true')
INSERT GlobalConfig([Name], [GroupName], [Description], [ConfigValue], [ValueType], [IsMultiStore]) VALUES('DefaultRedirectURL', 'MULTISTORE', 'Default store to which to redirect', '', 'stringtype', 'true')
INSERT GlobalConfig([Name], [GroupName], [Description], [ConfigValue], [ValueType], [IsMultiStore]) VALUES('UseSharedSSL', 'MULTISTORE', 'Indicator of whether or not to use a shared SSL cert', 'false', 'boolean', 'true')
INSERT GlobalConfig([Name], [GroupName], [Description], [ConfigValue], [ValueType], [IsMultiStore]) VALUES('SSLRededirectURL', 'MULTISTORE', 'default redirect url if UseSharedSSL is turned on', '', 'stringtype', 'true')
INSERT GlobalConfig([Name], [GroupName], [Description], [ConfigValue], [ValueType], [IsMultiStore]) VALUES('LicenseKey', 'SYSTEM', 'The license key', '', 'stringtype', 'true')
INSERT GlobalConfig([Name], [GroupName], [Description], [ConfigValue], [ValueType], [IsMultiStore]) VALUES('AllowNewsFiltering', 'MULTISTORE', 'Indicator of whether or not to filter News by store', 'false', 'boolean', 'true')
INSERT GlobalConfig([Name], [GroupName], [Description], [ConfigValue], [ValueType], [IsMultiStore]) VALUES('AllowTopicFiltering', 'MULTISTORE', 'Indicator of whether or not to filter Topic by store', 'false', 'boolean', 'true')
INSERT GlobalConfig([Name], [GroupName], [Description], [ConfigValue], [ValueType], [IsMultiStore]) VALUES('AllowOrderOptionFiltering', 'MULTISTORE', 'Indicator of whether or not to filter Order Option by store', 'false', 'boolean', 'true')
INSERT GlobalConfig([Name], [GroupName], [Description], [ConfigValue], [ValueType], [IsMultiStore]) VALUES('AllowCouponFiltering', 'MULTISTORE', 'Indicator of whether or not to filter Coupon by store', 'false', 'boolean', 'true')
INSERT GlobalConfig([Name], [GroupName], [Description], [ConfigValue], [ValueType], [IsMultiStore]) VALUES('AllowShoppingcartFiltering', 'MULTISTORE', 'Indicator of whether or not to filter Products added to Shoppingcart from different stores', 'true', 'boolean', 'true')
INSERT GlobalConfig([Name], [GroupName], [Description], [ConfigValue], [ValueType], [IsMultiStore]) VALUES('AllowCustomerDuplicateEMailAddresses', 'MISC', 'Indicator of whether or not the same email address can be used multiple times.', 'false', 'boolean', 'false')
INSERT GlobalConfig([Name], [GroupName], [Description], [ConfigValue], [ValueType], [IsMultiStore]) VALUES('AllowAffiliateFiltering', 'MULTISTORE', 'Indicator of whether or not to filter Affiliate by store', 'false', 'boolean', 'true')
INSERT GlobalConfig([Name], [GroupName], [Description], [ConfigValue], [ValueType], [IsMultiStore]) VALUES('AllowShippingFiltering', 'MULTISTORE', 'Indicator of whether or not to filter shipping calculation mode and methods on a per store basis', 'false', 'boolean', 'true')
INSERT GlobalConfig([Name], [GroupName], [Description], [ConfigValue], [ValueType], [IsMultiStore]) VALUES('AllowGiftCardFiltering', 'MULTISTORE', 'Indicator of whether or not to filter Gift Card by store', 'false', 'boolean', 'true')
INSERT GlobalConfig([Name], [GroupName], [Description], [ConfigValue], [ValueType], [IsMultiStore]) VALUES('AllowRatingFiltering', 'MULTISTORE', 'Indicator of whether or not to filter Ratings by store', 'false', 'boolean', 'true')
INSERT GlobalConfig([Name], [GroupName], [Description], [ConfigValue], [ValueType], [IsMultiStore]) VALUES('AllowTemplateSwitchingByLocale', 'DISPLAY', 'Indicator of whether the site should attempt to load different masterpage skins based on the current locale of the browsing customer.  This should only be enabled if you have multiple locales and have created different masterpages for each of your locales (eg. template.en-us.master, template.en-gb.master, etc...).  Enabling this when you do not have multiple locales or when you have not create multiple masterpages that vary by locale can hinder the performance of your site.', 'false', 'boolean', 'false')


GO


UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'ActiveQuantityDiscountTable'
UPDATE dbo.[AppConfig] SET ValueType = 'integer' WHERE [Name] = 'Admin_DefaultInventory'
UPDATE dbo.[AppConfig] SET ValueType = 'integer' WHERE [Name] = 'Admin_DefaultProductTypeID'
UPDATE dbo.[AppConfig] SET ValueType = 'integer' WHERE [Name] = 'Admin_DefaultTaxClassID'
UPDATE dbo.[AppConfig] SET ValueType = 'integer' WHERE [Name] = 'Admin_DefaultSalesPromptID'
UPDATE dbo.[AppConfig] SET ValueType = 'integer' WHERE [Name] = 'Admin_ProductPageSize'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'Admin_ShowReportSQL'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'Admin_SpecsInlineByDefault'
UPDATE dbo.[AppConfig] SET ValueType = 'integer' WHERE [Name] = 'Admin_TextAreaHeight'
UPDATE dbo.[AppConfig] SET ValueType = 'integer' WHERE [Name] = 'Admin_TextAreaHeightSmall'
UPDATE dbo.[AppConfig] SET ValueType = 'integer' WHERE [Name] = 'Admin_TextAreaWidth'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'AdminDir'
UPDATE dbo.[AppConfig] SET ValueType = 'integer' WHERE [Name] = 'AgeCartDays'
UPDATE dbo.[AppConfig] SET ValueType = 'integer' WHERE [Name] = 'AgeWishListDays'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'AllowEmptySkuAddToCart'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'AllowShipToDifferentThanBillTo'
UPDATE dbo.[AppConfig] SET ValueType = 'integer' WHERE [Name] = 'AlsoBoughtNumberToDisplay'
UPDATE dbo.[AppConfig] SET ValueType = 'enum', AllowableValues = 'Grid, Table' WHERE [Name] = 'AlsoBoughtProductsFormat'
UPDATE dbo.[AppConfig] SET ValueType = 'integer' WHERE [Name] = 'AlsoBoughtProductsGridColWidth'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'AUTHORIZENET_X_EMAIL'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'AUTHORIZENET_X_Login'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'AUTHORIZENET_X_Tran_Key'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'AUTHORIZENET_X_DELIM_DATA'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'AUTHORIZENET_X_DELIM_CHAR'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'AUTHORIZENET_X_ENCAP_CHAR'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'AUTHORIZENET_X_RELAY_RESPONSE'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'AUTHORIZENET_X_EMAIL_CUSTOMER'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'AUTHORIZENET_X_METHOD'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'AUTHORIZENET_X_RECURRING_BILLING'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'AUTHORIZENET_X_VERSION'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'AUTHORIZENET_LIVE_SERVER'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'AUTHORIZENET_TEST_SERVER'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'AUTHORIZENET_Verify_Addresses'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'AutoVariantFillColumnDelimiter'
UPDATE dbo.[AppConfig] SET ValueType = 'integer' WHERE [Name] = 'BestSellersN'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'BestSellersShowPics'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'BoxFrameStyle'
UPDATE dbo.[AppConfig] SET ValueType = 'integer' WHERE [Name] = 'CacheDurationMinutes'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'CacheMenus'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'CardExtraCodeIsOptional'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'CardinalCommerce.Centinel.Enabled'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'CardinalCommerce.Centinel.IsLive'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'CardinalCommerce.Centinel.MerchantID'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'CardinalCommerce.Centinel.ProcessorID'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'CardinalCommerce.Centinel.MsgType.Lookup'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'CardinalCommerce.Centinel.Version.Lookup'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'CardinalCommerce.Centinel.MsgType.Authenticate'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'CardinalCommerce.Centinel.Version.Authenticate'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'CardinalCommerce.Centinel.TransactionUrl.Test'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'CardinalCommerce.Centinel.TransactionUrl.Live'
UPDATE dbo.[AppConfig] SET ValueType = 'integer' WHERE [Name] = 'CardinalCommerce.Centinel.MapsTimeout'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'CardinalCommerce.Centinel.TermURL'
UPDATE dbo.[AppConfig] SET ValueType = 'integer' WHERE [Name] = 'CardinalCommerce.Centinel.NumRetries'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'ClearCouponAfterOrdering'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'ClearOldCartOnSignin'
UPDATE dbo.[AppConfig] SET ValueType = 'decimal' WHERE [Name] = 'CODHandlingExtraFee'
UPDATE dbo.[AppConfig] SET ValueType = 'integer' WHERE [Name] = 'DefaultShippingCalculationID'
UPDATE dbo.[AppConfig] SET ValueType = 'integer' WHERE [Name] = 'DefaultSkinID'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'DelayedDownloads'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'DelayedDropShipNotifications'
UPDATE dbo.[AppConfig] SET ValueType = 'decimal' WHERE [Name] = 'Dispatch_OrderThreshold'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'Dispatch_ToPhoneNumber'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'Dispatch_SiteName'
UPDATE dbo.[AppConfig] SET ValueType = 'integer' WHERE [Name] = 'Dispatch_MAX_SMS_MSG_LENGTH'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'DoNotShowNewsOnHomePage'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'DumpDownloadInfo'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'EFSNET_LIVE_STOREKEY'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'EFSNET_LIVE_STOREID'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'EFSNET_LIVE_SERVER'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'EFSNET_TEST_STOREKEY'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'EFSNET_TEST_STOREID'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'EFSNET_TEST_SERVER'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'EFSNET_VERIFY_ADDRESSES'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'EventLoggingEnabled'
UPDATE dbo.[AppConfig] SET ValueType = 'decimal' WHERE [Name] = 'FreeShippingThreshold'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'GotOrderEMailFrom'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'GotOrderEMailFromName'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'GotOrderEMailTo'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'GreyCellColor'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'HeaderBGColor'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'HideProductNextPrevLinks'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'HomeTemplate'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'HomeTemplateAsIs'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'Inventory.LimitCartToQuantityOnHand'
UPDATE dbo.[AppConfig] SET ValueType = 'integer' WHERE [Name] = 'IsFeaturedCategoryID'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'ITransact.Test_FirstName'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'ITransact.Sale_Server'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'ITransact.VoidRefund_Server'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'ITransact.Vendor_ID'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'ITransact.Verify_Addresses'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'ITransact.Password'
UPDATE dbo.[AppConfig] SET ValueType = 'integer' WHERE [Name] = 'KitCategoryID'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'LightCellColor'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'LINKPOINT_CONFIGFILE'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'LINKPOINT_KEYFILE'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'LINKPOINT_LIVE_SERVER'
UPDATE dbo.[AppConfig] SET ValueType = 'integer' WHERE [Name] = 'LINKPOINT_PORT'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'LINKPOINT_TEST_SERVER'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'LINKPOINT_Verify_Addresses'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'LinkToProductPageInCart'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'LiveServer'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'MailCheckReminder'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'MailMe_FromAddress'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'MailMe_FromName'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'MailMe_Pwd'
UPDATE dbo.[AppConfig] SET ValueType = 'integer' WHERE [Name] = 'MailMe_Port'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'MailMe_Server'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'MailMe_ToAddress'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'MailMe_ToName'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'MailMe_User'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'MailMe_UseSSL'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'ManufacturersLinkToOurPage'
UPDATE dbo.[AppConfig] SET ValueType = 'integer' WHERE [Name] = 'MaxSlides'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'MediumCellColor'
UPDATE dbo.[AppConfig] SET ValueType = 'integer' WHERE [Name] = 'MinCartItemsBeforeCheckout'
UPDATE dbo.[AppConfig] SET ValueType = 'integer' WHERE [Name] = 'MinSearchStringLength'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'NetBilling.Test_Server'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'NetBilling.Live_Server'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'NetBilling.Pay_Type'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'NetBilling.Account_ID'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'NetBilling.Site_Tag'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'NetBilling.Verify_Addresses'
UPDATE dbo.[AppConfig] SET ValueType = 'integer' WHERE [Name] = 'NumHomePageSpecials'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'OnSaleForTextColor'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'PayFuse.UserID'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'PayFuse.Password'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'PayFuse.Alias'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'PayFuse.Test_Server'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'PayFuse.Live_Server'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'OrderShowCCPwd'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'PAYMENTECH_BIN'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'PAYMENTECH_LIVE_SERVER'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'PAYMENTECH_MERCHANT_ID'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'PAYMENTECH_MERCHANT_TERMINAL_ID'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'PAYMENTECH_MERCHANT_TZCODE'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'PAYMENTECH_TEST_SERVER'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'PAYMENTECH_Verify_Addresses'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'PaymentExpress.Username'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'PaymentExpress.Password'
UPDATE dbo.[AppConfig] SET ValueType = 'invoke', AllowableValues = 'AspDotNetStorefrontGateways.GatewayLoader,AspDotNetStorefrontGateways,GetAvailableGatewayNames' WHERE [Name] = 'PaymentGateway'
UPDATE dbo.[AppConfig] SET ValueType = 'invoke', AllowableValues = 'AspDotNetStorefrontGateways.GatewayLoader,AspDotNetStorefrontGateways,GetAvailableGatewayNames' WHERE [Name] = 'PaymentGatewayBackup'
UPDATE dbo.[AppConfig] SET ValueType = 'multiselect', AllowableValues = 'Credit Card,PayPalExpress,PayPal,Request Quote,Purchase Order,Check By Mail,C.O.D.,ECheck,CardinalMyECheck,MicroPay' WHERE [Name] = 'PaymentMethods'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'PayPal.BusinessID'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'PayPal.LiveServer'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'PayPal.ReturnCancelURL'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'PayPal.ReturnOKURL'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'PayPal.ForceCapture'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'PayPal.API.Username'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'PayPal.API.Password'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'PayPal.API.MerchantEMailAddress'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'PayPal.API.TestURL'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'PayPal.API.LiveURL'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'PayPal.RequireConfirmedAddress'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'PayPal.DefaultLocaleCode'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'PayPal.Express.AllowAnonCheckout'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'PayPal.TestServer'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'PayPal.PaymentIcon'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'PayPal.UseInstantNotification'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'PayPal.NotificationURL'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'PayPal.Express.CancelURL'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'PayPal.Express.LiveURL'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'PayPal.Express.ReturnURL'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'PayPal.Express.SandboxURL'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'PayPal.Express.PageStyle'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'PayPal.Express.HeaderImage'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'PayPal.Express.HeaderBackColor'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'PayPal.Express.HeaderBorderColor'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'PayPal.Express.PayFlowColor'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'PayPal.API.Signature'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'PayPal.Express.ShowOnCartPage'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'PayPal.Promo.Enabled'
UPDATE dbo.[AppConfig] SET ValueType = 'decimal' WHERE [Name] = 'PayPal.Promo.CartMinimum'
UPDATE dbo.[AppConfig] SET ValueType = 'decimal' WHERE [Name] = 'PayPal.Promo.CartMaximum'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'PayPal.Promo.BannerURL'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'PayPal.Promo.LearnMoreURL'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'PayPal.Promo.ButtonImageURL'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'PayPal.Promo.Codes'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'PayPal.Express.ButtonImageURL'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'PayflowPro.Reporting.LiveURL'
UPDATE dbo.[AppConfig] SET ValueType = 'integer' WHERE [Name] = 'PayflowPro.RecurringMaxFailPayments'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'PayflowPro.Reporting.ReportName'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'PayflowPro.Reporting.TestURL'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'PersistFilters'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'PreserveActiveCartOnSignin'
UPDATE dbo.[AppConfig] SET ValueType = 'integer' WHERE [Name] = 'ProductBrowserHeight'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'ProductBrowserHoverColor'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'RatingsCommentFrameVisibility'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'RatingsCanBeDoneByAnons'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'RatingsEnabled'
UPDATE dbo.[AppConfig] SET ValueType = 'integer' WHERE [Name] = 'RatingsPageSize'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'ReceiptEMailFrom'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'ReceiptEMailFromName'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'RedirectLiveToWWW'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'RelatedProductsFormat'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'RequireTermsAndConditionsAtCheckout'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'ResizeSlideWindow'
UPDATE dbo.[AppConfig] SET ValueType = 'multiselect', AllowableValues = 'UPS,UPS2,USPS,FEDEX,DHL,CANADAPOST,AUSPOST' WHERE [Name] = 'RTShipping.ActiveCarrier'
UPDATE dbo.[AppConfig] SET ValueType = 'multiselect', AllowableValues = 'UPS,UPS2,USPS,FEDEX,DHL,CANADAPOST,AUSPOST' WHERE [Name] = 'RTShipping.DomesticCarriers'
UPDATE dbo.[AppConfig] SET ValueType = 'multiselect', AllowableValues = 'UPS,UPS2,USPS,FEDEX,DHL,CANADAPOST,AUSPOST' WHERE [Name] = 'RTShipping.InternationalCarriers'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'RTShipping.Insured'
UPDATE dbo.[AppConfig] SET ValueType = 'decimal' WHERE [Name] = 'RTShipping.DefaultItemWeight'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'RTShipping.OriginAddress'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'RTShipping.OriginAddress2'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'RTShipping.OriginCity'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'RTShipping.OriginState'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'RTShipping.OriginZip'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'RTShipping.OriginCountry'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'RTShipping.UPS.UserName'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'RTShipping.UPS.Password'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'RTShipping.UPS.License'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'RTShipping.UPS.Server'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'RTShipping.UPS.TestServer'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'RTShipping.UPS.UPSPickupType'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'RTShipping.UPS.AccountNumber'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'RTShipping.UPS.AddressTypeBehavior'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'RTShipping.UPS.DeliveryConfirmation'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'RTShipping.UPS.GetNegotiatedRates'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'RTShipping.UPS.Services'
UPDATE dbo.[AppConfig] SET ValueType = 'integer' WHERE [Name] = 'RTShipping.UPS.MaxWeight'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'RTShipping.USPS.UserName'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'RTShipping.USPS.Server'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'RTShipping.USPS.TestServer'
UPDATE dbo.[AppConfig] SET ValueType = 'integer' WHERE [Name] = 'RTShipping.USPS.MaxWeight'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'RTShipping.USPS.Services'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'RTShipping.FedEx.AccountNumber'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'RTShipping.FedEx.Server'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'RTShipping.FedEx.Meter'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'RTShipping.WeightUnits'
UPDATE dbo.[AppConfig] SET ValueType = 'decimal' WHERE [Name] = 'RTShipping.MarkupPercent'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'RTShipping.Fedex.ShipDate'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'RTShipping.Fedex.CarrierCodes'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'RTShipping.DumpXmlOnCartPage'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'RTShipping.CallForShippingPrompt'
UPDATE dbo.[AppConfig] SET ValueType = 'integer' WHERE [Name] = 'RTShipping.FedEx.MaxWeight'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'RTShipping.ShowErrors'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'RTShipping.DHL.AccountNumber'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'RTShipping.DHL.APISystemID'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'RTShipping.DHL.APISystemPassword'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'RTShipping.DHL.Server'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'RTShipping.DHL.TestServer'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'RTShipping.ShippingMethodsToPrevent'
UPDATE dbo.[AppConfig] SET ValueType = 'decimal' WHERE [Name] = 'RTShipping.PackageExtraWeight'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'RTShipping.UseTestRates'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'RTShipping.MultiDistributorCalculation'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'RTShipping.CanadaPost.DefaultPackageSize'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'RTShipping.CanadaPost.Language'
UPDATE dbo.[AppConfig] SET ValueType = 'integer' WHERE [Name] = 'RTShipping.CanadaPost.MaxWeight'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'RTShipping.CanadaPost.MerchantID'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'RTShipping.CanadaPost.Server'
UPDATE dbo.[AppConfig] SET ValueType = 'integer' WHERE [Name] = 'RTShipping.CanadaPost.ServerPort'
UPDATE dbo.[AppConfig] SET ValueType = 'integer' WHERE [Name] = 'RTShipping.DHL.ShipInDays'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'RTShipping.DHLIntl.BillingAccountNbr'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'RTShipping.DHLIntl.BillingParty'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'RTShipping.DHLIntl.Dutiable'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'RTShipping.DHLIntl.DutyPayment'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'RTShipping.DHLIntl.DutyPaymentAccountNbr'
UPDATE dbo.[AppConfig] SET ValueType = 'integer' WHERE [Name] = 'RTShipping.DHLIntl.MaxWeight'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'RTShipping.DHLIntl.Overrides'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'RTShipping.DHLIntl.Packaging'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'RTShipping.DHLIntl.Services'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'RTShipping.DHLIntl.ShippingKey'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'RTShipping.AusPost.DefaultPackageSize'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'RTShipping.AusPost.DomesticServices'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'RTShipping.AusPost.IntlServices'
UPDATE dbo.[AppConfig] SET ValueType = 'integer' WHERE [Name] = 'RTShipping.AusPost.MaxWeight'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'RTShipping.SortByRate'
UPDATE dbo.[AppConfig] SET ValueType = 'decimal' WHERE [Name] = 'UPS.MinimumPackageWeight'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'SE_MetaTitle'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'SE_MetaDescription'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'SE_MetaKeywords'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'SE_MetaNoScript'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'Search_ShowDistributorsInResults'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'Search_ShowManufacturersInResults'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'Search_ShowCategoriesInResults'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'Search_ShowSectionsInResults'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'Search_ShowProductsInResults'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'SearchAdv_ShowProductType'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'SearchAdv_ShowCategory'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'SearchAdv_ShowSection'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'SearchAdv_ShowManufacturer'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'SearchAdv_ShowDistributor'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'SearchAdv_ShowSKU'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'SearchAdv_ShowPriceRange'
UPDATE dbo.[AppConfig] SET ValueType = 'integer' WHERE [Name] = 'SessionTimeoutInMinutes'
UPDATE dbo.[AppConfig] SET ValueType = 'decimal' WHERE [Name] = 'ShippingHandlingExtraFee'
UPDATE dbo.[AppConfig] SET ValueType = 'integer' WHERE [Name] = 'ShippingMethodIDIfFreeShippingIsOn'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'ShipRush.Enabled'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'ShipRush.TrackRef'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'ShipRush.DefaultTemplate'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'ShipRush.LoginID'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'ShipRush.ProvideExtraTemplateInfo'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'ShowBuyButtons'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'ShowDescriptionInTableCondensed'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'ShowDimensionsInTableCondensed'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'ShowQuantityOnProductPage'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'ShowWishButtons'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'ShowCartDeleteItemButton'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'ShowCustomerServiceNotesInReceipts'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'ShowEMailProductToFriend'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'ShowFullNameInRightBar'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'ShowFullNameInTableCondensed'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'ShowFullNameInTableExpanded'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'ShowInventoryTable'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'ShowKitPics'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'ShowPriceRegularPrompt'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'ShowSpecialsPics'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'ShowSubcatsInGrid'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'ShowWeightInTableCondensed'
UPDATE dbo.[AppConfig] SET ValueType = 'integer' WHERE [Name] = 'SlideShowInterval'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'StoreCCInDB'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'StoreName'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'StoreVersion'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'TRANSACTIONCENTRAL_MerchantID'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'TRANSACTIONCENTRAL_RegKey'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'TRANSACTIONCENTRAL_LIVE_SERVER'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'TRANSACTIONCENTRAL_TEST_SERVER'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'TRANSACTIONCENTRAL_VOID_SERVER'
UPDATE dbo.[AppConfig] SET ValueType = 'enum' WHERE [Name] = 'TransactionMode'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'UseLiveTransactions'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'UseSKUForProductImageName'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'UseSSL'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'VIAKLIX_LIVE_SERVER'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'VIAKLIX_SSL_MERCHANT_ID'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'VIAKLIX_SSL_PIN'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'VIAKLIX_SSL_USER_ID'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'VIAKLIX_TEST_SERVER'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'IDEPOSIT_TEST_URL'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'IDEPOSIT_TEST_USERNAME'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'IDEPOSIT_TEST_PASSWORD'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'IDEPOSIT_TEST_CLERKID'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'IDEPOSIT_LIVE_URL'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'IDEPOSIT_LIVE_USERNAME'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'IDEPOSIT_LIVE_PASSWORD'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'IDEPOSIT_LIVE_CLERKID'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'WorldPay_InstallationID'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'WorldPay_Live_Server'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'WorldPay_ReturnURL'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'WorldPay_TestMode'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'WorldPay_TestModeCode'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'WorldPay_FixContact'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'WorldPay_HideContact'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'WorldPay_LanguageLocale'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'WorldPay_RequireAVSMatch'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'WorldPay_OnCancelAutoRedirectToCart'
UPDATE dbo.[AppConfig] SET ValueType = 'integer' WHERE [Name] = 'ZoneIdForNoMatch'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'AffiliateEMailAddress'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'MicroPay.Enabled'
UPDATE dbo.[AppConfig] SET ValueType = 'integer' WHERE [Name] = 'Recurring.DefaultRecurringShippingMethodID'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'Recurring.DefaultRecurringShippingMethod'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'Recurring.SendOrderEMailToCustomer'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'Recurring.SendShippedEMail'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'Recurring.LimitCustomerToOneOrder'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'Recurring.UseGatewayInternalBilling'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'Recurring.ClearIsNewFlag'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'SendOrderEMailToCustomer'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'SendShippedEMailToCustomer'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'ShowSummaryInTableOrderFormat'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'CustomerLevel0AllowsPOs'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'FilterDocumentsByAffiliate'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'FilterProductsByAffiliate'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'ShowManufacturerTree'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'DisallowCoupons'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'DisallowOrderNotes'
UPDATE dbo.[AppConfig] SET ValueType = 'decimal' WHERE [Name] = 'CartMinOrderAmount'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'UseSKUForProductDescriptionName'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'UseNameForSectionDescriptionName'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'eProcessingNetwork_X_EMAIL'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'eProcessingNetwork_X_Login'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'eProcessingNetwork_X_Tran_Key'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'eProcessingNetwork_X_DELIM_DATA'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'eProcessingNetwork_X_DELIM_CHAR'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'eProcessingNetwork_X_ENCAP_CHAR'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'eProcessingNetwork_X_RELAY_RESPONSE'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'eProcessingNetwork_X_EMAIL_CUSTOMER'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'eProcessingNetwork_X_METHOD'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'eProcessingNetwork_X_RECURRING_BILLING'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'eProcessingNetwork_X_VERSION'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'eProcessingNetwork_LIVE_SERVER'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'eProcessingNetwork_TEST_SERVER'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'eProcessingNetwork_Verify_Addresses'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'FilterProductsByCustomerLevel'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'FilterDocumentsByCustomerLevel'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'FilterByCustomerLevelIsAscending'
UPDATE dbo.[AppConfig] SET ValueType = 'decimal' WHERE [Name] = 'ShippingCostWhenNoZoneMatch'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'Localization.StoreCurrency'
UPDATE dbo.[AppConfig] SET ValueType = 'integer' WHERE [Name] = 'Localization.StoreCurrencyNumericCode'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'Localization.WeightUnits'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'Suscription.ExpiredMessageWhenViewingTopic'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'AddToCartAction'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'ShowMiniCart'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'ShowPicsInMiniCart'
UPDATE dbo.[AppConfig] SET ValueType = 'integer' WHERE [Name] = 'MiniCartMaxIconWidth'
UPDATE dbo.[AppConfig] SET ValueType = 'integer' WHERE [Name] = 'MiniCartMaxIconHeight'
UPDATE dbo.[AppConfig] SET ValueType = 'integer' WHERE [Name] = 'DefaultAddToCartQuantity'
UPDATE dbo.[AppConfig] SET ValueType = 'decimal' WHERE [Name] = 'MinOrderWeight'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = '2CHECKOUT_VendorID'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = '2CHECKOUT_LIVE_SERVER'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'YOURPAY_CONFIGFILE'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'YOURPAY_KEYFILE'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'YOURPAY_LIVE_SERVER'
UPDATE dbo.[AppConfig] SET ValueType = 'integer' WHERE [Name] = 'YOURPAY_PORT'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'YOURPAY_TEST_SERVER'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'YOURPAY_Verify_Addresses'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'PasswordIsOptionalDuringCheckout'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'HidePasswordFieldDuringCheckout'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'WriteFileInUTF8'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'Micropay.HideOnCartPage'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'AllowMultipleShippingAddressPerOrder'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'IncludeGoogleTrackingCode'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'IncludeOvertureTrackingCode'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'Admin.MultiGalleryImageWidth'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'AllowShoppingCartItemNotes'
UPDATE dbo.[AppConfig] SET ValueType = 'integer' WHERE [Name] = 'ShoppingCartItemNotesTextareaRows'
UPDATE dbo.[AppConfig] SET ValueType = 'integer' WHERE [Name] = 'ShoppingCartItemNotesTextareaCols'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'HidePicsInTableCondensed'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'ResizableLargeImagePopup'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'GoogleSiteMap.EntityChangeFreq'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'GoogleSiteMap.EntityPriority'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'GoogleSiteMap.ObjectChangeFreq'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'GoogleSiteMap.ObjectPriority'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'GoogleSiteMap.TopicChangeFreq'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'GoogleSiteMap.TopicPriority'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'GoogleSiteMap.Xmlns'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'Reorder.ClearCartBeforeAddingReorderItems'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'Watermark.Enabled'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'Watermark.CopyrightText'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'Watermark.CopyrightImage.Icon'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'Watermark.CopyrightImage.Medium'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'Watermark.CopyrightImage.Large'
UPDATE dbo.[AppConfig] SET ValueType = 'integer' WHERE [Name] = 'Watermark.OffsetFromBottomPercentage'
UPDATE dbo.[AppConfig] SET ValueType = 'decimal' WHERE [Name] = 'Watermark.Opacity'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'PlugNPay_URL'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'PlugNPay_Username'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'PlugNPay_Password'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'ContentsBGColorDefault'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'PageBGColorDefault'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'GraphicsColorDefault'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'SiteMap.ShowProducts'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'SiteMap.ShowDocuments'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'SiteMap.ShowLibraries'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'SiteMap.ShowManufacturers'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'SiteMap.ShowCategories'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'SiteMap.ShowSections'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'SiteMap.ShowTopics'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'SiteMap.ShowCustomerService'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'Tree.ShowCategories'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'Tree.ShowSections'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'Tree.ShowLibraries'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'Tree.ShowManufacturers'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'Tree.ShowCustomerService'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'Tree.CustomerServiceXml'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'AllowRecurringIntervalEditing'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'ReplaceImageURLFromAssetMgr'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'ShowGiftRegistryButtons'
UPDATE dbo.[AppConfig] SET ValueType = 'integer' WHERE [Name] = 'ShippingMethodIDIfItemShippingCostsAreOn'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'AllowGiftRegistryQuantities'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'DecrementGiftRegistryOnOrder'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'OrderSummaryReportFields'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'ShowPicsInCart'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'ShowUpsellProductsOnCartPage'
UPDATE dbo.[AppConfig] SET ValueType = 'integer' WHERE [Name] = 'UpsellProductsLimitNumberOnCart'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'UseParserOnEntityDescriptions'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'UseParserOnObjectDescriptions'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'ContinueShoppingURL'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'SiteDisclaimerRequired'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'SiteDisclaimerNotAgreedURL'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'SiteDisclaimerAgreedPage'
UPDATE dbo.[AppConfig] SET ValueType = 'integer' WHERE [Name] = 'MultiShipMaxItemsAllowed'
UPDATE dbo.[AppConfig] SET ValueType = 'integer' WHERE [Name] = 'MaxMenuSize'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'SkipShippingOnCheckout'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'ShowQuantityDiscountTablesInline'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'PAYJUNCTION_LOGON'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'PAYJUNCTION_PASSWORD'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'PAYJUNCTION_HTTP_VERSION'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'PAYJUNCTION_TEST_SERVER'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'PAYJUNCTION_LIVE_SERVER'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'PAYJUNCTION_SECURITY_DESCRIPTOR'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'JETPAY_MERCHANTID'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'JETPAY_TEST_SERVER'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'JETPAY_LIVE_SERVER'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'ForceSignoutOnOrderCompletion'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'Micropay.ShowTotalOnTopOfCartPage'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'WholesaleOnlySite'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'GoNonSecureAgain'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'SkipPaymentEntryOnZeroDollarCheckout'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'ShowPreviousPurchase'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'ReceiptHideStoreVersion'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'HideKitQuantity'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'HideKitPrice'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'SecurityCodeRequiredOnStoreLogin'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'SecurityCodeRequiredOnAdminLogin'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'SecurityCodeRequiredOnCreateAccount'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'SecurityCodeRequiredOnCreateAccountDuringCheckout'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'Innova.XHTML'
UPDATE dbo.[AppConfig] SET ValueType = 'integer' WHERE [Name] = 'HideProductsWithLessThanThisInventoryLevel'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'FilterOutShippingMethodsThatHave0Cost'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'AutoSelectFirstSizeColorOption'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'XmlPackage.DumpTransform'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'XmlPackage.DefaultDistributorNotification'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'XmlPackage.LostPassword'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'XmlPackage.OrderReceipt'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'XmlPackage.OrderAsXml'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'XmlPackage.OrderShipped'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'XmlPackage.NewOrderAdminNotification'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'XmlPackage.NewOrderAdminSMSNotification'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'XmlPackage.AffiliateSignupNotification'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'XmlPackage.OrderFinalization'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'XmlPackage.OrderConfirmationPage'
UPDATE dbo.[AppConfig] SET ValueType = 'integer' WHERE [Name] = 'RelatedProductsGridColWidth'
UPDATE dbo.[AppConfig] SET ValueType = 'integer' WHERE [Name] = 'UpsellProductsGridColWidth'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'GiftCard.PhysicalProductTypeIDs'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'GiftCard.EmailProductTypeIDs'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'GiftCard.CertificateProductTypeIDs'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'RequireOver13Checked'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'SubscriptionExtensionOccursFromOrderDate'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'Localization.CurrencyFeedUrl'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'Localization.CurrencyFeedXmlPackage'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'Localization.CurrencyFeedBaseRateCurrencyCode'
UPDATE dbo.[AppConfig] SET ValueType = 'integer' WHERE [Name] = 'Localization.CurrencyCacheMinutes'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'CENTRALPAYMENTS_AssociateName'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'CENTRALPAYMENTS_AssociatePassword'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'QBMERCHANTSERVICES_ApplicationLogin'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'QBMERCHANTSERVICES_ApplicationID'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'QBMERCHANTSERVICES_ApplicationVersion'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'QBMERCHANTSERVICES_InstallID'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'QBMERCHANTSERVICES_ConnectionTicket'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'QBMERCHANTSERVICES_Language'
UPDATE dbo.[AppConfig] SET ValueType = 'integer' WHERE [Name] = 'Default_CategoryPageSize'
UPDATE dbo.[AppConfig] SET ValueType = 'integer' WHERE [Name] = 'Default_SectionPageSize'
UPDATE dbo.[AppConfig] SET ValueType = 'integer' WHERE [Name] = 'Default_LibraryPageSize'
UPDATE dbo.[AppConfig] SET ValueType = 'integer' WHERE [Name] = 'Default_ManufacturerPageSize'
UPDATE dbo.[AppConfig] SET ValueType = 'integer' WHERE [Name] = 'Default_DistributorPageSize'
UPDATE dbo.[AppConfig] SET ValueType = 'integer' WHERE [Name] = 'Default_ProductPageSize'
UPDATE dbo.[AppConfig] SET ValueType = 'integer' WHERE [Name] = 'Default_DocumentPageSize'
UPDATE dbo.[AppConfig] SET ValueType = 'integer' WHERE [Name] = 'Default_CategoryColWidth'
UPDATE dbo.[AppConfig] SET ValueType = 'integer' WHERE [Name] = 'Default_SectionColWidth'
UPDATE dbo.[AppConfig] SET ValueType = 'integer' WHERE [Name] = 'Default_LibraryColWidth'
UPDATE dbo.[AppConfig] SET ValueType = 'integer' WHERE [Name] = 'Default_ManufacturerColWidth'
UPDATE dbo.[AppConfig] SET ValueType = 'integer' WHERE [Name] = 'Default_DistributorColWidth'
UPDATE dbo.[AppConfig] SET ValueType = 'integer' WHERE [Name] = 'Default_ProductColWidth'
UPDATE dbo.[AppConfig] SET ValueType = 'integer' WHERE [Name] = 'Default_DocumentColWidth'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'DisallowShippingToPOBoxes'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'UseMappingShipToPayment'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'XmlPackage.EmailGiftCardNotification'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'Skipjack.LiveServer'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'Skipjack.TestServer'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'Skipjack.LiveSerialNumber'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'Skipjack.DeveloperSerialNumber'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'Skipjack.LiveChangeURL'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'Skipjack.TestChangeURL'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'Skipjack.TestSerialNumber'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'Skipjack.ForceSettlement'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'MaxMind.Enabled'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'MaxMind.LicenseKey'
UPDATE dbo.[AppConfig] SET ValueType = 'decimal' WHERE [Name] = 'MaxMind.FailScoreThreshold'
UPDATE dbo.[AppConfig] SET ValueType = 'decimal' WHERE [Name] = 'MaxMind.DelayDownloadThreshold'
UPDATE dbo.[AppConfig] SET ValueType = 'decimal' WHERE [Name] = 'MaxMind.DelayDropShipThreshold'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'MaxMind.SOAPURL'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'SendWelcomeEmail'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'XmlPackage.WelcomeEmail'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'XmlPackage.RefundEmail'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'XmlPackage.OrderCanceledEmail'
UPDATE dbo.[AppConfig] SET ValueType = 'integer' WHERE [Name] = 'GatewayRetries'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'GoogleCheckout.ShowOnCartPage'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'GoogleCheckout.UseSandbox'
UPDATE dbo.[AppConfig] SET ValueType = 'decimal' WHERE [Name] = 'GoogleCheckout.DefaultShippingMarkup'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'GoogleCheckout.MerchantId'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'GoogleCheckout.MerchantKey'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'GoogleCheckout.SandboxMerchantId'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'GoogleCheckout.SandboxMerchantKey'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'GoogleCheckout.LogMessages'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'GoogleCheckout.LogFileName'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'GoogleCheckout.BaseUrl'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'GoogleCheckout.DiagnosticsOnly'
UPDATE dbo.[AppConfig] SET ValueType = 'double' WHERE [Name] = 'GoogleCheckout.DefaultTaxRate'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'GoogleCheckout.UseTaxTables'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'GoogleCheckout.ShippingIsTaxed'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'GoogleCheckout.SandBoxCheckoutButton'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'GoogleCheckout.LiveCheckoutButton'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'GoogleCheckout.SandBoxCheckoutURL'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'GoogleCheckout.AllowAnonCheckout'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'GoogleCheckout.DefaultDomesticShipToCity'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'GoogleCheckout.DefaultDomesticShipToState'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'GoogleCheckout.DefaultDomesticShipToZip'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'GoogleCheckout.DefaultDomesticShipToCountry'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'GoogleCheckout.DefaultInternationalShipToCity'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'GoogleCheckout.DefaultInternationalShipToState'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'GoogleCheckout.DefaultInternationalShipToZip'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'GoogleCheckout.DefaultInternationalShipToCountry'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'GoogleCheckout.CarrierCalculatedShippingEnabled'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'GoogleCheckout.CarrierCalculatedPackage'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'GoogleCheckout.CarrierCalculatedShippingOptions'
UPDATE dbo.[AppConfig] SET ValueType = 'decimal' WHERE [Name] = 'GoogleCheckout.CarrierCalculatedDefaultPrice'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'GoogleCheckout.CarrierCalculatedFreeOption'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'GoogleCheckout.ConversionURL'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'GoogleCheckout.ConversionParameters'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'GoogleCheckout.SendStoreReceipt'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'UseStrongPwd'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'CustomerPwdValidator'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'ShowCardStartDateFields'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'ValidateCreditCardNumbers'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'QUICKCOMMERCE_X_EMAIL'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'QUICKCOMMERCE_X_Login'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'QUICKCOMMERCE_X_Tran_Key'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'QUICKCOMMERCE_X_DELIM_DATA'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'QUICKCOMMERCE_X_DELIM_CHAR'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'QUICKCOMMERCE_X_ENCAP_CHAR'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'QUICKCOMMERCE_X_RELAY_RESPONSE'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'QUICKCOMMERCE_X_EMAIL_CUSTOMER'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'QUICKCOMMERCE_X_METHOD'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'QUICKCOMMERCE_X_RECURRING_BILLING'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'QUICKCOMMERCE_X_VERSION'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'QUICKCOMMERCE_LIVE_SERVER'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'QUICKCOMMERCE_TEST_SERVER'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'QUICKCOMMERCE_Verify_Addresses'
UPDATE dbo.[AppConfig] SET ValueType = 'integer' WHERE [Name] = 'MaxBadLogins'
UPDATE dbo.[AppConfig] SET ValueType = 'integer' WHERE [Name] = 'BadLoginLockTimeOut'
UPDATE dbo.[AppConfig] SET ValueType = 'integer' WHERE [Name] = 'AdminPwdChangeDays'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'Checkout.UseOnePageCheckout'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'Checkout.UseOnePageCheckout.UseFinalReviewOrderPage'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'TurnOffHtmlEditorInAdminSite'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'DistributorEMailCC'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'Admin.ShowSecurityFeed'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'Admin.ShowNewsFeed'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'Admin.ShowSponsorFeed'
UPDATE dbo.[AppConfig] SET ValueType = 'integer' WHERE [Name] = 'Admin.EntityFrameMenuWidth'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'AddressCCSaltField'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'OrdersCCSaltField'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'Web.Config.EncryptionProvider'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'HSBC.DocVersion'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'HSBC.ClientID'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'HSBC.ClientAlias'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'HSBC.ClientName'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'HSBC.ClientPassword'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'HSBC.Pipeline'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'HSBC.Mode.Test'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'HSBC.Mode.Live'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'HSBC.Test.Server'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'HSBC.Live.Server'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'AdminAlert.Message'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'AdminAlert.BackgroundColor'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'AdminAlert.FontColor'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'VAT.Enabled'
UPDATE dbo.[AppConfig] SET ValueType = 'integer' WHERE [Name] = 'VAT.DefaultSetting'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'VAT.AllowCustomerToChooseSetting'
UPDATE dbo.[AppConfig] SET ValueType = 'integer' WHERE [Name] = 'VAT.CountryID'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'VAT.RoundPerItem'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'VAT.HideTaxInOrderSummary'
UPDATE dbo.[AppConfig] SET ValueType = 'integer' WHERE [Name] = 'ShippingTaxClassID'
UPDATE dbo.[AppConfig] SET ValueType = 'integer' WHERE [Name] = 'IPAddress.MaxFailedTransactions'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'IPAddress.RefuseRestrictedIPsFromSite'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'InitializationVector'
UPDATE dbo.[AppConfig] SET ValueType = 'integer' WHERE [Name] = 'EncryptIterations'
UPDATE dbo.[AppConfig] SET ValueType = 'integer' WHERE [Name] = 'KeySize'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'HashAlgorithm'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'NextKeyChange'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'GoogleCheckout.AuthenticateCallback'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'CYBERSOURCE.merchantID'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'CYBERSOURCE.keysDirectory'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'CYBERSOURCE.keyFilename'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'CYBERSOURCE.LiveURL'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'CYBERSOURCE.PITURL'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'CYBERSOURCE.paCountryCode'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'CYBERSOURCE.paMerchantName'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'CYBERSOURCE.paMerchantURL'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'CYBERSOURCE.UsePIT'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'CYBERSOURCE.TestURL'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'Search_ShowGenresInResults'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'SearchAdv_ShowGenre'
UPDATE dbo.[AppConfig] SET ValueType = 'integer' WHERE [Name] = 'Default_GenrePageSize'
UPDATE dbo.[AppConfig] SET ValueType = 'integer' WHERE [Name] = 'Default_GenreColWidth'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'Tree.ShowGenres'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'Tree.ShowVectors'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'AnonCheckoutReqEmail'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'FedexShipManager.Enabled'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'NewPwdAllowedChars'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'IATS.URL'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'IATS.AgentCode'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'IATS.Password'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'TemplateSwitching.Enabled'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'TurnOffStoreAdminEMailNotifications'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'PinnaclePayments.UserName'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'PinnaclePayments.Password'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'PinnaclePayments.SOAPURL'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'AllowAddressChangeOnCheckoutShipping'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'VerifyAddressesProvider'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'VerifyAddressesProvider.USPS.Server'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'VerifyAddressesProvider.USPS.UserID'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'CardiaServices.Test.MerchantToken'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'CardiaServices.Live.MerchantToken'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'CardiaServices.Test.UserToken'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'CardiaServices.Live.UserToken'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'CardiaServices.SOAPURL'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'eWay.Test.CustomerID'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'eWay.Live.CustomerID'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'eWay.Test.URL'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'eWay.Live.URL'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'ShowFullNewsArticle'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'NewsTeaser'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'BulkImportSendsShipmentNotifications'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'Polls.Enabled'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'EntitySelectLists.Enabled'
UPDATE dbo.[AppConfig] SET ValueType = 'integer' WHERE [Name] = 'DefaultCustomerLevelID'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'BreadcrumbSeparator'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'USAePay.Test.SourceKey'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'USAePay.Test.Pin'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'USAePay.Live.SourceKey'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'USAePay.Live.Pin'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'USAePay.Description'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'USAePay.Declined'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'USAePay.TransactionError'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'USAePay.ConnectionError'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'USAePay.UseSandBox'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'SagePayUK.UseSimulator'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'SagePayUK.Vendor'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'SagePayUKURL.Live.Abort'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'SagePayUKURL.Live.Callback'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'SagePayUKURL.Live.Purchase'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'SagePayUKURL.Live.Refund'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'SagePayUKURL.Live.Release'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'SagePayUKURL.Simulator.Abort'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'SagePayUKURL.Simulator.Callback'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'SagePayUKURL.Simulator.Purchase'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'SagePayUKURL.Simulator.Refund'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'SagePayUKURL.Simulator.Release'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'SagePayUKURL.Test.Abort'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'SagePayUKURL.Test.Callback'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'SagePayUKURL.Test.Purchase'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'SagePayUKURL.Test.Refund'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'SagePayUKURL.Test.Release'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'InternationalCheckout.Enabled'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'InternationalCheckout.StoreID'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'InternationalCheckout.ForceForInternationalCustomers'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'InternationalCheckout.TestMode'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'Recurring.AUTHORIZENET_AUTOBILL_TEST_SERVER'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'Recurring.AUTHORIZENET_AUTOBILL_LIVE_SERVER'
UPDATE dbo.[AppConfig] SET ValueType = 'integer' WHERE [Name] = 'ZipCodePrefixLength'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'ShippingTrackingCarriers'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'ShippingTrackingRegEx.AusPost'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'ShippingTrackingURL.AusPost'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'ShippingTrackingRegEx.DHL'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'ShippingTrackingURL.DHL'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'ShippingTrackingRegEx.FedEx'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'ShippingTrackingURL.FedEx'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'ShippingTrackingRegEx.UPS'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'ShippingTrackingURL.UPS'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'ShippingTrackingRegEx.USPS'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'ShippingTrackingURL.USPS'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'PayFlowPro.PARTNER'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'PayFlowPro.PWD'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'PayFlowPro.USER'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'PayFlowPro.VENDOR'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'PayFlowPro.LiveURL'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'PayFlowPro.TestURL'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'UseImageResize'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'ProductImg_icon'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'ProductImg_medium'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'ProductImg_large'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'ProductImg_swatch'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'VariantImg_icon'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'VariantImg_medium'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'VariantImg_large'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'CategoryImg_icon'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'CategoryImg_medium'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'CategoryImg_large'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'ManufacturerImg_icon'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'ManufacturerImg_medium'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'ManufacturerImg_large'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'SectionImg_icon'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'SectionImg_medium'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'SectionImg_large'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'DistributorImg_icon'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'DistributorImg_medium'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'DistributorImg_large'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'LargeCreatesOthers'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'LargeOverwritesOthers'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'DefaultCrop'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'DefaultCropVertical'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'DefaultCropHorizontal'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'DefaultFillColor'
UPDATE dbo.[AppConfig] SET ValueType = 'integer' WHERE [Name] = 'DefaultQuality'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'DefaultStretch'
UPDATE dbo.[AppConfig] SET ValueType = 'integer' WHERE [Name] = 'DefaultWidth_icon'
UPDATE dbo.[AppConfig] SET ValueType = 'integer' WHERE [Name] = 'DefaultHeight_icon'
UPDATE dbo.[AppConfig] SET ValueType = 'integer' WHERE [Name] = 'DefaultWidth_medium'
UPDATE dbo.[AppConfig] SET ValueType = 'integer' WHERE [Name] = 'DefaultHeight_medium'
UPDATE dbo.[AppConfig] SET ValueType = 'integer' WHERE [Name] = 'DefaultWidth_large'
UPDATE dbo.[AppConfig] SET ValueType = 'integer' WHERE [Name] = 'DefaultHeight_large'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'MultiColorMakesSwatchAndMap'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'MultiMakesMicros'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'MicroStyle'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'SwatchStyleAuto'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'UseImagesForMultiNav'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'UseRolloverForMultiNav'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'MultiImage.UseProductIconPics'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'ApplyShippingHandlingExtraFeeToFreeShipping'
UPDATE dbo.[AppConfig] SET ValueType = 'double' WHERE [Name] = 'SubscriptionExpiredGracePeriod'
UPDATE dbo.[AppConfig] SET ValueType = 'integer' WHERE [Name] = 'Recurring.GatewayImportOffsetHours'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'Recurring.GatewayLastImportedDate'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'SecureNet.ID'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'SecureNet.Key'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'SecureNet.LiveURL'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'SecureNet.TestURL'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'FreeShippingAllowsRateSelection'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'OrderEditingEnabled'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'Ogone.PSPID'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'Ogone.USERID'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'Ogone.PSWD'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'Ogone.SHASignature'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'Ogone.LivePostURL'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'Ogone.TestPostURL'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'Ogone.LiveServerOrder'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'Ogone.TestServerOrder'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'Ogone.LiveServer'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'Ogone.TestServer'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'Ogone.Use3TierMode'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'TaxCalcMode'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'eSelectPlus.country'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'eSelectPlus.URL.CA.Live'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'eSelectPlus.URL.CA.LiveMPI'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'eSelectPlus.URL.CA.Test'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'eSelectPlus.URL.CA.TestMPI'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'eSelectPlus.URL.US.Live'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'eSelectPlus.URL.US.LiveMPI'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'eSelectPlus.URL.US.Test'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'eSelectPlus.URL.US.TestMPI'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'eSelectPlus.api_token.Test'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'eSelectPlus.store_id.Test'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'eSelectPlus.api_token.Live'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'eSelectPlus.store_id.Live'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'eSelectPlus.crypt'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'eSelectPlus.includeAVS'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'BuySafe.Enabled'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'BuySafe.Username'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'BuySafe.Password'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'BuySafe.MspId'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'BuySafe.Hash'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'BuySafe.StoreToken'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'BuySafe.JsUrl'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'BuySafe.RegUrl'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'BuySafe.InvitationCode'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'BuySafe.SealSize'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'HSBC.CcpaURL'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'HSBC.CcpaClientID'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'ShowEditButtonInCartForKitProducts'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'ShowEditButtonInCartForPackProducts'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'ShowEditButtonInCartForRegularProducts'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'Zoomify.Active'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'Zoomify.GalleryMedium'
UPDATE dbo.[AppConfig] SET ValueType = 'integer' WHERE [Name] = 'Zoomify.Large.Height'
UPDATE dbo.[AppConfig] SET ValueType = 'integer' WHERE [Name] = 'Zoomify.Large.Width'
UPDATE dbo.[AppConfig] SET ValueType = 'integer' WHERE [Name] = 'Zoomify.Medium.Height'
UPDATE dbo.[AppConfig] SET ValueType = 'integer' WHERE [Name] = 'Zoomify.Medium.Width'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'Zoomify.ProductLarge'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'Zoomify.ProductMedium'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'CardinalCommerce.Centinel.TransactionPwd'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'CardinalCommerce.Centinel.MyECheckMarkAsCaptured'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'Shipwire.Username'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'Shipwire.Password'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'Google.AnalyticsAccount'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'Google.EcomOrderTrackingEnabled'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'AuditLog.Enabled'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'Admin_OrderStatisticIsChart'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'CacheEntityPageHTML'
UPDATE dbo.[AppConfig] SET ValueType = 'integer' WHERE [Name] = 'NumPreviouslyUsedPwds'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'ShowShippingAndTaxEstimate'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'DisallowAnonCustomerToCreateWishlist'
UPDATE dbo.[AppConfig] SET ValueType = 'double' WHERE [Name] = '404.ComparisonDistance'
UPDATE dbo.[AppConfig] SET ValueType = 'multiselect', AllowableValues = 'product, category, manufacturer, section, topic' WHERE [Name] = '404.VisibleSuggestions'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'Show404SuggestionLinks'
UPDATE dbo.[AppConfig] SET ValueType = 'integer' WHERE [Name] = '404.NumberOfSuggestedLinks'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'DisplayOutOfStockProducts'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'DisplayOutOfStockOnProductPages'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'DisplayOutOfStockOnEntityPages'
UPDATE dbo.[AppConfig] SET ValueType = 'integer' WHERE [Name] = 'OutOfStockThreshold'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'SagePayments.MERCHANT_KEY'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'SagePayments.ServiceURLTEST'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'SagePayments.ServiceURL'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'SagePayments.MERCHANT_ID'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'DynamicRelatedProducts.Enabled'
UPDATE dbo.[AppConfig] SET ValueType = 'integer' WHERE [Name] = 'DynamicRelatedProducts.NumberDisplayed'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'RecentlyViewedProducts.Enabled'
UPDATE dbo.[AppConfig] SET ValueType = 'integer' WHERE [Name] = 'RecentlyViewedProducts.NumberDisplayed'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'RecentlyViewedProducts.ProductsFormat'
UPDATE dbo.[AppConfig] SET ValueType = 'integer' WHERE [Name] = 'RecentlyViewedProductsGridColWidth'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'RTShipping.AllowLocalPickup'
UPDATE dbo.[AppConfig] SET ValueType = 'decimal' WHERE [Name] = 'RTShipping.LocalPickupCost'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'RTShipping.LocalPickupRestrictionType'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'RTShipping.LocalPickupRestrictionStates'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'RTShipping.LocalPickupRestrictionZips'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'RTShipping.LocalPickupRestrictionZones'
UPDATE dbo.[AppConfig] SET ValueType = 'integer' WHERE [Name] = 'Captcha.NumberOfCharacters'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'Captcha.AllowedCharactersRegex'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'Captcha.ImageBackColor'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'Captcha.ImageForeColor'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'Captcha.TextBackColor'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'Captcha.TextForeColor'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'Captcha.HorizontalColor'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'Captcha.VerticalColor'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'Captcha.CaseSensitive'
UPDATE dbo.[AppConfig] SET ValueType = 'integer' WHERE [Name] = 'Captcha.MaxAsciiValue'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'NETAXEPT.Test_UI'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'NETAXEPT.Live_UI'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'NETAXEPT.Test_Server'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'NETAXEPT.Live_Server'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'NETAXEPT.Merchant_Id'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'NETAXEPT.Merchant_Token'
UPDATE dbo.[AppConfig] SET ValueType = 'string' WHERE [Name] = 'NETAXEPT.MerchantSettings.RedirectUrl'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'NETAXEPT.Error.Setup'
UPDATE dbo.[AppConfig] SET AllowableValues = 'AUTH, AUTH CAPTURE' WHERE [Name] = 'TransactionMode'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'Newsletter.UseCaptcha'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'Newsletter.GetFirstAndLast'
UPDATE dbo.[AppConfig] SET ValueType = 'decimal' WHERE [Name] = 'Newsletter.CaptchaErrorDisplayLength'
UPDATE dbo.[AppConfig] SET ValueType = 'enum' WHERE [Name] = 'Newsletter.OptInLevel'
UPDATE dbo.[AppConfig] SET ValueType = 'enum' WHERE [Name] = 'Newsletter.OptOutLevel'
UPDATE dbo.[AppConfig] SET AllowableValues = 'single, double, triple' WHERE [Name] = 'Newsletter.OptInLevel'
UPDATE dbo.[AppConfig] SET AllowableValues = 'double, triple' WHERE [Name] = 'Newsletter.OptOutLevel'

GO


/* X.X added */



GO


/* X.X added */



GO



create proc dbo.aspdnsf_insAppconfig
    @Name nvarchar(100),
    @Description ntext,
    @ConfigValue nvarchar(1000),
    @GroupName nvarchar(100),
    @SuperOnly tinyint,
    @StoreID int,
    @ValueType nvarchar(100) = null,
    @AllowableValues nvarchar(max) = null,
    @AppConfigID int OUTPUT
  
AS
SET NOCOUNT ON 


    INSERT dbo.Appconfig(AppConfigGUID, Name, Description, ConfigValue, GroupName, SuperOnly, ValueType, AllowableValues, StoreID,CreatedOn)
    VALUES (newid(), @Name, @Description, @ConfigValue, @GroupName, @SuperOnly, @ValueType, @AllowableValues, @StoreID, getdate())

    set @AppConfigID = @@identity


GO



create proc dbo.aspdnsf_getAppconfig
    @AppConfigID int = null
  
AS
SET NOCOUNT ON 

    SELECT StoreId, AppConfigID, AppConfigGUID, [Name], Description, ConfigValue, ValueType, AllowableValues, GroupName, SuperOnly, CreatedOn
    FROM dbo.Appconfig with (nolock) 
    WHERE AppConfigID = COALESCE(@AppConfigID, AppConfigID)
    ORDER BY [Name]



GO


create proc [dbo].[aspdnsf_SecurityLogInsert]
    @SecurityAction nvarchar(100),
    @Description ntext,
    @CustomerUpdated int,
    @UpdatedBy int,
    @CustomerSessionID int,
    @logid bigint OUTPUT
  
AS
SET NOCOUNT ON 


insert dbo.SecurityLog(SecurityAction, Description, ActionDate, CustomerUpdated, UpdatedBy, CustomerSessionID)
values (@SecurityAction, @Description, getdate(), @CustomerUpdated, @UpdatedBy, @CustomerSessionID)

set @logid = @@identity
 

GO



create proc [dbo].[aspdnsf_PABPEraseCCInfo]
    @CartType int
  
AS
SET NOCOUNT ON 
update dbo.orders set CardNumber='1111111111111111' where CardNumber is not null
update dbo.orders set CardNumber=NULL where CardNumber is not null

update dbo.address set CardNumber='1111111111111111' 
from dbo.address a left join (select distinct CustomerID from dbo.shoppingcart where CartType=@CartType) b on a.CustomerID = b.CustomerID
where CardNumber is not null and b.CustomerID is null

update dbo.address set CardNumber=NULL 
from dbo.address a left join (select distinct CustomerID from dbo.shoppingcart where CartType=@CartType) b on a.CustomerID = b.CustomerID
where CardNumber is not null and b.CustomerID is null


GO


create proc [dbo].[aspdnsf_getEventHandler]
    @EventID int = null
  
AS
SET NOCOUNT ON 

    SELECT EventID, [EventName], CalloutURL, XMLPackage, Active, Debug
    FROM dbo.EventHandler with (nolock) 
    WHERE EventID = COALESCE(@EventID, EventID)
    ORDER BY [EventName]
GO


GO


create proc [dbo].[aspdnsf_updEventHandler]
    @EventID int,
    @EventName nvarchar(20) = null,
    @CalloutURL varchar(200) = null,
    @XmlPackage varchar(100) = null,
    @Active bit = null,
    @Debug bit =null
  
AS
SET NOCOUNT ON 


    UPDATE dbo.EventHandler
    SET 
        EventName = COALESCE(@EventName, EventName),
        CalloutURL = COALESCE(@CalloutURL, CalloutURL),
        XmlPackage = COALESCE(@XmlPackage, XmlPackage),
        Active = COALESCE(@Active, Active),
        Debug = COALESCE(@Debug, Debug)
    WHERE EventID = @EventID


GO


create proc [dbo].[aspdnsf_insEventHandler]
    @EventName nvarchar(20),
    @CalloutURL varchar(200),
    @XmlPackage varchar(100),
    @Active bit,
    @Debug bit,
    @EventID int OUTPUT
  
AS
SET NOCOUNT ON 


    if exists (select * from dbo.EventHandler with (nolock) where EventName = @EventName)
        set @EventID = -1
    else begin
        INSERT dbo.EventHandler(EventName, CalloutURL, XmlPackage, Active, Debug)
        VALUES (@EventName, @CalloutURL, @XmlPackage, @Active, @Debug)
        set @EventID = @@identity
    end 

GO


GO


create proc [dbo].[aspdnsf_RemoveDuplicateAppConfigs] 
as
BEGIN
    delete from [dbo].appconfig where appconfigid in (select max(AppConfigID) as AppConfigID from AppConfig where name in (select name from appconfig group by name having count(name) > 1)  group by name)
end


GO



create proc [dbo].[aspdnsf_ShowDuplicateAppConfigs] 
  
as
BEGIN
    select * from dbo.appconfig with (nolock) where name in (select name from dbo.appconfig with (nolock) group by name having count(name) > 1) order by name
end



GO


create proc dbo.aspdnsf_updAppconfig
    @AppConfigID int,
    @Description ntext = null,
    @ConfigValue nvarchar(1000) = null,
    @GroupName nvarchar(100) = null,
    @SuperOnly tinyint = null,
    @StoreID int = null,
    @ValueType nvarchar(100) = null,
    @AllowableValues nvarchar(max) = null
  
AS
SET NOCOUNT ON 


    UPDATE dbo.Appconfig
    SET 
        Description = COALESCE(@Description, Description),
        ConfigValue = COALESCE(@ConfigValue, ConfigValue),
        GroupName = COALESCE(@GroupName, GroupName),
        SuperOnly = COALESCE(@SuperOnly, SuperOnly),
        StoreID =  COALESCE(@StoreID, StoreID),
	ValueType =  COALESCE(@ValueType, ValueType),
	AllowableValues = COALESCE(@AllowableValues, AllowableValues)
    WHERE AppConfigID = @AppConfigID



GO


create proc dbo.aspdnsf_insSysLog
    @message nvarchar(max),
    @details nvarchar(max),
	@type nvarchar(100),
	@severity nvarchar(100)  
  
AS
SET NOCOUNT ON

INSERT [dbo].[aspdnsf_SysLog] (Message,Details,Type,Severity)
	VALUES(	@message,
			@details,
			@type,
			@severity)


GO



create proc dbo.aspdnsf_getSysLog
	@type nvarchar(100),
	@severity nvarchar(100),
	@startDate DateTime,
	@endDate DateTime  
  
AS
SET NOCOUNT ON

select * from aspdnsf_SysLog
where CreatedOn >= @startDate
	and CreatedOn <= @endDate
	and (@type = 'ALL' or [Type] = @type)
	and (@severity = 'ALL' or Severity = @Severity)


GO


set IDENTITY_INSERT [dbo].LOG_Event ON;
INSERT [dbo].LOG_Event(EventID,Name) values(1,'Home Page');
INSERT [dbo].LOG_Event(EventID,Name) values(2,'Driver Page');
INSERT [dbo].LOG_Event(EventID,Name) values(17,'Sign In Started');
INSERT [dbo].LOG_Event(EventID,Name) values(4,'Search Page');
INSERT [dbo].LOG_Event(EventID,Name) values(5,'ShoppingCart');
INSERT [dbo].LOG_Event(EventID,Name) values(6,'Checkout Start');
INSERT [dbo].LOG_Event(EventID,Name) values(18,'Sign In Successful');
INSERT [dbo].LOG_Event(EventID,Name) values(19,'Photo Page');
INSERT [dbo].LOG_Event(EventID,Name) values(9,'Category Page');
INSERT [dbo].LOG_Event(EventID,Name) values(10,'Product Page');
INSERT [dbo].LOG_Event(EventID,Name) values(20,'Add To Cart');
INSERT [dbo].LOG_Event(EventID,Name) values(21,'Add To Cart');
INSERT [dbo].LOG_Event(EventID,Name) values(22,'Checkout_Account');
INSERT [dbo].LOG_Event(EventID,Name) values(14,'Featured Item');
INSERT [dbo].LOG_Event(EventID,Name) values(15,'Submit Order');
INSERT [dbo].LOG_Event(EventID,Name) values(16,'Sign Out');
INSERT [dbo].LOG_Event(EventID,Name) values(23,'Checkout_Card');
INSERT [dbo].LOG_Event(EventID,Name) values(24,'OrderConfirmation');
INSERT [dbo].LOG_Event(EventID,Name) values(25,'PrintableReceipt');
INSERT [dbo].LOG_Event(EventID,Name) values(26,'Manufacturer Page');
INSERT [dbo].LOG_Event(EventID,Name) values(27,'Manufacturers List Page');
set IDENTITY_INSERT [dbo].LOG_Event OFF;


GO


INSERT dbo.Eventhandler (EventName, CalloutURL, XmlPackage, Active) VALUES ('ViewProductPage', '', 'event.default.xml.config', 0);
INSERT dbo.Eventhandler (EventName, CalloutURL, XmlPackage, Active) VALUES ('ViewEntityPage', '', 'event.default.xml.config', 0);
INSERT dbo.Eventhandler (EventName, CalloutURL, XmlPackage, Active) VALUES ('AddToCart', '', 'event.default.xml.config', 0);
INSERT dbo.Eventhandler (EventName, CalloutURL, XmlPackage, Active) VALUES ('BeginCheckout', '', 'event.default.xml.config', 0);
INSERT dbo.Eventhandler (EventName, CalloutURL, XmlPackage, Active) VALUES ('RemoveFromCart', '', 'event.default.xml.config', 0);
INSERT dbo.Eventhandler (EventName, CalloutURL, XmlPackage, Active) VALUES ('CreateCustomer', '', 'event.default.xml.config', 0);
INSERT dbo.Eventhandler (EventName, CalloutURL, XmlPackage, Active) VALUES ('UpdateCustomer', '', 'event.default.xml.config', 0);
INSERT dbo.Eventhandler (EventName, CalloutURL, XmlPackage, Active) VALUES ('DeleteCustomer', '', 'event.default.xml.config', 0);
INSERT dbo.Eventhandler (EventName, CalloutURL, XmlPackage, Active) VALUES ('NukeCustomer', '', 'event.default.xml.config', 0);
INSERT dbo.Eventhandler (EventName, CalloutURL, XmlPackage, Active) VALUES ('CreateAccount', '', 'event.default.xml.config', 0);
INSERT dbo.Eventhandler (EventName, CalloutURL, XmlPackage, Active) VALUES ('CheckoutShipping', '', 'event.default.xml.config', 0);
INSERT dbo.Eventhandler (EventName, CalloutURL, XmlPackage, Active) VALUES ('CheckoutPayment', '', 'event.default.xml.config', 0);
INSERT dbo.Eventhandler (EventName, CalloutURL, XmlPackage, Active) VALUES ('CheckoutReview', '', 'event.default.xml.config', 0);
INSERT dbo.Eventhandler (EventName, CalloutURL, XmlPackage, Active) VALUES ('NewOrder', '', 'event.default.xml.config', 0);
INSERT dbo.Eventhandler (EventName, CalloutURL, XmlPackage, Active) VALUES ('OrderDeleted', '', 'event.default.xml.config', 0);
INSERT dbo.Eventhandler (EventName, CalloutURL, XmlPackage, Active) VALUES ('OrderVoided', '', 'event.default.xml.config', 0);
INSERT dbo.Eventhandler (EventName, CalloutURL, XmlPackage, Active) VALUES ('OrderShipped', '', 'event.default.xml.config', 0);
INSERT dbo.Eventhandler (EventName, CalloutURL, XmlPackage, Active) VALUES ('OrderRefunded', '', 'event.default.xml.config', 0);


GO


create proc [dbo].[aspdnsf_delTaxClass]
    @TaxClassID int
  
AS
SET NOCOUNT ON 

BEGIN TRAN

    DELETE dbo.StateTaxRate where TaxClassID = @TaxClassID
    IF @@ERROR <> 0 BEGIN
        ROLLBACK TRAN
        RAISERROR('Deleting TaxClass from StateTaxRate failed', 16, 1)
        RETURN
    END


    DELETE dbo.CountryTaxRate where TaxClassID = @TaxClassID
    IF @@ERROR <> 0 BEGIN
        ROLLBACK TRAN
        RAISERROR('Deleting TaxClass from CountryTaxRate failed', 16, 1)
        RETURN
    END


    DELETE dbo.ZipTaxRate where TaxClassID = @TaxClassID
    IF @@ERROR <> 0 BEGIN
        ROLLBACK TRAN
        RAISERROR('Deleting TaxClass from ZipTaxRate failed', 16, 1)
        RETURN
    END

    
    DELETE dbo.TaxClass where TaxClassID = @TaxClassID
    IF @@ERROR <> 0 BEGIN
        ROLLBACK TRAN
        RAISERROR('Deleting TaxClass failed', 16, 1)
        RETURN
    END

    
COMMIT TRAN


GO


create proc [dbo].[aspdnsf_getTaxclass]
    @TaxClassID int = null
  
AS
SET NOCOUNT ON 

SELECT TaxClassID, TaxClassGUID, Name, TaxCode, DisplayOrder, CreatedOn
FROM dbo.Taxclass with (nolock) 
WHERE TaxClassID = COALESCE(@TaxClassID, TaxClassID)



GO


create proc [dbo].[aspdnsf_updTaxclass]
    @TaxClassID int,
    @TaxCode nvarchar(400),
    @DisplayOrder int
  
AS
SET NOCOUNT ON 

UPDATE dbo.Taxclass
SET 
    TaxCode = COALESCE(@TaxCode, TaxCode),
    DisplayOrder = COALESCE(@DisplayOrder, DisplayOrder)
WHERE TaxClassID = @TaxClassID


GO


create proc [dbo].[aspdnsf_insTaxclass]
    @Name nvarchar(400),
    @TaxCode nvarchar(400),
    @DisplayOrder int,
    @TaxClassID int OUTPUT
  
AS
SET NOCOUNT ON 

insert dbo.Taxclass(TaxClassGUID, Name, TaxCode, DisplayOrder, CreatedOn)
values (newid(), @Name, @TaxCode, @DisplayOrder, getdate())

set @TaxClassID = @@identity


GO


create proc [dbo].[aspdnsf_updZipTaxRate]
    @ZipTaxID int,
    @TaxRate money,
	@CountryID int
  
AS
SET NOCOUNT ON 
UPDATE dbo.ZipTaxRate
SET 
    TaxRate = COALESCE(@TaxRate, TaxRate)
WHERE ZipTaxID = @ZipTaxID AND CountryID = @CountryID

GO


create proc [dbo].[aspdnsf_UpdateZipTaxRateCountry]
    @ZipTaxID int,
	@ZipCode nvarchar (20),
    @TaxRate money,
	@CountryID int,
	@OriginalCountryID int
  
AS
SET NOCOUNT ON 


UPDATE dbo.ZipTaxRate
SET 
    TaxRate = COALESCE(@TaxRate, TaxRate), CountryID = (COALESCE(@CountryID, CountryID)), ZipCode = (COALESCE(@ZipCode, ZipCode))
WHERE ZipTaxID = @ZipTaxID AND CountryID = @OriginalCountryID


GO


create proc [dbo].[aspdnsf_insCountryTaxRate]
    @CountryID int,
    @TaxClassID int,
    @TaxRate money,
    @CountryTaxID int OUTPUT
      
AS
SET NOCOUNT ON 


insert dbo.CountryTaxRate(CountryID, TaxClassID, TaxRate, CreatedOn)
values (@CountryID, @TaxClassID, @TaxRate, getdate())

set @CountryTaxID = @@identity


GO


create proc [dbo].[aspdnsf_getCountryTaxRate]
    @CountryID int = null,
    @TaxClassID int = null
  
AS
SET NOCOUNT ON 


SELECT ctr.CountryTaxID, ctr.CountryID, ctr.TaxClassID, ctr.TaxRate, ctr.CreatedOn, t.Name TaxClass, c.Name Country
FROM dbo.CountryTaxRate ctr with (nolock) join dbo.TaxClass t with (nolock) on ctr.TaxClassID = t.TaxClassID join dbo.Country c on c.CountryID = ctr.CountryID
WHERE ctr.CountryID = COALESCE(@CountryID, ctr.CountryID) and ctr.TaxClassID = COALESCE(@TaxClassID, ctr.TaxClassID)


GO


create proc [dbo].[aspdnsf_getCountryTaxRateByID]
    @CountryTaxID int
  
AS
SET NOCOUNT ON 


SELECT ctr.CountryTaxID, ctr.CountryID, ctr.TaxClassID, ctr.TaxRate, ctr.CreatedOn, t.Name TaxClass, c.Name Country
FROM dbo.CountryTaxRate ctr with (nolock) join dbo.TaxClass t with (nolock) on ctr.TaxClassID = t.TaxClassID join dbo.Country c on c.CountryID = ctr.CountryID
WHERE ctr.CountryTaxID = @CountryTaxID


GO


create proc [dbo].[aspdnsf_updCountryTaxRate]
    @CountryTaxID int,
    @TaxRate money
  
AS
SET NOCOUNT ON 


UPDATE dbo.CountryTaxRate
SET 
    TaxRate = COALESCE(@TaxRate, TaxRate)
WHERE CountryTaxID = @CountryTaxID


GO


create proc [dbo].[aspdnsf_getStateTaxRate]
    @StateID int = null,
    @TaxClassID int = null
  
AS
SET NOCOUNT ON 


SELECT sr.StateTaxID, sr.StateID, sr.TaxClassID, sr.TaxRate, sr.CreatedOn, t.Name TaxClass, s.Name StateName
FROM dbo.StateTaxRate sr with (nolock) join dbo.TaxClass t with (nolock) on sr.TaxClassID = t.TaxClassID join dbo.State s on s.StateID = sr.StateID
WHERE sr.StateID = COALESCE(@StateID, sr.StateID) and sr.TaxClassID = COALESCE(@TaxClassID, sr.TaxClassID)


GO


create proc [dbo].[aspdnsf_getStateTaxRateByID]
    @StateTaxID int
  
AS
SET NOCOUNT ON 


SELECT sr.StateTaxID, sr.StateID, sr.TaxClassID, sr.TaxRate, sr.CreatedOn, t.Name TaxClass, s.Name StateName
FROM dbo.StateTaxRate sr with (nolock) join dbo.TaxClass t with (nolock) on sr.TaxClassID = t.TaxClassID join dbo.State s on s.StateID = sr.StateID
WHERE StateTaxID = @StateTaxID


GO


create proc [dbo].[aspdnsf_insStateTaxRate]
    @StateID int,
    @TaxClassID int,
    @TaxRate money,
    @StateTaxID int OUTPUT
  
AS
SET NOCOUNT ON 


insert dbo.StateTaxRate(StateID, TaxClassID, TaxRate, CreatedOn)
values (@StateID, @TaxClassID, @TaxRate, getdate())

set @StateTaxID = @@identity



GO


create proc [dbo].[aspdnsf_updStateTaxRate]
    @StateTaxID int,
    @TaxRate money
  
AS
SET NOCOUNT ON 


UPDATE dbo.StateTaxRate
SET 
    TaxRate = COALESCE(@TaxRate, TaxRate)
WHERE StateTaxID = @StateTaxID



GO


CREATE PROCEDURE dbo.[aspdnsf_SelectZipTaxRatesAll]  
  
AS  
	  
SET NOCOUNT ON  
  
SELECT  
 ztr.[ZipCode],  
 ztr.[TaxRate],  
 ztr.[CreatedOn],  
 ztr.[ZipTaxID],  
 ztr.[TaxClassID],  
 ztr.[CountryId], 
 t.[Name] TaxClass  
FROM  
 dbo.[ZipTaxRate] ztr  
JOIN  
 dbo.[TaxClass] t ON ztr.TaxClassID = t.TaxClassID  



GO


create proc [dbo].[aspdnsf_getZipTaxRateByID]
    @ZipTaxID int
  
AS
SET NOCOUNT ON 


SELECT ztr.ZipTaxID, ztr.ZipCode, ztr.TaxClassID, ztr.TaxRate, ztr.CreatedOn, ztr.CountryId, t.Name TaxClass
FROM dbo.ZipTaxRate ztr with (nolock) join dbo.TaxClass t with (nolock) on ztr.TaxClassID = t.TaxClassID 
WHERE ztr.ZipTaxID = @ZipTaxID 


GO


create proc [dbo].[aspdnsf_getZipTaxRate]
    @ZipCode nvarchar(10) = null,
    @TaxClassID int = null
  
AS
SET NOCOUNT ON 


SELECT ztr.ZipTaxID, ztr.ZipCode, ztr.TaxClassID, ztr.TaxRate, ztr.CreatedOn, t.Name TaxClass
FROM dbo.ZipTaxRate ztr with (nolock) join dbo.TaxClass t with (nolock) on ztr.TaxClassID = t.TaxClassID 
WHERE ztr.ZipCode = COALESCE(@ZipCode, ztr.ZipCode) and ztr.TaxClassID = COALESCE(@TaxClassID, ztr.TaxClassID)



GO


create proc [dbo].[aspdnsf_insZipTaxRate]
    @ZipCode nvarchar(10),
    @TaxClassID int,
    @TaxRate money,
    @CountryId int
  
AS
SET NOCOUNT ON 


insert dbo.ZipTaxRate(ZipCode, TaxClassID, TaxRate, CreatedOn, CountryId)
values (@ZipCode, @TaxClassID, @TaxRate, getdate(), @CountryId)

SELECT SCOPE_IDENTITY()

GO


set IDENTITY_INSERT [dbo].TaxClass ON;
INSERT [dbo].TaxClass(TaxClassID,Name,TaxCode) values(1,'Goods','');
INSERT [dbo].TaxClass(TaxClassID,Name,TaxCode) values(2,'Services','');
INSERT [dbo].TaxClass(TaxClassID,Name,TaxCode) values(3,'Shipping','');
INSERT [dbo].TaxClass(TaxClassID,Name,TaxCode) values(4,'Tobacco','');
INSERT [dbo].TaxClass(TaxClassID,Name,TaxCode) values(5,'Alcohol','');
set IDENTITY_INSERT [dbo].TaxClass OFF;

GO


set IDENTITY_INSERT [dbo].CreditCardType ON;
INSERT [dbo].CreditCardType(CardTypeID,CardType,Accepted) values(1,'VISA',1);
INSERT [dbo].CreditCardType(CardTypeID,CardType,Accepted) values(2,'MasterCard',1);
INSERT [dbo].CreditCardType(CardTypeID,CardType,Accepted) values(3,'AMEX',1);
INSERT [dbo].CreditCardType(CardTypeID,CardType,Accepted) values(4,'DISCOVER',1);
set IDENTITY_INSERT [dbo].CreditCardType OFF;


GO


create proc [dbo].[aspdnsf_DropAndRecreateAllNonPrimaryIndexes] 
  
as
BEGIN
    exec dbo.aspdnsf_DropAllNonPrimaryIndexes
    exec dbo.aspdnsf_CreateIndexes
END


GO


EXEC [dbo].[aspdnsf_CreateIndexes] 


GO


CREATE FUNCTION dbo.FindQtyDiscountID(@entityid int, @entitytype varchar(20))
RETURNS int
AS
BEGIN
    DECLARE @qid int, @pentid int
    SELECT @qid = QuantityDiscountID, @pentid = ParentEntityID from dbo.entitymaster where entityid = @entityid and EntityType = @entitytype

    IF (isnull(@qid, 0) = 0) and (isnull(@pentid, 0) <> 0) BEGIN
        select @qid = dbo.FindQtyDiscountID(@pentid, @entitytype)
    END

    RETURN isnull(@qid, 0)
END


GO


CREATE FUNCTION [dbo].[GetQtyDiscountID](@productid int)
RETURNS int
AS
BEGIN

    DECLARE @did int
    SET @did = 0

    SELECT @did =  isnull(QuantityDiscountID, 0) FROM dbo.product with (nolock) WHERE productid = @productid

    IF @did = 0
        select top 1 @did = dbo.FindQtyDiscountID(pe.entityid, pe.EntityType) 
        From dbo.productentity pe join dbo.EntityMaster em on pe.EntityType = em.EntityType and pe.entityid = em.entityid 
        where pe.EntityType in ('category', 'section', 'manufacturer') and productid = @productid and dbo.FindQtyDiscountID(pe.entityid, pe.EntityType) > 0
        order by case pe.EntityType when 'category' then 1 when 'section' then 2 when 'manufacturer' then 3 end, em.parententityid, pe.displayorder


    IF @did = 0 BEGIN
        declare @cfg nvarchar(100)
        select @cfg = configvalue from dbo.AppConfig with (nolock) where [name] = 'FromActiveQuantityDiscountTable'
        select @did = QuantityDiscountID from dbo.QuantityDiscount with (nolock) where [name] like '%' + @cfg + '%'
    END 

    RETURN @did
END 


GO


CREATE FUNCTION dbo.PackPriceDelta(@CustomerID int, @CustomerLevelID int, @PackID int, @ShoppingCartRecID int)
RETURNS decimal(15, 6)
AS
BEGIN
    DECLARE @deltaprice money

    select @deltaprice = sum(dbo.GetCustomerLevelPrice(VariantID, @CustomerLevelID)*Quantity)
    FROM dbo.customcart with (nolock) 
    WHERE CustomerID = @CustomerID and PackID = @PackID and ShoppingCartRecid = @ShoppingCartRecID

    RETURN @deltaprice
END


GO


CREATE proc dbo.aspdnsf_AddItemToCart
    @CustomerID int,
    @ProductID int,
    @VariantID int,
    @Quantity int,
    @ShippingAddressID int,
    @BillingAddressID int,
    @ChosenColor nvarchar(100),
    @ChosenColorSKUModifier varchar(100),
    @ChosenSize nvarchar(100),
    @ChosenSizeSKUModifier varchar(100),
    @CleanColorOption nvarchar(100), 
    @CleanSizeOption nvarchar(100),
    @ColorAndSizePriceDelta money,
    @TextOption ntext,
    @CartType int,
    @GiftRegistryForCustomerID int,
    @CustomerEnteredPrice money,
    @CustomerLevelID int = 0,
    @RequiresCount int = 0, 		
	@IsKit2 tinyint = 0,
    @NewShoppingCartRecID int OUTPUT,
    @StoreID int
    
  
AS
SET NOCOUNT ON


DECLARE @RestrictedQy varchar(8000), @CurrentCartQty int, @InventoryFullSKU nvarchar(50), @InventoryWeightDelta money, @AllowEmptySkuAddToCart varchar(10), @ShoppingCartrecid int, @IsAKit tinyint, @IsAPack tinyint
DECLARE @levelprice money, @LevelDiscountPercent money, @LevelDiscountsApplyToExtendedPrices tinyint, @CustEntersPrice tinyint

SELECT @CustEntersPrice = CustomerEntersPrice, @RestrictedQy = RestrictedQuantities FROM dbo.ProductVariant with (nolock) WHERE VariantID = @VariantID

SELECT	@IsAKit = IsAKit, @IsAPack = IsAPack FROM dbo.Product with (nolock) WHERE ProductID = @ProductID 


SELECT @CurrentCartQty = Quantity From dbo.shoppingcart with (nolock) where ShippingAddressID = @ShippingAddressID and ProductID = @ProductID and VariantID = @VariantID and ChosenColor = @ChosenColor and ChosenSize = @ChosenSize and TextOption like @TextOption and CustomerID = @CustomerID and GiftRegistryForCustomerID = @GiftRegistryForCustomerID and CartType = @CartType and StoreID = @StoreID

DECLARE @RQty int
IF isnull(rtrim(@RestrictedQy), '') = ''
    set @RQty = -1
ELSE
    SELECT @RQty = cast(items as int) FROM dbo.Split(@RestrictedQy, ',') WHERE cast(items as int) <= isnull(@CurrentCartQty, 0) + @Quantity

IF @CustomerLevelID = 0
    SELECT @LevelDiscountPercent = 0.0, @LevelDiscountsApplyToExtendedPrices = 0
ELSE
    SELECT @LevelDiscountPercent = LevelDiscountPercent, @LevelDiscountsApplyToExtendedPrices = LevelDiscountsApplyToExtendedPrices FROM dbo.customerlevel with (nolock) WHERE customerlevelid = @CustomerLevelID    

-- if item already exists in the cart update it's quantity
IF @CurrentCartQty is not null and @IsAKit = 0 and @IsAPack = 0 and @CustEntersPrice = 0  BEGIN
    UPDATE dbo.ShoppingCart 
    SET Quantity = case @RQty when -1 then Quantity + @Quantity else isnull(@RQty, 0) end , 
        RequiresCount = RequiresCount + @RequiresCount 
    WHERE ShippingAddressID = @ShippingAddressID and ProductID = @ProductID and VariantID = @VariantID and ChosenColor = @ChosenColor and ChosenSize = @ChosenSize and TextOption like @TextOption and CustomerID = @CustomerID and GiftRegistryForCustomerID =
 @GiftRegistryForCustomerID and CartType = @CartType

    SET @NewShoppingCartRecID = 0
    RETURN
END


SELECT @AllowEmptySkuAddToCart = ConfigValue FROM dbo.AppConfig with (nolock) WHERE [name]= 'AllowEmptySkuAddToCart'


--Insert item into ShoppingCart
INSERT dbo.ShoppingCart(CartType,ShoppingCartRecGUID,CustomerID,ShippingAddressID,BillingAddressID,ProductID,SubscriptionInterval,SubscriptionIntervalType,VariantID,ProductSKU,ProductPrice,CustomerEntersPrice,ProductWeight,ProductDimensions,Quantity,RequiresCount,ChosenColor,ChosenColorSKUModifier,ChosenSize,ChosenSizeSKUModifier,TextOption,IsTaxable,IsShipSeparately,IsDownload,DownloadLocation,FreeShipping,DistributorID,RecurringInterval,RecurringIntervalType, IsSystem, IsAKit, IsAPack, TaxClassID, IsKit2, StoreID)
SELECT 
    @CartType,
    newid(),
    @CustomerID,
    @ShippingAddressID,
    @BillingAddressID,
    @ProductID, 
    pv.SubscriptionInterval,
    pv.SubscriptionIntervalType,
    @VariantID,
    case when i.VendorFullSKU is null or rtrim(i.VendorFullSKU) = '' then isnull(p.sku, '') + isnull(pv.skusuffix, '') + isnull(@ChosenColorSKUModifier, '') + isnull(@ChosenSizeSKUModifier, '') else i.VendorFullSKU end,
    case when isnull(@CustomerEnteredPrice, 0) > 0 then @CustomerEnteredPrice 
         when p.IsAKit = 1 then dbo.GetCustomerLevelPrice(pv.VariantID, @CustomerLevelID)+((dbo.KitPriceDelta(@CustomerID, @ProductID, 0)*(100.0 - @LevelDiscountPercent))/100.0)
         when p.IsAPack = 1 and p.PackSize = 0 then dbo.PackPriceDelta(@CustomerID, @CustomerLevelID, @ProductID, 0)+@ColorAndSizePriceDelta 
         else dbo.GetCustomerLevelPrice(pv.VariantID, @CustomerLevelID)+@ColorAndSizePriceDelta 
    end,
    case when @CustomerEnteredPrice is not null and @CustomerEnteredPrice > 0 then 1 else 0 end,
    pv.Weight + case when p.IsAKit = 1 then dbo.KitWeightDelta(@CustomerID, @ProductID, 0) else isnull(i.WeightDelta, 0) end,
    pv.Dimensions,
    case @RQty when -1 then @Quantity else isnull(@RQty, 0) end,
    @RequiresCount,
    @ChosenColor,
    case when i.VendorFullSKU is null or rtrim(i.VendorFullSKU) = '' then @ChosenColorSKUModifier else '' end,
    @ChosenSize,
    case when i.VendorFullSKU is null or rtrim(i.VendorFullSKU) = '' then @ChosenSizeSKUModifier else '' end,
    @TextOption,
    pv.IsTaxable,
    pv.IsShipSeparately,
    pv.IsDownload,
    pv.DownloadLocation,
    pv.FreeShipping,
    isnull(pd.DistributorID, 0),
    case pv.RecurringInterval when 0 then 1 else pv.RecurringInterval end,
    case pv.RecurringIntervalType when 0 then -5 else pv.RecurringIntervalType end,
    p.IsSystem,
    p.IsAKit,
    p.IsAPack,
    p.TaxClassID,
	@IsKit2,
	@StoreID
FROM dbo.Product p with (NOLOCK) 
    join dbo.ProductVariant pv with (NOLOCK) on p.productid = pv.productid 
    left join dbo.Inventory i with (NOLOCK) on pv.VariantID = i.VariantID and i.size = @CleanSizeOption and i.color = @CleanColorOption
    left join dbo.ProductDistributor pd with (NOLOCK) on p.ProductID = pd.ProductID 
WHERE p.ProductID = @ProductID 
    and pv.VariantID = @VariantID 
    and (@AllowEmptySkuAddToCart = 'true' or rtrim(case when i.VendorFullSKU is null or rtrim(i.VendorFullSKU) = '' then isnull(p.sku, '') + isnull(pv.skusuffix, '') + isnull(@ChosenColorSKUModifier, '') + isnull(@ChosenSizeSKUModifier, '') else i.VendorFullSKU end) <> '')

SET @ShoppingCartrecid = @@IDENTITY

--Update KitCart And CustomCart Tables if necessary
IF (@IsAKit = 1 AND @IsKit2 = 0) BEGIN
    UPDATE KitCart SET ShoppingCartRecID = @ShoppingCartrecid WHERE ProductID = @ProductID and VariantID = @VariantID and ShoppingCartRecID = 0 and CustomerID = @CustomerID
END

IF @IsAPack = 1 BEGIN
    UPDATE CustomCart SET CartType = @CartType, ShoppingCartRecID = @ShoppingCartrecid WHERE PackID = @ProductID and ShoppingCartRecID = 0 and CustomerID = @CustomerID
END

SET @NewShoppingCartRecID = @ShoppingCartrecid

GO


CREATE PROC aspdnsf_updOrderItemQuantityDiscount
    @OrderNumber int   
     
  
AS
SET NOCOUNT ON

UPDATE dbo.orders_ShoppingCart
SET OrderedProductQuantityDiscountID = dbo.GetQtyDiscountID(sc.ProductID),
    OrderedProductQuantityDiscountPercent = COALESCE(NULLIF(dbo.GetQtyDiscount(sc.ProductID, a.ProductQuantity, 0), 0), NULLIF(dbo.GetQtyDiscount(sc.ProductID, a.ProductQuantity, 1), 0), 0)
FROM orders_ShoppingCart sc
    join (select ProductID, sum(Quantity) ProductQuantity from dbo.orders_ShoppingCart with (nolock) where OrderNumber = @OrderNumber group by ProductID) a on sc.ProductID = a.ProductID
WHERE OrderNumber = @OrderNumber 

UPDATE dbo.orders_ShoppingCart
SET OrderedProductQuantityDiscountName = qd.[name]
FROM dbo.orders_ShoppingCart sc join dbo.QuantityDiscount qd on sc.OrderedProductQuantityDiscountID = qd.QuantityDiscountID
WHERE OrderNumber = @OrderNumber 



GO


CREATE VIEW ObjectView 
AS 
SELECT	EM.EntityID AS ID,  
		EM.EntityType AS EntityType,
		EM.[Name],
		EM.Description
FROM EntityMaster AS EM WITH (NOLOCK) 

UNION ALL

SELECT	tp.TopicID AS ID, 
		'Topic' AS EntityType,
		tp.[Name],
		tp.Description
FROM Topic AS tp WITH (NOLOCK)

UNION ALL

SELECT	nw.NewsID AS ID,
		'News' AS EntityType,
		nw.Headline AS [Name],		
		'' AS Description
FROM News AS nw WITH(NOLOCK)

UNION ALL

SELECT	p.ProductID AS ID, 
		'Product' AS EntityType,
		p.[Name],
		p.Description
FROM Product AS p WITH(NOLOCK)

UNION ALL

SELECT	cp.CouponID AS ID, 
		'Coupon' AS EntityType,
		cp.[CouponCode] AS [Name],
		cp.Description
FROM Coupon AS cp WITH(NOLOCK)

UNION ALL

SELECT	oo.OrderOptionID AS ID, 
		'OrderOption' AS EntityType,
		oo.[Name],
		oo.Description
FROM OrderOption oo WITH(NOLOCK)

UNION ALL 

SELECT	gc.GiftCardID AS ID, 
		'GiftCard' AS EntityType,
		gc.SerialNumber AS [Name],
		'' AS Description
FROM GiftCard AS gc WITH(NOLOCK)

UNION ALL 

SELECT	sm.ShippingMethodID AS ID, 
		'ShippingMethod' AS EntityType,
		sm.[Name] AS [Name],
		'' AS Description
FROM ShippingMethod AS sm WITH(NOLOCK)  


GO


CREATE PROCEDURE [dbo].[aspdnsf_GetEntityTree]
	@entity nvarchar(30),
	@entityid int,
	@storeid int,
	@filterentity bit	
 	
AS
BEGIN
SET NOCOUNT ON

	SELECT	DISTINCT pe.EntityID as ID, 
			pe.Name as [Name], 
			pe.ParentEntityID as ParentID
	FROM EntityMaster pe WITH (NOLOCK)
	INNER JOIN EntityMaster te WITH (NOLOCK) on te.EntityID = @entityid and te.EntityType = @entity and pe.EntityType = @entity
	left join (select EntityID from EntityStore with (nolock) WHERE (0 = 0 or StoreID = 1)) et on pe.EntityID = et.EntityID
	inner join (select distinct a.EntityID from EntityMaster a with (nolock) left join EntityStore b with (nolock) on a.EntityID = b.EntityID WHERE (@filterentity = 0 or StoreID = @storeid)) et1 on pe.EntityID = et1.EntityID
	WHERE pe.EntityID = te.ParentEntityID 

	SELECT	DISTINCT se.EntityID as ID, 
			se.Name as [Name], 
			se.ParentEntityID as ParentID, se.DisplayOrder
	FROM EntityMaster se WITH (NOLOCK)
	inner join EntityMaster te WITH (NOLOCK) on te.EntityID = @entityid and te.EntityType = @entity and se.EntityType = @entity
	inner join (select distinct a.EntityID from EntityMaster a with (nolock) left join EntityStore b with (nolock) on a.EntityID = b.EntityID WHERE (@filterentity = 0 or StoreID = @storeid)) stre on se.EntityID = stre.EntityID
	WHERE se.ParentEntityID = te.ParentEntityID
	order by se.DisplayOrder, se.name asc
END


GO


create proc [dbo].[aspdnsf_GetSimpleObjectEntityList]
    @entityname      varchar(100),
    @entityid        int = null,
    @affiliateid     int = null,
    @customerlevelid int = null,
    @AllowKits       tinyint = 1,
    @AllowPacks      tinyint = 1, 
    @PublishedOnly   tinyint = 0,
    @OrderByLooks    tinyint = 0
  
AS
SET NOCOUNT ON

DECLARE @FilterProductsByCustomerLevel tinyint, @CustomerLevelFilteringIsAscending bit

SELECT @FilterProductsByCustomerLevel = case ConfigValue when 'true' then 1 else 0 end FROM dbo.AppConfig with (nolock) WHERE [Name] = 'FilterProductsByCustomerLevel'

SET @CustomerLevelFilteringIsAscending  = 0
SELECT @CustomerLevelFilteringIsAscending  = case configvalue when 'true' then 1 else 0 end
FROM dbo.appConfig
WHERE name like 'FilterByCustomerLevelIsAscending'


IF @entityname not in ('category', 'section', 'manufacturer', 'library', 'distributor', 'genre', 'vector')
    RETURN

IF @entityname = 'library' BEGIN
    SELECT d.*, d.documentid objectid, pe.EntityID
    FROM dbo.[Document] d with (nolock) 
        left join [dbo].ProductEntity pe with (nolock) on d.documentid = pe.ProductID and pe.EntityType = @entityname and pe.EntityID = coalesce(@entityid, pe.EntityID)
        left join [dbo].DocumentAffiliate a with (nolock) on d.documentid = a.DocumentID
        left join [dbo].DocumentCustomerLevel dcl with (nolock) on d.documentid = dcl.DocumentID
    WHERE pe.EntityID = coalesce(@entityid, pe.EntityID)
        and (a.AffiliateID = coalesce(@affiliateid, a.AffiliateID) or @affiliateid is null or @affiliateid = 0)
        and (dcl.CustomerLevelID = coalesce(@customerlevelid, dcl.CustomerLevelID) or @customerlevelid is null)
        and case 
                when @FilterProductsByCustomerLevel = 0 then 1
                when @CustomerLevelFilteringIsAscending = 1 and (dcl.CustomerLevelID <= @CustomerLevelID or dcl.CustomerLevelID is null) then 1 
                when @CustomerLevelID=0 and dcl.CustomerLevelID is null then 1
                when dcl.CustomerLevelID = @CustomerLevelID  or dcl.CustomerLevelID is null then 1 
                else 0
            end  = 1
        and d.Published >= @PublishedOnly
        and d.deleted = 0
END
ELSE BEGIN

    SELECT p.*, p.productid ObjectID, pe.EntityID
    FROM dbo.Product p with (nolock) 
        join [dbo].ProductEntity pe with (nolock) on p.ProductID = pe.ProductID and pe.EntityType = @entityname and pe.EntityID = coalesce(@entityid, pe.EntityID)
        join (
                SELECT distinct p.productid 
                FROM dbo.Product p with (nolock) 
                     join [dbo].ProductEntity pe with (nolock) on p.ProductID = pe.ProductID and pe.EntityType = @entityname
                     left join (select distinct ProductID, EntityID from [dbo].ProductEntity with (nolock) where EntityType = 'affiliate') a on p.ProductID = a.ProductID
                     left join (select distinct ProductID, EntityID from [dbo].ProductEntity with (nolock) where EntityType = 'customerlevel') pcl on p.ProductID = pcl.ProductID 
                WHERE pe.EntityID = coalesce(@entityid, pe.EntityID)
                    and (a.EntityID = coalesce(@affiliateid, a.EntityID) or @affiliateid is null or @affiliateid = 0)
                    and case 
                            when @FilterProductsByCustomerLevel = 0 then 1
                            when @CustomerLevelFilteringIsAscending = 1 and (pcl.EntityID <= @CustomerLevelID or pcl.EntityID is null) then 1 
                            when @CustomerLevelID=0 and pcl.EntityID is null then 1
                            when pcl.EntityID = @CustomerLevelID  or pcl.EntityID is null then 1 
                            else 0
                        end  = 1
                    and p.IsAKit <= @AllowKits
                    and p.IsAPack <= @AllowPacks
                    and p.IsSystem = 0
                    and p.Published >= @PublishedOnly
                    and p.deleted = 0
            ) filter on p.productid = filter.productid
    ORDER BY pe.DisplayOrder
END


GO


create proc [dbo].[aspdnsf_ProductSequence]
    @positioning varchar(10), -- allowed values: first, next, previous, last
    @ProductID int,
    @EntityName varchar(20),
    @EntityID int,
    @ProductTypeID int = null,
    @IncludeKits tinyint = 1 ,
    @IncludePacks tinyint = 1 ,
    @SortByLooks tinyint = 0, 
    @CustomerLevelID int = null,
    @affiliateID     int = null
  
AS
BEGIN 
    SET NOCOUNT ON 

    
    DECLARE @id int, @row int
    DECLARE @affiliatecount int
    CREATE TABLE #sequence (row int identity not null, productid int not null)

    DECLARE @FilterProductsByAffiliate tinyint, @FilterProductsByCustomerLevel tinyint, @HideProductsWithLessThanThisInventoryLevel int, @CustomerLevelFilteringIsAscending bit

    SELECT @FilterProductsByCustomerLevel = case ConfigValue when 'true' then 1 else 0 end FROM dbo.AppConfig with (nolock) WHERE [Name] = 'FilterProductsByCustomerLevel'
    SELECT @FilterProductsByAffiliate = case ConfigValue when 'true' then 1 else 0 end FROM dbo.AppConfig with (nolock) WHERE [Name] = 'FilterProductsByAffiliate'
	SELECT @HideProductsWithLessThanThisInventoryLevel = case ConfigValue when 0 then 0 else ConfigValue end FROM dbo.AppConfig with (nolock) WHERE [Name] = 'HideProductsWithLessThanThisInventoryLevel'

    SET @CustomerLevelFilteringIsAscending  = 0
    SELECT @CustomerLevelFilteringIsAscending  = case configvalue when 'true' then 1 else 0 end FROM dbo.appConfig with (nolock) WHERE name like 'FilterByCustomerLevelIsAscending'

    select @affiliatecount    = si.rows from sysobjects so with (nolock) join sysindexes si with (nolock) on so.id = si.id where so.id = object_id('ProductAffiliate') and si.indid < 2 and type = 'u'

    IF @positioning not in ('first', 'next', 'previous', 'last')
        SET @positioning = 'first'

    insert #sequence (productid)     
    select pe.productid 
    from dbo.ProductEntity             pe  with (nolock)
        join [dbo].Product             p   with (nolock) on p.ProductID = pe.ProductID and pe.EntityType = @EntityName and pe.EntityID = @EntityID
        left join ProductCustomerLevel pcl with (nolock) on p.ProductID = pcl.ProductID 
        left join ProductAffiliate     pa  with (nolock) on p.ProductID = pa.ProductID 
		left join ProductVariant pv		   with (nolock) on p.ProductID = pv.ProductID  and pv.IsDefault = 1
        left join (select VariantID, sum(quan) quan from dbo.Inventory with (nolock) group by VariantID) i  on pv.VariantID = i.VariantID
    where p.ProductTypeID = coalesce(nullif(@ProductTypeID, 0), p.ProductTypeID) and p.Deleted = 0 and p.Published = 1 and p.IsAKit <= @IncludeKits and p.IsAPack <= @IncludePacks 
          and (case 
                when @FilterProductsByCustomerLevel = 0 then 1
                when @CustomerLevelFilteringIsAscending = 1 and pcl.CustomerLevelID <= @CustomerLevelID or pcl.CustomerLevelID is null then 1 
                when @CustomerLevelID=0 and pcl.CustomerLevelID is null then 1
                when pcl.CustomerLevelID = @CustomerLevelID or pcl.CustomerLevelID is null then 1 
                else 0
               end  = 1
              )
          and (pa.AffiliateID = @affiliateID or pa.AffiliateID is null or @affiliatecount = 0 or @FilterProductsByAffiliate = 0)
          and case p.TrackInventoryBySizeAndColor when 1 then isnull(i.quan, 0) else pv.inventory end >= @HideProductsWithLessThanThisInventoryLevel
		  and (getdate() between isnull(p.AvailableStartDate, '1/1/1900') and isnull(p.AvailableStopDate, '1/1/2999'))     
order by pe.DisplayOrder, p.Name



    SELECT @row = row FROM #sequence WHERE ProductID = @ProductID 

    IF @positioning = 'next' BEGIN
        SELECT top 1 @id = ProductID 
        FROM #sequence 
        WHERE row > @row 
        ORDER BY row

        IF @id is null
            SET @positioning = 'first'
    END


    IF @positioning = 'previous' BEGIN
        SELECT top 1 @id = ProductID 
        FROM #sequence 
        WHERE row < @row 
        ORDER BY row desc

        IF @id is null
            SET @positioning = 'last'
    END


    IF @positioning = 'first'
        SELECT top 1 @id = ProductID 
        FROM #sequence 
        ORDER BY row

    IF @positioning = 'last' 
        SELECT top 1 @id = ProductID 
        FROM #sequence
        ORDER BY row desc

    SELECT ProductID, SEName FROM dbo.Product with (nolock) WHERE ProductID = @id

END



GO


CREATE PROC [dbo].[aspdnsf_CloneStore]
	@StoreID INT,
	@NewStoreName nvarchar(400) = NULL,
	@NewStoreID int output
AS
BEGIN
	INSERT INTO Store (ProductionURI, StagingURI, DevelopmentURI, [Name], Description, SkinID)
	SELECT ProductionURI, StagingURI, DevelopmentURI, ISNULL(@NewStoreName, [Name]), Description, SkinID FROM Store WHERE StoreID = @StoreID
	
	select @NewStoreID=Max(StoreID) FROM Store 

	EXEC [aspdnsf_CloneStoreMappings] @StoreID, @NewStoreID
	
END


GO


create function dbo.UniquelyMapped(
	@StoreId int,
	@EntityType nvarchar(30),
	@EntityId int = null
)
returns bit
begin

	declare @isUnique int
	set @isUnique = 0 -- unknown yet or default value if non found

	declare @c int
	select @c = count(*)
	FROM StoreMappingView smv 
	WHERE smv.EntityType = @EntityType and smv.EntityId = @EntityId

	if(@c > 0)
	begin
		if(@c > 1)
		begin
			set @isUnique = 0 -- more than 1 store is mapped to this entity
		end
		else
		begin
			declare @s int
	
			select @s = smv.StoreId 
			FROM StoreMappingView smv 
			WHERE smv.EntityType = @EntityType and smv.EntityId = @EntityId

			if(@StoreId = @s) 
			begin
				set @isUnique = 1 -- only 1 match
			end	
		end
	end	

	return @isUnique

end


GO


create function dbo.GetStoreMap(
	@StoreId int,
	@EntityType nvarchar(30),
	@EntityId int = null
)
RETURNS BIT
BEGIN
	DECLARE @IsMapped BIT

	IF EXISTS(SELECT * FROM StoreMappingView WHERE StoreId = @StoreId AND EntityType = @EntityType AND EntityId = ISNULL(@EntityId, EntityId))
	BEGIN
		SET @IsMapped = 1
	END
	ELSE
	BEGIN
		SET @IsMapped = 0
	END

	RETURN @IsMapped
END


GO


CREATE proc [dbo].[aspdnsf_MonthlyMaintenance]
-- BACKUP YOUR DB BEFORE USING THIS SCRIPT!
    @InvalidateCustomerCookies      tinyint = 1,
    @PurgeAnonCustomers             tinyint = 1,
    @CleanShoppingCartsOlderThan    smallint = 30,  -- set to 0 to disable erasing
    @CleanWishListsOlderThan        smallint = 30,  -- set to 0 to disable erasing
    @CleanGiftRegistriesOlderThan   smallint = 30,  -- set to 0 to disable erasing
    @EraseCCFromAddresses           tinyint = 1,    -- except those used for recurring billing items!
    @EraseSQLLogOlderThan           smallint = 30,  -- set to 0 to disable erasing
    @ClearProductViewsOrderThan     smallint = 180, 
    @EraseCCFromOrdersOlderThan     smallint = 30,  -- set to 0 to disable erasing
    @DefragIndexes                  tinyint = 0,
    @PurgeDeletedRecords            tinyint = 0     -- Purges records in all tables with a deleted flag set to 1
  
AS
BEGIN
    set nocount on 
    DECLARE @cmd varchar(8000)

    -- clear out old stuff in failed transactions:
    delete from failedtransaction where orderdate < dateadd(mm,-2,getdate());

    -- clear out old tx info, not longer needed:
    update orders set TransactionCommand=NULL, AuthorizationResult=NULL, VoidTXCommand=NULL, VoidTXResult=NULL, CaptureTXCommand=NULL, CaptureTXResult=NULL, RefundTXCommand=NULL, RefundTXResult=NULL where orderdate < dateadd(mm,-2,getdate());

    -- invalidate all user cookies (forces re-login of all customers, for security safety):
    IF @InvalidateCustomerCookies = 1
    BEGIN
        update [dbo].customer set CustomerGUID=newid();
    END

    -- clean out RefundTXCommand, not needed anymore:
    update orders set RefundTXCommand=NULL;

    -- clean up all carts (don't touch recurring items, gift registry items, or wishlist items however):
    IF @CleanShoppingCartsOlderThan <> 0
    BEGIN 
        delete dbo.kitcart where CartType=0 and CreatedOn < dateadd(d,-@CleanShoppingCartsOlderThan,getdate());
        delete dbo.customcart where CartType=0 and CreatedOn < dateadd(d,-@CleanShoppingCartsOlderThan,getdate());
        delete dbo.ShoppingCart where CartType=0 and CreatedOn < dateadd(d,-@CleanShoppingCartsOlderThan,getdate());
    END

    IF @CleanWishListsOlderThan <> 0
    BEGIN
        delete dbo.kitcart where CartType=1 and CreatedOn < dateadd(d,-@CleanWishListsOlderThan,getdate());
        delete dbo.customcart where CartType=1 and CreatedOn < dateadd(d,-@CleanWishListsOlderThan,getdate());
        delete dbo.ShoppingCart where CartType=1 and CreatedOn < dateadd(d,-@CleanWishListsOlderThan,getdate());
    END

    IF @CleanGiftRegistriesOlderThan = 1
    BEGIN
        delete dbo.kitcart where CartType=3 and CreatedOn < dateadd(d,-@CleanGiftRegistriesOlderThan,getdate());
        delete dbo.customcart where CartType=3 and CreatedOn < dateadd(d,-@CleanGiftRegistriesOlderThan,getdate());
        delete dbo.ShoppingCart where CartType=3 and CreatedOn < dateadd(d,-@CleanGiftRegistriesOlderThan,getdate());
    END

    -- purge anon customers:
    IF @PurgeAnonCustomers = 1
    BEGIN
        delete dbo.customer 
        where IsRegistered=0 and IsAdmin = 0
            and customerid not in (select customerid from dbo.ShoppingCart with (NOLOCK)) 
            and customerid not in (select customerid from dbo.kitcart with (NOLOCK)) 
            and customerid not in (select customerid from dbo.customcart with (NOLOCK)) 
            and customerid not in (select customerid from dbo.orders with (NOLOCK)) 
            and customerid not in (select customerid from dbo.rating with (NOLOCK)) 
            and customerid not in (select ratingcustomerid from dbo.ratingcommenthelpfulness with (NOLOCK)) 
            and customerid not in (select votingcustomerid from dbo.ratingcommenthelpfulness with (NOLOCK)) 
            and customerid not in (select customerid from dbo.pollvotingrecord with (NOLOCK))
    END
	
    -- clean any orphaned addresses
    delete dbo.Address where CustomerID Not in (select CustomerID from dbo.customer with (NOLOCK))

    -- clean addresses, except for those that have recurring orders
    IF @EraseCCFromAddresses = 1
    BEGIN
        IF exists (select * from dbo.sysobjects with (nolock) where type = 'u' and name = 'address')
            IF exists (select * from dbo.syscolumns with (nolock) where id = object_id('address') and name = 'CardExtraCode')
            BEGIN
                SET @cmd = 'update [dbo].address set CardNumber=''1111111111111111'', CardStartDate=''11/11'', CardIssueNumber=''111111111'', CardExtraCode=''1111'',CardExpirationMonth=''11'', CardExpirationYear=''1111'', eCheckBankABACode=''11111111'', eCheckBankAccountNumber=''11111111'' where CustomerID not in (select CustomerID from ShoppingCart where CartType=2)'
                EXEC (@cmd)
                SET @cmd = ''
                SET @cmd = 'update [dbo].address set CardNumber=NULL, CardStartDate=NULL, CardIssueNumber=NULL, CardExtraCode=NULL,CardExpirationMonth=NULL, CardExpirationYear=NULL, eCheckBankABACode=NULL, eCheckBankAccountNumber=NULL where CustomerID not in (select CustomerID from ShoppingCart where CartType=2)'
                EXEC (@cmd)
                SET @cmd = ''
            END 
            ELSE
            BEGIN
                SET @cmd = 'update [dbo].address set CardNumber=''1111111111111111'', CardStartDate=''11/11'', CardIssueNumber=''11111111'', CardExpirationMonth=''11'', CardExpirationYear=''1111'', eCheckBankABACode=''11111111'', eCheckBankAccountNumber=''11111111'' where CustomerID not in (select CustomerID from ShoppingCart where CartType=2)'
                EXEC (@cmd)
                SET @cmd = ''
                SET @cmd = 'update [dbo].address set CardNumber=NULL, CardStartDate=NULL, CardIssueNumber=NULL, CardExpirationMonth=NULL, CardExpirationYear=NULL, eCheckBankABACode=NULL, eCheckBankAccountNumber=NULL where CustomerID not in (select CustomerID from ShoppingCart where CartType=2)'
                EXEC (@cmd)
                SET @cmd = ''
            END 
        ELSE
        BEGIN
            -- erase credit card info from all customer records (recurring orders were not supported in these old versions)
            IF exists (select * From sysobjects so with (nolock) join [dbo].syscolumns sc on so.id = sc.id where so.type= 'u' and so.name = 'customer' and sc.name = 'CardNumber') BEGIN
                SET @cmd = 'update [dbo].Customer SET CardNumber = ''1111111111111111'''
                EXEC (@cmd)
                SET @cmd = ''
                SET @cmd = 'update [dbo].Customer SET CardNumber = null'
                EXEC (@cmd)
                SET @cmd = ''
            END 
        END
    END

    -- erase credit cards from all orders older than N days:
    IF @EraseCCFromOrdersOlderThan <> 0
    BEGIN
        update [dbo].orders set CardNumber=NULL, eCheckBankABACode=NULL,eCheckBankAccountNumber=NULL WHERE OrderDate < dateadd(d,-@EraseCCFromOrdersOlderThan,getdate())
        IF exists (select * From dbo.sysobjects so with (nolock) join [dbo].syscolumns sc on so.id = sc.id where so.type= 'u' and so.name = 'orders' and sc.name = 'CardExtraCode') BEGIN
            SET @cmd = 'update [dbo].Orders SET CardExtraCode = ''1111'''
            EXEC (@cmd)
            SET @cmd = ''
            SET @cmd = 'update [dbo].Orders SET CardExtraCode = null'
            EXEC (@cmd)
            SET @cmd = ''
        END 
    END

    -- erase logged sql statements
    IF @EraseSQLLogOlderThan <> 0
    BEGIN
        DELETE dbo.SQLLog WHERE ExecutedOn < dateadd(d,-@EraseSQLLogOlderThan,getdate())
    END
    
    -- erase product views both for recently and dynamic
    IF @ClearProductViewsOrderThan <> 0
    BEGIN 
		DELETE dbo.ProductView WHERE ViewDate < dateadd(d,-@ClearProductViewsOrderThan,getdate())
	END

    truncate table CustomerSession

    exec aspdnsf_CustomerConsistencyCheck


    -- nuke all products that were used as temporary products for checkout (auction) purposes
    declare @productid int
    select productid into #tmpproduct from dbo.product with (nolock) where deleted = 2
    select top 1 @productid = productid from #tmpproduct 
    while @@rowcount > 0 begin
        exec dbo.aspdnsf_NukeProduct @productid
        delete #tmpproduct where productid = @productid
        select top 1 @productid = productid from #tmpproduct 
    end
    drop table #tmpproduct 

    IF @PurgeDeletedRecords = 1 BEGIN
        DELETE dbo.Address where deleted = 1
        DELETE dbo.Affiliate where deleted = 1
        DELETE dbo.Category where deleted = 1
        DELETE dbo.Coupon where deleted = 1
        DELETE dbo.Customer where deleted = 1
        DELETE dbo.CustomerLevel where deleted = 1
        DELETE dbo.Distributor where deleted = 1
        DELETE dbo.Document where deleted = 1
        DELETE dbo.FAQ where deleted = 1
        DELETE dbo.Gallery where deleted = 1
        DELETE dbo.Genre where deleted = 1
        DELETE dbo.Library where deleted = 1
        DELETE dbo.Manufacturer where deleted = 1
        DELETE dbo.News where deleted = 1
        DELETE dbo.Partner where deleted = 1
        DELETE dbo.Poll where deleted = 1
        DELETE dbo.PollAnswer where deleted = 1 or not exists (select * from dbo.Poll where PollID = PollAnswer.PollID)
        DELETE dbo.Product where deleted = 1
        DELETE dbo.ProductVariant where deleted = 1 or not exists (select * from dbo.Product where productid = ProductVariant.productid)
        DELETE dbo.SalesPrompt where deleted = 1
        DELETE dbo.Section where deleted = 1
        DELETE dbo.ShippingZone where deleted = 1
        DELETE dbo.Staff where deleted = 1
        DELETE dbo.Topic where deleted = 1
        DELETE dbo.Vector where deleted = 1

        DELETE dbo.ProductVector where not exists (select * from dbo.product where productid = ProductVector.productid) or not exists (select * from dbo.vector where vectorid = ProductVector.vectorid) 
        DELETE dbo.ProductAffiliate where not exists (select * from dbo.product where productid = ProductAffiliate.productid) or not exists (select * from dbo.Affiliate where Affiliateid = ProductAffiliate.Affiliateid) 
        DELETE dbo.ProductCategory where not exists (select * from dbo.product where productid = ProductCategory.productid) or not exists (select * from dbo.Category where Categoryid = ProductCategory.Categoryid) 
        DELETE dbo.ProductCustomerLevel where not exists (select * from dbo.product where productid = ProductCustomerLevel.productid) or not exists (select * from dbo.CustomerLevel where CustomerLevelid = ProductCustomerLevel.CustomerLevelid) 
        DELETE dbo.ProductDistributor where not exists (select * from dbo.product where productid = ProductDistributor.productid) or not exists (select * from dbo.Distributor where Distributorid = ProductDistributor.Distributorid) 
        DELETE dbo.ProductGenre where not exists (select * from dbo.product where productid = ProductGenre.productid) or not exists (select * from dbo.Genre where Genreid = ProductGenre.Genreid) 
        DELETE dbo.ProductLocaleSetting where not exists (select * from dbo.product where productid = ProductLocaleSetting.productid) or not exists (select * from dbo.LocaleSetting where LocaleSettingid = ProductLocaleSetting.LocaleSettingid) 
        DELETE dbo.ProductManufacturer where not exists (select * from dbo.product where productid = ProductManufacturer.productid) or not exists (select * from dbo.Manufacturer where Manufacturerid = ProductManufacturer.Manufacturerid) 
        DELETE dbo.ProductSection where not exists (select * from dbo.product where productid = ProductSection.productid) or not exists (select * from dbo.Section where Sectionid = ProductSection.Sectionid) 
        DELETE dbo.Address where not exists (select * from dbo.Customer where customerid = Address.customerid)
    END

    -- Defrag indexes
    IF @DefragIndexes = 1
    BEGIN
        CREATE TABLE #SHOWCONTIG (
           tblname VARCHAR (255),
           ObjectId INT,
           IndexName VARCHAR (255),
           IndexId INT,
           Lvl INT,
           CountPages INT,
           CountRows INT,
           MinRecSize INT,
           MaxRecSize INT,
           AvgRecSize INT,
           ForRecCount INT,
           Extents INT,
           ExtentSwitches INT,
           AvgFreeBytes INT,
           AvgPageDensity INT,
           ScanDensity DECIMAL,
           BestCount INT,
           ActualCount INT,
           LogicalFrag DECIMAL,
           ExtentFrag DECIMAL)

        SELECT [name] tblname into #tmp FROM dbo.sysobjects with (nolock) WHERE type = 'u' ORDER BY Name

        DECLARE @tblname varchar(255), @indexname varchar(255)
        SELECT top 1 @tblname = tblname FROM #tmp
        WHILE @@rowcount > 0 BEGIN
            SET @cmd = 'DBCC SHOWCONTIG (''' + @tblname + ''') with tableresults, ALL_INDEXES'
            INSERT #SHOWCONTIG
            EXEC (@cmd)
            DELETE #tmp WHERE tblname = @tblname 
            SELECT top 1 @tblname = tblname FROM #tmp
        END


        DELETE #SHOWCONTIG WHERE LogicalFrag < 5 or Extents = 1 or IndexId in (0, 255)


        SELECT top 1 @tblname = tblname, @indexname = IndexName FROM #SHOWCONTIG ORDER BY IndexId
        WHILE @@rowcount > 0 BEGIN
            SET @cmd = 'DBCC DBREINDEX (''' + @tblname + ''', ''' + @indexname + ''', 90)  '
            EXEC (@cmd)
            DELETE #SHOWCONTIG WHERE tblname = @tblname 
            SELECT top 1 @tblname = tblname, @indexname = IndexName FROM #SHOWCONTIG ORDER BY IndexId
        END
    END
END


GO


create procedure [dbo].[aspdnsf_GetMappedObjects](
	@StoreId int,
	@EntityType nvarchar(30),
	@AlphaFilter nvarchar(30) = null,
	@SearchFilter nvarchar(30) = null,
	@pageSize int = null,
	@page int = null
)
as
begin

	declare @count int
	declare @allPages int
	declare @start int
	declare @end int

	-- flag to determine if we should do paging
	declare @doPage bit
	set @doPage = case when @pageSize is null and @page is null then 0 else 1 end	

	-- execute query to fetch the count of all availalble data
	-- which we will use later on to get the paging information
	select @count = count(*)
	from
	(
		select	o.EntityType, 			
				o.[Id],
				o.[Name]
		from ObjectView o
		where	o.EntityType = COALESCE(@EntityType, o.EntityType) and 
				(@AlphaFilter IS NULL OR (o.[Name] like @AlphaFilter + '%')) and 
				(@SearchFilter IS NULL OR (o.[Name] like '%' + @SearchFilter + '%'))
	) ov

	-- sanity check
	if(@count <= @pageSize) set @pageSize = @count

	-- determine start and end index	
	set @start = ((@page - 1) * @pageSize) + 1
	set @end = (@start + @pageSize) - 1
	if(@end > @count) set @end = @count

	-- compute the total number of pages
	if(@count > 0 ) 
	begin
		set @allPages = @count / @pageSize

		declare @rem int
		set @rem = @count % @pageSize -- residue
		if(@rem > 0) set @allPages = @allPages + 1
	end 
	else set @allPages = 0
	

	-- paging information
	select	@count as TotalCount, 
			@pageSize as PageSize, 
			@page as CurrentPage, 
			@allPages as TotalPages, 
			@start as StartIndex, 
			@end as [EndIndex]
	
	-- actual paged result set
	select	@StoreId as StoreID,
			ROW_NUMBER,
			ov.EntityType, 			
			ov.[ID],
			ov.[Name],
			dbo.GetStoreMap(@StoreId, ov.EntityType, ov.ID) as Mapped
	from
	(
		select	ROW_NUMBER() over(partition by o.EntityType order by id) as [Row_Number], 
				o.EntityType, 			
				o.[Id],
				o.[Name]
		from ObjectView o
		where	o.EntityType = COALESCE(@EntityType, o.EntityType) and 
				(@AlphaFilter IS NULL OR (o.[Name] like @AlphaFilter + '%')) and 
				(@SearchFilter IS NULL OR (o.[Name] like '%' + @SearchFilter + '%'))
	) ov
	where @doPage = 0 or (ROW_NUMBER BETWEEN @start AND @end)

end

GO


create procedure [dbo].[aspdnsf_GetObjects](	
	@EntityType nvarchar(30),
	@AlphaFilter nvarchar(30) = null,
	@SearchFilter nvarchar(30) = null,
	@pageSize int = null,
	@page int = null
)
as
begin

	declare @count int
	declare @allPages int
	declare @start int
	declare @end int

	-- flag to determine if we should do paging
	declare @doPage bit
	set @doPage = case when @pageSize is null and @page is null then 0 else 1 end	

	-- execute query to fetch the count of all availalble data
	-- which we will use later on to get the paging information
	select @count = count(*)
	from
	(
		select	o.EntityType, 			
				o.[Id],
				o.[Name]
		from ObjectView o
		where	o.EntityType = COALESCE(@EntityType, o.EntityType) and 
				(@AlphaFilter IS NULL OR (o.[Name] like @AlphaFilter + '%')) and 
				(@SearchFilter IS NULL OR (o.[Name] like '%' + @SearchFilter + '%'))
	) ov

	-- sanity check
	if(@count <= @pageSize) set @pageSize = @count

	-- determine start and end index	
	set @start = ((@page - 1) * @pageSize) + 1
	set @end = (@start + @pageSize) - 1
	if(@end > @count) set @end = @count

	-- compute the total number of pages
	if(@count > 0 ) 
	begin
		set @allPages = @count / @pageSize

		declare @rem int
		set @rem = @count % @pageSize -- residue
		if(@rem > 0) set @allPages = @allPages + 1
	end 
	else set @allPages = 0
	

	-- paging information
	select	@count as TotalCount, 
			@pageSize as PageSize, 
			@page as CurrentPage, 
			@allPages as TotalPages, 
			@start as StartIndex, 
			@end as [EndIndex]
	
	-- actual paged result set
	select	ROW_NUMBER,
			ov.EntityType, 			
			ov.[ID],
			ov.[Name]			
	from
	(
		select	ROW_NUMBER() over(partition by o.EntityType order by id) as [Row_Number], 
				o.EntityType, 			
				o.[Id],
				o.[Name],
				o.Description
		from ObjectView o
		where	o.EntityType = COALESCE(@EntityType, o.EntityType) and 
				(@AlphaFilter IS NULL OR (o.[Name] like @AlphaFilter + '%')) and 
				(@SearchFilter IS NULL OR (o.[Name] like '%' + @SearchFilter + '%'))
	) ov
	where @doPage = 0 or (ROW_NUMBER BETWEEN @start AND @end)

end

GO


create procedure [dbo].[aspdnsf_GetStoreShippingMethodMapping](
	@StoreId int,
	@IsRTShipping int = 0,
	@OnlyMapped int = 0,
	@ExcludeNameLike NVARCHAR(2000) = NULL
)	
AS
BEGIN
	
	SET NOCOUNT ON;
	
	select	@StoreId as StoreId, 			
			dbo.GetStoreMap(@storeid, 'ShippingMethod', sm.ShippingMethodId) as Mapped,
			sm.* 
	from ShippingMethod sm WITH (NOLOCK)	
	WHERE	sm.IsRTShipping = @IsRTShipping AND 
			(@OnlyMapped = 0 or (dbo.GetStoreMap(@storeid, 'ShippingMethod', sm.ShippingMethodId) = 1)) AND
			(@ExcludeNameLike IS NULL OR (sm.[Name] NOT LIKE '%' + @ExcludeNameLike + '%'))
	order by sm.DisplayOrder ASC	

END


GO


create procedure [dbo].[aspdnsf_NukeStoreAffiliate]
	@StoreID int
as
begin
	set nocount on;
	
	delete aar
	from AffiliateActivityReason aar
	inner join AffiliateActivity aa on aar.AffiliateActivityReasonID = aa.AffiliateActivityReasonID
	inner join Affiliate af on aa.AffiliateID = af.AffiliateID
	inner join AffiliateStore afs on afs.AffiliateID = af.AffiliateID
	where dbo.UniquelyMapped(@StoreID, 'Affiliate', af.AffiliateID) = 1 
	
	delete aa
	from AffiliateActivity aa
	inner join Affiliate af on aa.AffiliateID = af.AffiliateID
	inner join AffiliateStore afs on afs.AffiliateID = af.AffiliateID
	where dbo.UniquelyMapped(@StoreID, 'Affiliate', af.AffiliateID) = 1 
	
	delete pa
	from ProductAffiliate pa
	inner join Affiliate af on pa.AffiliateID = af.AffiliateID
	inner join AffiliateStore afs on afs.AffiliateID = af.AffiliateID
	where dbo.UniquelyMapped(@StoreID, 'Affiliate', af.AffiliateID) = 1 
	
	delete da
	from DocumentAffiliate da
	inner join Affiliate af on da.AffiliateID = af.AffiliateID
	inner join AffiliateStore afs on afs.AffiliateID = af.AffiliateID
	where dbo.UniquelyMapped(@StoreID, 'Affiliate', af.AffiliateID) = 1 
	
	delete af
	from Affiliate af
	inner join AffiliateStore afs on afs.AffiliateID = af.AffiliateID
	where dbo.UniquelyMapped(@StoreID, 'Affiliate', af.AffiliateID) = 1 

end

GO


create procedure [dbo].[aspdnsf_GetMappedObject](
	@StoreId int,
	@EntityType nvarchar(30),
	@EntityID int)
as
begin

	set nocount on;

	select	ov.EntityType, 			
			ov.[ID],
			ov.[Name],
			dbo.GetStoreMap(@StoreId, ov.EntityType, ov.ID) as Mapped
	from ObjectView ov
	where	ov.EntityType = @EntityType and 
			ov.[ID] = @EntityID		

end


GO


CREATE VIEW MappedObjects
AS 
SELECT 
	EM.EntityID AS ID,  
	EM.EntityType AS EntityType, 
	ParentEntityID AS ParentID, 
	EM.EntityGUID AS GUID, EM.[Name] , 
	ES.StoreID AS StoreID
FROM EntityMaster AS EM WITH (NOLOCK) LEFT JOIN EntityStore AS ES WITH (NOLOCK) ON ES.EntityID = EM.EntityID AND ES.EntityType = EM.EntityType
UNION ALL
SELECT TP.TopicID AS ID, 'Topic' AS EntityType,0 AS ParentID, TP.TopicGUID AS GUID, TP.[Name], TS.StoreID AS StoreID
FROM Topic AS TP WITH (NOLOCK) LEFT JOIN StoreMappingView AS TS WITH (NOLOCK)
ON TS.EntityID = TP.TopicID AND TS.EntityType='Topic'
UNION ALL
SELECT NW.NewsID AS ID,'News' AS EntityType,0 AS ParentID, NW.NewsGUID AS GUID, NW.Headline AS [Name], NS.StoreID AS StoreID
FROM News AS NW LEFT JOIN StoreMappingView AS NS WITH (NOLOCK)
ON NS.EntityID = NW.NewsID AND NS.EntityType='News'
UNION ALL
SELECT PR.ProductID AS ID, 'Product' AS EntityType,0 AS ParentID, PR.ProductGUID AS GUID, PR.[Name], PS.StoreID AS StoreID
FROM Product AS PR LEFT JOIN StoreMappingView AS PS WITH (NOLOCK)
ON PR.ProductID = PS.EntityID AND PS.EntityType='Product'
UNION ALL
SELECT CP.CouponID AS ID, 'Coupon' AS EntityType,0 AS ParentID, CP.CouponGUID AS GUID, CP.[CouponCode] AS [Name], PS.StoreID AS StoreID
FROM Coupon AS CP LEFT JOIN StoreMappingView AS PS WITH (NOLOCK)
ON CP.CouponID = PS.EntityID AND PS.EntityType='Coupon'
UNION ALL
SELECT OO.OrderOptionID AS ID, 'OrderOption' AS EntityType,0 AS ParentID, OO.OrderOptionGUID AS GUID, OO.[Name], PS.StoreID AS StoreID
FROM OrderOption AS OO LEFT JOIN StoreMappingView AS PS WITH (NOLOCK)
ON OO.OrderOptionID = PS.EntityID AND PS.EntityType = 'OrderOption'
UNION ALL 
SELECT GC.GiftCardID AS ID, 'GiftCard' AS EntityType,0 AS ParentID, GC.GiftCardGUID AS GUID, GC.SerialNumber AS [Name], PS.StoreID AS StoreID
FROM GiftCard AS GC LEFT JOIN StoreMappingView AS PS WITH (NOLOCK)
ON GC.GiftCardID = PS.EntityID AND PS.EntityType = 'GiftCard'



GO


CREATE PROCEDURE [dbo].[aspdnsf_GetVariantsPaged]
(
	@pageSize int,
	@startIndex int,
	@EntityFilterType int = 0,
	@EntityFilterID int = 0
)
AS
BEGIN
SET NOCOUNT ON

DECLARE @Filter TABLE (productID int)

IF (@EntityFilterID <> 0 AND @EntityFilterType <> 0) BEGIN
	IF @EntityFilterType = 1
		INSERT INTO @Filter (productID) SELECT ProductID FROM ProductCategory WHERE CategoryID = @EntityFilterID
	IF @EntityFilterType = 2
		INSERT INTO @Filter (productID) SELECT ProductID FROM ProductSection WHERE SectionID = @EntityFilterID
	IF @EntityFilterType = 3
		INSERT INTO @Filter (productID) SELECT ProductID FROM ProductManufacturer WHERE ManufacturerID = @EntityFilterID
	IF @EntityFilterType = 4
		INSERT INTO @Filter (productID) SELECT ProductID FROM ProductDistributor WHERE DistributorID = @EntityFilterID
END;

WITH OrderedVariants AS
(
	SELECT	pv.variantID,
			pv.IsDefault,
			pv.Name,
			pv.Description,
			pv.ProductID,
			pv.SkuSuffix,
			pv.Price,
			pv.SalePrice,
			pv.Inventory,
			pv.Published,
			pv.Deleted,
			p.TrackInventoryBySizeAndColor,
			p.Name as ProductName,
			ROW_NUMBER() OVER(ORDER BY pv.variantID) as RowNum
			FROM ProductVariant pv WITH (NOLOCK)
			JOIN Product p on p.ProductID = pv.ProductID
			WHERE pv.Deleted = 0
				AND ((@EntityFilterType = 0 OR @EntityFilterID = 0) OR
					pv.ProductID in (SELECT ProductID from @Filter))
)
SELECT	TOP (@pageSize) variantID,
		IsDefault,
		Name,
		Description,
		ProductID,
		SkuSuffix,
		Price,
		SalePrice,
		Inventory,
		Published,
		Deleted,
		TrackInventoryBySizeAndColor,
		ProductName
FROM OrderedVariants
WHERE RowNum > @startIndex

END
GO


create procedure [dbo].[aspdnsf_NukeStore]
	@StoreID int,
	@SummaryOnly bit = 0
as
begin
	/*
	 NOTE:
		this script doesn't protect against nuking a default store, 
		it should be prompted first before calling out this sproc.
		Only certain entities can be nuked:
			News, Topic, ShippingMethod, OrderOption, Affiliate, Customer and Orders
		but mapping for all entities are removed as well
	*/
	
	declare @MAPPED_TO_THIS_STORE int
	set @MAPPED_TO_THIS_STORE = 1

	/* summary table used for reporting */
	declare @NukeSummary Table
	(
		[Row] [int] IDENTITY(1,1) NOT NULL,
		[EntityType] nvarchar(100),
		[EntityID] int,
		[EntityName] nvarchar(500)
	)

	/* generic entities */
	insert into @NukeSummary(EntityType, EntityID, EntityName)
	select ov.EntityType, ov.[ID], ov.[Name]
	from ObjectView ov
	where	ov.EntityType in ('News', 'Topic', 'ShippingMethod', 'OrderOption', 'Affiliate') and 
			dbo.UniquelyMapped(@StoreID, ov.EntityType, ov.ID) = @MAPPED_TO_THIS_STORE

	if(@SummaryOnly = 0)
	begin				
		/* news */		
		delete n
		from News n
		inner join NewsStore ns on ns.NewsID = n.NewsID
		where dbo.UniquelyMapped(@StoreID, 'News', n.NewsID) = @MAPPED_TO_THIS_STORE

		/* Topic */		
		delete t
		from Topic t
		inner join TopicStore ts on ts.TopicID = t.TopicID
		where dbo.UniquelyMapped(@StoreID, 'Topic', t.TopicID) = @MAPPED_TO_THIS_STORE

		/* Order Option */		
		delete os
		from OrderOption os
		inner join OrderOptionStore oos on oos.OrderOptionID = os.OrderOptionID
		where dbo.UniquelyMapped(1, 'OrderOption', os.OrderOptionID) = @MAPPED_TO_THIS_STORE

		/* Shipping Method */		
		delete sm
		from ShippingMethod sm
		inner join ShippingMethodStore sms on sms.ShippingMethodID = sm.ShippingMethodID
		where dbo.UniquelyMapped(@StoreID, 'ShippingMethod', sm.ShippingMethodID) = @MAPPED_TO_THIS_STORE

		/* next delete ALL mappings */
		exec aspdnsf_NukeStoreMappings @StoreID

		/* nuking these entities requires some relationships to be handled first, hence encapsulated into sproc */
		exec [aspdnsf_NukeStoreAffiliate] @StoreID
		exec [aspdnsf_NukeStoreCustomer] @StoreID
		exec [aspdnsf_NukeStoreOrder] @StoreID

		delete s
		from Store s
		where s.StoreID = @StoreID
	end
	

	select * from @NukeSummary

end


GO



CREATE PROC aspdnsf_GetEntityEntries
	@EntityType VARCHAR(30),
	@StoreID INT = NULL,
	@NameLike Varchar(30) = NULL
 
AS

SELECT ID, EntityType, ParentID, GUID, [Name], dbo.GetStoreMap(@StoreID, @EntityType, ID) AS Mapped
FROM MappedObjects WHERE EntityType = @EntityType AND ([Name] LIKE @NameLike OR @NameLike IS NULL)



GO


CREATE PROC NukeStore 
	@StoreID INT,
	@NukeNews BIT = 0,
	@NukeAffiliates BIT =0,
	@NukeTopics BIT = 0,
	@NukeProducts BIT = 0,
	@NukeCoupons BIT = 0,
	@NukeOrderOptions BIT = 0,
	@NukeGiftCards BIT = 0,
	@NukeCategories BIT = 0,
	@NukeSections BIT = 0,
	@NukeManufacturers BIT = 0,
	@NukeDistributors BIT = 0,
	@NukeGenres BIT = 0,
	@NukeVectors BIT = 0
AS
CREATE TABLE #tmpEntities(
GUID UniqueIdentifier
)
INSERT INTO #tmpEntities (GUID) (
SELECT GUID FROM MappedObjects WHERE StoreID = @StoreID AND GUID NOT IN(
SELECT GUID FROM MappedObjects WHERE StoreID <> @StoreID)
)

IF (@NukeNews = 1)			DELETE FROM News WHERE NewsGUID IN (SELECT [GUID] FROM #tmpEntities)
IF (@NukeAffiliates = 1)	DELETE FROM Affiliate WHERE AffiliateGUID IN (SELECT [GUID] FROM #tmpEntities)
IF (@NukeTopics = 1)		DELETE FROM Topic WHERE TopicGUID IN (SELECT [GUID] FROM #tmpEntities)
IF (@NukeProducts = 1)		DELETE FROM Product WHERE ProductGUID IN (SELECT [GUID] FROM #tmpEntities)
IF (@NukeCoupons = 1)		DELETE FROM Coupon WHERE CouponGUID IN (SELECT [GUID] FROM #tmpEntities)
IF (@NukeOrderOptions = 1)	DELETE FROM OrderOption WHERE OrderOptionGUID IN (SELECT [GUID] FROM #tmpEntities)
IF (@NukeGiftCards = 1)		DELETE FROM GiftCard WHERE GiftCardGUID IN (SELECT [GUID] FROM #tmpEntities)
IF (@NukeCategories = 1)	DELETE FROM Category WHERE CategoryGUID IN (SELECT [GUID] FROM #tmpEntities)
IF (@NukeSections = 1)		DELETE FROM Section WHERE SectionGUID IN (SELECT [GUID] FROM #tmpEntities)
IF (@NukeManufacturers = 1)	DELETE FROM Manufacturer WHERE ManufacturerGUID IN (SELECT [GUID] FROM #tmpEntities)
IF (@NukeDistributors = 1)	DELETE FROM Distributor WHERE DistributorGUID IN (SELECT [GUID] FROM #tmpEntities)
IF (@NukeGenres = 1)		DELETE FROM Genre WHERE GenreGUID IN (SELECT [GUID] FROM #tmpEntities)
IF (@NukeVectors = 1)		DELETE FROM Vector WHERE VectorGUID IN (SELECT [GUID] FROM #tmpEntities)

DELETE FROM EntityStore WHERE StoreID = @StoreID
DELETE FROM AffiliateStore WHERE StoreID = @StoreID
DELETE FROM NewsStore WHERE StoreID = @StoreID
DELETE FROM ProductStore WHERE StoreID = @StoreID
DELETE FROM TopicStore WHERE StoreID = @StoreID
DELETE FROM PollStore WHERE StoreID = @StoreID
DELETE FROM GiftCardStore WHERE StoreID = @StoreID
DELETE FROM CouponStore WHERE StoreID = @StoreID
DELETE FROM OrderOptionStore WHERE StoreID = @StoreID
DELETE FROM Store WHERE StoreID = @StoreID

DROP TABLE #tmpEntities


GO
