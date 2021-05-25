.class public Landroid/arch/core/internal/FastSafeIterableMap;
.super Landroid/arch/core/internal/SafeIterableMap;
.source "FastSafeIterableMap.java"


# annotations
.annotation build Landroid/support/annotation/RestrictTo;
    value = {
        .enum Landroid/support/annotation/RestrictTo$Scope;->LIBRARY_GROUP:Landroid/support/annotation/RestrictTo$Scope;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<K:",
        "Ljava/lang/Object;",
        "V:",
        "Ljava/lang/Object;",
        ">",
        "Landroid/arch/core/internal/SafeIterableMap<",
        "TK;TV;>;"
    }
.end annotation


# instance fields
.field private mHashMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "TK;",
            "Landroid/arch/core/internal/SafeIterableMap$Entry<",
            "TK;TV;>;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .registers 2

    return-void

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop
.end method


# virtual methods
.method public ceil(Ljava/lang/Object;)Ljava/util/Map$Entry;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;)",
            "Ljava/util/Map$Entry<",
            "TK;TV;>;"
        }
    .end annotation

    const/4 v0, 0x0

    return-object v0

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop
.end method

.method public contains(Ljava/lang/Object;)Z
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;)Z"
        }
    .end annotation

    const/4 v0, 0x0

    return v0

    nop

    nop

    nop

    nop

    nop
.end method

.method protected get(Ljava/lang/Object;)Landroid/arch/core/internal/SafeIterableMap$Entry;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;)",
            "Landroid/arch/core/internal/SafeIterableMap$Entry<",
            "TK;TV;>;"
        }
    .end annotation

    const/4 v0, 0x0

    return-object v0

    nop

    nop

    nop

    nop

    nop

    nop

    nop
.end method

.method public putIfAbsent(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4
    .param p1    # Ljava/lang/Object;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/Object;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;TV;)TV;"
        }
    .end annotation

    const/4 v0, 0x0

    return-object v0

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop
.end method

.method public remove(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4
    .param p1    # Ljava/lang/Object;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;)TV;"
        }
    .end annotation

    const/4 v0, 0x0

    return-object v0

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop
.end method
