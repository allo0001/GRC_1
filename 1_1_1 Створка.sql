use SUMS_GRC

declare @ErrorMessage nvarchar(max)
declare @return_value int 
declare @PGroupID int
declare @ParameterID int
declare @ParameterValueGUID uniqueidentifier

declare @PGroupExID nvarchar(255)
declare @PGroupName nvarchar(255)

declare @sort int

declare @ParameterName nvarchar(255)
declare @ParameterExID nvarchar(255)

declare @OrderExID nvarchar(255)


begin tran
-----------------------------------------------------------------------------------------------------
--Проверки
-----------------------------------------------------------------------------------------------------
Select * from PAR_PGroups

Select * from PAR_Parameters

select * from PAR_ParametersPGroups
-----------------------------------------------------------------------------------------------------
-- Заявка

set @OrderExID =  N'PS1_1'
-----------------------------------------------------------------------------------------------------
-- Группы параметров
	--параметры в группу
-----------------------------------------------------------------------------------------------------
-- 1_1_1 Створка
-----------------------------------------------------------------------------------------------------
set @PGroupName = N'Створка'

select  @PGroupExID = PGroupExID from PAR_PGroups where PGroupName = @PGroupName

if @PGroupExID is null
begin
	set @PGroupExID = N'PS1_1_1'
	set @PGroupID = null
	set @sort = 1

	EXEC @return_value = [dbo].[PAR_SetPGroup]		
	@ErrorMessage = @ErrorMessage OUTPUT,   @PGroupID = @PGroupID OUTPUT,
		@PGroupActiveFlag = 1,   @PGroupSort = @sort,
		@PGroupExID = @PGroupExID, 
		@PGroupName = @PGroupName;   
end

set @sort = 1
EXEC @return_value = [dbo].[ORD_SetOrderTemplatePGroup]
   @ErrorMessage = @ErrorMessage OUTPUT,   
   @OrderGUID = NULL,   @OrderExID = @OrderExID,   --!!!
   @PGroupID = NULL,   @PGroupExID = @PGroupExID, --!!! 
   @PGroupSort = @sort,    --!!!
   @OperationActiveFlag = 1

-----------------------------------------------------------------------------------------------------
--Параметры 1_1_1
-----------------------------------------------------------------------------------------------------
--1_1_1_1
set @ParameterName = N'Трещины'
set @sort = 1 

select @ParameterExID=ParameterExID from PAR_Parameters where ParameterName = @ParameterName

if @ParameterExID is null
begin
    set @ParameterExID = N'PS1_1_1_1'
	set @ParameterID = null;

	EXEC @return_value = [dbo].[PAR_SetParameter]
	    @ErrorMessage = @ErrorMessage OUTPUT,   @ParameterID = @ParameterID OUTPUT,
	    @ParameterActiveFlag = 1,   
		@ParameterSort = @sort,   --!!!!!
		@ParameterExID =@ParameterExID,    --!!!!!
		@ParameterName = @ParameterName,       --!!!!!
		@ParameterShortName = @ParameterName,  --!!!!!
		@ParTypeID = 1,   @UnitID = NULL,   @Required = 0,   @NormaMIN = NULL,   @NormaMAX = NULL,   @AllowedMIN = NULL,     @AllowedMAX = NULL,   @AlarmMIN = NULL,   @AlarmMAX = NULL,   @ForceAction = NULL,   @UnitExID = N'N/A';
		
		--Значения
		set @ParameterValueGUID = null;
		EXEC @return_value = [dbo].[PAR_SetParametersValue]
		    @ErrorMessage = @ErrorMessage OUTPUT,   @ParameterValueGUID = @ParameterValueGUID OUTPUT,     
			@ParameterValueExID = N'1',   @ParameterID = NULL,       
			@ParameterExID = @ParameterExID,   --!!!!!
			@ParameterValueStr = N'Норма',     
			@ParameterValueDecimal = 1,   @ParameterValueSort = 1,   @ActiveFlag = 1;
			
		set @ParameterValueGUID = null;	  
		EXEC @return_value = [dbo].[PAR_SetParametersValue]
		    @ErrorMessage = @ErrorMessage OUTPUT,   @ParameterValueGUID = @ParameterValueGUID OUTPUT,    
			@ParameterValueExID = N'2',   @ParameterID = NULL,     
			@ParameterExID = @ParameterExID,   --!!!!!
			@ParameterValueStr = N'Отклонение',      
			@ParameterValueDecimal = 2,   @ParameterValueSort = 2,   @ActiveFlag = 1;
		
		-- парамер в группу
		EXEC @return_value = [dbo].[PAR_SetParameterPGroup]
		     @ErrorMessage = @ErrorMessage OUTPUT,      
			 @ParameterID = NULL,   @PGroupID = NULL,      
			 @ParameterExID = @ParameterExID,   --!!!!!
			 @PGroupExID = @PGroupExID,        --!!!!!
			 @DefaultLink = 1,   @LinkActiveFlag = 1;
