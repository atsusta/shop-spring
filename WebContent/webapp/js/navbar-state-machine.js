/**
 * Navigation bar State Machine for bootstrap 3
 * Using GOF Design Pattern 'State'
 * Copyright 2015 usta (https://github.com/atsusta/shop-spring.git)
 */

/**
 * Function : isScrolledToTop(navbarHeight, originalNavbarOffset)
 * Description : Specify if scroll bar is on topside
 */
function isScrolledToTop ( navbarHeight, originalNavbarOffset ) {
    if ( $( window ).scrollTop() + navbarHeight <= originalNavbarOffset ) {
        return true;
    } else {
        return false;
    }
}

/**
 * Function : isMiddleDevice(windowWidth)
 * Description : Specify if width of window >= 992
 */
function isMiddleDevice ( windowWidth ) {
    if ( windowWidth >= 992 )  {
        return true;
    } else {
        return false;
    }	
}

/**
 * Class : NavbarStateMachine
 * Description : State Machine for responsive Navigation bar
 */

// Define the NavbarStateMachine costructor
var NavbarStateMachine = function NavbarStateMachine( navbarState ) {
    this.navbarState = navbarState;
}
    
// Method : changeState(navbarState)
NavbarStateMachine.prototype.changeState = function ( newState )
{
    this.navbarState = newState;
}
    
// Method : effect() 
NavbarStateMachine.prototype.effect = function ( newState )
{
    this.navbarState.effect( this, newState );
}

/**
 * Class : NavbarState
 * Description : State for Navigation bar
 */

// Define the NavbarState constructor
var NavbarState = function NavbarState() {
    console.log( "constructor of NavbarState" )
}
    
// Method : addClass()
NavbarState.prototype.addClass = function ()
{
    console.log( "method addClass" )
}
    
// Method : removeClass()
NavbarState.prototype.removeClass = function ()
{
    console.log( "method removeClass" )
}
    
// Method : effect()
NavbarState.prototype.effect = function ( NavbarStateMachine, newState )
{
    newState.removeClass();
    newState.addClass();
    NavbarStateMachine.changeState( newState );
}
    
/**
 * Class : ScrollOver
 * Description : Specialization of NavbarState
 * -> position is down over Navigation bar in all device
 * -> .navbar-fixed-top
 */ 
  
// Define the ScrollOver constructor
function ScrollOver () {
    NavbarState.call( this );
}
    
// Create a ScrollOver.prototype object that inherits from NavbarState.prototype.
ScrollOver.prototype = Object.create( NavbarState.prototype );
    
// Set the "constructor" property to refer to NavbarState
ScrollOver.prototype.constructor = ScrollOver;
    
// Replace the "addClass" method
ScrollOver.prototype.addClass = function () {
    $( '.navbar' ).addClass( 'navbar-fixed-top' );
}
    
// Replace the "removeClass" method
ScrollOver.prototype.removeClass = function () {
    $( '.navbar' ).removeClass( 'row container' );
}
    
/**
 * Class : MiddleDeviceTop
 * Description : Specialization of NavbarState
 * -> position is top of window in width >= 992
 * -> .container
 */ 

//Define the MiddleDeviceTop constructor
function MiddleDeviceTop () {
    NavbarState.call( this );
}
    
// Create a ScrollOver.prototype object that inherits from NavbarState.prototype.
MiddleDeviceTop.prototype = Object.create( NavbarState.prototype );
    
// Set the "constructor" property to refer to NavbarState
MiddleDeviceTop.prototype.constructor = MiddleDeviceTop;
    
// Replace the "addClass" method
MiddleDeviceTop.prototype.addClass = function () {
    $( '.navbar' ).addClass( 'container' );
}
    
// Replace the "removeClass" method
MiddleDeviceTop.prototype.removeClass = function () {
    $( '.navbar' ).removeClass( 'row navbar-fixed-top' );
}
    
/**
 * Class : SmallDeviceTop
 * Description : Specialization of NavbarState
 *  -> position is top of window in width < 992
 *  -> .row
 */

// Define the SMallDeviceTop constructor
function SmallDeviceTop () {
    NavbarState.call( this );
}
    
// Create a SmallDeviceTop.prototype object that inherits from NavbarState.prototype.
SmallDeviceTop.prototype = Object.create( NavbarState.prototype );
    
// Set the "constructor" property to refer to NavbarState
SmallDeviceTop.prototype.constructor = SmallDeviceTop;
    
// Replace the "addClass" method
SmallDeviceTop.prototype.addClass = function () {
    $( '.navbar' ).addClass( 'row' );
}
    
// Replace the "removeClass" method
SmallDeviceTop.prototype.removeClass = function () {
    $( '.navbar' ).removeClass( 'container navbar-fixed-top' );
}
