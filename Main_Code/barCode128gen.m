function [file,data] = barCode128gen(code)
% BARCODE128GEN Generate a barcode image (BMP file) using GS1-128 symbology
% specifications (section 5.3)
% http://www.gs1tw.org/twct/gs1w/download/GS_Section_5-3_V7.pdf
%
% [file,text] = barCode128gen(code)
%
% Where: code => number or alphanumeric string.
%        file <= barcode image file name.
%        text <= standarized string code.
%
% Example:
% barCode128gen(123.123456789);
% barCode128gen('(0123)0123456789');
% barCode128gen('GS01-0128');
%
% See also NUM2STR.

% Pedro Villena Salinas
% pedro.villena@ieee.org
% release 1.1 (16JAN2014)

% R1.1
% - Ampliacion de los comentarios.
% - Estandarizaci�n del codigo alfanumerico de entrada para que este sea
%   correctamente y eficientemente codificado.
% - Actualizaci�n de la logica de funcionamiento del "Function Code".
% - Desarrollo de la funcion string2code, para la conversi�n de una cadena
%   de caracteres a una valor en el sistema GS1.
% - Se ha probado los resultados en mediante una aplicaci�n de mobil para el
%   reconocimiento de codigos de barras.
% - Eliminaci�n de los caracteres no permitidos por el OS para la creaci�n del
%   archivo de imagen BMP.
% - Se ha incluido el nombre del archivo de la imagen en los parametros de
%   salida.

% NOTES:
% - 

%% Variables Initialization
[data,code] = code2standard(code); % code standardization

