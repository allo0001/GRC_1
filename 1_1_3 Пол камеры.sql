use SUMS_GRC

declare @ErrorMessage nvarchar(max)
declare @return_value int 
declare @PGroupID int
declare @ParameterID int
declare @ParameterValueGUID uniqueidentifier

declare @PGroupExID nvarchar(255)
declare @PGroupName nvarchar(255)
declare @tmp_PGroupExID nvarchar(255)

declare @sort int
declare @max int

declare @ParameterName nvarchar(255)
declare @ParameterExID nvarchar(255)
declare @tmp_ParameterExID nvarchar(255)

declare @OrderExID nvarchar(255)


begin tran
-----------------------------------------------------------------------------------------------------
--Проверки
-----------------------------------------------------------------------------------------------------
Select 'PAR_PGroups', * from PAR_PGroups

Select 'PAR_Parameters', * from PAR_Parameters

select 'PAR_ParametersPGroups', * from PAR_ParametersPGroups

select 'ORD_OrderTemplatesConnections' , * from ORD_OrderTemplatesConnections

select 'ORD_OrderTemplatesPGroups', * from ORD_OrderTemplatesPGroups

select 'ORD_OrderTemplatesParameters', * from ORD_OrderTemplatesParameters
-----------------------------------------------------------------------------------------------------
-- Заявка

set @OrderExID =  N'PS1_1'
-----------------------------------------------------------------------------------------------------
-- Группы параметров
	--параметры в группу
-----------------------------------------------------------------------------------------------------
-- 1_1_3 Пол камеры
-----------------------------------------------------------------------------------------------------
set @PGroupName = N'Пол камеры'
set @PGroupExID = N'PS1_1_3'
set @sort = 1

select  @tmp_PGroupExID = PGroupExID from PAR_PGroups where PGroupName = @PGroupName

if @tmp_PGroupExID is null
begin
	set @PGroupID = null

	EXEC @return_value = [dbo].[PAR_SetPGroup]		
	@ErrorMessage = @ErrorMessage OUTPUT,   @PGroupID = @PGroupID OUTPUT,
		@PGroupActiveFlag = 1,   @PGroupSort = @sort,
		@PGroupExID = @PGroupExID, 
		@PGroupName = @PGroupName; 
	
end

EXEC @return_value = [dbo].[ORD_SetOrderTemplatePGroup]
   @ErrorMessage = @ErrorMessage OUTPUT,   
   @OrderGUID = NULL,   @OrderExID = @OrderExID,   
   @PGroupID = NULL,   @PGroupExID = @PGroupExID,  
   @PGroupSort = @sort,    
   @OperationActiveFlag = 1

-----------------------------------------------------------------------------------------------------
--Параметры 1_1_3
-----------------------------------------------------------------------------------------------------
--1_1_3_1
set @ParameterName = N'Трещины'
set @ParameterExID = N'PS1_1_3_1'
set @tmp_ParameterExID = null
set @sort = 1 

select @tmp_ParameterExID=ParameterExID from PAR_Parameters where ParameterName = @ParameterName

if @tmp_ParameterExID is null
begin
    
	set @ParameterID = null;
	EXEC @return_value = [dbo].[PAR_SetParameter]
	    @ErrorMessage = @ErrorMessage OUTPUT,   @ParameterID = @ParameterID OUTPUT,
	    @ParameterActiveFlag = 1,   
		@ParameterSort = @sort,   
		@ParameterExID =@ParameterExID,    
		@ParameterName = @ParameterName,       
		@ParameterShortName = @ParameterName,  
		@ParTypeID = 1,   @UnitID = NULL,   @Required = 0,   @NormaMIN = NULL,   @NormaMAX = NULL,   @AllowedMIN = NULL,     @AllowedMAX = NULL,   @AlarmMIN = NULL,   @AlarmMAX = NULL,   @ForceAction = NULL,   @UnitExID = N'N/A';
		
