package com.krinchan.minecraft.creepergriefrule.mixin;

import com.krinchan.minecraft.creepergriefrule.Mod;
import org.spongepowered.asm.mixin.Mixin;
import org.spongepowered.asm.mixin.Shadow;
import org.spongepowered.asm.mixin.injection.At;
import org.spongepowered.asm.mixin.injection.Inject;
import org.spongepowered.asm.mixin.injection.callback.CallbackInfo;

import net.minecraft.world.GameRules;
import net.minecraft.world.GameRules.Rule;
import net.minecraft.world.GameRules.Category;
import net.minecraft.world.GameRules.Key;
import net.minecraft.world.GameRules.Type;

/**
 * Mixin qui enregistre les nouvelles gamerules
 */
@Mixin(GameRules.class)
public final class GameRulesMixins {
    /** @see GameRules#register */
    @Shadow
    private static <T extends Rule<T>> Key<T> register(String name, Category category, Type<T> type) {
        return null;
    }

    @Inject(method = "<clinit>", at = @At("RETURN"))
    private static void onStaticInit(CallbackInfo ci) {
        Mod.CREEPER_GRIEFING = register("mobGriefingCreeper", Category.MOBS, BooleanRuleAccessor.callCreate(true));
    }
}
