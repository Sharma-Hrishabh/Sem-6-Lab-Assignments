var game = document.getElementById('snake_game');
var ctx = game.getContext('2d');

var snakeX=10;
var snakeY=10;
var foodposx=0;
var foodposy=0;
var width = game.width;
var height = game.height;
var snake =[];
var direction = 'right';
var gameloop;

var initial = ()=>{
    var obj = {x:10,y:10}
    for(var i=1;i<=8;i++)
    {
        snake.push({x:obj.x,y:obj.y});
        ctx.fillStyle = 'green';
        ctx.fillRect(obj.x,obj.y,10,10)
        ctx.strokeStyle = 'black';
        ctx.strokeRect(obj.x,obj.y,10,10)
        obj.x = obj.x+10;
        // console.log(obj)
    }
    // console.log(snake1)
}
var drawSnake = ()=>{
    // console.log('ds')
    var x = snake.length;
    for(var i=0;i<x;i++)
    {
        ctx.fillStyle = 'green';
        ctx.fillRect(snake[i].x,snake[i].y,10,10)
        ctx.strokeStyle = 'black';
        ctx.strokeRect(snake[i].x,snake[i].y,10,10)
    }
}
var loop = ()=>{
    // console.log('hi')
    var objz={};
    var x1 = snake.length;
    objz.x  = snake[x1-1].x;
    objz.y = snake[x1-1].y;
    // console.log(snake)
    // console.log(objz.x)
    var tail = snake[0];
    ctx.fillStyle = 'black';
    ctx.fillRect(tail.x,tail.y,10,10)
    ctx.strokeStyle = 'black';
    ctx.strokeRect(tail.x,tail.y,10,10)
    snake = snake.slice(1);
    if(direction == 'up')
    {
        objz.y-=10;
        snake.push({x:objz.x,y:objz.y})
    }
    else if(direction == 'down')
    {
        objz.y+=10;
        snake.push({x:objz.x,y:objz.y})
    }
    else if(direction == 'left')
    {
        objz.x-=10;
        snake.push({x:objz.x,y:objz.y})
    }
    else if(direction == 'right')
    {
        objz.x+=10;
        snake.push({x:objz.x,y:objz.y})
    }
    var l = snake.length;
    // console.log(l);
    var pos = snake[l-1];
    // console.log(pos.x);
    if(pos.x >= foodposx && pos.x <=foodposx+10 && pos.y >= foodposy && pos.y<=foodposy+10)
    {
        snake.push({x:foodposx,y:foodposy})
        createfood();
        // console.log(snake.length);
        var score = document.getElementById('score').innerHTML;
        parseInt(score,10);
        score++;
        document.getElementById('score').innerHTML = score;
        if(score > 1)
        {
            drawplus();
        }
    }
    checkcollision();
    drawSnake();
}
var checkcollision = ()=>{
    var l = snake.length;
    var pos1 = snake[l-1];
    var pos=snake[0]
    var score = document.getElementById('score').innerHTML;
    parseInt(score,10);
    console.log(score);
    
    if(pos1.x==0 || pos1.y==0 || pos1.y==height || pos1.x==width)
    {
        // clearInterval(gameloop);
        // document.getElementById('over').style.display="block"
        for(var i=0;i<l;i++)
        {
            snake[i].x=width-snake[i].x
            snake[i].y=height-snake[i].y
            ctx.clearRect(0, 0, game.width, game.height);

        }
        
    }
    else if(((pos1.x >= (width/2 - width/4) && pos1.x <= (width/2+width/4-10)&& pos1.y==(height/2)-10) ||  (pos1.y >= (height/2 - height/4) && pos1.y <= (height/2+height/4-10) && pos1.x == (width/2 -10)))&&score>1)
    {
        // console.log(pos1.x,pos1.y);
        // clearInterval(gameloop);
        // document.getElementById('over').style.display="block"
        for (var i = 0; i < l; i++) {

            snake[i].x = width - snake[i].x
            snake[i].y = height - snake[i].y
            ctx.clearRect(0, 0, game.width, game.height);

        }
    }
    else if(pos.x==pos1.x && pos.y==pos1.y)
    {
        clearInterval(gameloop);
        document.getElementById('over').style.display = "block"

    }


}
var createfood = ()=>{
    foodposx = Math.floor(Math.random() * Math.floor(width));
    foodposx = (foodposx)-(foodposx%10);
    foodposy = Math.floor(Math.random() * Math.floor(height));
    foodposy = (foodposy)-(foodposy%10);
    ctx.fillStyle = 'green';
    ctx.fillRect(foodposx,foodposy,10,10)
    // console.log(foodposy);
    // console.log(foodposx);
}
var draw = ()=>{
    initial();
    window.addEventListener('keydown',(e)=>{
        // console.log(e);
        if(e.keyCode == 38 && direction !== 'up'&& direction !== 'down')
        {
            direction = 'up';
        }
        if(e.keyCode == 37 && direction !== 'left' && direction !== 'right')
        {
            direction = 'left';
        }
        if(e.keyCode == 39 && direction !== 'right' && direction !== 'left')
        {
            direction = 'right';
        } 
        if(e.keyCode == 40 && direction !== 'down'&& direction !== 'up')
        {
            direction = 'down';
        }
    })
    createfood();
    gameloop =setInterval(loop,100)
}
var left = ()=>{
    if(direction !== 'left' && direction !== 'right')
    {
        direction = 'left';
    }
}
var right = ()=>{
    if(direction !== 'left' && direction !== 'right')
    {
        direction = 'right';
    }
}
var up = ()=>{
    if(direction !== 'up' && direction !== 'down')
    {
        direction = 'up';
    }
}
var down = ()=>{
    if(direction !== 'up' && direction !== 'down')
    {
        direction = 'down';
    }
}

var drawplus =()=>{
    var lx = width/4;
    var ly = height/4;
    var start_x = ((width/2) - lx );
    var start_y = ((height/2) - ly);
    for(i=0;i<(ly/5);i++)
    {
        ctx.fillStyle = 'green';
        ctx.fillRect((height/2)-10,start_y +i*10,10,10)
    }
    for(i=0;i<(lx/5);i++)
    {
        ctx.fillStyle = 'green';
        ctx.fillRect(start_x +i*10,(width/2)-10,10,10)
    }
}

draw();

var again = () =>{
    score=0;
    document.getElementById('score').innerHTML = score;
    document.getElementById('over').style.display="none"
    snake=[];
    clearInterval(gameloop);
    direction = 'right';
    ctx.clearRect(0, 0, game.width, game.height);
    draw();
}