end
else
begin
	select @max = max(ParameterID)+1 from PAR_Parameters

	insert into PAR_Parameters
	select @max, 1, @sort, @ParameterExID, @ParameterName, @ParameterName,1, 116,0,null,null,null,null,null,null,null,0,60,1,0,0,1

end

--Значения
set @ParameterValueGUID = null;
EXEC @return_value = [dbo].[PAR_SetParametersValue]
    @ErrorMessage = @ErrorMessage OUTPUT,   @ParameterValueGUID = @ParameterValueGUID OUTPUT,     
	@ParameterValueExID = N'1',   @ParameterID = NULL,       
	@ParameterExID = @ParameterExID,   
	@ParameterValueStr = N'Да',     
	@ParameterValueDecimal = 1,   @ParameterValueSort = 1,   @ActiveFlag = 1;
	
set @ParameterValueGUID = null;	  
EXEC @return_value = [dbo].[PAR_SetParametersValue]
    @ErrorMessage = @ErrorMessage OUTPUT,   @ParameterValueGUID = @ParameterValueGUID OUTPUT,    
	@ParameterValueExID = N'2',   @ParameterID = NULL,     
	@ParameterExID = @ParameterExID,   
	@ParameterValueStr = N'Нет',      
	@ParameterValueDecimal = 2,   @ParameterValueSort = 2,   @ActiveFlag = 1;

-- парамер в группу
EXEC @return_value = [dbo].[PAR_SetParameterPGroup]
     @ErrorMessage = @ErrorMessage OUTPUT,      
	 @ParameterID = NULL,   @PGroupID = NULL,      
	 @ParameterExID = @ParameterExID,   
	 @PGroupExID = @PGroupExID,        
	 @DefaultLink = 1,   @LinkActiveFlag = 1;
--параметр в шаблон
EXEC @return_value = [dbo].[ORD_SetOrderTemplatesParameter]
	@ErrorMessage = @ErrorMessage OUTPUT, 
	@OrderGUID = NULL, @ParameterID = NULL,  @ParameterRequired = 1, @ParameterActiveFlag = 1, @PGroupID = NULL, @PGroupExID = NULL,
	@OrderExID = @OrderExID,
	@ParameterExID = @ParameterExID,
	@ParameterSort = @sort

-----------------------------------------------------------------------------------------------------
--1_1_3_2
set @ParameterName = N'Износ верхней кромки'
set @ParameterExID = N'PS1_1_3_2'
set @tmp_ParameterExID = null
set @sort = 2 

select @tmp_ParameterExID=ParameterExID from PAR_Parameters where ParameterName = @ParameterName

if @tmp_ParameterExID is null
begin
    
	set @ParameterID = null;
	EXEC @return_value = [dbo].[PAR_SetParameter]
	    @ErrorMessage = @ErrorMessage OUTPUT,   @ParameterID = @ParameterID OUTPUT,
	    @ParameterActiveFlag = 1,   
		@ParameterSort = @sort,   
		@ParameterExID =@ParameterExID,    
		@ParameterName = @ParameterName,       
		@ParameterShortName = @ParameterName,  
		@ParTypeID = 1,   @UnitID = NULL,   @Required = 0,   @NormaMIN = NULL,   @NormaMAX = NULL,   @AllowedMIN = NULL,     @AllowedMAX = NULL,   @AlarmMIN = NULL,   @AlarmMAX = NULL,   @ForceAction = NULL,   @UnitExID = N'N/A';
		
end
else
begin
	select @max = max(ParameterID)+1 from PAR_Parameters

	insert into PAR_Parameters
	select @max, 1, @sort, @ParameterExID, @ParameterName, @ParameterName,1, 116,0,null,null,null,null,null,null,null,0,60,1,0,0,1

end

--Значения
set @ParameterValueGUID = null;
EXEC @return_value = [dbo].[PAR_SetParametersValue]
    @ErrorMessage = @ErrorMessage OUTPUT,   @ParameterValueGUID = @ParameterValueGUID OUTPUT,     
	@ParameterValueExID = N'1',   @ParameterID = NULL,       
	@ParameterExID = @ParameterExID,   
	@ParameterValueStr = N'Да',     
	@ParameterValueDecimal = 1,   @ParameterValueSort = 1,   @ActiveFlag = 1;
	
