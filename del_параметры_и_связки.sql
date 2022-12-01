declare @ErrorMessage nvarchar(max)
declare @return_value int 
declare @PGroupID int
declare @ParameterID int
declare @ParameterValueGUID uniqueidentifier

begin tran
-----------------------------------------------------------------------------------------------------
--��������
-----------------------------------------------------------------------------------------------------
Select * from PAR_PGroups

Select * from PAR_Parameters

select * from PAR_ParametersPGroups
-----------------------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------------------
-- ������ ����������
	--��������� � ������
-----------------------------------------------------------------------------------------------------
-- 1_1_1 �������
-----------------------------------------------------------------------------------------------------
set @PGroupID = null
EXEC @return_value = [dbo].[PAR_SetPGroup]    
@ErrorMessage = @ErrorMessage OUTPUT,   @PGroupID = @PGroupID OUTPUT,
    @PGroupActiveFlag = 1,   @PGroupSort = 1,
	@PGroupExID = N'PS1_1_1',  --!!!!!
	@PGroupName = N'�������';   --!!!!!

-----------------------------------------------------------------------------------------------------
--��������� 1_1_1
-----------------------------------------------------------------------------------------------------
--1_1_1_1
set @ParameterID = null;
EXEC @return_value = [dbo].[PAR_SetParameter]
    @ErrorMessage = @ErrorMessage OUTPUT,   @ParameterID = @ParameterID OUTPUT,
    @ParameterActiveFlag = 1,   
	@ParameterSort = 1,   --!!!!!
	@ParameterExID = N'PS1_1_1_1',    --!!!!!
	@ParameterName = N'�������',       --!!!!!
	@ParameterShortName = N'�������',  --!!!!!
	@ParTypeID = 1,   @UnitID = NULL,   @Required = 0,   @NormaMIN = NULL,   @NormaMAX = NULL,   @AllowedMIN = NULL,     @AllowedMAX = NULL,   @AlarmMIN = NULL,   @AlarmMAX = NULL,   @ForceAction = NULL,   @UnitExID = N'N/A';
	
	--��������
	set @ParameterValueGUID = null;
	EXEC @return_value = [dbo].[PAR_SetParametersValue]
	    @ErrorMessage = @ErrorMessage OUTPUT,   @ParameterValueGUID = @ParameterValueGUID OUTPUT,     
		@ParameterValueExID = N'1',   @ParameterID = NULL,       
		@ParameterExID = N'PS1_1_1_1',   --!!!!!
		@ParameterValueStr = N'�����',     
		@ParameterValueDecimal = 1,   @ParameterValueSort = 1,   @ActiveFlag = 1;
		
	set @ParameterValueGUID = null;	  
	EXEC @return_value = [dbo].[PAR_SetParametersValue]
	    @ErrorMessage = @ErrorMessage OUTPUT,   @ParameterValueGUID = @ParameterValueGUID OUTPUT,    
		@ParameterValueExID = N'2',   @ParameterID = NULL,     
		@ParameterExID = N'PS1_1_1_1',   --!!!!!
		@ParameterValueStr = N'����������',      
		@ParameterValueDecimal = 2,   @ParameterValueSort = 2,   @ActiveFlag = 1;
	
	-- ������� � ������
	EXEC @return_value = [dbo].[PAR_SetParameterPGroup]
	     @ErrorMessage = @ErrorMessage OUTPUT,      
		 @ParameterID = NULL,   @PGroupID = NULL,      
		 @ParameterExID = N'PS1_1_1_1',   --!!!!!
		 @PGroupExID = N'PS1_1_1',        --!!!!!
		 @DefaultLink = 1,   @LinkActiveFlag = 1;

