.class public Landroid/support/v4/util/SparseArrayCompat;
.super Ljava/lang/Object;
.source "SparseArrayCompat.java"

# interfaces
.implements Ljava/lang/Cloneable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<E:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Ljava/lang/Cloneable;"
    }
.end annotation


# static fields
.field private static final DELETED:Ljava/lang/Object;


# instance fields
.field private mGarbage:Z

.field private mKeys:[I

.field private mSize:I

.field private mValues:[Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Landroid/support/v4/util/SparseArrayCompat;->DELETED:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>()V
    .registers 2

    const/16 v0, 0xa

    invoke-direct {p0, v0}, Landroid/support/v4/util/SparseArrayCompat;-><init>(I)V

    return-void
.end method

.method public constructor <init>(I)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Landroid/support/v4/util/SparseArrayCompat;->mGarbage:Z

    if-nez p1, :cond_11

    sget-object p1, Landroid/support/v4/util/ContainerHelpers;->EMPTY_INTS:[I

    iput-object p1, p0, Landroid/support/v4/util/SparseArrayCompat;->mKeys:[I

    sget-object p1, Landroid/support/v4/util/ContainerHelpers;->EMPTY_OBJECTS:[Ljava/lang/Object;

    iput-object p1, p0, Landroid/support/v4/util/SparseArrayCompat;->mValues:[Ljava/lang/Object;

    goto :goto_1d

    :cond_11
    invoke-static {p1}, Landroid/support/v4/util/ContainerHelpers;->idealIntArraySize(I)I

    move-result p1

    new-array v1, p1, [I

    iput-object v1, p0, Landroid/support/v4/util/SparseArrayCompat;->mKeys:[I

    new-array p1, p1, [Ljava/lang/Object;

    iput-object p1, p0, Landroid/support/v4/util/SparseArrayCompat;->mValues:[Ljava/lang/Object;

    :goto_1d
    iput v0, p0, Landroid/support/v4/util/SparseArrayCompat;->mSize:I

    return-void
.end method

.method private gc()V
    .registers 9

    iget v0, p0, Landroid/support/v4/util/SparseArrayCompat;->mSize:I

    iget-object v1, p0, Landroid/support/v4/util/SparseArrayCompat;->mKeys:[I

    iget-object v2, p0, Landroid/support/v4/util/SparseArrayCompat;->mValues:[Ljava/lang/Object;

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    :goto_9
    if-ge v4, v0, :cond_21

    aget-object v6, v2, v4

    sget-object v7, Landroid/support/v4/util/SparseArrayCompat;->DELETED:Ljava/lang/Object;

    if-eq v6, v7, :cond_1e

    if-eq v4, v5, :cond_1c

    aget v7, v1, v4

    aput v7, v1, v5

    aput-object v6, v2, v5

    const/4 v6, 0x0

    aput-object v6, v2, v4

    :cond_1c
    add-int/lit8 v5, v5, 0x1

    :cond_1e
    add-int/lit8 v4, v4, 0x1

    goto :goto_9

    :cond_21
    iput-boolean v3, p0, Landroid/support/v4/util/SparseArrayCompat;->mGarbage:Z

    iput v5, p0, Landroid/support/v4/util/SparseArrayCompat;->mSize:I

    return-void
.end method


# virtual methods
.method public append(ILjava/lang/Object;)V
    .registers 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ITE;)V"
        }
    .end annotation

    iget v0, p0, Landroid/support/v4/util/SparseArrayCompat;->mSize:I

    if-eqz v0, :cond_12

    iget-object v0, p0, Landroid/support/v4/util/SparseArrayCompat;->mKeys:[I

    iget v1, p0, Landroid/support/v4/util/SparseArrayCompat;->mSize:I

    add-int/lit8 v1, v1, -0x1

    aget v0, v0, v1

    if-gt p1, v0, :cond_12

    invoke-virtual {p0, p1, p2}, Landroid/support/v4/util/SparseArrayCompat;->put(ILjava/lang/Object;)V

    return-void

    :cond_12
    iget-boolean v0, p0, Landroid/support/v4/util/SparseArrayCompat;->mGarbage:Z

    if-eqz v0, :cond_20

    iget v0, p0, Landroid/support/v4/util/SparseArrayCompat;->mSize:I

    iget-object v1, p0, Landroid/support/v4/util/SparseArrayCompat;->mKeys:[I

    array-length v1, v1

    if-lt v0, v1, :cond_20

    invoke-direct {p0}, Landroid/support/v4/util/SparseArrayCompat;->gc()V

    :cond_20
    iget v0, p0, Landroid/support/v4/util/SparseArrayCompat;->mSize:I

    iget-object v1, p0, Landroid/support/v4/util/SparseArrayCompat;->mKeys:[I

    array-length v1, v1

    if-lt v0, v1, :cond_46

    add-int/lit8 v1, v0, 0x1

    invoke-static {v1}, Landroid/support/v4/util/ContainerHelpers;->idealIntArraySize(I)I

    move-result v1

    new-array v2, v1, [I

    new-array v1, v1, [Ljava/lang/Object;

    iget-object v3, p0, Landroid/support/v4/util/SparseArrayCompat;->mKeys:[I

    iget-object v4, p0, Landroid/support/v4/util/SparseArrayCompat;->mKeys:[I

    array-length v4, v4

    const/4 v5, 0x0

    invoke-static {v3, v5, v2, v5, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    iget-object v3, p0, Landroid/support/v4/util/SparseArrayCompat;->mValues:[Ljava/lang/Object;

    iget-object v4, p0, Landroid/support/v4/util/SparseArrayCompat;->mValues:[Ljava/lang/Object;

    array-length v4, v4

    invoke-static {v3, v5, v1, v5, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    iput-object v2, p0, Landroid/support/v4/util/SparseArrayCompat;->mKeys:[I

    iput-object v1, p0, Landroid/support/v4/util/SparseArrayCompat;->mValues:[Ljava/lang/Object;

    :cond_46
    iget-object v1, p0, Landroid/support/v4/util/SparseArrayCompat;->mKeys:[I

    aput p1, v1, v0

    iget-object p1, p0, Landroid/support/v4/util/SparseArrayCompat;->mValues:[Ljava/lang/Object;

    aput-object p2, p1, v0

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Landroid/support/v4/util/SparseArrayCompat;->mSize:I

    return-void
.end method

.method public clear()V
    .registers 6

    iget v0, p0, Landroid/support/v4/util/SparseArrayCompat;->mSize:I

    iget-object v1, p0, Landroid/support/v4/util/SparseArrayCompat;->mValues:[Ljava/lang/Object;

    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_6
    if-ge v3, v0, :cond_e

    const/4 v4, 0x0

    aput-object v4, v1, v3

    add-int/lit8 v3, v3, 0x1

    goto :goto_6

    :cond_e
    iput v2, p0, Landroid/support/v4/util/SparseArrayCompat;->mSize:I

    iput-boolean v2, p0, Landroid/support/v4/util/SparseArrayCompat;->mGarbage:Z

    return-void
.end method

.method public clone()Landroid/support/v4/util/SparseArrayCompat;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroid/support/v4/util/SparseArrayCompat<",
            "TE;>;"
        }
    .end annotation

    :try_start_0
    invoke-super {p0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/support/v4/util/SparseArrayCompat;

    iget-object v1, p0, Landroid/support/v4/util/SparseArrayCompat;->mKeys:[I

    invoke-virtual {v1}, [I->clone()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [I

    iput-object v1, v0, Landroid/support/v4/util/SparseArrayCompat;->mKeys:[I

    iget-object v1, p0, Landroid/support/v4/util/SparseArrayCompat;->mValues:[Ljava/lang/Object;

    invoke-virtual {v1}, [Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Ljava/lang/Object;

    iput-object v1, v0, Landroid/support/v4/util/SparseArrayCompat;->mValues:[Ljava/lang/Object;
    :try_end_1a
    .catch Ljava/lang/CloneNotSupportedException; {:try_start_0 .. :try_end_1a} :catch_1b

    return-object v0

    :catch_1b
    move-exception v0

    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1, v0}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v1
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    invoke-virtual {p0}, Landroid/support/v4/util/SparseArrayCompat;->clone()Landroid/support/v4/util/SparseArrayCompat;

    move-result-object v0

    return-object v0
.end method

.method public containsKey(I)Z
    .registers 2

    invoke-virtual {p0, p1}, Landroid/support/v4/util/SparseArrayCompat;->indexOfKey(I)I

    move-result p1

    if-ltz p1, :cond_8

    const/4 p1, 0x1

    goto :goto_9

    :cond_8
    const/4 p1, 0x0

    :goto_9
    return p1
.end method

.method public containsValue(Ljava/lang/Object;)Z
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;)Z"
        }
    .end annotation

    invoke-virtual {p0, p1}, Landroid/support/v4/util/SparseArrayCompat;->indexOfValue(Ljava/lang/Object;)I

    move-result p1

    if-ltz p1, :cond_8

    const/4 p1, 0x1

    goto :goto_9

    :cond_8
    const/4 p1, 0x0

    :goto_9
    return p1
.end method

.method public delete(I)V
    .registers 4

    iget-object v0, p0, Landroid/support/v4/util/SparseArrayCompat;->mKeys:[I

    iget v1, p0, Landroid/support/v4/util/SparseArrayCompat;->mSize:I

    invoke-static {v0, v1, p1}, Landroid/support/v4/util/ContainerHelpers;->binarySearch([III)I

    move-result p1

    if-ltz p1, :cond_1b

    iget-object v0, p0, Landroid/support/v4/util/SparseArrayCompat;->mValues:[Ljava/lang/Object;

    aget-object v0, v0, p1

    sget-object v1, Landroid/support/v4/util/SparseArrayCompat;->DELETED:Ljava/lang/Object;

    if-eq v0, v1, :cond_1b

    iget-object v0, p0, Landroid/support/v4/util/SparseArrayCompat;->mValues:[Ljava/lang/Object;

    sget-object v1, Landroid/support/v4/util/SparseArrayCompat;->DELETED:Ljava/lang/Object;

    aput-object v1, v0, p1

    const/4 p1, 0x1

    iput-boolean p1, p0, Landroid/support/v4/util/SparseArrayCompat;->mGarbage:Z

    :cond_1b
    return-void
.end method

.method public get(I)Ljava/lang/Object;
    .registers 3
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TE;"
        }
    .end annotation

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Landroid/support/v4/util/SparseArrayCompat;->get(ILjava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public get(ILjava/lang/Object;)Ljava/lang/Object;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ITE;)TE;"
        }
    .end annotation

    iget-object v0, p0, Landroid/support/v4/util/SparseArrayCompat;->mKeys:[I

    iget v1, p0, Landroid/support/v4/util/SparseArrayCompat;->mSize:I

    invoke-static {v0, v1, p1}, Landroid/support/v4/util/ContainerHelpers;->binarySearch([III)I

    move-result p1

    if-ltz p1, :cond_18

    iget-object v0, p0, Landroid/support/v4/util/SparseArrayCompat;->mValues:[Ljava/lang/Object;

    aget-object v0, v0, p1

    sget-object v1, Landroid/support/v4/util/SparseArrayCompat;->DELETED:Ljava/lang/Object;

    if-ne v0, v1, :cond_13

    goto :goto_18

    :cond_13
    iget-object p2, p0, Landroid/support/v4/util/SparseArrayCompat;->mValues:[Ljava/lang/Object;

    aget-object p1, p2, p1

    return-object p1

    :cond_18
    :goto_18
    return-object p2
.end method

.method public indexOfKey(I)I
    .registers 4

    iget-boolean v0, p0, Landroid/support/v4/util/SparseArrayCompat;->mGarbage:Z

    if-eqz v0, :cond_7

    invoke-direct {p0}, Landroid/support/v4/util/SparseArrayCompat;->gc()V

    :cond_7
    iget-object v0, p0, Landroid/support/v4/util/SparseArrayCompat;->mKeys:[I

    iget v1, p0, Landroid/support/v4/util/SparseArrayCompat;->mSize:I

    invoke-static {v0, v1, p1}, Landroid/support/v4/util/ContainerHelpers;->binarySearch([III)I

    move-result p1

    return p1
.end method

.method public indexOfValue(Ljava/lang/Object;)I
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;)I"
        }
    .end annotation

    iget-boolean v0, p0, Landroid/support/v4/util/SparseArrayCompat;->mGarbage:Z

    if-eqz v0, :cond_7

    invoke-direct {p0}, Landroid/support/v4/util/SparseArrayCompat;->gc()V

    :cond_7
    const/4 v0, 0x0

    :goto_8
    iget v1, p0, Landroid/support/v4/util/SparseArrayCompat;->mSize:I

    if-ge v0, v1, :cond_16

    iget-object v1, p0, Landroid/support/v4/util/SparseArrayCompat;->mValues:[Ljava/lang/Object;

    aget-object v1, v1, v0

    if-ne v1, p1, :cond_13

    return v0

    :cond_13
    add-int/lit8 v0, v0, 0x1

    goto :goto_8

    :cond_16
    const/4 p1, -0x1

    return p1
.end method

.method public isEmpty()Z
    .registers 2

    invoke-virtual {p0}, Landroid/support/v4/util/SparseArrayCompat;->size()I

    move-result v0

    if-nez v0, :cond_8

    const/4 v0, 0x1

    goto :goto_9

    :cond_8
    const/4 v0, 0x0

    :goto_9
    return v0
.end method

.method public keyAt(I)I
    .registers 3

    iget-boolean v0, p0, Landroid/support/v4/util/SparseArrayCompat;->mGarbage:Z

    if-eqz v0, :cond_7

    invoke-direct {p0}, Landroid/support/v4/util/SparseArrayCompat;->gc()V

    :cond_7
    iget-object v0, p0, Landroid/support/v4/util/SparseArrayCompat;->mKeys:[I

    aget p1, v0, p1

    return p1
.end method

.method public put(ILjava/lang/Object;)V
    .registers 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ITE;)V"
        }
    .end annotation

    iget-object v0, p0, Landroid/support/v4/util/SparseArrayCompat;->mKeys:[I

    iget v1, p0, Landroid/support/v4/util/SparseArrayCompat;->mSize:I

    invoke-static {v0, v1, p1}, Landroid/support/v4/util/ContainerHelpers;->binarySearch([III)I

    move-result v0

    if-ltz v0, :cond_10

    iget-object p1, p0, Landroid/support/v4/util/SparseArrayCompat;->mValues:[Ljava/lang/Object;

    aput-object p2, p1, v0

    goto/16 :goto_90

    :cond_10
    xor-int/lit8 v0, v0, -0x1

    iget v1, p0, Landroid/support/v4/util/SparseArrayCompat;->mSize:I

    if-ge v0, v1, :cond_27

    iget-object v1, p0, Landroid/support/v4/util/SparseArrayCompat;->mValues:[Ljava/lang/Object;

    aget-object v1, v1, v0

    sget-object v2, Landroid/support/v4/util/SparseArrayCompat;->DELETED:Ljava/lang/Object;

    if-ne v1, v2, :cond_27

    iget-object v1, p0, Landroid/support/v4/util/SparseArrayCompat;->mKeys:[I

    aput p1, v1, v0

    iget-object p1, p0, Landroid/support/v4/util/SparseArrayCompat;->mValues:[Ljava/lang/Object;

    aput-object p2, p1, v0

    return-void

    :cond_27
    iget-boolean v1, p0, Landroid/support/v4/util/SparseArrayCompat;->mGarbage:Z

    if-eqz v1, :cond_3f

    iget v1, p0, Landroid/support/v4/util/SparseArrayCompat;->mSize:I

    iget-object v2, p0, Landroid/support/v4/util/SparseArrayCompat;->mKeys:[I

    array-length v2, v2

    if-lt v1, v2, :cond_3f

    invoke-direct {p0}, Landroid/support/v4/util/SparseArrayCompat;->gc()V

    iget-object v0, p0, Landroid/support/v4/util/SparseArrayCompat;->mKeys:[I

    iget v1, p0, Landroid/support/v4/util/SparseArrayCompat;->mSize:I

    invoke-static {v0, v1, p1}, Landroid/support/v4/util/ContainerHelpers;->binarySearch([III)I

    move-result v0

    xor-int/lit8 v0, v0, -0x1

    :cond_3f
    iget v1, p0, Landroid/support/v4/util/SparseArrayCompat;->mSize:I

    iget-object v2, p0, Landroid/support/v4/util/SparseArrayCompat;->mKeys:[I

    array-length v2, v2

    if-lt v1, v2, :cond_67

    iget v1, p0, Landroid/support/v4/util/SparseArrayCompat;->mSize:I

    add-int/lit8 v1, v1, 0x1

    invoke-static {v1}, Landroid/support/v4/util/ContainerHelpers;->idealIntArraySize(I)I

    move-result v1

    new-array v2, v1, [I

    new-array v1, v1, [Ljava/lang/Object;

    iget-object v3, p0, Landroid/support/v4/util/SparseArrayCompat;->mKeys:[I

    iget-object v4, p0, Landroid/support/v4/util/SparseArrayCompat;->mKeys:[I

    array-length v4, v4

    const/4 v5, 0x0

    invoke-static {v3, v5, v2, v5, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    iget-object v3, p0, Landroid/support/v4/util/SparseArrayCompat;->mValues:[Ljava/lang/Object;

    iget-object v4, p0, Landroid/support/v4/util/SparseArrayCompat;->mValues:[Ljava/lang/Object;

    array-length v4, v4

    invoke-static {v3, v5, v1, v5, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    iput-object v2, p0, Landroid/support/v4/util/SparseArrayCompat;->mKeys:[I

    iput-object v1, p0, Landroid/support/v4/util/SparseArrayCompat;->mValues:[Ljava/lang/Object;

    :cond_67
    iget v1, p0, Landroid/support/v4/util/SparseArrayCompat;->mSize:I

    sub-int/2addr v1, v0

    if-eqz v1, :cond_82

    iget-object v1, p0, Landroid/support/v4/util/SparseArrayCompat;->mKeys:[I

    iget-object v2, p0, Landroid/support/v4/util/SparseArrayCompat;->mKeys:[I

    add-int/lit8 v3, v0, 0x1

    iget v4, p0, Landroid/support/v4/util/SparseArrayCompat;->mSize:I

    sub-int/2addr v4, v0

    invoke-static {v1, v0, v2, v3, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    iget-object v1, p0, Landroid/support/v4/util/SparseArrayCompat;->mValues:[Ljava/lang/Object;

    iget-object v2, p0, Landroid/support/v4/util/SparseArrayCompat;->mValues:[Ljava/lang/Object;

    iget v4, p0, Landroid/support/v4/util/SparseArrayCompat;->mSize:I

    sub-int/2addr v4, v0

    invoke-static {v1, v0, v2, v3, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    :cond_82
    iget-object v1, p0, Landroid/support/v4/util/SparseArrayCompat;->mKeys:[I

    aput p1, v1, v0

    iget-object p1, p0, Landroid/support/v4/util/SparseArrayCompat;->mValues:[Ljava/lang/Object;

    aput-object p2, p1, v0

    iget p1, p0, Landroid/support/v4/util/SparseArrayCompat;->mSize:I

    add-int/lit8 p1, p1, 0x1

    iput p1, p0, Landroid/support/v4/util/SparseArrayCompat;->mSize:I

    :goto_90
    return-void
.end method

.method public putAll(Landroid/support/v4/util/SparseArrayCompat;)V
    .registers 6
    .param p1    # Landroid/support/v4/util/SparseArrayCompat;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/support/v4/util/SparseArrayCompat<",
            "+TE;>;)V"
        }
    .end annotation

    invoke-virtual {p1}, Landroid/support/v4/util/SparseArrayCompat;->size()I

    move-result v0

    const/4 v1, 0x0

    :goto_5
    if-ge v1, v0, :cond_15

    invoke-virtual {p1, v1}, Landroid/support/v4/util/SparseArrayCompat;->keyAt(I)I

    move-result v2

    invoke-virtual {p1, v1}, Landroid/support/v4/util/SparseArrayCompat;->valueAt(I)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {p0, v2, v3}, Landroid/support/v4/util/SparseArrayCompat;->put(ILjava/lang/Object;)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_5

    :cond_15
    return-void
.end method

.method public remove(I)V
    .registers 2

    invoke-virtual {p0, p1}, Landroid/support/v4/util/SparseArrayCompat;->delete(I)V

    return-void
.end method

.method public removeAt(I)V
    .registers 4

    iget-object v0, p0, Landroid/support/v4/util/SparseArrayCompat;->mValues:[Ljava/lang/Object;

    aget-object v0, v0, p1

    sget-object v1, Landroid/support/v4/util/SparseArrayCompat;->DELETED:Ljava/lang/Object;

    if-eq v0, v1, :cond_11

    iget-object v0, p0, Landroid/support/v4/util/SparseArrayCompat;->mValues:[Ljava/lang/Object;

    sget-object v1, Landroid/support/v4/util/SparseArrayCompat;->DELETED:Ljava/lang/Object;

    aput-object v1, v0, p1

    const/4 p1, 0x1

    iput-boolean p1, p0, Landroid/support/v4/util/SparseArrayCompat;->mGarbage:Z

    :cond_11
    return-void
.end method

.method public removeAtRange(II)V
    .registers 4

    iget v0, p0, Landroid/support/v4/util/SparseArrayCompat;->mSize:I

    add-int/2addr p2, p1

    invoke-static {v0, p2}, Ljava/lang/Math;->min(II)I

    move-result p2

    :goto_7
    if-ge p1, p2, :cond_f

    invoke-virtual {p0, p1}, Landroid/support/v4/util/SparseArrayCompat;->removeAt(I)V

    add-int/lit8 p1, p1, 0x1

    goto :goto_7

    :cond_f
    return-void
.end method

.method public setValueAt(ILjava/lang/Object;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ITE;)V"
        }
    .end annotation

    iget-boolean v0, p0, Landroid/support/v4/util/SparseArrayCompat;->mGarbage:Z

    if-eqz v0, :cond_7

    invoke-direct {p0}, Landroid/support/v4/util/SparseArrayCompat;->gc()V

    :cond_7
    iget-object v0, p0, Landroid/support/v4/util/SparseArrayCompat;->mValues:[Ljava/lang/Object;

    aput-object p2, v0, p1

    return-void
.end method

.method public size()I
    .registers 2

    iget-boolean v0, p0, Landroid/support/v4/util/SparseArrayCompat;->mGarbage:Z

    if-eqz v0, :cond_7

    invoke-direct {p0}, Landroid/support/v4/util/SparseArrayCompat;->gc()V

    :cond_7
    iget v0, p0, Landroid/support/v4/util/SparseArrayCompat;->mSize:I

    return v0
.end method

.method public toString()Ljava/lang/String;
    .registers 4

    invoke-virtual {p0}, Landroid/support/v4/util/SparseArrayCompat;->size()I

    move-result v0

    if-gtz v0, :cond_9

    const-string v0, "{}"

    return-object v0

    :cond_9
    new-instance v0, Ljava/lang/StringBuilder;

    iget v1, p0, Landroid/support/v4/util/SparseArrayCompat;->mSize:I

    mul-int/lit8 v1, v1, 0x1c

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    const/16 v1, 0x7b

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    const/4 v1, 0x0

    :goto_18
    iget v2, p0, Landroid/support/v4/util/SparseArrayCompat;->mSize:I

    if-ge v1, v2, :cond_41

    if-lez v1, :cond_23

    const-string v2, ", "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_23
    invoke-virtual {p0, v1}, Landroid/support/v4/util/SparseArrayCompat;->keyAt(I)I

    move-result v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const/16 v2, 0x3d

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {p0, v1}, Landroid/support/v4/util/SparseArrayCompat;->valueAt(I)Ljava/lang/Object;

    move-result-object v2

    if-eq v2, p0, :cond_39

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    goto :goto_3e

    :cond_39
    const-string v2, "(this Map)"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :goto_3e
    add-int/lit8 v1, v1, 0x1

    goto :goto_18

    :cond_41
    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public valueAt(I)Ljava/lang/Object;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TE;"
        }
    .end annotation

    iget-boolean v0, p0, Landroid/support/v4/util/SparseArrayCompat;->mGarbage:Z

    if-eqz v0, :cond_7

    invoke-direct {p0}, Landroid/support/v4/util/SparseArrayCompat;->gc()V

    :cond_7
    iget-object v0, p0, Landroid/support/v4/util/SparseArrayCompat;->mValues:[Ljava/lang/Object;

    aget-object p1, v0, p1

    return-object p1
.end method
