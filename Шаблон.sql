use SUMS_GRC

DECLARE	@return_value int,
		@ErrorMessage nvarchar(4000),
		@OrderGUID uniqueidentifier,
		@OrderOperationGUID uniqueidentifier

begin tran


select * from ORD_OrderTemplates
select * from ORD_OrderTemplatesConnections
--------------------------------------------------------------------------------
--Голова
--------------------------------------------------------------------------------

EXEC @return_value = [dbo].[ORD_SetOrderTemplate]  
 @ErrorMessage = @ErrorMessage OUTPUT,   @OrderGUID = @OrderGUID OUTPUT,   
 @OrderActiveFlag = 1,   
 @OrderExID = N'PS1',   @OrderName = N'Пресс-ножницы саквояжного типа',   @OrderComment = N'Пресс-ножницы саквояжного типа',   @OrderPlanDuration = 60,   
 @OrderPlanStartDate = N'2021-09-07 00:00',   @OrderPlanFinishDate = N'2031-09-07 00:00',
 @OrderTypeID = 3,   -- Смешанный
 @ComplexityID = 3,  -- Обход
 @PropertyID = 2,   @UrgencyID = 1,   
 @OrderStatusID = 1,   @OrderTemplateAuthorID = NULL,   @OrderTemplateAuthorExID = NULL,
 @OrderParametersSource = 1,@OrderWorkersAmount = 1,   @OrderGroupID = -1,   
 @OrderGroupExID = NULL,   @DepartmentId = NULL,   
 @DepartmentExID = NULL; set @OrderGUID = null;
select @ErrorMessage,1

--------------------------------------------------------------------------------
--подзадачи
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
--1 Камера загрузки
--------------------------------------------------------------------------------
set @OrderGUID = null
EXEC @return_value = [dbo].[ORD_SetOrderTemplate]  
 @ErrorMessage = @ErrorMessage OUTPUT,   @OrderGUID = @OrderGUID OUTPUT,   
 @OrderActiveFlag = 1,   
 @OrderExID = N'PS1_1',   @OrderName = N'Камера загрузки',   @OrderComment = N'Камера загрузки',   @OrderPlanDuration = 60,   
 @OrderPlanStartDate = N'2021-09-07 00:00',   @OrderPlanFinishDate = N'2031-09-07 00:00',
 @OrderTypeID = 3,   -- Смешанный
 @ComplexityID = 1,  -- Обход
 @PropertyID = 2,   @UrgencyID = 1,   
 @OrderStatusID = 1,   @OrderTemplateAuthorID = NULL,   @OrderTemplateAuthorExID = NULL,
 @OrderParametersSource = 1,@OrderWorkersAmount = 1,   @OrderGroupID = -1,   
 @OrderGroupExID = NULL,   @DepartmentId = NULL,   
 @DepartmentExID = NULL; set @OrderGUID = null;
select @ErrorMessage,'2_1'

EXEC	@return_value = [dbo].[ORD_SetOrderTemplateConnection]
		@ErrorMessage = @ErrorMessage OUTPUT,
		@ParentOrderGUID = NULL,
		@ParentOrderExID = N'PS1',
		@ChildOrderGUID = NULL,
		@ChildOrderExID = N'PS1_1', --!!!
		@ConnectionActiveFlag = 1,
		@Sort = 1 --

---------------------------------------------------------------------------------------------------------------------------------------



