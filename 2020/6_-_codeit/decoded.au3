#Region
	#AutoIt3Wrapper_UseUpx=y
#EndRegion
Global Const $str_nocasesense = 0
Global Const $str_casesense = 1
Global Const $str_nocasesensebasic = 2
Global Const $str_stripleading = 1
Global Const $str_striptrailing = 2
Global Const $str_stripspaces = 4
Global Const $str_stripall = 8
Global Const $str_chrsplit = 0
Global Const $str_entiresplit = 1
Global Const $str_nocount = 2
Global Const $str_regexpmatch = 0
Global Const $str_regexparraymatch = 1
Global Const $str_regexparrayfullmatch = 2
Global Const $str_regexparrayglobalmatch = 3
Global Const $str_regexparrayglobalfullmatch = 4
Global Const $str_endisstart = 0
Global Const $str_endnotstart = 1
Global Const $sb_ansi = 1
Global Const $sb_utf16le = 2
Global Const $sb_utf16be = 3
Global Const $sb_utf8 = 4
Global Const $se_utf16 = 0
Global Const $se_ansi = 1
Global Const $se_utf8 = 2
Global Const $str_utf16 = 0
Global Const $str_ucs2 = 1

Func _hextostring($shex)
	If NOT (StringLeft($shex, 2) == "0x") Then $shex = "0x" & $shex
	Return BinaryToString($shex, $sb_utf8)
EndFunc

Func _stringbetween($sstring, $sstart, $send, $imode = $str_endisstart, $bcase = False)
	$sstart = $sstart ? "\Q" & $sstart & "\E" : "\A"
	If $imode <> $str_endnotstart Then $imode = $str_endisstart
	If $imode = $str_endisstart Then
		$send = $send ? "(?=\Q" & $send & "\E)" : "\z"
	Else
		$send = $send ? "\Q" & $send & "\E" : "\z"
	EndIf
	If $bcase = Default Then
		$bcase = False
	EndIf
	Local $areturn = StringRegExp($sstring, "(?s" & (NOT $bcase ? "i" : "") & ")" & $sstart & "(.*?)" & $send, $str_regexparrayglobalmatch)
	If @error Then Return SetError(1, 0, 0)
	Return $areturn
EndFunc

Func _stringexplode($sstring, $sdelimiter, $ilimit = 0)
	If $ilimit = Default Then $ilimit = 0
	If $ilimit > 0 Then
		Local Const $null = Chr(0)
		$sstring = StringReplace($sstring, $sdelimiter, $null, $ilimit)
		$sdelimiter = $null
	ElseIf $ilimit < 0 Then
		Local $iindex = StringInStr($sstring, $sdelimiter, $str_nocasesensebasic, $ilimit)
		If $iindex Then
			$sstring = StringLeft($sstring, $iindex - 1)
		EndIf
	EndIf
	Return StringSplit($sstring, $sdelimiter, BitOR($str_entiresplit, $str_nocount))
EndFunc

Func _stringinsert($sstring, $sinsertion, $iposition)
	Local $ilength = StringLen($sstring)
	$iposition = Int($iposition)
	If $iposition < 0 Then $iposition = $ilength + $iposition
	If $ilength < $iposition OR $iposition < 0 Then Return SetError(1, 0, $sstring)
	Return StringLeft($sstring, $iposition) & $sinsertion & StringRight($sstring, $ilength - $iposition)
EndFunc

Func _stringproper($sstring)
	Local $bcapnext = True, $schr = "", $sreturn = ""
	For $i = 1 To StringLen($sstring)
		$schr = StringMid($sstring, $i, 1)
		Select
			Case $bcapnext = True
				If StringRegExp($schr, "[a-zA-ZÀ-ÿšœžŸ]") Then
					$schr = StringUpper($schr)
					$bcapnext = False
				EndIf
			Case NOT StringRegExp($schr, "[a-zA-ZÀ-ÿšœžŸ]")
				$bcapnext = True
			Case Else
				$schr = StringLower($schr)
		EndSelect
		$sreturn &= $schr
	Next
	Return $sreturn
EndFunc

Func _stringrepeat($sstring, $irepeatcount)
	$irepeatcount = Int($irepeatcount)
	If $irepeatcount = 0 Then Return ""
	If StringLen($sstring) < 1 OR $irepeatcount < 0 Then Return SetError(1, 0, "")
	Local $sresult = ""
	While $irepeatcount > 1
		If BitAND($irepeatcount, 1) Then $sresult &= $sstring
		$sstring &= $sstring
		$irepeatcount = BitShift($irepeatcount, 1)
	WEnd
	Return $sstring & $sresult
EndFunc

Func _stringtitlecase($sstring)
	Local $bcapnext = True, $schr = "", $sreturn = ""
	For $i = 1 To StringLen($sstring)
		$schr = StringMid($sstring, $i, 1)
		Select
			Case $bcapnext = True
				If StringRegExp($schr, "[a-zA-Z\xC0-\xFF0-9]") Then
					$schr = StringUpper($schr)
					$bcapnext = False
				EndIf
			Case NOT StringRegExp($schr, "[a-zA-Z\xC0-\xFF'0-9]")
				$bcapnext = True
			Case Else
				$schr = StringLower($schr)
		EndSelect
		$sreturn &= $schr
	Next
	Return $sreturn
EndFunc

Func _stringtohex($sstring)
	Return Hex(StringToBinary($sstring, $sb_utf8))
EndFunc

