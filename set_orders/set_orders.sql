use SUMS_GRC

DECLARE	@return_value int,
		@ErrorMessage nvarchar(4000),
		@OrderGUID uniqueidentifier,
		@OrderOperationGUID uniqueidentifier

declare @OrderExID nvarchar(255)
declare @OrderName nvarchar(50)
declare @OrderPlanStartDate datetime
declare @OrderPlanFinishDate datetime
declare @ObjectGUID uniqueidentifier
declare @mainOrderGUID uniqueidentifier
declare @PGroupExID nvarchar(50)
declare @ParameterExID nvarchar(50)
declare @sort int


begin tran
-----------------------------------------------------------------------------------------------------------------------------------------
--ПРОВЕРКА
-----------------------------------------------------------------------------------------------------------------------------------------
select 'fct_orders', * from fct_orders
select 'FCT_OrdersParameters', * from FCT_OrdersParameters
select 'FCT_OrdersConnections', * from FCT_OrdersConnections

-----------------------------------------------------------------------------------------------------------------------------------------
--ГОЛОВА
-----------------------------------------------------------------------------------------------------------------------------------------

set @OrderExID = N'test_1'
set @OrderName = N'Пресс-ножницы саквояжного типа'
set @OrderPlanStartDate = getdate()
set @OrderPlanFinishDate = dateadd(day, 1, @OrderPlanStartDate)
set @ObjectGUID = '86F218A3-0982-471E-880B-30F0FD452527'

EXEC	@return_value = [dbo].[ORD_SetOrder] @ErrorMessage = @ErrorMessage OUTPUT,
		@OrderGUID = @OrderGUID OUTPUT,
		
		@OrderExID = @OrderExID,@OrderName = @OrderName,@OrderNumber = @OrderExID,@OrderCreateDate = @OrderPlanStartDate ,
		@OrderPlanStartDate = @OrderPlanStartDate,@OrderPlanFinishDate = @OrderPlanFinishDate,@ObjectGUID = @ObjectGUID,
		@OrderActiveFlag = 1,@OrderPlanDuration = 60,@OrderTypeID = 3,@OrderParametersSource = 1,@ComplexityID = 3,
		@PropertyID = 2,@UrgencyID = 1,@OrderStatusID = 1,@DepartmentID = 1,@OrderAuthorID = 3,@OrderWorkersAmount = 1,@OrderGroupID = -1,
		@OrderGroupExID = NULL,@OrderLat = NULL,@OrderLon = NULL,@ParentTemplateOrderGUID = NULL,@StatusCommentID = NULL,@StatusCommentExId = NULL,@StatusCommentText = NULL,@OrderComment = NULL,	@ObjectExID = NULL,@NotCheckIdentOrder = NULL,@OrderPlanAmount = NULL,@OrderAmount = NULL,@OrderUnitExID = NULL,@OrderAuthorExID = NULL,@DepartmentExID = NULL,@OrderUnitID = NULL
set @mainOrderGUID =  @OrderGUID

-----------------------------------------------------------------------------------------------------------------------------------------
--Подзадачи
-----------------------------------------------------------------------------------------------------------------------------------------
--1
-----------------------------------------------------------------------------------------------------------------------------------------
set @OrderGUID=null
set @OrderExID = N'test_1_1'
set @OrderName = N'Камера загрузки'

EXEC	@return_value = [dbo].[ORD_SetOrder] @ErrorMessage = @ErrorMessage OUTPUT,
		@OrderGUID = @OrderGUID OUTPUT,
		
		@OrderExID = @OrderExID,@OrderName = @OrderName,@OrderNumber = @OrderExID,@OrderCreateDate = @OrderPlanStartDate ,
		@OrderPlanStartDate = @OrderPlanStartDate,@OrderPlanFinishDate = @OrderPlanFinishDate,@ObjectGUID = @ObjectGUID,
		@OrderActiveFlag = 1,@OrderPlanDuration = 60,@OrderTypeID = 3,@OrderParametersSource = 1,@ComplexityID = 1,
		@PropertyID = 2,@UrgencyID = 1,@OrderStatusID = 1,@DepartmentID = 1,@OrderAuthorID = 3,@OrderWorkersAmount = 1,@OrderGroupID = -1,
		@OrderGroupExID = NULL,@OrderLat = NULL,@OrderLon = NULL,@ParentTemplateOrderGUID = NULL,@StatusCommentID = NULL,@StatusCommentExId = NULL,@StatusCommentText = NULL,@OrderComment = NULL,	@ObjectExID = NULL,@NotCheckIdentOrder = NULL,@OrderPlanAmount = NULL,@OrderAmount = NULL,@OrderUnitExID = NULL,@OrderAuthorExID = NULL,@DepartmentExID = NULL,@OrderUnitID = NULL

EXEC	@return_value = [dbo].[ORD_SetOrderConnection]
		@ErrorMessage = @ErrorMessage OUTPUT,
		@ParentOrderEXID = N'test_1',@ChildOrderEXID = @OrderExID,@ParentOrderGUID = NULL,@ChildOrderGUID = NULL,@ConnectionActiveFlag = 1,@ConnectionType = 0,
		@Sort = 1