end
else
begin
	EXEC @return_value = [dbo].[PAR_SetParameterPGroup]
		     @ErrorMessage = @ErrorMessage OUTPUT,      
			 @ParameterID = NULL,   @PGroupID = NULL,      
			 @ParameterExID = @ParameterExID,   --!!!!!
			 @PGroupExID = @PGroupExID,        --!!!!!
			 @DefaultLink = 1,   @LinkActiveFlag = 1;
end

EXEC @return_value = [dbo].[ORD_SetOrderTemplatesParameter]
	@ErrorMessage = @ErrorMessage OUTPUT, 
	@OrderGUID = NULL, @ParameterID = NULL,  @ParameterRequired = 1, @ParameterActiveFlag = 1, @PGroupID = NULL, @PGroupExID = NULL,
	@OrderExID = @OrderExID,
	@ParameterExID = @ParameterExID,
	@ParameterSort = @sort

-----------------------------------------------------------------------------------------------------
--1_1_1_2
set @ParameterName = N'Износ верхней кромки'
set @sort = 2 

if @ParameterExID is null
begin
    set @ParameterExID = N'PS1_1_1_2'
	set @ParameterID = null;

	EXEC @return_value = [dbo].[PAR_SetParameter]
	    @ErrorMessage = @ErrorMessage OUTPUT,   @ParameterID = @ParameterID OUTPUT,
	    @ParameterActiveFlag = 1,   
		@ParameterSort = @sort,   --!!!!!
		@ParameterExID =@ParameterExID,    --!!!!!
		@ParameterName = @ParameterName,       --!!!!!
		@ParameterShortName = @ParameterName,  --!!!!!
		@ParTypeID = 1,   @UnitID = NULL,   @Required = 0,   @NormaMIN = NULL,   @NormaMAX = NULL,   @AllowedMIN = NULL,     @AllowedMAX = NULL,   @AlarmMIN = NULL,   @AlarmMAX = NULL,   @ForceAction = NULL,   @UnitExID = N'N/A';
		
		--Значения
		set @ParameterValueGUID = null;
		EXEC @return_value = [dbo].[PAR_SetParametersValue]
		    @ErrorMessage = @ErrorMessage OUTPUT,   @ParameterValueGUID = @ParameterValueGUID OUTPUT,     
			@ParameterValueExID = N'1',   @ParameterID = NULL,       
			@ParameterExID = @ParameterExID,   --!!!!!
			@ParameterValueStr = N'Норма',     
			@ParameterValueDecimal = 1,   @ParameterValueSort = 1,   @ActiveFlag = 1;
			
		set @ParameterValueGUID = null;	  
		EXEC @return_value = [dbo].[PAR_SetParametersValue]
		    @ErrorMessage = @ErrorMessage OUTPUT,   @ParameterValueGUID = @ParameterValueGUID OUTPUT,    
			@ParameterValueExID = N'2',   @ParameterID = NULL,     
			@ParameterExID = @ParameterExID,   --!!!!!
			@ParameterValueStr = N'Отклонение',      
			@ParameterValueDecimal = 2,   @ParameterValueSort = 2,   @ActiveFlag = 1;
		
		-- парамер в группу
		EXEC @return_value = [dbo].[PAR_SetParameterPGroup]
		     @ErrorMessage = @ErrorMessage OUTPUT,      
			 @ParameterID = NULL,   @PGroupID = NULL,      
			 @ParameterExID = @ParameterExID,   --!!!!!
			 @PGroupExID = @PGroupExID,        --!!!!!
			 @DefaultLink = 1,   @LinkActiveFlag = 1;
