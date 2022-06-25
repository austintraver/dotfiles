-- https://neovim.io/news/2022/04
-- :h lua-filetype
vim.filetype.add({
    extension = {
		["cyp"] = "cypher",
		["cypher"] = "cypher",
		["cql"] = "cypher",
		["1"] = "groff",
		["2"] = "groff",
		["3"] = "groff",
		["4"] = "groff",
		["5"] = "groff",
		["6"] = "groff",
		["7"] = "groff",
		["8"] = "groff",
		["gdoc"] = "json",
		["gsheet"] = "json",
		["gslides"] = "json",
		["gform"] = "json",
		["gsite"] = "json",
		["gscript"] = "json",
		["gshortcut"] = "json",
		["manpath"] = "manconf",
		["toml"] = "toml",
		["tsv"] = "tsv",
		["icls"] = "xml",
		["numbers"] = "yaml",
    },
    filename = {
        ["gpg.conf"] = "gpg",
		["man.conf"] = "manconf",
    },
    pattern = {
        [".*/git/ignore"] = "gitignore",
        [".*/git/config"] = "gitconfig",
		[".*npmrc"] = "dosini",
		[".*asciinema"] = "dosini",
		[".*gdbinit"] = "gdb",
		[".*ssh/config"] = "sshconfig",
		[".*/zsh/functions/.*"] = "zsh",
    }
})