--параметры
	--1
	set @PGroupExID = N'PS1_1_1'

	set @ParameterExID = N'PS1_1_1_1'
	set @sort = 1
	EXEC	@return_value = [dbo].[ORD_SetOrderParameter] @ErrorMessage = @ErrorMessage OUTPUT,
		@OrderExID = @OrderExID,@ParameterExID = @ParameterExID,@ParameterSort = @sort,@PGroupExID = @PGroupExID,
		@ParameterRequired = 0,@ParameterActiveFlag = 1,@PGroupID = NULL,@ParameterID = NULL,@OrderGUID = NULL,@ParameterComment = NULL
	
	set @ParameterExID = N'PS1_1_1_2'
	set @sort = 2
	EXEC	@return_value = [dbo].[ORD_SetOrderParameter] @ErrorMessage = @ErrorMessage OUTPUT,
		@OrderExID = @OrderExID,@ParameterExID = @ParameterExID,@ParameterSort = @sort,@PGroupExID = @PGroupExID,
		@ParameterRequired = 0,@ParameterActiveFlag = 1,@PGroupID = NULL,@ParameterID = NULL,@OrderGUID = NULL,@ParameterComment = NULL
	
	set @ParameterExID = N'PS1_1_1_3'
	set @sort = 3
	EXEC	@return_value = [dbo].[ORD_SetOrderParameter] @ErrorMessage = @ErrorMessage OUTPUT,
		@OrderExID = @OrderExID,@ParameterExID = @ParameterExID,@ParameterSort = @sort,@PGroupExID = @PGroupExID,
		@ParameterRequired = 0,@ParameterActiveFlag = 1,@PGroupID = NULL,@ParameterID = NULL,@OrderGUID = NULL,@ParameterComment = NULL
	
	set @ParameterExID = N'PS1_1_1_5'
	set @sort = 4
	EXEC	@return_value = [dbo].[ORD_SetOrderParameter] @ErrorMessage = @ErrorMessage OUTPUT,
		@OrderExID = @OrderExID,@ParameterExID = @ParameterExID,@ParameterSort = @sort,@PGroupExID = @PGroupExID,
		@ParameterRequired = 0,@ParameterActiveFlag = 1,@PGroupID = NULL,@ParameterID = NULL,@OrderGUID = NULL,@ParameterComment = NULL
	
	set @ParameterExID = N'PS1_1_1_6'
	set @sort = 5
	EXEC	@return_value = [dbo].[ORD_SetOrderParameter] @ErrorMessage = @ErrorMessage OUTPUT,
		@OrderExID = @OrderExID,@ParameterExID = @ParameterExID,@ParameterSort = @sort,@PGroupExID = @PGroupExID,
		@ParameterRequired = 0,@ParameterActiveFlag = 1,@PGroupID = NULL,@ParameterID = NULL,@OrderGUID = NULL,@ParameterComment = NULL
	
	set @ParameterExID = N'PS1_1_1_6_1'
	set @sort = 6
	EXEC	@return_value = [dbo].[ORD_SetOrderParameter] @ErrorMessage = @ErrorMessage OUTPUT,
		@OrderExID = @OrderExID,@ParameterExID = @ParameterExID,@ParameterSort = @sort,@PGroupExID = @PGroupExID,
		@ParameterRequired = 0,@ParameterActiveFlag = 1,@PGroupID = NULL,@ParameterID = NULL,@OrderGUID = NULL,@ParameterComment = NULL
	
	set @ParameterExID = N'PS1_1_1_6_2'
	set @sort = 7
	EXEC	@return_value = [dbo].[ORD_SetOrderParameter] @ErrorMessage = @ErrorMessage OUTPUT,
		@OrderExID = @OrderExID,@ParameterExID = @ParameterExID,@ParameterSort = @sort,@PGroupExID = @PGroupExID,
		@ParameterRequired = 0,@ParameterActiveFlag = 1,@PGroupID = NULL,@ParameterID = NULL,@OrderGUID = NULL,@ParameterComment = NULL
	
	set @ParameterExID = N'PS1_1_1_7'
	set @sort = 8
	EXEC	@return_value = [dbo].[ORD_SetOrderParameter] @ErrorMessage = @ErrorMessage OUTPUT,
		@OrderExID = @OrderExID,@ParameterExID = @ParameterExID,@ParameterSort = @sort,@PGroupExID = @PGroupExID,
		@ParameterRequired = 0,@ParameterActiveFlag = 1,@PGroupID = NULL,@ParameterID = NULL,@OrderGUID = NULL,@ParameterComment = NULL

	--2
	set @PGroupExID = N'PS1_1_2'

	set @ParameterExID = N'PS1_1_2_1'
	set @sort = 1
	EXEC	@return_value = [dbo].[ORD_SetOrderParameter] @ErrorMessage = @ErrorMessage OUTPUT,
		@OrderExID = @OrderExID,@ParameterExID = @ParameterExID,@ParameterSort = @sort,@PGroupExID = @PGroupExID,
		@ParameterRequired = 0,@ParameterActiveFlag = 1,@PGroupID = NULL,@ParameterID = NULL,@OrderGUID = NULL,@ParameterComment = NULL
	
	set @ParameterExID = N'PS1_1_2_2'
	set @sort = 2
	EXEC	@return_value = [dbo].[ORD_SetOrderParameter] @ErrorMessage = @ErrorMessage OUTPUT,
		@OrderExID = @OrderExID,@ParameterExID = @ParameterExID,@ParameterSort = @sort,@PGroupExID = @PGroupExID,
		@ParameterRequired = 0,@ParameterActiveFlag = 1,@PGroupID = NULL,@ParameterID = NULL,@OrderGUID = NULL,@ParameterComment = NULL
	
	set @ParameterExID = N'PS1_1_2_3'
	set @sort = 3
	EXEC	@return_value = [dbo].[ORD_SetOrderParameter] @ErrorMessage = @ErrorMessage OUTPUT,
		@OrderExID = @OrderExID,@ParameterExID = @ParameterExID,@ParameterSort = @sort,@PGroupExID = @PGroupExID,
		@ParameterRequired = 0,@ParameterActiveFlag = 1,@PGroupID = NULL,@ParameterID = NULL,@OrderGUID = NULL,@ParameterComment = NULL
	
	set @ParameterExID = N'PS1_1_2_4'
	set @sort = 4
	EXEC	@return_value = [dbo].[ORD_SetOrderParameter] @ErrorMessage = @ErrorMessage OUTPUT,
		@OrderExID = @OrderExID,@ParameterExID = @ParameterExID,@ParameterSort = @sort,@PGroupExID = @PGroupExID,
		@ParameterRequired = 0,@ParameterActiveFlag = 1,@PGroupID = NULL,@ParameterID = NULL,@OrderGUID = NULL,@ParameterComment = NULL
	
	set @ParameterExID = N'PS1_1_2_5'
	set @sort = 5
	EXEC	@return_value = [dbo].[ORD_SetOrderParameter] @ErrorMessage = @ErrorMessage OUTPUT,
		@OrderExID = @OrderExID,@ParameterExID = @ParameterExID,@ParameterSort = @sort,@PGroupExID = @PGroupExID,
		@ParameterRequired = 0,@ParameterActiveFlag = 1,@PGroupID = NULL,@ParameterID = NULL,@OrderGUID = NULL,@ParameterComment = NULL
	
	set @ParameterExID = N'PS1_1_2_6_1'
	set @sort = 6
	EXEC	@return_value = [dbo].[ORD_SetOrderParameter] @ErrorMessage = @ErrorMessage OUTPUT,
		@OrderExID = @OrderExID,@ParameterExID = @ParameterExID,@ParameterSort = @sort,@PGroupExID = @PGroupExID,
		@ParameterRequired = 0,@ParameterActiveFlag = 1,@PGroupID = NULL,@ParameterID = NULL,@OrderGUID = NULL,@ParameterComment = NULL
	
	set @ParameterExID = N'PS1_1_2_6_2'
	set @sort = 7
	EXEC	@return_value = [dbo].[ORD_SetOrderParameter] @ErrorMessage = @ErrorMessage OUTPUT,
		@OrderExID = @OrderExID,@ParameterExID = @ParameterExID,@ParameterSort = @sort,@PGroupExID = @PGroupExID,
		@ParameterRequired = 0,@ParameterActiveFlag = 1,@PGroupID = NULL,@ParameterID = NULL,@OrderGUID = NULL,@ParameterComment = NULL
	
	set @ParameterExID = N'PS1_1_2_7'
	set @sort = 8
	EXEC	@return_value = [dbo].[ORD_SetOrderParameter] @ErrorMessage = @ErrorMessage OUTPUT,
		@OrderExID = @OrderExID,@ParameterExID = @ParameterExID,@ParameterSort = @sort,@PGroupExID = @PGroupExID,
		@ParameterRequired = 0,@ParameterActiveFlag = 1,@PGroupID = NULL,@ParameterID = NULL,@OrderGUID = NULL,@ParameterComment = NULL

	--3
	set @PGroupExID = N'PS1_1_3'

	set @ParameterExID = N'PS1_1_3_1'
	set @sort = 1
	EXEC	@return_value = [dbo].[ORD_SetOrderParameter] @ErrorMessage = @ErrorMessage OUTPUT,
		@OrderExID = @OrderExID,@ParameterExID = @ParameterExID,@ParameterSort = @sort,@PGroupExID = @PGroupExID,
		@ParameterRequired = 0,@ParameterActiveFlag = 1,@PGroupID = NULL,@ParameterID = NULL,@OrderGUID = NULL,@ParameterComment = NULL
	
	set @ParameterExID = N'PS1_1_3_2'
	set @sort = 2
	EXEC	@return_value = [dbo].[ORD_SetOrderParameter] @ErrorMessage = @ErrorMessage OUTPUT,
		@OrderExID = @OrderExID,@ParameterExID = @ParameterExID,@ParameterSort = @sort,@PGroupExID = @PGroupExID,
		@ParameterRequired = 0,@ParameterActiveFlag = 1,@PGroupID = NULL,@ParameterID = NULL,@OrderGUID = NULL,@ParameterComment = NULL
	
	set @ParameterExID = N'PS1_1_3_3'
	set @sort = 3
	EXEC	@return_value = [dbo].[ORD_SetOrderParameter] @ErrorMessage = @ErrorMessage OUTPUT,
		@OrderExID = @OrderExID,@ParameterExID = @ParameterExID,@ParameterSort = @sort,@PGroupExID = @PGroupExID,
		@ParameterRequired = 0,@ParameterActiveFlag = 1,@PGroupID = NULL,@ParameterID = NULL,@OrderGUID = NULL,@ParameterComment = NULL
	
	set @ParameterExID = N'PS1_1_3_4'
	set @sort = 4
	EXEC	@return_value = [dbo].[ORD_SetOrderParameter] @ErrorMessage = @ErrorMessage OUTPUT,
		@OrderExID = @OrderExID,@ParameterExID = @ParameterExID,@ParameterSort = @sort,@PGroupExID = @PGroupExID,
		@ParameterRequired = 0,@ParameterActiveFlag = 1,@PGroupID = NULL,@ParameterID = NULL,@OrderGUID = NULL,@ParameterComment = NULL
	
	set @ParameterExID = N'PS1_1_3_5'
	set @sort = 5
	EXEC	@return_value = [dbo].[ORD_SetOrderParameter] @ErrorMessage = @ErrorMessage OUTPUT,
		@OrderExID = @OrderExID,@ParameterExID = @ParameterExID,@ParameterSort = @sort,@PGroupExID = @PGroupExID,
		@ParameterRequired = 0,@ParameterActiveFlag = 1,@PGroupID = NULL,@ParameterID = NULL,@OrderGUID = NULL,@ParameterComment = NULL
	
	set @ParameterExID = N'PS1_1_3_6'
	set @sort = 6
	EXEC	@return_value = [dbo].[ORD_SetOrderParameter] @ErrorMessage = @ErrorMessage OUTPUT,
		@OrderExID = @OrderExID,@ParameterExID = @ParameterExID,@ParameterSort = @sort,@PGroupExID = @PGroupExID,
		@ParameterRequired = 0,@ParameterActiveFlag = 1,@PGroupID = NULL,@ParameterID = NULL,@OrderGUID = NULL,@ParameterComment = NULL

	--4
	set @PGroupExID = N'PS1_1_4'

	set @ParameterExID = N'PS1_1_4_1'
	set @sort = 1
	EXEC	@return_value = [dbo].[ORD_SetOrderParameter] @ErrorMessage = @ErrorMessage OUTPUT,
		@OrderExID = @OrderExID,@ParameterExID = @ParameterExID,@ParameterSort = @sort,@PGroupExID = @PGroupExID,
		@ParameterRequired = 0,@ParameterActiveFlag = 1,@PGroupID = NULL,@ParameterID = NULL,@OrderGUID = NULL,@ParameterComment = NULL
	
	set @ParameterExID = N'PS1_1_4_2'
	set @sort = 2
	EXEC	@return_value = [dbo].[ORD_SetOrderParameter] @ErrorMessage = @ErrorMessage OUTPUT,
		@OrderExID = @OrderExID,@ParameterExID = @ParameterExID,@ParameterSort = @sort,@PGroupExID = @PGroupExID,
		@ParameterRequired = 0,@ParameterActiveFlag = 1,@PGroupID = NULL,@ParameterID = NULL,@OrderGUID = NULL,@ParameterComment = NULL
	
	set @ParameterExID = N'PS1_1_4_3'
	set @sort = 3
	EXEC	@return_value = [dbo].[ORD_SetOrderParameter] @ErrorMessage = @ErrorMessage OUTPUT,
		@OrderExID = @OrderExID,@ParameterExID = @ParameterExID,@ParameterSort = @sort,@PGroupExID = @PGroupExID,
		@ParameterRequired = 0,@ParameterActiveFlag = 1,@PGroupID = NULL,@ParameterID = NULL,@OrderGUID = NULL,@ParameterComment = NULL
	
	set @ParameterExID = N'PS1_1_4_4'
	set @sort = 4
	EXEC	@return_value = [dbo].[ORD_SetOrderParameter] @ErrorMessage = @ErrorMessage OUTPUT,
		@OrderExID = @OrderExID,@ParameterExID = @ParameterExID,@ParameterSort = @sort,@PGroupExID = @PGroupExID,
		@ParameterRequired = 0,@ParameterActiveFlag = 1,@PGroupID = NULL,@ParameterID = NULL,@OrderGUID = NULL,@ParameterComment = NULL
	
	set @ParameterExID = N'PS1_1_4_5'
	set @sort = 5
	EXEC	@return_value = [dbo].[ORD_SetOrderParameter] @ErrorMessage = @ErrorMessage OUTPUT,
		@OrderExID = @OrderExID,@ParameterExID = @ParameterExID,@ParameterSort = @sort,@PGroupExID = @PGroupExID,
		@ParameterRequired = 0,@ParameterActiveFlag = 1,@PGroupID = NULL,@ParameterID = NULL,@OrderGUID = NULL,@ParameterComment = NULL
	
	set @ParameterExID = N'PS1_1_4_6'
	set @sort = 6
	EXEC	@return_value = [dbo].[ORD_SetOrderParameter] @ErrorMessage = @ErrorMessage OUTPUT,
		@OrderExID = @OrderExID,@ParameterExID = @ParameterExID,@ParameterSort = @sort,@PGroupExID = @PGroupExID,
		@ParameterRequired = 0,@ParameterActiveFlag = 1,@PGroupID = NULL,@ParameterID = NULL,@OrderGUID = NULL,@ParameterComment = NULL

	--5
	set @PGroupExID = N'PS1_1_5'

	set @ParameterExID = N'PS1_1_5_1'
	set @sort = 1
	EXEC	@return_value = [dbo].[ORD_SetOrderParameter] @ErrorMessage = @ErrorMessage OUTPUT,
		@OrderExID = @OrderExID,@ParameterExID = @ParameterExID,@ParameterSort = @sort,@PGroupExID = @PGroupExID,
		@ParameterRequired = 0,@ParameterActiveFlag = 1,@PGroupID = NULL,@ParameterID = NULL,@OrderGUID = NULL,@ParameterComment = NULL
	
	set @ParameterExID = N'PS1_1_5_2'
	set @sort = 2
	EXEC	@return_value = [dbo].[ORD_SetOrderParameter] @ErrorMessage = @ErrorMessage OUTPUT,
		@OrderExID = @OrderExID,@ParameterExID = @ParameterExID,@ParameterSort = @sort,@PGroupExID = @PGroupExID,
		@ParameterRequired = 0,@ParameterActiveFlag = 1,@PGroupID = NULL,@ParameterID = NULL,@OrderGUID = NULL,@ParameterComment = NULL
	
	set @ParameterExID = N'PS1_1_5_3'
	set @sort = 3
	EXEC	@return_value = [dbo].[ORD_SetOrderParameter] @ErrorMessage = @ErrorMessage OUTPUT,
		@OrderExID = @OrderExID,@ParameterExID = @ParameterExID,@ParameterSort = @sort,@PGroupExID = @PGroupExID,
		@ParameterRequired = 0,@ParameterActiveFlag = 1,@PGroupID = NULL,@ParameterID = NULL,@OrderGUID = NULL,@ParameterComment = NULL
	
	set @ParameterExID = N'PS1_1_5_4'
	set @sort = 4
	EXEC	@return_value = [dbo].[ORD_SetOrderParameter] @ErrorMessage = @ErrorMessage OUTPUT,
		@OrderExID = @OrderExID,@ParameterExID = @ParameterExID,@ParameterSort = @sort,@PGroupExID = @PGroupExID,
		@ParameterRequired = 0,@ParameterActiveFlag = 1,@PGroupID = NULL,@ParameterID = NULL,@OrderGUID = NULL,@ParameterComment = NULL

	--6
	set @PGroupExID = N'PS1_1_6'

	set @ParameterExID = N'PS1_1_6_1'
	set @sort = 1
	EXEC	@return_value = [dbo].[ORD_SetOrderParameter] @ErrorMessage = @ErrorMessage OUTPUT,
		@OrderExID = @OrderExID,@ParameterExID = @ParameterExID,@ParameterSort = @sort,@PGroupExID = @PGroupExID,
		@ParameterRequired = 0,@ParameterActiveFlag = 1,@PGroupID = NULL,@ParameterID = NULL,@OrderGUID = NULL,@ParameterComment = NULL
	
	set @ParameterExID = N'PS1_1_6_2'
	set @sort = 2
	EXEC	@return_value = [dbo].[ORD_SetOrderParameter] @ErrorMessage = @ErrorMessage OUTPUT,
		@OrderExID = @OrderExID,@ParameterExID = @ParameterExID,@ParameterSort = @sort,@PGroupExID = @PGroupExID,
		@ParameterRequired = 0,@ParameterActiveFlag = 1,@PGroupID = NULL,@ParameterID = NULL,@OrderGUID = NULL,@ParameterComment = NULL
	
	set @ParameterExID = N'PS1_1_6_3'
	set @sort = 3
	EXEC	@return_value = [dbo].[ORD_SetOrderParameter] @ErrorMessage = @ErrorMessage OUTPUT,
		@OrderExID = @OrderExID,@ParameterExID = @ParameterExID,@ParameterSort = @sort,@PGroupExID = @PGroupExID,
		@ParameterRequired = 0,@ParameterActiveFlag = 1,@PGroupID = NULL,@ParameterID = NULL,@OrderGUID = NULL,@ParameterComment = NULL
	
	set @ParameterExID = N'PS1_1_6_4'
	set @sort = 4
	EXEC	@return_value = [dbo].[ORD_SetOrderParameter] @ErrorMessage = @ErrorMessage OUTPUT,
		@OrderExID = @OrderExID,@ParameterExID = @ParameterExID,@ParameterSort = @sort,@PGroupExID = @PGroupExID,
		@ParameterRequired = 0,@ParameterActiveFlag = 1,@PGroupID = NULL,@ParameterID = NULL,@OrderGUID = NULL,@ParameterComment = NULL
	
	set @ParameterExID = N'PS1_1_6_5'
	set @sort = 5
	EXEC	@return_value = [dbo].[ORD_SetOrderParameter] @ErrorMessage = @ErrorMessage OUTPUT,
		@OrderExID = @OrderExID,@ParameterExID = @ParameterExID,@ParameterSort = @sort,@PGroupExID = @PGroupExID,
		@ParameterRequired = 0,@ParameterActiveFlag = 1,@PGroupID = NULL,@ParameterID = NULL,@OrderGUID = NULL,@ParameterComment = NULL
	
	--7
	set @PGroupExID = N'PS1_1_7'

	set @ParameterExID = N'PS1_1_7_1'
	set @sort = 1
	EXEC	@return_value = [dbo].[ORD_SetOrderParameter] @ErrorMessage = @ErrorMessage OUTPUT,
		@OrderExID = @OrderExID,@ParameterExID = @ParameterExID,@ParameterSort = @sort,@PGroupExID = @PGroupExID,
		@ParameterRequired = 0,@ParameterActiveFlag = 1,@PGroupID = NULL,@ParameterID = NULL,@OrderGUID = NULL,@ParameterComment = NULL
	
	set @ParameterExID = N'PS1_1_7_2'
	set @sort = 2
	EXEC	@return_value = [dbo].[ORD_SetOrderParameter] @ErrorMessage = @ErrorMessage OUTPUT,
		@OrderExID = @OrderExID,@ParameterExID = @ParameterExID,@ParameterSort = @sort,@PGroupExID = @PGroupExID,
		@ParameterRequired = 0,@ParameterActiveFlag = 1,@PGroupID = NULL,@ParameterID = NULL,@OrderGUID = NULL,@ParameterComment = NULL
	
	set @ParameterExID = N'PS1_1_7_3'
	set @sort = 3
	EXEC	@return_value = [dbo].[ORD_SetOrderParameter] @ErrorMessage = @ErrorMessage OUTPUT,
		@OrderExID = @OrderExID,@ParameterExID = @ParameterExID,@ParameterSort = @sort,@PGroupExID = @PGroupExID,
		@ParameterRequired = 0,@ParameterActiveFlag = 1,@PGroupID = NULL,@ParameterID = NULL,@OrderGUID = NULL,@ParameterComment = NULL
	
	set @ParameterExID = N'PS1_1_7_4'
	set @sort = 4
	EXEC	@return_value = [dbo].[ORD_SetOrderParameter] @ErrorMessage = @ErrorMessage OUTPUT,
		@OrderExID = @OrderExID,@ParameterExID = @ParameterExID,@ParameterSort = @sort,@PGroupExID = @PGroupExID,
		@ParameterRequired = 0,@ParameterActiveFlag = 1,@PGroupID = NULL,@ParameterID = NULL,@OrderGUID = NULL,@ParameterComment = NULL
	
	set @ParameterExID = N'PS1_1_7_5'
	set @sort = 5
	EXEC	@return_value = [dbo].[ORD_SetOrderParameter] @ErrorMessage = @ErrorMessage OUTPUT,
		@OrderExID = @OrderExID,@ParameterExID = @ParameterExID,@ParameterSort = @sort,@PGroupExID = @PGroupExID,
		@ParameterRequired = 0,@ParameterActiveFlag = 1,@PGroupID = NULL,@ParameterID = NULL,@OrderGUID = NULL,@ParameterComment = NULL

	--8
	set @PGroupExID = N'PS1_1_8'

	set @ParameterExID = N'PS1_1_8_1'
	set @sort = 1
	EXEC	@return_value = [dbo].[ORD_SetOrderParameter] @ErrorMessage = @ErrorMessage OUTPUT,
		@OrderExID = @OrderExID,@ParameterExID = @ParameterExID,@ParameterSort = @sort,@PGroupExID = @PGroupExID,
		@ParameterRequired = 0,@ParameterActiveFlag = 1,@PGroupID = NULL,@ParameterID = NULL,@OrderGUID = NULL,@ParameterComment = NULL
	
	set @ParameterExID = N'PS1_1_8_2'
	set @sort = 2
	EXEC	@return_value = [dbo].[ORD_SetOrderParameter] @ErrorMessage = @ErrorMessage OUTPUT,
		@OrderExID = @OrderExID,@ParameterExID = @ParameterExID,@ParameterSort = @sort,@PGroupExID = @PGroupExID,
		@ParameterRequired = 0,@ParameterActiveFlag = 1,@PGroupID = NULL,@ParameterID = NULL,@OrderGUID = NULL,@ParameterComment = NULL
	
	set @ParameterExID = N'PS1_1_8_3'
	set @sort = 3
	EXEC	@return_value = [dbo].[ORD_SetOrderParameter] @ErrorMessage = @ErrorMessage OUTPUT,
		@OrderExID = @OrderExID,@ParameterExID = @ParameterExID,@ParameterSort = @sort,@PGroupExID = @PGroupExID,
		@ParameterRequired = 0,@ParameterActiveFlag = 1,@PGroupID = NULL,@ParameterID = NULL,@OrderGUID = NULL,@ParameterComment = NULL
	
	set @ParameterExID = N'PS1_1_8_4'
	set @sort = 4
	EXEC	@return_value = [dbo].[ORD_SetOrderParameter] @ErrorMessage = @ErrorMessage OUTPUT,
		@OrderExID = @OrderExID,@ParameterExID = @ParameterExID,@ParameterSort = @sort,@PGroupExID = @PGroupExID,
		@ParameterRequired = 0,@ParameterActiveFlag = 1,@PGroupID = NULL,@ParameterID = NULL,@OrderGUID = NULL,@ParameterComment = NULL
	
	set @ParameterExID = N'PS1_1_8_5'
	set @sort = 5
	EXEC	@return_value = [dbo].[ORD_SetOrderParameter] @ErrorMessage = @ErrorMessage OUTPUT,
		@OrderExID = @OrderExID,@ParameterExID = @ParameterExID,@ParameterSort = @sort,@PGroupExID = @PGroupExID,
		@ParameterRequired = 0,@ParameterActiveFlag = 1,@PGroupID = NULL,@ParameterID = NULL,@OrderGUID = NULL,@ParameterComment = NULL

	--9
	set @PGroupExID = N'PS1_1_9'

	set @ParameterExID = N'PS1_1_9_1'
	set @sort = 1
	EXEC	@return_value = [dbo].[ORD_SetOrderParameter] @ErrorMessage = @ErrorMessage OUTPUT,
		@OrderExID = @OrderExID,@ParameterExID = @ParameterExID,@ParameterSort = @sort,@PGroupExID = @PGroupExID,
		@ParameterRequired = 0,@ParameterActiveFlag = 1,@PGroupID = NULL,@ParameterID = NULL,@OrderGUID = NULL,@ParameterComment = NULL
	
	set @ParameterExID = N'PS1_1_9_2'
	set @sort = 2
	EXEC	@return_value = [dbo].[ORD_SetOrderParameter] @ErrorMessage = @ErrorMessage OUTPUT,
		@OrderExID = @OrderExID,@ParameterExID = @ParameterExID,@ParameterSort = @sort,@PGroupExID = @PGroupExID,
		@ParameterRequired = 0,@ParameterActiveFlag = 1,@PGroupID = NULL,@ParameterID = NULL,@OrderGUID = NULL,@ParameterComment = NULL
	
	set @ParameterExID = N'PS1_1_9_3'
	set @sort = 3
	EXEC	@return_value = [dbo].[ORD_SetOrderParameter] @ErrorMessage = @ErrorMessage OUTPUT,
		@OrderExID = @OrderExID,@ParameterExID = @ParameterExID,@ParameterSort = @sort,@PGroupExID = @PGroupExID,
		@ParameterRequired = 0,@ParameterActiveFlag = 1,@PGroupID = NULL,@ParameterID = NULL,@OrderGUID = NULL,@ParameterComment = NULL
	
	set @ParameterExID = N'PS1_1_9_4'
	set @sort = 4
	EXEC	@return_value = [dbo].[ORD_SetOrderParameter] @ErrorMessage = @ErrorMessage OUTPUT,
		@OrderExID = @OrderExID,@ParameterExID = @ParameterExID,@ParameterSort = @sort,@PGroupExID = @PGroupExID,
		@ParameterRequired = 0,@ParameterActiveFlag = 1,@PGroupID = NULL,@ParameterID = NULL,@OrderGUID = NULL,@ParameterComment = NULL
	
	set @ParameterExID = N'PS1_1_9_5'
	set @sort = 5
	EXEC	@return_value = [dbo].[ORD_SetOrderParameter] @ErrorMessage = @ErrorMessage OUTPUT,
		@OrderExID = @OrderExID,@ParameterExID = @ParameterExID,@ParameterSort = @sort,@PGroupExID = @PGroupExID,
		@ParameterRequired = 0,@ParameterActiveFlag = 1,@PGroupID = NULL,@ParameterID = NULL,@OrderGUID = NULL,@ParameterComment = NULL

	--10
	set @PGroupExID = N'PS1_1_10'

	set @ParameterExID = N'PS1_1_10_1'
	set @sort = 1
	EXEC	@return_value = [dbo].[ORD_SetOrderParameter] @ErrorMessage = @ErrorMessage OUTPUT,
		@OrderExID = @OrderExID,@ParameterExID = @ParameterExID,@ParameterSort = @sort,@PGroupExID = @PGroupExID,
		@ParameterRequired = 0,@ParameterActiveFlag = 1,@PGroupID = NULL,@ParameterID = NULL,@OrderGUID = NULL,@ParameterComment = NULL
	
	set @ParameterExID = N'PS1_1_10_2'
	set @sort = 2
	EXEC	@return_value = [dbo].[ORD_SetOrderParameter] @ErrorMessage = @ErrorMessage OUTPUT,
		@OrderExID = @OrderExID,@ParameterExID = @ParameterExID,@ParameterSort = @sort,@PGroupExID = @PGroupExID,
		@ParameterRequired = 0,@ParameterActiveFlag = 1,@PGroupID = NULL,@ParameterID = NULL,@OrderGUID = NULL,@ParameterComment = NULL
	
	set @ParameterExID = N'PS1_1_10_3'
	set @sort = 3
	EXEC	@return_value = [dbo].[ORD_SetOrderParameter] @ErrorMessage = @ErrorMessage OUTPUT,
		@OrderExID = @OrderExID,@ParameterExID = @ParameterExID,@ParameterSort = @sort,@PGroupExID = @PGroupExID,
		@ParameterRequired = 0,@ParameterActiveFlag = 1,@PGroupID = NULL,@ParameterID = NULL,@OrderGUID = NULL,@ParameterComment = NULL
	
	set @ParameterExID = N'PS1_1_10_4'
	set @sort = 4
	EXEC	@return_value = [dbo].[ORD_SetOrderParameter] @ErrorMessage = @ErrorMessage OUTPUT,
		@OrderExID = @OrderExID,@ParameterExID = @ParameterExID,@ParameterSort = @sort,@PGroupExID = @PGroupExID,
		@ParameterRequired = 0,@ParameterActiveFlag = 1,@PGroupID = NULL,@ParameterID = NULL,@OrderGUID = NULL,@ParameterComment = NULL
	
	set @ParameterExID = N'PS1_1_10_5'
	set @sort = 5
	EXEC	@return_value = [dbo].[ORD_SetOrderParameter] @ErrorMessage = @ErrorMessage OUTPUT,
		@OrderExID = @OrderExID,@ParameterExID = @ParameterExID,@ParameterSort = @sort,@PGroupExID = @PGroupExID,
		@ParameterRequired = 0,@ParameterActiveFlag = 1,@PGroupID = NULL,@ParameterID = NULL,@OrderGUID = NULL,@ParameterComment = NULL

	--11
	set @PGroupExID = N'PS1_1_11'

	set @ParameterExID = N'PS1_1_11_1'
	set @sort = 1
	EXEC	@return_value = [dbo].[ORD_SetOrderParameter] @ErrorMessage = @ErrorMessage OUTPUT,
		@OrderExID = @OrderExID,@ParameterExID = @ParameterExID,@ParameterSort = @sort,@PGroupExID = @PGroupExID,
		@ParameterRequired = 0,@ParameterActiveFlag = 1,@PGroupID = NULL,@ParameterID = NULL,@OrderGUID = NULL,@ParameterComment = NULL
	
	set @ParameterExID = N'PS1_1_11_2'
	set @sort = 2
	EXEC	@return_value = [dbo].[ORD_SetOrderParameter] @ErrorMessage = @ErrorMessage OUTPUT,
		@OrderExID = @OrderExID,@ParameterExID = @ParameterExID,@ParameterSort = @sort,@PGroupExID = @PGroupExID,
		@ParameterRequired = 0,@ParameterActiveFlag = 1,@PGroupID = NULL,@ParameterID = NULL,@OrderGUID = NULL,@ParameterComment = NULL
	
	set @ParameterExID = N'PS1_1_11_3'
	set @sort = 3
	EXEC	@return_value = [dbo].[ORD_SetOrderParameter] @ErrorMessage = @ErrorMessage OUTPUT,
		@OrderExID = @OrderExID,@ParameterExID = @ParameterExID,@ParameterSort = @sort,@PGroupExID = @PGroupExID,
		@ParameterRequired = 0,@ParameterActiveFlag = 1,@PGroupID = NULL,@ParameterID = NULL,@OrderGUID = NULL,@ParameterComment = NULL
	
	set @ParameterExID = N'PS1_1_11_4'
	set @sort = 4
	EXEC	@return_value = [dbo].[ORD_SetOrderParameter] @ErrorMessage = @ErrorMessage OUTPUT,
		@OrderExID = @OrderExID,@ParameterExID = @ParameterExID,@ParameterSort = @sort,@PGroupExID = @PGroupExID,
		@ParameterRequired = 0,@ParameterActiveFlag = 1,@PGroupID = NULL,@ParameterID = NULL,@OrderGUID = NULL,@ParameterComment = NULL
	
	set @ParameterExID = N'PS1_1_11_5'
	set @sort = 5
	EXEC	@return_value = [dbo].[ORD_SetOrderParameter] @ErrorMessage = @ErrorMessage OUTPUT,
		@OrderExID = @OrderExID,@ParameterExID = @ParameterExID,@ParameterSort = @sort,@PGroupExID = @PGroupExID,
		@ParameterRequired = 0,@ParameterActiveFlag = 1,@PGroupID = NULL,@ParameterID = NULL,@OrderGUID = NULL,@ParameterComment = NULL
