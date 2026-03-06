-- Hide pagination bar in KOReader File Manager
-- Removes the "« < Page 1 of 2 > »" footer from the file browser
-- Swipe gestures for page navigation still work

local Menu = require("ui/widget/menu")

local orig_menu_init = Menu.init

function Menu:init()
    orig_menu_init(self)

    if self.name ~= "filemanager" then return end

    -- self[1] is FrameContainer, self[1][1] is the content OverlapGroup
    local content = self[1] and self[1][1]
    if not content then return end

    -- The OverlapGroup contains: content_group, page_return, footer
    -- Remove page_return and footer but keep content_group
    for i = #content, 1, -1 do
        if content[i] ~= self.content_group then
            table.remove(content, i)
        end
    end

    -- Recalculate to fill the space freed by removing the footer.
    -- We can't nil page_info_text/page_return_arrow since updatePageInfo
    -- still calls methods on them. Instead, override _recalculateDimen
    -- to always use bottom_height = 0 for this instance.
    -- MosaicMenu also checks self.page_info:getSize().h in its override,
    -- so we nil that too during recalculation.
    local orig_recalc = self._recalculateDimen
    self._recalculateDimen = function(self_inner, no_recalculate_dimen)
        local saved_arrow = self_inner.page_return_arrow
        local saved_text = self_inner.page_info_text
        local saved_info = self_inner.page_info
        self_inner.page_return_arrow = nil
        self_inner.page_info_text = nil
        self_inner.page_info = nil
        orig_recalc(self_inner, no_recalculate_dimen)
        self_inner.page_return_arrow = saved_arrow
        self_inner.page_info_text = saved_text
        self_inner.page_info = saved_info
    end

    self:_recalculateDimen()
end
