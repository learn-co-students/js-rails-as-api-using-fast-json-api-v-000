class SightingsController < ApplicationController
  def show
    sighting = Sighting.find(params[:id])
    render json: sighting.to_json(:include => {:bird => {:only =>[:name, :species]}, :location => {:only =>[:latitude, :longitude]}}, :except => [:updated_at])
    
    To start using the new serializers, we can update our render json: statement so that it initializes the newly created SightingSerializer, passing in a variable, just as we did when creating our own service class:

    render json: SightingSerializer.new(sighting)

    Setting these relationships up is necessary for the second step. Now that we have included relationships connecting the SightingSerializer to :bird and :location, to include attributes from those objects, the recommended method is to pass in a second options parameter to the serializer indicating that we want to include those objects:
    
    options = {
      include: [:bird, :location]
    }
    render json: SightingSerializer.new(sighting, options) 
  end

end

#With just three objects and some minor customization, rendering has become complicated. With Fast JSON API, we can extract and separate this work into Serializer classes, keeping our controller cleaner.
#a serializer is like helper methods or a module, it dries it and the Fast JSON API
#is the best JSON serializer for RAILS APIS





class SightingSerializer
  include FastJsonapi::ObjectSerializer
  #We can also use attributes to access related objects, adding them alongside normal object attributes:
  #attributes :created_at, :bird, :location
  #This results in our rendered JSON including an "attributes" object with "created_at", "bird", and "location":
  #However, here, we have no control over what attributes are included in the related objects, and so we get all the attributes of "bird" and "location".
  attributes :created_at
  belongs_to :bird  #Object relationships can be included in serializers in two steps. The first step is that we include the relationships we want to reflect in our serializers. We can do this in the same way that we include them in the models themselves.
  belongs_to :location
end

Not Quite the Data Structure We Started With
At the beginning of this lesson, we had the following JSON, but with a messy controller:

{
  "id": 2,
  "bird_id": 2,
  "location_id": 2,
  "created_at": "2019-05-14T11:20:37.228Z",
  "bird": {
    "name": "Grackle",
    "species": "Quiscalus Quiscula"
  },
  "location": {
    "latitude": 30.26715,
    "longitude": -97.74306
  }
}

Conclusion
There is a lot more you can do with the Fast JSON API gem, and it is worth reading through their documentation to become more familiar with it. It is possible, for instance, to create entirely custom attributes!

What we covered is enough to get us close to where we were creating our own customized serializers. We do not get to choose exactly how data gets serialized the way we do when writing our own serializer classes, but we gain a lot of flexibility by using the Fast JSON API.

The Fast JSON API gem provides a quick way to generate and customize JSON serializers with minimal configuration. Its conventions also allow it to work well even when dealing with a large number of related objects.

Overall, the goal of this section is to get you comfortable enough to get Rails APIs up and running. With practice, it is possible to build a multi-resource API, complete with many serialized JSON rendering endpoints within minutes.

Being able to quickly spin up an API to practice your fetch() skills is an excellent way to get familiar with asynchronous requests. As you move towards building larger frontend projects, you'll also quickly need a place to persist data and handle things like login security. Rails as an API will be a critical asset in your development through the remainder of this course.

Fast JSON API

Fast Javascript Object Notation Application Programming Interface

In short, We're using serializers to make life easier and drier.