-----------------------------------------------------------------------------------------------------------------------------------------
--2
-----------------------------------------------------------------------------------------------------------------------------------------
set @OrderGUID=null
set @OrderExID = N'test_1_2'
set @OrderName = N'Толкатель'

EXEC	@return_value = [dbo].[ORD_SetOrder] @ErrorMessage = @ErrorMessage OUTPUT,
		@OrderGUID = @OrderGUID OUTPUT,
		
		@OrderExID = @OrderExID,@OrderName = @OrderName,@OrderNumber = @OrderExID,@OrderCreateDate = @OrderPlanStartDate ,
		@OrderPlanStartDate = @OrderPlanStartDate,@OrderPlanFinishDate = @OrderPlanFinishDate,@ObjectGUID = @ObjectGUID,
		@OrderActiveFlag = 1,@OrderPlanDuration = 60,@OrderTypeID = 3,@OrderParametersSource = 1,@ComplexityID = 1,
		@PropertyID = 2,@UrgencyID = 1,@OrderStatusID = 1,@DepartmentID = 1,@OrderAuthorID = 3,@OrderWorkersAmount = 1,@OrderGroupID = -1,
		@OrderGroupExID = NULL,@OrderLat = NULL,@OrderLon = NULL,@ParentTemplateOrderGUID = NULL,@StatusCommentID = NULL,@StatusCommentExId = NULL,@StatusCommentText = NULL,@OrderComment = NULL,	@ObjectExID = NULL,@NotCheckIdentOrder = NULL,@OrderPlanAmount = NULL,@OrderAmount = NULL,@OrderUnitExID = NULL,@OrderAuthorExID = NULL,@DepartmentExID = NULL,@OrderUnitID = NULL