set @ParameterValueGUID = null;	  
EXEC @return_value = [dbo].[PAR_SetParametersValue]
    @ErrorMessage = @ErrorMessage OUTPUT,   @ParameterValueGUID = @ParameterValueGUID OUTPUT,    
	@ParameterValueExID = N'2',   @ParameterID = NULL,     
	@ParameterExID = @ParameterExID,   
	@ParameterValueStr = N'Нет',      
	@ParameterValueDecimal = 2,   @ParameterValueSort = 2,   @ActiveFlag = 1;

-- парамер в группу
EXEC @return_value = [dbo].[PAR_SetParameterPGroup]
     @ErrorMessage = @ErrorMessage OUTPUT,      
	 @ParameterID = NULL,   @PGroupID = NULL,      
	 @ParameterExID = @ParameterExID,   
	 @PGroupExID = @PGroupExID,        
	 @DefaultLink = 1,   @LinkActiveFlag = 1;
--параметр в шаблон
EXEC @return_value = [dbo].[ORD_SetOrderTemplatesParameter]
	@ErrorMessage = @ErrorMessage OUTPUT, 
	@OrderGUID = NULL, @ParameterID = NULL,  @ParameterRequired = 1, @ParameterActiveFlag = 1, @PGroupID = NULL, @PGroupExID = NULL,
	@OrderExID = @OrderExID,
	@ParameterExID = @ParameterExID,
	@ParameterSort = @sort
  
-----------------------------------------------------------------------------------------------------  
--1_1_3_3
set @ParameterName =N'Вмятины'
set @ParameterExID = N'PS1_1_3_3'
set @tmp_ParameterExID = null
set @sort = 3 

select @tmp_ParameterExID=ParameterExID from PAR_Parameters where ParameterName = @ParameterName

if @tmp_ParameterExID is null
begin
    
	set @ParameterID = null;
	EXEC @return_value = [dbo].[PAR_SetParameter]
	    @ErrorMessage = @ErrorMessage OUTPUT,   @ParameterID = @ParameterID OUTPUT,
	    @ParameterActiveFlag = 1,   
		@ParameterSort = @sort,   
		@ParameterExID =@ParameterExID,    
		@ParameterName = @ParameterName,       
		@ParameterShortName = @ParameterName,  
		@ParTypeID = 1,   @UnitID = NULL,   @Required = 0,   @NormaMIN = NULL,   @NormaMAX = NULL,   @AllowedMIN = NULL,     @AllowedMAX = NULL,   @AlarmMIN = NULL,   @AlarmMAX = NULL,   @ForceAction = NULL,   @UnitExID = N'N/A';
		
end
else
begin
	select @max = max(ParameterID)+1 from PAR_Parameters

	insert into PAR_Parameters
	select @max, 1, @sort, @ParameterExID, @ParameterName, @ParameterName,1, 116,0,null,null,null,null,null,null,null,0,60,1,0,0,1

end

--Значения
set @ParameterValueGUID = null;
EXEC @return_value = [dbo].[PAR_SetParametersValue]
    @ErrorMessage = @ErrorMessage OUTPUT,   @ParameterValueGUID = @ParameterValueGUID OUTPUT,     
	@ParameterValueExID = N'1',   @ParameterID = NULL,       
	@ParameterExID = @ParameterExID,   
	@ParameterValueStr = N'Да',     
	@ParameterValueDecimal = 1,   @ParameterValueSort = 1,   @ActiveFlag = 1;
	
set @ParameterValueGUID = null;	  
EXEC @return_value = [dbo].[PAR_SetParametersValue]
    @ErrorMessage = @ErrorMessage OUTPUT,   @ParameterValueGUID = @ParameterValueGUID OUTPUT,    
	@ParameterValueExID = N'2',   @ParameterID = NULL,     
	@ParameterExID = @ParameterExID,   
	@ParameterValueStr = N'Нет',      
	@ParameterValueDecimal = 2,   @ParameterValueSort = 2,   @ActiveFlag = 1;