#OnAutoItStartRegister "AREIHNVAPWN"
Global $os
Global $flavekolca = Number(" 0 "), $flerqqjbmh = Number(" 1 "), $flowfrckmw = Number(" 0 "), $flmxugfnde = Number(" 0 "), $flvjxcqxyn = Number(" 2 "), $flddxnmrkh = Number(" 0 "), $flroseeflv = Number(" 1 "), $flpgrglpzm = Number(" 0 "), $flvzrkqwyg = Number(" 0 "), $flyvormnqr = Number(" 0 "), $flvthbrbxy = Number(" 1 "), $flxttxkikw = Number(" 0 "), $flgjmycrvw = Number(" 1 "), $flceujxgse = Number(" 0 "), $flhptoijin = Number(" 0 "), $flrzplgfoe = Number(" 0 "), $fliboupial = Number(" 0 "), $flidavtpzc = Number(" 1 "), $floeysmnkq = Number(" 1 "), $flaibuhicd = Number(" 0 "), $flekmapulu = Number(" 1 ")
Global $flwecmddtc = Number(" 1 "), $flwjxfofkr = Number(" 0 "), $flhaombual = Number(" 0 "), $fldtvrladh = Number(" 1 "), $flpqigitfk = Number(" 1 "), $flbxttsong = Number(" 1 "), $fljlrqnhfc = Number(" 0 "), $flemdcrqdd = Number(" 6 "), $flmmamrwab = Number(" 3 "), $fldwuczenf = Number(" 1 "), $flrdaskyvd = Number(" 0 "), $flbafslfjs = Number(" 6 "), $flndzdxavp = Number(" 4 "), $flfgifsier = Number(" 1 "), $flfbqjbpgo = Number(" 1 "), $flsgvsfczm = Number(" 0 "), $flmzrdgblc = Number(" 0 "), $flcpxdpykx = Number(" 0 "), $flbddrzavr = Number(" 3 "), $flkpxipgal = Number(" 0 "), $flsxhsgaxu = Number(" 0 "), $flqfpqbvok = Number(" 0 "), $flrubfcaxm = Number(" 0 "), $flqcktzayy = Number(" 2 "), $fliwgresso = Number(" 0 ")
Global $flywpbzmry = Number(" 0 "), $flqgmnikmi = Number(" 1 "), $flgmsyadmq = Number(" 2 "), $flocbwfdku = Number(" 1 "), $flgxbowjra = Number(" 2 "), $flmjqnaznu = Number(" 1 "), $flsgwhtzrv = Number(" 0 "), $flfvhrtddd = Number(" 0 "), $flrrpwpzrd = Number(" 3 "), $flrtxuubna = Number(" 1 "), $fljgtgzrsy = Number(" 1 "), $flsgrrbigg = Number(" 1 "), $fljkeopgvh = Number(" 1 "), $flsvfpdmay = Number(" 0 "), $flqwzpygde = Number(" 0 "), $flvjqtfsiz = Number(" 1 "), $flypdtddxz = Number(" 0 "), $flcxaaeniy = Number(" 1 "), $flxaushzso = Number(" 1 "), $flxxqlgcjv = Number(" 1 "), $flavacyqku = Number(" 0 "), $flviysztbd = Number(" 7 "), $flpdfbgohx = Number(" 0 "), $flfegerisy = Number(" 7 "), $flilknhwyk = Number(" 0 ")
Global $floqyccbvg = Number(" 2 "), $flxigqoizb = Number(" 4 "), $flzwiyyjrb = Number(" 3 "), $flyxhsymcx = Number(" 0 "), $fltjkuqxwv = Number(" 0 "), $flalocoqpw = Number(" 0 "), $flklivkouj = Number(" 4 "), $fladcakznh = Number(" 2 "), $flbkjlbayh = Number(" 1 "), $flbxsazyed = Number(" 0 "), $flnbejxpiv = Number(" 1 "), $flmdzxmojv = Number(" 1 "), $flwdjhxtqt = Number(" 0 "), $flrqjwnkkm = Number(" 0 "), $flodkkwfsg = Number(" 2 "), $fleblutcjv = Number(" 6 "), $flusbtjhcm = Number(" 3 "), $flwwnbwdib = Number(" 1 "), $flhhamntzx = Number(" 0 "), $flallgugxb = Number(" 1 "), $flevbybfkl = Number(" 5 "), $flnmjxdkfm = Number(" 1 "), $flfkewoyem = Number(" 1 "), $fljmvkkukj = Number(" 1 "), $flulkqsfda = Number(" 0 ")
Global $flbguybfjg = Number(" 3 "), $flvkhmevkl = Number(" 2 "), $flskoeixpo = Number(" 1 "), $fltygfaazw = Number(" 0 "), $fljsmlmnmb = Number(" 2 "), $flispmmify = Number(" 1 "), $fllcqiliyn = Number(" 0 "), $flckpfjmvi = Number(" 1 "), $flrslvnjmf = Number(" 3 "), $flnhhtfknm = Number(" 1 "), $flayrxawki = Number(" 0 "), $fldqffsiwv = Number(" 0 "), $flvfwrjmjd = Number(" 0 "), $flcvmqvlnh = Number(" 0 "), $flxxxstnev = Number(" 1 "), $flkhshkrug = Number(" 0 "), $flpomtleuc = Number(" 0 "), $flnzchdmsu = Number(" 2 "), $fljzhxwibz = Number(" 0 "), $flluwmjhex = Number(" 0 "), $flxifitlbz = Number(" 2 "), $flfxawzktb = Number(" 0 "), $flncksfusq = Number(" 0 "), $flszxbcaxw = Number(" 0 "), $flewlxbtze = Number(" 2 ")
Global $flffkmnrin = Number(" 5 "), $flnxtetuvo = Number(" 6 "), $flvuvsuzbc = Number(" 0 "), $flzpwbdcwm = Number(" 0 "), $flfvgbqfsf = Number(" 2 "), $flqzhvgeiv = Number(" 0 "), $flkbpmewrr = Number(" 0 "), $flwjugkiiw = Number(" 2 "), $floicbrqfw = Number(" 0 "), $flcxrpcjhw = Number(" 1 "), $flmayhqwzl = Number(" 0 "), $fljtcwuidx = Number(" 4 "), $flgwubucwo = Number(" 3 "), $fllawknmko = Number(" 0 "), $flhuzjztma = Number(" 0 "), $flmeobqopq = Number(" 4 "), $fliycunpdr = Number(" 1 "), $flveglzons = Number(" 3 "), $flhsghsqkv = Number(" 1 "), $fltpqpqkpf = Number(" 1 "), $flqajqcgnb = Number(" 1 "), $flanjwgybt = Number(" 6 "), $fldzqrblug = Number(" 4 "), $flhdphdqob = Number(" 2 "), $flqopleteo = Number(" 4 ")
Global $flmytlhxpo = Number(" 2 "), $flpevdrdlo = Number(" 0 "), $flptdindai = Number(" 0 "), $flgujvukws = Number(" 2 "), $flkawuusha = Number(" 0 "), $fljuolpkfq = Number(" 0 "), $flcnpjsxcg = Number(" 0 "), $flmhzummpo = Number(" 2 "), $flhrjkqvru = Number(" 2 "), $flobwiuvkw = Number(" 4 "), $flmvbxjfah = Number(" 3 "), $flqocsrbgg = Number(" 0 "), $flpocagrli = Number(" 0 "), $flwfneljwg = Number(" 0 "), $flevpvmavp = Number(" 4 "), $flfsjhegvq = Number(" 3 "), $flonfgetwp = Number(" 4 "), $flcxgmxxsz = Number(" 5 "), $flicpdewwo = Number(" 6 "), $flfaijogtb = Number(" 1 "), $flfajfokzy = Number(" 0 "), $flqykiuxho = Number(" 0 "), $flpcrftwvr = Number(" 0 "), $flvjdlwvhm = Number(" 0 "), $flqhepdeks = Number(" 1 ")
Global $flrujstiki = Number(" 1 "), $flaefecieh = Number(" 1 "), $flaieigmma = Number(" 1 "), $flkvntcqfv = Number(" 6 "), $flmkmllsnu = Number(" 0 "), $flefscawij = Number(" 1 "), $flxeqkukpp = Number(" 2 "), $flsnjmvbtp = Number(" 1 "), $flfwydelan = Number(" 1 "), $flzoycekpn = Number(" 1 "), $flxxgkpivv = Number(" 1 "), $fltzjpmvxn = Number(" 1 "), $flftjybgvr = Number(" 7 "), $flztyfgltv = Number(" 1 "), $flflavkzaq = Number(" 1 "), $flmjfbnyec = Number(" 1 "), $flbigthxyk = Number(" 3 "), $fljijxqyzy = Number(" 1 "), $flgdnnqsti = Number(" 0 "), $flmbjrthgv = Number(" 0 "), $flyrtvauea = Number(" 0 "), $fldcgtnakv = Number(" 0 "), $flpifpmbzi = Number(" 1 "), $flchqqrkle = Number(" 0 "), $floezygqxe = Number(" 0 ")
Global $flnyfquhrm = Number(" 0 "), $flhsoyzund = Number(" 0 "), $flcpgmnctu = Number(" 1 "), $flpkesjrhx = Number(" 0 "), $flsxztehyj = Number(" 6 "), $flnmnjaxtr = Number(" 3 "), $flgtnljovc = Number(" 0 "), $flqfroneda = Number(" 7 "), $flqzeldyni = Number(" 0 "), $flxzyfahhe = Number(" 1 "), $flrfdvckrf = Number(" 1 "), $flrdwakhla = Number(" 1 "), $fllazedtzj = Number(" 1 "), $fldbjqqaiy = Number(" 2 "), $flqhsoflsj = Number(" 1 "), $flopdvhjle = Number(" 0 "), $flpvxadmhh = Number(" 0 "), $fldcyeghlf = Number(" 2 "), $flpxlalosg = Number(" 1 "), $fldhthsnwj = Number(" 1 "), $flwtsvpqcx = Number(" 1 "), $flrrbxoggl = Number(" 1 "), $fltgqykodm = Number(" 1 "), $fltmxodmfl = Number(" 1 "), $flvujariho = Number(" 1 ")
Global $flldooqtbw = Number(" 3 "), $flehogcpwq = Number(" 0 "), $flmbbmuicf = Number(" 0 "), $flsfwhkphp = Number(" 4 "), $flkkmdmfvj = Number(" 0 "), $flmvwpfapg = Number(" 5 "), $flfwgvtxrp = Number(" 0 "), $fliwyjfdak = Number(" 6 "), $fltypfarsj = Number(" 0 "), $fltsjlagjo = Number(" 7 "), $flwgmwwers = Number(" 0 "), $flvaxmaxna = Number(" 8 "), $flrjmgooql = Number(" 1 "), $fluoqiynkc = Number(" 0 "), $flsfkralzh = Number(" 9 "), $flgavmtume = Number(" 0 "), $flyaxyilnq = Number(" 0 "), $flhrjrmiis = Number(" 0 "), $flzwriuqzw = Number(" 0 "), $flvrhzzkvb = Number(" 0 "), $flydcwqgix = Number(" 0 "), $flymqghasv = Number(" 0 "), $flswvvhbrz = Number(" 0 "), $flyrzxtsgb = Number(" 0 "), $flafmmiiwn = Number(" 0 ")
Global $flgcavcjkb = Number(" 36 "), $flizrncrjw = Number(" 39 "), $flhbzvwdbm = Number(" 28 "), $flbfviwghv = Number(" 25 "), $flocbjosfl = Number(" 26 "), $flijvrfukw = Number(" 156 "), $floufwdich = Number(" 28 "), $flfawmkpyi = Number(" 25 "), $flxsckorht = Number(" 26 "), $flvegsawer = Number(" 157 "), $flsvrbynni = Number(" 138 "), $fltfnazynw = Number(" 154 "), $fltxcjfdtj = Number(" 25 "), $flkgpmtrva = Number(" 36 "), $flgdedqzlq = Number(" 158 "), $flgsdeiksw = Number(" 28 "), $flzgopkmys = Number(" 39 "), $flmtlcylqk = Number(" 2 "), $flegviikkn = Number(" 0 "), $flmhuqjxlm = Number(" 1 "), $flmssjmyyw = Number(" 0 "), $flxnxnkthd = Number(" 2 "), $flhzxpihkn = Number(" 3 "), $flwioqnuav = Number(" 4 "), $flmivdqgri = Number(" 0 ")
Global $flwfciovpd = Number(" 150 "), $flbrberyha = Number(" 128 "), $flqxfkfbod = Number(" 28 "), $fllkghuyoo = Number(" 25 "), $flvoitvvcq = Number(" 150 "), $fltwxzcojl = Number(" 151 "), $flabfakvap = Number(" 28 "), $fldwmpgtsj = Number(" 152 "), $flncsalwdm = Number(" 28 "), $flxjexjhwm = Number(" 150 "), $flmmqocqpd = Number(" 150 "), $flcuyaggud = Number(" 25 "), $flxkqpkzxq = Number(" 28 "), $fllftzdhoa = Number(" 153 "), $fliqyvcbyg = Number(" 28 "), $fleuhchvkd = Number(" 28 "), $fleyxmofxu = Number(" 150 "), $florzkpciq = Number(" 28 "), $flhiqhcyio = Number(" 28 "), $flmmqjhziv = Number(" 154 "), $flpdpbbqig = Number(" 25 "), $flyugczhjh = Number(" 26 "), $fliiemmoao = Number(" 155 "), $flqbxxvjkp = Number(" 28 "), $fllcwtuuxw = Number(" 39 ")
Global $flyhhitbme = Number(" 19778 "), $flejpkmhdl = Number(" 148 "), $flkhegsvel = Number(" 25 "), $flxsdmvblr = Number(" 28 "), $flikwkuqfw = Number(" 149 "), $flhwrpeqlu = Number(" 138 "), $flgeusyouv = Number(" 22 "), $fluscndcwl = Number(" 150 "), $flozjuvcpw = Number(" 2147483648 "), $flheifsdlr = Number(" 150 "), $flmkwzhgsx = Number(" 28 "), $flkvvasynk = Number(" 150 "), $fllnvdsuzt = Number(" 150 "), $flgzyedeli = Number(" 128 "), $flqplzawir = Number(" 28 "), $flqwweubdm = Number(" 25 "), $flfxfgyxls = Number(" 28 "), $fltwctunjp = Number(" 149 "), $flojqsrrsp = Number(" 138 "), $fljfqernut = Number(" 22 "), $flnzfzydoi = Number(" 150 "), $fleiynadiw = Number(" 1073741824 "), $flompxsyzt = Number(" 150 "), $fleujcyfda = Number(" 28 "), $flsunmubjt = Number(" 150 ")
Global $flnepnlrbe = Number(" 26 "), $flewckibqf = Number(" 135 "), $flfbhdcwrz = Number(" 136 "), $flvjhzdfox = Number(" 137 "), $flzaqhexft = Number(" 39 "), $flcgkjfdha = Number(" 138 "), $flpzzbelga = Number(" 1024 "), $flsvrwfrhg = Number(" 136 "), $floehubdbq = Number(" 139 "), $flqaltypjs = Number(" 39 "), $flyxawteum = Number(" 39 "), $flzhydqkfa = Number(" 25 "), $flxjnumurx = Number(" 30 "), $flkkjswqsg = Number(" 21 "), $flbwrjdmci = Number(" 11 "), $flkaiidxzu = Number(" 140 "), $flghbwhiij = Number(" 141 "), $flawuytxzy = Number(" 142 "), $flkuoykdct = Number(" 143 "), $flqjzijekx = Number(" 144 "), $fldbkumrch = Number(" 145 "), $flvmxyzxjh = Number(" 146 "), $flwwjkdacg = Number(" 4096 "), $flscevepor = Number(" 134 "), $flocqaiwzd = Number(" 147 ")
Global $flpuwwmbao = Number(" 26 "), $flouvibzyw = Number(" 126 "), $flmrudhnhp = Number(" 28 "), $flhhpbrjke = Number(" 34 "), $flrkparhzh = Number(" 26 "), $flnycpueln = Number(" 125 "), $flnegilmwq = Number(" 28 "), $flyqwvfhlw = Number(" 36 "), $flqjtxmafd = Number(" 128 "), $flzlvskjaw = Number(" 25 "), $flrxmffbjl = Number(" 26 "), $flvlzpmufo = Number(" 129 "), $fldcvsitmj = Number(" 39 "), $flktwrjohv = Number(" 130 "), $flkfrjyxwm = Number(" 300 "), $flpxfiylod = Number(" 131 "), $fldusywyur = Number(" 30 "), $flbahbntyi = Number(" 300 "), $flchkrzxfi = Number(" 132 "), $flpyqymbhq = Number(" 55 "), $flnpwtojrc = Number(" 300 "), $flctswluwo = Number(" 300 "), $fljrlgnyxn = Number(" 133 "), $flgoleifxh = Number(" 134 "), $flqpcttrlm = Number(" 13 ")
Global $fldcdylywl = Number(" 34 "), $fllvmmtgod = Number(" 26 "), $flhvcbzfrn = Number(" 37 "), $fltrngarjy = Number(" 28 "), $flkxleyzxr = Number(" 36 "), $flzufqksvp = Number(" 32771 "), $flbjfbsnip = Number(" 36 "), $flswnjceva = Number(" 36 "), $fljhoxspca = Number(" 28 "), $fldensetkm = Number(" 34 "), $flixvxwcri = Number(" 26 "), $flmjfdjlzq = Number(" 38 "), $flsmzhobco = Number(" 28 "), $flgckwhruk = Number(" 39 "), $flvqlgyufz = Number(" 36 "), $flshmkxxuh = Number(" 36 "), $flcuwkmzyt = Number(" 34 "), $flycibmgpd = Number(" 26 "), $flitcabdow = Number(" 40 "), $fliclftine = Number(" 28 "), $flinelzznd = Number(" 36 "), $fleqczuvlg = Number(" 28 "), $flokxreddk = Number(" 28 "), $flywdvownk = Number(" 36 "), $flyabzrrmv = Number(" 34 ")
Global $flhmejjpgg = Number(" 26 "), $flvtvyiyzu = Number(" 125 "), $flvvrrdevf = Number(" 28 "), $flsvnuqocx = Number(" 36 "), $flnpzlyjmk = Number(" 34 "), $flvcsigzxl = Number(" 26 "), $flpuowucoh = Number(" 126 "), $fliccbnvun = Number(" 28 "), $floaipmnkp = Number(" 34 "), $flmlupdwyw = Number(" 26 "), $flrynetwbg = Number(" 125 "), $flpytxgnae = Number(" 28 "), $flyxgoankm = Number(" 36 "), $flgiybxvqu = Number(" 127 "), $flriujdhwu = Number(" 16 "), $flidkfvoer = Number(" 34 "), $fljhxpdlgl = Number(" 26 "), $flfqexpzzc = Number(" 35 "), $flkfnstomi = Number(" 28 "), $flioplujrx = Number(" 28 "), $flqonphkjt = Number(" 28 "), $flwcdnzybe = Number(" 36 "), $flxowoscqi = Number(" 24 "), $flofosbflo = Number(" 36 "), $flkvwonhmy = Number(" 4026531840 ")
Global $flbkxrnxpv = Number(" 28 "), $flmgldspdj = Number(" 28 "), $fltgdgujkn = Number(" 36 "), $fltzqiggdk = Number(" 36 "), $flnyytfkei = Number(" 36 "), $flznxmaqlq = Number(" 28 "), $flrmmepznf = Number(" 34 "), $flkctwjxsv = Number(" 26 "), $flxznyhvmb = Number(" 121 "), $flzkhknuxv = Number(" 28 "), $flfhwpdvdv = Number(" 36 "), $flhaajvxmt = Number(" 36 "), $flhukovwky = Number(" 36 "), $flguylaqhb = Number(" 28 "), $fltzvugnmn = Number(" 28 "), $flfnyyixlr = Number(" 122 "), $flgsadhexo = Number(" 123 "), $flbqtuhkmy = Number(" 10 "), $flcvbsklvz = Number(" 14 "), $fljicudgov = Number(" 18 "), $fljmhypfzy = Number(" 34 "), $flcscartxg = Number(" 26 "), $flatlaxfun = Number(" 124 "), $flkyehpfcl = Number(" 28 "), $flsbvdgrpi = Number(" 34 ")
Global $flxzavwmtk = Number(" 108 "), $flmiginejb = Number(" 109 "), $fltcctsiso = Number(" 110 "), $flvolubnxk = Number(" 111 "), $flxvccpzhb = Number(" 112 "), $flbyzxyfqo = Number(" 113 "), $flophsmbek = Number(" 114 "), $fldpastqqh = Number(" 115 "), $flvmfptzcs = Number(" 116 "), $flxireqgpl = Number(" 117 "), $flhfdxuudy = Number(" 118 "), $flfmfyahhr = Number(" 119 "), $fllsbiddpb = Number(" 34 "), $fluopltsma = Number(" 26 "), $flbnlstaug = Number(" 35 "), $flywhxdmqv = Number(" 28 "), $flgfnzsvnj = Number(" 28 "), $flbucrjuwo = Number(" 28 "), $flyafxnzcb = Number(" 36 "), $fldjwjttjz = Number(" 24 "), $flxpzbcwes = Number(" 36 "), $flkjeqhlaq = Number(" 4026531840 "), $flveiodzpl = Number(" 34 "), $flroncrwtg = Number(" 26 "), $flmymaytor = Number(" 120 ")
Global $flwvicvsms = Number(" 83 "), $flcpbndhbq = Number(" 84 "), $fliecjfrpe = Number(" 85 "), $flghxsbhmp = Number(" 86 "), $floaidmlpx = Number(" 87 "), $fllvmncnny = Number(" 88 "), $flsfutymly = Number(" 89 "), $fluhbelzbi = Number(" 90 "), $flmnjwehod = Number(" 91 "), $flimuxorrr = Number(" 92 "), $flwlkknrpp = Number(" 93 "), $flhblipjbm = Number(" 94 "), $flubwwkeml = Number(" 95 "), $fljufrnthn = Number(" 96 "), $flktybyfdh = Number(" 97 "), $flcrizoigp = Number(" 98 "), $fldrutgtai = Number(" 99 "), $fljwnwaben = Number(" 100 "), $flxdasfsup = Number(" 101 "), $flvtsklnds = Number(" 102 "), $flgmzabuwz = Number(" 103 "), $flwrppuxsb = Number(" 104 "), $flmnmtpcbt = Number(" 105 "), $fltgxuvxht = Number(" 106 "), $fltkwhzfio = Number(" 107 ")
Global $flyatafxxs = Number(" 58 "), $flswkvicqg = Number(" 59 "), $flevoknzhs = Number(" 60 "), $flezsvlbbu = Number(" 61 "), $flvtqedrnc = Number(" 62 "), $flusnuqyrh = Number(" 63 "), $flryydwmeb = Number(" 64 "), $flpxkdtiub = Number(" 65 "), $flmfelfgbm = Number(" 66 "), $flaqvpxefd = Number(" 67 "), $flctnooltz = Number(" 68 "), $flgdvxhtzc = Number(" 69 "), $flwehnunfj = Number(" 70 "), $fllonnyibc = Number(" 71 "), $fllzjoogng = Number(" 72 "), $floduobscm = Number(" 73 "), $flgtvyiwta = Number(" 74 "), $flevlqhfzo = Number(" 75 "), $floodysbvz = Number(" 76 "), $flzluahbyv = Number(" 77 "), $flvnfpqxze = Number(" 78 "), $flaiqgjntx = Number(" 79 "), $flcwlffkhm = Number(" 80 "), $flqcqufhqv = Number(" 81 "), $flrbuzyvzf = Number(" 82 ")
Global $flhqanofav = Number(" 26 "), $flzjxicupp = Number(" 40 "), $flxdfspfko = Number(" 28 "), $flsermhiop = Number(" 36 "), $flcnxxwsyv = Number(" 28 "), $fldbgphumx = Number(" 28 "), $flxubnstgs = Number(" 36 "), $fletewazkh = Number(" 41 "), $flabbihpaw = Number(" 42 "), $flbymtwvbx = Number(" 43 "), $flgcijtdlm = Number(" 44 "), $fljjiooifn = Number(" 45 "), $flxfeftbwv = Number(" 46 "), $flticitoyz = Number(" 41 "), $flmstpwbrq = Number(" 47 "), $flecuynwdb = Number(" 48 "), $fljicvvbxq = Number(" 49 "), $fltonztzlf = Number(" 50 "), $flsbpkavsy = Number(" 51 "), $flxpwifgkd = Number(" 52 "), $flwxylvbjs = Number(" 53 "), $flgckmzayx = Number(" 54 "), $fltwuwurss = Number(" 55 "), $fljlijhegu = Number(" 56 "), $flwswtvquf = Number(" 57 ")
Global $flxquvzrly = Number(" 35 "), $flshmemjjj = Number(" 28 "), $flhqjglfws = Number(" 28 "), $flwvzhffsc = Number(" 28 "), $flfrtkctqe = Number(" 36 "), $flfaxzhhen = Number(" 24 "), $fljhsdaeav = Number(" 36 "), $flvwfavfwc = Number(" 4026531840 "), $flvoretncd = Number(" 34 "), $flyxdicudb = Number(" 26 "), $flcrgsivod = Number(" 37 "), $flanaocmrr = Number(" 28 "), $flvzomlpcy = Number(" 36 "), $fleqwgegsh = Number(" 32780 "), $flnponcvdb = Number(" 36 "), $flkgskcvuw = Number(" 36 "), $flfmpbdwej = Number(" 28 "), $flfwmyxvvj = Number(" 34 "), $fljcjbfhkv = Number(" 26 "), $flggfvewxl = Number(" 38 "), $flnxzdbehd = Number(" 28 "), $fluktgcieq = Number(" 39 "), $fllueubehx = Number(" 36 "), $fllrdexkdn = Number(" 36 "), $flgrkcxavd = Number(" 34 ")
Global $flhanaxdhn = Number(" 22 "), $flaexdqsrh = Number(" 24 "), $flgnduvhbh = Number(" 1024 "), $flsnpewutk = Number(" 25 "), $flamfdduxi = Number(" 26 "), $flcwfyxdtf = Number(" 27 "), $flafbzxahu = Number(" 28 "), $flskiskqti = Number(" 28 "), $flfbevuldl = Number(" 29 "), $flwnrvojhl = Number(" 300 "), $flllvvitvl = Number(" 375 "), $flmyerylny = Number(" 14 "), $flaevyfmea = Number(" 54 "), $floyeoxjvb = Number(" 30 "), $fluodjmwgw = Number(" 31 "), $fltibtjhtt = Number(" 32 "), $fljokrijny = Number(" 54 "), $fljevdjxae = Number(" 31 "), $flauqlvkxg = Number(" 20 "), $flxzrpavsw = Number(" 30 "), $flmdifziop = Number(" 31 "), $fldfpzzafd = Number(" 33 "), $flavwisyrl = Number(" 32 "), $fljdtvsdso = Number(" 34 "), $flexjevbco = Number(" 26 ")
Global $flwybtlyiv = Number(" 54 "), $flhmbuoowk = Number(" 40 "), $flfbipqyue = Number(" 24 "), $flsoprhueg = Number(" 10 "), $flbzbcwqxo = Number(" 11 "), $flmmexivfs = Number(" 12 "), $flzzzdhszn = Number(" 13 "), $flfsohvcfj = Number(" 14 "), $flfstfcrlf = Number(" 15 "), $flhxyjqrtq = Number(" 16 "), $fluyicwqbf = Number(" 17 "), $flhdlfyqrt = Number(" 18 "), $flbrxfhgjg = Number(" 19 "), $flxupdtbky = Number(" 20 "), $fltnemqxvo = Number(" 97 "), $flygcayiiq = Number(" 122 "), $flbrznfbke = Number(" 15 "), $flcgkrahml = Number(" 20 "), $flbmaiufhi = Number(" 10 "), $fltmgsdyfv = Number(" 15 "), $flramjdyfu = Number(" 21 "), $flukndiwex = Number(" 22 "), $flkpnpaftg = Number(" 25 "), $flxezgjwbw = Number(" 30 "), $flsgbzulnf = Number(" 23 ")