-----------------------------------------------------------------------------------------------------
--1_1_1_2
set @ParameterID = null;
EXEC @return_value = [dbo].[PAR_SetParameter]
    @ErrorMessage = @ErrorMessage OUTPUT,   @ParameterID = @ParameterID OUTPUT,
    @ParameterActiveFlag = 1,   
	@ParameterSort = 2,   --!!!!!
	@ParameterExID = N'PS1_1_1_2',    --!!!!!
	@ParameterName = N'����� ������� ������',       --!!!!!
	@ParameterShortName = N'����� ������� ������',  --!!!!!
	@ParTypeID = 1,   @UnitID = NULL,   @Required = 0,   @NormaMIN = NULL,   @NormaMAX = NULL,   @AllowedMIN = NULL,     @AllowedMAX = NULL,   @AlarmMIN = NULL,   @AlarmMAX = NULL,   @ForceAction = NULL,   @UnitExID = N'N/A';
	
	--��������
	set @ParameterValueGUID = null;
	EXEC @return_value = [dbo].[PAR_SetParametersValue]
	    @ErrorMessage = @ErrorMessage OUTPUT,   @ParameterValueGUID = @ParameterValueGUID OUTPUT,     
		@ParameterValueExID = N'1',   @ParameterID = NULL,       
		@ParameterExID = N'PS1_1_1_2',   --!!!!!
		@ParameterValueStr = N'�����',     
		@ParameterValueDecimal = 1,   @ParameterValueSort = 1,   @ActiveFlag = 1;
		
	set @ParameterValueGUID = null;	  
	EXEC @return_value = [dbo].[PAR_SetParametersValue]
	    @ErrorMessage = @ErrorMessage OUTPUT,   @ParameterValueGUID = @ParameterValueGUID OUTPUT,    
		@ParameterValueExID = N'2',   @ParameterID = NULL,     
		@ParameterExID = N'PS1_1_1_2',   --!!!!!
		@ParameterValueStr = N'����������',      
		@ParameterValueDecimal = 2,   @ParameterValueSort = 2,   @ActiveFlag = 1;
	
	-- ������� � ������
	EXEC @return_value = [dbo].[PAR_SetParameterPGroup]
	     @ErrorMessage = @ErrorMessage OUTPUT,      
		 @ParameterID = NULL,   @PGroupID = NULL,      
		 @ParameterExID = N'PS1_1_1_2',   --!!!!!
		 @PGroupExID = N'PS1_1_1',        --!!!!!
		 @DefaultLink = 1,   @LinkActiveFlag = 1;
  
-----------------------------------------------------------------------------------------------------  
--1_1_1_3
set @ParameterID = null;
EXEC @return_value = [dbo].[PAR_SetParameter]
    @ErrorMessage = @ErrorMessage OUTPUT,   @ParameterID = @ParameterID OUTPUT,
    @ParameterActiveFlag = 1,   
	@ParameterSort = 3,   --!!!!!
	@ParameterExID = N'PS1_1_1_3',    --!!!!!
	@ParameterName = N'�������',       --!!!!!
	@ParameterShortName = N'�������',  --!!!!!
	@ParTypeID = 1,   @UnitID = NULL,   @Required = 0,   @NormaMIN = NULL,   @NormaMAX = NULL,   @AllowedMIN = NULL,     @AllowedMAX = NULL,   @AlarmMIN = NULL,   @AlarmMAX = NULL,   @ForceAction = NULL,   @UnitExID = N'N/A';
	
	--��������
	set @ParameterValueGUID = null;
	EXEC @return_value = [dbo].[PAR_SetParametersValue]
	    @ErrorMessage = @ErrorMessage OUTPUT,   @ParameterValueGUID = @ParameterValueGUID OUTPUT,     
		@ParameterValueExID = N'1',   @ParameterID = NULL,       
		@ParameterExID = N'PS1_1_1_3',   --!!!!!
		@ParameterValueStr = N'�����',     
		@ParameterValueDecimal = 1,   @ParameterValueSort = 1,   @ActiveFlag = 1;
		
	set @ParameterValueGUID = null;	  
	EXEC @return_value = [dbo].[PAR_SetParametersValue]
	    @ErrorMessage = @ErrorMessage OUTPUT,   @ParameterValueGUID = @ParameterValueGUID OUTPUT,    
		@ParameterValueExID = N'2',   @ParameterID = NULL,     
		@ParameterExID = N'PS1_1_1_3',   --!!!!!
		@ParameterValueStr = N'����������',      
		@ParameterValueDecimal = 2,   @ParameterValueSort = 2,   @ActiveFlag = 1;
	
	-- ������� � ������
	EXEC @return_value = [dbo].[PAR_SetParameterPGroup]
	     @ErrorMessage = @ErrorMessage OUTPUT,      
		 @ParameterID = NULL,   @PGroupID = NULL,      
		 @ParameterExID = N'PS1_1_1_3',   --!!!!!
		 @PGroupExID = N'PS1_1_1',        --!!!!!
		 @DefaultLink = 1,   @LinkActiveFlag = 1;
  