end
else
begin
	EXEC @return_value = [dbo].[PAR_SetParameterPGroup]
		     @ErrorMessage = @ErrorMessage OUTPUT,      
			 @ParameterID = NULL,   @PGroupID = NULL,      
			 @ParameterExID = @ParameterExID,   --!!!!!
			 @PGroupExID = @PGroupExID,        --!!!!!
			 @DefaultLink = 1,   @LinkActiveFlag = 1;
end

EXEC @return_value = [dbo].[ORD_SetOrderTemplatesParameter]
	@ErrorMessage = @ErrorMessage OUTPUT, 
	@OrderGUID = NULL, @ParameterID = NULL,  @ParameterRequired = 1, @ParameterActiveFlag = 1, @PGroupID = NULL, @PGroupExID = NULL,
	@OrderExID = @OrderExID,
	@ParameterExID = @ParameterExID,
	@ParameterSort = @sort
  
-----------------------------------------------------------------------------------------------------  
--1_1_1_3
set @ParameterName =N'Вмятины'
set @sort = 3 

if @ParameterExID is null
begin
    set @ParameterExID = N'PS1_1_1_3'
	set @ParameterID = null;

	EXEC @return_value = [dbo].[PAR_SetParameter]
	    @ErrorMessage = @ErrorMessage OUTPUT,   @ParameterID = @ParameterID OUTPUT,
	    @ParameterActiveFlag = 1,   
		@ParameterSort = @sort,   --!!!!!
		@ParameterExID =@ParameterExID,    --!!!!!
		@ParameterName = @ParameterName,       --!!!!!
		@ParameterShortName = @ParameterName,  --!!!!!
		@ParTypeID = 1,   @UnitID = NULL,   @Required = 0,   @NormaMIN = NULL,   @NormaMAX = NULL,   @AllowedMIN = NULL,     @AllowedMAX = NULL,   @AlarmMIN = NULL,   @AlarmMAX = NULL,   @ForceAction = NULL,   @UnitExID = N'N/A';
		
		--Значения
		set @ParameterValueGUID = null;
		EXEC @return_value = [dbo].[PAR_SetParametersValue]
		    @ErrorMessage = @ErrorMessage OUTPUT,   @ParameterValueGUID = @ParameterValueGUID OUTPUT,     
			@ParameterValueExID = N'1',   @ParameterID = NULL,       
			@ParameterExID = @ParameterExID,   --!!!!!
			@ParameterValueStr = N'Норма',     
			@ParameterValueDecimal = 1,   @ParameterValueSort = 1,   @ActiveFlag = 1;
			
		set @ParameterValueGUID = null;	  
		EXEC @return_value = [dbo].[PAR_SetParametersValue]
		    @ErrorMessage = @ErrorMessage OUTPUT,   @ParameterValueGUID = @ParameterValueGUID OUTPUT,    
			@ParameterValueExID = N'2',   @ParameterID = NULL,     
			@ParameterExID = @ParameterExID,   --!!!!!
			@ParameterValueStr = N'Отклонение',      
			@ParameterValueDecimal = 2,   @ParameterValueSort = 2,   @ActiveFlag = 1;
		
		-- парамер в группу
		EXEC @return_value = [dbo].[PAR_SetParameterPGroup]
		     @ErrorMessage = @ErrorMessage OUTPUT,      
			 @ParameterID = NULL,   @PGroupID = NULL,      
			 @ParameterExID = @ParameterExID,   --!!!!!
			 @PGroupExID = @PGroupExID,        --!!!!!
			 @DefaultLink = 1,   @LinkActiveFlag = 1;
