--Here is the code for the DimCustomer table in the PrimoGoods DM

SELECT 
	ProjectBase.dbo.MEMBER.MemberID AS Member_AK, 
	ProjectBase.dbo.MEMBER.MemberFirst AS MemberFirstName,
	ProjectBase.dbo.MEMBER.MemberLast AS MemberLastName,
	ProjectBase.dbo.MEMBER.Gender AS MemberGender,
	ProjectBase.dbo.MEMBER.MemberAge AS MemberAge,
	ProjectBase.dbo.MEMBER.IsStudent 
FROM
	ProjectBase.dbo.Member
