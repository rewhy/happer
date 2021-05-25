.class public final Landroid/support/v4/util/CircularArray;
.super Ljava/lang/Object;
.source "CircularArray.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<E:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field private mCapacityBitmask:I

.field private mElements:[Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[TE;"
        }
    .end annotation
.end field

.field private mHead:I

.field private mTail:I


# direct methods
.method public constructor <init>()V
    .registers 2

    const/16 v0, 0x8

    invoke-direct {p0, v0}, Landroid/support/v4/util/CircularArray;-><init>(I)V

    return-void
.end method

.method public constructor <init>(I)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1

    if-lt p1, v0, :cond_2a

    const/high16 v1, 0x40000000    # 2.0f

    if-gt p1, v1, :cond_22

    invoke-static {p1}, Ljava/lang/Integer;->bitCount(I)I

    move-result v1

    if-eq v1, v0, :cond_17

    add-int/lit8 p1, p1, -0x1

    invoke-static {p1}, Ljava/lang/Integer;->highestOneBit(I)I

    move-result p1

    shl-int/2addr p1, v0

    :cond_17
    add-int/lit8 v0, p1, -0x1

    iput v0, p0, Landroid/support/v4/util/CircularArray;->mCapacityBitmask:I

    new-array p1, p1, [Ljava/lang/Object;

    check-cast p1, [Ljava/lang/Object;

    iput-object p1, p0, Landroid/support/v4/util/CircularArray;->mElements:[Ljava/lang/Object;

    return-void

    :cond_22
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "capacity must be <= 2^30"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_2a
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "capacity must be >= 1"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method private doubleCapacity()V
    .registers 8

    iget-object v0, p0, Landroid/support/v4/util/CircularArray;->mElements:[Ljava/lang/Object;

    array-length v0, v0

    iget v1, p0, Landroid/support/v4/util/CircularArray;->mHead:I

    sub-int v1, v0, v1

    shl-int/lit8 v2, v0, 0x1

    if-ltz v2, :cond_29

    new-array v3, v2, [Ljava/lang/Object;

    iget-object v4, p0, Landroid/support/v4/util/CircularArray;->mElements:[Ljava/lang/Object;

    iget v5, p0, Landroid/support/v4/util/CircularArray;->mHead:I

    const/4 v6, 0x0

    invoke-static {v4, v5, v3, v6, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    iget-object v4, p0, Landroid/support/v4/util/CircularArray;->mElements:[Ljava/lang/Object;

    iget v5, p0, Landroid/support/v4/util/CircularArray;->mHead:I

    invoke-static {v4, v6, v3, v1, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    check-cast v3, [Ljava/lang/Object;

    iput-object v3, p0, Landroid/support/v4/util/CircularArray;->mElements:[Ljava/lang/Object;

    iput v6, p0, Landroid/support/v4/util/CircularArray;->mHead:I

    iput v0, p0, Landroid/support/v4/util/CircularArray;->mTail:I

    add-int/lit8 v2, v2, -0x1

    iput v2, p0, Landroid/support/v4/util/CircularArray;->mCapacityBitmask:I

    return-void

    :cond_29
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "Max array capacity exceeded"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method


# virtual methods
.method public addFirst(Ljava/lang/Object;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;)V"
        }
    .end annotation

    iget v0, p0, Landroid/support/v4/util/CircularArray;->mHead:I

    add-int/lit8 v0, v0, -0x1

    iget v1, p0, Landroid/support/v4/util/CircularArray;->mCapacityBitmask:I

    and-int/2addr v0, v1

    iput v0, p0, Landroid/support/v4/util/CircularArray;->mHead:I

    iget-object v0, p0, Landroid/support/v4/util/CircularArray;->mElements:[Ljava/lang/Object;

    iget v1, p0, Landroid/support/v4/util/CircularArray;->mHead:I

    aput-object p1, v0, v1

    iget p1, p0, Landroid/support/v4/util/CircularArray;->mHead:I

    iget v0, p0, Landroid/support/v4/util/CircularArray;->mTail:I

    if-ne p1, v0, :cond_18

    invoke-direct {p0}, Landroid/support/v4/util/CircularArray;->doubleCapacity()V

    :cond_18
    return-void
.end method

.method public addLast(Ljava/lang/Object;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;)V"
        }
    .end annotation

    iget-object v0, p0, Landroid/support/v4/util/CircularArray;->mElements:[Ljava/lang/Object;

    iget v1, p0, Landroid/support/v4/util/CircularArray;->mTail:I

    aput-object p1, v0, v1

    iget p1, p0, Landroid/support/v4/util/CircularArray;->mTail:I

    add-int/lit8 p1, p1, 0x1

    iget v0, p0, Landroid/support/v4/util/CircularArray;->mCapacityBitmask:I

    and-int/2addr p1, v0

    iput p1, p0, Landroid/support/v4/util/CircularArray;->mTail:I

    iget p1, p0, Landroid/support/v4/util/CircularArray;->mTail:I

    iget v0, p0, Landroid/support/v4/util/CircularArray;->mHead:I

    if-ne p1, v0, :cond_18

    invoke-direct {p0}, Landroid/support/v4/util/CircularArray;->doubleCapacity()V

    :cond_18
    return-void
.end method

.method public clear()V
    .registers 2

    invoke-virtual {p0}, Landroid/support/v4/util/CircularArray;->size()I

    move-result v0

    invoke-virtual {p0, v0}, Landroid/support/v4/util/CircularArray;->removeFromStart(I)V

    return-void
.end method

.method public get(I)Ljava/lang/Object;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TE;"
        }
    .end annotation

    if-ltz p1, :cond_13

    invoke-virtual {p0}, Landroid/support/v4/util/CircularArray;->size()I

    move-result v0

    if-ge p1, v0, :cond_13

    iget-object v0, p0, Landroid/support/v4/util/CircularArray;->mElements:[Ljava/lang/Object;

    iget v1, p0, Landroid/support/v4/util/CircularArray;->mHead:I

    add-int/2addr v1, p1

    iget p1, p0, Landroid/support/v4/util/CircularArray;->mCapacityBitmask:I

    and-int/2addr p1, v1

    aget-object p1, v0, p1

    return-object p1

    :cond_13
    new-instance p1, Ljava/lang/ArrayIndexOutOfBoundsException;

    invoke-direct {p1}, Ljava/lang/ArrayIndexOutOfBoundsException;-><init>()V

    throw p1
.end method

.method public getFirst()Ljava/lang/Object;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TE;"
        }
    .end annotation

    iget v0, p0, Landroid/support/v4/util/CircularArray;->mHead:I

    iget v1, p0, Landroid/support/v4/util/CircularArray;->mTail:I

    if-eq v0, v1, :cond_d

    iget-object v0, p0, Landroid/support/v4/util/CircularArray;->mElements:[Ljava/lang/Object;

    iget v1, p0, Landroid/support/v4/util/CircularArray;->mHead:I

    aget-object v0, v0, v1

    return-object v0

    :cond_d
    new-instance v0, Ljava/lang/ArrayIndexOutOfBoundsException;

    invoke-direct {v0}, Ljava/lang/ArrayIndexOutOfBoundsException;-><init>()V

    throw v0
.end method

.method public getLast()Ljava/lang/Object;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TE;"
        }
    .end annotation

    iget v0, p0, Landroid/support/v4/util/CircularArray;->mHead:I

    iget v1, p0, Landroid/support/v4/util/CircularArray;->mTail:I

    if-eq v0, v1, :cond_12

    iget-object v0, p0, Landroid/support/v4/util/CircularArray;->mElements:[Ljava/lang/Object;

    iget v1, p0, Landroid/support/v4/util/CircularArray;->mTail:I

    add-int/lit8 v1, v1, -0x1

    iget v2, p0, Landroid/support/v4/util/CircularArray;->mCapacityBitmask:I

    and-int/2addr v1, v2

    aget-object v0, v0, v1

    return-object v0

    :cond_12
    new-instance v0, Ljava/lang/ArrayIndexOutOfBoundsException;

    invoke-direct {v0}, Ljava/lang/ArrayIndexOutOfBoundsException;-><init>()V

    throw v0
.end method

.method public isEmpty()Z
    .registers 3

    iget v0, p0, Landroid/support/v4/util/CircularArray;->mHead:I

    iget v1, p0, Landroid/support/v4/util/CircularArray;->mTail:I

    if-ne v0, v1, :cond_8

    const/4 v0, 0x1

    goto :goto_9

    :cond_8
    const/4 v0, 0x0

    :goto_9
    return v0
.end method

.method public popFirst()Ljava/lang/Object;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TE;"
        }
    .end annotation

    iget v0, p0, Landroid/support/v4/util/CircularArray;->mHead:I

    iget v1, p0, Landroid/support/v4/util/CircularArray;->mTail:I

    if-eq v0, v1, :cond_1d

    iget-object v0, p0, Landroid/support/v4/util/CircularArray;->mElements:[Ljava/lang/Object;

    iget v1, p0, Landroid/support/v4/util/CircularArray;->mHead:I

    aget-object v0, v0, v1

    iget-object v1, p0, Landroid/support/v4/util/CircularArray;->mElements:[Ljava/lang/Object;

    iget v2, p0, Landroid/support/v4/util/CircularArray;->mHead:I

    const/4 v3, 0x0

    aput-object v3, v1, v2

    iget v1, p0, Landroid/support/v4/util/CircularArray;->mHead:I

    add-int/lit8 v1, v1, 0x1

    iget v2, p0, Landroid/support/v4/util/CircularArray;->mCapacityBitmask:I

    and-int/2addr v1, v2

    iput v1, p0, Landroid/support/v4/util/CircularArray;->mHead:I

    return-object v0

    :cond_1d
    new-instance v0, Ljava/lang/ArrayIndexOutOfBoundsException;

    invoke-direct {v0}, Ljava/lang/ArrayIndexOutOfBoundsException;-><init>()V

    throw v0
.end method

.method public popLast()Ljava/lang/Object;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TE;"
        }
    .end annotation

    iget v0, p0, Landroid/support/v4/util/CircularArray;->mHead:I

    iget v1, p0, Landroid/support/v4/util/CircularArray;->mTail:I

    if-eq v0, v1, :cond_19

    iget v0, p0, Landroid/support/v4/util/CircularArray;->mTail:I

    add-int/lit8 v0, v0, -0x1

    iget v1, p0, Landroid/support/v4/util/CircularArray;->mCapacityBitmask:I

    and-int/2addr v0, v1

    iget-object v1, p0, Landroid/support/v4/util/CircularArray;->mElements:[Ljava/lang/Object;

    aget-object v1, v1, v0

    iget-object v2, p0, Landroid/support/v4/util/CircularArray;->mElements:[Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object v3, v2, v0

    iput v0, p0, Landroid/support/v4/util/CircularArray;->mTail:I

    return-object v1

    :cond_19
    new-instance v0, Ljava/lang/ArrayIndexOutOfBoundsException;

    invoke-direct {v0}, Ljava/lang/ArrayIndexOutOfBoundsException;-><init>()V

    throw v0
.end method

.method public removeFromEnd(I)V
    .registers 6

    if-gtz p1, :cond_3

    return-void

    :cond_3
    invoke-virtual {p0}, Landroid/support/v4/util/CircularArray;->size()I

    move-result v0

    if-gt p1, v0, :cond_40

    const/4 v0, 0x0

    iget v1, p0, Landroid/support/v4/util/CircularArray;->mTail:I

    if-ge p1, v1, :cond_11

    iget v0, p0, Landroid/support/v4/util/CircularArray;->mTail:I

    sub-int/2addr v0, p1

    :cond_11
    move v1, v0

    :goto_12
    iget v2, p0, Landroid/support/v4/util/CircularArray;->mTail:I

    const/4 v3, 0x0

    if-ge v1, v2, :cond_1e

    iget-object v2, p0, Landroid/support/v4/util/CircularArray;->mElements:[Ljava/lang/Object;

    aput-object v3, v2, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_12

    :cond_1e
    iget v1, p0, Landroid/support/v4/util/CircularArray;->mTail:I

    sub-int/2addr v1, v0

    sub-int/2addr p1, v1

    iget v0, p0, Landroid/support/v4/util/CircularArray;->mTail:I

    sub-int/2addr v0, v1

    iput v0, p0, Landroid/support/v4/util/CircularArray;->mTail:I

    if-lez p1, :cond_3f

    iget-object v0, p0, Landroid/support/v4/util/CircularArray;->mElements:[Ljava/lang/Object;

    array-length v0, v0

    iput v0, p0, Landroid/support/v4/util/CircularArray;->mTail:I

    iget v0, p0, Landroid/support/v4/util/CircularArray;->mTail:I

    sub-int/2addr v0, p1

    move p1, v0

    :goto_32
    iget v1, p0, Landroid/support/v4/util/CircularArray;->mTail:I

    if-ge p1, v1, :cond_3d

    iget-object v1, p0, Landroid/support/v4/util/CircularArray;->mElements:[Ljava/lang/Object;

    aput-object v3, v1, p1

    add-int/lit8 p1, p1, 0x1

    goto :goto_32

    :cond_3d
    iput v0, p0, Landroid/support/v4/util/CircularArray;->mTail:I

    :cond_3f
    return-void

    :cond_40
    new-instance p1, Ljava/lang/ArrayIndexOutOfBoundsException;

    invoke-direct {p1}, Ljava/lang/ArrayIndexOutOfBoundsException;-><init>()V

    throw p1
.end method

.method public removeFromStart(I)V
    .registers 6

    if-gtz p1, :cond_3

    return-void

    :cond_3
    invoke-virtual {p0}, Landroid/support/v4/util/CircularArray;->size()I

    move-result v0

    if-gt p1, v0, :cond_3c

    iget-object v0, p0, Landroid/support/v4/util/CircularArray;->mElements:[Ljava/lang/Object;

    array-length v0, v0

    iget v1, p0, Landroid/support/v4/util/CircularArray;->mHead:I

    sub-int v1, v0, v1

    if-ge p1, v1, :cond_15

    iget v0, p0, Landroid/support/v4/util/CircularArray;->mHead:I

    add-int/2addr v0, p1

    :cond_15
    iget v1, p0, Landroid/support/v4/util/CircularArray;->mHead:I

    :goto_17
    const/4 v2, 0x0

    if-ge v1, v0, :cond_21

    iget-object v3, p0, Landroid/support/v4/util/CircularArray;->mElements:[Ljava/lang/Object;

    aput-object v2, v3, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_17

    :cond_21
    iget v1, p0, Landroid/support/v4/util/CircularArray;->mHead:I

    sub-int/2addr v0, v1

    sub-int/2addr p1, v0

    iget v1, p0, Landroid/support/v4/util/CircularArray;->mHead:I

    add-int/2addr v1, v0

    iget v0, p0, Landroid/support/v4/util/CircularArray;->mCapacityBitmask:I

    and-int/2addr v0, v1

    iput v0, p0, Landroid/support/v4/util/CircularArray;->mHead:I

    if-lez p1, :cond_3b

    const/4 v0, 0x0

    :goto_30
    if-ge v0, p1, :cond_39

    iget-object v1, p0, Landroid/support/v4/util/CircularArray;->mElements:[Ljava/lang/Object;

    aput-object v2, v1, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_30

    :cond_39
    iput p1, p0, Landroid/support/v4/util/CircularArray;->mHead:I

    :cond_3b
    return-void

    :cond_3c
    new-instance p1, Ljava/lang/ArrayIndexOutOfBoundsException;

    invoke-direct {p1}, Ljava/lang/ArrayIndexOutOfBoundsException;-><init>()V

    throw p1
.end method

.method public size()I
    .registers 3

    iget v0, p0, Landroid/support/v4/util/CircularArray;->mTail:I

    iget v1, p0, Landroid/support/v4/util/CircularArray;->mHead:I

    sub-int/2addr v0, v1

    iget v1, p0, Landroid/support/v4/util/CircularArray;->mCapacityBitmask:I

    and-int/2addr v0, v1

    return v0
.end method
