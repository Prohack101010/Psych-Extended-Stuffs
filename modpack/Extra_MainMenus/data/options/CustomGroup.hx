import options.NovaFlareOptionsObjects.Option;
import options.NovaFlareOptionsObjects.OptionType;
import TitleState;

function create() {
	var option:Option = new Option(this,
		'HScript Option',
		null, //
		null,
		OptionType.TITLE
	);
	addOption(option);

	var option:Option = new Option(this,
		'Custom MainMenu',
		"This Option Adds More Main Menus, simple isn't it?",
		'customMainMenu',
		OptionType.STRING,
		['Disabled', 'Gacha Horror V2', 'New Psych']
	);
	//option.onChange = () -> changeWideScreen();
	addOption(option);
}