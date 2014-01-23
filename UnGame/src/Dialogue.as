package  
{
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	import starling.display.DisplayObject;
	import starling.display.Sprite;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	import starling.text.TextField;
	
	/**
	 * ...
	 * @author Qiao Xiaomeng
	 */
	public class Dialogue extends Sprite 
	{
		
		// 对话列表（之后可能要单独写成一个类）
		var talkScriptList = {  
			"talk1":new Array(  
				{img:"m",name:"陈初",msg:"这又有什么关系？"},  
				{img:"n",name:"司唯",msg:"这并不是没有什么关系的问题。"}  
				),  
			"talk2":new Array(  
				{img:"n",name:"司唯",msg:"请不要再继续进行游戏了。"},  
				{img:"m",name:"陈初",msg:"我绝对不会停止前进。"}  
				)  
		};  
		
		// 用于存放对话内容
		var talkScript:TextField;
		// 对话人物名称
		var talker:TextField;
		// 对话索引，用于标识当前对话
		var talkIndex:Number;
		// 对话长度
		var totalIndex:Number;
		// Timer实例
		var timer:Timer;
		// 当前显示对话字串
		var tempTalk:TextField;
		// 临时存储对话内容
		var instTalk:TextField;
		// 判断对话是否清空
		var isTalking:Boolean = false;
		private var talk1 = ["image", "陈初", "献给那些教会我长大的人们。"];
		var talkScriptArray:Array;
		
		public function Dialogue() 
		{
			// 判断对话内容是否为空
			//if (!this.isTalking)
			{
				// 判断是否可以开始对话
				
				// TODO: 解决这个问题，canTalkNow取值总是一瞬即逝
				// if (IdleMode.canTalkNow)
				// 判断NPC标识
				{
					talkScriptArray = talk1;
					addTalk(talkScriptArray);
				}
				
				
			}
			
			
		}
		
		private function addTalk(talkScriptArray:Array):void 
		{
				// 判断对话是否为空
				if (talkScriptList)
				{
					// 判断是否可以开始对话
					// if (IdleMode.canTalkNow)
					{
						// 对话开始
						
						// 对话背景
						// 对话头像
						// 对话人物名称
						talker = new TextField(200, 50, "");
						talker.text = talkScriptArray[1];
						addChild(talker);
						// 对话内容
						talkScript = new TextField(200, 100, "");
						// talkScript.text = talkScriptList[2];
						instTalk = new TextField(200, 100, talkScriptArray[2]);
						talkIndex = 0;
						totalIndex = instTalk.text.length;
						
						timer = new Timer(50);
						timer.addEventListener(TimerEvent.TIMER, showByWord);
						this.addEventListener(TouchEvent.TOUCH, onTouch);
						addChild(talkScript);
						timer.start();

					}
					// 对话结束
					{
							
					}
				}
				

		}
		
		// TODO: 多个鼠标事件
		
		private function onTouch(e:TouchEvent):void 
		{
			var touch:Touch = e.getTouch(e.target as DisplayObject, TouchPhase.ENDED);
			if (touch)
			{
				if (talkIndex < totalIndex)
				{
					talkIndex = totalIndex;
					talkScript.text = instTalk.text;
				}
				else
				{
					// this.removeChild(talkScriptArray);
					talkScriptArray = null;
					timer.stop();
					removeTalk();
				}
			}

		}
		
		private function showByWord(e:TimerEvent):void 
		{
			if (talkIndex < totalIndex)
			{
				talkIndex ++;
				tempTalk = new TextField(200, 100, "");
				tempTalk.text = instTalk.text.substr(0, talkIndex);
				talkScript.text = tempTalk.text;	
			}
			else { timer.stop(); }
		}
		
		private function removeTalk():void
		{
			if (isTalking)
			{
				
				isTalking = false;
			}
		}
		
	}

}