end
else
begin
	EXEC @return_value = [dbo].[PAR_SetParameterPGroup]
		     @ErrorMessage = @ErrorMessage OUTPUT,      
			 @ParameterID = NULL,   @PGroupID = NULL,      
			 @ParameterExID = @ParameterExID,   --!!!!!
			 @PGroupExID = @PGroupExID,        --!!!!!
			 @DefaultLink = 1,   @LinkActiveFlag = 1;
end

EXEC @return_value = [dbo].[ORD_SetOrderTemplatesParameter]
	@ErrorMessage = @ErrorMessage OUTPUT, 
	@OrderGUID = NULL, @ParameterID = NULL,  @ParameterRequired = 1, @ParameterActiveFlag = 1, @PGroupID = NULL, @PGroupExID = NULL,
	@OrderExID = @OrderExID,
	@ParameterExID = @ParameterExID,
	@ParameterSort = @sort
  
-----------------------------------------------------------------------------------------------------  
--1_1_1_4
set @ParameterName = N'Потеря геометрии'
set @sort = 4 

if @ParameterExID is null
begin
    set @ParameterExID = N'PS1_1_1_5'
	set @ParameterID = null;

	EXEC @return_value = [dbo].[PAR_SetParameter]
	    @ErrorMessage = @ErrorMessage OUTPUT,   @ParameterID = @ParameterID OUTPUT,
	    @ParameterActiveFlag = 1,   
		@ParameterSort = @sort,   --!!!!!
		@ParameterExID =@ParameterExID,    --!!!!!
		@ParameterName = @ParameterName,       --!!!!!
		@ParameterShortName = @ParameterName,  --!!!!!
		@ParTypeID = 1,   @UnitID = NULL,   @Required = 0,   @NormaMIN = NULL,   @NormaMAX = NULL,   @AllowedMIN = NULL,     @AllowedMAX = NULL,   @AlarmMIN = NULL,   @AlarmMAX = NULL,   @ForceAction = NULL,   @UnitExID = N'N/A';
		
		--Значения
		set @ParameterValueGUID = null;
		EXEC @return_value = [dbo].[PAR_SetParametersValue]
		    @ErrorMessage = @ErrorMessage OUTPUT,   @ParameterValueGUID = @ParameterValueGUID OUTPUT,     
			@ParameterValueExID = N'1',   @ParameterID = NULL,       
			@ParameterExID = @ParameterExID,   --!!!!!
			@ParameterValueStr = N'Норма',     
			@ParameterValueDecimal = 1,   @ParameterValueSort = 1,   @ActiveFlag = 1;
			
		set @ParameterValueGUID = null;	  
		EXEC @return_value = [dbo].[PAR_SetParametersValue]
		    @ErrorMessage = @ErrorMessage OUTPUT,   @ParameterValueGUID = @ParameterValueGUID OUTPUT,    
			@ParameterValueExID = N'2',   @ParameterID = NULL,     
			@ParameterExID = @ParameterExID,   --!!!!!
			@ParameterValueStr = N'Отклонение',      
			@ParameterValueDecimal = 2,   @ParameterValueSort = 2,   @ActiveFlag = 1;
		
		-- парамер в группу
		EXEC @return_value = [dbo].[PAR_SetParameterPGroup]
		     @ErrorMessage = @ErrorMessage OUTPUT,      
			 @ParameterID = NULL,   @PGroupID = NULL,      
			 @ParameterExID = @ParameterExID,   --!!!!!
			 @PGroupExID = @PGroupExID,        --!!!!!
			 @DefaultLink = 1,   @LinkActiveFlag = 1;
end
else
begin
	EXEC @return_value = [dbo].[PAR_SetParameterPGroup]
		     @ErrorMessage = @ErrorMessage OUTPUT,      
			 @ParameterID = NULL,   @PGroupID = NULL,      
			 @ParameterExID = @ParameterExID,   --!!!!!
			 @PGroupExID = @PGroupExID,        --!!!!!
			 @DefaultLink = 1,   @LinkActiveFlag = 1;