-----------------------------------------------------------------------------------------------------  
--1_1_1_4
set @ParameterID = null;
EXEC @return_value = [dbo].[PAR_SetParameter]
    @ErrorMessage = @ErrorMessage OUTPUT,   @ParameterID = @ParameterID OUTPUT,
    @ParameterActiveFlag = 1,   
	@ParameterSort = 4,   --!!!!!
	@ParameterExID = N'PS1_1_1_4',    --!!!!!
	@ParameterName = N'������ ���������',       --!!!!!
	@ParameterShortName = N'������ ���������',  --!!!!!
	@ParTypeID = 1,   @UnitID = NULL,   @Required = 0,   @NormaMIN = NULL,   @NormaMAX = NULL,   @AllowedMIN = NULL,     @AllowedMAX = NULL,   @AlarmMIN = NULL,   @AlarmMAX = NULL,   @ForceAction = NULL,   @UnitExID = N'N/A';
	
	--��������
	set @ParameterValueGUID = null;
	EXEC @return_value = [dbo].[PAR_SetParametersValue]
	    @ErrorMessage = @ErrorMessage OUTPUT,   @ParameterValueGUID = @ParameterValueGUID OUTPUT,     
		@ParameterValueExID = N'1',   @ParameterID = NULL,       
		@ParameterExID = N'PS1_1_1_4',   --!!!!!
		@ParameterValueStr = N'�����',     
		@ParameterValueDecimal = 1,   @ParameterValueSort = 1,   @ActiveFlag = 1;
		
	set @ParameterValueGUID = null;	  
	EXEC @return_value = [dbo].[PAR_SetParametersValue]
	    @ErrorMessage = @ErrorMessage OUTPUT,   @ParameterValueGUID = @ParameterValueGUID OUTPUT,    
		@ParameterValueExID = N'2',   @ParameterID = NULL,     
		@ParameterExID = N'PS1_1_1_4',   --!!!!!
		@ParameterValueStr = N'����������',      
		@ParameterValueDecimal = 2,   @ParameterValueSort = 2,   @ActiveFlag = 1;
	
	-- ������� � ������
	EXEC @return_value = [dbo].[PAR_SetParameterPGroup]
	     @ErrorMessage = @ErrorMessage OUTPUT,      
		 @ParameterID = NULL,   @PGroupID = NULL,      
		 @ParameterExID = N'PS1_1_1_4',   --!!!!!
		 @PGroupExID = N'PS1_1_1',        --!!!!!
		 @DefaultLink = 1,   @LinkActiveFlag = 1;
  
----------------------------------------------------------------------------------------------------- 
--1_1_1_5
set @ParameterID = null;
EXEC @return_value = [dbo].[PAR_SetParameter]
    @ErrorMessage = @ErrorMessage OUTPUT,   @ParameterID = @ParameterID OUTPUT,
    @ParameterActiveFlag = 1,   
	@ParameterSort = 5,   --!!!!!
	@ParameterExID = N'PS1_1_1_5',    --!!!!!
	@ParameterName = N'����� �����',       --!!!!!
	@ParameterShortName = N'����� �����',  --!!!!!
	@ParTypeID = 1,   @UnitID = NULL,   @Required = 0,   @NormaMIN = NULL,   @NormaMAX = NULL,   @AllowedMIN = NULL,     @AllowedMAX = NULL,   @AlarmMIN = NULL,   @AlarmMAX = NULL,   @ForceAction = NULL,   @UnitExID = N'N/A';
	
	--��������
	set @ParameterValueGUID = null;
	EXEC @return_value = [dbo].[PAR_SetParametersValue]
	    @ErrorMessage = @ErrorMessage OUTPUT,   @ParameterValueGUID = @ParameterValueGUID OUTPUT,     
		@ParameterValueExID = N'1',   @ParameterID = NULL,       
		@ParameterExID = N'PS1_1_1_5',   --!!!!!
		@ParameterValueStr = N'�����',     
		@ParameterValueDecimal = 1,   @ParameterValueSort = 1,   @ActiveFlag = 1;
		
	set @ParameterValueGUID = null;	  
	EXEC @return_value = [dbo].[PAR_SetParametersValue]
	    @ErrorMessage = @ErrorMessage OUTPUT,   @ParameterValueGUID = @ParameterValueGUID OUTPUT,    
		@ParameterValueExID = N'2',   @ParameterID = NULL,     
		@ParameterExID = N'PS1_1_1_5',   --!!!!!
		@ParameterValueStr = N'����������',      
		@ParameterValueDecimal = 2,   @ParameterValueSort = 2,   @ActiveFlag = 1;
	
	-- ������� � ������
	EXEC @return_value = [dbo].[PAR_SetParameterPGroup]
	     @ErrorMessage = @ErrorMessage OUTPUT,      
		 @ParameterID = NULL,   @PGroupID = NULL,      
		 @ParameterExID = N'PS1_1_1_5',   --!!!!!
		 @PGroupExID = N'PS1_1_1',        --!!!!!
		 @DefaultLink = 1,   @LinkActiveFlag = 1;
  
----------------------------------------------------------------------------------------------------- 
--1_1_1_6
	--1_1_1_6_1
