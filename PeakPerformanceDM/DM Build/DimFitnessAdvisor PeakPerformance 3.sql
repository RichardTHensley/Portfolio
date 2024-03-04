
SELECT 
	ProjectBase.dbo.PERSONAL_TRAINER.TrainerID AS Advisor_AK, 
	ProjectBase.dbo.PERSONAL_TRAINER.TrainerFirst AS AdvisorFirstName, 
	ProjectBase.dbo.PERSONAL_TRAINER.TrainerLast AS AdvisorLastName, 
	ProjectBase.dbo.PERSONAL_TRAINER.TrainerAge AS AdvisorAge,
	ProjectBase.dbo.PERSONAL_TRAINER.TrainerGender AS AdvisorGender
FROM 
	ProjectBase.dbo.PERSONAL_TRAINER