-- парамер в группу
EXEC @return_value = [dbo].[PAR_SetParameterPGroup]
     @ErrorMessage = @ErrorMessage OUTPUT,      
	 @ParameterID = NULL,   @PGroupID = NULL,      
	 @ParameterExID = @ParameterExID,   
	 @PGroupExID = @PGroupExID,        
	 @DefaultLink = 1,   @LinkActiveFlag = 1;
--параметр в шаблон
EXEC @return_value = [dbo].[ORD_SetOrderTemplatesParameter]
	@ErrorMessage = @ErrorMessage OUTPUT, 
	@OrderGUID = NULL, @ParameterID = NULL,  @ParameterRequired = 1, @ParameterActiveFlag = 1, @PGroupID = NULL, @PGroupExID = NULL,
	@OrderExID = @OrderExID,
	@ParameterExID = @ParameterExID,
	@ParameterSort = @sort

-----------------------------------------------------------------------------------------------------  
--1_1_3_4
set @ParameterName = N'Потеря геометрии'
set @ParameterExID = N'PS1_1_3_4'
set @tmp_ParameterExID = null
set @sort = 4 

select @tmp_ParameterExID=ParameterExID from PAR_Parameters where ParameterName = @ParameterName

if @tmp_ParameterExID is null
begin
    
	set @ParameterID = null;
	EXEC @return_value = [dbo].[PAR_SetParameter]
	    @ErrorMessage = @ErrorMessage OUTPUT,   @ParameterID = @ParameterID OUTPUT,
	    @ParameterActiveFlag = 1,   
		@ParameterSort = @sort,   
		@ParameterExID =@ParameterExID,    
		@ParameterName = @ParameterName,       
		@ParameterShortName = @ParameterName,  
		@ParTypeID = 1,   @UnitID = NULL,   @Required = 0,   @NormaMIN = NULL,   @NormaMAX = NULL,   @AllowedMIN = NULL,     @AllowedMAX = NULL,   @AlarmMIN = NULL,   @AlarmMAX = NULL,   @ForceAction = NULL,   @UnitExID = N'N/A';
		
end
else
begin
	select @max = max(ParameterID)+1 from PAR_Parameters

	insert into PAR_Parameters
	select @max, 1, @sort, @ParameterExID, @ParameterName, @ParameterName,1, 116,0,null,null,null,null,null,null,null,0,60,1,0,0,1

end

--Значения
set @ParameterValueGUID = null;
EXEC @return_value = [dbo].[PAR_SetParametersValue]
    @ErrorMessage = @ErrorMessage OUTPUT,   @ParameterValueGUID = @ParameterValueGUID OUTPUT,     
	@ParameterValueExID = N'1',   @ParameterID = NULL,       
	@ParameterExID = @ParameterExID,   
	@ParameterValueStr = N'Да',     
	@ParameterValueDecimal = 1,   @ParameterValueSort = 1,   @ActiveFlag = 1;
	
set @ParameterValueGUID = null;	  
EXEC @return_value = [dbo].[PAR_SetParametersValue]
    @ErrorMessage = @ErrorMessage OUTPUT,   @ParameterValueGUID = @ParameterValueGUID OUTPUT,    
	@ParameterValueExID = N'2',   @ParameterID = NULL,     
	@ParameterExID = @ParameterExID,   
	@ParameterValueStr = N'Нет',      
	@ParameterValueDecimal = 2,   @ParameterValueSort = 2,   @ActiveFlag = 1;

-- парамер в группу
EXEC @return_value = [dbo].[PAR_SetParameterPGroup]
     @ErrorMessage = @ErrorMessage OUTPUT,      
	 @ParameterID = NULL,   @PGroupID = NULL,      
	 @ParameterExID = @ParameterExID,   
	 @PGroupExID = @PGroupExID,        
	 @DefaultLink = 1,   @LinkActiveFlag = 1;