end

EXEC @return_value = [dbo].[ORD_SetOrderTemplatesParameter]
	@ErrorMessage = @ErrorMessage OUTPUT, 
	@OrderGUID = NULL, @ParameterID = NULL,  @ParameterRequired = 1, @ParameterActiveFlag = 1, @PGroupID = NULL, @PGroupExID = NULL,
	@OrderExID = @OrderExID,
	@ParameterExID = @ParameterExID,
	@ParameterSort = @sort
----------------------------------------------------------------------------------------------------- 
--1_1_1_5
set @ParameterName = N'Петли износ'
set @sort = 5 

if @ParameterExID is null
begin
    set @ParameterExID = N'PS1_1_1_6'
	set @ParameterID = null;

	EXEC @return_value = [dbo].[PAR_SetParameter]
	    @ErrorMessage = @ErrorMessage OUTPUT,   @ParameterID = @ParameterID OUTPUT,
	    @ParameterActiveFlag = 1,   
		@ParameterSort = @sort,   --!!!!!
		@ParameterExID =@ParameterExID,    --!!!!!
		@ParameterName = @ParameterName,       --!!!!!
		@ParameterShortName = @ParameterName,  --!!!!!
		@ParTypeID = 1,   @UnitID = NULL,   @Required = 0,   @NormaMIN = NULL,   @NormaMAX = NULL,   @AllowedMIN = NULL,     @AllowedMAX = NULL,   @AlarmMIN = NULL,   @AlarmMAX = NULL,   @ForceAction = NULL,   @UnitExID = N'N/A';
		
		--Значения
		set @ParameterValueGUID = null;
		EXEC @return_value = [dbo].[PAR_SetParametersValue]
		    @ErrorMessage = @ErrorMessage OUTPUT,   @ParameterValueGUID = @ParameterValueGUID OUTPUT,     
			@ParameterValueExID = N'1',   @ParameterID = NULL,       
			@ParameterExID = @ParameterExID,   --!!!!!
			@ParameterValueStr = N'Норма',     
			@ParameterValueDecimal = 1,   @ParameterValueSort = 1,   @ActiveFlag = 1;
			
		set @ParameterValueGUID = null;	  
		EXEC @return_value = [dbo].[PAR_SetParametersValue]
		    @ErrorMessage = @ErrorMessage OUTPUT,   @ParameterValueGUID = @ParameterValueGUID OUTPUT,    
			@ParameterValueExID = N'2',   @ParameterID = NULL,     
			@ParameterExID = @ParameterExID,   --!!!!!
			@ParameterValueStr = N'Отклонение',      
			@ParameterValueDecimal = 2,   @ParameterValueSort = 2,   @ActiveFlag = 1;
		
		-- парамер в группу
		EXEC @return_value = [dbo].[PAR_SetParameterPGroup]
		     @ErrorMessage = @ErrorMessage OUTPUT,      
			 @ParameterID = NULL,   @PGroupID = NULL,      
			 @ParameterExID = @ParameterExID,   --!!!!!
			 @PGroupExID = @PGroupExID,        --!!!!!
			 @DefaultLink = 1,   @LinkActiveFlag = 1;
end
else
begin
	EXEC @return_value = [dbo].[PAR_SetParameterPGroup]
		     @ErrorMessage = @ErrorMessage OUTPUT,      
			 @ParameterID = NULL,   @PGroupID = NULL,      
			 @ParameterExID = @ParameterExID,   --!!!!!
			 @PGroupExID = @PGroupExID,        --!!!!!
			 @DefaultLink = 1,   @LinkActiveFlag = 1;
end

EXEC @return_value = [dbo].[ORD_SetOrderTemplatesParameter]
	@ErrorMessage = @ErrorMessage OUTPUT, 
	@OrderGUID = NULL, @ParameterID = NULL,  @ParameterRequired = 1, @ParameterActiveFlag = 1, @PGroupID = NULL, @PGroupExID = NULL,
	@OrderExID = @OrderExID,
	@ParameterExID = @ParameterExID,
	@ParameterSort = @sort
  
