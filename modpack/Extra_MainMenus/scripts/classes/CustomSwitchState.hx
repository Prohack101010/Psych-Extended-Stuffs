import MusicBeatState;

function switchMenusPost(Prefix) {
	switch (Prefix) {
		case 'MainMenu':
			if (FlxG.save.data.customMainMenu == 'Gacha Horror V2') MusicBeatState.switchState(new ModState('MainMenuState_GH'));
			if (FlxG.save.data.customMainMenu == 'New Psych') MusicBeatState.switchState(new ModState('MainMenuState_10'));
		case 'Gallery':
			if (FlxG.save.data.customMainMenu == 'Gacha Horror V2') MusicBeatState.switchState(new ModState('GalleryMenu_GH'));
	}
}