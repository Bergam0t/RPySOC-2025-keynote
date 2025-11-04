-- Incremental lists for revealjs inside ::: {.incremental}
-- One click both fades previous and shows next; bullets appear with text.

local incremental_depth = 0

local function has_class(el, klass)
  local classes = el.classes or {}
  for _, c in ipairs(classes) do
    if c == klass then return true end
  end
  return false
end

-- Wrap a single list-item's Blocks in a fragment DIV with a given index
local function wrap_item_with_fragment(item_blocks, idx)
  local div = pandoc.Div(item_blocks)
  div.attr = pandoc.Attr("", {"fragment", "fade-in"})
  div.attr.attributes = div.attr.attributes or {}
  div.attr.attributes["data-fragment-index"] = tostring(idx)
  -- Return as the item's content
  return { div }
end

-- Append an empty inline fragment to the end of a list item that will
-- trigger a fade-out at the same step the next item fades in.
local function append_fadeout_trigger_to_item(item_blocks, idx)
  if #item_blocks == 0 then
    -- ensure there is at least one block to append to
    table.insert(item_blocks, pandoc.Para({}))
  end
  local last = item_blocks[#item_blocks]
  -- Make sure we append to a block that supports inlines (Para/Plain)
  if last.t ~= "Para" and last.t ~= "Plain" then
    table.insert(item_blocks, pandoc.Para({}))
    last = item_blocks[#item_blocks]
  end
  local span = pandoc.Span({}, {"fragment", "fade-out"})
  span.attributes = span.attributes or {}
  span.attributes["data-fragment-index"] = tostring(idx)
  table.insert(last.content, span)
end

local function transform_list_items(el)
  -- el.content is a list of items; each item is a list of Blocks
  local items = el.content
  local new_items = {}

  -- First, wrap each item with a fade-in fragment and assign explicit indices
  for i, item_blocks in ipairs(items) do
    new_items[i] = wrap_item_with_fragment(item_blocks, i)
  end

  -- Then, for each item i>1, append a same-index fade-out trigger to item i-1
  for i = 2, #new_items do
    -- new_items[i-1] is the list of Blocks for previous item
    local prev_blocks = new_items[i-1]
    append_fadeout_trigger_to_item(prev_blocks, i)
  end

  el.content = new_items
  return el
end

function Div(el)
  if has_class(el, "incremental") then
    incremental_depth = incremental_depth + 1
    el = pandoc.walk_block(el, {
      BulletList  = BulletList,
      OrderedList = OrderedList,
      Div         = Div, -- support nested .incremental
    })
    incremental_depth = incremental_depth - 1
    return el
  end
  -- nil => unchanged
end

function BulletList(el)
  if incremental_depth > 0 then
    return transform_list_items(el)
  end
end

function OrderedList(el)
  if incremental_depth > 0 then
    return transform_list_items(el)
  end
end
