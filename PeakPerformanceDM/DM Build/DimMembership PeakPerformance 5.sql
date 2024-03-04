

SELECT 
	ProjectBase.dbo.MEBERSHIP_TYPE.MembershipTypeID AS Membership_AK,
	ProjectBase.dbo.MEBERSHIP_TYPE.TypeName AS MembershipType,
	ProjectBase.dbo.MEBERSHIP_TYPE.TypeCost AS MemberShipCost
	--ProjectBase.dbo.SIGNUPS.TransactionDate AS MembershipJoinedDate,
	--ProjectBase.dbo.SIGNUPS.IsRenewal 
FROM 
	ProjectBase.dbo.MEBERSHIP_TYPE
--INNER JOIN 
--	ProjectBase.dbo.SIGNUPS
--ON 
--	ProjectBase.dbo.SIGNUPS.MembershipTypeID = ProjectBase.dbo.MEBERSHIP_TYPE.MembershipTypeID
