-----------------------------------------------------------------------------------------
-- credits_screen.lua
-- Created by: Sasha Malko
-- Date: May 4, 2018
-- Description: This is the credits page, displaying a back button to the main menu.
-----------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------
-- INITIALIZATIONS
-----------------------------------------------------------------------------------------

-- Use Composer Libraries
local composer = require( "composer" )
local widget = require( "widget" )

-----------------------------------------------------------------------------------------

-- Naming Scene
sceneName = "settings_screen"

-- Creating Scene Object
scene = composer.newScene( sceneName ) -- This function doesn't accept a string, only a variable containing a string

-----------------------------------------------------------------------------------------
-- LOCAL VARIABLES
-----------------------------------------------------------------------------------------
local bkg_image
local backButton
local musicButton
local settingsText

-----------------------------------------------------------------------------------------
-- LOCAL FUNCTIONS
-----------------------------------------------------------------------------------------

-- Creating Transitioning Function back to main menu
local function BackTransition( )
    composer.gotoScene( "main_menu", {effect = "slideRight", time = 500})
end

-- Creating Transitioning Function back to main menu
local function MusicTransition( )
    composer.gotoScene( "main_menu", {effect = "slideRight", time = 500})
end
-----------------------------------------------------------------------------------------
-- GLOBAL SCENE FUNCTIONS
-----------------------------------------------------------------------------------------

-- The function called when the screen doesn't exist
function scene:create( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -----------------------------------------------------------------------------------------
    -- BACKGROUND AND DISPLAY OBJECTS
    -----------------------------------------------------------------------------------------
    -- Insert the background image and set it to the center of the screen
    bkg_image = display.newImageRect("Images/BlueBackground.png", display.contentWidth, display.contentHeight)
    bkg_image.x = display.contentCenterX
    bkg_image.y = display.contentCenterY
    bkg_image.width = display.contentWidth
    bkg_image.height = display.contentHeight

    -- Associating display objects with this scene 
    sceneGroup:insert( bkg_image )

    -- Send the background image to the back layer so all other objects can be on top
    bkg_image:toBack()


    -----------------------------------------------------------------------------------------
    -- BUTTON WIDGETS
    -----------------------------------------------------------------------------------------

    -- Creating Back Button
    backButton = widget.newButton( 
    {
        -- Setting Position
        x = 900,
        y = 500,

        -- Setting Dimensions
         width = 200,
         height = 100,

        -- Setting Visual Properties
        defaultFile = "Images/BackButtonUnpressed.png",
        overFile = "Images/BackButtonPressed.png",

        -- Setting Functional Properties
        onRelease = BackTransition

    } )

-----------------------------------------------------------------------------------------
    -- Creating Back Button
    musicButton = widget.newButton( 
    {
        -- Setting Position
        x = 500,
        y = 500,

        -- Setting Dimensions
         width = 200,
         height = 100,

        -- Setting Visual Properties
        defaultFile = "Images/MusicButtonUnpressed.png",
        overFile = "Images/MusicButtonPressed.png",

        -- Setting Functional Properties
        onRelease = MusicTransition

    } )
-----------------------------------------------------------------------------------------


        --the text that displays the question
    settingsText = display.newText( "Settings" , 0, 0, nil, 50)
    settingsText.x = 500
    settingsText.y = 100
    settingsText:setTextColor(0,0,0)
    
end --function scene:create( event )

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to appear on screen
function scene:show( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -----------------------------------------------------------------------------------------

    local phase = event.phase

    -----------------------------------------------------------------------------------------

    if ( phase == "will" ) then
        -- Called when the scene is still off screen (but is about to come on screen).

    -----------------------------------------------------------------------------------------

    elseif ( phase == "did" ) then
        -- Called when the scene is now on screen.

    end

end -- function scene:show( event )

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to leave the screen
function scene:hide( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -----------------------------------------------------------------------------------------

    local phase = event.phase

    -----------------------------------------------------------------------------------------

    if ( phase == "will" ) then
        -- Called when the scene is on screen (but is about to go off screen).

    -----------------------------------------------------------------------------------------

    elseif ( phase == "did" ) then
        -- Called immediately after scene goes off screen.
    end

end --function scene:hide( event )

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to be destroyed
function scene:destroy( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -----------------------------------------------------------------------------------------

    -- Called prior to the removal of scene's view ("sceneGroup").


end --function scene:destroy( event )

-----------------------------------------------------------------------------------------
-- EVENT LISTENERS
-----------------------------------------------------------------------------------------

-- Adding Event Listeners
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-----------------------------------------------------------------------------------------

return scene