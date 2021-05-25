.class Landroid/arch/core/internal/SafeIterableMap$AscendingIterator;
.super Landroid/arch/core/internal/SafeIterableMap$ListIterator;
.source "SafeIterableMap.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/arch/core/internal/SafeIterableMap;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "AscendingIterator"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<K:",
        "Ljava/lang/Object;",
        "V:",
        "Ljava/lang/Object;",
        ">",
        "Landroid/arch/core/internal/SafeIterableMap$ListIterator<",
        "TK;TV;>;"
    }
.end annotation


# direct methods
.method constructor <init>(Landroid/arch/core/internal/SafeIterableMap$Entry;Landroid/arch/core/internal/SafeIterableMap$Entry;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/arch/core/internal/SafeIterableMap$Entry<",
            "TK;TV;>;",
            "Landroid/arch/core/internal/SafeIterableMap$Entry<",
            "TK;TV;>;)V"
        }
    .end annotation

    return-void

    nop

    nop

    nop
.end method


# virtual methods
.method backward(Landroid/arch/core/internal/SafeIterableMap$Entry;)Landroid/arch/core/internal/SafeIterableMap$Entry;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/arch/core/internal/SafeIterableMap$Entry<",
            "TK;TV;>;)",
            "Landroid/arch/core/internal/SafeIterableMap$Entry<",
            "TK;TV;>;"
        }
    .end annotation

    const/4 p0, 0x0

    return-object p0

    nop
.end method

.method forward(Landroid/arch/core/internal/SafeIterableMap$Entry;)Landroid/arch/core/internal/SafeIterableMap$Entry;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/arch/core/internal/SafeIterableMap$Entry<",
            "TK;TV;>;)",
            "Landroid/arch/core/internal/SafeIterableMap$Entry<",
            "TK;TV;>;"
        }
    .end annotation

    const/4 p0, 0x0

    return-object p0

    nop
.end method