--------------------------------------------------------------------------------
--2 Толкатель
--------------------------------------------------------------------------------
set @OrderGUID = null
EXEC @return_value = [dbo].[ORD_SetOrderTemplate]  
 @ErrorMessage = @ErrorMessage OUTPUT,   @OrderGUID = @OrderGUID OUTPUT,   
 @OrderActiveFlag = 1,   
 @OrderExID = N'PS1_2',   @OrderName = N'Толкатель',   @OrderComment = N'Толкатель',   @OrderPlanDuration = 60,   
 @OrderPlanStartDate = N'2021-09-07 00:00',   @OrderPlanFinishDate = N'2031-09-07 00:00',
 @OrderTypeID = 3,   -- Смешанный
 @ComplexityID = 1,  -- Обход
 @PropertyID = 2,   @UrgencyID = 1,   
 @OrderStatusID = 1,   @OrderTemplateAuthorID = NULL,   @OrderTemplateAuthorExID = NULL,
 @OrderParametersSource = 1,@OrderWorkersAmount = 1,   @OrderGroupID = -1,   
 @OrderGroupExID = NULL,   @DepartmentId = NULL,   
 @DepartmentExID = NULL; set @OrderGUID = null;
select @ErrorMessage,'2_2'

EXEC	@return_value = [dbo].[ORD_SetOrderTemplateConnection]
		@ErrorMessage = @ErrorMessage OUTPUT,
		@ParentOrderGUID = NULL,
		@ParentOrderExID = N'PS1',
		@ChildOrderGUID = NULL,
		@ChildOrderExID = N'PS1_2', --
		@ConnectionActiveFlag = 1,
		@Sort = 2 --


--3 Трамбовка
set @OrderGUID = null
EXEC @return_value = [dbo].[ORD_SetOrderTemplate]  
 @ErrorMessage = @ErrorMessage OUTPUT,   @OrderGUID = @OrderGUID OUTPUT,   
 @OrderActiveFlag = 1,   
 @OrderExID = N'PS1_3',   @OrderName = N'Трамбовка',   @OrderComment = N'Трамбовка',   @OrderPlanDuration = 60,   
 @OrderPlanStartDate = N'2021-09-07 00:00',   @OrderPlanFinishDate = N'2031-09-07 00:00',
 @OrderTypeID = 3,   -- Смешанный
 @ComplexityID = 1,  -- Обход
 @PropertyID = 2,   @UrgencyID = 1,   
 @OrderStatusID = 1,   @OrderTemplateAuthorID = NULL,   @OrderTemplateAuthorExID = NULL,
 @OrderParametersSource = 1,@OrderWorkersAmount = 1,   @OrderGroupID = -1,   
 @OrderGroupExID = NULL,   @DepartmentId = NULL,   
 @DepartmentExID = NULL; set @OrderGUID = null;
select @ErrorMessage,'2_3'

EXEC	@return_value = [dbo].[ORD_SetOrderTemplateConnection]
		@ErrorMessage = @ErrorMessage OUTPUT,
		@ParentOrderGUID = NULL,
		@ParentOrderExID = N'PS1',
		@ChildOrderGUID = NULL,
		@ChildOrderExID = N'PS1_3', --
		@ConnectionActiveFlag = 1,
		@Sort = 3 --

--4 Узел реза
set @OrderGUID = null
EXEC @return_value = [dbo].[ORD_SetOrderTemplate]  
 @ErrorMessage = @ErrorMessage OUTPUT,   @OrderGUID = @OrderGUID OUTPUT,   
 @OrderActiveFlag = 1,   
 @OrderExID = N'PS1_4',   @OrderName = N'Узел реза',   @OrderComment = N'Узел реза',   @OrderPlanDuration = 60,   
 @OrderPlanStartDate = N'2021-09-07 00:00',   @OrderPlanFinishDate = N'2031-09-07 00:00',
 @OrderTypeID = 3,   -- Смешанный
 @ComplexityID = 1,  -- Обход
 @PropertyID = 2,   @UrgencyID = 1,   
 @OrderStatusID = 1,   @OrderTemplateAuthorID = NULL,   @OrderTemplateAuthorExID = NULL,
 @OrderParametersSource = 1,@OrderWorkersAmount = 1,   @OrderGroupID = -1,   
 @OrderGroupExID = NULL,   @DepartmentId = NULL,   
 @DepartmentExID = NULL; set @OrderGUID = null;
select @ErrorMessage,'2_4'