set @ParameterID = null;
EXEC @return_value = [dbo].[PAR_SetParameter]
    @ErrorMessage = @ErrorMessage OUTPUT,   @ParameterID = @ParameterID OUTPUT,
    @ParameterActiveFlag = 1,   
	@ParameterSort = 6,   --!!!!!
	@ParameterExID = N'PS1_1_1_6_1',    --!!!!!
	@ParameterName = N'������ � ���������',       --!!!!!
	@ParameterShortName = N'������ � ���������',  --!!!!!
	@ParTypeID = 2,   -- �������� ��������
	@UnitID = NULL,   @Required = 0,   @NormaMIN = NULL,   @NormaMAX = NULL,   @AllowedMIN = NULL,     @AllowedMAX = NULL,   @AlarmMIN = NULL,   @AlarmMAX = NULL,   @ForceAction = NULL,   
	@UnitExID = N'121';  --��
		
	-- ������� � ������
	EXEC @return_value = [dbo].[PAR_SetParameterPGroup]
	     @ErrorMessage = @ErrorMessage OUTPUT,      
		 @ParameterID = NULL,   @PGroupID = NULL,      
		 @ParameterExID = N'PS1_1_1_6_1',   --!!!!!
		 @PGroupExID = N'PS1_1_1',        --!!!!!
		 @DefaultLink = 1,   @LinkActiveFlag = 1;
	--1_1_1_6_2
set @ParameterID = null;
EXEC @return_value = [dbo].[PAR_SetParameter]
    @ErrorMessage = @ErrorMessage OUTPUT,   @ParameterID = @ParameterID OUTPUT,
    @ParameterActiveFlag = 1,   
	@ParameterSort = 6,   --!!!!!
	@ParameterExID = N'PS1_1_1_6_2',    --!!!!!
	@ParameterName = N'������ � ���������',       --!!!!!
	@ParameterShortName = N'������ � ���������',  --!!!!!
	@ParTypeID = 2,   -- �������� ��������
	@UnitID = NULL,   @Required = 0,   @NormaMIN = NULL,   @NormaMAX = NULL,   @AllowedMIN = NULL,     @AllowedMAX = NULL,   @AlarmMIN = NULL,   @AlarmMAX = NULL,   @ForceAction = NULL,   
	@UnitExID = N'121';  --��
		
	-- ������� � ������
	EXEC @return_value = [dbo].[PAR_SetParameterPGroup]
	     @ErrorMessage = @ErrorMessage OUTPUT,      
		 @ParameterID = NULL,   @PGroupID = NULL,      
		 @ParameterExID = N'PS1_1_1_6_2',   --!!!!!
		 @PGroupExID = N'PS1_1_1',        --!!!!!
		 @DefaultLink = 1,   @LinkActiveFlag = 1;

 ----------------------------------------------------------------------------------------------------- 
--1_1_1_7
set @ParameterID = null;
EXEC @return_value = [dbo].[PAR_SetParameter]
    @ErrorMessage = @ErrorMessage OUTPUT,   @ParameterID = @ParameterID OUTPUT,
    @ParameterActiveFlag = 1,   
	@ParameterSort = 7,   --!!!!!
	@ParameterExID = N'PS1_1_1_7',    --!!!!!
	@ParameterName = N'������ �������',       --!!!!!
	@ParameterShortName = N'������ �������',  --!!!!!
	@ParTypeID = 1,   @UnitID = NULL,   @Required = 0,   @NormaMIN = NULL,   @NormaMAX = NULL,   @AllowedMIN = NULL,     @AllowedMAX = NULL,   @AlarmMIN = NULL,   @AlarmMAX = NULL,   @ForceAction = NULL,   @UnitExID = N'N/A';
	
	--��������
	set @ParameterValueGUID = null;
	EXEC @return_value = [dbo].[PAR_SetParametersValue]
	    @ErrorMessage = @ErrorMessage OUTPUT,   @ParameterValueGUID = @ParameterValueGUID OUTPUT,     
		@ParameterValueExID = N'1',   @ParameterID = NULL,       
		@ParameterExID = N'PS1_1_1_7',   --!!!!!
		@ParameterValueStr = N'�����',     
		@ParameterValueDecimal = 1,   @ParameterValueSort = 1,   @ActiveFlag = 1;
		
	set @ParameterValueGUID = null;	  
	EXEC @return_value = [dbo].[PAR_SetParametersValue]
	    @ErrorMessage = @ErrorMessage OUTPUT,   @ParameterValueGUID = @ParameterValueGUID OUTPUT,    
		@ParameterValueExID = N'2',   @ParameterID = NULL,     
		@ParameterExID = N'PS1_1_1_7',   --!!!!!
		@ParameterValueStr = N'����������',      
		@ParameterValueDecimal = 2,   @ParameterValueSort = 2,   @ActiveFlag = 1;
	
	-- ������� � ������
	EXEC @return_value = [dbo].[PAR_SetParameterPGroup]
	     @ErrorMessage = @ErrorMessage OUTPUT,      
		 @ParameterID = NULL,   @PGroupID = NULL,      
		 @ParameterExID = N'PS1_1_1_7',   --!!!!!
		 @PGroupExID = N'PS1_1_1',        --!!!!!
		 @DefaultLink = 1,   @LinkActiveFlag = 1; 