----------------------------------------------------------------------------------------------------- 
--1_1_1_6
	--1_1_1_6_1
set @ParameterName = N'Зазоры у толкателя'
set @sort = 6

if @ParameterExID is null
begin
    set @ParameterExID = N'PS1_1_1_6_1'
	set @ParameterID = null;

	EXEC @return_value = [dbo].[PAR_SetParameter]
	    @ErrorMessage = @ErrorMessage OUTPUT,   @ParameterID = @ParameterID OUTPUT,
	    @ParameterActiveFlag = 1,   
		@ParameterSort = @sort,   --!!!!!
		@ParameterExID =@ParameterExID,    --!!!!!
		@ParameterName = @ParameterName,       --!!!!!
		@ParameterShortName = @ParameterName,  --!!!!!
		@ParTypeID = 2,   -- Числовой параметр
		@UnitID = NULL,   @Required = 0,   @NormaMIN = NULL,   @NormaMAX = NULL,   @AllowedMIN = NULL,     @AllowedMAX = NULL,   @AlarmMIN = NULL,   @AlarmMAX = NULL,   @ForceAction = NULL,   
		@UnitExID = N'121'; --мм

		-- парамер в группу
		EXEC @return_value = [dbo].[PAR_SetParameterPGroup]
		     @ErrorMessage = @ErrorMessage OUTPUT,      
			 @ParameterID = NULL,   @PGroupID = NULL,      
			 @ParameterExID = @ParameterExID,   --!!!!!
			 @PGroupExID = @PGroupExID,        --!!!!!
			 @DefaultLink = 1,   @LinkActiveFlag = 1;
end
else
begin
	EXEC @return_value = [dbo].[PAR_SetParameterPGroup]
		     @ErrorMessage = @ErrorMessage OUTPUT,      
			 @ParameterID = NULL,   @PGroupID = NULL,      
			 @ParameterExID = @ParameterExID,   --!!!!!
			 @PGroupExID = @PGroupExID,        --!!!!!
			 @DefaultLink = 1,   @LinkActiveFlag = 1;
end

EXEC @return_value = [dbo].[ORD_SetOrderTemplatesParameter]
	@ErrorMessage = @ErrorMessage OUTPUT, 
	@OrderGUID = NULL, @ParameterID = NULL,  @ParameterRequired = 1, @ParameterActiveFlag = 1, @PGroupID = NULL, @PGroupExID = NULL,
	@OrderExID = @OrderExID,
	@ParameterExID = @ParameterExID,
	@ParameterSort = @sort

	--1_1_1_6_2
set @ParameterName = N'Зазоры у трамбовки'
set @sort = 7 

if @ParameterExID is null
begin
    set @ParameterExID = N'PS1_1_1_6_2'
	set @ParameterID = null;

	EXEC @return_value = [dbo].[PAR_SetParameter]
	    @ErrorMessage = @ErrorMessage OUTPUT,   @ParameterID = @ParameterID OUTPUT,
	    @ParameterActiveFlag = 1,   
		@ParameterSort = @sort,   --!!!!!
		@ParameterExID =@ParameterExID,    --!!!!!
		@ParameterName = @ParameterName,       --!!!!!
		@ParameterShortName = @ParameterName,  --!!!!!
		@ParTypeID = 2,   -- Числовой параметр
		@UnitID = NULL,   @Required = 0,   @NormaMIN = NULL,   @NormaMAX = NULL,   @AllowedMIN = NULL,     @AllowedMAX = NULL,   @AlarmMIN = NULL,   @AlarmMAX = NULL,   @ForceAction = NULL,   
		@UnitExID = N'121'; --мм

		-- парамер в группу
		EXEC @return_value = [dbo].[PAR_SetParameterPGroup]
		     @ErrorMessage = @ErrorMessage OUTPUT,      
			 @ParameterID = NULL,   @PGroupID = NULL,      
			 @ParameterExID = @ParameterExID,   --!!!!!
			 @PGroupExID = @PGroupExID,        --!!!!!
			 @DefaultLink = 1,   @LinkActiveFlag = 1;
