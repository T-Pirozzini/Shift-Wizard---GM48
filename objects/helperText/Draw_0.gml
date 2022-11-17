//draw_text_transformed(5,300,"P1 Movement:",.75, .75,  image_angle)
//draw_text_transformed(100,300,global.pOneMovementActive,.75, .75,  image_angle)
//draw_text_transformed(5,320,"P1 Casting:",.75, .75,  image_angle)
//draw_text_transformed(100,320,global.pOneCastingPhase, .75, .75, image_angle)
//draw_text_transformed(5,340,"P1 Pointer:",.75, .75,  image_angle)
//draw_text_transformed(100,340,global.pOnePointerActive,.75, .75,  image_angle)
//draw_text_transformed(5,360,"P1 Turn:",.75, .75,  image_angle)
//draw_text_transformed(100,360,global.pOneTurn,.75, .75,  image_angle)
//draw_text_transformed(5,400,"P1 Current Tile:",.75, .75,  image_angle)
//draw_text_transformed(120,400,global.pOneCurrentTile,.75, .75,  image_angle)
//draw_text_transformed(5,420,"Casting Phase:",.75, .75,  image_angle)
//draw_text_transformed(100,420,global.castingPhase,.75, .75,  image_angle)
//draw_text_transformed(5,440,"Selection Phase:",.75, .75,  image_angle)
//draw_text_transformed(120,440,global.selectionPhase,.75, .75,  image_angle)
//draw_text_transformed(5,460,"Collection Phase:",.75, .75,  image_angle)
//draw_text_transformed(120,460,global.collectionPhase,.75, .75,  image_angle)


//draw_text_transformed(200,300,"P2 Movement:", .75, .75, image_angle)
//draw_text_transformed(320,300,global.pTwoMovementActive, .75, .75, image_angle)
//draw_text_transformed(200,320, "P2 Casting:",.75, .75, image_angle)
//draw_text_transformed(320,320,global.pTwoCastingPhase, .75, .75, image_angle)
//draw_text_transformed(200,340, "P2 Pointer:",.75, .75, image_angle)
//draw_text_transformed(320,340,global.pTwoPointerActive, .75, .75, image_angle)
//draw_text_transformed(200,360,"P2 Turn:",.75, .75,  image_angle)
//draw_text_transformed(320,360,global.pTwoTurn,.75, .75,  image_angle)

//draw_text_transformed(200,400,"P2 Current Tile:",.75, .75,  image_angle)
//draw_text_transformed(320,400,global.pTwoCurrentTile,.75, .75,  image_angle)

//draw_text_transformed(200,420,"Current Round:",.75, .75,  image_angle)
//draw_text_transformed(320,420,global.currentRound,.75, .75,  image_angle)

//draw_text_transformed(5,360,"PLAYER 1 ELEMENT TOTAL:",.75, .75,  image_angle)
//draw_text_transformed(200,360,ds_list_size(global.pOneElementList),.75, .75,  image_angle)
//draw_text_transformed(5,260,"PLAYER 1 ELEMENTS:",.75, .75,  image_angle)
//var _X = 0
//for (var i = 0; i < ds_list_size(global.pOneElementList); i++) {
//	draw_text_transformed(150 + _X,260,ds_list_find_value(global.pOneElementList, i),.75, .75,  image_angle)
//	_X += 20
//}

//draw_text_transformed(5,560,"PLAYER 2 ELEMENT TOTAL:",.75, .75,  image_angle)
//draw_text_transformed(200,560,ds_list_size(global.pTwoElementList),.75, .75,  image_angle)
//draw_text_transformed(5,460,"PLAYER 2 ELEMENTS:",.75, .75,  image_angle)
//var _X = 0
//for (var i = 0; i < ds_list_size(global.pTwoElementList); i++) {
//	draw_text_transformed(150 + _X,460,ds_list_find_value(global.pTwoElementList, i),.75, .75,  image_angle)
//	_X += 20
//}