----------------------------------------------------------------------------------------------------- 
--����� ������ ���������� 1_1_1
-----------------------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------------------
-- 1_1_2 �����-������
-----------------------------------------------------------------------------------------------------
set @PGroupID = null
EXEC @return_value = [dbo].[PAR_SetPGroup]    
@ErrorMessage = @ErrorMessage OUTPUT,   @PGroupID = @PGroupID OUTPUT,
    @PGroupActiveFlag = 1,   @PGroupSort = 1,
	@PGroupExID = N'PS1_1_2',  --!!!!!
	@PGroupName = N'�����-������';   --!!!!!

-----------------------------------------------------------------------------------------------------
--��������� 1_1_2
-----------------------------------------------------------------------------------------------------
--1_1_2_1
set @ParameterID = null;
EXEC @return_value = [dbo].[PAR_SetParameter]
    @ErrorMessage = @ErrorMessage OUTPUT,   @ParameterID = @ParameterID OUTPUT,
    @ParameterActiveFlag = 1,   
	@ParameterSort = 1,   --!!!!!
	@ParameterExID = N'PS1_1_2_1',    --!!!!!
	@ParameterName = N'�������',       --!!!!!
	@ParameterShortName = N'�������',  --!!!!!
	@ParTypeID = 1,   @UnitID = NULL,   @Required = 0,   @NormaMIN = NULL,   @NormaMAX = NULL,   @AllowedMIN = NULL,     @AllowedMAX = NULL,   @AlarmMIN = NULL,   @AlarmMAX = NULL,   @ForceAction = NULL,   @UnitExID = N'N/A';
	
	--��������
	set @ParameterValueGUID = null;
	EXEC @return_value = [dbo].[PAR_SetParametersValue]
	    @ErrorMessage = @ErrorMessage OUTPUT,   @ParameterValueGUID = @ParameterValueGUID OUTPUT,     
		@ParameterValueExID = N'1',   @ParameterID = NULL,       
		@ParameterExID = N'PS1_1_2_1',   --!!!!!
		@ParameterValueStr = N'�����',     
		@ParameterValueDecimal = 1,   @ParameterValueSort = 1,   @ActiveFlag = 1;
		
	set @ParameterValueGUID = null;	  
	EXEC @return_value = [dbo].[PAR_SetParametersValue]
	    @ErrorMessage = @ErrorMessage OUTPUT,   @ParameterValueGUID = @ParameterValueGUID OUTPUT,    
		@ParameterValueExID = N'2',   @ParameterID = NULL,     
		@ParameterExID = N'PS1_1_2_1',   --!!!!!
		@ParameterValueStr = N'����������',      
		@ParameterValueDecimal = 2,   @ParameterValueSort = 2,   @ActiveFlag = 1;
	
	-- ������� � ������
	EXEC @return_value = [dbo].[PAR_SetParameterPGroup]
	     @ErrorMessage = @ErrorMessage OUTPUT,      
		 @ParameterID = NULL,   @PGroupID = NULL,      
		 @ParameterExID = N'PS1_1_2_1',   --!!!!!
		 @PGroupExID = N'PS1_1_2',        --!!!!!
		 @DefaultLink = 1,   @LinkActiveFlag = 1;

-----------------------------------------------------------------------------------------------------
--1_1_2_2
set @ParameterID = null;
EXEC @return_value = [dbo].[PAR_SetParameter]
    @ErrorMessage = @ErrorMessage OUTPUT,   @ParameterID = @ParameterID OUTPUT,
    @ParameterActiveFlag = 1,   
	@ParameterSort = 2,   --!!!!!
	@ParameterExID = N'PS1_1_2_2',    --!!!!!
	@ParameterName = N'����� ������� ������',       --!!!!!
	@ParameterShortName = N'����� ������� ������',  --!!!!!
	@ParTypeID = 1,   @UnitID = NULL,   @Required = 0,   @NormaMIN = NULL,   @NormaMAX = NULL,   @AllowedMIN = NULL,     @AllowedMAX = NULL,   @AlarmMIN = NULL,   @AlarmMAX = NULL,   @ForceAction = NULL,   @UnitExID = N'N/A';
	
	--��������
	set @ParameterValueGUID = null;
	EXEC @return_value = [dbo].[PAR_SetParametersValue]
	    @ErrorMessage = @ErrorMessage OUTPUT,   @ParameterValueGUID = @ParameterValueGUID OUTPUT,     
		@ParameterValueExID = N'1',   @ParameterID = NULL,       
		@ParameterExID = N'PS1_1_2_2',   --!!!!!
		@ParameterValueStr = N'�����',     
		@ParameterValueDecimal = 1,   @ParameterValueSort = 1,   @ActiveFlag = 1;
		
	set @ParameterValueGUID = null;	  
	EXEC @return_value = [dbo].[PAR_SetParametersValue]
	    @ErrorMessage = @ErrorMessage OUTPUT,   @ParameterValueGUID = @ParameterValueGUID OUTPUT,    
		@ParameterValueExID = N'2',   @ParameterID = NULL,     
		@ParameterExID = N'PS1_1_2_2',   --!!!!!
		@ParameterValueStr = N'����������',      
		@ParameterValueDecimal = 2,   @ParameterValueSort = 2,   @ActiveFlag = 1;
	
	-- ������� � ������
	EXEC @return_value = [dbo].[PAR_SetParameterPGroup]
	     @ErrorMessage = @ErrorMessage OUTPUT,      
		 @ParameterID = NULL,   @PGroupID = NULL,      
		 @ParameterExID = N'PS1_1_2_2',   --!!!!!
		 @PGroupExID = N'PS1_1_2',        --!!!!!
		 @DefaultLink = 1,   @LinkActiveFlag = 1;
  