--параметр в шаблон
EXEC @return_value = [dbo].[ORD_SetOrderTemplatesParameter]
	@ErrorMessage = @ErrorMessage OUTPUT, 
	@OrderGUID = NULL, @ParameterID = NULL,  @ParameterRequired = 1, @ParameterActiveFlag = 1, @PGroupID = NULL, @PGroupExID = NULL,
	@OrderExID = @OrderExID,
	@ParameterExID = @ParameterExID,
	@ParameterSort = @sort
----------------------------------------------------------------------------------------------------- 
--1_1_3_5
set @ParameterName = N'Петли износ'
set @ParameterExID = N'PS1_1_3_5'
set @tmp_ParameterExID = null
set @sort = 5 

select @tmp_ParameterExID=ParameterExID from PAR_Parameters where ParameterName = @ParameterName

if @tmp_ParameterExID is null
begin
    
	set @ParameterID = null;
	EXEC @return_value = [dbo].[PAR_SetParameter]
	    @ErrorMessage = @ErrorMessage OUTPUT,   @ParameterID = @ParameterID OUTPUT,
	    @ParameterActiveFlag = 1,   
		@ParameterSort = @sort,   
		@ParameterExID =@ParameterExID,    
		@ParameterName = @ParameterName,       
		@ParameterShortName = @ParameterName,  
		@ParTypeID = 1,   @UnitID = NULL,   @Required = 0,   @NormaMIN = NULL,   @NormaMAX = NULL,   @AllowedMIN = NULL,     @AllowedMAX = NULL,   @AlarmMIN = NULL,   @AlarmMAX = NULL,   @ForceAction = NULL,   @UnitExID = N'N/A';
		
end
else
begin
	select @max = max(ParameterID)+1 from PAR_Parameters

	insert into PAR_Parameters
	select @max, 1, @sort, @ParameterExID, @ParameterName, @ParameterName,1, 116,0,null,null,null,null,null,null,null,0,60,1,0,0,1

end

--Значения
set @ParameterValueGUID = null;
EXEC @return_value = [dbo].[PAR_SetParametersValue]
    @ErrorMessage = @ErrorMessage OUTPUT,   @ParameterValueGUID = @ParameterValueGUID OUTPUT,     
	@ParameterValueExID = N'1',   @ParameterID = NULL,       
	@ParameterExID = @ParameterExID,   
	@ParameterValueStr = N'Да',     
	@ParameterValueDecimal = 1,   @ParameterValueSort = 1,   @ActiveFlag = 1;
	
set @ParameterValueGUID = null;	  
EXEC @return_value = [dbo].[PAR_SetParametersValue]
    @ErrorMessage = @ErrorMessage OUTPUT,   @ParameterValueGUID = @ParameterValueGUID OUTPUT,    
	@ParameterValueExID = N'2',   @ParameterID = NULL,     
	@ParameterExID = @ParameterExID,   
	@ParameterValueStr = N'Нет',      
	@ParameterValueDecimal = 2,   @ParameterValueSort = 2,   @ActiveFlag = 1;

-- парамер в группу
EXEC @return_value = [dbo].[PAR_SetParameterPGroup]
     @ErrorMessage = @ErrorMessage OUTPUT,      
	 @ParameterID = NULL,   @PGroupID = NULL,      
	 @ParameterExID = @ParameterExID,   
	 @PGroupExID = @PGroupExID,        
	 @DefaultLink = 1,   @LinkActiveFlag = 1;
--параметр в шаблон
EXEC @return_value = [dbo].[ORD_SetOrderTemplatesParameter]
	@ErrorMessage = @ErrorMessage OUTPUT, 
	@OrderGUID = NULL, @ParameterID = NULL,  @ParameterRequired = 1, @ParameterActiveFlag = 1, @PGroupID = NULL, @PGroupExID = NULL,
	@OrderExID = @OrderExID,
	@ParameterExID = @ParameterExID,
	@ParameterSort = @sort

----------------------------------------------------------------------------------------------------- 
--1_1_3_6
set @ParameterName = N'Прочие дефекты'
set @ParameterExID = N'PS1_1_3_6'
set @tmp_ParameterExID = null
set @sort = 6

