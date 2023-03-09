local cmp = require 'cmp'
local compare = cmp.config.compare

cmp.setup {
    sources = cmp.config.sources({
        --     { name = "nvim_lua" },
        -- { name = "nvim_lsp" },
        { name = "luasnip" },
    }),
    sorting = {
        priority_weight = 1.0,
        comparators = {
                 compare.locality,
            compare.recently_used,
            compare.score, -- based on :  score = score + ((#sources - (source_index - 1)) * sorting.priority_weight)
            compare.offset,
            compare.order,
        }
    }
}