-----------------------------------------------------------------------------------------------------  
--1_1_2_3
set @ParameterID = null;
EXEC @return_value = [dbo].[PAR_SetParameter]
    @ErrorMessage = @ErrorMessage OUTPUT,   @ParameterID = @ParameterID OUTPUT,
    @ParameterActiveFlag = 1,   
	@ParameterSort = 3,   --!!!!!
	@ParameterExID = N'PS1_1_2_3',    --!!!!!
	@ParameterName = N'�������',       --!!!!!
	@ParameterShortName = N'�������',  --!!!!!
	@ParTypeID = 1,   @UnitID = NULL,   @Required = 0,   @NormaMIN = NULL,   @NormaMAX = NULL,   @AllowedMIN = NULL,     @AllowedMAX = NULL,   @AlarmMIN = NULL,   @AlarmMAX = NULL,   @ForceAction = NULL,   @UnitExID = N'N/A';
	
	--��������
	set @ParameterValueGUID = null;
	EXEC @return_value = [dbo].[PAR_SetParametersValue]
	    @ErrorMessage = @ErrorMessage OUTPUT,   @ParameterValueGUID = @ParameterValueGUID OUTPUT,     
		@ParameterValueExID = N'1',   @ParameterID = NULL,       
		@ParameterExID = N'PS1_1_2_3',   --!!!!!
		@ParameterValueStr = N'�����',     
		@ParameterValueDecimal = 1,   @ParameterValueSort = 1,   @ActiveFlag = 1;
		
	set @ParameterValueGUID = null;	  
	EXEC @return_value = [dbo].[PAR_SetParametersValue]
	    @ErrorMessage = @ErrorMessage OUTPUT,   @ParameterValueGUID = @ParameterValueGUID OUTPUT,    
		@ParameterValueExID = N'2',   @ParameterID = NULL,     
		@ParameterExID = N'PS1_1_2_3',   --!!!!!
		@ParameterValueStr = N'����������',      
		@ParameterValueDecimal = 2,   @ParameterValueSort = 2,   @ActiveFlag = 1;
	
	-- ������� � ������
	EXEC @return_value = [dbo].[PAR_SetParameterPGroup]
	     @ErrorMessage = @ErrorMessage OUTPUT,      
		 @ParameterID = NULL,   @PGroupID = NULL,      
		 @ParameterExID = N'PS1_1_2_3',   --!!!!!
		 @PGroupExID = N'PS1_1_2',        --!!!!!
		 @DefaultLink = 1,   @LinkActiveFlag = 1;
  
-----------------------------------------------------------------------------------------------------  
--1_1_2_4
set @ParameterID = null;
EXEC @return_value = [dbo].[PAR_SetParameter]
    @ErrorMessage = @ErrorMessage OUTPUT,   @ParameterID = @ParameterID OUTPUT,
    @ParameterActiveFlag = 1,   
	@ParameterSort = 4,   --!!!!!
	@ParameterExID = N'PS1_1_2_4',    --!!!!!
	@ParameterName = N'������ ���������',       --!!!!!
	@ParameterShortName = N'������ ���������',  --!!!!!
	@ParTypeID = 1,   @UnitID = NULL,   @Required = 0,   @NormaMIN = NULL,   @NormaMAX = NULL,   @AllowedMIN = NULL,     @AllowedMAX = NULL,   @AlarmMIN = NULL,   @AlarmMAX = NULL,   @ForceAction = NULL,   @UnitExID = N'N/A';
	
	--��������
	set @ParameterValueGUID = null;
	EXEC @return_value = [dbo].[PAR_SetParametersValue]
	    @ErrorMessage = @ErrorMessage OUTPUT,   @ParameterValueGUID = @ParameterValueGUID OUTPUT,     
		@ParameterValueExID = N'1',   @ParameterID = NULL,       
		@ParameterExID = N'PS1_1_2_4',   --!!!!!
		@ParameterValueStr = N'�����',     
		@ParameterValueDecimal = 1,   @ParameterValueSort = 1,   @ActiveFlag = 1;
		
	set @ParameterValueGUID = null;	  
	EXEC @return_value = [dbo].[PAR_SetParametersValue]
	    @ErrorMessage = @ErrorMessage OUTPUT,   @ParameterValueGUID = @ParameterValueGUID OUTPUT,    
		@ParameterValueExID = N'2',   @ParameterID = NULL,     
		@ParameterExID = N'PS1_1_2_4',   --!!!!!
		@ParameterValueStr = N'����������',      
		@ParameterValueDecimal = 2,   @ParameterValueSort = 2,   @ActiveFlag = 1;
	
	-- ������� � ������
	EXEC @return_value = [dbo].[PAR_SetParameterPGroup]
	     @ErrorMessage = @ErrorMessage OUTPUT,      
		 @ParameterID = NULL,   @PGroupID = NULL,      
		 @ParameterExID = N'PS1_1_2_4',   --!!!!!
		 @PGroupExID = N'PS1_1_2',        --!!!!!
		 @DefaultLink = 1,   @LinkActiveFlag = 1;
  
