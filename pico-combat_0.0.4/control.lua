if settings.startup["enable-cluster-rockets"].value then
    -- scatter cluster rockets when they are fired
    script.on_event(defines.events.on_script_trigger_effect, function(event)
        if event.effect_id == "cluster-rocket-fired" then
            game.print("cluster-rocket-fired")
            local source = event.source_entity
            if source then
                local projectiles = source.surface.find_entities_filtered{
                    position = event.source_position,
                    radius = 0.1,
                    type = "projectile"
                }
                for _, proj in ipairs(projectiles) do
                    if string.find(proj.name, "cluster") and string.find(proj.name, "rocket") then
                        game.print("found a cluster rocket")
                        local d = proj.orientation
                        d = d + math.random() / 2 - 0.25
                        if d > 1.0 then
                            d = d - 1.0
                        end
                        if d < 0 then
                            d = d + 1.0
                        end
                        proj.orientation = d
                    end
                end
            end
        end
    end
    )
end