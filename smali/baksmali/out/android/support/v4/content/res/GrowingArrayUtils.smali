.class final Landroid/support/v4/content/res/GrowingArrayUtils;
.super Ljava/lang/Object;
.source "GrowingArrayUtils.java"


# static fields
.field static final synthetic $assertionsDisabled:Z


# direct methods
.method static constructor <clinit>()V
    .registers 0

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static append([III)[I
    .registers 5

    add-int/lit8 v0, p1, 0x1

    array-length v1, p0

    if-le v0, v1, :cond_10

    invoke-static {p1}, Landroid/support/v4/content/res/GrowingArrayUtils;->growSize(I)I

    move-result v0

    new-array v0, v0, [I

    const/4 v1, 0x0

    invoke-static {p0, v1, v0, v1, p1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    move-object p0, v0

    :cond_10
    aput p2, p0, p1

    return-object p0
.end method

.method public static append([JIJ)[J
    .registers 6

    add-int/lit8 v0, p1, 0x1

    array-length v1, p0

    if-le v0, v1, :cond_10

    invoke-static {p1}, Landroid/support/v4/content/res/GrowingArrayUtils;->growSize(I)I

    move-result v0

    new-array v0, v0, [J

    const/4 v1, 0x0

    invoke-static {p0, v1, v0, v1, p1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    move-object p0, v0

    :cond_10
    aput-wide p2, p0, p1

    return-object p0
.end method

.method public static append([Ljava/lang/Object;ILjava/lang/Object;)[Ljava/lang/Object;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">([TT;ITT;)[TT;"
        }
    .end annotation

    add-int/lit8 v0, p1, 0x1

    array-length v1, p0

    if-le v0, v1, :cond_1c

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    move-result-object v0

    invoke-static {p1}, Landroid/support/v4/content/res/GrowingArrayUtils;->growSize(I)I

    move-result v1

    invoke-static {v0, v1}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    invoke-static {p0, v1, v0, v1, p1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    move-object p0, v0

    :cond_1c
    aput-object p2, p0, p1

    return-object p0
.end method

.method public static append([ZIZ)[Z
    .registers 5

    add-int/lit8 v0, p1, 0x1

    array-length v1, p0

    if-le v0, v1, :cond_10

    invoke-static {p1}, Landroid/support/v4/content/res/GrowingArrayUtils;->growSize(I)I

    move-result v0

    new-array v0, v0, [Z

    const/4 v1, 0x0

    invoke-static {p0, v1, v0, v1, p1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    move-object p0, v0

    :cond_10
    aput-boolean p2, p0, p1

    return-object p0
.end method

.method public static growSize(I)I
    .registers 2

    const/4 v0, 0x4

    if-gt p0, v0, :cond_6

    const/16 p0, 0x8

    goto :goto_8

    :cond_6
    mul-int/lit8 p0, p0, 0x2

    :goto_8
    return p0
.end method

.method public static insert([IIII)[I
    .registers 6

    add-int/lit8 v0, p1, 0x1

    array-length v1, p0

    if-gt v0, v1, :cond_e

    add-int/lit8 v0, p2, 0x1

    sub-int/2addr p1, p2

    invoke-static {p0, p2, p0, v0, p1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    aput p3, p0, p2

    return-object p0

    :cond_e
    invoke-static {p1}, Landroid/support/v4/content/res/GrowingArrayUtils;->growSize(I)I

    move-result p1

    new-array p1, p1, [I

    const/4 v0, 0x0

    invoke-static {p0, v0, p1, v0, p2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    aput p3, p1, p2

    add-int/lit8 p3, p2, 0x1

    array-length v0, p0

    sub-int/2addr v0, p2

    invoke-static {p0, p2, p1, p3, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-object p1
.end method

.method public static insert([JIIJ)[J
    .registers 7

    add-int/lit8 v0, p1, 0x1

    array-length v1, p0

    if-gt v0, v1, :cond_e

    add-int/lit8 v0, p2, 0x1

    sub-int/2addr p1, p2

    invoke-static {p0, p2, p0, v0, p1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    aput-wide p3, p0, p2

    return-object p0

    :cond_e
    invoke-static {p1}, Landroid/support/v4/content/res/GrowingArrayUtils;->growSize(I)I

    move-result p1

    new-array p1, p1, [J

    const/4 v0, 0x0

    invoke-static {p0, v0, p1, v0, p2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    aput-wide p3, p1, p2

    add-int/lit8 p3, p2, 0x1

    array-length p4, p0

    sub-int/2addr p4, p2

    invoke-static {p0, p2, p1, p3, p4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-object p1
.end method

.method public static insert([Ljava/lang/Object;IILjava/lang/Object;)[Ljava/lang/Object;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">([TT;IITT;)[TT;"
        }
    .end annotation

    add-int/lit8 v0, p1, 0x1

    array-length v1, p0

    if-gt v0, v1, :cond_e

    add-int/lit8 v0, p2, 0x1

    sub-int/2addr p1, p2

    invoke-static {p0, p2, p0, v0, p1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    aput-object p3, p0, p2

    return-object p0

    :cond_e
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    move-result-object v0

    invoke-static {p1}, Landroid/support/v4/content/res/GrowingArrayUtils;->growSize(I)I

    move-result p1

    invoke-static {v0, p1}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [Ljava/lang/Object;

    const/4 v0, 0x0

    invoke-static {p0, v0, p1, v0, p2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    aput-object p3, p1, p2

    add-int/lit8 p3, p2, 0x1

    array-length v0, p0

    sub-int/2addr v0, p2

    invoke-static {p0, p2, p1, p3, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-object p1
.end method

.method public static insert([ZIIZ)[Z
    .registers 6

    add-int/lit8 v0, p1, 0x1

    array-length v1, p0

    if-gt v0, v1, :cond_e

    add-int/lit8 v0, p2, 0x1

    sub-int/2addr p1, p2

    invoke-static {p0, p2, p0, v0, p1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    aput-boolean p3, p0, p2

    return-object p0

    :cond_e
    invoke-static {p1}, Landroid/support/v4/content/res/GrowingArrayUtils;->growSize(I)I

    move-result p1

    new-array p1, p1, [Z

    const/4 v0, 0x0

    invoke-static {p0, v0, p1, v0, p2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    aput-boolean p3, p1, p2

    add-int/lit8 p3, p2, 0x1

    array-length v0, p0

    sub-int/2addr v0, p2

    invoke-static {p0, p2, p1, p3, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-object p1
.end method
