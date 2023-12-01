CREATE TABLE IF NOT EXISTS `shops` (
  `label` varchar(255) NOT NULL,
  `icon` varchar(255) NOT NULL,
  `max` int(255) DEFAULT NULL,
  `price` int(255) NOT NULL,
  `spawn` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;


INSERT INTO `shops` (`label`, `icon`, `max`, `price`, `spawn`) VALUES
	('Armour', 'heart', 111, 10000, 'medkit'),
	('Weapon Clip', 'gun', 155, 500, 'clip'),
	('Armour', 'shield', 200, 5000, 'armour'),
	('Big Pot', 'shield', 10, 700, 'bigpot'),
	('Bandage', 'bandage', 50, 300, 'bandage');