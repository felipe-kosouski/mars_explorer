# Mars Explorer

[WIP]

The goal of this project is to create a spaceship to explore Mars surface

The surface is represented by a Matrix that you can create by instantiating the ``ExplorableGround`` class passing the number of rows and cols that you want

This surface must be explored by the spaceships that will send pictures back to the terrestrial base.

A spaceship is represented by the class ``Probe``. To create an instance of Probe, you need to call new() passing a explorable area to be used, a position to be set in form of an array [x, y] and a string containing a direction (N, S, W, E)

PS: The direction is still being implemented, the idea is to be able to move in any one of the four directions

Finally, you can move a probe instance by using the ``move`` method. This method will aways move the probe from [x, y] to [x, y+1]

---

## Technologies used 

- Ruby 3.0.2
- Docker

---

## How to build and run

Make sure you have docker or ruby 3.0.2 installed

If you have ruby
```console
irb -r ./mars_explorer.rb
```

If you dont have ruby but have docker

```console
# Build the image
> docker build -t mars_explorer:latest .

# Execute Irb
> docker exec -it mars_explorer irb -r ./mars_explorer.rb
```

---

## Example of use


```ruby
# Create a new explorable ground
> explorable_ground = ExplorableGround.new(4, 6)

# Create a probe
> probe = Probe.new(explorable_ground, [0,0], "N")

# Move the probe
> probe.move
```