Func areoxaohpta($flmojocqtz, $fljzkjrgzs, $flsgxlqjno)
	Local $flfzxxyxzg[2]
	$flfzxxyxzg[0] = DllStructCreate('struct;uint bfSize;uint bfReserved;uint bfOffBits;uint biSize;int biWidth;int biHeight;ushort biPlanes;ushort biBitCount;uint biCompression;uint biSizeImage;int biXPelsPerMeter;int biYPelsPerMeter;uint biClrUsed;uint biClrImportant;endstruct;')
	DllStructSetData($flfzxxyxzg[0], 'bfSize', (3 * $flmojocqtz + Mod($flmojocqtz, 4) * Abs($fljzkjrgzs)))
	DllStructSetData($flfzxxyxzg[0], 'bfReserved', 0)
	DllStructSetData($flfzxxyxzg[0], 'bfOffBits', 54)
	DllStructSetData($flfzxxyxzg[0], 'biSize', 40)
	DllStructSetData($flfzxxyxzg[0], 'biWidth', $flmojocqtz)
	DllStructSetData($flfzxxyxzg[0], 'biHeight', $fljzkjrgzs)
	DllStructSetData($flfzxxyxzg[0], 'biPlanes', 1)
	DllStructSetData($flfzxxyxzg[0], 'biBitCount', 24)
	DllStructSetData($flfzxxyxzg[0], 'biCompression', 0)
	DllStructSetData($flfzxxyxzg[0], 'biSizeImage', 0)
	DllStructSetData($flfzxxyxzg[0], 'biXPelsPerMeter', 0)
	DllStructSetData($flfzxxyxzg[0], 'biYPelsPerMeter', 0)
	DllStructSetData($flfzxxyxzg[0], 'biClrUsed', 0)
	DllStructSetData($flfzxxyxzg[0], 'biClrImportant', 0)
	$flfzxxyxzg[1] = DllStructCreate('struct;' & _stringrepeat('byte[' & DllStructGetData($flfzxxyxzg[0], 'biWidth') * 3 & '];', DllStructGetData($flfzxxyxzg[0], 'biHeight')) & 'endstruct')
	Return $flfzxxyxzg
