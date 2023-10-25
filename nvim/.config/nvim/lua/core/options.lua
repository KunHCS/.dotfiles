 local options = {
	         
  hlsearch = true,                        
  ignorecase = true,                      
  smartcase = true,                       
  smartindent = true,                     
  splitbelow = true,                      
  splitright = true,                      
  expandtab = true,                       
  shiftwidth = 2,
  softtabstop=2,
  number = true,                          
  relativenumber = true,                 
  scrolloff = 8,                          
  sidescrolloff = 8,                      
  wrap = false,
  backup = false,
  writebackup = false,
  swapfile = false,

}

for k, v in pairs(options) do
  vim.opt[k] = v
end
