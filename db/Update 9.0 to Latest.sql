-- ------------------------------------------------------------------------------------------
-- Copyright AspDotNetStorefront.com, 1995-2010.  All Rights Reserved.
-- http://www.aspdotnetstorefront.com
-- For details on this license please visit our homepage at the URL above.
-- THE ABOVE NOTICE MUST REMAIN INTACT. 
--
-- Database Upgrade Script:
-- AspDotNetStorefront Version 9.0 to Latest, Microsoft SQL Server 2005 Or higher
-- ------------------------------------------------------------------------------------------

/*********** ASPDOTNETSTOREFRONT v9.0 to Latest *******************/
/*                                                                */
/*                                                                */
/* BACKUP YOUR EXISTING DATABASE BEFORE RUNNING THIS SCRIPT!!     */
/* BACKUP YOUR EXISTING DATABASE BEFORE RUNNING THIS SCRIPT!!     */
/* BACKUP YOUR EXISTING DATABASE BEFORE RUNNING THIS SCRIPT!!     */
/* BACKUP YOUR EXISTING DATABASE BEFORE RUNNING THIS SCRIPT!!     */
/*                                                                */
/*                                                                */
/*                                                                */
/* ************************************************************** */

SET NOCOUNT ON
GO

PRINT '*****Database Upgrade Started*****'

/* ************************************************************** */
/* SCHEMA UPDATES												  */
/* ************************************************************** */
PRINT 'Updating GlobalConfig Table...'
IF NOT EXISTS (SELECT * FROM syscolumns WHERE id = object_id('GlobalConfig') AND name = 'IsMultiStore') 
    ALTER TABLE dbo.GlobalConfig ADD IsMultiStore [int] NOT NULL CONSTRAINT DF_GlobalConfig_IsMultiStore DEFAULT((1))
GO


/* ************************************************************** */
/* STORED PROCEDURE UPDATES										  */
/* ************************************************************** */
PRINT 'Updating Stored Procedures...'
IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].aspdnsf_GetShoppingCart') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
    drop proc [dbo].[aspdnsf_GetShoppingCart]
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


IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].aspdnsf_GetProducts') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
    drop proc [dbo].[aspdnsf_GetProducts]
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

/* ************************************************************** */
/* DATA UPDATES													  */
/* ************************************************************** */

-- Update store version
PRINT 'Updating Store Version...'
UPDATE [dbo].[AppConfig] SET [ConfigValue] = '9.0.1.2' WHERE [Name] = 'StoreVersion'

-- Type some AppConfigs
PRINT 'Updating AppConfig Settings...'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'Newsletter.UseCaptcha'
UPDATE dbo.[AppConfig] SET ValueType = 'boolean' WHERE [Name] = 'Newsletter.GetFirstAndLast'
UPDATE dbo.[AppConfig] SET ValueType = 'decimal' WHERE [Name] = 'Newsletter.CaptchaErrorDisplayLength'
UPDATE dbo.[AppConfig] SET ValueType = 'enum' WHERE [Name] = 'Newsletter.OptInLevel'
UPDATE dbo.[AppConfig] SET ValueType = 'enum' WHERE [Name] = 'Newsletter.OptOutLevel'
UPDATE dbo.[AppConfig] SET AllowableValues = 'single, double, triple' WHERE [Name] = 'Newsletter.OptInLevel'
UPDATE dbo.[AppConfig] SET AllowableValues = 'double, triple' WHERE [Name] = 'Newsletter.OptOutLevel'

-- Add the topic required for the new contact page
IF EXISTS (SELECT * FROM Topic WHERE Name='ContactEmail')
BEGIN
PRINT 'ContactEmail topic exists already'
END
ELSE
BEGIN
PRINT 'Adding ContactEmail topic'
INSERT [dbo].Topic(Name, HTMLOK, ShowInSiteMap,Title, Description) values('ContactEmail', 1, 0, 'ContactEmail', '<table style="width: 400px;"><tbody><tr><td align="right" style="width: 150px;">Customer Name: </td><td align="left">%NAME%</td></tr><tr><td align="right" style="width: 150px;">Customer Email: </td><td align="left">%EMAIL%</td></tr><tr><td align="right" style="width: 150px;">Customer Phone:</td><td align="left">%PHONE%</td></tr><tr><td colspan="2"> </td></tr><tr><td colspan="2"><b>%SUBJECT%</b></td></tr><tr><td colspan="2" style="padding-top: 3px;">%MESSAGE%</td></tr></tbody></table>')
END

-- Create a default record in the stores table if one does not exist
PRINT 'Creating Default Store Record...'
IF (SELECT COUNT(*) FROM dbo.Store) = 0
BEGIN
	INSERT INTO dbo.Store(	StoreGUID,
							ProductionURI,
							StagingURI,
							DevelopmentURI,
							[Name],
							Summary,
							Description,
							Published,
							Deleted,
							SkinID,
							IsDefault,
							CreatedOn)
			Values(	newid(),
					'www.mystore.com',
					'staging.mystore.com',
					'localhost',
					'Default Store',
					'',
					'',
					1,
					0,
					1,
					1,
					getdate())
END

GO

-- Remove invalid mobile device useragent
PRINT 'Updating Mobile Devices...'
DELETE [dbo].[MobileDevice] WHERE UserAgent=N'tosh'
GO

PRINT 'Updating Global Configs...'
-- Create globalconfig parameter for switching masterpages by locale
IF NOT EXISTS (SELECT * FROM [GlobalConfig] WHERE [Name] = 'AllowTemplateSwitchingByLocale') BEGIN
	INSERT GlobalConfig([Name], [GroupName], [Description], [ConfigValue], [ValueType], [IsMultiStore]) VALUES('AllowTemplateSwitchingByLocale', 'DISPLAY', 'Indicator of whether the site should attempt to load different masterpage skins based on the current locale of the browsing customer.  This should only be enabled if you have multiple locales and have created different masterpages for each of your locales (eg. template.en-us.master, template.en-gb.master, etc...).  Enabling this when you do not have multiple locales or when you have not create multiple masterpages that vary by locale can hinder the performance of your site.', 'false', 'boolean', 'false')
END
GO

-- Update AllowCustomerDuplicateEmailAddresses globalconfig parameter
UPDATE GlobalConfig SET [IsMultiStore] = 0 WHERE Name='AllowCustomerDuplicateEmailAddresses'
GO

-- Populate the ProductStore table
-- Insert deleted products as well in case they are undeleted
PRINT 'Populating Stores Table...'
INSERT INTO ProductStore (ProductID) SELECT ProductID FROM Product WHERE ProductID NOT IN (SELECT ProductID FROM ProductStore)
GO

PRINT '*****Database Upgrade Completed*****'
