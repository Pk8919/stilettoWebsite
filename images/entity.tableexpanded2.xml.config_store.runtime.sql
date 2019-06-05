************************************  SQL Statement and parameters for query Products  ************************************

declare @CatID Int
declare @SecID Int
declare @ManID Int
declare @DistID Int
declare @GenreID Int
declare @VectorID Int
declare @locale VarChar
declare @CustLevelID Int
declare @AffID Int
declare @ProdTypeID Int
declare @pgnum Int
declare @InvFilter Int
declare @entityname VarChar
declare @StoreID Int
declare @FilterProduct Bit

set @CatID = 2
set @SecID = 0
set @ManID = 0
set @DistID = 0
set @GenreID = 0
set @VectorID = 0
set @locale = 'en-US'
set @CustLevelID = 0
set @AffID = 0
set @ProdTypeID = 0
set @pgnum = 1
set @InvFilter = -1
set @entityname = 'Category'
set @StoreID = 1
set @FilterProduct = False


exec dbo.aspdnsf_GetProducts 
                    @categoryID = @CatID,
                    @sectionID = @SecID,
                    @manufacturerID = @ManID,
                    @distributorID = @DistID,
                    @genreID = @GenreID,
                    @vectorID = @VectorID,
                    @localeName = @locale,
                    @CustomerLevelID = @CustLevelID,
                    @affiliateID = @AffID,
                    @ProductTypeID = @ProdTypeID, 
                    @ViewType = 1,
                    @pagenum = @pgnum,
                    @pagesize = null,
                    @StatsFirst = 0,
                    @publishedonly = 1,
                    @ExcludePacks = 0,
                    @ExcludeKits = 0,
                    @ExcludeSysProds = 0,
                    @InventoryFilter = @InvFilter,
                    @sortEntityName = @entityname,
					          @storeID = @StoreID,
                    @filterProduct = @FilterProduct