EXEC	@return_value = [dbo].[ORD_SetOrderConnection]
		@ErrorMessage = @ErrorMessage OUTPUT,
		@ParentOrderEXID = N'test_1',@ChildOrderEXID = @OrderExID,@ParentOrderGUID = NULL,@ChildOrderGUID = NULL,@ConnectionActiveFlag = 1,@ConnectionType = 0,
		@Sort = 1
-----------------------------------------------------------------------------------------------------------------------------------------
--3
-----------------------------------------------------------------------------------------------------------------------------------------
set @OrderGUID=null
set @OrderExID = N'test_1_3'
set @OrderName = N'Трамбовка'

EXEC	@return_value = [dbo].[ORD_SetOrder] @ErrorMessage = @ErrorMessage OUTPUT,
		@OrderGUID = @OrderGUID OUTPUT,
		
		@OrderExID = @OrderExID,@OrderName = @OrderName,@OrderNumber = @OrderExID,@OrderCreateDate = @OrderPlanStartDate ,
		@OrderPlanStartDate = @OrderPlanStartDate,@OrderPlanFinishDate = @OrderPlanFinishDate,@ObjectGUID = @ObjectGUID,
		@OrderActiveFlag = 1,@OrderPlanDuration = 60,@OrderTypeID = 3,@OrderParametersSource = 1,@ComplexityID = 1,
		@PropertyID = 2,@UrgencyID = 1,@OrderStatusID = 1,@DepartmentID = 1,@OrderAuthorID = 3,@OrderWorkersAmount = 1,@OrderGroupID = -1,
		@OrderGroupExID = NULL,@OrderLat = NULL,@OrderLon = NULL,@ParentTemplateOrderGUID = NULL,@StatusCommentID = NULL,@StatusCommentExId = NULL,@StatusCommentText = NULL,@OrderComment = NULL,	@ObjectExID = NULL,@NotCheckIdentOrder = NULL,@OrderPlanAmount = NULL,@OrderAmount = NULL,@OrderUnitExID = NULL,@OrderAuthorExID = NULL,@DepartmentExID = NULL,@OrderUnitID = NULL

