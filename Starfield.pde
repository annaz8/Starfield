Particle[] group;
void setup()
{
	background(0);
	size(600,600);
	group = new Particle[250];
	for(int i = 0; i < group.length-2; i++)
	{
		group[i] = new NormalParticle();
	}
	group[248] = new OddballParticle();
	group[249] = new JumboParticle();
}
void draw()
{
	background(0);
	for(int i = 0; i < group.length; i++)
	{
		group[i].show();
		group[i].move();
		group[198].show();
		group[198].move();
	}

}
class NormalParticle implements Particle
{
	double myX,myY,angle,speed;
	int size, clr1, clr2, clr3;
	NormalParticle() 
	{
		myX = 300;
		myY = 300;
		angle = Math.random()*(2*Math.PI);
		speed = Math.random()*10;
		size = (int)(Math.random()*15);
		clr1 = (int)(Math.random()*255);
		clr2 = (int)(Math.random()*255);
		clr3 = (int)(Math.random()*255);
	}
	public void move()
	{
		myX = myX + speed*Math.cos(angle);
		myY = myY + speed*Math.sin(angle);
		angle = angle - .0099;
	}
	public void show()
	{
		fill(clr1,clr2,clr3);
		ellipse((float)myX,(float)myY,size,size); 
	}
}

interface Particle
{
	public void show();
	public void move();
}
class OddballParticle implements Particle
{	
	double oddX,oddY,oddAngle,oddSpeed;
	OddballParticle()
	{
		oddX = Math.random()*600;
		oddY = Math.random()*600;
		oddAngle = Math.random()*(2*Math.PI);
		oddSpeed = Math.random()*30;
	}
	public void move()
	{
		oddX = oddX*oddSpeed*Math.cos(oddAngle);
		oddY = oddY*oddSpeed*Math.sin(oddAngle);
		oddSpeed = oddSpeed + 20;
	}
	public void show()
	{
		fill(255,255,255);
		rect((float)oddX, (float)oddY, 30, 30);
	}
}
class JumboParticle extends NormalParticle
{
	public void show()
	{
		fill(clr1,clr2,clr3);
		ellipse((float)myX,(float)myY,size*15,size*15); 
	}
}

