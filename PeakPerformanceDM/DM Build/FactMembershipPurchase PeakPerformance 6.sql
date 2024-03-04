SELECT
	ProjectBase.dbo.SIGNUPS.TransactionID, 
	ProjectBase.dbo.SIGNUPS.TransactionFee,
	DPeakPerformanceDM.dbo.DimMember.Member_SK,
	DPeakPerformanceDM.dbo.DimFitnessAdvisor.Advisor_SK,
	DPeakPerformanceDM.dbo.DimMembership.Membership_SK,
	DPeakPerformanceDM.dbo.DimDate.PurchaseDate AS TransactionDate
FROM 
	ProjectBase.dbo.SIGNUPS
INNER JOIN	
	ProjectBase.dbo.MEBERSHIP_TYPE
ON
	ProjectBase.dbo.SIGNUPS.MembershipTypeID = ProjectBase.dbo.MEBERSHIP_TYPE.MembershipTypeID
INNER JOIN
	ProjectBase.dbo.MEMBER
ON
	ProjectBase.dbo.SIGNUPS.MemberID = ProjectBase.dbo.Member.MemberID
INNER JOIN
	ProjectBase.dbo.PERSONAL_TRAINER
ON
	ProjectBase.dbo.Member.TrainerID = ProjectBase.dbo.PERSONAL_TRAINER.TrainerID
INNER JOIN
	DPeakPerformanceDM.dbo.DImDate
ON
	DPeakPerformanceDM.dbo.DimDate.Date = ProjectBase.dbo.SIGNUPS.TransactionDate
INNER JOIN
	DPeakPerformanceDM.dbo.DimMember
ON
	DPeakPerformanceDM.dbo.DimMember.Member_AK = ProjectBase.dbo.MEMBER.MemberID
INNER JOIN
	DPeakPerformanceDM.dbo.DimFitnessAdvisor
ON
	DPeakPerformanceDM.dbo.DimFitnessAdvisor.Advisor_AK = ProjectBase.dbo.PERSONAL_TRAINER.TrainerID
INNER JOIN
	DPeakPerformanceDM.dbo.DimMembership
ON
	DPeakPerformanceDM.dbo.DimMembership.Membership_AK = ProjectBase.dbo.MEBERSHIP_TYPE.MembershipTypeID




--SELECT 
--	ProjectBase.dbo.SIGNUPS.TransactionID, 
--	ProjectBase.dbo.SIGNUPS.TransactionFee,
--	DPeakPerformanceDM.dbo.DimMember.Member_SK,
--	DPeakPerformanceDM.dbo.DimMembership.Membership_SK, 
--	DPeakPerformanceDM.dbo.DimFitnessAdvisor.Advisor_SK,
--	DPeakPerformanceDM.dbo.DimDate.PurchaseDate AS TransactionDate
--FROM 
--	ProjectBase.dbo.SIGNUPS
--LEFT JOIN 
--	ProjectBase.dbo.MEMBER
--ON 
--	ProjectBase.dbo.SIGNUPS.MemberID = ProjectBase.dbo.MEMBER.MemberID
--INNER JOIN	
--	ProjectBase.dbo.MEBERSHIP_TYPE
--ON
--	ProjectBase.dbo.MEBERSHIP_TYPE.MembershipTypeID = ProjectBase.dbo.SIGNUPS.MembershipTypeID
--INNER JOIN
--	ProjectBase.dbo.PERSONAL_TRAINER
--ON
--	ProjectBase.dbo.MEMBER.TrainerID = ProjectBase.dbo.PERSONAL_TRAINER.TrainerID
--INNER JOIN 
--	DPeakPerformanceDM.dbo.DimMember
--ON 
--	DPeakPerformanceDM.dbo.DimMember.Member_AK = ProjectBase.dbo.MEMBER.MemberID
--INNER JOIN 
--	DPeakPerformanceDM.dbo.DimMembership
--ON 
--	DPeakPerformanceDM.dbo.DimMembership.Membership_AK = ProjectBase.dbo.MEBERSHIP_TYPE.MembershipTypeID
--INNER JOIN
--	DPeakPerformanceDM.dbo.DimFitnessAdvisor
--ON
--	DPeakPerformanceDM.dbo.DimFitnessAdvisor.Advisor_AK = ProjectBase.dbo.PERSONAL_TRAINER.TrainerID
--INNER JOIN 
--	DPeakPerformanceDM.dbo.DimDate
--ON 
--	DPeakPerformanceDM.dbo.DimDate.Date = ProjectBase.dbo.SIGNUPS.TransactionDate