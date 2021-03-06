library ieee;
use ieee.std_logic_1164.all,ieee.numeric_std.all;

entity gravitar_vec_rom4 is
port (
	clk  : in  std_logic;
	addr : in  std_logic_vector(11 downto 0);
	data : out std_logic_vector(7 downto 0)
);
end entity;

architecture prom of gravitar_vec_rom4 is
	type rom is array(0 to  4095) of std_logic_vector(7 downto 0);
	signal rom_data: rom := (
		X"20",X"9B",X"50",X"C6",X"D6",X"C6",X"D6",X"EE",X"52",X"04",X"D0",X"03",X"EE",X"53",X"04",X"A2",
		X"01",X"20",X"DF",X"50",X"95",X"42",X"A9",X"02",X"95",X"E3",X"A9",X"01",X"9D",X"6C",X"01",X"A9",
		X"04",X"95",X"00",X"A9",X"00",X"95",X"EB",X"CA",X"10",X"E7",X"86",X"88",X"86",X"89",X"20",X"A9",
		X"50",X"A2",X"01",X"A9",X"00",X"95",X"49",X"95",X"EE",X"9D",X"4E",X"04",X"9D",X"7A",X"01",X"95",
		X"F6",X"9D",X"3C",X"01",X"CA",X"10",X"EE",X"85",X"D1",X"85",X"D2",X"85",X"CF",X"A2",X"02",X"86",
		X"D0",X"60",X"20",X"DF",X"50",X"85",X"42",X"A9",X"02",X"85",X"E3",X"C6",X"D6",X"EE",X"50",X"04",
		X"D0",X"03",X"EE",X"51",X"04",X"20",X"9B",X"50",X"A9",X"01",X"85",X"D0",X"8D",X"6C",X"01",X"A9",
		X"00",X"8D",X"4E",X"04",X"8D",X"4F",X"04",X"85",X"49",X"85",X"EE",X"85",X"CF",X"8D",X"7A",X"01",
		X"85",X"F6",X"8D",X"3C",X"01",X"85",X"D1",X"85",X"D2",X"20",X"A9",X"50",X"A9",X"FF",X"85",X"88",
		X"85",X"43",X"A9",X"04",X"85",X"00",X"A9",X"00",X"85",X"EB",X"60",X"A2",X"05",X"A9",X"00",X"9D",
		X"68",X"01",X"9D",X"62",X"01",X"CA",X"10",X"F7",X"60",X"A0",X"1D",X"A2",X"0E",X"BD",X"D0",X"50",
		X"99",X"44",X"01",X"48",X"0A",X"0A",X"0A",X"0A",X"99",X"71",X"04",X"88",X"99",X"71",X"04",X"68",
		X"99",X"44",X"01",X"88",X"CA",X"10",X"E6",X"A9",X"FF",X"8D",X"58",X"01",X"8D",X"59",X"01",X"60",
		X"02",X"04",X"06",X"08",X"09",X"09",X"09",X"09",X"09",X"09",X"09",X"09",X"09",X"09",X"09",X"A5",
		X"F0",X"29",X"0C",X"4A",X"4A",X"A8",X"B9",X"EA",X"50",X"60",X"02",X"03",X"04",X"05",X"20",X"19",
		X"54",X"20",X"67",X"54",X"20",X"72",X"93",X"20",X"C2",X"E1",X"A6",X"CF",X"D6",X"42",X"10",X"1C",
		X"A9",X"02",X"8D",X"6D",X"04",X"A9",X"00",X"85",X"F4",X"A9",X"1A",X"9D",X"6F",X"04",X"A9",X"12",
		X"95",X"00",X"A9",X"04",X"95",X"EB",X"8E",X"6C",X"04",X"4C",X"31",X"51",X"A9",X"1A",X"95",X"00",
		X"A9",X"0C",X"95",X"EB",X"A9",X"FF",X"95",X"88",X"20",X"56",X"53",X"20",X"6F",X"53",X"20",X"D7",
		X"51",X"A9",X"01",X"85",X"CE",X"A9",X"00",X"A2",X"0C",X"95",X"0B",X"CA",X"10",X"FB",X"85",X"4B",
		X"85",X"4C",X"85",X"F4",X"85",X"F5",X"85",X"11",X"85",X"27",X"8D",X"6E",X"04",X"8E",X"43",X"01",
		X"86",X"30",X"A9",X"38",X"85",X"0F",X"86",X"10",X"60",X"20",X"19",X"54",X"20",X"67",X"54",X"20",
		X"72",X"93",X"20",X"C2",X"E1",X"20",X"F8",X"51",X"A9",X"FF",X"A6",X"CF",X"95",X"88",X"B5",X"4D",
		X"A8",X"B9",X"31",X"C1",X"C9",X"A8",X"D0",X"0C",X"A9",X"FF",X"8D",X"3E",X"01",X"A0",X"0C",X"A9",
		X"1A",X"4C",X"88",X"51",X"A9",X"06",X"A0",X"00",X"48",X"D6",X"42",X"10",X"18",X"A9",X"00",X"85",
		X"F4",X"A9",X"02",X"8D",X"6D",X"04",X"A9",X"12",X"95",X"00",X"68",X"9D",X"6F",X"04",X"A9",X"04",
		X"95",X"EB",X"4C",X"B0",X"51",X"68",X"95",X"00",X"94",X"EB",X"8E",X"6C",X"04",X"20",X"D7",X"51",
		X"A9",X"38",X"85",X"0F",X"A9",X"FF",X"85",X"30",X"8D",X"43",X"01",X"85",X"10",X"A9",X"01",X"85",
		X"CE",X"A9",X"00",X"85",X"0E",X"85",X"0D",X"85",X"F4",X"85",X"F5",X"85",X"4B",X"85",X"4C",X"85",
		X"27",X"8D",X"6E",X"04",X"85",X"11",X"60",X"A6",X"CF",X"B5",X"42",X"10",X"0D",X"25",X"42",X"25",
		X"43",X"10",X"07",X"A9",X"10",X"85",X"00",X"85",X"01",X"60",X"A5",X"CF",X"49",X"01",X"AA",X"B4",
		X"42",X"10",X"02",X"49",X"01",X"85",X"CF",X"60",X"A6",X"CF",X"B5",X"4D",X"0A",X"18",X"65",X"CF",
		X"A8",X"B5",X"E9",X"99",X"71",X"04",X"60",X"20",X"67",X"54",X"A6",X"CF",X"B5",X"4D",X"AA",X"BD",
		X"ED",X"C0",X"7D",X"14",X"53",X"85",X"0F",X"BD",X"DC",X"C0",X"7D",X"23",X"53",X"85",X"10",X"BD",
		X"FE",X"C0",X"7D",X"F6",X"52",X"85",X"0D",X"BD",X"0F",X"C1",X"7D",X"05",X"53",X"85",X"0E",X"BD",
		X"32",X"53",X"85",X"11",X"85",X"27",X"4A",X"4A",X"4A",X"29",X"06",X"85",X"1E",X"BD",X"31",X"C1",
		X"C9",X"A8",X"D0",X"26",X"A5",X"FA",X"30",X"0A",X"A9",X"FF",X"8D",X"3E",X"01",X"AD",X"43",X"01",
		X"30",X"15",X"8A",X"0A",X"65",X"CF",X"AA",X"BD",X"44",X"01",X"85",X"21",X"A9",X"FF",X"20",X"EF",
		X"54",X"A9",X"09",X"A6",X"CF",X"95",X"49",X"4C",X"8C",X"52",X"A6",X"CF",X"B5",X"4D",X"0A",X"18",
		X"65",X"CF",X"AA",X"BD",X"44",X"01",X"30",X"14",X"A5",X"FA",X"30",X"0D",X"A9",X"00",X"A2",X"07",
		X"1D",X"E4",X"02",X"CA",X"10",X"FA",X"AA",X"D0",X"03",X"20",X"7A",X"54",X"20",X"72",X"93",X"A6",
		X"CF",X"B5",X"4D",X"AA",X"BD",X"31",X"C1",X"C9",X"A8",X"D0",X"19",X"A9",X"7F",X"25",X"F4",X"85",
		X"F4",X"AD",X"43",X"01",X"30",X"0E",X"20",X"41",X"BF",X"20",X"41",X"BF",X"20",X"41",X"BF",X"A9",
		X"FF",X"8D",X"43",X"01",X"A4",X"CF",X"D0",X"06",X"2C",X"3C",X"01",X"4C",X"C1",X"52",X"2C",X"3D",
		X"01",X"50",X"05",X"A9",X"00",X"99",X"3C",X"01",X"20",X"56",X"53",X"20",X"6F",X"53",X"A9",X"01",
		X"85",X"CE",X"A9",X"FF",X"85",X"30",X"A9",X"1A",X"A6",X"CF",X"95",X"00",X"A9",X"0C",X"95",X"EB",
		X"B5",X"F6",X"29",X"01",X"D0",X"06",X"20",X"F3",X"53",X"4C",X"EF",X"52",X"20",X"04",X"54",X"A9",
		X"00",X"85",X"4B",X"85",X"4C",X"60",X"A0",X"A0",X"60",X"60",X"A0",X"00",X"A0",X"00",X"60",X"60",
		X"A0",X"A0",X"60",X"60",X"A0",X"FF",X"FF",X"00",X"00",X"00",X"00",X"FF",X"00",X"00",X"FF",X"FF",
		X"FF",X"00",X"00",X"00",X"A0",X"60",X"60",X"A0",X"00",X"A0",X"00",X"60",X"00",X"60",X"A0",X"60",
		X"60",X"A0",X"00",X"FF",X"00",X"00",X"FF",X"00",X"FF",X"00",X"00",X"00",X"FF",X"FF",X"00",X"00",
		X"FF",X"00",X"28",X"38",X"08",X"18",X"10",X"20",X"30",X"00",X"10",X"28",X"28",X"38",X"08",X"18",
		X"10",X"BD",X"ED",X"C0",X"85",X"38",X"BD",X"DC",X"C0",X"85",X"39",X"BD",X"FE",X"C0",X"85",X"3A",
		X"BD",X"0F",X"C1",X"85",X"3B",X"60",X"A0",X"07",X"A6",X"CF",X"B5",X"4D",X"0A",X"18",X"65",X"CF",
		X"AA",X"B9",X"E4",X"02",X"18",X"F0",X"01",X"38",X"3E",X"F6",X"04",X"88",X"10",X"F3",X"60",X"A0",
		X"07",X"A6",X"CF",X"B5",X"4D",X"0A",X"18",X"65",X"CF",X"AA",X"B9",X"03",X"03",X"18",X"F0",X"01",
		X"38",X"7E",X"BA",X"04",X"B9",X"FB",X"02",X"18",X"F0",X"01",X"38",X"7E",X"D8",X"04",X"88",X"10",
		X"E9",X"60",X"A9",X"FF",X"8D",X"3A",X"01",X"85",X"30",X"8D",X"43",X"01",X"85",X"10",X"8D",X"3E",
		X"01",X"A9",X"01",X"85",X"CE",X"A9",X"38",X"85",X"0F",X"20",X"67",X"54",X"20",X"72",X"93",X"A5",
		X"F0",X"0A",X"2A",X"2A",X"29",X"03",X"A8",X"B9",X"D2",X"C3",X"A6",X"CF",X"9D",X"16",X"05",X"A9",
		X"00",X"8D",X"6E",X"01",X"8D",X"6F",X"01",X"85",X"0E",X"85",X"0D",X"85",X"F3",X"85",X"F4",X"85",
		X"4B",X"85",X"4C",X"85",X"11",X"8D",X"6E",X"04",X"85",X"27",X"20",X"C2",X"E1",X"20",X"F3",X"53",
		X"AD",X"BE",X"59",X"85",X"18",X"20",X"19",X"54",X"A6",X"CF",X"A9",X"1A",X"95",X"00",X"A9",X"0C",
		X"95",X"EB",X"60",X"A9",X"C8",X"85",X"52",X"A9",X"00",X"85",X"51",X"A9",X"96",X"85",X"54",X"A9",
		X"00",X"85",X"53",X"60",X"AD",X"FD",X"C0",X"85",X"52",X"AD",X"EC",X"C0",X"85",X"51",X"AD",X"0E",
		X"C1",X"85",X"54",X"AD",X"1F",X"C1",X"85",X"53",X"60",X"A2",X"01",X"A4",X"CF",X"B9",X"F6",X"00",
		X"29",X"01",X"D0",X"06",X"20",X"37",X"54",X"4C",X"2D",X"54",X"20",X"4C",X"54",X"BD",X"65",X"54",
		X"9D",X"34",X"01",X"CA",X"10",X"E5",X"60",X"A9",X"37",X"9D",X"08",X"01",X"A9",X"00",X"9D",X"0C",
		X"01",X"A9",X"A8",X"9D",X"14",X"01",X"A9",X"FD",X"9D",X"18",X"01",X"60",X"AD",X"07",X"C1",X"9D",
		X"14",X"01",X"AD",X"18",X"C1",X"9D",X"18",X"01",X"AD",X"F6",X"C0",X"9D",X"08",X"01",X"AD",X"E5",
		X"C0",X"9D",X"0C",X"01",X"60",X"10",X"18",X"A0",X"0E",X"A9",X"00",X"99",X"EC",X"02",X"88",X"10",
		X"FA",X"A2",X"0F",X"9D",X"BF",X"03",X"CA",X"10",X"FA",X"60",X"A6",X"CF",X"B4",X"4D",X"B9",X"31",
		X"C1",X"84",X"21",X"C9",X"A8",X"D0",X"01",X"60",X"20",X"D0",X"C1",X"20",X"C0",X"C8",X"20",X"C0",
		X"C8",X"20",X"C0",X"C8",X"20",X"EB",X"E0",X"A4",X"21",X"98",X"0A",X"18",X"65",X"CF",X"AA",X"BD",
		X"44",X"01",X"85",X"21",X"A9",X"FF",X"9D",X"44",X"01",X"A9",X"1C",X"18",X"65",X"CF",X"AA",X"A0",
		X"1C",X"BD",X"44",X"01",X"30",X"16",X"C5",X"21",X"D0",X"01",X"18",X"B0",X"05",X"C8",X"B9",X"98",
		X"55",X"88",X"9D",X"44",X"01",X"0A",X"0A",X"0A",X"0A",X"9D",X"71",X"04",X"88",X"88",X"CA",X"CA",
		X"10",X"DF",X"A6",X"CF",X"B5",X"F6",X"29",X"03",X"A8",X"F0",X"08",X"8A",X"18",X"69",X"0A",X"88",
		X"D0",X"FA",X"AA",X"BD",X"44",X"01",X"3D",X"46",X"01",X"3D",X"48",X"01",X"3D",X"4A",X"01",X"10",
		X"53",X"A6",X"CF",X"A9",X"00",X"95",X"EE",X"9D",X"3C",X"01",X"A9",X"1C",X"18",X"65",X"CF",X"AA",
		X"A5",X"21",X"18",X"69",X"01",X"C9",X"09",X"90",X"02",X"A9",X"09",X"9D",X"44",X"01",X"0A",X"0A",
		X"0A",X"0A",X"9D",X"71",X"04",X"CA",X"CA",X"10",X"E7",X"A9",X"38",X"85",X"0F",X"A9",X"FF",X"85",
		X"10",X"8D",X"58",X"01",X"8D",X"59",X"01",X"A9",X"00",X"85",X"27",X"85",X"11",X"85",X"1E",X"85",
		X"0D",X"85",X"0E",X"A6",X"CF",X"B5",X"F6",X"48",X"29",X"03",X"C9",X"02",X"68",X"69",X"01",X"95",
		X"F6",X"20",X"19",X"54",X"A6",X"CF",X"B4",X"4D",X"98",X"0A",X"65",X"CF",X"9D",X"3A",X"01",X"85",
		X"21",X"B5",X"EE",X"A4",X"21",X"39",X"C2",X"5A",X"95",X"EE",X"60",X"A9",X"FF",X"85",X"88",X"85",
		X"89",X"85",X"4D",X"A5",X"F1",X"85",X"DF",X"A9",X"00",X"85",X"F3",X"A5",X"4F",X"29",X"03",X"D0",
		X"02",X"C6",X"3F",X"A5",X"3F",X"C9",X"C0",X"90",X"07",X"A9",X"40",X"A0",X"01",X"4C",X"84",X"55",
		X"A9",X"00",X"A0",X"02",X"85",X"30",X"84",X"CE",X"A5",X"3F",X"D0",X"04",X"A9",X"20",X"85",X"00",
		X"20",X"67",X"54",X"A9",X"08",X"85",X"EB",X"60",X"02",X"09",X"04",X"09",X"06",X"09",X"08",X"09",
		X"09",X"09",X"09",X"09",X"09",X"09",X"09",X"09",X"09",X"09",X"09",X"09",X"09",X"09",X"09",X"09",
		X"09",X"09",X"09",X"09",X"09",X"09",X"A9",X"FF",X"18",X"69",X"08",X"CA",X"10",X"FA",X"A8",X"A2",
		X"07",X"B9",X"DE",X"55",X"9D",X"17",X"02",X"B9",X"56",X"56",X"9D",X"00",X"02",X"B9",X"CE",X"56",
		X"9D",X"5C",X"02",X"B9",X"46",X"57",X"9D",X"45",X"02",X"88",X"CA",X"10",X"E4",X"60",X"60",X"E0",
		X"40",X"60",X"60",X"40",X"60",X"E0",X"90",X"30",X"30",X"B0",X"70",X"D0",X"30",X"30",X"20",X"60",
		X"20",X"60",X"20",X"60",X"20",X"C0",X"40",X"80",X"E0",X"C0",X"60",X"20",X"A0",X"C0",X"C0",X"80",
		X"A0",X"40",X"40",X"C0",X"20",X"40",X"A0",X"E0",X"E0",X"E0",X"00",X"C0",X"00",X"60",X"A0",X"E0",
		X"E0",X"A0",X"E0",X"80",X"60",X"60",X"00",X"A0",X"20",X"60",X"C0",X"E0",X"C0",X"E0",X"C0",X"60",
		X"A0",X"E0",X"60",X"C0",X"E0",X"80",X"C0",X"80",X"A0",X"40",X"40",X"C0",X"20",X"40",X"60",X"70",
		X"3B",X"B6",X"40",X"71",X"53",X"FB",X"A0",X"A0",X"E0",X"60",X"00",X"A0",X"40",X"00",X"60",X"00",
		X"80",X"C0",X"C0",X"60",X"20",X"80",X"00",X"00",X"00",X"40",X"A0",X"E0",X"40",X"A0",X"C0",X"80",
		X"A0",X"40",X"40",X"C0",X"20",X"20",X"FD",X"FD",X"FD",X"FC",X"FC",X"FD",X"FD",X"FD",X"FC",X"FD",
		X"FD",X"FB",X"FD",X"FC",X"FD",X"FD",X"FD",X"FB",X"FD",X"FB",X"FD",X"FB",X"FD",X"FB",X"00",X"FE",
		X"FE",X"FE",X"02",X"FD",X"01",X"FF",X"FE",X"00",X"FC",X"FC",X"00",X"FC",X"01",X"FF",X"FD",X"FF",
		X"FE",X"FF",X"FE",X"FE",X"00",X"FE",X"FC",X"FE",X"FE",X"FC",X"FD",X"FB",X"FD",X"FD",X"FD",X"FB",
		X"FD",X"FC",X"FB",X"FC",X"FC",X"FC",X"FF",X"01",X"FD",X"01",X"FF",X"00",X"FF",X"FD",X"FE",X"00",
		X"FC",X"FC",X"00",X"FC",X"01",X"FF",X"08",X"00",X"DC",X"1F",X"01",X"F6",X"00",X"00",X"FC",X"FC",
		X"FB",X"FB",X"FE",X"FD",X"FB",X"FD",X"FE",X"FC",X"FB",X"02",X"02",X"FB",X"FE",X"01",X"FB",X"FD",
		X"FD",X"FB",X"FC",X"FC",X"FB",X"FC",X"FE",X"00",X"FC",X"FC",X"00",X"FC",X"01",X"FF",X"80",X"80",
		X"A0",X"80",X"80",X"60",X"80",X"80",X"00",X"10",X"60",X"A0",X"40",X"80",X"00",X"A0",X"40",X"80",
		X"C0",X"80",X"60",X"60",X"40",X"A0",X"C0",X"C0",X"00",X"C0",X"80",X"E0",X"C0",X"00",X"80",X"C0",
		X"A0",X"80",X"80",X"80",X"A0",X"80",X"80",X"A0",X"A0",X"60",X"80",X"40",X"80",X"80",X"A0",X"A0",
		X"60",X"60",X"A0",X"A0",X"A0",X"60",X"A0",X"C0",X"80",X"20",X"60",X"60",X"60",X"60",X"00",X"A0",
		X"20",X"60",X"20",X"80",X"60",X"40",X"80",X"C0",X"A0",X"80",X"80",X"80",X"A0",X"80",X"00",X"00",
		X"00",X"60",X"80",X"A0",X"E0",X"20",X"20",X"A0",X"C0",X"10",X"C0",X"E0",X"20",X"20",X"F0",X"40",
		X"90",X"80",X"80",X"70",X"D0",X"40",X"60",X"20",X"20",X"30",X"80",X"00",X"60",X"80",X"80",X"C0",
		X"A0",X"80",X"80",X"80",X"A0",X"80",X"F8",X"FB",X"FD",X"FE",X"00",X"02",X"03",X"06",X"F8",X"F9",
		X"FA",X"FB",X"FD",X"00",X"03",X"05",X"F8",X"FA",X"FC",X"FE",X"00",X"02",X"04",X"06",X"FC",X"FD",
		X"FF",X"FF",X"00",X"01",X"02",X"04",X"FB",X"FC",X"FD",X"FE",X"FF",X"00",X"02",X"04",X"F8",X"F9",
		X"FB",X"FC",X"FF",X"01",X"02",X"03",X"F8",X"F9",X"FB",X"FC",X"FD",X"FE",X"02",X"04",X"F7",X"FA",
		X"FB",X"FD",X"01",X"02",X"03",X"05",X"FC",X"FC",X"FD",X"FE",X"00",X"01",X"02",X"03",X"FB",X"FC",
		X"FD",X"FE",X"FF",X"00",X"02",X"04",X"02",X"BB",X"AA",X"30",X"5F",X"EE",X"3D",X"A8",X"F9",X"FA",
		X"FB",X"FE",X"FF",X"01",X"02",X"04",X"FB",X"FC",X"FD",X"FE",X"01",X"02",X"03",X"04",X"F9",X"FA",
		X"FC",X"FD",X"FE",X"01",X"04",X"06",X"FB",X"FC",X"FD",X"FE",X"FF",X"00",X"02",X"04",X"A9",X"00",
		X"A2",X"0D",X"95",X"0B",X"CA",X"10",X"FB",X"A2",X"A7",X"9D",X"00",X"02",X"CA",X"D0",X"FA",X"20",
		X"67",X"54",X"A9",X"04",X"85",X"1E",X"20",X"C2",X"E1",X"A9",X"20",X"85",X"11",X"85",X"27",X"8D",
		X"36",X"01",X"8D",X"37",X"01",X"A6",X"CF",X"B5",X"4D",X"AA",X"BD",X"AF",X"59",X"85",X"10",X"A5",
		X"D0",X"F0",X"10",X"BD",X"31",X"C1",X"C9",X"A8",X"F0",X"06",X"20",X"19",X"5B",X"4C",X"03",X"58",
		X"20",X"F3",X"E0",X"20",X"31",X"5B",X"A6",X"CF",X"B4",X"49",X"A5",X"F0",X"29",X"10",X"D0",X"06",
		X"B9",X"BE",X"59",X"4C",X"19",X"58",X"B9",X"C8",X"59",X"85",X"18",X"B9",X"A5",X"59",X"95",X"E5",
		X"A9",X"10",X"8D",X"38",X"01",X"A9",X"F0",X"8D",X"39",X"01",X"95",X"88",X"B9",X"9B",X"59",X"95",
		X"E7",X"A9",X"00",X"85",X"51",X"85",X"52",X"85",X"53",X"85",X"54",X"85",X"7A",X"85",X"4C",X"85",
		X"4B",X"8D",X"0F",X"60",X"85",X"37",X"85",X"48",X"85",X"2B",X"A9",X"FF",X"85",X"0E",X"85",X"15",
		X"85",X"16",X"85",X"36",X"85",X"30",X"8D",X"3E",X"01",X"85",X"2D",X"B5",X"4D",X"AA",X"BD",X"31",
		X"C1",X"10",X"09",X"A9",X"00",X"85",X"2D",X"A9",X"07",X"4C",X"6E",X"58",X"A9",X"08",X"85",X"2A",
		X"E0",X"0C",X"D0",X"04",X"A9",X"FF",X"85",X"51",X"A9",X"03",X"8D",X"0F",X"60",X"A9",X"04",X"85",
		X"28",X"85",X"29",X"A9",X"40",X"85",X"2F",X"85",X"0D",X"20",X"B6",X"55",X"A6",X"CF",X"B5",X"4D",
		X"0A",X"18",X"65",X"CF",X"A8",X"B9",X"44",X"01",X"30",X"58",X"B5",X"EE",X"39",X"C2",X"5A",X"D0",
		X"4C",X"B9",X"C2",X"5A",X"15",X"EE",X"95",X"EE",X"B9",X"44",X"01",X"0A",X"0A",X"0A",X"0A",X"95",
		X"E9",X"B5",X"49",X"C9",X"07",X"90",X"02",X"A9",X"07",X"A4",X"CF",X"B6",X"4D",X"F0",X"06",X"18",
		X"69",X"08",X"CA",X"D0",X"FA",X"A8",X"A6",X"CF",X"B5",X"4D",X"0A",X"18",X"65",X"CF",X"AA",X"B9",
		X"D2",X"59",X"9D",X"BA",X"04",X"B9",X"4A",X"5A",X"9D",X"D8",X"04",X"C0",X"20",X"90",X"05",X"A9",
		X"FF",X"4C",X"E7",X"58",X"B9",X"F9",X"5A",X"9D",X"F6",X"04",X"4C",X"F2",X"58",X"B9",X"71",X"04",
		X"95",X"E9",X"A6",X"CF",X"B4",X"49",X"A5",X"F0",X"29",X"10",X"D0",X"06",X"B9",X"87",X"59",X"4C",
		X"05",X"59",X"B9",X"91",X"59",X"18",X"75",X"F6",X"C9",X"08",X"90",X"02",X"A9",X"08",X"85",X"ED",
		X"B5",X"4D",X"AA",X"BD",X"31",X"C1",X"29",X"20",X"D0",X"1B",X"A6",X"CF",X"B5",X"4D",X"0A",X"18",
		X"65",X"CF",X"AA",X"BD",X"BA",X"04",X"85",X"23",X"BD",X"D8",X"04",X"85",X"24",X"BD",X"F6",X"04",
		X"85",X"21",X"4C",X"56",X"59",X"A6",X"CF",X"B4",X"F6",X"C0",X"06",X"90",X"02",X"A0",X"06",X"B9",
		X"80",X"59",X"8D",X"3E",X"01",X"A9",X"00",X"85",X"23",X"85",X"24",X"A0",X"FF",X"B5",X"F6",X"C9",
		X"02",X"B0",X"01",X"C8",X"84",X"21",X"20",X"E0",X"5A",X"A2",X"0F",X"46",X"24",X"66",X"23",X"90",
		X"08",X"A9",X"08",X"9D",X"FB",X"02",X"4C",X"6E",X"59",X"A9",X"00",X"9D",X"FB",X"02",X"CA",X"10",
		X"EA",X"A9",X"02",X"85",X"CE",X"A6",X"CF",X"A9",X"14",X"95",X"00",X"A9",X"06",X"95",X"EB",X"60",
		X"23",X"21",X"19",X"19",X"17",X"13",X"09",X"01",X"02",X"02",X"03",X"03",X"04",X"04",X"05",X"05",
		X"06",X"00",X"00",X"00",X"01",X"01",X"02",X"02",X"03",X"03",X"04",X"02",X"02",X"02",X"04",X"06",
		X"08",X"10",X"20",X"30",X"40",X"01",X"01",X"02",X"03",X"04",X"05",X"06",X"07",X"08",X"08",X"03",
		X"03",X"03",X"04",X"03",X"03",X"03",X"03",X"03",X"03",X"03",X"03",X"01",X"03",X"03",X"10",X"10",
		X"10",X"11",X"13",X"16",X"1A",X"1F",X"25",X"28",X"00",X"00",X"10",X"10",X"12",X"12",X"16",X"16",
		X"20",X"25",X"84",X"84",X"84",X"84",X"84",X"84",X"84",X"85",X"04",X"04",X"04",X"04",X"04",X"04",
		X"04",X"04",X"44",X"44",X"44",X"44",X"44",X"44",X"44",X"44",X"90",X"90",X"90",X"90",X"90",X"90",
		X"90",X"90",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"18",X"18",X"18",X"18",X"18",X"18",
		X"18",X"18",X"02",X"02",X"02",X"02",X"02",X"02",X"02",X"02",X"11",X"11",X"11",X"11",X"11",X"11",
		X"11",X"11",X"30",X"30",X"30",X"30",X"30",X"30",X"30",X"30",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"01",X"01",X"01",X"01",X"01",X"01",X"01",X"01",X"14",X"14",X"14",X"14",X"14",X"14",
		X"14",X"14",X"60",X"60",X"60",X"60",X"60",X"60",X"60",X"60",X"D8",X"D8",X"D8",X"D8",X"D8",X"D8",
		X"D8",X"D8",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"08",X"10",X"10",X"10",X"10",X"10",X"10",X"10",X"54",X"02",X"02",X"02",X"02",X"02",X"02",
		X"02",X"42",X"09",X"09",X"09",X"09",X"09",X"09",X"09",X"09",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"24",X"24",X"24",X"24",X"24",X"24",X"24",X"24",X"29",X"29",X"29",X"29",X"29",X"29",
		X"29",X"29",X"0C",X"0C",X"0C",X"0C",X"0C",X"0C",X"0C",X"0C",X"14",X"14",X"14",X"14",X"14",X"14",
		X"14",X"14",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"31",X"31",X"31",X"31",X"31",X"31",
		X"31",X"31",X"89",X"89",X"89",X"89",X"89",X"89",X"89",X"89",X"06",X"06",X"06",X"06",X"06",X"06",
		X"06",X"06",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"01",X"01",X"02",X"02",X"04",X"04",X"08",X"08",X"10",X"10",X"01",X"01",X"02",X"02",
		X"04",X"04",X"08",X"08",X"10",X"10",X"01",X"01",X"02",X"02",X"04",X"04",X"08",X"08",X"10",X"10",
		X"A9",X"7F",X"A2",X"07",X"06",X"21",X"90",X"08",X"A9",X"7F",X"9D",X"E4",X"02",X"4C",X"F5",X"5A",
		X"A9",X"00",X"9D",X"E4",X"02",X"CA",X"10",X"EC",X"60",X"28",X"28",X"28",X"28",X"28",X"28",X"28",
		X"FF",X"74",X"74",X"74",X"74",X"74",X"74",X"74",X"FF",X"BE",X"BE",X"BE",X"BE",X"BE",X"BE",X"BE",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"A6",X"CF",X"B5",X"4D",X"0A",X"18",X"65",
		X"CF",X"AA",X"A4",X"CF",X"BD",X"44",X"01",X"C9",X"09",X"90",X"02",X"A9",X"09",X"99",X"49",X"00",
		X"60",X"A6",X"CF",X"B5",X"4D",X"0A",X"18",X"69",X"96",X"85",X"22",X"A9",X"0A",X"85",X"23",X"A4",
		X"22",X"B9",X"72",X"5B",X"A6",X"23",X"95",X"56",X"B9",X"73",X"5B",X"95",X"57",X"B9",X"26",X"5C",
		X"95",X"62",X"B9",X"27",X"5C",X"95",X"63",X"B9",X"DA",X"5C",X"95",X"6E",X"B9",X"DB",X"5C",X"95",
		X"6F",X"A5",X"22",X"38",X"E9",X"1E",X"85",X"22",X"A5",X"23",X"38",X"E9",X"02",X"85",X"23",X"B0",
		X"CE",X"60",X"CB",X"AF",X"A1",X"A5",X"D5",X"AA",X"D5",X"A6",X"CB",X"AD",X"61",X"B1",X"4B",X"B0",
		X"81",X"A8",X"25",X"B3",X"CB",X"AD",X"2B",X"B9",X"2B",X"B9",X"55",X"B7",X"C5",X"B4",X"CB",X"AD",
		X"EB",X"AF",X"FD",X"A5",X"C7",X"AB",X"59",X"A7",X"6B",X"AE",X"ED",X"B1",X"9D",X"B0",X"3D",X"A9",
		X"A5",X"B3",X"6B",X"AE",X"2B",X"B9",X"DD",X"B9",X"E7",X"B7",X"95",X"B5",X"6B",X"AE",X"0B",X"B0",
		X"59",X"A6",X"B9",X"AC",X"DD",X"A7",X"0B",X"AF",X"79",X"B2",X"EF",X"B0",X"F9",X"A9",X"25",X"B4",
		X"0B",X"AF",X"2B",X"B9",X"8F",X"BA",X"79",X"B8",X"65",X"B6",X"0B",X"AF",X"B9",X"A3",X"19",X"A3",
		X"79",X"A3",X"39",X"A3",X"99",X"A3",X"19",X"A4",X"D9",X"A3",X"59",X"A3",X"F9",X"A3",X"99",X"A3",
		X"39",X"A4",X"39",X"A4",X"59",X"A4",X"79",X"A4",X"99",X"A3",X"2B",X"B0",X"C5",X"A6",X"BB",X"AD",
		X"71",X"A8",X"BB",X"AF",X"05",X"B3",X"41",X"B1",X"C5",X"AA",X"A5",X"B4",X"BB",X"AF",X"2B",X"B9",
		X"41",X"BB",X"0B",X"B9",X"35",X"B7",X"BB",X"AF",X"3B",X"B0",X"B5",X"A6",X"AB",X"AD",X"61",X"A8",
		X"AB",X"AF",X"15",X"B3",X"51",X"B1",X"B5",X"AA",X"B5",X"B4",X"AB",X"AF",X"2B",X"B9",X"51",X"BB",
		X"1B",X"B9",X"45",X"B7",X"AB",X"AF",X"C9",X"D3",X"69",X"D3",X"A9",X"D3",X"69",X"D3",X"69",X"D3",
		X"09",X"D4",X"E9",X"D3",X"89",X"D3",X"69",X"D3",X"69",X"D3",X"39",X"A4",X"39",X"A4",X"69",X"D3",
		X"29",X"D4",X"69",X"D3",X"39",X"A2",X"99",X"A1",X"F9",X"A1",X"B9",X"A1",X"19",X"A2",X"99",X"A2",
		X"59",X"A2",X"D9",X"A1",X"79",X"A2",X"19",X"A2",X"B9",X"A2",X"B9",X"A2",X"D9",X"A2",X"F9",X"A2",
		X"19",X"A2",X"A0",X"FD",X"70",X"FC",X"00",X"FB",X"00",X"00",X"00",X"FF",X"80",X"FC",X"40",X"FD",
		X"A0",X"FD",X"00",X"FE",X"00",X"FF",X"00",X"FB",X"00",X"FB",X"00",X"FD",X"E0",X"FD",X"00",X"FF",
		X"39",X"A4",X"32",X"D7",X"62",X"D7",X"82",X"D7",X"00",X"00",X"E2",X"D7",X"B2",X"D7",X"42",X"D7",
		X"02",X"D8",X"00",X"00",X"42",X"D8",X"52",X"D8",X"22",X"D8",X"39",X"A4",X"00",X"00",X"A2",X"D7",
		X"22",X"D7",X"72",X"D7",X"92",X"D7",X"00",X"00",X"D2",X"D7",X"C2",X"D7",X"52",X"D7",X"F2",X"D7",
		X"00",X"00",X"42",X"D8",X"42",X"D8",X"12",X"D8",X"32",X"D8",X"00",X"00",X"E9",X"D4",X"49",X"D4",
		X"89",X"D4",X"A9",X"D4",X"C9",X"D4",X"29",X"D5",X"09",X"D5",X"69",X"D4",X"49",X"D5",X"C9",X"D4",
		X"69",X"D5",X"69",X"D5",X"89",X"D5",X"A9",X"D5",X"C9",X"D4",X"09",X"D6",X"C9",X"D5",X"E9",X"D5",
		X"F9",X"D5",X"49",X"D6",X"29",X"D6",X"19",X"D6",X"D9",X"D5",X"39",X"D6",X"49",X"D6",X"59",X"D6",
		X"CE",X"5F",X"DE",X"5F",X"EE",X"5F",X"49",X"D6",X"8E",X"5D",X"9E",X"5D",X"AE",X"5D",X"BE",X"5D",
		X"0E",X"5F",X"AE",X"5E",X"7E",X"5E",X"CE",X"5D",X"DE",X"5E",X"0E",X"5F",X"6E",X"5F",X"3E",X"5F",
		X"6E",X"5F",X"9E",X"5F",X"0E",X"5F",X"DE",X"5D",X"EE",X"5D",X"FE",X"5D",X"0E",X"5E",X"1E",X"5F",
		X"BE",X"5E",X"8E",X"5E",X"1E",X"5E",X"EE",X"5E",X"1E",X"5F",X"6E",X"5F",X"4E",X"5F",X"7E",X"5F",
		X"AE",X"5F",X"1E",X"5F",X"2E",X"5E",X"3E",X"5E",X"4E",X"5E",X"5E",X"5E",X"2E",X"5F",X"CE",X"5E",
		X"9E",X"5E",X"6E",X"5E",X"FE",X"5E",X"2E",X"5F",X"6E",X"5F",X"5E",X"5F",X"8E",X"5F",X"BE",X"5F",
		X"2E",X"5F",X"32",X"BD",X"F2",X"BC",X"02",X"BD",X"0A",X"BD",X"72",X"BD",X"42",X"BD",X"52",X"BD",
		X"FA",X"BC",X"62",X"BD",X"72",X"BD",X"82",X"BD",X"82",X"BD",X"92",X"BD",X"A2",X"BD",X"72",X"BD",
		X"3A",X"BD",X"12",X"BD",X"22",X"BD",X"2A",X"BD",X"7A",X"BD",X"4A",X"BD",X"5A",X"BD",X"1A",X"BD",
		X"6A",X"BD",X"7A",X"BD",X"82",X"BD",X"8A",X"BD",X"9A",X"BD",X"AA",X"BD",X"7A",X"BD",X"48",X"48",
		X"33",X"48",X"48",X"48",X"48",X"48",X"20",X"20",X"20",X"20",X"20",X"40",X"18",X"20",X"48",X"48",
		X"48",X"48",X"48",X"48",X"38",X"48",X"14",X"1C",X"10",X"18",X"20",X"1E",X"1F",X"28",X"15",X"20",
		X"1A",X"20",X"11",X"20",X"1B",X"30",X"22",X"48",X"10",X"48",X"20",X"26",X"30",X"48",X"40",X"40",
		X"40",X"40",X"40",X"40",X"40",X"40",X"40",X"40",X"26",X"40",X"40",X"40",X"40",X"40",X"30",X"20",
		X"25",X"0F",X"1C",X"11",X"2E",X"0D",X"28",X"23",X"0E",X"0E",X"48",X"19",X"32",X"0E",X"38",X"30",
		X"35",X"38",X"38",X"36",X"3E",X"30",X"0E",X"30",X"10",X"0E",X"2E",X"2C",X"36",X"30",X"39",X"31",
		X"39",X"03",X"00",X"38",X"2F",X"38",X"05",X"20",X"18",X"0B",X"00",X"2E",X"1C",X"27",X"14",X"36",
		X"17",X"35",X"17",X"38",X"17",X"0A",X"26",X"03",X"24",X"3E",X"18",X"39",X"2C",X"38",X"2E",X"27",
		X"18",X"1D",X"30",X"08",X"38",X"07",X"38",X"21",X"12",X"1D",X"32",X"08",X"38",X"07",X"06",X"2F",
		X"25",X"14",X"06",X"0F",X"2C",X"15",X"15",X"30",X"17",X"15",X"37",X"24",X"2D",X"22",X"0F",X"1F",
		X"1F",X"0F",X"0F",X"0F",X"0F",X"1F",X"03",X"1F",X"07",X"03",X"03",X"1F",X"1F",X"1F",X"0F",X"0F",
		X"0F",X"03",X"0F",X"0F",X"0F",X"0F",X"07",X"07",X"03",X"03",X"0F",X"0F",X"03",X"01",X"0F",X"0F",
		X"0F",X"0F",X"0F",X"0F",X"07",X"03",X"01",X"03",X"01",X"03",X"01",X"01",X"03",X"01",X"0F",X"07",
		X"07",X"07",X"03",X"1F",X"1F",X"1F",X"0F",X"07",X"07",X"07",X"03",X"1F",X"1F",X"1F",X"03",X"03",
		X"03",X"0F",X"07",X"1F",X"01",X"1F",X"03",X"03",X"03",X"0F",X"00",X"03",X"01",X"07",X"30",X"40",
		X"40",X"30",X"40",X"48",X"38",X"48",X"48",X"40",X"40",X"40",X"40",X"48",X"38",X"28",X"08",X"38",
		X"34",X"30",X"38",X"07",X"30",X"08",X"07",X"3C",X"39",X"37",X"00",X"07",X"30",X"08",X"07",X"0F",
		X"0F",X"07",X"0F",X"01",X"07",X"03",X"01",X"0F",X"0F",X"01",X"0F",X"01",X"07",X"07",X"3C",X"48",
		X"30",X"30",X"30",X"18",X"48",X"17",X"54",X"48",X"28",X"20",X"18",X"2C",X"48",X"17",X"31",X"29",
		X"08",X"08",X"2F",X"11",X"3C",X"1F",X"2E",X"35",X"0D",X"10",X"23",X"13",X"04",X"20",X"07",X"0F",
		X"07",X"07",X"07",X"03",X"0F",X"01",X"01",X"0F",X"07",X"0F",X"07",X"00",X"0F",X"01",X"20",X"40",
		X"28",X"20",X"1B",X"40",X"20",X"20",X"40",X"30",X"15",X"37",X"38",X"40",X"20",X"28",X"10",X"14",
		X"39",X"06",X"28",X"29",X"06",X"05",X"0C",X"15",X"18",X"17",X"3A",X"28",X"11",X"2F",X"0F",X"01",
		X"01",X"03",X"1F",X"07",X"03",X"03",X"03",X"01",X"1F",X"01",X"00",X"07",X"03",X"03",X"38",X"28",
		X"38",X"38",X"30",X"18",X"30",X"40",X"36",X"20",X"38",X"40",X"20",X"28",X"28",X"38",X"07",X"08",
		X"39",X"0D",X"0B",X"0E",X"18",X"27",X"15",X"23",X"0F",X"37",X"14",X"2C",X"2D",X"35",X"01",X"01",
		X"01",X"01",X"01",X"07",X"03",X"01",X"01",X"03",X"01",X"01",X"03",X"03",X"03",X"01",X"18",X"46",
		X"38",X"48",X"38",X"38",X"38",X"20",X"28",X"40",X"38",X"48",X"28",X"20",X"38",X"48",X"17",X"0C",
		X"08",X"35",X"07",X"08",X"32",X"1C",X"30",X"37",X"0B",X"3D",X"1B",X"1D",X"32",X"35",X"07",X"03",
		X"07",X"03",X"07",X"07",X"07",X"03",X"07",X"0F",X"03",X"01",X"07",X"07",X"07",X"03",X"30",X"45",
		X"15",X"40",X"30",X"1C",X"1C",X"10",X"38",X"1C",X"30",X"1A",X"40",X"30",X"2C",X"40",X"19",X"08",
		X"33",X"27",X"14",X"03",X"19",X"16",X"1B",X"38",X"37",X"28",X"15",X"06",X"22",X"27",X"03",X"07",
		X"07",X"03",X"01",X"07",X"07",X"1F",X"01",X"07",X"03",X"07",X"03",X"03",X"03",X"03",X"28",X"1C",
		X"1C",X"20",X"10",X"20",X"20",X"24",X"28",X"0D",X"0B",X"30",X"28",X"14",X"24",X"24",X"0D",X"28",
		X"28",X"07",X"16",X"17",X"07",X"27",X"0D",X"18",X"17",X"2F",X"28",X"2E",X"35",X"29",X"01",X"03",
		X"01",X"01",X"03",X"01",X"03",X"00",X"01",X"0F",X"0F",X"01",X"00",X"01",X"03",X"01",X"00",X"00",
		X"01",X"02",X"03",X"00",X"00",X"04",X"05",X"00",X"06",X"07",X"00",X"08",X"00",X"00",X"00",X"00",
		X"00",X"01",X"02",X"03",X"04",X"00",X"00",X"05",X"06",X"07",X"08",X"00",X"00",X"00",X"00",X"00",
		X"01",X"02",X"00",X"03",X"04",X"05",X"00",X"00",X"06",X"00",X"00",X"07",X"00",X"08",X"63",X"00");
begin
process(clk)
begin
	if rising_edge(clk) then
		data <= rom_data(to_integer(unsigned(addr)));
	end if;
end process;
end architecture;
