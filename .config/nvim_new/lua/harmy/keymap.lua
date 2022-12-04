function bind(mode, outer_opts)
	return function (lhs, rhs, opts)
		opts = vim.tbl_extent("force", {}, outer_opts or {}, opts or {})
	end
end