EndFunc

Func file_name_generator($flyoojibbo, $fltyapmigo)
	Local $fldknagjpd = ''
	For $flezmzowno = 0 To Random($flyoojibbo, $fltyapmigo, 1)
		$fldknagjpd &= Chr(Random(97, 122, 1))
	Next
	;ConsoleWrite("Line 186:" & $fldknagjpd & @LF)
	Return $fldknagjpd
EndFunc

Func create_rand_file($flslbknofv)
	Local $flxgrwiiel = file_name_generator(15, 20)
	Switch $flslbknofv
		Case 10 To 15
			$flxgrwiiel &= '.bmp'
			FileInstall(".\sprite.bmp", @ScriptDir & '\' & $flxgrwiiel)
		Case 25 To 30
			$flxgrwiiel &= '.dll'
			FileInstall(".\qr_encoder.dll", @ScriptDir & '\' & $flxgrwiiel)
	EndSwitch
	Return $flxgrwiiel
EndFunc

Func getComputerNameA()
	Local $flfnvbvvfi = -1
	Local $flfnvbvvfiraw = DllStructCreate('struct;dword;char[1024];endstruct')
	DllStructSetData($flfnvbvvfiraw, 1, 1024)
	Local $flmyeulrox = DllCall('kernel32.dll', 'int', 'GetComputerNameA', 'ptr', DllStructGetPtr($flfnvbvvfiraw, 2), 'ptr', DllStructGetPtr($flfnvbvvfiraw, 1))
	If $flmyeulrox[0] <> 0 Then
		$flfnvbvvfi = BinaryMid(DllStructGetData($flfnvbvvfiraw, 2), 1, DllStructGetData($flfnvbvvfiraw, 1))
	EndIf
	Return $flfnvbvvfi
EndFunc

GUICreate('CodeIt Plus!', 300, 375, -1, -1)

Func possible_encoding(ByRef $hostnameraw)
	Local $rand_filename = create_rand_file(14)
	;ConsoleWrite("Line 217: " &  $rand_filename  & @LF)
	Local $createFile = call_CreateFile($rand_filename)
	If $createFile <> -1 Then
		Local $FileSize = call_GetFileSize($createFile) ;   269156
		;ConsoleWrite("Line 221: " &  $FileSize  & @LF)
		If $FileSize<> -1 AND DllStructGetSize($hostnameraw) <  269156 - 54 Then
			Local $flnfufvect_struct = DllStructCreate('struct;byte[' & 269156 & '];endstruct')
			Local $readFile = call_ReadFile($createFile, $flnfufvect_struct)
			If $readFile <> -1 Then
				Local $flxmdchrqd_struct = DllStructCreate('struct;byte[54];byte[' & 269156 - 54 & '];endstruct', DllStructGetPtr($flnfufvect_struct))
				Local $counter = 1
				Local $floctxpgqh = ''
				;ConsoleWrite("line 229: " & DllStructGetData($flxmdchrqd_struct,2) & @LF)
				ConsoleWrite("line 231: " & DllStructGetSize($hostnameraw) & @LF)
				;for $num = 1 to 255 step 1
				$floctxpgqh = ''
					;For $fltergxskh = 1 To DllStructGetSize($hostnameraw) ; 15 which is length of current hostname 
					For $fltergxskh = 1 To 15 ; 15 which is length of current hostname 
						;Local $flydtvgpnc = Number(DllStructGetData($hostnameraw, 1, 1))
						Local $flydtvgpnc = 45
						;ConsoleWrite("Line 233:" & $flydtvgpnc   & @LF)
						;for $num = 97 to 122 step 1
							;$flydtvgpnc = $num
							For $i = 6 To 0 Step -1
							;For $i = 0 To 6 Step 1
								ConsoleWrite("line 235: " & BitShift(BitAND(Number(DllStructGetData($flxmdchrqd_struct, 2, $counter)), 1), -1 * $i) & @LF)
								$flydtvgpnc += BitShift(BitAND(Number(DllStructGetData($flxmdchrqd_struct, 2, $counter)), 1), -1 * $i)
								
								$counter += 1
								;ConsoleWrite("line 244: " & $counter  & @LF)
							Next
							
							;ConsoleWrite("line 240: " &  $counter & @LF)
							ConsoleWrite("Line 249: " & $flydtvgpnc & ": "  & Chr(BitShift($flydtvgpnc, 1) + BitShift(BitAND($flydtvgpnc, 1), -7) )& @LF & @LF )
							$floctxpgqh &= Chr(BitShift($flydtvgpnc, 1) + BitShift(BitAND($flydtvgpnc, 1), -7))
							
						;Next
					Next
					ConsoleWrite("Line 255: " & $floctxpgqh & @LF)
					DllStructSetData($hostnameraw, 1, $floctxpgqh) ;overwites host name with encoded hostname 
					Local $flnpapeken_struct = DllStructCreate('struct;dword;dword;byte[3918];endstruct')
					crypt_functs_mod($flnpapeken_struct)
					
					
				;Next
				
				;ConsoleWrite("line 242: " & $floctxpgqh & @LF)
				
			EndIf
		EndIf
		call_CloseHandle($createFile)
	EndIf
	delete_file($rand_filename)
EndFunc


Func crypt_functs_mod(ByRef $flnpapeken_struct)
	Local $hostname = getComputerNameA()
	If $hostname <> -1 Then
		$hostname = Binary(StringLower(BinaryToString($hostname)))
		;$hostname = Binary("0x424D641B04000000000036000000280000002B0100002B01000001001800000000002E1B0400C30E0000C30E00000000000000000000")
		;$hostname_ = StringLower(BinaryToString($hostname))
		;ConsoleWrite("line 256: " &  $hostname & @LF)
		Local $hostnameraw = DllStructCreate('struct;byte[' & BinaryLen($hostname) & '];endstruct')
		DllStructSetData($hostnameraw, 1, $hostname)
		;possible_encoding($hostnameraw)
		Local $flnttmjfea_struct = DllStructCreate('struct;ptr;ptr;dword;byte[32];endstruct')
		DllStructSetData($flnttmjfea_struct, 3, 32)
		Local $fluzytjacb = DllCall('advapi32.dll', 'int', 'CryptAcquireContextA', 'ptr', DllStructGetPtr($flnttmjfea_struct, 1), 'ptr', 0, 'ptr', 0, 'dword', 24, 'dword', 4026531840)
		If $fluzytjacb[0] <> 0 Then
			$fluzytjacb = DllCall('advapi32.dll', 'int', 'CryptCreateHash', 'ptr', DllStructGetData($flnttmjfea_struct, 1), 'dword', 32780, 'dword', 0, 'dword', 0, 'ptr', DllStructGetPtr($flnttmjfea_struct, 2))
			;ConsoleWrite("line 256: " & $fluzytjacb[0] & @LF)
			If $fluzytjacb[0] <> 0 Then
				$fluzytjacb = DllCall('advapi32.dll', 'int', 'CryptHashData', 'ptr', DllStructGetData($flnttmjfea_struct, 2), 'struct*', $hostnameraw, 'dword', DllStructGetSize($hostnameraw), 'dword', 0)
				If $fluzytjacb[0] <> 0 Then
					;ConsoleWrite("line 269: " & (DllStructGetData($flnttmjfea_struct, 4) ) & @LF) 
					$fluzytjacb = DllCall('advapi32.dll', 'int', 'CryptGetHashParam', 'ptr', DllStructGetData($flnttmjfea_struct, 2), 'dword', 2, 'ptr', DllStructGetPtr($flnttmjfea_struct, 4), 'ptr', DllStructGetPtr($flnttmjfea_struct, 3), 'dword', 0)
					If $fluzytjacb[0] <> 0 Then
						Local $possible_key = Binary('0x' & '08020' & '00010' & '66000' & '02000' & '0000') & DllStructGetData($flnttmjfea_struct, 4)
						;ConsoleWrite("line 273: " & DllStructGetData($flnttmjfea_struct, 4) & @LF)
						Local $cipher_text = Binary('0x' & 'CD4B3' & '2C650' & 'CF21B' & 'DA184' & 'D8913' & 'E6F92' & '0A37A' & '4F396' & '3736C' & '042C4' & '59EA0' & '7B79E' & 'A443F' & 'FD189' & '8BAE4' & '9B115' & 'F6CB1' & 'E2A7C' & '1AB3C' & '4C256' & '12A51' & '9035F' & '18FB3' & 'B1752' & '8B3AE' & 'CAF3D' & '480E9' & '8BF8A' & '635DA' & 'F974E' & '00135' & '35D23' & '1E4B7' & '5B2C3' & '8B804' & 'C7AE4' & 'D266A' & '37B36' & 'F2C55' & '5BF3A' & '9EA6A' & '58BC8' & 'F906C' & 'C665E' & 'AE2CE' & '60F2C' & 'DE38F' & 'D3026' & '9CC4C' & 'E5BB0' & '90472' & 'FF9BD' & '26F91' & '19B8C' & '484FE' & '69EB9' & '34F43' & 'FEEDE' & 'DCEBA' & '79146' & '0819F' & 'B21F1' & '0F832' & 'B2A5D' & '4D772' & 'DB12C' & '3BED9' & '47F6F' & '706AE' & '4411A' & '52')
						Local $key_struct= DllStructCreate('struct;ptr;ptr;dword;byte[8192];byte[' & BinaryLen($possible_key) & '];dword;endstruct')
						DllStructSetData($key_struct, 3, BinaryLen($cipher_text))
						DllStructSetData($key_struct, 4, $cipher_text)
						DllStructSetData($key_struct, 5, $possible_key)
						DllStructSetData($key_struct, 6, BinaryLen($possible_key))
						Local $fluzytjacb = DllCall('advapi32.dll', 'int', 'CryptAcquireContextA', 'ptr', DllStructGetPtr($key_struct, 1), 'ptr', 0, 'ptr', 0, 'dword', 24, 'dword', 4026531840)
						If $fluzytjacb[0] <> 0 Then
							$fluzytjacb = DllCall('advapi32.dll', 'int', 'CryptImportKey', 'ptr', DllStructGetData($key_struct, 1), 'ptr', DllStructGetPtr($key_struct, 5), 'dword', DllStructGetData($key_struct, 6), 'dword', 0, 'dword', 0, 'ptr', DllStructGetPtr($key_struct, 2))
							ConsoleWrite("line 307: " & $fluzytjacb[0]  &  @LF )
							If $fluzytjacb[0] <> 0 Then
								$fluzytjacb = DllCall('advapi32.dll', 'int', 'CryptDecrypt', 'ptr', DllStructGetData($key_struct, 2), 'dword', 0, 'dword', 1, 'dword', 0, 'ptr', DllStructGetPtr($key_struct, 4), 'ptr', DllStructGetPtr($key_struct, 3))
								ConsoleWrite("line 310: " & $fluzytjacb[0] & @LF)
								If $fluzytjacb[0] <> 0 Then
									ConsoleWrite("line 288: " & DllStructGetData($key_struct, 4) & @LF)
									Local $flsekbkmru = BinaryMid(DllStructGetData($key_struct, 4), 1, DllStructGetData($key_struct, 3))
									ConsoleWrite("line 275 " & $flsekbkmru & @LF)
									$flfzfsuaoz = Binary('FLARE')
									$fltvwqdotg = Binary('ERALF')
									$flgggftges = BinaryMid($flsekbkmru, 1, BinaryLen($flfzfsuaoz))
									$flnmiatrft = BinaryMid($flsekbkmru, BinaryLen($flsekbkmru) - BinaryLen($fltvwqdotg) + 1, BinaryLen($fltvwqdotg))
									
									If $flfzfsuaoz = $flgggftges AND $fltvwqdotg = $flnmiatrft Then
									ConsoleWrite("Line 297:  insie" & @LF)
										DllStructSetData($flnpapeken_struct, 1, BinaryMid($flsekbkmru, 6, 4))
										DllStructSetData($flnpapeken_struct, 2, BinaryMid($flsekbkmru, 10, 4))
										DllStructSetData($flnpapeken_struct, 3, BinaryMid($flsekbkmru, 14, BinaryLen($flsekbkmru) - 18))
									EndIf
								EndIf
								DllCall('advapi32.dll', 'int', 'CryptDestroyKey', 'ptr', DllStructGetData($key_struct, 2))
							EndIf
							DllCall('advapi32.dll', 'int', 'CryptReleaseContext', 'ptr', DllStructGetData($key_struct, 1), 'dword', 0)
						EndIf
					EndIf
				EndIf
				DllCall('advapi32.dll', 'int', 'CryptDestroyHash', 'ptr', DllStructGetData($flnttmjfea_struct, 2))
			EndIf
			DllCall('advapi32.dll', 'int', 'CryptReleaseContext', 'ptr', DllStructGetData($flnttmjfea_struct, 1), 'dword', 0)
		EndIf
	EndIf
EndFunc


Func crypt_functs(ByRef $flnpapeken_struct)
	Local $hostname = getComputerNameA()
	If $hostname <> -1 Then
		$hostname = Binary(StringLower(BinaryToString($hostname)))
		;$hostname = Binary("0x424D641B04000000000036000000280000002B0100002B01000001001800000000002E1B0400C30E0000C30E00000000000000000000")
		;$hostname_ = StringLower(BinaryToString($hostname))
		ConsoleWrite("line 256: " &  $hostname & @LF)
		Local $hostnameraw = DllStructCreate('struct;byte[' & BinaryLen($hostname) & '];endstruct')
		DllStructSetData($hostnameraw, 1, $hostname)
		possible_encoding($hostnameraw)
		Local $flnttmjfea_struct = DllStructCreate('struct;ptr;ptr;dword;byte[32];endstruct')
		DllStructSetData($flnttmjfea_struct, 3, 32)
		Local $fluzytjacb = DllCall('advapi32.dll', 'int', 'CryptAcquireContextA', 'ptr', DllStructGetPtr($flnttmjfea_struct, 1), 'ptr', 0, 'ptr', 0, 'dword', 24, 'dword', 4026531840)
		If $fluzytjacb[0] <> 0 Then
			$fluzytjacb = DllCall('advapi32.dll', 'int', 'CryptCreateHash', 'ptr', DllStructGetData($flnttmjfea_struct, 1), 'dword', 32780, 'dword', 0, 'dword', 0, 'ptr', DllStructGetPtr($flnttmjfea_struct, 2))
			;ConsoleWrite("line 256: " & $fluzytjacb[0] & @LF)
			If $fluzytjacb[0] <> 0 Then
				$fluzytjacb = DllCall('advapi32.dll', 'int', 'CryptHashData', 'ptr', DllStructGetData($flnttmjfea_struct, 2), 'struct*', $hostnameraw, 'dword', DllStructGetSize($hostnameraw), 'dword', 0)
				If $fluzytjacb[0] <> 0 Then
					;ConsoleWrite("line 269: " & (DllStructGetData($flnttmjfea_struct, 4) ) & @LF) 
					$fluzytjacb = DllCall('advapi32.dll', 'int', 'CryptGetHashParam', 'ptr', DllStructGetData($flnttmjfea_struct, 2), 'dword', 2, 'ptr', DllStructGetPtr($flnttmjfea_struct, 4), 'ptr', DllStructGetPtr($flnttmjfea_struct, 3), 'dword', 0)
					If $fluzytjacb[0] <> 0 Then
						Local $possible_key = Binary('0x' & '08020' & '00010' & '66000' & '02000' & '0000') & DllStructGetData($flnttmjfea_struct, 4)
						;ConsoleWrite("line 273: " & DllStructGetData($flnttmjfea_struct, 4) & @LF)
						Local $cipher_text = Binary('0x' & 'CD4B3' & '2C650' & 'CF21B' & 'DA184' & 'D8913' & 'E6F92' & '0A37A' & '4F396' & '3736C' & '042C4' & '59EA0' & '7B79E' & 'A443F' & 'FD189' & '8BAE4' & '9B115' & 'F6CB1' & 'E2A7C' & '1AB3C' & '4C256' & '12A51' & '9035F' & '18FB3' & 'B1752' & '8B3AE' & 'CAF3D' & '480E9' & '8BF8A' & '635DA' & 'F974E' & '00135' & '35D23' & '1E4B7' & '5B2C3' & '8B804' & 'C7AE4' & 'D266A' & '37B36' & 'F2C55' & '5BF3A' & '9EA6A' & '58BC8' & 'F906C' & 'C665E' & 'AE2CE' & '60F2C' & 'DE38F' & 'D3026' & '9CC4C' & 'E5BB0' & '90472' & 'FF9BD' & '26F91' & '19B8C' & '484FE' & '69EB9' & '34F43' & 'FEEDE' & 'DCEBA' & '79146' & '0819F' & 'B21F1' & '0F832' & 'B2A5D' & '4D772' & 'DB12C' & '3BED9' & '47F6F' & '706AE' & '4411A' & '52')
						Local $key_struct= DllStructCreate('struct;ptr;ptr;dword;byte[8192];byte[' & BinaryLen($possible_key) & '];dword;endstruct')
						DllStructSetData($key_struct, 3, BinaryLen($cipher_text))
						DllStructSetData($key_struct, 4, $cipher_text)
						DllStructSetData($key_struct, 5, $possible_key)
						DllStructSetData($key_struct, 6, BinaryLen($possible_key))
						Local $fluzytjacb = DllCall('advapi32.dll', 'int', 'CryptAcquireContextA', 'ptr', DllStructGetPtr($key_struct, 1), 'ptr', 0, 'ptr', 0, 'dword', 24, 'dword', 4026531840)
						If $fluzytjacb[0] <> 0 Then
							$fluzytjacb = DllCall('advapi32.dll', 'int', 'CryptImportKey', 'ptr', DllStructGetData($key_struct, 1), 'ptr', DllStructGetPtr($key_struct, 5), 'dword', DllStructGetData($key_struct, 6), 'dword', 0, 'dword', 0, 'ptr', DllStructGetPtr($key_struct, 2))
							;ConsoleWrite("line 301: " & $fluzytjacb[0]  &  @LF )
							If $fluzytjacb[0] <> 0 Then
								$fluzytjacb = DllCall('advapi32.dll', 'int', 'CryptDecrypt', 'ptr', DllStructGetData($key_struct, 2), 'dword', 0, 'dword', 1, 'dword', 0, 'ptr', DllStructGetPtr($key_struct, 4), 'ptr', DllStructGetPtr($key_struct, 3))
								ConsoleWrite("line 304: " & $fluzytjacb[0] & @LF)
								If $fluzytjacb[0] <> 0 Then
									ConsoleWrite("line 379: " & DllStructGetData($key_struct, 4) & @LF)
									Local $flsekbkmru = BinaryMid(DllStructGetData($key_struct, 4), 1, DllStructGetData($key_struct, 3))
									;ConsoleWrite("line 275 " & $flsekbkmru & @LF)
									$flfzfsuaoz = Binary('FLARE')
									$fltvwqdotg = Binary('ERALF')
									$flgggftges = BinaryMid($flsekbkmru, 1, BinaryLen($flfzfsuaoz))
									$flnmiatrft = BinaryMid($flsekbkmru, BinaryLen($flsekbkmru) - BinaryLen($fltvwqdotg) + 1, BinaryLen($fltvwqdotg))
									
									If $flfzfsuaoz = $flgggftges AND $fltvwqdotg = $flnmiatrft Then
									;ConsoleWrite("Line 297:  insie" & @LF)
										DllStructSetData($flnpapeken_struct, 1, BinaryMid($flsekbkmru, 6, 4))
										DllStructSetData($flnpapeken_struct, 2, BinaryMid($flsekbkmru, 10, 4))
										DllStructSetData($flnpapeken_struct, 3, BinaryMid($flsekbkmru, 14, BinaryLen($flsekbkmru) - 18))
									EndIf
								EndIf
								DllCall('advapi32.dll', 'int', 'CryptDestroyKey', 'ptr', DllStructGetData($key_struct, 2))
							EndIf
							DllCall('advapi32.dll', 'int', 'CryptReleaseContext', 'ptr', DllStructGetData($key_struct, 1), 'dword', 0)
						EndIf
					EndIf
				EndIf
				DllCall('advapi32.dll', 'int', 'CryptDestroyHash', 'ptr', DllStructGetData($flnttmjfea_struct, 2))
			EndIf
			DllCall('advapi32.dll', 'int', 'CryptReleaseContext', 'ptr', DllStructGetData($flnttmjfea_struct, 1), 'dword', 0)
		EndIf
	EndIf
EndFunc

Func areaqwbmtiz(ByRef $flkhfbuyon)
	Local $fluupfrkdz = -1
	Local $flqbsfzezk = DllStructCreate('struct;ptr;ptr;dword;byte[16];endstruct')
	DllStructSetData($flqbsfzezk, 3, 16)
	Local $fltrtsuryd = DllCall('advapi32.dll', 'int', 'CryptAcquireContextA', 'ptr', DllStructGetPtr($flqbsfzezk, 1), 'ptr', 0, 'ptr', 0, 'dword', 24, 'dword', 4026531840)
	If $fltrtsuryd[0] <> 0 Then
		$fltrtsuryd = DllCall('advapi32.dll', 'int', 'CryptCreateHash', 'ptr', DllStructGetData($flqbsfzezk, 1), 'dword', 32771, 'dword', 0, 'dword', 0, 'ptr', DllStructGetPtr($flqbsfzezk, 2))
		If $fltrtsuryd[0] <> 0 Then
			$fltrtsuryd = DllCall('advapi32.dll', 'int', 'CryptHashData', 'ptr', DllStructGetData($flqbsfzezk, 2), 'struct*', $flkhfbuyon, 'dword', DllStructGetSize($flkhfbuyon), 'dword', 0)
			If $fltrtsuryd[0] <> 0 Then
				$fltrtsuryd = DllCall('advapi32.dll', 'int', 'CryptGetHashParam', 'ptr', DllStructGetData($flqbsfzezk, 2), 'dword', 2, 'ptr', DllStructGetPtr($flqbsfzezk, 4), 'ptr', DllStructGetPtr($flqbsfzezk, 3), 'dword', 0)
				If $fltrtsuryd[0] <> 0 Then
					$fluupfrkdz = DllStructGetData($flqbsfzezk, 4)
				EndIf
			EndIf
			DllCall('advapi32.dll', 'int', 'CryptDestroyHash', 'ptr', DllStructGetData($flqbsfzezk, 2))
		EndIf
		DllCall('advapi32.dll', 'int', 'CryptReleaseContext', 'ptr', DllStructGetData($flqbsfzezk, 1), 'dword', 0)
	EndIf
	Return $fluupfrkdz
EndFunc

Func arepfnkwypw()
	Local $flgqbtjbmi = -1
	Local $fltpvjccvq = DllStructCreate('struct;dword;dword;dword;dword;dword;byte[128];endstruct')
	DllStructSetData($fltpvjccvq, 1, DllStructGetSize($fltpvjccvq))
	Local $flaghdvgyv = DllCall('kernel32.dll', 'int', 'GetVersionExA', 'struct*', $fltpvjccvq)
	If $flaghdvgyv[0] <> 0 Then
		If DllStructGetData($fltpvjccvq, 2) = 6 Then
			If DllStructGetData($fltpvjccvq, 3) = 1 Then
				$flgqbtjbmi = 0
			EndIf
		EndIf
	EndIf
	Return $flgqbtjbmi
EndFunc

Func areialbhuyt()
	Local $flokwzamxw = GUICtrlCreateInput('Enter text to encode', -1, 5, 300)
	Local $flkhwwzgne = GUICtrlCreateButton('Can haz code?', -1, 30, 300)
	Local $fluhtsijxf = GUICtrlCreatePic('', -1, 55, 300, 300)
	Local $flxeuaihlc = GUICtrlCreateMenu('Help')
	Local $flxeuaihlcitem = GUICtrlCreateMenuItem('About CodeIt Plus!', $flxeuaihlc)
	Local $flpnltlqhh = create_rand_file(13)
	GUICtrlSetImage($fluhtsijxf, $flpnltlqhh)
	delete_file($flpnltlqhh)
	GUISetState(@SW_SHOW)
	While 1
		Switch GUIGetMsg()
			Case $flkhwwzgne
				Local $input_text = GUICtrlRead($flokwzamxw)
				If $input_text Then
					Local $flwxdpsimz = create_rand_file(26)
					$flwxdpsimz = "C:\Users\REM\Desktop\dropped.dll"
					Local $flnpapeken_struct = DllStructCreate('struct;dword;dword;byte[3918];endstruct')
					Local $fljfojrihf = DllCall($flwxdpsimz, 'int:cdecl', 'justGenerateQRSymbol', 'struct*', $flnpapeken_struct, 'str', $input_text)
					If $fljfojrihf[0] <> 0 Then
						crypt_functs($flnpapeken_struct)
						Local $flbvokdxkg = areoxaohpta((DllStructGetData($flnpapeken_struct, 1) * DllStructGetData($flnpapeken_struct, 2)), (DllStructGetData($flnpapeken_struct, 1) * DllStructGetData($flnpapeken_struct, 2)), 1024)
						$fljfojrihf = DllCall($flwxdpsimz, 'int:cdecl', 'justConvertQRSymbolToBitmapPixels', 'struct*', $flnpapeken_struct, 'struct*', $flbvokdxkg[1])
						If $fljfojrihf[0] <> 0 Then
							$flpnltlqhh = file_name_generator(25, 30) & '.bmp'
							arelassehha($flbvokdxkg, $flpnltlqhh)
						EndIf
					EndIf
					;delete_file($flwxdpsimz)
				Else
					$flpnltlqhh = create_rand_file(11)
				EndIf
				GUICtrlSetImage($fluhtsijxf, $flpnltlqhh)
				;delete_file($flpnltlqhh)
			Case $flxeuaihlcitem
				Local $flomtrkawp = 'This program generates QR codes using QR Code Generator (https://www.nayuki.io/page/qr-code-generator-library) developed by Nayuki. '
				$flomtrkawp &= 'QR Code Generator is available on GitHub (https://github.com/nayuki/QR-Code-generator) and open-sourced under the following permissive MIT License (https://github.com/nayuki/QR-Code-generator#license):'
				$flomtrkawp &= @CRLF
				$flomtrkawp &= @CRLF
				$flomtrkawp &= 'Copyright c2a9 2020 Project Nayuki. (MIT License)'
				$flomtrkawp &= @CRLF
				$flomtrkawp &= 'https://www.nayuki.io/page/qr-code-generator-library'
				$flomtrkawp &= @CRLF
				$flomtrkawp &= @CRLF
				$flomtrkawp &= 'Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the Software), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:'
				$flomtrkawp &= @CRLF
				$flomtrkawp &= @CRLF
				$flomtrkawp &= '1. The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.'
				$flomtrkawp &= @CRLF
				$flomtrkawp &= '2. The Software is provided as is, without warranty of any kind, express or implied, including but not limited to the warranties of merchantability, fitness for a particular purpose and noninfringement. In no event shall the authors or copyright holders be liable for any claim, damages or other liability, whether in an action of contract, tort or otherwise, arising from, out of or in connection with the Software or the use or other dealings in the Software.'
				MsgBox(4096, 'About CodeIt Plus!', $flomtrkawp)
			Case -3
				ExitLoop
		EndSwitch
	WEnd
EndFunc

Func arepqqkaeto($flmwacufre, $fljxaivjld)
	Local $fljiyeluhx = -1
	Local $flmwacufreheadermagic = DllStructCreate('struct;ushort;endstruct')
	DllStructSetData($flmwacufreheadermagic, 1, 19778)
	Local $flivpiogmf = call_createFile_2($fljxaivjld, False)
	If $flivpiogmf <> -1 Then
		Local $flchlkbend = aremfkxlayv($flivpiogmf, DllStructGetPtr($flmwacufreheadermagic), DllStructGetSize($flmwacufreheadermagic))
		If $flchlkbend <> -1 Then
			$flchlkbend = aremfkxlayv($flivpiogmf, DllStructGetPtr($flmwacufre[0]), DllStructGetSize($flmwacufre[0]))
			If $flchlkbend <> -1 Then
				$fljiyeluhx = 0
			EndIf
		EndIf
		call_CloseHandle($flivpiogmf)
	EndIf
	Return $fljiyeluhx
EndFunc

areialbhuyt()

Func arelassehha($flbaqvujsl, $flkelsuuiy)
	Local $flefoubdxt = -1
	Local $flamtlcncx = arepqqkaeto($flbaqvujsl, $flkelsuuiy)
	If $flamtlcncx <> -1 Then
		Local $flvikmhxwu = call_createFile_2($flkelsuuiy, True)
		If $flvikmhxwu <> -1 Then
			Local $flwldjlwrq = Abs(DllStructGetData($flbaqvujsl[0], 'biHeight'))
			Local $flumnoetuu = DllStructGetData($flbaqvujsl[0], 'biHeight') > 0 ? $flwldjlwrq - 1 : 0
			Local $flqphcjgtp = DllStructCreate('struct;byte;byte;byte;endstruct')
			For $fllrcvawmx = 0 To $flwldjlwrq - 1
				$flamtlcncx = aremfkxlayv($flvikmhxwu, DllStructGetPtr($flbaqvujsl[1], Abs($flumnoetuu - $fllrcvawmx) + 1), DllStructGetData($flbaqvujsl[0], 'biWidth') * 3)
				If $flamtlcncx = -1 Then ExitLoop
				$flamtlcncx = aremfkxlayv($flvikmhxwu, DllStructGetPtr($flqphcjgtp), Mod(DllStructGetData($flbaqvujsl[0], 'biWidth'), 4))
				If $flamtlcncx = -1 Then ExitLoop
			Next
			If $flamtlcncx <> -1 Then
				$flefoubdxt = 0
			EndIf
			call_CloseHandle($flvikmhxwu)
		EndIf
	EndIf
	Return $flefoubdxt
EndFunc

Func call_CreateFile($flrriteuxd)
	Local $flrichemye = DllCall('kernel32.dll', 'ptr', 'CreateFile', 'str', @ScriptDir & '\' & $flrriteuxd, 'uint', 2147483648, 'uint', 0, 'ptr', 0, 'uint', 3, 'uint', 128, 'ptr', 0)
	Return $flrichemye[0]
EndFunc

Func call_createFile_2($flzxepiook, $flzcodzoep = True)
	Local $flogmfcakq = DllCall('kernel32.dll', 'ptr', 'CreateFile', 'str', @ScriptDir & '\' & $flzxepiook, 'uint', 1073741824, 'uint', 0, 'ptr', 0, 'uint', $flzcodzoep ? 3 : 2, 'uint', 128, 'ptr', 0)
	Return $flogmfcakq[0]
EndFunc

GUIDelete()

Func aremfkxlayv($fllsczdyhr, $flbfzgxbcy, $flutgabjfj)
	If $fllsczdyhr <> -1 Then
		Local $flvfnkosuf = DllCall('kernel32.dll', 'uint', 'SetFilePointer', 'ptr', $fllsczdyhr, 'long', 0, 'ptr', 0, 'uint', 2)
		If $flvfnkosuf[0] <> -1 Then
			Local $flwzfbbkto = DllStructCreate('uint')
			$flvfnkosuf = DllCall('kernel32.dll', 'ptr', 'WriteFile', 'ptr', $fllsczdyhr, 'ptr', $flbfzgxbcy, 'uint', $flutgabjfj, 'ptr', DllStructGetPtr($flwzfbbkto), 'ptr', 0)
			If $flvfnkosuf[0] <> 0 AND DllStructGetData($flwzfbbkto, 1) = $flutgabjfj Then
				Return 0
			EndIf
		EndIf
	EndIf
	Return -1
EndFunc

Func call_ReadFile($hFile, ByRef $lpBuffer)
	Local $flqcvtzthz = DllStructCreate('struct;dword;endstruct')
	Local $flqnsbzfsf = DllCall('kernel32.dll', 'int', 'ReadFile', 'ptr', $hFile, 'struct*', $lpBuffer, 'dword', DllStructGetSize($lpBuffer), 'struct*', $flqcvtzthz, 'ptr', 0)
	Return $flqnsbzfsf[0]
EndFunc

Func call_CloseHandle($fldiapcptm)
	Local $flhvhgvtxm = DllCall('kernel32.dll', 'int', 'CloseHandle', 'ptr', $fldiapcptm)
	Return $flhvhgvtxm[0]
EndFunc

Func delete_file($flxljyoycl)
	Local $flaubrmoip = DllCall('kernel32.dll', 'int', 'DeleteFileA', 'str', $flxljyoycl)
	Return $flaubrmoip[0]
EndFunc

Func call_GetFileSize($flpxhqhcav)
	Local $flzmcdhzwh = -1
	Local $flztpegdeg = DllStructCreate('struct;dword;endstruct')
	Local $flekmcmpdl = DllCall('kernel32.dll', 'dword', 'GetFileSize', 'ptr', $flpxhqhcav, 'struct*', $flztpegdeg)
	If $flekmcmpdl <> -1 Then
		$flzmcdhzwh = $flekmcmpdl[0] + Number(DllStructGetData($flztpegdeg, 1))
	EndIf
	Return $flzmcdhzwh
EndFunc

Func areihnvapwn()
	Local $dlit = "7374727563743b75696e7420626653697a653b75696e7420626652657365727665643b75696e742062664f6666426974733b"
	$dlit &= "75696e7420626953697a653b696e7420626957696474683b696e742062694865696768743b7573686f7274206269506c616e"
	$dlit &= "65733b7573686f7274206269426974436f756e743b75696e74206269436f6d7072657373696f6e3b75696e7420626953697a"
	$dlit &= "65496d6167653b696e742062695850656c735065724d657465723b696e742062695950656c735065724d657465723b75696e"
	$dlit &= "74206269436c72557365643b75696e74206269436c72496d706f7274616e743b656e647374727563743b4FD5$626653697a6"
	$dlit &= "54FD5$626652657365727665644FD5$62664f6666426974734FD5$626953697a654FD5$626957696474684FD5$6269486569"
	$dlit &= "6768744FD5$6269506c616e65734FD5$6269426974436f756e744FD5$6269436f6d7072657373696f6e4FD5$626953697a65"
	$dlit &= "496d6167654FD5$62695850656c735065724d657465724FD5$62695950656c735065724d657465724FD5$6269436c7255736"
	$dlit &= "5644FD5$6269436c72496d706f7274616e744FD5$7374727563743b4FD5$627974655b4FD5$5d3b4FD5$656e647374727563"
	$dlit &= "744FD5$4FD5$2e626d704FD5$5c4FD5$2e646c6c4FD5$7374727563743b64776f72643b636861725b313032345d3b656e647"
	$dlit &= "374727563744FD5$6b65726e656c33322e646c6c4FD5$696e744FD5$476574436f6d70757465724e616d65414FD5$7074724"
	$dlit &= "FD5$436f6465497420506c7573214FD5$7374727563743b627974655b4FD5$5d3b656e647374727563744FD5$73747275637"
	$dlit &= "43b627974655b35345d3b627974655b4FD5$7374727563743b7074723b7074723b64776f72643b627974655b33325d3b656e"
	$dlit &= "647374727563744FD5$61647661706933322e646c6c4FD5$437279707441637175697265436f6e74657874414FD5$64776f7"
	$dlit &= "2644FD5$4372797074437265617465486173684FD5$437279707448617368446174614FD5$7374727563742a4FD5$4372797"
	$dlit &= "07447657448617368506172616d4FD5$30784FD5$30383032304FD5$30303031304FD5$36363030304FD5$30323030304FD5"
	$dlit &= "$303030304FD5$43443442334FD5$32433635304FD5$43463231424FD5$44413138344FD5$44383931334FD5$45364639324"
	$dlit &= "FD5$30413337414FD5$34463339364FD5$33373336434FD5$30343243344FD5$35394541304FD5$37423739454FD5$413434"
	$dlit &= "33464FD5$46443138394FD5$38424145344FD5$39423131354FD5$46364342314FD5$45324137434FD5$31414233434FD5$3"
	$dlit &= "4433235364FD5$31324135314FD5$39303335464FD5$31384642334FD5$42313735324FD5$38423341454FD5$43414633444"
	$dlit &= "FD5$34383045394FD5$38424638414FD5$36333544414FD5$46393734454FD5$30303133354FD5$33354432334FD5$314534"
	$dlit &= "42374FD5$35423243334FD5$38423830344FD5$43374145344FD5$44323636414FD5$33374233364FD5$46324335354FD5$3"
	$dlit &= "5424633414FD5$39454136414FD5$35384243384FD5$46393036434FD5$43363635454FD5$41453243454FD5$36304632434"
	$dlit &= "FD5$44453338464FD5$44333032364FD5$39434334434FD5$45354242304FD5$39303437324FD5$46463942444FD5$323646"
	$dlit &= "39314FD5$31394238434FD5$34383446454FD5$36394542394FD5$33344634334FD5$46454544454FD5$44434542414FD5$3"
	$dlit &= "7393134364FD5$30383139464FD5$42323146314FD5$30463833324FD5$42324135444FD5$34443737324FD5$44423132434"
	$dlit &= "FD5$33424544394FD5$34374636464FD5$37303641454FD5$34343131414FD5$35324FD5$7374727563743b7074723b70747"
	$dlit &= "23b64776f72643b627974655b383139325d3b627974655b4FD5$5d3b64776f72643b656e647374727563744FD5$437279707"
	$dlit &= "4496d706f72744b65794FD5$4372797074446563727970744FD5$464c4152454FD5$4552414c464FD5$43727970744465737"
	$dlit &= "4726f794b65794FD5$437279707452656c65617365436f6e746578744FD5$437279707444657374726f79486173684FD5$73"
	$dlit &= "74727563743b7074723b7074723b64776f72643b627974655b31365d3b656e647374727563744FD5$7374727563743b64776"
	$dlit &= "f72643b64776f72643b64776f72643b64776f72643b64776f72643b627974655b3132385d3b656e647374727563744FD5$47"
	$dlit &= "657456657273696f6e4578414FD5$456e746572207465787420746f20656e636f64654FD5$43616e2068617a20636f64653f"
	$dlit &= "4FD5$4FD5$48656c704FD5$41626f757420436f6465497420506c7573214FD5$7374727563743b64776f72643b64776f7264"
	$dlit &= "3b627974655b333931385d3b656e647374727563744FD5$696e743a636465636c4FD5$6a75737447656e6572617465515253"
	$dlit &= "796d626f6c4FD5$7374724FD5$6a757374436f6e76657274515253796d626f6c546f4269746d6170506978656c734FD5$546"
	$dlit &= "869732070726f6772616d2067656e65726174657320515220636f646573207573696e6720515220436f64652047656e65726"
	$dlit &= "1746f72202868747470733a2f2f7777772e6e6179756b692e696f2f706167652f71722d636f64652d67656e657261746f722"
	$dlit &= "d6c6962726172792920646576656c6f706564206279204e6179756b692e204FD5$515220436f64652047656e657261746f72"
	$dlit &= "20697320617661696c61626c65206f6e20476974487562202868747470733a2f2f6769746875622e636f6d2f6e6179756b69"
	$dlit &= "2f51522d436f64652d67656e657261746f722920616e64206f70656e2d736f757263656420756e6465722074686520666f6c"
	$dlit &= "6c6f77696e67207065726d697373697665204d4954204c6963656e7365202868747470733a2f2f6769746875622e636f6d2f"
	$dlit &= "6e6179756b692f51522d436f64652d67656e657261746f72236c6963656e7365293a4FD5$436f7079726967687420c2a9203"
	$dlit &= "23032302050726f6a656374204e6179756b692e20284d4954204c6963656e7365294FD5$68747470733a2f2f7777772e6e61"
	$dlit &= "79756b692e696f2f706167652f71722d636f64652d67656e657261746f722d6c6962726172794FD5$5065726d697373696f6"
	$dlit &= "e20697320686572656279206772616e7465642c2066726565206f66206368617267652c20746f20616e7920706572736f6e2"
	$dlit &= "06f627461696e696e67206120636f7079206f66207468697320736f66747761726520616e64206173736f636961746564206"
	$dlit &= "46f63756d656e746174696f6e2066696c6573202874686520536f667477617265292c20746f206465616c20696e207468652"
	$dlit &= "0536f66747761726520776974686f7574207265737472696374696f6e2c20696e636c7564696e6720776974686f7574206c6"
	$dlit &= "96d69746174696f6e207468652072696768747320746f207573652c20636f70792c206d6f646966792c206d657267652c207"
	$dlit &= "075626c6973682c20646973747269627574652c207375626c6963656e73652c20616e642f6f722073656c6c20636f7069657"
	$dlit &= "3206f662074686520536f6674776172652c20616e6420746f207065726d697420706572736f6e7320746f2077686f6d20746"
	$dlit &= "86520536f667477617265206973206675726e697368656420746f20646f20736f2c207375626a65637420746f20746865206"
	$dlit &= "66f6c6c6f77696e6720636f6e646974696f6e733a4FD5$312e205468652061626f766520636f70797269676874206e6f7469"
	$dlit &= "636520616e642074686973207065726d697373696f6e206e6f74696365207368616c6c20626520696e636c7564656420696e"
	$dlit &= "20616c6c20636f70696573206f72207375627374616e7469616c20706f7274696f6e73206f662074686520536f6674776172"
	$dlit &= "652e4FD5$322e2054686520536f6674776172652069732070726f76696465642061732069732c20776974686f75742077617"
	$dlit &= "272616e7479206f6620616e79206b696e642c2065787072657373206f7220696d706c6965642c20696e636c7564696e67206"
	$dlit &= "27574206e6f74206c696d6974656420746f207468652077617272616e74696573206f66206d65726368616e746162696c697"
	$dlit &= "4792c206669746e65737320666f72206120706172746963756c617220707572706f736520616e64206e6f6e696e6672696e6"
	$dlit &= "7656d656e742e20496e206e6f206576656e74207368616c6c2074686520617574686f7273206f7220636f707972696768742"
	$dlit &= "0686f6c64657273206265206c6961626c6520666f7220616e7920636c61696d2c2064616d61676573206f72206f746865722"
	$dlit &= "06c696162696c6974792c207768657468657220696e20616e20616374696f6e206f6620636f6e74726163742c20746f72742"
	$dlit &= "06f72206f74686572776973652c2061726973696e672066726f6d2c206f7574206f66206f7220696e20636f6e6e656374696"
	$dlit &= "f6e20776974682074686520536f667477617265206f722074686520757365206f72206f74686572206465616c696e6773206"
	$dlit &= "96e2074686520536f6674776172652e4FD5$7374727563743b7573686f72743b656e647374727563744FD5$7374727563743"
	$dlit &= "b627974653b627974653b627974653b656e647374727563744FD5$43726561746546696c654FD5$75696e744FD5$53657446"
	$dlit &= "696c65506f696e7465724FD5$6c6f6e674FD5$577269746546696c654FD5$7374727563743b64776f72643b656e647374727"
	$dlit &= "563744FD5$5265616446696c654FD5$436c6f736548616e646c654FD5$44656c65746546696c65414FD5$47657446696c655"
	$dlit &= "3697a65"
	Global $os = StringSplit($dlit, "4FD5$", 1)
EndFunc

Func arehdidxrgk($flqlnxgxbp)
	Local $flqlnxgxbp_
	For $flrctqryub = 1 To StringLen($flqlnxgxbp) Step 2
		$flqlnxgxbp_ &= Chr(Dec(StringMid($flqlnxgxbp, $flrctqryub, 2)))
	Next
	Return $flqlnxgxbp_
EndFunc