EXEC	@return_value = [dbo].[ORD_SetOrderConnection]
		@ErrorMessage = @ErrorMessage OUTPUT,
		@ParentOrderEXID = N'test_1',@ChildOrderEXID = @OrderExID,@ParentOrderGUID = NULL,@ChildOrderGUID = NULL,@ConnectionActiveFlag = 1,@ConnectionType = 0,
		@Sort = 1
-----------------------------------------------------------------------------------------------------------------------------------------
--4
-----------------------------------------------------------------------------------------------------------------------------------------
set @OrderGUID=null
set @OrderExID = N'test_1_4'
set @OrderName = N'Камера загрузки'

EXEC	@return_value = [dbo].[ORD_SetOrder] @ErrorMessage = @ErrorMessage OUTPUT,
		@OrderGUID = @OrderGUID OUTPUT,
		
		@OrderExID = @OrderExID,@OrderName = @OrderName,@OrderNumber = @OrderExID,@OrderCreateDate = @OrderPlanStartDate ,
		@OrderPlanStartDate = @OrderPlanStartDate,@OrderPlanFinishDate = @OrderPlanFinishDate,@ObjectGUID = @ObjectGUID,
		@OrderActiveFlag = 1,@OrderPlanDuration = 60,@OrderTypeID = 3,@OrderParametersSource = 1,@ComplexityID = 1,
		@PropertyID = 2,@UrgencyID = 1,@OrderStatusID = 1,@DepartmentID = 1,@OrderAuthorID = 3,@OrderWorkersAmount = 1,@OrderGroupID = -1,
		@OrderGroupExID = NULL,@OrderLat = NULL,@OrderLon = NULL,@ParentTemplateOrderGUID = NULL,@StatusCommentID = NULL,@StatusCommentExId = NULL,@StatusCommentText = NULL,@OrderComment = NULL,	@ObjectExID = NULL,@NotCheckIdentOrder = NULL,@OrderPlanAmount = NULL,@OrderAmount = NULL,@OrderUnitExID = NULL,@OrderAuthorExID = NULL,@DepartmentExID = NULL,@OrderUnitID = NULL

