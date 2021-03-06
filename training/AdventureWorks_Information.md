## Schemas In Snowflake

 - HumanResources
 - Person
 - Purchasing

## Mutability

| Schema | Table | Type |
|  ---  |  ---  |  ---  |
| [HumanResources] | [Department] | mutable |
| [HumanResources] | [Employee] | mutable |
| [HumanResources] | [EmployeeDepartmentHistory] | immutable |
| [HumanResources] | [EmployeePayHistory] | immutable |
| [HumanResources] | [JobCandidate] | mutable |
| [HumanResources] | [Shift] | mutable |
| [Person] | [Address] | mutable |
| [Person] | [AddressType] | mutable |
| [Person] | [BusinessEntity] | mutable |
| [Person] | [BusinessEntityAddress] | mutable |
| [Person] | [BusinessEntityContact] | mutable |
| [Person] | [ContactType] | mutable |
| [Person] | [CountryRegion] | mutable |
| [Person] | [EmailAddress] | mutable |
| [Person] | [Password] | mutable |
| [Person] | [Person] | mutable |
| [Person] | [PersonPhone] | mutable |
| [Person] | [PhoneNumberType] | immutable |
| [Person] | [StateProvince] | immutable |
| [Production] | [BillOfMaterials] | mutable |
| [Production] | [Culture] | immutable |
| [Production] | [Document] | mutable |
| [Production] | [Illustration] | mutable |
| [Production] | [Location] | mutable |
| [Production] | [Product] | mutable |
| [Production] | [ProductCategory] | immutable |
| [Production] | [ProductCostHistory] | immutable |
| [Production] | [ProductDescription] | mutable |
| [Production] | [ProductDocument] | mutable |
| [Production] | [ProductInventory] | mutable |
| [Production] | [ProductListPriceHistory] | immutable |
| [Production] | [ProductModel] | mutable |
| [Production] | [ProductModelIllustration] | mutable |
| [Production] | [ProductModelProductDescriptionCulture] | mutable |
| [Production] | [ProductPhoto] | mutable |
| [Production] | [ProductProductPhoto] | mutable |
| [Production] | [ProductReview] | immutable |
| [Production] | [ProductSubcategory] | mutable |
| [Production] | [ScrapReason] | mutable |
| [Production] | [TransactionHistory] | immutable |
| [Production] | [TransactionHistoryArchive] | mutable |
| [Production] | [UnitMeasure] | immutable |
| [Production] | [WorkOrder] | immutable |
| [Production] | [WorkOrderRouting] | mutable |
| [Purchasing] | [ProductVendor] | mutable |
| [Purchasing] | [PurchaseOrderDetail] | immutable |
| [Purchasing] | [PurchaseOrderHeader] | immutable |
| [Purchasing] | [ShipMethod] | mutable |
| [Purchasing] | [Vendor] | mutable |
| [Sales] | [CountryRegionCurrency] | mutable |
| [Sales] | [CreditCard] | mutable |
| [Sales] | [Currency] | mutable |
| [Sales] | [CurrencyRate] | immutable |
| [Sales] | [Customer] | mutable |
| [Sales] | [PersonCreditCard] | mutable |
| [Sales] | [SalesOrderDetail] | immutable |
| [Sales] | [SalesOrderHeader] | immutable |
| [Sales] | [SalesOrderHeaderSalesReason] | mutable |
| [Sales] | [SalesPerson] | mutable |
| [Sales] | [SalesPersonQuotaHistory] | immutable |
| [Sales] | [SalesReason] | mutable |
| [Sales] | [SalesTaxRate] | mutable |
| [Sales] | [SalesTerritory] | mutable |
| [Sales] | [SalesTerritoryHistory] | immutable |
| [Sales] | [ShoppingCartItem] | mutable |
| [Sales] | [SpecialOffer] | mutable |
| [Sales] | [SpecialOfferProduct] | mutable |
| [Sales] | [Store] | mutable |