----------------------------------------------------------------------------------------------------- 
--1_1_2_5
set @ParameterID = null;
EXEC @return_value = [dbo].[PAR_SetParameter]
    @ErrorMessage = @ErrorMessage OUTPUT,   @ParameterID = @ParameterID OUTPUT,
    @ParameterActiveFlag = 1,   
	@ParameterSort = 5,   --!!!!!
	@ParameterExID = N'PS1_1_2_5',    --!!!!!
	@ParameterName = N'����� �����',       --!!!!!
	@ParameterShortName = N'����� �����',  --!!!!!
	@ParTypeID = 1,   @UnitID = NULL,   @Required = 0,   @NormaMIN = NULL,   @NormaMAX = NULL,   @AllowedMIN = NULL,     @AllowedMAX = NULL,   @AlarmMIN = NULL,   @AlarmMAX = NULL,   @ForceAction = NULL,   @UnitExID = N'N/A';
	
	--��������
	set @ParameterValueGUID = null;
	EXEC @return_value = [dbo].[PAR_SetParametersValue]
	    @ErrorMessage = @ErrorMessage OUTPUT,   @ParameterValueGUID = @ParameterValueGUID OUTPUT,     
		@ParameterValueExID = N'1',   @ParameterID = NULL,       
		@ParameterExID = N'PS1_1_2_5',   --!!!!!
		@ParameterValueStr = N'�����',     
		@ParameterValueDecimal = 1,   @ParameterValueSort = 1,   @ActiveFlag = 1;
		
	set @ParameterValueGUID = null;	  
	EXEC @return_value = [dbo].[PAR_SetParametersValue]
	    @ErrorMessage = @ErrorMessage OUTPUT,   @ParameterValueGUID = @ParameterValueGUID OUTPUT,    
		@ParameterValueExID = N'2',   @ParameterID = NULL,     
		@ParameterExID = N'PS1_1_2_5',   --!!!!!
		@ParameterValueStr = N'����������',      
		@ParameterValueDecimal = 2,   @ParameterValueSort = 2,   @ActiveFlag = 1;
	
	-- ������� � ������
	EXEC @return_value = [dbo].[PAR_SetParameterPGroup]
	     @ErrorMessage = @ErrorMessage OUTPUT,      
		 @ParameterID = NULL,   @PGroupID = NULL,      
		 @ParameterExID = N'PS1_1_2_5',   --!!!!!
		 @PGroupExID = N'PS1_1_2',        --!!!!!
		 @DefaultLink = 1,   @LinkActiveFlag = 1;
  
----------------------------------------------------------------------------------------------------- 
--1_1_2_6
	--1_1_2_6_1
set @ParameterID = null;
EXEC @return_value = [dbo].[PAR_SetParameter]
    @ErrorMessage = @ErrorMessage OUTPUT,   @ParameterID = @ParameterID OUTPUT,
    @ParameterActiveFlag = 1,   
	@ParameterSort = 6,   --!!!!!
	@ParameterExID = N'PS1_1_2_6_1',    --!!!!!
	@ParameterName = N'������ � ���������',       --!!!!!
	@ParameterShortName = N'������ � ���������',  --!!!!!
	@ParTypeID = 2,   -- �������� ��������
	@UnitID = NULL,   @Required = 0,   @NormaMIN = NULL,   @NormaMAX = NULL,   @AllowedMIN = NULL,     @AllowedMAX = NULL,   @AlarmMIN = NULL,   @AlarmMAX = NULL,   @ForceAction = NULL,   
	@UnitExID = N'121';  --��
		
	-- ������� � ������
	EXEC @return_value = [dbo].[PAR_SetParameterPGroup]
	     @ErrorMessage = @ErrorMessage OUTPUT,      
		 @ParameterID = NULL,   @PGroupID = NULL,      
		 @ParameterExID = N'PS1_1_2_6_1',   --!!!!!
		 @PGroupExID = N'PS1_1_2',        --!!!!!
		 @DefaultLink = 1,   @LinkActiveFlag = 1;
	--1_1_1_6_2
