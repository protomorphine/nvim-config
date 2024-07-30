DIR_SEP="/" --should be "/" for Unix platforms (Linux and Mac)
function browseFolder(root)
	for entity in lfs.dir(root) do
		if entity~="." and entity~=".." then
			local fullPath=root..DIR_SEP..entity
			--print("root: "..root..", entity: "..entity..", mode: "..(lfs.attributes(fullPath,"mode")or "-")..", full path: "..fullPath)
			local mode=lfs.attributes(fullPath,"mode")
			if mode=="file" then
				--this is where the processing happens. I print the name of the file and its path but it can be any code
				print(root.." > "..entity)
			elseif mode=="directory" then
				browseFolder(fullPath);
			end
		end
	end
end
