//=============================================================================
// UDKMOBAGFxMainMenuObject
//
// Main menu GFxObject which initializes the main menu.
// 
// Copyright 1998-2012 Epic Games, Inc. All Rights Reserved.
//=============================================================================
class UDKMOBAGFxMainMenuObject extends GFxObject;

// Return to game button
var GFxClikWidget ReturnToGameBtn;
// Exit game button
var GFxClikWidget ExitBtn;

/**
 * Initializes the main menu.
 *
 * @network		All
 */
function Init()
{
	// Return to game button
	ReturnToGameBtn = GFxClikWidget(GetObject("returnToGameBtn", class'GFxClikWidget'));
	if (ReturnToGameBtn != None)
	{
		ReturnToGameBtn.SetString("label", Localize("HUD", "ReturnToGame", "UDKMOBA"));
		ReturnToGameBtn.AddEventListener('CLIK_buttonPress', OnReturnToGamePress);
	}

	// Exit game button
	ExitBtn = GFxClikWidget(GetObject("exitBtn", class'GFxClikWidget'));
	if (ExitBtn != None)
	{
		ExitBtn.SetString("label", Localize("HUD", "Exit", "UDKMOBA"));
		ExitBtn.AddEventListener('CLIK_buttonPress', OnExitPress);
	}
}

/**
 * Called when the 'Return to Game' button is pressed.
 *
 * @param		event_data		Event data generated by the GFxClikWidget
 * @network						All
 */
function OnReturnToGamePress(EventData event_data)
{
	local PlayerController PlayerController;

	PlayerController = GetPC();
	if (PlayerController != None)
	{
		PlayerController.SetPause(false);
	}

	SetVisible(false);
}

/**
 * Called when the 'Exit' button is pressed.
 *
 * @param		event_data		Event data generated by the GFxClikWidget
 * @network						All
 */
function OnExitPress(EventData event_data)
{
	Close(true);
	ConsoleCommand("exit");
}

// Default properties block
defaultproperties
{
}