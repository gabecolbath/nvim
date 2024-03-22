
--  888                                      888888b.                     888             888                             
--  888                                      888  "88b                    888             888                             
--  888                                      888  .88P                    888             888                             
--  888       8888b.  88888888 888  888      8888888K.   .d88b.   .d88b.  888888 .d8888b  888888 888d888 8888b.  88888b.  
--  888          "88b    d88P  888  888      888  "Y88b d88""88b d88""88b 888    88K      888    888P"      "88b 888 "88b 
--  888      .d888888   d88P   888  888      888    888 888  888 888  888 888    "Y8888b. 888    888    .d888888 888  888 
--  888      888  888  d88P    Y88b 888      888   d88P Y88..88P Y88..88P Y88b.       X88 Y88b.  888    888  888 888 d88P 
--  88888888 "Y888888 88888888  "Y88888      8888888P"   "Y88P"   "Y88P"   "Y888  88888P'  "Y888 888    "Y888888 88888P"  
--                                  888                                                                          888      
--                             Y8b d88P                                                                          888      
--                              "Y88P"                                                                           888     

local lazypath = vim.fn.stdpath("data") .. "lazy.lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)
