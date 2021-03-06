class "Particle"



BILLBOARD_PARTICLE = 0
MESH_PARTICLE = 1
function Particle:__index__(name)
	if name == "velVector" then
		retVal = Polycore.Particle_get_velVector(self.__ptr)
		if Polycore.__ptr_lookup[retVal] ~= nil then
			return Polycore.__ptr_lookup[retVal]
		else
			Polycore.__ptr_lookup[retVal] = Vector3("__skip_ptr__")
			Polycore.__ptr_lookup[retVal].__ptr = retVal
			return Polycore.__ptr_lookup[retVal]
		end
	elseif name == "dirVector" then
		retVal = Polycore.Particle_get_dirVector(self.__ptr)
		if Polycore.__ptr_lookup[retVal] ~= nil then
			return Polycore.__ptr_lookup[retVal]
		else
			Polycore.__ptr_lookup[retVal] = Vector3("__skip_ptr__")
			Polycore.__ptr_lookup[retVal].__ptr = retVal
			return Polycore.__ptr_lookup[retVal]
		end
	elseif name == "deviation" then
		retVal = Polycore.Particle_get_deviation(self.__ptr)
		if Polycore.__ptr_lookup[retVal] ~= nil then
			return Polycore.__ptr_lookup[retVal]
		else
			Polycore.__ptr_lookup[retVal] = Vector3("__skip_ptr__")
			Polycore.__ptr_lookup[retVal].__ptr = retVal
			return Polycore.__ptr_lookup[retVal]
		end
	elseif name == "life" then
		return Polycore.Particle_get_life(self.__ptr)
	elseif name == "lifespan" then
		return Polycore.Particle_get_lifespan(self.__ptr)
	elseif name == "brightnessDeviation" then
		return Polycore.Particle_get_brightnessDeviation(self.__ptr)
	elseif name == "perlinPosX" then
		return Polycore.Particle_get_perlinPosX(self.__ptr)
	elseif name == "perlinPosY" then
		return Polycore.Particle_get_perlinPosY(self.__ptr)
	elseif name == "perlinPosZ" then
		return Polycore.Particle_get_perlinPosZ(self.__ptr)
	end
end


function Particle:__set_callback(name,value)
	if name == "life" then
		Polycore.Particle_set_life(self.__ptr, value)
		return true
	elseif name == "lifespan" then
		Polycore.Particle_set_lifespan(self.__ptr, value)
		return true
	elseif name == "brightnessDeviation" then
		Polycore.Particle_set_brightnessDeviation(self.__ptr, value)
		return true
	elseif name == "perlinPosX" then
		Polycore.Particle_set_perlinPosX(self.__ptr, value)
		return true
	elseif name == "perlinPosY" then
		Polycore.Particle_set_perlinPosY(self.__ptr, value)
		return true
	elseif name == "perlinPosZ" then
		Polycore.Particle_set_perlinPosZ(self.__ptr, value)
		return true
	end
	return false
end


function Particle:Particle(...)
	for k,v in pairs(arg) do
		if type(v) == "table" then
			if v.__ptr ~= nil then
				arg[k] = v.__ptr
			end
		end
	end
	if self.__ptr == nil and arg[1] ~= "__skip_ptr__" then
		self.__ptr = Polycore.Particle(unpack(arg))
		Polycore.__ptr_lookup[self.__ptr] = self
	end
end

function Particle:Reset(continuious)
	local retVal = Polycore.Particle_Reset(self.__ptr, continuious)
end

function Particle:createSceneParticle(particleType, material, particleMesh)
	local retVal = Polycore.Particle_createSceneParticle(self.__ptr, particleType, material.__ptr, particleMesh.__ptr)
end

function Particle:createScreenParticle(particleType, texture, particleMesh)
	local retVal = Polycore.Particle_createScreenParticle(self.__ptr, particleType, texture.__ptr, particleMesh.__ptr)
end



function Particle:__delete()
	Polycore.__ptr_lookup[self.__ptr] = nil
	Polycore.delete_Particle(self.__ptr)
end
