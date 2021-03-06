library ieee;
use ieee.std_logic_1164.all,ieee.numeric_std.all;

entity obj2 is
port (
	clk  : in  std_logic;
	addr : in  std_logic_vector(10 downto 0);
	data : out std_logic_vector(7 downto 0)
);
end entity;

architecture prom of obj2 is
	type rom is array(0 to  2047) of std_logic_vector(7 downto 0);
	signal rom_data: rom := (
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"18",X"3B",X"3F",X"3F",X"3F",X"9F",X"FD",
		X"00",X"00",X"00",X"06",X"0F",X"1F",X"1F",X"3D",X"3C",X"3D",X"3F",X"1F",X"1A",X"80",X"C0",X"E3",
		X"00",X"00",X"00",X"00",X"00",X"18",X"0C",X"1C",X"1C",X"3C",X"7E",X"FF",X"FF",X"FD",X"FC",X"DE",
		X"00",X"00",X"00",X"00",X"1C",X"9C",X"CC",X"CE",X"DE",X"DE",X"DC",X"EC",X"4C",X"84",X"80",X"C0",
		X"00",X"00",X"00",X"00",X"00",X"80",X"CC",X"CE",X"EE",X"E7",X"EF",X"9F",X"1E",X"DE",X"DF",X"EF",
		X"00",X"00",X"00",X"0C",X"7E",X"FF",X"FF",X"E4",X"C1",X"E5",X"47",X"87",X"83",X"D0",X"D8",X"D4",
		X"00",X"00",X"00",X"0C",X"7E",X"FF",X"FF",X"E4",X"C1",X"E5",X"47",X"87",X"83",X"D0",X"D8",X"D4",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"80",X"C0",X"E0",X"E0",X"E0",X"F0",X"F0",X"F0",X"FC",X"FE",X"FE",X"FC",X"FF",X"FF",
		X"00",X"00",X"80",X"C0",X"E0",X"E0",X"E0",X"F0",X"F0",X"F0",X"FC",X"FE",X"FE",X"7E",X"FE",X"FC",
		X"00",X"06",X"0F",X"1F",X"FD",X"FC",X"F8",X"F8",X"B8",X"FC",X"7C",X"1C",X"1C",X"3C",X"00",X"00",
		X"00",X"06",X"0F",X"1F",X"FD",X"FC",X"F8",X"F8",X"F8",X"FC",X"FC",X"DC",X"1C",X"1C",X"00",X"00",
		X"1E",X"1C",X"1C",X"1C",X"FC",X"FC",X"F8",X"FB",X"FF",X"DF",X"FD",X"38",X"00",X"00",X"00",X"00",
		X"1E",X"1C",X"1C",X"1C",X"FC",X"FC",X"F8",X"FB",X"FF",X"FF",X"FD",X"78",X"00",X"00",X"00",X"00",
		X"06",X"0E",X"9E",X"9C",X"0E",X"1E",X"8E",X"CE",X"C6",X"C4",X"80",X"00",X"00",X"E0",X"F4",X"E4",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"80",X"E0",X"E0",X"F0",X"EC",X"0B",
		X"00",X"00",X"00",X"00",X"03",X"87",X"8F",X"DF",X"EF",X"F6",X"F2",X"F0",X"E0",X"C0",X"80",X"C0",
		X"80",X"C0",X"C0",X"E0",X"E0",X"E0",X"10",X"C0",X"10",X"E0",X"E0",X"E0",X"C0",X"C0",X"80",X"00",
		X"00",X"00",X"00",X"00",X"08",X"18",X"F8",X"FC",X"FC",X"FC",X"FC",X"FC",X"E8",X"E0",X"E0",X"E0",
		X"00",X"00",X"00",X"00",X"10",X"38",X"F8",X"F8",X"F8",X"F8",X"F8",X"FC",X"FC",X"FC",X"EC",X"C4",
		X"03",X"07",X"0D",X"08",X"00",X"00",X"03",X"9F",X"1D",X"F8",X"F8",X"F8",X"F8",X"F0",X"F0",X"A0",
		X"00",X"F0",X"F8",X"FF",X"FF",X"FF",X"DD",X"F8",X"FE",X"FE",X"DE",X"02",X"00",X"00",X"00",X"00",
		X"1C",X"1E",X"FC",X"FC",X"FC",X"F8",X"F0",X"D1",X"F3",X"F9",X"F9",X"00",X"00",X"00",X"00",X"00",
		X"00",X"38",X"FF",X"FF",X"FF",X"FF",X"FD",X"EC",X"FC",X"FC",X"FE",X"DE",X"CC",X"98",X"00",X"00",
		X"0E",X"1E",X"3C",X"FC",X"FC",X"FF",X"FF",X"EF",X"FF",X"7D",X"30",X"10",X"00",X"00",X"00",X"00",
		X"1C",X"1A",X"3C",X"FC",X"FC",X"FC",X"FE",X"FF",X"FF",X"DF",X"FD",X"CC",X"C0",X"40",X"00",X"00",
		X"00",X"78",X"FC",X"FC",X"FC",X"F8",X"F8",X"F0",X"C0",X"E0",X"F0",X"F0",X"F0",X"F0",X"E0",X"00",
		X"30",X"58",X"E8",X"EC",X"74",X"B4",X"B4",X"B4",X"B4",X"AC",X"AC",X"A8",X"D0",X"60",X"00",X"00",
		X"00",X"00",X"00",X"E0",X"F0",X"F8",X"FC",X"FC",X"FC",X"FC",X"F8",X"F0",X"E0",X"00",X"00",X"00",
		X"00",X"F0",X"F8",X"FC",X"FE",X"FE",X"3E",X"DE",X"DE",X"3E",X"FE",X"FE",X"FC",X"F8",X"F0",X"00",
		X"E0",X"F0",X"50",X"08",X"6C",X"CC",X"A0",X"FE",X"FE",X"F8",X"D0",X"FB",X"FF",X"FF",X"3E",X"0C",
		X"38",X"BC",X"9C",X"DC",X"FC",X"BC",X"F8",X"F8",X"F8",X"FC",X"BE",X"FE",X"DE",X"8C",X"8C",X"00",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"DF",X"87",X"97",X"FF",X"D3",X"C3",X"D3",X"FB",X"D3",X"C3",X"D3",X"FF",X"97",X"87",X"DD",
		X"00",X"00",X"00",X"00",X"00",X"40",X"00",X"40",X"00",X"40",X"00",X"40",X"00",X"00",X"00",X"00",
		X"C0",X"80",X"80",X"80",X"F8",X"F8",X"F8",X"F8",X"F8",X"F8",X"F8",X"F8",X"F8",X"B8",X"18",X"08",
		X"02",X"06",X"0E",X"FE",X"FE",X"FE",X"FE",X"FE",X"FE",X"FE",X"FE",X"F8",X"E0",X"C0",X"C0",X"C0",
		X"10",X"30",X"70",X"F0",X"F0",X"F0",X"F0",X"F0",X"F0",X"F0",X"F0",X"F0",X"80",X"80",X"80",X"C0",
		X"00",X"00",X"00",X"00",X"00",X"04",X"04",X"04",X"04",X"08",X"0C",X"0C",X"14",X"1C",X"1C",X"0C",
		X"00",X"00",X"00",X"E0",X"F0",X"F8",X"FC",X"FC",X"FE",X"BE",X"7F",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FE",X"FF",X"FF",X"3F",X"7F",X"3F",X"9F",X"EE",X"EE",X"FE",X"FE",X"FC",X"FC",X"FC",X"38",X"00",
		X"00",X"00",X"00",X"30",X"78",X"FC",X"FC",X"DE",X"9E",X"DF",X"DF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"00",X"00",X"00",X"00",X"03",X"3C",X"60",X"C0",X"80",X"00",X"00",X"00",X"00",X"01",X"03",X"E0",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"40",X"E0",X"70",X"B0",X"F8",X"18",X"00",
		X"FF",X"00",X"00",X"00",X"E0",X"E0",X"E0",X"E0",X"E0",X"E0",X"E0",X"E0",X"E0",X"E0",X"FF",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"FF",X"00",X"80",X"80",X"80",X"80",X"80",X"80",X"80",X"80",X"80",X"80",X"00",X"00",X"FF",
		X"FE",X"C2",X"C2",X"C2",X"C2",X"C2",X"C2",X"C2",X"C2",X"C2",X"E2",X"12",X"0A",X"04",X"F8",X"00",
		X"00",X"F8",X"04",X"0A",X"12",X"0A",X"7A",X"72",X"72",X"72",X"72",X"72",X"72",X"72",X"72",X"FE",
		X"40",X"80",X"00",X"00",X"00",X"42",X"33",X"07",X"07",X"07",X"07",X"07",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"70",X"F8",X"FF",X"FF",X"FF",X"FF",X"FF",X"7F",
		X"3F",X"7F",X"3E",X"19",X"07",X"03",X"00",X"00",X"00",X"00",X"40",X"80",X"00",X"00",X"00",X"00",
		X"FC",X"F8",X"F8",X"F4",X"F0",X"F0",X"F0",X"E8",X"E0",X"E0",X"E0",X"C0",X"C0",X"C0",X"C0",X"80",
		X"80",X"80",X"80",X"80",X"80",X"80",X"80",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"0C",X"0E",X"0F",X"0F",X"0F",X"07",X"07",X"03",X"03",X"01",X"00",X"00",X"00",X"00",
		X"00",X"00",X"10",X"70",X"70",X"F0",X"F0",X"F0",X"F0",X"E0",X"C0",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"80",X"80",X"00",X"18",X"14",X"0E",X"14",X"18",X"00",X"80",X"80",X"00",X"00",X"00",
		X"C0",X"80",X"00",X"00",X"00",X"08",X"08",X"1C",X"80",X"80",X"80",X"00",X"00",X"00",X"00",X"00",
		X"C0",X"80",X"00",X"00",X"00",X"10",X"10",X"38",X"80",X"E0",X"FC",X"F8",X"F0",X"00",X"00",X"00",
		X"00",X"08",X"06",X"01",X"06",X"18",X"FE",X"7F",X"F3",X"E3",X"E7",X"C3",X"C7",X"83",X"87",X"02",
		X"04",X"02",X"01",X"02",X"04",X"1A",X"3F",X"FF",X"7B",X"F7",X"FB",X"77",X"7B",X"77",X"7B",X"32",
		X"00",X"08",X"20",X"C0",X"A8",X"D0",X"D8",X"F8",X"D8",X"D4",X"A0",X"D0",X"00",X"08",X"40",X"00",
		X"00",X"00",X"00",X"20",X"80",X"40",X"A0",X"A0",X"A8",X"40",X"80",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"80",X"40",X"A0",X"D0",X"D0",X"D0",X"D0",X"A0",X"40",X"80",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"80",X"40",X"A0",X"20",X"20",X"A0",X"40",X"80",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"C0",X"00",X"C0",X"C0",X"40",X"00",X"00",X"C0",X"C0",X"C0",X"00",X"C0",X"C0",X"40",X"00",X"40",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"FF",X"FF",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"06",X"0F",X"FF",X"FF",X"0B",X"06",X"00",X"00",X"00",X"00",X"00",
		X"01",X"07",X"0F",X"0F",X"1F",X"1D",X"1D",X"1F",X"0F",X"0F",X"0F",X"0D",X"0C",X"0C",X"0E",X"0E",
		X"01",X"07",X"0F",X"0F",X"1F",X"1D",X"1D",X"3F",X"7F",X"EF",X"C7",X"81",X"80",X"00",X"00",X"00",
		X"01",X"FF",X"F7",X"FF",X"F7",X"F7",X"FF",X"F7",X"F7",X"FF",X"F7",X"F7",X"FF",X"01",X"FE",X"01",
		X"00",X"01",X"07",X"0D",X"B8",X"E4",X"84",X"CA",X"CA",X"C4",X"E4",X"B8",X"0D",X"07",X"01",X"00",
		X"E0",X"F0",X"F0",X"F0",X"F0",X"70",X"F0",X"F0",X"F0",X"70",X"F0",X"F0",X"70",X"F0",X"F0",X"60",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"80",X"20",X"60",X"00",X"00",X"00",
		X"00",X"00",X"1C",X"3E",X"F0",X"E0",X"80",X"00",X"80",X"80",X"E0",X"F0",X"FE",X"FE",X"DC",X"88",
		X"00",X"00",X"00",X"00",X"00",X"FC",X"FE",X"A8",X"54",X"FE",X"FE",X"FC",X"60",X"60",X"60",X"C0",
		X"80",X"00",X"00",X"00",X"80",X"00",X"04",X"02",X"FC",X"00",X"00",X"80",X"00",X"00",X"00",X"80",
		X"03",X"03",X"83",X"43",X"73",X"3B",X"0F",X"8F",X"8F",X"0F",X"3B",X"73",X"43",X"83",X"03",X"03",
		X"03",X"63",X"93",X"93",X"9B",X"0B",X"0F",X"6F",X"6F",X"0F",X"0B",X"9B",X"93",X"93",X"63",X"03",
		X"C3",X"C3",X"DB",X"DB",X"FF",X"E7",X"E7",X"FF",X"FF",X"E7",X"E7",X"FF",X"DB",X"DB",X"C3",X"C3",
		X"1B",X"1B",X"1F",X"1F",X"1F",X"1F",X"1F",X"1F",X"1F",X"1F",X"1F",X"1F",X"1F",X"1F",X"1B",X"1B",
		X"00",X"00",X"00",X"00",X"01",X"07",X"1F",X"7F",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"7F",
		X"7F",X"3F",X"3F",X"1F",X"0F",X"46",X"52",X"50",X"54",X"54",X"14",X"44",X"54",X"40",X"50",X"40",
		X"50",X"01",X"D0",X"C2",X"C0",X"C4",X"C0",X"C8",X"00",X"50",X"E0",X"D8",X"E8",X"F0",X"E0",X"C0",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"01",X"07",X"1F",X"7F",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"7F",
		X"7F",X"3F",X"3F",X"1F",X"0F",X"46",X"52",X"50",X"54",X"54",X"14",X"44",X"54",X"40",X"50",X"40",
		X"50",X"01",X"10",X"02",X"18",X"10",X"18",X"2C",X"BE",X"3E",X"00",X"00",X"00",X"00",X"00",X"00",
		X"0C",X"1E",X"03",X"93",X"CB",X"6F",X"3F",X"DF",X"1F",X"3F",X"7F",X"EF",X"CB",X"A3",X"1E",X"0C",
		X"00",X"08",X"00",X"64",X"CE",X"06",X"06",X"06",X"06",X"26",X"46",X"06",X"0E",X"04",X"30",X"00",
		X"00",X"E0",X"10",X"E8",X"F4",X"F4",X"FB",X"FB",X"FB",X"FB",X"F4",X"F4",X"E8",X"10",X"E0",X"00",
		X"00",X"C0",X"20",X"10",X"08",X"04",X"04",X"04",X"04",X"04",X"04",X"08",X"10",X"20",X"C0",X"00",
		X"00",X"00",X"00",X"80",X"40",X"20",X"10",X"10",X"10",X"10",X"20",X"40",X"80",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"80",X"40",X"20",X"20",X"40",X"80",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"80",X"88",X"10",X"00",X"00",X"00",X"0C",X"00",X"00",X"00",X"10",X"88",X"80",X"00",
		X"F0",X"F9",X"FF",X"3F",X"8F",X"DF",X"2D",X"F0",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"E7",X"F7",X"F7",X"7F",X"7D",X"B9",X"BC",X"1D",X"1F",X"0E",X"00",X"00",X"00",X"00",X"00",X"00",
		X"DE",X"9F",X"9F",X"9F",X"CF",X"E1",X"E1",X"80",X"F0",X"F8",X"FD",X"7F",X"1F",X"0E",X"00",X"00",
		X"D0",X"D8",X"A0",X"04",X"0C",X"3E",X"BF",X"1F",X"1F",X"0E",X"00",X"00",X"00",X"00",X"00",X"00",
		X"E6",X"E0",X"C0",X"C0",X"B8",X"78",X"F0",X"F0",X"E0",X"80",X"00",X"00",X"00",X"00",X"00",X"00",
		X"D4",X"C1",X"83",X"87",X"47",X"E5",X"C1",X"E4",X"FF",X"FF",X"7E",X"0C",X"00",X"00",X"00",X"00",
		X"D4",X"C1",X"83",X"87",X"47",X"E5",X"C1",X"E4",X"FF",X"FF",X"7E",X"0C",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"BF",X"1B",X"02",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"DE",X"CF",X"C7",X"0F",X"0E",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"04",X"1C",X"3E",X"BE",X"FE",X"FC",X"E4",X"C2",X"D0",X"D8",
		X"D4",X"D4",X"C2",X"E6",X"FC",X"DC",X"3C",X"3E",X"1E",X"0C",X"18",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"5E",X"3F",X"07",X"05",X"09",X"7B",X"01",X"3D",X"7F",X"7F",X"BF",X"FF",X"FF",X"F0",X"F8",X"70",
		X"EE",X"CE",X"DE",X"DE",X"DC",X"8C",X"80",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"97",X"9F",X"DF",X"DF",X"CD",X"C0",X"88",X"1E",X"3E",X"3E",X"1E",X"02",X"00",X"00",X"00",X"00",
		X"F0",X"F2",X"F3",X"E3",X"E3",X"C7",X"8F",X"AD",X"E1",X"C0",X"C0",X"C0",X"80",X"80",X"00",X"00",
		X"00",X"00",X"00",X"C0",X"E0",X"D0",X"D0",X"D0",X"90",X"20",X"40",X"80",X"00",X"00",X"00",X"00",
		X"80",X"00",X"00",X"80",X"00",X"00",X"00",X"00",X"85",X"CF",X"CF",X"FF",X"C6",X"C2",X"D0",X"D8",
		X"D4",X"D4",X"C2",X"C6",X"FF",X"EF",X"CF",X"85",X"80",X"80",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"04",X"1C",X"3E",X"BE",X"FE",X"FC",X"E4",X"C2",X"D0",X"D8",
		X"C0",X"20",X"20",X"20",X"C0",X"00",X"C0",X"20",X"20",X"20",X"C0",X"00",X"20",X"E0",X"20",X"00",
		X"C0",X"20",X"20",X"C0",X"00",X"C0",X"20",X"20",X"C0",X"00",X"20",X"20",X"A0",X"60",X"20",X"00",
		X"C0",X"20",X"20",X"C0",X"00",X"C0",X"20",X"20",X"C0",X"00",X"C0",X"20",X"20",X"20",X"20",X"00",
		X"C0",X"20",X"20",X"20",X"C0",X"00",X"C0",X"20",X"20",X"20",X"C0",X"00",X"E0",X"40",X"40",X"C0",
		X"C0",X"20",X"20",X"C0",X"00",X"C0",X"20",X"20",X"C0",X"00",X"C0",X"20",X"20",X"20",X"C0",X"00",
		X"C0",X"20",X"C0",X"00",X"C0",X"20",X"C0",X"00",X"20",X"20",X"A0",X"60",X"00",X"E0",X"00",X"00",
		X"C0",X"20",X"C0",X"00",X"C0",X"20",X"C0",X"00",X"C0",X"20",X"20",X"C0",X"00",X"E0",X"00",X"00");
begin
process(clk)
begin
	if rising_edge(clk) then
		data <= rom_data(to_integer(unsigned(addr)));
	end if;
end process;
end architecture;
