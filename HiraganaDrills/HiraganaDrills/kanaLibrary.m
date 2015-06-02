#import "kanaLibrary.h"

NSDictionary* HIRAGANA_PAIR_DICT;
NSDictionary* HIRAGANA_DICT;
NSDictionary* KATAKANA_PAIR_DICT;
NSDictionary* KATAKANA_DICT;
NSDictionary* HIRAGANA_WORD_DICT;


void initializePairDict() {

    HIRAGANA_PAIR_DICT = @{
       @"ぁ": @"a", @"い": @"i", @"う": @"u", @"え": @"e",
       @"お": @"o", @"か": @"ka", @"き": @"ki", @"く": @"ku",
       @"け": @"ke", @"こ": @"ko", @"さ": @"sa", @"し": @"shi",
       @"す": @"su", @"せ": @"se", @"そ": @"so", @"た": @"ta",
       @"ち": @"chi", @"つ": @"tsu", @"て": @"te", @"と": @"to",
       @"な": @"na", @"に": @"ni", @"ぬ": @"nu", @"ね": @"ne",
       @"の": @"no", @"は": @"ha", @"ひ": @"hi", @"ふ": @"hu",
       @"へ": @"he", @"ほ": @"ho", @"ま": @"ma", @"み": @"mi",
       @"む": @"mu", @"め": @"me", @"も": @"mo", @"や": @"ya",
       @"ゆ": @"yu", @"よ": @"yo", @"ら": @"ra", @"り": @"ri",
       @"る": @"ru", @"れ": @"re", @"ろ": @"ro", @"わ": @"wa",
       @"を": @"wo", @"が": @"ga", @"ぎ": @"gi", @"ぐ": @"gu",
       @"げ": @"ge", @"ご": @"go", @"ざ": @"za", @"じ": @"ji",
       @"ず": @"zu", @"ぜ": @"ze", @"ぞ": @"zo", @"だ": @"da",
       @"ぢ": @"di", @"づ": @"du", @"で": @"de", @"ど": @"do",
       @"ば": @"ba", @"び": @"bi", @"ぶ": @"bu", @"べ": @"be",
       @"ぼ": @"bo", @"ぱ": @"pa", @"ぴ": @"pi", @"ぷ": @"pu",
       @"ぺ": @"pe", @"ぽ": @"po", @"ん": @"n",
       @"きゃ": @"kya", @"きゅ": @"kyu", @"きょ": @"kyo",
       @"ぎゃ": @"gya", @"ぎゅ": @"gyu", @"ぎょ": @"gyo",
       @"しゃ": @"shya", @"しゅ": @"shyu", @"しょ": @"shyo",
       @"じゃ": @"jya", @"じゅ": @"jyu", @"じょ": @"jyo",
       @"ちゃ": @"chya", @"ちゅ": @"chyu", @"ちょ": @"chyo",
       @"にゃ": @"nya", @"にゅ": @"nyu", @"にょ": @"nyo",
       @"ひゃ": @"hya", @"ひゅ": @"hyu", @"ひょ": @"hyo",
       @"びゃ": @"bya", @"びゅ": @"byu", @"びょ": @"byo",
       @"ぴゃ": @"pya", @"ぴゅ": @"pyu", @"ぴょ": @"pyo",
       @"みゃ": @"mya", @"みゅ": @"myu", @"みょ": @"myo",
       @"りゃ": @"rya", @"りゅ": @"ryu", @"りょ": @"ryo",
       @"ぢゃ": @"dya", @"ぢゅ": @"dyu", @"ぢょ": @"dyo"
       };

    
    KATAKANA_PAIR_DICT = @{
       @"ア": @"a", @"イ": @"i", @"ウ": @"u", @"エ": @"e", @"オ": @"o",
       @"カ": @"ka", @"キ": @"ki", @"ク": @"ku", @"ケ": @"ke", @"コ": @"ko",
       @"サ": @"sa", @"シ": @"shi", @"ス": @"su", @"セ": @"se", @"ソ": @"so",
       @"タ": @"ta", @"チ": @"chi", @"ツ": @"tsu", @"テ": @"te", @"ト": @"to",
       @"ナ": @"na", @"ニ": @"ni", @"ヌ": @"nu", @"ネ": @"ne", @"ノ": @"no",
       @"ハ": @"ha", @"ヒ": @"hi", @"フ": @"fu", @"ヘ": @"he", @"ホ": @"ho",
       @"マ": @"ma", @"ミ": @"mi", @"ム": @"mu", @"メ": @"me", @"モ": @"mo",
       @"ラ": @"ra", @"リ": @"ri", @"ル": @"ru", @"レ": @"re", @"ロ": @"ro",
       @"ガ": @"ga", @"ギ": @"gi", @"グ": @"gu", @"ゲ": @"ge", @"ゴ": @"go",
       @"ザ": @"za", @"ジ": @"ji", @"ズ": @"zu", @"ゼ": @"ze", @"ゾ": @"zo",
       @"ダ": @"da", @"ヂ": @"di", @"ヅ": @"du", @"デ": @"de", @"ド": @"do",
       @"バ": @"ba", @"ビ": @"bi", @"ブ": @"bu", @"ベ": @"be", @"ボ": @"bo",
       @"パ": @"pa", @"ピ": @"pi", @"プ": @"pu", @"ペ": @"pe", @"ポ": @"po",
       @"ヤ": @"ya", @"ユ": @"yu", @"ヨ": @"yo", @"ン": @"n",
       @"ワ": @"wa", @"ヰ": @"wi", @"ヱ": @"we", @"ヲ": @"wo",
       @"キヤ": @"kya",    @"キユ": @"kyu",    @"キヨ": @"kyo",
       @"ギヤ": @"gya",    @"ギユ": @"gyu",    @"ギヨ": @"gyo",
       @"シヤ": @"shya",   @"シユ": @"shyu",   @"シヨ": @"shyo",
       @"ジヤ": @"jya",    @"ジユ": @"jyu",    @"ジヨ": @"jyo",
       @"チヤ": @"chya",   @"チユ": @"chyu",   @"チヨ": @"chyo",
       @"ニヤ": @"nya",    @"ニユ": @"nyu",    @"ニヨ": @"nyo",
       @"ヒヤ": @"hya",    @"ヒユ": @"hyu",    @"ヒヨ": @"hyo",
       @"ビヤ": @"bya",    @"ビユ": @"byu",    @"ビヨ": @"byo",
       @"ピヤ": @"pya",    @"ピユ": @"pyu",    @"ピヨ": @"pyo",
       @"ミヤ": @"mya",    @"ミユ": @"myu",    @"ミヨ": @"myo",
       @"リヤ": @"rya",    @"リユ": @"ryu",    @"リヨ": @"ryo",
       @"ヂヤ": @"dya",    @"ヂユ": @"dyu",    @"ヂヨ": @"dyo"
       };

    HIRAGANA_DICT = @{
      @"ぁ": @"a", @"い": @"i", @"う": @"u", @"え": @"e",
      @"お": @"o", @"か": @"ka", @"き": @"ki", @"く": @"ku",
      @"け": @"ke", @"こ": @"ko", @"さ": @"sa", @"し": @"shi",
      @"す": @"su", @"せ": @"se", @"そ": @"so", @"た": @"ta",
      @"ち": @"chi", @"つ": @"tsu", @"て": @"te", @"と": @"to",
      @"な": @"na", @"に": @"ni", @"ぬ": @"nu", @"ね": @"ne",
      @"の": @"no", @"は": @"ha", @"ひ": @"hi", @"ふ": @"hu",
      @"へ": @"he", @"ほ": @"ho", @"ま": @"ma", @"み": @"mi",
      @"む": @"mu", @"め": @"me", @"も": @"mo", @"や": @"ya",
      @"ゆ": @"yu", @"よ": @"yo", @"ら": @"ra", @"り": @"ri",
      @"る": @"ru", @"れ": @"re", @"ろ": @"ro", @"わ": @"wa",
      @"を": @"wo", @"が": @"ga", @"ぎ": @"gi", @"ぐ": @"gu",
      @"げ": @"ge", @"ご": @"go", @"ざ": @"za", @"じ": @"ji",
      @"ず": @"zu", @"ぜ": @"ze", @"ぞ": @"zo", @"だ": @"da",
      @"ぢ": @"di", @"づ": @"du", @"で": @"de", @"ど": @"do",
      @"ば": @"ba", @"び": @"bi", @"ぶ": @"bu", @"べ": @"be",
      @"ぼ": @"bo", @"ぱ": @"pa", @"ぴ": @"pi", @"ぷ": @"pu",
      @"ぺ": @"pe", @"ぽ": @"po", @"ん": @"n"
      };

    KATAKANA_DICT = @{
       @"ア": @"a", @"イ": @"i", @"ウ": @"u", @"エ": @"e", @"オ": @"o",
       @"カ": @"ka", @"キ": @"ki", @"ク": @"ku", @"ケ": @"ke", @"コ": @"ko",
       @"サ": @"sa", @"シ": @"shi", @"ス": @"su", @"セ": @"se", @"ソ": @"so",
       @"タ": @"ta", @"チ": @"chi", @"ツ": @"tsu", @"テ": @"te", @"ト": @"to",
       @"ナ": @"na", @"ニ": @"ni", @"ヌ": @"nu", @"ネ": @"ne", @"ノ": @"no",
       @"ハ": @"ha", @"ヒ": @"hi", @"フ": @"fu", @"ヘ": @"he", @"ホ": @"ho",
       @"マ": @"ma", @"ミ": @"mi", @"ム": @"mu", @"メ": @"me", @"モ": @"mo",
       @"ラ": @"ra", @"リ": @"ri", @"ル": @"ru", @"レ": @"re", @"ロ": @"ro",
       @"ガ": @"ga", @"ギ": @"gi", @"グ": @"gu", @"ゲ": @"ge", @"ゴ": @"go",
       @"ザ": @"za", @"ジ": @"ji", @"ズ": @"zu", @"ゼ": @"ze", @"ゾ": @"zo",
       @"ダ": @"da", @"ヂ": @"di", @"ヅ": @"du", @"デ": @"de", @"ド": @"do",
       @"バ": @"ba", @"ビ": @"bi", @"ブ": @"bu", @"ベ": @"be", @"ボ": @"bo",
       @"パ": @"pa", @"ピ": @"pi", @"プ": @"pu", @"ペ": @"pe", @"ポ": @"po",
       @"ヤ": @"ya", @"ユ": @"yu", @"ヨ": @"yo", @"ン": @"n",
       @"ワ": @"wa", @"ヰ": @"wi", @"ヱ": @"we", @"ヲ": @"wo"
       };

    HIRAGANA_WORD_DICT = @{
        @"ぁ/り/が/と/う": @"Arigato", @"く/だ/さ/え" : @"kudasai"
                           };
}