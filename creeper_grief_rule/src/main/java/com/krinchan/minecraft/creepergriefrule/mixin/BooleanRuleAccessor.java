package com.krinchan.minecraft.creepergriefrule.mixin;

import org.spongepowered.asm.mixin.Mixin;
import org.spongepowered.asm.mixin.gen.Invoker;

import net.minecraft.world.GameRules.BooleanRule;
import net.minecraft.world.GameRules.Type;

@Mixin(BooleanRule.class)
public interface BooleanRuleAccessor {

    @Invoker
    static Type<BooleanRule> callCreate(boolean initialValue) {
        return null;
    }

}
