import CustomSwitchState;

var background:FlxSprite;

var curSelected:Int = 0;

var items:FlxTypedGroup<FlxSprite>;
var itemImages:Array<String> = [
	'AfrhaGachaYT',
	'DevinHandoko',
	'irfan._',
	'KoLsiq12',
	'Leafy_2.0',
	'Lynn',
	'miyamixx',
	'noriz_zez',
	'NotFahi',
	'Smashfanbro',
	'StarWantsCookie',
	'Usser'
];

function create()
{
	Paths.clearStoredMemory();
	Paths.clearUnusedMemory();

	FlxG.sound.playMusic(Paths.music('galleryTheme'), 0.7);
	background = new FlxSprite().loadGraphic(Paths.image('gallerymenu_gh/BG'));
	background.antialiasing = ClientPrefs.data.antialiasing;
	background.updateHitbox();
	background.screenCenter();
	add(background);

	items = new FlxTypedGroup<FlxSprite>();
	add(items);

	#if DISCORD_ALLOWED
	// Updating Discord Rich Presence
	DiscordClient.changePresence("In the Menus", null);
	#end

	changeItem(0);
	#if TOUCH_CONTROLS addMobilePad("LEFT_RIGHT", "B"); #end
}

function update(elapsed:Float)
{
	if (controls.BACK || FlxG.mouse.justReleasedRight)
	{
		if (FlxG.sound.music != null)
			FlxG.sound.music.stop();
		FlxG.sound.playMusic(Paths.music('freakyMenu'), 0.7);
		CustomSwitchState.switchMenus('MainMenu');
	}
	if (controls.UI_LEFT_P)
	{
		FlxG.sound.play(Paths.sound('scrollMenu'));
		changeItem(-1);
	}
	if (controls.UI_RIGHT_P)
	{
		FlxG.sound.play(Paths.sound('scrollMenu'));
		changeItem(1);
	}
}

function changeItem(huh:Int = 0)
{
	curSelected += huh;

	if (curSelected >= itemImages.length)
		curSelected = 0;
	if (curSelected < 0)
		curSelected = itemImages.length - 1;

	for (i in 0...itemImages.length)
	{
		if (items.members != null && items.members.length > 0)
			items.forEach(function(_:FlxSprite)
			{
				items.remove(_);
				_.destroy();
			});

		var imageItem:FlxSprite;
		imageItem = new FlxSprite().loadGraphic(Paths.image('gallerymenu_gh/Portraits/' + itemImages[curSelected]));
		imageItem.antialiasing = ClientPrefs.data.antialiasing;
		imageItem.updateHitbox();
		imageItem.screenCenter();
		items.add(imageItem);
	}
}