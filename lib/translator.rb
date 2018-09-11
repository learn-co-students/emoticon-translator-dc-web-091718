# require modules here
require "yaml"


def load_library(path)
	emotes = YAML.load_file(path)

	organized = {}

	organized["get_meaning"] = {}
	meanings = organized["get_meaning"]
	emotes.each do |meaning, emote_arr|
		meanings[emote_arr[1]] = meaning
	end

	organized["get_emoticon"] = {}
	emoticons = organized["get_emoticon"]
	emotes.each do |meaning, emote_arr|
		emoticons[emote_arr[0]] = emote_arr[1]
	end

	organized
end

def get_japanese_emoticon(path, emote)
	lib = load_library(path)
	emotes = lib["get_emoticon"]
	if emotes[emote].nil?
		return "Sorry, that emoticon was not found"
	else
		emotes[emote]
	end
end

def get_english_meaning(path, emote)
	lib = load_library(path)
	meanings = lib["get_meaning"]
	if meanings[emote].nil?
		return "Sorry, that emoticon was not found"
	else
		meanings[emote]
	end
end