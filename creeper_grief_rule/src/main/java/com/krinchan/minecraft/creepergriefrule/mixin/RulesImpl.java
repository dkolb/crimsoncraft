package com.krinchan.minecraft.creepergriefrule.mixin;


import com.krinchan.minecraft.creepergriefrule.Mod;
import net.minecraft.entity.mob.*;
import org.spongepowered.asm.mixin.Mixin;
import org.spongepowered.asm.mixin.injection.At;
import org.spongepowered.asm.mixin.injection.ModifyArg;
import net.minecraft.world.GameRules.BooleanRule;
import net.minecraft.world.GameRules.Key;

public final class RulesImpl {

    private RulesImpl() {}

    private static final String TARGET = "Lnet/minecraft/world/GameRules;getBoolean(Lnet/minecraft/world/GameRules$Key;)Z";


    public static final class Creeper {
        private Creeper() {
        }

        @Mixin(CreeperEntity.class)
        public static abstract class CreeperEntityMixin {
            /**
             * @see CreeperEntity#explode()
             */
            @ModifyArg(method = "explode", at = @At(value = "INVOKE", target = TARGET), index = 0)
            private Key<BooleanRule> mobGriefingProxy(Key<BooleanRule> old) {
                return Mod.CREEPER_GRIEFING;
            }
        }
    }
}
