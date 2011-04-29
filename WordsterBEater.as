package {
	import com.ryankachik.Wordster.Dictionary;
	
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.text.AntiAliasType;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFieldType;
	import flash.text.TextFormat;

	public class WordsterBEater extends Sprite
	{
		private var txtfmt:TextFormat;
		private var dict:Dictionary;
		private var _input:TextField;
		private var _holder:Sprite;
		public function WordsterBEater()
		{
			dict = new Dictionary();
			txtfmt = new TextFormat("Helvetica", 16, 0x000000);
			_input = createTextField("aaaaaaaa", 85);
			_input.height = 22;
			_input.type = TextFieldType.INPUT;
			_input.border = true;
			_input.borderColor = 0;
			_input.x = 10
			_input.y = 10;
			addChild(_input);
			
			var sp:Sprite = new Sprite();
			sp.graphics.beginFill(0xCCCCCC);
			sp.graphics.lineStyle(1, 0x999999);
			sp.graphics.drawRoundRect(0,0,_input.width, 22, 10,10);
			sp.graphics.endFill();
			
			var lbl:TextField = createTextField("Submit");
			lbl.x = (sp.width - lbl.width) /2;
			lbl.y = (sp.height - lbl.height)/2;
			sp.addChild(lbl);
			sp.mouseChildren = false;
			sp.buttonMode = true; 
			sp.addEventListener(MouseEvent.CLICK, handleClick);
			addChild(sp);
			sp.x = 10;
			sp.y = 40;
			
		}
		private function handleClick(e:MouseEvent):void {
			if(_holder && contains(_holder)) removeChild(_holder);
			var words:Array = dict.getWords(_input.text, 20);
			_holder = new Sprite();
			for each(var word:String in words) {
				var wordTxt:TextField = createTextField(word);
				wordTxt.y = _holder.height + 5;
				_holder.addChild(wordTxt);
			}
			addChild(_holder);
			_holder.x = 110;
			_holder.y = 0;
		}
		private function createTextField(str:String, width:int = -1):TextField {
			var txt:TextField = new TextField();
			if(width <= 0) {
				txt.autoSize = TextFieldAutoSize.LEFT;
			} else {
				txt.width = width;
				txt.multiline = true;
				txt.wordWrap = true;
			}
			txt.defaultTextFormat = txtfmt;
			txt.text = str;
			txt.antiAliasType = AntiAliasType.ADVANCED;
			return txt;
		}
	}
}
