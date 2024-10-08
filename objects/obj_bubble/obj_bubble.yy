{
  "$GMObject":"",
  "%Name":"obj_bubble",
  "eventList":[
    {"$GMEvent":"v1","%Name":"","collisionObjectId":null,"eventNum":0,"eventType":0,"isDnD":false,"name":"","resourceType":"GMEvent","resourceVersion":"2.0",},
    {"$GMEvent":"v1","%Name":"","collisionObjectId":null,"eventNum":0,"eventType":3,"isDnD":false,"name":"","resourceType":"GMEvent","resourceVersion":"2.0",},
  ],
  "managed":true,
  "name":"obj_bubble",
  "overriddenProperties":[],
  "parent":{
    "name":"Other",
    "path":"folders/Objects/Other.yy",
  },
  "parentObjectId":{
    "name":"c_object",
    "path":"objects/c_object/c_object.yy",
  },
  "persistent":false,
  "physicsAngularDamping":0.1,
  "physicsDensity":0.5,
  "physicsFriction":0.2,
  "physicsGroup":1,
  "physicsKinematic":false,
  "physicsLinearDamping":0.1,
  "physicsObject":false,
  "physicsRestitution":0.1,
  "physicsSensor":false,
  "physicsShape":1,
  "physicsShapePoints":[],
  "physicsStartAwake":true,
  "properties":[
    {"$GMObjectProperty":"v1","%Name":"BubbleType","filters":[],"listItems":[
        "BUBBLE_TYPE_SMALL",
        "BUBBLE_TYPE_MEDIUM",
        "BUBBLE_TYPE_LARGE",
        "BUBBLE_TYPE_COUNTDOWN",
      ],"multiselect":false,"name":"BubbleType","rangeEnabled":true,"rangeMax":2.0,"rangeMin":0.0,"resourceType":"GMObjectProperty","resourceVersion":"2.0","value":"BUBBLE_TYPE_SMALL","varType":4,},
    {"$GMObjectProperty":"v1","%Name":"CountdownFrame","filters":[],"listItems":[],"multiselect":false,"name":"CountdownFrame","rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"resourceType":"GMObjectProperty","resourceVersion":"2.0","value":"0","varType":0,},
    {"$GMObjectProperty":"v1","%Name":"WobbleDirection","filters":[],"listItems":[],"multiselect":false,"name":"WobbleDirection","rangeEnabled":true,"rangeMax":1.0,"rangeMin":-1.0,"resourceType":"GMObjectProperty","resourceVersion":"2.0","value":"0","varType":1,},
  ],
  "resourceType":"GMObject",
  "resourceVersion":"2.0",
  "solid":false,
  "spriteId":{
    "name":"spr_obj_bubble",
    "path":"sprites/spr_obj_bubble/spr_obj_bubble.yy",
  },
  "spriteMaskId":null,
  "visible":true,
}