EXEC	@return_value = [dbo].[ORD_SetOrderConnection]
		@ErrorMessage = @ErrorMessage OUTPUT,
		@ParentOrderEXID = N'test_1',@ChildOrderEXID = @OrderExID,@ParentOrderGUID = NULL,@ChildOrderGUID = NULL,@ConnectionActiveFlag = 1,@ConnectionType = 0,
		@Sort = 1
-----------------------------------------------------------------------------------------------------------------------------------------
--4
-----------------------------------------------------------------------------------------------------------------------------------------
set @OrderGUID=null
set @OrderExID = N'test_1_4'
set @OrderName = N'Узел реза'

EXEC	@return_value = [dbo].[ORD_SetOrder] @ErrorMessage = @ErrorMessage OUTPUT,
		@OrderGUID = @OrderGUID OUTPUT,
		
		@OrderExID = @OrderExID,@OrderName = @OrderName,@OrderNumber = @OrderExID,@OrderCreateDate = @OrderPlanStartDate ,
		@OrderPlanStartDate = @OrderPlanStartDate,@OrderPlanFinishDate = @OrderPlanFinishDate,@ObjectGUID = @ObjectGUID,
		@OrderActiveFlag = 1,@OrderPlanDuration = 60,@OrderTypeID = 3,@OrderParametersSource = 1,@ComplexityID = 1,
		@PropertyID = 2,@UrgencyID = 1,@OrderStatusID = 1,@DepartmentID = 1,@OrderAuthorID = 3,@OrderWorkersAmount = 1,@OrderGroupID = -1,
		@OrderGroupExID = NULL,@OrderLat = NULL,@OrderLon = NULL,@ParentTemplateOrderGUID = NULL,@StatusCommentID = NULL,@StatusCommentExId = NULL,@StatusCommentText = NULL,@OrderComment = NULL,	@ObjectExID = NULL,@NotCheckIdentOrder = NULL,@OrderPlanAmount = NULL,@OrderAmount = NULL,@OrderUnitExID = NULL,@OrderAuthorExID = NULL,@DepartmentExID = NULL,@OrderUnitID = NULL

