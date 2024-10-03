-- Group 2
-- Adam Hanson, Alexis Brewers, Colton Bondhus, Ismail Abdullahi, Lily Rossman

USE [master]
GO

USE [Entertainment]
GO

-- Agents table



-- Groups_Performers table



-- Groups table



-- Musical_Styles table
INSERT INTO [Musical_Styles] ([MusicalStylesKey], [MusicalStylesName])
VALUES
	('S001',	'40''s Ballroom Music'),
	('S002',	'50''s Music'),
	('S003',	'60''s Music'),
	('S004',	'70''s Music'),
	('S005',	'80''s Music'),
	('S006',	'Country'),
	('S007',	'Classical'),
	('S008',	'Classic Rock & Roll'),
	('S009',	'Rap'),
	('S010',	'Contemporary'),
	('S011',	'Country Rock'),
	('S012',	'Elvis'),
	('S013',	'Folk'),
	('S014',	'Chamber Music'),
	('S015',	'Jazz'),
	('S016',	'Karaoke'),
	('S017',	'Motown'),
	('S018',	'Modern Rock'),
	('S019',	'Rhythm and Blues'),
	('S020',	'Show Tunes'),
	('S021',	'Standards'),
	('S022',	'Top 40 Hits'),
	('S023',	'Variety'),
	('S024',	'Salsa'),
	('S025',	'90''s Music')
;


-- Customers table



-- Performers table
INSERT INTO [Performers] ([PerformersKey], [PerformersFirstName], [PerformersLastName], [PerformersSuffix], [PerformersPhone], [PerformersGender])
VALUES
	('M001',	'David',		'Hamilton',			NULL,		'555-2701',		'M'),
	('M002',	'Suzanne',		'Viescas',			NULL,		'555-2686',		'F'),
	('M003',	'Gary',			'Hallmark',			NULL,		'555-2676',		'M'),
	('M004',	'Jeffrey',		'Smith',			NULL,		'555-2596',		'M'),
	('M005',	'Robert',		'Brown',			NULL,		'555-2491',		'M'),
	('M006',	'Mariya',		'Sergienko',		NULL,		'555-2526',		'F'),
	('M007',	'Sara',			'Sheskey',			NULL,		'555-2566',		'F'),
	('M008',	'Rachel',		'Patterson',		NULL,		'555-2546',		'F'),
	('M009',	'David',		'Viescas',			NULL,		'555-2661',		'M'),
	('M010',	'Manuela',		'Seidel',			NULL,		'555-2641',		'F'),
	('M011',	'Kathryn',		'Patterson',		NULL,		'555-2651',		'F'),
	('M012',	'Kendra',		'Bonnicksen',		NULL,		'555-2716',		'F'),
	('M013',	'Steve',		'Pundt',			NULL,		'555-9938',		'M'),
	('M014',	'George',		'Chavez',			NULL,		'555-9930',		'M'),
	('M015',	'Joe',			'Rosales',			'III',		'555-2281',		'M'),
	('M016',	'Angel',		'Kennedy',			NULL,		'555-2311',		'M'),
	('M017',	'Luke',			'Patterson',		NULL,		'555-2316',		'M'),
	('M018',	'Janice',		'Galvin',			NULL,		'555-2691',		'F'),
	('M019',	'John',			'Viescas',			NULL,		'555-2511',		'M'),
	('M020',	'Michael',		'Hernandez',		NULL,		'555-2711',		'M'),
	('M021',	'Katherine',	'Ehrlich',			NULL,		'555-0399',		'F'),
	('M022',	'Julia',		'Schnebly',			NULL,		'555-9936',		'F'),
	('M023',	'Susan',		'McLain',			NULL,		'555-2301',		'F'),
	('M024',	'Caroline',		'Coie',				NULL,		'555-2306',		'F'),
	('M025',	'Jim',			'Glynn',			NULL,		'555-2531',		'M')
;




-- Engagements table



-- Groups_Styles table 



-- Musical_Preferences table