select @tmp_ParameterExID=ParameterExID from PAR_Parameters where ParameterName = @ParameterName

if @tmp_ParameterExID is null
begin
    
	set @ParameterID = null;
	EXEC @return_value = [dbo].[PAR_SetParameter]
	    @ErrorMessage = @ErrorMessage OUTPUT,   @ParameterID = @ParameterID OUTPUT,
	    @ParameterActiveFlag = 1,   
		@ParameterSort = @sort,   
		@ParameterExID =@ParameterExID,    
		@ParameterName = @ParameterName,       
		@ParameterShortName = @ParameterName,  
		@ParTypeID = 1,   @UnitID = NULL,   @Required = 0,   @NormaMIN = NULL,   @NormaMAX = NULL,   @AllowedMIN = NULL,     @AllowedMAX = NULL,   @AlarmMIN = NULL,   @AlarmMAX = NULL,   @ForceAction = NULL,   @UnitExID = N'N/A';
		
end
else
begin
	select @max = max(ParameterID)+1 from PAR_Parameters

	insert into PAR_Parameters
	select @max, 1, @sort, @ParameterExID, @ParameterName, @ParameterName,1, 116,0,null,null,null,null,null,null,null,0,60,1,0,0,1

end

--Значения
set @ParameterValueGUID = null;
EXEC @return_value = [dbo].[PAR_SetParametersValue]
    @ErrorMessage = @ErrorMessage OUTPUT,   @ParameterValueGUID = @ParameterValueGUID OUTPUT,     
	@ParameterValueExID = N'1',   @ParameterID = NULL,       
	@ParameterExID = @ParameterExID,   
	@ParameterValueStr = N'Да',     
	@ParameterValueDecimal = 1,   @ParameterValueSort = 1,   @ActiveFlag = 1;
	
set @ParameterValueGUID = null;	  
EXEC @return_value = [dbo].[PAR_SetParametersValue]
    @ErrorMessage = @ErrorMessage OUTPUT,   @ParameterValueGUID = @ParameterValueGUID OUTPUT,    
	@ParameterValueExID = N'2',   @ParameterID = NULL,     
	@ParameterExID = @ParameterExID,   
	@ParameterValueStr = N'Нет',      
	@ParameterValueDecimal = 2,   @ParameterValueSort = 2,   @ActiveFlag = 1;

-- парамер в группу
EXEC @return_value = [dbo].[PAR_SetParameterPGroup]
     @ErrorMessage = @ErrorMessage OUTPUT,      
	 @ParameterID = NULL,   @PGroupID = NULL,      
	 @ParameterExID = @ParameterExID,   
	 @PGroupExID = @PGroupExID,        
	 @DefaultLink = 1,   @LinkActiveFlag = 1;
--параметр в шаблон
EXEC @return_value = [dbo].[ORD_SetOrderTemplatesParameter]
	@ErrorMessage = @ErrorMessage OUTPUT, 
	@OrderGUID = NULL, @ParameterID = NULL,  @ParameterRequired = 1, @ParameterActiveFlag = 1, @PGroupID = NULL, @PGroupExID = NULL,
	@OrderExID = @OrderExID,
	@ParameterExID = @ParameterExID,
	@ParameterSort = @sort
----------------------------------------------------------------------------------------------------- 
--КОНЕЦ ГРУППЫ ПАРАМЕТРОВ 1_1_3
-----------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------
--Проверки
-----------------------------------------------------------------------------------------------------
Select 'PAR_PGroups', * from PAR_PGroups

Select 'PAR_Parameters', * from PAR_Parameters

select 'PAR_ParametersPGroups', * from PAR_ParametersPGroups

select 'ORD_OrderTemplatesConnections' , * from ORD_OrderTemplatesConnections

select 'ORD_OrderTemplatesPGroups', * from ORD_OrderTemplatesPGroups

select 'ORD_OrderTemplatesParameters', * from ORD_OrderTemplatesParameters
-----------------------------------------------------------------------------------------------------


--commit
rollback