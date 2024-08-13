import SwiftUI


struct Checkbox: View {
    @Binding var isChecked: Bool
    var key: Int // Pass the key to track the checkbox state for each item

    var body: some View {
        Image(systemName: isChecked ? "checkmark.square" : "square")
            .resizable()
            .frame(width: 24, height: 24)
            .foregroundColor(.white)
            .onTapGesture {
                isChecked.toggle()
                saveCheckboxState()
            }
    }
    
    func saveCheckboxState() {
        let defaults = UserDefaults.standard
        defaults.set(isChecked, forKey: "checkboxState_\(key)")
    }
}

func loadCheckboxState(key: Int) -> Bool {
    let defaults = UserDefaults.standard
    return defaults.bool(forKey: "checkboxState_\(key)")
}

var appVersion: String {
    return Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String ?? "Unknown"
}

var buildNumber: String {
    return Bundle.main.object(forInfoDictionaryKey: "CFBundleVersion") as? String ?? "Unknown"
}

let countriesList: [Int: (country: String, flag: String)] = [
    1: ("Italy", "it"),
    2: ("United States Of America", "us"),
    3: ("Brazil", "br"),
    4: ("Argentina", "ar"),
    5: ("Venezuela", "ve"),
    6: ("Colombia", "co"),
    7: ("Netherlands Antilles [DELETED]", "cw"),
    8: ("Peru", "pe"),
    9: ("Canada", "ca"),
    10: ("Mexico", "mx"),
    11: ("Puerto Rico", "pr"),
    12: ("Uruguay", "uy"),
    13: ("Germany", "de"),
    14: ("France", "fr"),
    15: ("Switzerland", "ch"),
    16: ("Belgium", "be"),
    17: ("Hawaiian Islands", "us"),
    18: ("Greece", "gr"),
    19: ("Netherlands", "nl"),
    20: ("Norway", "no"),
    21: ("Sweden", "se"),
    22: ("French Guyana", "gf"),
    23: ("Jamaica", "jm"),
    24: ("Panama", "pa"),
    25: ("Japan", "jp"),
    26: ("England", "gb-eng"),
    27: ("Iceland", "is"),
    28: ("Honduras", "hn"),
    29: ("Ireland", "ie"),
    30: ("Spain", "es"),
    31: ("Portugal", "pt"),
    32: ("Chile", "cl"),
    33: ("Alaska", "us"),
    34: ("Canary Islands", "es"),
    35: ("Austria", "at"),
    36: ("San Marino", "sm"),
    37: ("Dominican Republic", "do"),
    38: ("Greenland", "gl"),
    39: ("Angola", "ao"),
    40: ("Liechtenstein", "li"),
    41: ("New Zealand", "nz"),
    42: ("Liberia", "lr"),
    43: ("Australia", "au"),
    44: ("South Africa", "za"),
    45: ("Serbia", "rs"),
    46: ("East Germany [DELETED]", "de"),
    47: ("Denmark", "dk"),
    48: ("Saudi Arabia", "sa"),
    49: ("Balearic Islands", "es"),
    50: ("European Russia", "ru"),
    51: ("Andorra", "ad"),
    52: ("Faroe Islands", "fo"),
    53: ("El Salvador", "sv"),
    54: ("Luxembourg", "lu"),
    55: ("Gibraltar", "gi"),
    56: ("Finland", "fi"),
    57: ("India", "in"),
    58: ("East Malaysia", "my"),
    59: ("Dodecanese Islands", "gr"),
    60: ("Hong Kong", "hk"),
    61: ("Ecuador", "ec"),
    62: ("Guam Island", "gu"),
    63: ("St. Helena Island", "sh"),
    64: ("Senegal", "sn"),
    65: ("Sierra Leone", "sl"),
    66: ("Mauritania", "mr"),
    67: ("Paraguay", "py"),
    68: ("Northern Ireland", "gb-nir"),
    69: ("Costa Rica", "cr"),
    70: ("American Samoa Islands", "ws"),
    71: ("Midway Islands", "um"),
    72: ("Guatemala", "gt"),
    73: ("Suriname", "sr"),
    74: ("Namibia", "na"),
    75: ("Azores Islands", "pt"),
    76: ("Morocco", "ma"),
    77: ("Ghana", "gh"),
    78: ("Zambia", "zm"),
    79: ("Philippine Islands", "ph"),
    80: ("Bolivia", "bo"),
    81: ("San Andres & Providencia", "co"),
    82: ("Guantanamo Bay", "us"),
    83: ("Tanzania", "tz"),
    84: ("Ivory Coast", "ci"),
    85: ("Zimbabwe", "zw"),
    86: ("Nepal", "np"),
    87: ("Yemen [DELETED]", "ye"),
    88: ("Cuba", "cu"),
    89: ("Nigeria", "ng"),
    90: ("Crete Island", "gr"),
    91: ("Indonesia", "id"),
    92: ("Libya", "ly"),
    93: ("Malta", "mt"),
    94: ("United Arab Emirates", "ae"),
    95: ("Mongolia", "mn"),
    96: ("Tonga Islands", "to"),
    97: ("Israel", "il"),
    98: ("Singapore", "sg"),
    99: ("Fiji Islands", "fj"),
    100: ("Korea", "kr"),
    101: ("Papua - New Guinea", "pg"),
    102: ("Kuwait", "kw"),
    103: ("Haiti", "ht"),
    104: ("Corsica", "fr"),
    105: ("Botswana", "bw"),
    106: ("Ceuta & Melilla", "es"),
    107: ("Monaco", "mc"),
    108: ("Scotland", "gb-sct"),
    109: ("Hungary", "hu"),
    110: ("Cyprus", "cy"),
    111: ("Jordan", "jo"),
    112: ("Lebanon", "lb"),
    113: ("West Malaysia", "my"),
    114: ("Pakistan", "pk"),
    115: ("Qatar", "qa"),
    116: ("Turkey", "tr"),
    117: ("Egypt", "eg"),
    118: ("The Gambia", "gm"),
    119: ("Madeira Island", "pt"),
    120: ("Antigua & Barbuda Isl", "ag"),
    121: ("The Bahamas", "bs"),
    122: ("Barbados Island", "bb"),
    123: ("Bermuda Island", "bm"),
    124: ("Amsterdam & St. Paul Isl", "fr"),
    125: ("Cayman Islands", "ky"),
    126: ("Nicaragua", "ni"),
    127: ("Virgin Islands", "vg"),
    128: ("British Virgin Isl.", "vg"),
    129: ("Macquarie Islands", "au"),
    130: ("Norfolk Islands", "nf"),
    131: ("Guyana", "gy"),
    132: ("Marshall Islands", "mh"),
    133: ("Marianas Islands", "mp"),
    134: ("Republic Of Belau", "pw"),
    135: ("Solomon Islands", "sb"),
    136: ("Martinique Island", "mq"),
    137: ("Isle Of Man", "im"),
    138: ("Vatican City State", "it"),
    139: ("Southern Yemen [DELETED]", "ye"),
    140: ("Antarctica", "aq"),
    141: ("St. Pierre & Miquelon", "pm"),
    142: ("Lesotho", "ls"),
    143: ("St. Lucia Island", "lc"),
    144: ("Easter Island", "cl"),
    145: ("Galapagos Islands", "ec"),
    146: ("Algeria", "dz"),
    147: ("Tunisia", "tn"),
    148: ("Ascension Island", "sh"),
    149: ("Laccadive Islands", "in"),
    150: ("Bahrain", "bh"),
    151: ("Iraq", "iq"),
    152: ("Maldives Islands", "mv"),
    153: ("Thailand", "th"),
    154: ("Iran", "ir"),
    155: ("Taiwan", "tw"),
    156: ("Cameroon", "cm"),
    157: ("Montserrat Island", "ms"),
    158: ("Trinidad & Tobago Isl", "tt"),
    159: ("Somali Republic", "et"),
    160: ("Sudan", "sd"),
    161: ("Poland", "pl"),
    162: ("Democratic Republic Of Congo", "cd"),
    163: ("Wales", "gb-wls"),
    164: ("Togo Republic", "tg"),
    165: ("Sardinia", "it"),
    166: ("Saba & St.Eustatius & St. Maarten [DELETED]", "sx"),
    167: ("Jersey Island", "je"),
    168: ("Mauritius Islands", "mu"),
    169: ("Guernsey Island & Depend", "gg"),
    170: ("Burkina Faso", "bf"),
    171: ("Svalbard Islands", "sj"),
    172: ("New Caledonia", "nc"),
    173: ("Reunion Island", "re"),
    174: ("Uganda", "ug"),
    175: ("Chad Republic", "td"),
    176: ("Central African Republic", "cf"),
    177: ("Sri Lanka", "lk"),
    178: ("Bulgaria", "bg"),
    179: ("Czechoslovakia [DELETED]", "cz"),
    180: ("Oman", "om"),
    181: ("Syria", "sy"),
    182: ("Republic Of Guinea", "gn"),
    183: ("Benin", "bj"),
    184: ("Burundi", "bi"),
    185: ("Comoros Islands", "km"),
    186: ("Djibouti", "dj"),
    187: ("Kenya", "ke"),
    188: ("Malagasy Republic", "mg"),
    189: ("Mayotte Island", "yt"),
    190: ("Seychelles Islands", "sc"),
    191: ("Swaziland / Kingdom of Eswatini", "sz"),
    192: ("Cocos Islands", "cc"),
    193: ("Keeling Islands", "cc"),
    194: ("Dominica Island", "dm"),
    195: ("Grenada Island & Dependent", "gd"),
    196: ("Guadeloupe Islands", "gp"),
    197: ("Vanuatu Islands", "vu"),
    198: ("Falkland Islands", "fk"),
    199: ("Equatorial Guinea", "gq"),
    200: ("South Shetland Islands", "gb"),
    201: ("French Polynesia", "pf"),
    202: ("Bhutan", "bt"),
    203: ("China", "cn"),
    204: ("Mozambique", "mz"),
    205: ("Republic Of Cape Verde", "cv"),
    206: ("Ethiopia", "et"),
    207: ("St. Martin Island", "mf"),
    208: ("Glorieuses Islands", "gl"),
    209: ("Juan De Nova Island", "fr"),
    210: ("Wallis & Futuna Islands", "wf"),
    211: ("Jan Mayen Island", "sj"),
    212: ("Aland Islands", "ax"),
    213: ("Market Reef", "fi"),
    214: ("Congo Republic", "cd"),
    215: ("Gabon Republic", "ga"),
    216: ("Mali", "ml"),
    217: ("Christmas Island", "cx"),
    218: ("Belize", "bz"),
    219: ("Anguilla Island", "ai"),
    220: ("St. Vincent Island & Dependencies", "vc"),
    221: ("South Orkney Islands", "gb"),
    222: ("South Sandwich Islands", "gs"),
    223: ("Western Samoa Islands", "ws"),
    224: ("Western Kiribati", "ki"),
    225: ("Brunei", "bn"),
    226: ("Malawi", "mw"),
    227: ("Rwanda", "rw"),
    228: ("Chagos Islands", "io"),
    229: ("Heard Island", "hm"),
    230: ("Federated States Of Micronesia", "fm"),
    231: ("St. Peter & St. Paul Rock", "br"),
    232: ("Aruba Island", "aw"),
    233: ("Romania", "ro"),
    234: ("Afghanistan", "af"),
    235: ("I.T.U. Geneva", "ch"),
    236: ("Bangladesh", "bd"),
    237: ("Union Of Myanmar", "mm"),
    238: ("Cambodia", "kh"),
    239: ("Laos", "la"),
    240: ("Macao", "mo"),
    241: ("Spratly Island", "cn"),
    242: ("Vietnam", "vn"),
    243: ("Gleam & St.Brandon Isl", "mu"),
    244: ("Pagalu Island", "gq"),
    245: ("Niger Republic", "ne"),
    246: ("Sao Tome & Principe Isl", "st"),
    247: ("Navassa Island", "um"),
    248: ("Turks & Caicos Islands", "tc"),
    249: ("Northern Cook Islands", "ck"),
    250: ("Cook Islands", "ck"),
    251: ("Albania", "al"),
    252: ("Revillagigedo Islands", "mx"),
    253: ("Andaman & Nicobar Island", "in"),
    254: ("Mount Athos", "lr"),
    255: ("Kerguelen Islands", "tf"),
    256: ("Prince Edward & Marion Islands", "ca"),
    257: ("Rodriguez Island", "mu"),
    258: ("Tristan Da Cunha & Gough", "sh"),
    259: ("Tromelin Island", "re"),
    260: ("Baker & Howland Islands", "um"),
    261: ("Chatham Islands", "nz"),
    262: ("Johnston Island", "um"),
    263: ("Kermadec Islands", "nz"),
    264: ("Kingman Reef", "um"),
    265: ("Central Kiribati", "ki"),
    266: ("Eastern Kiribati", "ki"),
    267: ("Kure Island", "us"),
    268: ("Lord Howe Islands", "au"),
    269: ("Mellish Reef", "au"),
    270: ("Minami Torishima Island", "jp"),
    271: ("Republic Of Nauru", "nr"),
    272: ("Niue Island", "nu"),
    273: ("Jarvis & Palmyra Islands", "um"),
    274: ("Pitcairn Island", "pn"),
    275: ("Tokelau Islands", "tk"),
    276: ("Tuvalu Islands", "tv"),
    277: ("Sable Island", "gb"),
    278: ("Wake Island", "um"),
    279: ("Willis Islets", "um"),
    280: ("Aves Island", "ve"),
    281: ("Ogasawara Islands", "jp"),
    282: ("Auckland & Campbell Islands", "nz"),
    283: ("St. Kitts & Nevis Island", "kn"),
    284: ("St. Paul Island", "kn"),
    285: ("Fernando De Noronha Islands", "tt"),
    286: ("Juan Fernandez Islands", "tt"),
    287: ("Malpelo Island", "co"),
    288: ("San Felix & San Ambrosio", "cl"),
    289: ("South Georgia Islands", "gs"),
    290: ("Trindade & Martim Vaz Islands", "br"),
    291: ("Dhekelia & Akrotiri", "cy"),
    292: ("Abu-ail & Jabal-al-tairu [DELETED]", "ye"),
    293: ("Guinea Bissau", "gw"),
    294: ("Peter 1st Island", "aq"),
    295: ("Southern Sudan [DELETED]", "ss"),
    296: ("Clipperton Island", "fr"),
    297: ("Bouvet Island", "bv"),
    298: ("Crozet Islands", "tf"),
    299: ("Desecheo Island", "pr"),
    300: ("West Sahara", "eh"),
    301: ("Armenia", "am"),
    302: ("Asiatic Russia", "ru"),
    303: ("Azerbaijan", "az"),
    304: ("Estonia", "ee"),
    305: ("Franz Josef Land", "ru"),
    306: ("Georgia", "ge"),
    307: ("Kaliningradsk", "ru"),
    308: ("Kazakh", "kz"),
    309: ("Kyrgyzstan", "kg"),
    310: ("Latvia", "lv"),
    311: ("Lithuania", "lt"),
    312: ("Moldavia", "md"),
    313: ("Tajikistan", "tj"),
    314: ("Turkoman", "tm"),
    315: ("Ukraine", "ua"),
    316: ("Uzbek", "uz"),
    317: ("Belarus", "by"),
    318: ("Survey Military Of Malta", "mt"),
    319: ("United Nations New York", "us"),
    320: ("Banaba Island", "ki"),
    321: ("Conway Reef", "io"),
    322: ("Walvis Bay [DELETED]", "na"),
    323: ("Yemen Republic", "ye"),
    324: ("Penguin Islands [DELETED]", "au"),
    325: ("Rotuma Island", "fj"),
    326: ("Malyj Vytsotskj [DELETED]", "fi"),
    327: ("Slovenia", "si"),
    328: ("Croatia", "hr"),
    329: ("Czech Rep", "cz"),
    330: ("Slovak Rep", "sk"),
    331: ("Bosnia", "ba"),
    332: ("Macedonia", "mk"),
    333: ("Eritrea", "er"),
    334: ("North Korea", "kp"),
    335: ("Scarborough Reef", "cn"),
    336: ("Pratas Island", "cn"),
    337: ("Austral Islands", "pf"),
    338: ("Marquesas Islands", "pf"),
    339: ("Temotu", "sb"),
    340: ("Palestina", "ps"),
    341: ("East Timor", "tl"),
    342: ("Chesterfields Islands", "nc"),
    343: ("Ducie Island", "pn"),
    344: ("Republic Of Montenegro", "me"),
    345: ("Swains Island", "as"),
    346: ("St. Barthelemy Is.", "bl"),
    347: ("Curacao", "cw"),
    348: ("St. Maarten", "sx"),
    349: ("Saba And St. Eustatius", "bq"),
    350: ("Bonaire", "bq"),
    351: ("South Sudan", "ss"),
    352: ("Republic of Kosovo", "xk")
]

