import options.NovaFlareOptionsNavi.NaviData;
import options.NovaFlareOptionsObjects.OptionCata;
import options.group.GraphicsGroup;
import options.group.UIGroup;
import options.group.SkinGroup;
import options.group.GameplayGroup;
import options.group.MobileGroup;

// Custom Group Creation
function onNaviCreate() {
	var naviData = new NaviData('Cyber Sensation', ['Custom States']);
	if (!naviArray.contains(naviData)) naviArray.push(naviData);
}

// Custom Group Name (Can usable if user want to seperate the names)
function addCata(event) {
	var obj:OptionCata = null;

	switch (event.type)
	{
		case 'Custom States':
			obj = new ModGroup(outputX, outputY, outputWidth, outputHeight, 'CustomGroup');
	}
	event.obj = obj;
}