end
else
begin
	EXEC @return_value = [dbo].[PAR_SetParameterPGroup]
		     @ErrorMessage = @ErrorMessage OUTPUT,      
			 @ParameterID = NULL,   @PGroupID = NULL,      
			 @ParameterExID = @ParameterExID,   --!!!!!
			 @PGroupExID = @PGroupExID,        --!!!!!
			 @DefaultLink = 1,   @LinkActiveFlag = 1;
end

 ----------------------------------------------------------------------------------------------------- 
--1_1_1_7
set @ParameterName = N'Прочие дефекты'
set @sort = 8 

if @ParameterExID is null
begin
    set @ParameterExID = N'PS1_1_1_7'
	set @ParameterID = null;

	EXEC @return_value = [dbo].[PAR_SetParameter]
	    @ErrorMessage = @ErrorMessage OUTPUT,   @ParameterID = @ParameterID OUTPUT,
	    @ParameterActiveFlag = 1,   
		@ParameterSort = @sort,   --!!!!!
		@ParameterExID =@ParameterExID,    --!!!!!
		@ParameterName = @ParameterName,       --!!!!!
		@ParameterShortName = @ParameterName,  --!!!!!
		@ParTypeID = 1,   @UnitID = NULL,   @Required = 0,   @NormaMIN = NULL,   @NormaMAX = NULL,   @AllowedMIN = NULL,     @AllowedMAX = NULL,   @AlarmMIN = NULL,   @AlarmMAX = NULL,   @ForceAction = NULL,   @UnitExID = N'N/A';
		
		--Значения
		set @ParameterValueGUID = null;
		EXEC @return_value = [dbo].[PAR_SetParametersValue]
		    @ErrorMessage = @ErrorMessage OUTPUT,   @ParameterValueGUID = @ParameterValueGUID OUTPUT,     
			@ParameterValueExID = N'1',   @ParameterID = NULL,       
			@ParameterExID = @ParameterExID,   --!!!!!
			@ParameterValueStr = N'Норма',     
			@ParameterValueDecimal = 1,   @ParameterValueSort = 1,   @ActiveFlag = 1;
			
		set @ParameterValueGUID = null;	  
		EXEC @return_value = [dbo].[PAR_SetParametersValue]
		    @ErrorMessage = @ErrorMessage OUTPUT,   @ParameterValueGUID = @ParameterValueGUID OUTPUT,    
			@ParameterValueExID = N'2',   @ParameterID = NULL,     
			@ParameterExID = @ParameterExID,   --!!!!!
			@ParameterValueStr = N'Отклонение',      
			@ParameterValueDecimal = 2,   @ParameterValueSort = 2,   @ActiveFlag = 1;
		
		-- парамер в группу
		EXEC @return_value = [dbo].[PAR_SetParameterPGroup]
		     @ErrorMessage = @ErrorMessage OUTPUT,      
			 @ParameterID = NULL,   @PGroupID = NULL,      
			 @ParameterExID = @ParameterExID,   --!!!!!
			 @PGroupExID = @PGroupExID,        --!!!!!
			 @DefaultLink = 1,   @LinkActiveFlag = 1;
end
else
begin
	EXEC @return_value = [dbo].[PAR_SetParameterPGroup]
		     @ErrorMessage = @ErrorMessage OUTPUT,      
			 @ParameterID = NULL,   @PGroupID = NULL,      
			 @ParameterExID = @ParameterExID,   --!!!!!
			 @PGroupExID = @PGroupExID,        --!!!!!
			 @DefaultLink = 1,   @LinkActiveFlag = 1;
end
----------------------------------------------------------------------------------------------------- 
--КОНЕЦ ГРУППЫ ПАРАМЕТРОВ 1_1_1
-----------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------
--Проверки
-----------------------------------------------------------------------------------------------------
Select * from PAR_PGroups

Select * from PAR_Parameters

select * from PAR_ParametersPGroups
-----------------------------------------------------------------------------------------------------


--commit
rollback