%CODE-128  Value|CodeA|ASCII_CodeA|CodeB|ASCII_CodeB|CodeC|Widths|Pattern
CODE128{1}   = {  0, 'space','32', 'space', '32',    '00',  [2 1 2 2 2 2],    [1 1 0 1 1 0 0 1 1 0 0]};
CODE128{2}   = {  1,     '!','33',     '!', '33',    '01',  [2 2 2 1 2 2],    [1 1 0 0 1 1 0 1 1 0 0]};
CODE128{3}   = {  2,     '"','34',     '"', '34',    '02',  [2 2 2 2 2 1],    [1 1 0 0 1 1 0 0 1 1 0]};
CODE128{4}   = {  3,     '#','35',     '#', '35',    '03',  [1 2 1 2 2 3],    [1 0 0 1 0 0 1 1 0 0 0]};
CODE128{5}   = {  4,     '$','36',     '$', '36',    '04',  [1 2 1 3 2 2],    [1 0 0 1 0 0 0 1 1 0 0]};
CODE128{6}   = {  5,     '%','37',     '%', '37',    '05',  [1 3 1 2 2 2],    [1 0 0 0 1 0 0 1 1 0 0]};
CODE128{7}   = {  5,     '&','38',     '&', '38',    '06',  [1 2 2 2 1 3],    [1 0 0 1 1 0 0 1 0 0 0]};
CODE128{8}   = {  7,    '''','39',    '''', '39',    '07',  [1 2 2 3 1 2],    [1 0 0 1 1 0 0 0 1 0 0]};
CODE128{9}   = {  8,     '(','40',     '(', '40',    '08',  [1 3 2 2 1 2],    [1 0 0 0 1 1 0 0 1 0 0]};
CODE128{10}  = {  9,     ')','41',     ')', '41',    '09',  [2 2 1 2 1 3],    [1 1 0 0 1 0 0 1 0 0 0]};
CODE128{11}  = { 10,     '*','42',     '*', '42',    '10',  [2 2 1 3 1 2],    [1 1 0 0 1 0 0 0 1 0 0]};
CODE128{12}  = { 11,     '+','43',     '+', '43',    '11',  [2 3 1 2 1 2],    [1 1 0 0 0 1 0 0 1 0 0]};
CODE128{13}  = { 12,     ';','44',     ';', '44',    '12',  [1 1 2 2 3 2],    [1 0 1 1 0 0 1 1 1 0 0]};
CODE128{14}  = { 13,     '-','45',     '-', '45',    '13',  [1 2 2 1 3 2],    [1 0 0 1 1 0 1 1 1 0 0]};
CODE128{15}  = { 14,     '.','46',     '.', '46',    '14',  [1 2 2 2 3 1],    [1 0 0 1 1 0 0 1 1 1 0]};
CODE128{16}  = { 15,     '/','47',     '/', '47',    '15',  [1 1 3 2 2 2],    [1 0 1 1 1 0 0 1 1 0 0]};
CODE128{17}  = { 16,     '0','48',     '0', '48',    '16',  [1 2 3 1 2 2],    [1 0 0 1 1 1 0 1 1 0 0]};
CODE128{18}  = { 17,     '1','49',     '1', '49',    '17',  [1 2 3 2 2 1],    [1 0 0 1 1 1 0 0 1 1 0]};
CODE128{19}  = { 18,     '2','50',     '2', '50',    '18',  [2 2 3 2 1 1],    [1 1 0 0 1 1 1 0 0 1 0]};
CODE128{20}  = { 19,     '3','51',     '3', '51',    '19',  [2 2 1 1 3 2],    [1 1 0 0 1 0 1 1 1 0 0]};
CODE128{21}  = { 20,     '4','52',     '4', '52',    '20',  [2 2 1 2 3 1],    [1 1 0 0 1 0 0 1 1 1 0]};
CODE128{22}  = { 21,     '5','53',     '5', '53',    '21',  [2 1 3 2 1 2],    [1 1 0 1 1 1 0 0 1 0 0]};
CODE128{23}  = { 22,     '6','54',     '6', '54',    '22',  [2 2 3 1 1 2],    [1 1 0 0 1 1 1 0 1 0 0]};
CODE128{24}  = { 23,     '7','55',     '7', '55',    '23',  [3 1 2 1 3 1],    [1 1 1 0 1 1 0 1 1 1 0]};
CODE128{25}  = { 24,     '8','56',     '8', '56',    '24',  [3 1 1 2 2 2],    [1 1 1 0 1 0 0 1 1 0 0]};
CODE128{26}  = { 25,     '9','57',     '9', '57',    '25',  [3 2 1 1 2 2],    [1 1 1 0 0 1 0 1 1 0 0]};
CODE128{27}  = { 26,     ':','58',     ':', '58',    '26',  [3 2 1 2 2 1],    [1 1 1 0 0 1 0 0 1 1 0]};
CODE128{28}  = { 27,     ';','59',     ';', '59',    '27',  [3 1 2 2 1 2],    [1 1 1 0 1 1 0 0 1 0 0]};
CODE128{29}  = { 28,     '<','60',     '<', '60',    '28',  [3 2 2 1 1 2],    [1 1 1 0 0 1 1 0 1 0 0]};
CODE128{30}  = { 29,     '=','61',     '=', '61',    '29',  [3 2 2 2 1 1],    [1 1 1 0 0 1 1 0 0 1 0]};
CODE128{31}  = { 30,     '>','62',     '>', '62',    '30',  [2 1 2 1 2 3],    [1 1 0 1 1 0 1 1 0 0 0]};
CODE128{32}  = { 31,     '?','63',     '?', '63',    '31',  [2 1 2 3 2 1],    [1 1 0 1 1 0 0 0 1 1 0]};
CODE128{33}  = { 32,     '@','64',     '@', '64',    '32',  [2 3 2 1 2 1],    [1 1 0 0 0 1 1 0 1 1 0]};
CODE128{34}  = { 33,     'A','65',     'A', '65',    '33',  [1 1 1 3 2 3],    [1 0 1 0 0 0 1 1 0 0 0]};
CODE128{35}  = { 34,     'B','66',     'B', '66',    '34',  [1 3 1 1 2 3],    [1 0 0 0 1 0 1 1 0 0 0]};
CODE128{36}  = { 35,     'C','67',     'C', '67',    '35',  [1 3 1 3 2 1],    [1 0 0 0 1 0 0 0 1 1 0]};
CODE128{37}  = { 36,     'D','68',     'D', '68',    '36',  [1 1 2 3 1 3],    [1 0 1 1 0 0 0 1 0 0 0]};
CODE128{38}  = { 37,     'E','69',     'E', '69',    '37',  [1 3 2 1 1 3],    [1 0 0 0 1 1 0 1 0 0 0]};
CODE128{39}  = { 38,     'F','70',     'F', '70',    '38',  [1 3 2 3 1 1],    [1 0 0 0 1 1 0 0 0 1 0]};
CODE128{40}  = { 39,     'G','71',     'G', '71',    '39',  [2 1 1 3 1 3],    [1 1 0 1 0 0 0 1 0 0 0]};
CODE128{41}  = { 40,     'H','72',     'H', '72',    '40',  [2 3 1 1 1 3],    [1 1 0 0 0 1 0 1 0 0 0]};
CODE128{42}  = { 41,     'I','73',     'I', '73',    '41',  [2 3 1 3 1 1],    [1 1 0 0 0 1 0 0 0 1 0]};
CODE128{43}  = { 42,     'J','74',     'J', '74',    '42',  [1 1 2 1 3 3],    [1 0 1 1 0 1 1 1 0 0 0]};
CODE128{44}  = { 43,     'K','75',     'K', '75',    '43',  [1 1 2 3 3 1],    [1 0 1 1 0 0 0 1 1 1 0]};
CODE128{45}  = { 44,     'L','76',     'L', '76',    '44',  [1 3 2 1 3 1],    [1 0 0 0 1 1 0 1 1 1 0]};
CODE128{46}  = { 45,     'M','77',     'M', '77',    '45',  [1 1 3 1 2 3],    [1 0 1 1 1 0 1 1 0 0 0]};
CODE128{47}  = { 46,     'N','78',     'N', '78',    '46',  [1 1 3 3 2 1],    [1 0 1 1 1 0 0 0 1 1 0]};
CODE128{48}  = { 47,     'O','79',     'O', '79',    '47',  [1 3 3 1 2 1],    [1 0 0 0 1 1 1 0 1 1 0]};
CODE128{49}  = { 48,     'P','80',     'P', '80',    '48',  [3 1 3 1 2 1],    [1 1 1 0 1 1 1 0 1 1 0]};
CODE128{50}  = { 49,     'Q','81',     'Q', '81',    '49',  [2 1 1 3 3 1],    [1 1 0 1 0 0 0 1 1 1 0]};
CODE128{51}  = { 50,     'R','82',     'R', '82',    '50',  [2 3 1 1 3 1],    [1 1 0 0 0 1 0 1 1 1 0]};
CODE128{52}  = { 51,     'S','83',     'S', '83',    '51',  [2 1 3 1 1 3],    [1 1 0 1 1 1 0 1 0 0 0]};
CODE128{53}  = { 52,     'T','84',     'T', '84',    '52',  [2 1 3 3 1 1],    [1 1 0 1 1 1 0 0 0 1 0]};
CODE128{54}  = { 53,     'U','85',     'U', '85',    '53',  [2 1 3 1 3 1],    [1 1 0 1 1 1 0 1 1 1 0]};
CODE128{55}  = { 54,     'V','86',     'V', '86',    '54',  [3 1 1 1 2 3],    [1 1 1 0 1 0 1 1 0 0 0]};
CODE128{56}  = { 55,     'W','87',     'W', '87',    '55',  [3 1 1 3 2 1],    [1 1 1 0 1 0 0 0 1 1 0]};
CODE128{57}  = { 56,     'X','88',     'X', '88',    '56',  [3 3 1 1 2 1],    [1 1 1 0 0 0 1 0 1 1 0]};
CODE128{58}  = { 57,     'Y','89',     'Y', '89',    '57',  [3 1 2 1 1 3],    [1 1 1 0 1 1 0 1 0 0 0]};
CODE128{59}  = { 58,     'Z','90',     'Z', '90',    '58',  [3 1 2 3 1 1],    [1 1 1 0 1 1 0 0 0 1 0]};
CODE128{60}  = { 59,     '[','91',     '[', '91',    '59',  [3 3 2 1 1 1],    [1 1 1 0 0 0 1 1 0 1 0]};
CODE128{61}  = { 60,     '\','92',     '\', '92',    '60',  [3 1 4 1 1 1],    [1 1 1 0 1 1 1 1 0 1 0]};
CODE128{62}  = { 61,     ']','93',     ']', '93',    '61',  [2 2 1 4 1 1],    [1 1 0 0 1 0 0 0 0 1 0]};
CODE128{63}  = { 62,     '^','94',     '^', '94',    '62',  [4 3 1 1 1 1],    [1 1 1 1 0 0 0 1 0 1 0]};
CODE128{64}  = { 63,     '_','95',     '_', '95',    '63',  [1 1 1 2 2 4],    [1 0 1 0 0 1 1 0 0 0 0]};
CODE128{65}  = { 64,   'nul','00',     '`', '96',    '64',  [1 1 1 4 2 2],    [1 0 1 0 0 0 0 1 1 0 0]};
CODE128{66}  = { 65,   'soh','01',     'a', '97',    '65',  [1 2 1 1 2 4],    [1 0 0 1 0 1 1 0 0 0 0]};
CODE128{67}  = { 66,   'stx','02',     'b', '98',    '66',  [1 2 1 4 2 1],    [1 0 0 1 0 0 0 0 1 1 0]};
CODE128{68}  = { 67,   'etx','03',     'c', '99',    '67',  [1 4 1 1 2 2],    [1 0 0 0 0 1 0 1 1 0 0]};
CODE128{69}  = { 68,   'eot','04',     'd','100',    '68',  [1 4 1 2 2 1],    [1 0 0 0 0 1 0 0 1 1 0]};
CODE128{70}  = { 69,   'enq','05',     'e','101',    '69',  [1 1 2 2 1 4],    [1 0 1 1 0 0 1 0 0 0 0]};
CODE128{71}  = { 70,   'ack','06',     'f','102',    '70',  [1 1 2 4 1 2],    [1 0 1 1 0 0 0 0 1 0 0]};
CODE128{72}  = { 71,   'bel','07',     'g','103',    '71',  [1 2 2 1 1 4],    [1 0 0 1 1 0 1 0 0 0 0]};
CODE128{73}  = { 72,    'bs','08',     'h','104',    '72',  [1 2 2 4 1 1],    [1 0 0 1 1 0 0 0 0 1 0]};
CODE128{74}  = { 73,    'ht','09',     'i','105',    '73',  [1 4 2 1 1 2],    [1 0 0 0 0 1 1 0 1 0 0]};
CODE128{75}  = { 74,    'lf','10',     'j','106',    '74',  [1 4 2 2 1 1],    [1 0 0 0 0 1 1 0 0 1 0]};
CODE128{76}  = { 75,    'vt','11',     'k','107',    '75',  [2 4 1 2 1 1],    [1 1 0 0 0 0 1 0 0 1 0]};
CODE128{77}  = { 76,    'ff','12',     'l','108',    '76',  [2 2 1 1 1 4],    [1 1 0 0 1 0 1 0 0 0 0]};
CODE128{78}  = { 77,    'cr','13',     'm','109',    '77',  [4 1 3 1 1 1],    [1 1 1 1 0 1 1 1 0 1 0]};
CODE128{79}  = { 78,    'so','14',     'n','110',    '78',  [2 4 1 1 1 2],    [1 1 0 0 0 0 1 0 1 0 0]};
CODE128{80}  = { 79,    'si','15',     'o','111',    '79',  [1 3 4 1 1 1],    [1 0 0 0 1 1 1 1 0 1 0]};
CODE128{81}  = { 80,   'dle','16',     'p','112',    '80',  [1 1 1 2 4 2],    [1 0 1 0 0 1 1 1 1 0 0]};
CODE128{82}  = { 81,   'dc1','17',     'q','113',    '81',  [1 2 1 1 4 2],    [1 0 0 1 0 1 1 1 1 0 0]};
CODE128{83}  = { 82,   'dc2','18',     'r','114',    '82',  [1 2 1 2 4 1],    [1 0 0 1 0 0 1 1 1 1 0]};
CODE128{84}  = { 83,   'dc3','19',     's','115',    '83',  [1 1 4 2 1 2],    [1 0 1 1 1 1 0 0 1 0 0]};
CODE128{85}  = { 84,   'dc4','20',     't','116',    '84',  [1 2 4 1 1 2],    [1 0 0 1 1 1 1 0 1 0 0]};
CODE128{86}  = { 85,   'nak','21',     'u','117',    '85',  [1 2 4 2 1 1],    [1 0 0 1 1 1 1 0 0 1 0]};
CODE128{87}  = { 86,   'syn','22',     'v','118',    '86',  [4 1 1 2 1 2],    [1 1 1 1 0 1 0 0 1 0 0]};
CODE128{88}  = { 87,   'etb','23',     'w','119',    '87',  [4 2 1 1 1 2],    [1 1 1 1 0 0 1 0 1 0 0]};
CODE128{89}  = { 88,   'can','24',     'x','120',    '88',  [4 2 1 2 1 1],    [1 1 1 1 0 0 1 0 0 1 0]};
CODE128{90}  = { 89,    'em','25',     'y','121',    '89',  [2 1 2 1 4 1],    [1 1 0 1 1 0 1 1 1 1 0]};
CODE128{91}  = { 90,   'sub','26',     'z','122',    '90',  [2 1 4 1 2 1],    [1 1 0 1 1 1 1 0 1 1 0]};
CODE128{92}  = { 91,   'esc','27',     '{','123',    '91',  [4 1 2 1 2 1],    [1 1 1 1 0 1 1 0 1 1 0]};
CODE128{93}  = { 92,    'fs','28',     '|','124',    '92',  [1 1 1 1 4 3],    [1 0 1 0 1 1 1 1 0 0 0]};
CODE128{94}  = { 93,    'gs','29',     '}','125',    '93',  [1 1 1 3 4 1],    [1 0 1 0 0 0 1 1 1 1 0]};
CODE128{95}  = { 94,    'rs','30',     '~','126',    '94',  [1 3 1 1 4 1],    [1 0 0 0 1 0 1 1 1 1 0]};
CODE128{96}  = { 95,    'us','31',   'del','127',    '95',  [1 1 4 1 1 3],    [1 0 1 1 1 1 0 1 0 0 0]};
CODE128{97}  = { 96,  'fnc3',  '',  'fnc3',   '',    '96',  [1 1 4 3 1 1],    [1 0 1 1 1 1 0 0 0 1 0]};
CODE128{98}  = { 97,  'fnc2',  '',  'fnc2',   '',    '97',  [4 1 1 1 1 3],    [1 1 1 1 0 1 0 1 0 0 0]};
CODE128{99}  = { 98, 'shift',  '', 'shift',   '',    '98',  [4 1 1 3 1 1],    [1 1 1 1 0 1 0 0 0 1 0]};
CODE128{100} = { 99, 'codeC',  '', 'codeC',   '',    '99',  [1 1 3 1 4 1],    [1 0 1 1 1 0 1 1 1 1 0]};
CODE128{101} = {100, 'codeB',  '',  'fnc4',   '', 'codeB',  [1 1 4 1 3 1],    [1 0 1 1 1 1 0 1 1 1 0]};
CODE128{102} = {101,  'fnc4',  '', 'codeA',   '', 'codeA',  [3 1 1 1 4 1],    [1 1 1 0 1 0 1 1 1 1 0]};
CODE128{103} = {102,  'fnc1',  '',  'fnc1',   '',  'fnc1',  [4 1 1 1 3 1],    [1 1 1 1 0 1 0 1 1 1 0]};
CODE128{104} = {103,'startA',  '','startA',   '','startA',  [2 1 1 4 1 2],    [1 1 0 1 0 0 0 0 1 0 0]};
CODE128{105} = {104,'startB',  '','startB',   '','startB',  [2 1 1 2 1 4],    [1 1 0 1 0 0 1 0 0 0 0]};
CODE128{106} = {105,'startC',  '','startC',   '','startC',  [2 1 1 2 3 2],    [1 1 0 1 0 0 1 1 1 0 0]};
CODE128{107} = {106,  'stop',  '',  'stop',   '',  'stop',[2 3 3 1 1 1 2],[1 1 0 0 0 1 1 1 0 1 0 1 1]};

%% Bar Code

%Start Character, 
% - StartA define the corresponding code set CodeA to be used initially in the symbol.
%   CodeA includes all of the standard upper case alphanumeric characters and
%   punctuation characters together with the symbology elements (e.g., characters
%   with ASCII values from 00 to 95) and seven special characters.
% - StartB define the corresponding code set CodeB to be used initially in the symbol.
%   CodeB includes all of the standard upper case alphanumeric characters and
%   punctuation characters together with the lowercase alphabetic characters
%   (e.g., ASCII characters 32 to 127 inclusive) and seven special characters.
% - StartC define the corresponding code set CodeC to be used initially in the symbol.
%   CodeC includes the set of 100 digit pairs from 00 to 99 inclusive, as well
%   as three special characters. This allows numeric data to be encoded as two
%   data digits per symbol character.
idx = regexp(data,'[^0-9]');
if idx(1)==1,
    start = 'B';
else
    start = 'C';
end
switch start,
    case 'A',
        startCode = 103;
    case 'B',
        startCode = 104;
    case 'C',
        startCode = 105;
    otherwise,
        error('The start character %c is not avaliable!!!',start);
end

%Function Code
% - FNC1 in the first position following the Start Character of a Code-128 Symbol
%   is at all times a reserved use, which identifies the GS1 System.
% - FNC2 is not used in the GS1 System. It instructs the bar code reader to
%   temporarily store the data from the symbol containing the FNC2 and transmit
%   it as a prefix to the data of the next symbol.
% - FNC3 instructs the bar code reader to interpret the data from the symbol
%   containing the FNC3 as instructions for initialisation or reprogramming of
%   the bar code reader.
% - FNC4 is not used in the GS1 System. In Code 128 Symbols, FNC4 is used to
%   represent an extended ASCII character set (byte values 128 to 255) as
%   specified in ISO 8859-1 or otherwise in an application specification.
funct = '1';
switch start,
    case 'A',
        switch funct,
            case '1',
                functCode = 102; %FNC1
            case '2',
                functCode =  97; %FNC2
            case '3',
                functCode =  96; %FNC3
            case '4',
                functCode = 101; %FNC4  
            otherwise,
                error('The function code %c is not avaliable!!!',funct);
        end
    case 'B',
        switch funct,
            case '1',
                functCode = 102; %FNC1
            case '2',
                functCode =  97; %FNC2
            case '3',
                functCode =  96; %FNC3
            case '4',
                functCode = 100; %FNC4  
            otherwise,
                error('The function code %c is not avaliable!!!',funct);
        end
    case 'C',
        switch funct,
            case '1',
                functCode = 102; %FNC1
            otherwise,
                error('The function code %c is not avaliable!!!',funct);
        end
    otherwise,
        error('The start character %c is not avaliable!!!',start);
end

%Element String
for i=1:length(data),
    if data(i)>127 || data(i)<32,
        error('The element string %c is not avaliable!!!',data(i));
    end
end
stringCode = string2code(data);

%Check Character
checkCode = rem(sum([startCode functCode stringCode].*[1 1:length(stringCode)+1]),103);

%Stop Character
stopCode = 106; %STOP

%Bar Codes
barCode = [startCode functCode stringCode checkCode stopCode];
barCode_bin = [zeros(1,10) vals2bin(barCode,CODE128) zeros(1,10)];
barCode_bw = repmat(~barCode_bin,50,1);
barCode_bmp = ones(70,length(barCode_bin));
barCode_bmp(10:10+size(barCode_bw,1)-1,:) = barCode_bw;
figure; imshow(barCode_bmp);

%Save Barcodes
fname=strcat('C:\Users\DV6\Documents\MATLAB\barcode\',code,'.bmp');
imwrite(barCode_bmp,fname,'bmp');
%


h = annotation('textbox',... 
    'BackgroundColor',[1 1 1],...
    'FaceAlpha',0,...
    'HorizontalAlignment','center',...
    'VerticalAlignment','middle',...
    'Units','normalized',...
    'Position',[0.5 0.45 0 0],...    %'FitBoxToText','off',...    %'Margin',20,...
    'FontUnits','pixels',...
    'FontSize',10,...
    'String',code);
file = [code(regexp(code,'[^\\\/\:\*\?\"\<\>\|]')) '.bmp'];
saveas(gcf,file,'bmp');

function [str] = numeric2str(val)
str = sprintf('%.20f',val);
idx = regexp(str,'[^0]');
str = str(1:idx(end));

function [out] = stdNumber(in)
idx = regexp(in,'[.]');
if isempty(idx), %integer number
    if mod(length(in),2),
        out = ['0' in];
    else
        out = in;
    end
else %real number
    if idx==1,
       in = ['0' in];
    end
    idx = regexp(in,'[.]');
    if mod(length(in)-idx,2),
        in = [in '0'];
    end
    if ~mod(idx,2),
        in = ['0' in];
    end
    out = in;
end

function [out] = stdGroup(in)
if max(in(1)==[46 48:57]), %[.0-9]
    f=1;
else
    f=0;
end
k = 1; %cell position
str = in(1);
j = 2; %string position
for i=2:length(in),
    if max(in(i)==[46 48:57])==f,
        str(j) = in(i);
        j = j+1;
    else
        f = ~f;
        cell{k} = str;
        k = k+1;
        str = in(i);
        j = 2;
    end
end
cell{k} = str;
out = [];
for i=1:length(cell),
    n = str2num(cell{i});
    if isempty(n)
        out = [out cell{i}];
    else
        out = [out stdNumber(cell{i})];
    end
end

function [out,txt] = code2standard(in)
if isnumeric(in),
    out = stdNumber(numeric2str(in));
    txt = out;
else
    idx = regexp(in,'[^()0-9.]');
    if isempty(idx), %string of number with parenthesis
        idx = regexp(in,'[()]');
        if isempty(idx), %string of number
            out = stdNumber(in);
            txt = out;
        else %string of number with parenthesis
            if idx(1)==1,
                cell = regexp(in(2:end),'[()]','split');
            else
                cell = regexp(in,'[()]','split');
            end
            out = [];
            txt = [];
            for i=1:length(cell),
                std = stdNumber(cell{i});
                out = [out std];
                if ~xor(idx(1)==1,mod(i,2));
                    txt = [txt '(' std ')'];
                else
                    txt = [txt std];
                end
            end
        end
    else %string of alphanumeric with parenthesis
        idx = regexp(in,'[()]');
        if isempty(idx), %string of alphanumeric
            out = stdGroup(in);
            txt = out;
        else %string of alphanumeric with parenthesis
            if idx(1)==1,
                cell = regexp(in(2:end),'[()]','split');
            else
                cell = regexp(in,'[()]','split');
            end
            out = [];
            txt = [];
            for i=1:length(cell),
                std = stdGroup(cell{i});
                out = [out std];
                if ~xor(idx(1)==1,mod(i,2));
                    txt = [txt '(' std ')'];
                else
                    txt = [txt std];
                end
            end
        end
    end
end

function [code] = string2codeB(string)
code = string-32;

function [code] = string2codeC(string)
j = 1;
for i=1:2:length(string),
    code(j) = str2double(string(i:i+1));
    j = j+1;
end

function [code] = string2code(string)
idx = regexp(string,'[^0-9]');
if ~isempty(idx) && idx(1)==1,
    f = 0;
else
    f = 1;
end
n = 1;
s = [];
for i=1:length(string),
    if string(i)>47 && string(i)<58,
        if f,
            s = [s string(i)];
        else
            cell{n} = s;
            f = 1;
            n = n+1;
            s = string(i);
        end
    else
        if f,
            cell{n} = s;
            f = 0;
            n = n+1;
            s = string(i);
        else
            s = [s string(i)];
        end
    end
end
cell{n} = s;

idx = regexp(string,'[^0-9]');
if ~isempty(idx) && idx(1)==1,
    f = 0;
    code = string2codeB(cell{1});
else
    f = 1;
    code = string2codeC(cell{1});
end
for i=2:length(cell),
    if f,
        code = [code 100]; %codeC->codeB
        f = 0;
    else
        code = [code 99];  %codeB->codeC
        f = 1;
    end
    if f,
        code = [code string2codeC(cell{i})];
    else
        code = [code string2codeB(cell{i})];
    end
end

function [binary] = vals2bin(values,CODE)
n = length(values);
b = zeros(11,n-1);
for i=1:n-1,
    b(:,i) = CODE{values(i)+1}{8};
end
binary = [b(:)' CODE{values(end)+1}{8}];