set @ParameterID = null;
EXEC @return_value = [dbo].[PAR_SetParameter]
    @ErrorMessage = @ErrorMessage OUTPUT,   @ParameterID = @ParameterID OUTPUT,
    @ParameterActiveFlag = 1,   
	@ParameterSort = 6,   --!!!!!
	@ParameterExID = N'PS1_1_2_6_2',    --!!!!!
	@ParameterName = N'������ � ���������',       --!!!!!
	@ParameterShortName = N'������ � ���������',  --!!!!!
	@ParTypeID = 2,   -- �������� ��������
	@UnitID = NULL,   @Required = 0,   @NormaMIN = NULL,   @NormaMAX = NULL,   @AllowedMIN = NULL,     @AllowedMAX = NULL,   @AlarmMIN = NULL,   @AlarmMAX = NULL,   @ForceAction = NULL,   
	@UnitExID = N'121';  --��
		
	-- ������� � ������
	EXEC @return_value = [dbo].[PAR_SetParameterPGroup]
	     @ErrorMessage = @ErrorMessage OUTPUT,      
		 @ParameterID = NULL,   @PGroupID = NULL,      
		 @ParameterExID = N'PS1_1_2_6_2',   --!!!!!
		 @PGroupExID = N'PS1_1_2',        --!!!!!
		 @DefaultLink = 1,   @LinkActiveFlag = 1;

 ----------------------------------------------------------------------------------------------------- 
--1_1_2_7
set @ParameterID = null;
EXEC @return_value = [dbo].[PAR_SetParameter]
    @ErrorMessage = @ErrorMessage OUTPUT,   @ParameterID = @ParameterID OUTPUT,
    @ParameterActiveFlag = 1,   
	@ParameterSort = 7,   --!!!!!
	@ParameterExID = N'PS1_1_2_7',    --!!!!!
	@ParameterName = N'������ �������',       --!!!!!
	@ParameterShortName = N'������ �������',  --!!!!!
	@ParTypeID = 1,   @UnitID = NULL,   @Required = 0,   @NormaMIN = NULL,   @NormaMAX = NULL,   @AllowedMIN = NULL,     @AllowedMAX = NULL,   @AlarmMIN = NULL,   @AlarmMAX = NULL,   @ForceAction = NULL,   @UnitExID = N'N/A';
	
	--��������
	set @ParameterValueGUID = null;
	EXEC @return_value = [dbo].[PAR_SetParametersValue]
	    @ErrorMessage = @ErrorMessage OUTPUT,   @ParameterValueGUID = @ParameterValueGUID OUTPUT,     
		@ParameterValueExID = N'1',   @ParameterID = NULL,       
		@ParameterExID = N'PS1_1_2_7',   --!!!!!
		@ParameterValueStr = N'�����',     
		@ParameterValueDecimal = 1,   @ParameterValueSort = 1,   @ActiveFlag = 1;
		
	set @ParameterValueGUID = null;	  
	EXEC @return_value = [dbo].[PAR_SetParametersValue]
	    @ErrorMessage = @ErrorMessage OUTPUT,   @ParameterValueGUID = @ParameterValueGUID OUTPUT,    
		@ParameterValueExID = N'2',   @ParameterID = NULL,     
		@ParameterExID = N'PS1_1_2_7',   --!!!!!
		@ParameterValueStr = N'����������',      
		@ParameterValueDecimal = 2,   @ParameterValueSort = 2,   @ActiveFlag = 1;
	
	-- ������� � ������
	EXEC @return_value = [dbo].[PAR_SetParameterPGroup]
	     @ErrorMessage = @ErrorMessage OUTPUT,      
		 @ParameterID = NULL,   @PGroupID = NULL,      
		 @ParameterExID = N'PS1_1_2_7',   --!!!!!
		 @PGroupExID = N'PS1_1_2',        --!!!!!
		 @DefaultLink = 1,   @LinkActiveFlag = 1; 
----------------------------------------------------------------------------------------------------- 
--����� ������ ���������� 1_1_2
-----------------------------------------------------------------------------------------------------



-----------------------------------------------------------------------------------------------------
--��������
-----------------------------------------------------------------------------------------------------
Select * from PAR_PGroups

Select * from PAR_Parameters

select * from PAR_ParametersPGroups
-----------------------------------------------------------------------------------------------------

--commit
rollback