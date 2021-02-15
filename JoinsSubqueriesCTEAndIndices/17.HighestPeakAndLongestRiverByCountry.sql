SELECT TOP(5) C.CountryName, MAX(p.Elevation) MaxElevation, MAX(r.Length) MaxRiverLenght
	FROM Countries AS c
	LEFT JOIN MountainsCountries AS mc ON mc.CountryCode = c.CountryCode
	LEFT JOIN Mountains AS m ON m.Id = mc.MountainId
	LEFT JOIN Peaks AS p ON P.MountainId = m.Id
	LEFT JOIN CountriesRivers AS cr ON cr.CountryCode = c.CountryCode
	LEFT JOIN Rivers AS r ON r.Id = cr.RiverId
	GROUP BY c.CountryName
	ORDER BY MaxElevation DESC, MaxRiverLenght DESC, c.CountryName