//key 32 é a tecla de espaço

class ship {
  PVector pos = new PVector(0, 0);
  PVector vel = new PVector(0, 0);
  PVector ace = new PVector(0, 0);

  PVector mouse = new PVector(0, 0);
  PVector frent = new PVector (0, -1); //apontando para cima
  float angle = 0; //angle entre frente e posição

  PVector resul = new PVector(0, 0);

  PVector aux = new PVector(0, 0);

  void mov (){
    mouse.x = mouseX - width/2 - pos.x;
    mouse.y = mouseY - height/2 - pos.y;

    resul.mult(0);
    for(int i = 0; i < star_big.length; i++){
      aux.x = star_big[i].pos.x - pos.x;
      aux.y = star_big[i].pos.y - pos.y;

      resul.add(aux);
    }
    resul.limit(9);

    if((keyPressed) && (key == 32) && (comb > 0)){
      resul.add(mouse);
    }

    ace.add(resul);
      ace.limit(0.1);
    vel.add(ace);
    vel.limit(16);

    pos.add(vel);

    /***verificar se ainda esta na tela***/
    if (pos.x > width/2)
      pos.x = -width/2;
    if (pos.x < -width/2)
      pos.x = width/2;

    if (pos.y > height/2 - 100)
      pos.y = -height/2;
    if (pos.y < -height/2)
      pos.y = height/2 - 100;
    /*******/
  }

  void norma (){
    angle = PVector.angleBetween (mouse, frent);

    if(mouse.x < 0)
      rotate(-angle);
    else
      rotate(angle);
  }

  void point_ship (){
    imageMode(CENTER);

    float scal1 = 4;
    float scal2 = 1.4;

    if((keyPressed) && (key == 32) && (comb > 0)){
      comb += dcombdt;

      image(spacecraft_fire_img, 0, 0, 100, 100);

      /*****
      fill(#f05641);
      ellipse(0, 20 * scal2 + 10, 20 * scal2 - 5, 20 * scal2 - 5);

      fill(#f0c941);
      arc(0, 20 * scal2, 20 * scal2, 20 * scal2, 0, PI);
      triangle(0, 10 * scal2, 10 * scal2, 20 * scal2 + 1, -10 * scal2, 20 * scal2 + 1);
      *****/
    }


    image(spacecraft_img, 0, 0, 100, 100);

    /********
    fill(#8795c7);

    beginShape();
      vertex(0, 10 * scal2);
      vertex(10 * scal2, 20 * scal2);

      vertex(0, -20 * scal2);

      vertex(-10 * scal2, 20 * scal2);
      vertex(0, 10 * scal2);
    endShape();
    ********/
  }

  void draw (){
    pushMatrix();
      translate(pos.x, pos.y);
      norma ();

      point_ship ();
    popMatrix();
  }
}
