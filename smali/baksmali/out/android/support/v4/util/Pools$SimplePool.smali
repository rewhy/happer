.class public Landroid/support/v4/util/Pools$SimplePool;
.super Ljava/lang/Object;
.source "Pools.java"

# interfaces
.implements Landroid/support/v4/util/Pools$Pool;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v4/util/Pools;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "SimplePool"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Landroid/support/v4/util/Pools$Pool<",
        "TT;>;"
    }
.end annotation


# instance fields
.field private final mPool:[Ljava/lang/Object;

.field private mPoolSize:I


# direct methods
.method public constructor <init>(I)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-lez p1, :cond_a

    new-array p1, p1, [Ljava/lang/Object;

    iput-object p1, p0, Landroid/support/v4/util/Pools$SimplePool;->mPool:[Ljava/lang/Object;

    return-void

    :cond_a
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "The max pool size must be > 0"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method private isInPool(Ljava/lang/Object;)Z
    .registers 5
    .param p1    # Ljava/lang/Object;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)Z"
        }
    .end annotation

    const/4 v0, 0x0

    const/4 v1, 0x0

    :goto_2
    iget v2, p0, Landroid/support/v4/util/Pools$SimplePool;->mPoolSize:I

    if-ge v1, v2, :cond_11

    iget-object v2, p0, Landroid/support/v4/util/Pools$SimplePool;->mPool:[Ljava/lang/Object;

    aget-object v2, v2, v1

    if-ne v2, p1, :cond_e

    const/4 p1, 0x1

    return p1

    :cond_e
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    :cond_11
    return v0
.end method


# virtual methods
.method public acquire()Ljava/lang/Object;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    iget v0, p0, Landroid/support/v4/util/Pools$SimplePool;->mPoolSize:I

    const/4 v1, 0x0

    if-lez v0, :cond_18

    iget v0, p0, Landroid/support/v4/util/Pools$SimplePool;->mPoolSize:I

    add-int/lit8 v0, v0, -0x1

    iget-object v2, p0, Landroid/support/v4/util/Pools$SimplePool;->mPool:[Ljava/lang/Object;

    aget-object v2, v2, v0

    iget-object v3, p0, Landroid/support/v4/util/Pools$SimplePool;->mPool:[Ljava/lang/Object;

    aput-object v1, v3, v0

    iget v0, p0, Landroid/support/v4/util/Pools$SimplePool;->mPoolSize:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Landroid/support/v4/util/Pools$SimplePool;->mPoolSize:I

    return-object v2

    :cond_18
    return-object v1
.end method

.method public release(Ljava/lang/Object;)Z
    .registers 4
    .param p1    # Ljava/lang/Object;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)Z"
        }
    .end annotation

    invoke-direct {p0, p1}, Landroid/support/v4/util/Pools$SimplePool;->isInPool(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1c

    iget v0, p0, Landroid/support/v4/util/Pools$SimplePool;->mPoolSize:I

    iget-object v1, p0, Landroid/support/v4/util/Pools$SimplePool;->mPool:[Ljava/lang/Object;

    array-length v1, v1

    if-ge v0, v1, :cond_1a

    iget-object v0, p0, Landroid/support/v4/util/Pools$SimplePool;->mPool:[Ljava/lang/Object;

    iget v1, p0, Landroid/support/v4/util/Pools$SimplePool;->mPoolSize:I

    aput-object p1, v0, v1

    iget p1, p0, Landroid/support/v4/util/Pools$SimplePool;->mPoolSize:I

    const/4 v0, 0x1

    add-int/2addr p1, v0

    iput p1, p0, Landroid/support/v4/util/Pools$SimplePool;->mPoolSize:I

    return v0

    :cond_1a
    const/4 p1, 0x0

    return p1

    :cond_1c
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "Already in the pool!"

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
