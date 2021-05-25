.class Landroid/support/v7/graphics/drawable/StateListDrawable$StateListState;
.super Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;
.source "StateListDrawable.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v7/graphics/drawable/StateListDrawable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "StateListState"
.end annotation


# instance fields
.field mStateSets:[[I


# direct methods
.method constructor <init>(Landroid/support/v7/graphics/drawable/StateListDrawable$StateListState;Landroid/support/v7/graphics/drawable/StateListDrawable;Landroid/content/res/Resources;)V
    .registers 4

    invoke-direct {p0, p1, p2, p3}, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;-><init>(Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;Landroid/support/v7/graphics/drawable/DrawableContainer;Landroid/content/res/Resources;)V

    if-eqz p1, :cond_a

    iget-object p1, p1, Landroid/support/v7/graphics/drawable/StateListDrawable$StateListState;->mStateSets:[[I

    iput-object p1, p0, Landroid/support/v7/graphics/drawable/StateListDrawable$StateListState;->mStateSets:[[I

    goto :goto_12

    :cond_a
    invoke-virtual {p0}, Landroid/support/v7/graphics/drawable/StateListDrawable$StateListState;->getCapacity()I

    move-result p1

    new-array p1, p1, [[I

    iput-object p1, p0, Landroid/support/v7/graphics/drawable/StateListDrawable$StateListState;->mStateSets:[[I

    :goto_12
    return-void
.end method


# virtual methods
.method addStateSet([ILandroid/graphics/drawable/Drawable;)I
    .registers 4

    invoke-virtual {p0, p2}, Landroid/support/v7/graphics/drawable/StateListDrawable$StateListState;->addChild(Landroid/graphics/drawable/Drawable;)I

    move-result p2

    iget-object v0, p0, Landroid/support/v7/graphics/drawable/StateListDrawable$StateListState;->mStateSets:[[I

    aput-object p1, v0, p2

    return p2
.end method

.method public growArray(II)V
    .registers 5

    invoke-super {p0, p1, p2}, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->growArray(II)V

    new-array p2, p2, [[I

    iget-object v0, p0, Landroid/support/v7/graphics/drawable/StateListDrawable$StateListState;->mStateSets:[[I

    const/4 v1, 0x0

    invoke-static {v0, v1, p2, v1, p1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    iput-object p2, p0, Landroid/support/v7/graphics/drawable/StateListDrawable$StateListState;->mStateSets:[[I

    return-void
.end method

.method indexOfStateSet([I)I
    .registers 6

    iget-object v0, p0, Landroid/support/v7/graphics/drawable/StateListDrawable$StateListState;->mStateSets:[[I

    invoke-virtual {p0}, Landroid/support/v7/graphics/drawable/StateListDrawable$StateListState;->getChildCount()I

    move-result v1

    const/4 v2, 0x0

    :goto_7
    if-ge v2, v1, :cond_15

    aget-object v3, v0, v2

    invoke-static {v3, p1}, Landroid/util/StateSet;->stateSetMatches([I[I)Z

    move-result v3

    if-eqz v3, :cond_12

    return v2

    :cond_12
    add-int/lit8 v2, v2, 0x1

    goto :goto_7

    :cond_15
    const/4 p1, -0x1

    return p1
.end method

.method mutate()V
    .registers 4

    iget-object v0, p0, Landroid/support/v7/graphics/drawable/StateListDrawable$StateListState;->mStateSets:[[I

    array-length v0, v0

    new-array v0, v0, [[I

    iget-object v1, p0, Landroid/support/v7/graphics/drawable/StateListDrawable$StateListState;->mStateSets:[[I

    array-length v1, v1

    add-int/lit8 v1, v1, -0x1

    :goto_a
    if-ltz v1, :cond_23

    iget-object v2, p0, Landroid/support/v7/graphics/drawable/StateListDrawable$StateListState;->mStateSets:[[I

    aget-object v2, v2, v1

    if-eqz v2, :cond_1d

    iget-object v2, p0, Landroid/support/v7/graphics/drawable/StateListDrawable$StateListState;->mStateSets:[[I

    aget-object v2, v2, v1

    invoke-virtual {v2}, [I->clone()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [I

    goto :goto_1e

    :cond_1d
    const/4 v2, 0x0

    :goto_1e
    aput-object v2, v0, v1

    add-int/lit8 v1, v1, -0x1

    goto :goto_a

    :cond_23
    iput-object v0, p0, Landroid/support/v7/graphics/drawable/StateListDrawable$StateListState;->mStateSets:[[I

    return-void
.end method

.method public newDrawable()Landroid/graphics/drawable/Drawable;
    .registers 3
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    new-instance v0, Landroid/support/v7/graphics/drawable/StateListDrawable;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Landroid/support/v7/graphics/drawable/StateListDrawable;-><init>(Landroid/support/v7/graphics/drawable/StateListDrawable$StateListState;Landroid/content/res/Resources;)V

    return-object v0
.end method

.method public newDrawable(Landroid/content/res/Resources;)Landroid/graphics/drawable/Drawable;
    .registers 3
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    new-instance v0, Landroid/support/v7/graphics/drawable/StateListDrawable;

    invoke-direct {v0, p0, p1}, Landroid/support/v7/graphics/drawable/StateListDrawable;-><init>(Landroid/support/v7/graphics/drawable/StateListDrawable$StateListState;Landroid/content/res/Resources;)V

    return-object v0
.end method
