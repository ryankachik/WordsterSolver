package com.ryankachik.Wordster
{
	public class Dictionary
	{
		private var _words:Array;
		public function get words():Array {
			return _words;
		}
		
		public function Dictionary(min:int = 3, max:int = 10, allowProper:Boolean = false) {
			var str:String = DictionaryString.WordString;
			var tempWords:Array = str.split(",");
			_words = new Array();
			for each(var word:String in tempWords) {
				if(word.length >= min && word.length <= max) {
					var firstLetter:String = word.charAt();
					var lastLetter:String = word.charAt(word.length-1);
					if(lastLetter != "s" && (allowProper || firstLetter.toLowerCase() == firstLetter)) {
						_words.push(word);
					}
				}
				
			}
		}
		public function getWords(letters:String, cutoff:int = 10):Array {
			var chars:Array = letters.split("");
			var wordChars:Array;
			var tempWords:Array = new Array();
			for each(var word:String in _words) {
				wordChars = word.split("");
				if(charsAreInWord(wordChars, chars)) {
					tempWords.push(word);
				}
			}
			
			tempWords.sort(lengthSort);
			return tempWords.slice(0, cutoff);
		}
		private function charsAreInWord(wordChars:Array, inputChars:Array):Boolean {
			var tempInput:Array = inputChars.concat();
			for each(var char:String in wordChars) {
				if(tempInput.indexOf(char) == -1) return false;
				else {
					tempInput.splice(tempInput.indexOf(char), 1);
				}
			}
			return true;
		}
		private function lengthSort(a:String, b:String):int {
			if(a.length == b.length) return 0;
			return (a.length > b.length) ?  -1 : 1;
		}
	}
}