EXEC	@return_value = [dbo].[ORD_SetOrderConnection]
		@ErrorMessage = @ErrorMessage OUTPUT,
		@ParentOrderEXID = N'test_1',@ChildOrderEXID = @OrderExID,@ParentOrderGUID = NULL,@ChildOrderGUID = NULL,@ConnectionActiveFlag = 1,@ConnectionType = 0,
		@Sort = 1
-----------------------------------------------------------------------------------------------------------------------------------------
--5
-----------------------------------------------------------------------------------------------------------------------------------------
set @OrderGUID=null
set @OrderExID = N'test_1_5'
set @OrderName = N'Система гидравлики'

EXEC	@return_value = [dbo].[ORD_SetOrder] @ErrorMessage = @ErrorMessage OUTPUT,
		@OrderGUID = @OrderGUID OUTPUT,
		
		@OrderExID = @OrderExID,@OrderName = @OrderName,@OrderNumber = @OrderExID,@OrderCreateDate = @OrderPlanStartDate ,
		@OrderPlanStartDate = @OrderPlanStartDate,@OrderPlanFinishDate = @OrderPlanFinishDate,@ObjectGUID = @ObjectGUID,
		@OrderActiveFlag = 1,@OrderPlanDuration = 60,@OrderTypeID = 3,@OrderParametersSource = 1,@ComplexityID = 1,
		@PropertyID = 2,@UrgencyID = 1,@OrderStatusID = 1,@DepartmentID = 1,@OrderAuthorID = 3,@OrderWorkersAmount = 1,@OrderGroupID = -1,
		@OrderGroupExID = NULL,@OrderLat = NULL,@OrderLon = NULL,@ParentTemplateOrderGUID = NULL,@StatusCommentID = NULL,@StatusCommentExId = NULL,@StatusCommentText = NULL,@OrderComment = NULL,	@ObjectExID = NULL,@NotCheckIdentOrder = NULL,@OrderPlanAmount = NULL,@OrderAmount = NULL,@OrderUnitExID = NULL,@OrderAuthorExID = NULL,@DepartmentExID = NULL,@OrderUnitID = NULL