EXEC	@return_value = [dbo].[ORD_SetOrderTemplateConnection]
		@ErrorMessage = @ErrorMessage OUTPUT,
		@ParentOrderGUID = NULL,
		@ParentOrderExID = N'PS1',
		@ChildOrderGUID = NULL,
		@ChildOrderExID = N'PS1_4', --
		@ConnectionActiveFlag = 1,
		@Sort = 4 --

--5 Система гидравлики
set @OrderGUID = null
EXEC @return_value = [dbo].[ORD_SetOrderTemplate]  
 @ErrorMessage = @ErrorMessage OUTPUT,   @OrderGUID = @OrderGUID OUTPUT,   
 @OrderActiveFlag = 1,   
 @OrderExID = N'PS1_5',   @OrderName = N'Система гидравлики',   @OrderComment = N'Система гидравлики',   @OrderPlanDuration = 60,   
 @OrderPlanStartDate = N'2021-09-07 00:00',   @OrderPlanFinishDate = N'2031-09-07 00:00',
 @OrderTypeID = 3,   -- Смешанный
 @ComplexityID = 1,  -- Обход
 @PropertyID = 2,   @UrgencyID = 1,   
 @OrderStatusID = 1,   @OrderTemplateAuthorID = NULL,   @OrderTemplateAuthorExID = NULL,
 @OrderParametersSource = 1,@OrderWorkersAmount = 1,   @OrderGroupID = -1,   
 @OrderGroupExID = NULL,   @DepartmentId = NULL,   
 @DepartmentExID = NULL; set @OrderGUID = null;
select @ErrorMessage,'2_5'

EXEC	@return_value = [dbo].[ORD_SetOrderTemplateConnection]
		@ErrorMessage = @ErrorMessage OUTPUT,
		@ParentOrderGUID = NULL,
		@ParentOrderExID = N'PS1',
		@ChildOrderGUID = NULL,
		@ChildOrderExID = N'PS1_5', --
		@ConnectionActiveFlag = 1,
		@Sort = 5 --

--6 Система электрики
set @OrderGUID = null
EXEC @return_value = [dbo].[ORD_SetOrderTemplate]  
 @ErrorMessage = @ErrorMessage OUTPUT,   @OrderGUID = @OrderGUID OUTPUT,   
 @OrderActiveFlag = 1,   
 @OrderExID = N'PS1_6',   @OrderName = N'Система электрики',   @OrderComment = N'Система электрики',   @OrderPlanDuration = 60,   
 @OrderPlanStartDate = N'2021-09-07 00:00',   @OrderPlanFinishDate = N'2031-09-07 00:00',
 @OrderTypeID = 3,   -- Смешанный
 @ComplexityID = 1,  -- Обход
 @PropertyID = 2,   @UrgencyID = 1,   
 @OrderStatusID = 1,   @OrderTemplateAuthorID = NULL,   @OrderTemplateAuthorExID = NULL,
 @OrderParametersSource = 1,@OrderWorkersAmount = 1,   @OrderGroupID = -1,   
 @OrderGroupExID = NULL,   @DepartmentId = NULL,   
 @DepartmentExID = NULL; set @OrderGUID = null;
select @ErrorMessage,'2_6'

EXEC	@return_value = [dbo].[ORD_SetOrderTemplateConnection]
		@ErrorMessage = @ErrorMessage OUTPUT,
		@ParentOrderGUID = NULL,
		@ParentOrderExID = N'PS1',
		@ChildOrderGUID = NULL,
		@ChildOrderExID = N'PS1_6', --
		@ConnectionActiveFlag = 1,
		@Sort = 6 --


select * from ORD_OrderTemplates
select * from ORD_OrderTemplatesConnections
select * from ORD_OrderTemplatesPGroups
select * from ORD_OrderTemplatesParameters
--------------------------------------------------------------------------------
--
--------------------------------------------------------------------------------


--commit
rollback