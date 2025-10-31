local RoomIdText=""

local function inputRoomId()

    --使用复制粘贴

    if IsaacSocket and Input.IsActionTriggered(ButtonAction.ACTION_DROP,Bingo.player.ControllerIndex) then
        RoomIdText=IsaacSocket.System.GetClipboard()
    end

    -- 使用键盘输入

    if string.len(RoomIdText)<10 then
        for i = 0, 9, 1 do
            if Input.IsButtonTriggered(Keyboard.KEY_0+i,Bingo.player.ControllerIndex) and not
            (Input.IsButtonPressed(Keyboard.KEY_LEFT_SHIFT,Bingo.player.ControllerIndex) or Input.IsButtonPressed(Keyboard.KEY_RIGHT_SHIFT,Bingo.player.ControllerIndex)) then
                RoomIdText=RoomIdText..i
            end
        end
        for i = 0, 25, 1 do
            if Input.IsButtonTriggered(Keyboard.KEY_A+i,Bingo.player.ControllerIndex) then
                RoomIdText=RoomIdText..string.char(string.byte('a')+i)
            end
        end
        if (Input.IsButtonPressed(Keyboard.KEY_LEFT_SHIFT,Bingo.player.ControllerIndex) or Input.IsButtonPressed(Keyboard.KEY_RIGHT_SHIFT,Bingo.player.ControllerIndex)) and
        Input.IsButtonTriggered(Keyboard.KEY_7,Bingo.player.ControllerIndex) then
            RoomIdText=RoomIdText.."&"
        end
    end
    if string.len(RoomIdText)>0 and Input.IsButtonTriggered(Keyboard.KEY_BACKSPACE,Bingo.player.ControllerIndex) then
        RoomIdText=string.sub(RoomIdText,1,#RoomIdText-1)
    end
end

local function getRoomIdText()
    return RoomIdText
end
return {
    getRoomIdText=getRoomIdText,
    inputRoomId=inputRoomId
}