EXEC	@return_value = [dbo].[ORD_SetOrderConnection]
		@ErrorMessage = @ErrorMessage OUTPUT,
		@ParentOrderEXID = N'test_1',@ChildOrderEXID = @OrderExID,@ParentOrderGUID = NULL,@ChildOrderGUID = NULL,@ConnectionActiveFlag = 1,@ConnectionType = 0,
		@Sort = 1
-----------------------------------------------------------------------------------------------------------------------------------------
--6
-----------------------------------------------------------------------------------------------------------------------------------------
set @OrderGUID=null
set @OrderExID = N'test_1_6'
set @OrderName = N'Система электрики'

EXEC	@return_value = [dbo].[ORD_SetOrder] @ErrorMessage = @ErrorMessage OUTPUT,
		@OrderGUID = @OrderGUID OUTPUT,
		
		@OrderExID = @OrderExID,@OrderName = @OrderName,@OrderNumber = @OrderExID,@OrderCreateDate = @OrderPlanStartDate ,
		@OrderPlanStartDate = @OrderPlanStartDate,@OrderPlanFinishDate = @OrderPlanFinishDate,@ObjectGUID = @ObjectGUID,
		@OrderActiveFlag = 1,@OrderPlanDuration = 60,@OrderTypeID = 3,@OrderParametersSource = 1,@ComplexityID = 1,
		@PropertyID = 2,@UrgencyID = 1,@OrderStatusID = 1,@DepartmentID = 1,@OrderAuthorID = 3,@OrderWorkersAmount = 1,@OrderGroupID = -1,
		@OrderGroupExID = NULL,@OrderLat = NULL,@OrderLon = NULL,@ParentTemplateOrderGUID = NULL,@StatusCommentID = NULL,@StatusCommentExId = NULL,@StatusCommentText = NULL,@OrderComment = NULL,	@ObjectExID = NULL,@NotCheckIdentOrder = NULL,@OrderPlanAmount = NULL,@OrderAmount = NULL,@OrderUnitExID = NULL,@OrderAuthorExID = NULL,@DepartmentExID = NULL,@OrderUnitID = NULL

EXEC	@return_value = [dbo].[ORD_SetOrderConnection]
		@ErrorMessage = @ErrorMessage OUTPUT,
		@ParentOrderEXID = N'test_1',@ChildOrderEXID = @OrderExID,@ParentOrderGUID = NULL,@ChildOrderGUID = NULL,@ConnectionActiveFlag = 1,@ConnectionType = 0,
		@Sort = 1

		-----------------------------------------------------------------------------------------------------------------------------------------
--ПРОВЕРКА
-----------------------------------------------------------------------------------------------------------------------------------------
select 'fct_orders', * from fct_orders
select 'FCT_OrdersParameters', * from FCT_OrdersParameters
select 'FCT_OrdersConnections', * from FCT_OrdersConnections

-----------------------------------------------------------------------------------------------------------------------------------------

--commit
rollback