struct ContentView: View {
    @State private var checkedItems: [Int: Bool] = [:] // State to track the checkbox status for each item

    init() {
        for key in countriesList.keys {
            _checkedItems = State(initialValue: [key: loadCheckboxState(key: key)])
        }
    }

    var body: some View {
        VStack {
            Text("11M Divisions")
                .font(.largeTitle)
                .foregroundColor(.white)
                .padding(.top)
           
            ScrollView {
                VStack(alignment: .leading) {
                    ForEach(countriesList.sorted(by: { $0.key < $1.key }), id: \.key) { key, value in
                        HStack {
                            Text("\(key)")
                            Text(value.country)
                            Spacer()
                            Image(value.flag)
                                .resizable()
                                .frame(width: 32, height: 32)
                            Checkbox(isChecked: Binding(
                                get: { self.checkedItems[key] ?? false },
                                set: { self.checkedItems[key] = $0 }
                            ), key: key) // Pass the key to the Checkbox view
                        }
                        .padding()
                        Divider()
                    }
                }
                .padding()
                .foregroundColor(.white)
            }
 
            
            Spacer()

            Text("\(appVersion).\(buildNumber) 2024 Andy Clements EI3KF")
                .font(.footnote)
                .foregroundColor(.white)
                .padding(.bottom)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black)
    }
}


#Preview {
    ContentView()
}
