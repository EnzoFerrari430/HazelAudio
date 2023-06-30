project "HazelAudio"
	kind "StaticLib"
	language "C++"
	cppdialect "C++17"
	staticruntime "on"

	IncludeDirHazelAudio = {}
	IncludeDirHazelAudio["OpenALInclude"] = "vendor/OpenAL-Soft/include"
	IncludeDirHazelAudio["OpenALSrc"] = "vendor/OpenAL-Soft/src"
	IncludeDirHazelAudio["OpenALSrcCommon"] = "vendor/OpenAL-Soft/src/common"
	IncludeDirHazelAudio["ogg"] = "vendor/libogg/include"
	IncludeDirHazelAudio["Vorbis"] = "vendor/Vorbis/include"
	IncludeDirHazelAudio["minimp3"] = "vendor/minimp3"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
		"src/**.h",
		"src/**.cpp"
	}

	defines
	{
		"_CRT_SECURE_NO_WARNINGS",
		"AL_LIBTYPE_STATIC"
	}

	includedirs
	{
		"src",
		"%{IncludeDirHazelAudio.OpenALInclude}",
		"%{IncludeDirHazelAudio.OpenALSrc}",
		"%{IncludeDirHazelAudio.OpenALSrcCommon}",
		"%{IncludeDirHazelAudio.ogg}",
		"%{IncludeDirHazelAudio.Vorbis}",
		"%{IncludeDirHazelAudio.minimp3}"
	}

	links
	{
		"OpenAL-Soft",
		"Vorbis"
	}

	filter "system:windows"
		systemversion "latest"

	filter "configurations:Debug"
		defines "HZ_DEBUG"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		defines "HZ_RELEASE"
		runtime "Release"
		optimize "on"

	filter "configurations:Dist"
		defines "HZ_DIST"
		runtime "Release"
		optimize "on"
