---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by tamer.
--- DateTime: 2018/7/5 21:05
---

local baseView = View()
baseView:getCSS():position(1):top(100):left(0):width(50):height(50)
baseView:bgColor(Color(225, 225, 225, 1))
window:flexChild(baseView)
window:flexLayout()
isAnimating = false
animation = Animation()
animation:setStartCallback(function()
    print("|| Animation start!")
end)
animation:setEndCallback(function()
    print("|| Animation end!")
end)
baseView:onClick(function()
    animation:setTranslateX(0, 100)
    animation:setRotate(0, 180)
    animation:setDuration(3)
    animation:setInterpolator(InterpolatorType.Bounce)
    animation:start(baseView)
    isAnimating = true
end)

local baseView2 = View()
baseView2:getCSS():position(1):top(180):left(0):width(50):height(50)
baseView2:bgColor(Color(225, 225, 225, 1))
window:flexChild(baseView2)
window:flexLayout()
isAnimating = false
animation2 = Animation()
animation2:setStartCallback(function()
print("|| Animation start!")
end)
animation2:setEndCallback(function()
print("|| Animation end!")
end)
baseView2:onClick(function()
animation2:setTranslateY(0, 100)
animation2:setRotate(0, 180)
animation2:setDuration(3)
animation2:setInterpolator(InterpolatorType.Bounce)
animation2:start(baseView2)
isAnimating = true
end)

local baseView3 = View()
baseView3:getCSS():position(1):top(260):left(0):width(50):height(50)
baseView3:bgColor(Color(225, 225, 225, 1))
window:flexChild(baseView3)
window:flexLayout()
animation3 = Animation()
animation3:setStartCallback(function()
print("|| Animation start!")
end)
animation2:setEndCallback(function()
print("|| Animation end!")
end)
baseView3:onClick(function()
animation3:setScaleX(0.5,1.2)
animation3:setDuration(3)
animation3:setInterpolator(InterpolatorType.Bounce)
animation3:start(baseView3)
end)

local baseView4 = View()
baseView4:getCSS():position(1):top(340):left(0):width(50):height(50)
baseView4:bgColor(Color(225, 225, 225, 1))
window:flexChild(baseView4)
window:flexLayout()
animation4 = Animation()
animation4:setStartCallback(function()
print("|| Animation start!")
end)
animation4:setEndCallback(function()
print("|| Animation end!")
end)
baseView4:onClick(function()
animation4:setScaleY(0.5,5)
animation4:setDuration(3)
animation4:setInterpolator(InterpolatorType.Overshoot)
animation4:setInterpolator(InterpolatorType.Bounce)
animation4:start(baseView4)
end)

local baseView5 = View()
baseView5:getCSS():position(1):top(420):left(0):width(50):height(50)
baseView5:bgColor(Color(88, 125, 56, 1))
window:flexChild(baseView5)
window:flexLayout()
animation5 = Animation()
animation5:setStartCallback(function()
print("|| Animation start!")
end)
animation5:setEndCallback(function()
print("|| Animation end!")
end)
baseView5:onClick(function()
animation5:setAlpha(1.0,0.1)
animation5:setDuration(3)
animation5:setAutoBack(false)
animation5:setInterpolator(InterpolatorType.Bounce)
animation5:start(baseView5)
end)

local baseView6 = View()
baseView6:getCSS():position(1):top(500):left(0):width(50):height(50)
baseView6:bgColor(Color(88, 125, 56, 1))
window:flexChild(baseView6)
window:flexLayout()
animation6 = Animation()
animation6:setStartCallback(function()
print("|| Animation start!")
end)
animation6:setEndCallback(function(isFinish)
print("|| Animation end!",isFinish)
end)
baseView6:onClick(function()
animation6:setAlpha(1.0,0.1)
animation6:setDuration(3)
animation6:setDelay(4)
animation6:setInterpolator(InterpolatorType.Bounce)
animation6:start(baseView6)
end)

window:onClick(function()
    if isAnimating then
        animation:pause()
        isAnimating = false
    else
        animation:resume()
        isAnimating = true
    end
end)

window:bgColor(Color(123,123,123,1))



local baseView7 = ImageView()
baseView7:image('https://s.momocdn.com/w/u/others/custom/MDYouth/Feed/icon/Youth_icon_addAtten.png')
baseView7:getCSS():position(1):top(470):left(100):width(150):height(150)
baseView7:bgColor(Color(88, 12, 156, 1))
window:flexChild(baseView7)
window:flexLayout()
animation7 = Animation()
animation7:setStartCallback(function()
print("|| Animation start!")
end)
animation7:setEndCallback(function(isFinish)
animation8 = Animation()
animation8:setRotateX(0,360)
animation8:setRepeat(RepeatType.FROM_START,5)
animation8:setDuration(1)
animation8:start(baseView7)
print("|| Animation end!",isFinish)
end)
baseView7:onClick(function()
animation7:setRotateY(0,360)
animation7:setRepeat(RepeatType.FROM_START,5)
animation7:setDuration(1)
animation7:start(baseView7)
end)


